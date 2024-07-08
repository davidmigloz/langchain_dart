import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_tiktoken/langchain_tiktoken.dart';
import 'package:ollama_dart/ollama_dart.dart';
import 'package:uuid/uuid.dart';
import '../../langchain_ollama.dart';
import '../llms/mappers.dart';
import 'mappers.dart';

/// Wrapper around [Ollama](https://ollama.ai) Chat API that enables tool calling
/// feature like OpenAi's API and others.
///
/// Example:
/// ```dart
///final ollamaTools = OllamaTools();
///const toolOptions = ChatOllamaToolOptions(
///  options: ChatOllamaOptions(model: 'llama3:8b'),
///  tools: [tool1],
///);
///final messages = [
///  ChatMessage.humanText("What's the weather in Bangalore,Inida?"),
///];
///final prompt = PromptValue.chat(messages);
///final res = await ollamaTools.invoke(prompt, options: toolOptions);
///
///const tool1 = ToolSpec(
///name: 'get_current_weather',
///description: 'Get the current weather in a given location',
///inputJsonSchema: {
///  'type': 'object',
///  'properties': {
///    'location': {
///      'type': 'string',
///      'description': 'The city and state, e.g. San Francisco, CA',
///    },
///    'unit': {
///      'type': 'string',
///      'enum': ['celsius', 'fahrenheit'],
///    },
///  },
///  'required': ['location'],
///},
///);
///```
class OllamaTools extends BaseChatModel<ChatOllamaToolOptions> {
  /// Create a new [OllamaTools] instance.
  ///
  /// Main configuration options:
  /// - `baseUrl`: the base URL of Ollama API.
  /// - [OllamaTools.defaultOptions]
  ///
  /// Advance configuration options:
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  OllamaTools({
    final String baseUrl = 'http://localhost:11434/api',
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    super.defaultOptions = const ChatOllamaToolOptions(
      options: ChatOllamaOptions(model: 'llama3'),
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

  /// A UUID generator.
  late final Uuid _uuid = const Uuid();

  /// The encoding to use by tiktoken when [tokenize] is called.
  ///
  /// Ollama does not provide any API to count tokens, so we use tiktoken
  /// to get an estimation of the number of tokens in a prompt.
  String encoding;

  @override
  String get modelType => 'ollama-tools';

  @override
  Future<ChatResult> invoke(
    PromptValue input, {
    ChatOllamaToolOptions? options,
  }) async {
    final finalInput = (options ?? defaultOptions).formatTemplate(input);
    final id = _uuid.v4();
    final completion = await _client.generateChatCompletion(
      request: _generateCompletionRequest(
        finalInput.toChatMessages(),
        options: options?.options,
      ),
    );
    final finalCompletion = completion.toChatResult(id);
    Map<String, dynamic>? parsedContent;
    try {
      parsedContent =
          jsonDecode(finalCompletion.output.content) as Map<String, dynamic>;
    } catch (e) {
      throw Exception(
        'Model did not respond in vaild json string format, try improving your prompt, instruct to "respond in JSON"',
      );
    }

    final tool = AIChatMessageToolCall(
      id: _uuid.v4(),
      name: parsedContent['tool'].toString(),
      arguments: parsedContent['tool_input'] as Map<String, dynamic>,
      argumentsRaw: jsonEncode(parsedContent['tool_input']),
    );

    final toolMessage = AIChatMessage(content: '', toolCalls: [tool]);
    final finalResult = ChatResult(
      id: id,
      output: toolMessage,
      finishReason: finalCompletion.finishReason,
      metadata: finalCompletion.metadata,
      usage: finalCompletion.usage,
    );
    return finalResult;
  }

  /// Creates a [GenerateChatCompletionRequest] from the given input.
  GenerateChatCompletionRequest _generateCompletionRequest(
    final List<ChatMessage> messages, {
    final bool stream = false,
    final ChatOllamaOptions? options,
  }) {
    return GenerateChatCompletionRequest(
      model: options?.model ??
          defaultOptions.options.model ??
          throwNullModelError(),
      messages: messages.toMessages(),
      format: options?.format?.toResponseFormat(),
      keepAlive: options?.keepAlive,
      stream: stream,
      options: RequestOptions(
        numKeep: options?.numKeep ?? defaultOptions.options.numKeep,
        seed: options?.seed ?? defaultOptions.options.seed,
        numPredict: options?.numPredict ?? defaultOptions.options.numPredict,
        topK: options?.topK ?? defaultOptions.options.topK,
        topP: options?.topP ?? defaultOptions.options.topP,
        tfsZ: options?.tfsZ ?? defaultOptions.options.tfsZ,
        typicalP: options?.typicalP ?? defaultOptions.options.typicalP,
        repeatLastN: options?.repeatLastN ?? defaultOptions.options.repeatLastN,
        temperature: options?.temperature ?? defaultOptions.options.temperature,
        repeatPenalty:
            options?.repeatPenalty ?? defaultOptions.options.repeatPenalty,
        presencePenalty:
            options?.presencePenalty ?? defaultOptions.options.presencePenalty,
        frequencyPenalty: options?.frequencyPenalty ??
            defaultOptions.options.frequencyPenalty,
        mirostat: options?.mirostat ?? defaultOptions.options.mirostat,
        mirostatTau: options?.mirostatTau ?? defaultOptions.options.mirostatTau,
        mirostatEta: options?.mirostatEta ?? defaultOptions.options.mirostatEta,
        penalizeNewline:
            options?.penalizeNewline ?? defaultOptions.options.penalizeNewline,
        stop: options?.stop ?? defaultOptions.options.stop,
        numa: options?.numa ?? defaultOptions.options.numa,
        numCtx: options?.numCtx ?? defaultOptions.options.numCtx,
        numBatch: options?.numBatch ?? defaultOptions.options.numBatch,
        numGpu: options?.numGpu ?? defaultOptions.options.numGpu,
        mainGpu: options?.mainGpu ?? defaultOptions.options.mainGpu,
        lowVram: options?.lowVram ?? defaultOptions.options.lowVram,
        f16Kv: options?.f16KV ?? defaultOptions.options.f16KV,
        logitsAll: options?.logitsAll ?? defaultOptions.options.logitsAll,
        vocabOnly: options?.vocabOnly ?? defaultOptions.options.vocabOnly,
        useMmap: options?.useMmap ?? defaultOptions.options.useMmap,
        useMlock: options?.useMlock ?? defaultOptions.options.useMlock,
        numThread: options?.numThread ?? defaultOptions.options.numThread,
      ),
    );
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
    ChatOllamaToolOptions? options,
  }) async {
    final encoding = getEncoding(this.encoding);
    return encoding.encode(promptValue.toString());
  }

  @override
  void close() {
    _client.endSession();
  }
}
