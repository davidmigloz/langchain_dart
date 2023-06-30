import '../model_io/prompts/models/models.dart';
import '../utils/exception.dart';
import 'models/models.dart';

/// {@template base_action_agent}
/// Base class for action agents.
/// {@endtemplate}
abstract class BaseActionAgent {
  /// {@macro base_action_agent}
  const BaseActionAgent();

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
  Set<String>? getAllowedTools() => null;

  /// Given input, decided what to do.
  ///
  /// - [intermediateSteps] steps the LLM has taken to date, along with
  ///   observations.
  /// - [inputs] user input to the agent.
  ///
  /// Returns either [AgentAction] specifying what tool to use or
  /// [AgentFinish] specifying the agent's final return value.
  /// The list should always have length 1.
  Future<List<BaseAgentAction>> plan(
    final List<AgentStep> intermediateSteps,
    final InputValues inputs,
  );

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
  const BaseSingleActionAgent();
}

/// {@template base_multi_action_agent}
/// Base class for multi action agents.
/// {@endtemplate}
abstract class BaseMultiActionAgent extends BaseActionAgent {
  /// {@macro base_multi_action_agent}
  const BaseMultiActionAgent();
}
