import '../core/core.dart';
import '../utils/exception.dart';
import 'agents.dart';

/// {@template agent}
/// An agent is a component that takes an input and a set of tools and decides
/// what to do to get to the desired output.
/// {@endtemplate}
abstract class Agent {
  /// {@macro agent}
  const Agent();

  /// Creates an agent from a [Runnable].
  static BaseMultiActionAgent fromRunnable(
    final Runnable<AgentPlanInput, BaseLangChainOptions, List<BaseAgentAction>>
        runnable, {
    required final List<BaseTool> tools,
  }) {
    return RunnableAgent(runnable, tools: tools);
  }
}

/// {@template base_action_agent}
/// Base class for action agents.
/// {@endtemplate}
abstract class BaseActionAgent extends Agent {
  /// {@macro base_action_agent}
  const BaseActionAgent({required this.tools});

  /// The key for the scratchpad (intermediate steps) of the agent.
  static const agentScratchpadInputKey = 'agent_scratchpad';

  /// Return key for the agent's output.
  static const agentReturnKey = 'output';

  /// Returns the input keys.
  Set<String> get inputKeys;

  /// Returns values of the agent.
  Set<String> get returnValues {
    return const {agentReturnKey};
  }

  /// Returns the type of agent.
  String get agentType;

  /// The tools this agent can use.
  final List<BaseTool> tools;

  /// Given the input and previous steps, returns the next action to take.
  ///
  /// Returns either [AgentAction] specifying what tool to use or
  /// [AgentFinish] specifying the agent's final return value.
  /// The list should always have length 1.
  Future<List<BaseAgentAction>> plan(final AgentPlanInput input);

  /// Return response when agent has been stopped due to max iterations.
  AgentFinish returnStoppedResponse(
    final AgentEarlyStoppingMethod earlyStoppingMethod,
    final List<AgentStep> intermediateSteps,
  ) {
    return switch (earlyStoppingMethod) {
      AgentEarlyStoppingMethod.force => const AgentFinish(
          returnValues: {
            agentReturnKey:
                'Agent stopped due to iteration limit or time limit.',
          },
        ),
      _ => throw LangChainException(
          message:
              'Got unsupported early stopping method: $earlyStoppingMethod.',
        ),
    };
  }
}

/// {@template base_single_action_agent}
/// Base class for single action agents.
/// {@endtemplate}
abstract class BaseSingleActionAgent extends BaseActionAgent {
  /// {@macro base_single_action_agent}
  const BaseSingleActionAgent({required super.tools});
}

/// {@template base_multi_action_agent}
/// Base class for multi action agents.
/// {@endtemplate}
abstract class BaseMultiActionAgent extends BaseActionAgent {
  /// {@macro base_multi_action_agent}
  const BaseMultiActionAgent({required super.tools});
}

/// {@template runnable_agent}
/// An agent implemented from a [Runnable].
/// {@endtemplate}
class RunnableAgent extends BaseMultiActionAgent {
  /// {@macro runnable_agent}
  const RunnableAgent(this.runnable, {required super.tools});

  /// The runnable that implements the agent.
  final Runnable<AgentPlanInput, BaseLangChainOptions, List<BaseAgentAction>>
      runnable;

  @override
  String get agentType => 'runnable-agent';

  @override
  Set<String> get inputKeys => const {};

  @override
  Future<List<BaseAgentAction>> plan(final AgentPlanInput input) {
    return runnable.invoke(input);
  }
}
