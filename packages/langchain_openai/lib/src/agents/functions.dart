import 'package:langchain/langchain.dart';

import '../../langchain_openai.dart';
import '../chat_models/models/models.dart';

const _systemChatMessagePromptTemplate = SystemChatMessagePromptTemplate(
  prompt: PromptTemplate(
    inputVariables: {},
    template: 'You are a helpful AI assistant',
  ),
);

/// {@template openai_functions_agent}
/// An Agent driven by OpenAIs Functions powered API.
/// {@endtemplate}
class OpenAIFunctionsAgent extends BaseSingleActionAgent {
  /// {@macro openai_functions_agent}
  OpenAIFunctionsAgent({
    required this.llm,
    required this.tools,
    required this.prompt,
  }) : assert(
          prompt.inputVariables.contains(_agentScratchpadInputKey),
          '`$_agentScratchpadInputKey` should be one of the variables in the prompt, '
          'got ${prompt.inputVariables}',
        );

  /// A model that supports using functions.
  final BaseChatOpenAI llm;

  /// The tools this agent has access to.
  final List<BaseTool> tools;

  /// The prompt for this agent, should support `agent_scratchpad` as one of
  /// the variables.
  final BasePromptTemplate prompt;

  /// The key for the input to the agent.
  static const agentInputKey = 'input';

  /// The key for the scratchpad (intermediate steps) of the agent.
  static const _agentScratchpadInputKey = 'agent_scratchpad';

  @override
  Set<String> get inputKeys => {agentInputKey};

  List<ChatFunction> get functions {
    return tools.map((final t) {
      return ChatFunction(
        name: t.name,
        description: t.description,
        parameters: t.inputJsonSchema,
      );
    }).toList(growable: false);
  }

  /// Construct an [OpenAIFunctionsAgent] from an [llm] and [tools].
  ///
  /// - [llm] - The model to use for the agent.
  /// - [tools] - The tools the agent has access to.
  /// - [systemChatMessage] message to use as the system message that will be
  ///   the first in the prompt. Default "You are a helpful AI assistant".
  /// - [extraPromptMessages] prompt messages that will be placed between the
  ///   system message and the new human input.
  factory OpenAIFunctionsAgent.fromLLMAndTools({
    required final BaseChatOpenAI llm,
    required final List<BaseTool> tools,
    final SystemChatMessagePromptTemplate systemChatMessage =
        _systemChatMessagePromptTemplate,
    final List<BaseChatMessagePromptTemplate>? extraPromptMessages,
  }) {
    return OpenAIFunctionsAgent(
      llm: llm,
      tools: tools,
      prompt: createPrompt(
        systemChatMessage: systemChatMessage,
        extraPromptMessages: extraPromptMessages,
      ),
    );
  }

  @override
  Set<String>? getAllowedTools() {
    return tools.map((final t) => t.name).toSet();
  }

  @override
  Future<List<BaseAgentAction>> plan(
    final List<AgentStep> intermediateSteps,
    final InputValues inputs,
  ) async {
    final agentScratchpad = _constructScratchPad(intermediateSteps);
    final fullInputs = {
      ...inputs,
      _agentScratchpadInputKey: agentScratchpad,
    };

    final prompt = this.prompt.formatPrompt(fullInputs);
    final messages = prompt.toChatMessages();
    final predictedMessages = await llm.predictMessages(
      messages,
      options: ChatOpenAIOptions(functions: functions),
    );
    return [_parseOutput(predictedMessages)];
  }

  List<ChatMessage> _constructScratchPad(
    final List<AgentStep> intermediateSteps,
  ) {
    return [
      ...intermediateSteps.map((final s) {
        return s.action.messageLog +
            [
              ChatMessage.function(
                name: s.action.tool,
                content: s.observation,
              )
            ];
      }).expand((final m) => m),
    ];
  }

  BaseAgentAction _parseOutput(final ChatMessage message) {
    if (message is! AIChatMessage) {
      throw LangChainException(message: 'Expected an AI message got $message');
    }

    final functionCall = message.functionCall;

    if (functionCall != null) {
      return AgentAction(
        tool: functionCall.name,
        toolInput: functionCall.arguments,
        log: 'Invoking: `${functionCall.name}` '
            'with `${functionCall.arguments}`\n'
            'Responded: ${message.content}\n',
        messageLog: [message],
      );
    } else {
      return AgentFinish(
        returnValues: {'output': message.content},
        log: message.content,
      );
    }
  }

  @override
  String get agentType => 'openai-functions';

  /// Creates prompt for this agent.
  ///
  /// - [systemChatMessage] message to use as the system message that will be
  ///   the first in the prompt.
  /// - [extraPromptMessages] prompt messages that will be placed between the
  ///   system message and the new human input.
  static BasePromptTemplate createPrompt({
    final SystemChatMessagePromptTemplate systemChatMessage =
        _systemChatMessagePromptTemplate,
    final List<BaseChatMessagePromptTemplate>? extraPromptMessages,
  }) {
    return ChatPromptTemplate.fromPromptMessages([
      _systemChatMessagePromptTemplate,
      ...?extraPromptMessages,
      HumanChatMessagePromptTemplate.fromTemplate('{$agentInputKey}'),
      const MessagesPlaceholder(variableName: _agentScratchpadInputKey),
    ]);
  }
}
