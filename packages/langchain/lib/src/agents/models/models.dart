import '../../../langchain.dart';

/// {@template base_agent_action}
/// Base class for agent actions.
/// {@endtemplate}
sealed class BaseAgentAction {
  /// {@macro base_agent_action}
  const BaseAgentAction();
}

/// {@template agent_action}
/// Agent's action to take.
/// {@endtemplate}
class AgentAction extends BaseAgentAction {
  /// {@macro agent_action}
  const AgentAction({
    required this.tool,
    required this.toolInput,
    this.log = '',
    this.messageLog = const [],
  });

  final String tool;
  final Map<String, dynamic> toolInput;
  final String log;
  final List<ChatMessage> messageLog;
}

/// {@template agent_finish}
/// Agent's return value.
/// {@endtemplate}
class AgentFinish extends BaseAgentAction {
  /// {@macro agent_finish}
  const AgentFinish({
    required this.returnValues,
    this.log = '',
  });

  final Map<String, dynamic> returnValues;
  final String log;
}

/// {@template agent_step}
/// A action taken by the agent along with the observation of the action.
/// {@endtemplate}
class AgentStep {
  const AgentStep({
    required this.action,
    required this.observation,
  });

  final AgentAction action;
  final String observation;
}

/// {@template agent_early_stopping_method}
/// Method to use for early stopping if the agent never returns [AgentFinish].
/// {@endtemplate}
enum AgentEarlyStoppingMethod {
  /// The executor returns a string saying that it stopped because it met a
  /// time or iteration limit.
  force,

  /// Calls the agent's LLM Chain one final time to generate final answer based
  /// on the previous steps.
  generate,
}
