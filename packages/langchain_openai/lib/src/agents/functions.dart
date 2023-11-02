import 'package:langchain/langchain.dart';

import '../chat_models/chat_models.dart';

const _systemChatMessagePromptTemplate = SystemChatMessagePromptTemplate(
  prompt: PromptTemplate(
    inputVariables: {},
    template: 'You are a helpful AI assistant',
  ),
);

/// {@template openai_functions_agent}
/// An Agent driven by OpenAIs Functions powered API.
///
/// Example:
/// ```dart
/// final llm = ChatOpenAI(
///   apiKey: openaiApiKey,
///   model: 'gpt-3.5-turbo-0613',
///   temperature: 0,
/// );
/// final tools = [CalculatorTool()];
/// final agent = OpenAIFunctionsAgent.fromLLMAndTools(llm: llm, tools: tools);
/// final executor = AgentExecutor(agent: agent);
/// final res = await executor.run('What is 40 raised to the 0.43 power? ');
/// ```
///
/// You can easily add memory to the agent using the memory parameter from the
/// [OpenAIFunctionsAgent.fromLLMAndTools] constructor. Make sure you enable
/// [BaseChatMemory.returnMessages] on your memory, as the agent works with
/// [ChatMessage]s. The default prompt template already takes care of adding
/// the history to the prompt. For example:
/// ```dart
/// final memory = ConversationBufferMemory(returnMessages: true);
/// final agent = OpenAIFunctionsAgent.fromLLMAndTools(
///   llm: llm,
///   tools: tools,
///   memory: memory,
/// );
/// ```
///
/// If you need to use your own [llmChain] make sure your prompt template
/// includes:
/// - `MessagePlaceholder(variableName: agentInputKey)`: the input to the agent.
/// - If you are using memory:
///   * `MessagesPlaceholder(variableName: '{memoryKey}')`: the history of chat
///      messages.
/// - If you are not using memory:
///   * `MessagesPlaceholder(variableName: BaseActionAgent.agentScratchpadInputKey)`:
///     the intermediary work of the agent (if you are using memory, the agent
///     uses the memory to store the intermediary work).
/// Example:
/// ```dart
/// ChatPromptTemplate.fromPromptMessages([
///   SystemChatMessagePromptTemplate.fromTemplate(
///     'You are a helpful AI assistant',
///   ),
///   MessagesPlaceholder(variableName: '{history}'),
///   MessagePlaceholder(variableName: '{input}'),
/// ]);
/// ```
///
/// You can use [OpenAIFunctionsAgent.createPrompt] to build the prompt
/// template if you only need to customize the system message or add some
/// extra messages.
/// {@endtemplate}
class OpenAIFunctionsAgent extends BaseSingleActionAgent {
  /// {@macro openai_functions_agent}
  OpenAIFunctionsAgent({
    required this.llmChain,
    required super.tools,
  })  : assert(
          llmChain.memory != null ||
              llmChain.prompt.inputVariables
                  .contains(BaseActionAgent.agentScratchpadInputKey),
          '`${BaseActionAgent.agentScratchpadInputKey}` should be one of the '
          'variables in the prompt, got ${llmChain.prompt.inputVariables}',
        ),
        assert(
          llmChain.memory == null || llmChain.memory!.returnMessages,
          'The memory must have `returnMessages` set to true',
        );

  /// Chain to use to call the LLM.
  ///
  /// If the chain does not have a memory, the prompt MUST include a variable
  /// called [BaseActionAgent.agentScratchpadInputKey] where the agent can put
  /// its intermediary work.
  ///
  /// If the chain has a memory, the agent will use the memory to store the
  /// intermediary work.
  ///
  /// The memory must have [BaseChatMemory.returnMessages] set to true for
  /// the agent to work properly.
  final LLMChain<ChatOpenAI, ChatOpenAIOptions, void, BaseChatMemory> llmChain;

  /// The key for the input to the agent.
  static const agentInputKey = 'input';

  @override
  Set<String> get inputKeys => {agentInputKey};

  List<ChatFunction> get functions => llmChain.llmOptions?.functions ?? [];

  /// Construct an [OpenAIFunctionsAgent] from an [llm] and [tools].
  ///
  /// - [llm] - The model to use for the agent.
  /// - [tools] - The tools the agent has access to.
  /// - [memory] - The memory to use for the agent.
  /// - [systemChatMessage] message to use as the system message that will be
  ///   the first in the prompt. Default: "You are a helpful AI assistant".
  /// - [extraPromptMessages] prompt messages that will be placed between the
  ///   system message and the input from the agent.
  factory OpenAIFunctionsAgent.fromLLMAndTools({
    required final ChatOpenAI llm,
    required final List<BaseTool> tools,
    final BaseChatMemory? memory,
    final SystemChatMessagePromptTemplate systemChatMessage =
        _systemChatMessagePromptTemplate,
    final List<BaseChatMessagePromptTemplate>? extraPromptMessages,
  }) {
    return OpenAIFunctionsAgent(
      llmChain: LLMChain(
        llm: llm,
        llmOptions: ChatOpenAIOptions(
          functions: tools
              .map((final t) => t.toChatFunction())
              .toList(growable: false),
        ),
        prompt: createPrompt(
          systemChatMessage: systemChatMessage,
          extraPromptMessages: extraPromptMessages,
          memory: memory,
        ),
        memory: memory,
      ),
      tools: tools,
    );
  }

  @override
  Future<List<BaseAgentAction>> plan(
    final List<AgentStep> intermediateSteps,
    final InputValues inputs,
  ) async {
    final llmChainInputs = _constructLlmChainInputs(intermediateSteps, inputs);
    final output = await llmChain.call(llmChainInputs);
    final predictedMessage = output[LLMChain.defaultOutputKey] as ChatMessage;
    return [_parseOutput(predictedMessage)];
  }

  Map<String, dynamic> _constructLlmChainInputs(
    final List<AgentStep> intermediateSteps,
    final InputValues inputs,
  ) {
    final ChatMessage agentInput;

    // If there is a memory, we pass the last agent step as a function message.
    // Otherwise, we pass the input as a human message.
    if (llmChain.memory != null && intermediateSteps.isNotEmpty) {
      final lastStep = intermediateSteps.last;
      final functionMsg = ChatMessage.function(
        name: lastStep.action.tool,
        content: lastStep.observation,
      );
      agentInput = functionMsg;
    } else {
      agentInput = switch (inputs[agentInputKey]) {
        final String inputStr => ChatMessage.human(inputStr),
        final ChatMessage inputMsg => inputMsg,
        _ => throw LangChainException(
            message: 'Agent expected a String or ChatMessage as input,'
                ' got ${inputs[agentInputKey]}',
          ),
      };
    }

    return {
      ...inputs,
      agentInputKey: agentInput,
      if (llmChain.memory == null)
        BaseActionAgent.agentScratchpadInputKey:
            _constructScratchPad(intermediateSteps),
    };
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
              ),
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
  /// It takes care of adding the necessary placeholders to handle the
  /// intermediary work of the agent or the memory.
  ///
  /// - [systemChatMessage] message to use as the system message that will be
  ///   the first in the prompt.
  /// - [extraPromptMessages] prompt messages that will be placed between the
  ///   system message and the new human input.
  /// - [memory] optional memory to use for the agent.
  static BasePromptTemplate createPrompt({
    final SystemChatMessagePromptTemplate systemChatMessage =
        _systemChatMessagePromptTemplate,
    final List<BaseChatMessagePromptTemplate>? extraPromptMessages,
    final BaseChatMemory? memory,
  }) {
    return ChatPromptTemplate.fromPromptMessages([
      systemChatMessage,
      ...?extraPromptMessages,
      for (final memoryKey in memory?.memoryKeys ?? {})
        MessagesPlaceholder(variableName: memoryKey),
      const MessagePlaceholder(variableName: agentInputKey),
      if (memory == null)
        const MessagesPlaceholder(
          variableName: BaseActionAgent.agentScratchpadInputKey,
        ),
    ]);
  }
}
