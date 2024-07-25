import 'dart:convert';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:http/http.dart' as http;
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_tiktoken/langchain_tiktoken.dart';
import 'package:ollama_dart/ollama_dart.dart';
import 'package:uuid/uuid.dart';

import 'mappers.dart';
import 'types.dart';

/// Wrapper around [Ollama](https://ollama.ai) Chat API that enables tool
/// calling capabilities.
///
/// Warning: This is an experimental wrapper that attempts to add tool calling
/// support to models that do not support it natively. More powerful and
/// capable models will perform better with complex schema and/or multiple
/// tools. Use with caution.
///
/// Example:
/// ```dart
/// const tool = ToolSpec(
///   name: 'get_current_weather',
///   description: 'Get the current weather in a given location',
///   inputJsonSchema: {
///     'type': 'object',
///     'properties': {
///       'location': {
///         'type': 'string',
///         'description': 'The city and state, e.g. San Francisco, CA',
///       },
///       'unit': {
///         'type': 'string',
///         'enum': ['celsius', 'fahrenheit'],
///       },
///     },
///     'required': ['location'],
///   },
/// );
/// final chatModel = ChatOllamaTools(
///   defaultOptions: ChatOllamaToolOptions(
///     options: ChatOllamaOptions(model: 'llama3.1'),
///     tools: [tool],
///   ),
/// );
/// final prompt = PromptValue.string('What's the weather in Bangalore, India?');
/// final res = await ollamaTools.invoke(prompt);
/// ```
///
/// If you don't need to use tools, use [ChatOllama] instead.
///
/// ### Setup
///
/// 1. Download and install [Ollama](https://ollama.ai)
/// 2. Fetch a model via `ollama pull <model family>`
///   * e.g., for Llama 3: `ollama pull llama3.1`
///
/// ### Ollama base URL
///
/// By default, [ChatOllama] uses 'http://localhost:11434/api' as base URL
/// (default Ollama API URL). But if you are running Ollama on a different
/// one, you can override it using the [baseUrl] parameter.
class ChatOllamaTools extends BaseChatModel<ChatOllamaToolsOptions> {
  /// Create a new [ChatOllamaTools] instance.
  ///
  /// Main configuration options:
  /// - `baseUrl`: the base URL of Ollama API.
  /// - [ChatOllamaTools.defaultOptions]
  ///
  /// Advance configuration options:
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  /// - [ChatOllama.encoding]
  ChatOllamaTools({
    final String baseUrl = 'http://localhost:11434/api',
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    super.defaultOptions = const ChatOllamaToolsOptions(
      options: ChatOllamaOptions(model: defaultModel),
    ),
    this.encoding = 'cl100k_base',
  }) : _client = OllamaClient(
          baseUrl: baseUrl,
          headers: headers,
          queryParams: queryParams,
          client: client,
        );

  /// A client for interacting with Ollama API.
  final OllamaClient _client;

  /// The encoding to use by tiktoken when [tokenize] is called.
  ///
  /// Ollama does not provide any API to count tokens, so we use tiktoken
  /// to get an estimation of the number of tokens in a prompt.
  String encoding;

  /// A UUID generator.
  late final Uuid _uuid = const Uuid();

  @override
  String get modelType => 'chat-ollama-tools';

  /// The default model to use unless another is specified.
  static const defaultModel = 'llama3.1';

  @override
  Future<ChatResult> invoke(
    PromptValue input, {
    ChatOllamaToolsOptions? options,
  }) async {
    final id = _uuid.v4();
    final completion = await _client.generateChatCompletion(
      request: _generateCompletionRequest(input, options),
    );
    final result = completion.toChatResult(id);
    return _parseResult(result);
  }

  /// Creates a [GenerateChatCompletionRequest] from the given input.
  GenerateChatCompletionRequest _generateCompletionRequest(
    final PromptValue input,
    final ChatOllamaToolsOptions? toolsOptions, {
    final bool stream = false,
  }) {
    final messages = _formatPrompt(input, toolsOptions).toChatMessages();
    final options = toolsOptions?.options;
    final defaultOptions =
        this.defaultOptions.options ?? const ChatOllamaOptions();
    return GenerateChatCompletionRequest(
      model: options?.model ?? defaultOptions.model ?? defaultModel,
      messages: messages.toMessages(),
      format: ResponseFormat.json,
      keepAlive: options?.keepAlive ?? defaultOptions.keepAlive,
      stream: stream,
      options: RequestOptions(
        numKeep: options?.numKeep ?? defaultOptions.numKeep,
        seed: options?.seed ?? defaultOptions.seed,
        numPredict: options?.numPredict ?? defaultOptions.numPredict,
        topK: options?.topK ?? defaultOptions.topK,
        topP: options?.topP ?? defaultOptions.topP,
        tfsZ: options?.tfsZ ?? defaultOptions.tfsZ,
        typicalP: options?.typicalP ?? defaultOptions.typicalP,
        repeatLastN: options?.repeatLastN ?? defaultOptions.repeatLastN,
        temperature: options?.temperature ?? defaultOptions.temperature,
        repeatPenalty: options?.repeatPenalty ?? defaultOptions.repeatPenalty,
        presencePenalty:
            options?.presencePenalty ?? defaultOptions.presencePenalty,
        frequencyPenalty:
            options?.frequencyPenalty ?? defaultOptions.frequencyPenalty,
        mirostat: options?.mirostat ?? defaultOptions.mirostat,
        mirostatTau: options?.mirostatTau ?? defaultOptions.mirostatTau,
        mirostatEta: options?.mirostatEta ?? defaultOptions.mirostatEta,
        penalizeNewline:
            options?.penalizeNewline ?? defaultOptions.penalizeNewline,
        stop: options?.stop ?? defaultOptions.stop,
        numa: options?.numa ?? defaultOptions.numa,
        numCtx: options?.numCtx ?? defaultOptions.numCtx,
        numBatch: options?.numBatch ?? defaultOptions.numBatch,
        numGpu: options?.numGpu ?? defaultOptions.numGpu,
        mainGpu: options?.mainGpu ?? defaultOptions.mainGpu,
        lowVram: options?.lowVram ?? defaultOptions.lowVram,
        f16Kv: options?.f16KV ?? defaultOptions.f16KV,
        logitsAll: options?.logitsAll ?? defaultOptions.logitsAll,
        vocabOnly: options?.vocabOnly ?? defaultOptions.vocabOnly,
        useMmap: options?.useMmap ?? defaultOptions.useMmap,
        useMlock: options?.useMlock ?? defaultOptions.useMlock,
        numThread: options?.numThread ?? defaultOptions.numThread,
      ),
    );
  }

  PromptValue _formatPrompt(
    final PromptValue input,
    final ChatOllamaToolsOptions? options,
  ) {
    final toolsSystemPromptTemplate = options?.toolsSystemPromptTemplate ??
        defaultOptions.toolsSystemPromptTemplate ??
        ChatOllamaToolsOptions.defaultToolsSystemPromtTemplate;
    final promptTemplate = ChatPromptTemplate.fromTemplates([
      (ChatMessageType.system, toolsSystemPromptTemplate),
      (ChatMessageType.messagesPlaceholder, 'input'),
    ]);
    final toolChoice = options?.toolChoice ?? defaultOptions.toolChoice;
    final availableTools = options?.tools ?? defaultOptions.tools;
    final tools = switch (toolChoice) {
      // If toolChoice is auto, we include all the tools
      ChatToolChoiceAuto() || null => [
          ...?availableTools,
          conversationalResponseTool,
        ],
      // If toolChoice is none, we include only the conversational response tool
      ChatToolChoiceNone() => [conversationalResponseTool],
      // If toolChoice is required, we include only the user specified tools
      ChatToolChoiceRequired() => availableTools!,
      // If toolChoice is forced, we include only the forced tool
      final ChatToolChoiceForced f => [
          availableTools!.firstWhere((t) => t.name == f.name),
        ]
    };
    final toolsJsonMap = json.encode(
      tools.map((tool) => tool.toJson()).toList(growable: false),
    );
    final toolChoiceInstructions = switch (toolChoice) {
      ChatToolChoiceNone() => '`${conversationalResponseTool.name}` tool',
      ChatToolChoiceAuto() ||
      ChatToolChoiceRequired() ||
      null =>
        'one or more tools',
      final ChatToolChoiceForced f => '`${f.name}` tool',
    };
    return promptTemplate.formatPrompt({
      'tools': toolsJsonMap,
      'tool_choice': toolChoiceInstructions,
      'input': input.toChatMessages(),
    });
  }

  Future<ChatResult> _parseResult(final ChatResult result) async {
    try {
      final output = result.output.content;
      final outputMap = json.decode(output) as Map<String, dynamic>;
      final toolCalls = (outputMap['tool_calls'] as List).map((t) {
        final tool = t as Map<String, dynamic>;
        final toolInput = tool['tool_input'];
        final toolInputMap = json.decode(toolInput) as Map<String, dynamic>;
        return AIChatMessageToolCall(
          id: _uuid.v4(),
          name: tool['tool_name'].toString(),
          arguments: toolInputMap,
          argumentsRaw: toolInput,
        );
      }).toList(growable: false);

      final conversationalResponseToolCall = toolCalls
          .firstWhereOrNull((t) => t.name == conversationalResponseTool.name);
      final content = conversationalResponseToolCall != null
          ? await conversationalResponseTool.invoke(
              conversationalResponseTool.getInputFromJson(
                conversationalResponseToolCall.arguments,
              ),
            )
          : '';
      final otherToolCalls = toolCalls
          .where((t) => t.name != conversationalResponseTool.name)
          .toList(growable: false);

      return ChatResult(
        id: result.id,
        output: AIChatMessage(
          content: content,
          toolCalls: otherToolCalls,
        ),
        finishReason: result.finishReason,
        metadata: result.metadata,
        usage: result.usage,
      );
    } catch (e) {
      throw Exception(
        'Model did not respond in valid json string format, '
        'try improving your prompt, instruct to "respond in JSON"',
      );
    }
  }

  /// Tokenizes the given prompt using tiktoken.
  ///
  /// Currently Ollama does not provide a tokenizer for the models it supports.
  /// So we use tiktoken and [encoding] model to get an approximation
  /// for counting tokens. Mind that the actual tokens will be totally
  /// different from the ones used by the Ollama model.
  ///
  /// If an encoding model is specified in [encoding] field, that
  /// encoding is used instead.
  ///
  /// - [promptValue] The prompt to tokenize.
  @override
  Future<List<int>> tokenize(
    PromptValue promptValue, {
    ChatOllamaToolsOptions? options,
  }) async {
    final encoding = getEncoding(this.encoding);
    return encoding.encode(promptValue.toString());
  }

  @override
  void close() {
    _client.endSession();
  }
}
