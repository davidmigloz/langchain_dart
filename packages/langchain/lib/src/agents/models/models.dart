import '../../../langchain.dart';

/// {@template agent_plan_input}
/// Input to the agent's plan method.
/// {@endtemplate}
class AgentPlanInput {
  /// {@macro agent_plan_input}
  const AgentPlanInput(
    this.inputs,
    this.intermediateSteps,
  );

  /// The input values to the agent.
  final ChainValues inputs;

  /// The actions the agent has taken to date, along with their observations.
  final List<AgentStep> intermediateSteps;
}

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

  /// The name of the tool to use.
  final String tool;

  /// The input to the tool.
  final Map<String, dynamic> toolInput;

  /// The log of the action.
  final String log;

  /// The log of the messages.
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

  /// The return values of the agent.
  final Map<String, dynamic> returnValues;

  /// The log of the action.
  final String log;
}

/// {@template agent_step}
/// A action taken by the agent along with the observation of the action.
/// {@endtemplate}
class AgentStep {
  /// {@macro agent_step}
  const AgentStep({
    required this.action,
    required this.observation,
  });

  /// The action taken by the agent.
  final AgentAction action;

  /// The observation of the action.
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
