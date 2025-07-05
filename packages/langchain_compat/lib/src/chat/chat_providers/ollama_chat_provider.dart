import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import '../chat_models/chat_model.dart';
import '../chat_models/ollama_chat/ollama_chat_model.dart';
import '../tools/tool.dart';
import 'chat_provider.dart';
import 'model_chat_kind.dart';
import 'model_info.dart';

/// Provider for native Ollama API (local, not OpenAI-compatible).
class OllamaChatProvider extends ChatProvider<OllamaChatOptions> {
  /// Creates a new Ollama provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'ollama', 'ollama-openai').
  /// [displayName]: Human-readable name for display. [defaultModelName]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  OllamaChatProvider({
    required super.name,
    required super.displayName,
    required super.defaultModelName,
    required super.defaultBaseUrl,
    required super.apiKeyName,
  });

  /// Logger for Ollama chat provider operations.
  static final Logger _logger = Logger('dartantic.chat.providers.ollama');

  @override
  ChatModel<OllamaChatOptions> createModel({
    String? name,
    List<Tool>? tools,
    double? temperature,
    OllamaChatOptions? options,
  }) {
    final modelName = name ?? defaultModelName;
    _logger.info(
      'Creating Ollama model: $modelName with ${tools?.length ?? 0} tools, '
      'temp: $temperature',
    );
    return OllamaChatModel(
      name: name ?? defaultModelName,
      tools: tools,
      temperature: temperature,
      baseUrl: defaultBaseUrl,
      defaultOptions: OllamaChatOptions(
        format: options?.format,
        keepAlive: options?.keepAlive,
        numKeep: options?.numKeep,
        seed: options?.seed,
        numPredict: options?.numPredict,
        topK: options?.topK,
        topP: options?.topP,
        minP: options?.minP,
        tfsZ: options?.tfsZ,
        typicalP: options?.typicalP,
        repeatLastN: options?.repeatLastN,
        temperature: temperature ?? options?.temperature,
        repeatPenalty: options?.repeatPenalty,
        presencePenalty: options?.presencePenalty,
        frequencyPenalty: options?.frequencyPenalty,
        mirostat: options?.mirostat,
        mirostatTau: options?.mirostatTau,
        mirostatEta: options?.mirostatEta,
        penalizeNewline: options?.penalizeNewline,
        stop: options?.stop,
        numa: options?.numa,
        numCtx: options?.numCtx,
        numBatch: options?.numBatch,
        numGpu: options?.numGpu,
        mainGpu: options?.mainGpu,
        lowVram: options?.lowVram,
        f16KV: options?.f16KV,
        logitsAll: options?.logitsAll,
        vocabOnly: options?.vocabOnly,
        useMmap: options?.useMmap,
        useMlock: options?.useMlock,
        numThread: options?.numThread,
      ),
    );
  }

  @override
  Stream<ModelInfo> getModels() async* {
    final url = Uri.parse('$defaultBaseUrl/tags');
    _logger.info('Fetching models from Ollama API: $url');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      _logger.warning(
        'Failed to fetch models: HTTP ${response.statusCode}, '
        'body: ${response.body}',
      );
      throw Exception('Failed to fetch Ollama models: ${response.body}');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final modelCount = (data['models'] as List).length;
    _logger.info('Successfully fetched $modelCount models from Ollama API');

    // Defensive: ensure 'name' is a String, fallback to '' if not.
    for (final m in (data['models'] as List).cast<Map<String, dynamic>>()) {
      final nameField = m['name'];
      final id = nameField is String ? nameField : '';
      final name = nameField is String ? nameField : null;
      final detailsField = m['details'];
      final description = detailsField is String ? detailsField : null;
      yield ModelInfo(
        name: id,
        kinds: {ModelKind.chat},
        displayName: name,
        description: description,
        extra: {...m}..removeWhere((k, _) => ['name', 'details'].contains(k)),
      );
    }
  }
}
