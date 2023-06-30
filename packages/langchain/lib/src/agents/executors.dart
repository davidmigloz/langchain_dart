import 'package:meta/meta.dart';

import '../chains/chains.dart';
import '../model_io/output_parsers/models/models.dart';
import 'agent.dart';
import 'models/models.dart';
import 'tools/base.dart';
import 'tools/exception.dart';
import 'tools/invalid.dart';

/// {@template agent_executor}
/// A chain responsible for executing the actions of an agent using tools.
/// It receives user input and passes it to the agent, which then decides which
/// tool to use and what action to take.
///
/// The [AgentExecutor] calls the specified tool with the generated input,
/// retrieves the output, and passes it back to the agent to determine the next
/// action. This process continues until the agent determines it can directly
/// respond to the user or completes its task.
/// {@endtemplate}
class AgentExecutor extends BaseChain {
  AgentExecutor({
    required this.agent,
    required final List<BaseTool> tools,
    this.returnIntermediateSteps = false,
    this.maxIterations = 15,
    this.maxExecutionTime,
    this.earlyStoppingMethod = AgentEarlyStoppingMethod.force,
    this.handleParsingErrors,
  }) : _internalTools = [...tools, ExceptionTool()] {
    assert(
      _validateTools(),
      'Allowed tools different than provided tools',
    );
    assert(
      _validateMultiActionAgentTools(),
      'Tools that have `returnDirect=true` are not allowed in multi-action agents',
    );
  }

  /// The agent to run for creating a plan and determining actions to take at
  /// each step of the execution loop.
  final BaseActionAgent agent;

  /// The valid tools the agent can call plus some internal tools used by the
  /// executor.
  final List<BaseTool> _internalTools;

  /// Whether to return the agent's trajectory of intermediate steps at the
  /// end in addition to the final output.
  final bool returnIntermediateSteps;

  /// The maximum number of steps to take before ending the execution loop.
  /// Setting to null could lead to an infinite loop.
  final int? maxIterations;

  /// The maximum amount of wall clock time to spend in the execution loop.
  final Duration? maxExecutionTime;

  /// The method to use for early stopping if the agent never returns
  /// [AgentFinish].
  final AgentEarlyStoppingMethod earlyStoppingMethod;

  /// Handles errors raised by the agent's output parser.
  /// The response from this handlers is passed to the agent as the observation
  /// resulting from the step.
  final String Function(OutputParserException)? handleParsingErrors;

  /// Output key for the agent's intermediate steps output.
  static const intermediateStepsOutputKey = 'intermediate_steps';

  @override
  Set<String> get inputKeys => agent.inputKeys;

  @override
  Set<String> get outputKeys => {
        ...agent.returnValues,
        if (returnIntermediateSteps) intermediateStepsOutputKey,
      };

  /// Validate that tools are compatible with agent.
  bool _validateTools() {
    final agent = this.agent;
    final tools = _internalTools;
    final allowedTools = agent.getAllowedTools();
    if (allowedTools?.isNotEmpty ?? false) {
      final providedTools = tools.map((final t) => t.name).toSet();
      if (allowedTools!.difference(providedTools).isNotEmpty) {
        return false;
      }
    }
    return true;
  }

  /// Validate that tools are compatible with multi action agent.
  bool _validateMultiActionAgentTools() {
    final agent = this.agent;
    final tools = _internalTools;
    if (agent is BaseMultiActionAgent) {
      for (final BaseTool tool in tools) {
        if (tool.returnDirect) {
          return false;
        }
      }
    }
    return true;
  }

  @override
  Future<ChainValues> callInternal(final ChainValues inputs) async {
    final List<AgentStep> intermediateSteps = [];

    // Construct a mapping of tool name to tool for easy lookup
    final nameToToolMap = {for (var tool in _internalTools) tool.name: tool};

    // Let's start tracking the number of iterations and time elapsed
    int iterations = 0;
    final stopwatch = Stopwatch()..start();

    ChainValues onAgentFinished(final AgentFinish result) {
      return {
        ...result.returnValues,
        if (returnIntermediateSteps)
          intermediateStepsOutputKey: intermediateSteps,
      };
    }

    // We now enter the agent loop (until it returns something).
    while (_shouldContinue(iterations, stopwatch.elapsed)) {
      final (result, nextSteps) = await takeNextStep(
        nameToToolMap,
        inputs,
        intermediateSteps,
      );

      if (result != null) {
        return onAgentFinished(result);
      }

      if (nextSteps != null) {
        intermediateSteps.addAll(nextSteps);

        if (nextSteps.length == 1) {
          final nextStep = nextSteps.first;
          final tool = nameToToolMap[nextStep.action.tool];

          if (tool != null && tool.returnDirect) {
            return onAgentFinished(
              AgentFinish(
                returnValues: {
                  agent.returnValues.first: nextStep.observation,
                },
              ),
            );
          }
        }
      }

      iterations += 1;
    }

    final stopped = agent.returnStoppedResponse(
      earlyStoppingMethod,
      intermediateSteps,
    );
    return onAgentFinished(stopped);
  }

  /// Returns whether the execution loop should continue.
  bool _shouldContinue(final int iterations, final Duration timeElapsed) {
    if (maxIterations != null && iterations >= maxIterations!) {
      return false;
    }
    if (maxExecutionTime != null && timeElapsed >= maxExecutionTime!) {
      return false;
    }
    return true;
  }

  /// Take a single step in the thought-action-observation loop.
  /// Override this to take control of how the agent makes and acts on choices.
  @visibleForOverriding
  Future<(AgentFinish? result, List<AgentStep>? nextSteps)> takeNextStep(
    final Map<String, BaseTool> nameToToolMap,
    final ChainValues inputs,
    final List<AgentStep> intermediateSteps,
  ) async {
    List<BaseAgentAction> actions;

    try {
      // Call the LLM to see what to do
      actions = await agent.plan(intermediateSteps, inputs);
    } on OutputParserException catch (e) {
      if (handleParsingErrors == null) rethrow;
      actions = [
        AgentAction(
          tool: ExceptionTool.toolName,
          toolInput: {Tool.inputVar: handleParsingErrors!(e)},
          log: e.toString(),
        )
      ];
    }

    final List<AgentStep> result = [];
    for (final action in actions) {
      // If the tool chosen is the finishing tool, then we end and return
      if (action is AgentFinish) {
        return (action, null);
      }
      // Otherwise, we run the tool
      final agentAction = action as AgentAction;
      final tool = nameToToolMap[agentAction.tool];
      final step = AgentStep(
        action: action,
        observation: await (tool != null
            ? tool.run(agentAction.toolInput)
            : InvalidTool().run({Tool.inputVar: agentAction.tool})),
      );
      result.add(step);
    }
    return (null, result);
  }

  @override
  String get chainType => 'agent_executor';
}
