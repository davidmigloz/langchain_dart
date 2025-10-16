import 'package:langchain_core/agents.dart';
import 'package:langchain_core/chains.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/exceptions.dart';
import 'package:langchain_core/memory.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/tools.dart';

const _systemChatMessagePromptTemplate = SystemChatMessagePromptTemplate(
  prompt: PromptTemplate(
    inputVariables: {},
    template: 'You are a helpful AI assistant',
  ),
);

/// {@template tools_agent}
/// An agent powered by the tool calling API.
///
/// Example:
/// ```dart
/// final llm = ChatOllama(
///   defaultOptions: ChatOllamaOptions(
///     model: 'llama3-groq-tool-use',
///     temperature: 0,
///   ),
/// );
/// final tools = [CalculatorTool()];
/// final agent = ToolsAgent.fromLLMAndTools(llm: llm, tools: tools);
/// final executor = AgentExecutor(agent: agent);
/// final res = await executor.run('What is 40 raised to the 0.43 power? ');
/// ```
///
/// You can use any chat model that supports tools, like `ChatOpenAI`,
/// `ChatOllama`, `ChatAnthropic`, `ChatFirebaseVertexAI`, etc. Check the
/// [documentation](https://langchaindart.dev/#/modules/model_io/models/chat_models/how_to/tools)
/// for a complete list.
///
/// You can easily add memory to the agent using the memory parameter from the
/// [ToolsAgent.fromLLMAndTools] constructor. Make sure you enable
/// [BaseChatMemory.returnMessages] on your memory, as the agent works with
/// [ChatMessage]s. The default prompt template already takes care of adding
/// the history to the prompt. For example:
/// ```dart
/// final memory = ConversationBufferMemory(returnMessages: true);
/// final agent = ToolsAgent.fromLLMAndTools(
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
/// ChatPromptTemplate.fromTemplates([
///   (ChatMessageType.system, 'You are a helpful AI assistant'),
///   (ChatMessageType.messagesPlaceholder, 'history'),
///   (ChatMessageType.messagePlaceholder, 'input'),
/// ]);
/// ```
///
/// You can use [ToolsAgent.createPrompt] to build the prompt
/// template if you only need to customize the system message or add some
/// extra messages.
/// {@endtemplate}
class ToolsAgent extends BaseSingleActionAgent {
  /// {@macro tools_agent}
  ToolsAgent({required this.llmChain, required super.tools})
    : _parser = const ToolsAgentOutputParser(),
      assert(
        llmChain.memory != null ||
            llmChain.prompt.inputVariables.contains(
              BaseActionAgent.agentScratchpadInputKey,
            ),
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
  final LLMChain<BaseChatModel, ChatModelOptions, BaseChatMemory> llmChain;

  /// Parser to use to parse the output of the LLM.
  final ToolsAgentOutputParser _parser;

  /// The key for the input to the agent.
  static const agentInputKey = 'input';

  @override
  Set<String> get inputKeys => {agentInputKey};

  /// Construct an [ToolsAgent] from an [llm] and [tools].
  ///
  /// - [llm] - The model to use for the agent.
  /// - [tools] - The tools the agent has access to. You can omit this field if
  ///   you have already configured the tools in the [llm].
  /// - [memory] - The memory to use for the agent.
  /// - [systemChatMessage] message to use as the system message that will be
  ///   the first in the prompt. Default: "You are a helpful AI assistant".
  /// - [extraPromptMessages] prompt messages that will be placed between the
  ///   system message and the input from the agent.
  factory ToolsAgent.fromLLMAndTools({
    required final BaseChatModel llm,
    final List<Tool>? tools,
    final BaseChatMemory? memory,
    final SystemChatMessagePromptTemplate systemChatMessage =
        _systemChatMessagePromptTemplate,
    final List<ChatMessagePromptTemplate>? extraPromptMessages,
  }) {
    assert(
      tools != null || llm.defaultOptions.tools != null,
      'Tools must be provided or configured in the llm',
    );
    assert(
      tools != null || llm.defaultOptions.tools!.every((tool) => tool is Tool),
      'All elements in `tools` must be of type `Tool` or its subclasses',
    );

    final actualTools = tools ?? llm.defaultOptions.tools!.cast<Tool>();

    return ToolsAgent(
      llmChain: LLMChain(
        llm: llm,
        llmOptions: llm.defaultOptions.copyWith(tools: actualTools),
        prompt: createPrompt(
          systemChatMessage: systemChatMessage,
          extraPromptMessages: extraPromptMessages,
          memory: memory,
        ),
        memory: memory,
      ),
      tools: actualTools,
    );
  }

  @override
  Future<List<BaseAgentAction>> plan(final AgentPlanInput input) async {
    final llmChainInputs = _constructLlmChainInputs(
      input.intermediateSteps,
      input.inputs,
    );
    final ChainValues output = await llmChain.invoke(llmChainInputs);
    final predictedMessage = output[LLMChain.defaultOutputKey] as AIChatMessage;
    return _parser.parseChatMessage(predictedMessage);
  }

  Map<String, dynamic> _constructLlmChainInputs(
    final List<AgentStep> intermediateSteps,
    final InputValues inputs,
  ) {
    final dynamic agentInput;

    // If there is a memory, we pass the last agent step as a function message.
    // Otherwise, we pass the input as a human message.
    if (llmChain.memory != null && intermediateSteps.isNotEmpty) {
      final lastStep = intermediateSteps.last;
      final functionMsg = ChatMessage.tool(
        toolCallId: lastStep.action.id,
        content: lastStep.observation,
      );
      agentInput = functionMsg;
    } else {
      agentInput = switch (inputs[agentInputKey]) {
        final String inputStr => ChatMessage.humanText(inputStr),
        final ChatMessage inputMsg => inputMsg,
        final List<ChatMessage> inputMsgs => inputMsgs,
        _ => throw LangChainException(
          message:
              'Agent expected a String or ChatMessage as input,'
              ' got ${inputs[agentInputKey]}',
        ),
      };
    }

    return {
      ...inputs,
      agentInputKey: agentInput,
      if (llmChain.memory == null)
        BaseActionAgent.agentScratchpadInputKey: _constructScratchPad(
          intermediateSteps,
        ),
    };
  }

  List<ChatMessage> _constructScratchPad(
    final List<AgentStep> intermediateSteps,
  ) {
    return [
      ...intermediateSteps
          .map((final s) {
            return s.action.messageLog +
                [
                  ChatMessage.tool(
                    toolCallId: s.action.id,
                    content: s.observation,
                  ),
                ];
          })
          .expand((final m) => m),
    ];
  }

  @override
  String get agentType => 'tool-agent';

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
    final List<ChatMessagePromptTemplate>? extraPromptMessages,
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

/// {@template tools_agent_output_parser}
/// Parser for [ToolsAgent].
///
/// It parses the output of the LLM and returns the corresponding
/// [BaseAgentAction] to be executed.
/// {@endtemplate}
class ToolsAgentOutputParser
    extends
        BaseOutputParser<
          ChatResult,
          OutputParserOptions,
          List<BaseAgentAction>
        > {
  /// {@macro tools_agent_output_parser}
  const ToolsAgentOutputParser()
    : super(defaultOptions: const OutputParserOptions());

  @override
  Future<List<BaseAgentAction>> invoke(
    final ChatResult input, {
    final OutputParserOptions? options,
  }) {
    return parseChatMessage(input.output);
  }

  /// Parses the [message] and returns the corresponding [BaseAgentAction].
  Future<List<BaseAgentAction>> parseChatMessage(
    final AIChatMessage message,
  ) async {
    final toolCalls = message.toolCalls;
    if (toolCalls.isNotEmpty) {
      return toolCalls
          .map((final toolCall) {
            return AgentAction(
              id: toolCall.id,
              tool: toolCall.name,
              toolInput: toolCall.arguments,
              log:
                  'Invoking: `${toolCall.name}` '
                  'with `${toolCall.arguments}`\n'
                  'Responded: ${message.content}\n',
              messageLog: [message],
            );
          })
          .toList(growable: false);
    } else {
      return [
        AgentFinish(
          returnValues: {'output': message.content},
          log: message.content,
        ),
      ];
    }
  }
}
