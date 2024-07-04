import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/tools.dart';
import 'package:langchain_tiktoken/langchain_tiktoken.dart';
import 'package:ollama_dart/ollama_dart.dart';
import 'package:uuid/uuid.dart';
import '../../langchain_ollama.dart';
import '../llms/mappers.dart';
import 'mappers.dart';

class OllamaTools extends BaseChatModel<ChatOllamaToolOptions> {
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

  final OllamaClient _client;

  late final Uuid _uuid = const Uuid();

  String encoding;

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
    final parsedContent =
        jsonDecode(finalCompletion.output.content) as Map<String, dynamic>;

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

  @override
  String get modelType => 'ollama-function';

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

  @override
  Future<List<int>> tokenize(
    PromptValue promptValue, {
    ChatOllamaToolOptions? options,
  }) async {
    final encoding = getEncoding(this.encoding);
    return encoding.encode(promptValue.toString());
  }
}

//demo
void main() {
  getTool();
}

void getTool() async {
  final model = OllamaTools(
    defaultOptions: const ChatOllamaToolOptions(
      options: ChatOllamaOptions(
        model: 'llama3:8b',
        format: OllamaResponseFormat.json,
      ),
      tools: [tool1],
    ),
  );
  final messages = [
    ChatMessage.humanText("What's the weather in Vellore,India?"),
  ];
  final prompt = PromptValue.chat(messages);
  final res = await model.invoke(prompt);
  print(res);
}

const tool1 = ToolSpec(
  name: 'get_current_weather',
  description: 'Get the current weather in a given location',
  inputJsonSchema: getWeatherInputJsonSchema,
);

const Map<String, dynamic> getWeatherInputJsonSchema = {
  'type': 'object',
  'properties': {
    'location': {
      'type': 'string',
      'description': 'The city and state, e.g. San Francisco, CA',
    },
    'unit': {
      'type': 'string',
      'enum': ['celsius', 'fahrenheit'],
    },
  },
  'required': ['location'],
};
