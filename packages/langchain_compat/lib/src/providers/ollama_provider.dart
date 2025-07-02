import 'dart:convert';

import 'package:http/http.dart' as http;

import '../chat_models/base.dart';
import '../chat_models/chat_ollama/chat_ollama.dart';
import '../tools/base.dart';
import 'model_info.dart';
import 'model_kind.dart';
import 'provider.dart';

/// Provider for native Ollama API (local, not OpenAI-compatible).
class OllamaProvider extends Provider<ChatOllamaOptions> {
  /// Creates a new Ollama provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'ollama', 'ollama-openai').
  /// [displayName]: Human-readable name for display. [defaultModel]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  /// [isRemote]: True if the provider is cloud-based, false if local.
  OllamaProvider({
    required super.name,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    required super.isRemote,
  });

  @override
  BaseChatModel<ChatOllamaOptions> createModel({
    String? model,
    List<ToolSpec>? tools,
    double? temperature,
    ChatOllamaOptions? options,
  }) => ChatOllama(
    model: model ?? defaultModel,
    tools: tools,
    temperature: temperature,
    baseUrl: defaultBaseUrl,
    defaultOptions: ChatOllamaOptions(
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
      concurrencyLimit: options?.concurrencyLimit ?? 1000,
    ),
  );

  @override
  Future<Iterable<ModelInfo>> listModels() async {
    final url = Uri.parse('$defaultBaseUrl/tags');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch Ollama models: ${response.body}');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    // Defensive: ensure 'name' is a String, fallback to '' if not.
    return (data['models'] as List).cast<Map<String, dynamic>>().map((m) {
      final nameField = m['name'];
      final id = nameField is String ? nameField : '';
      final name = nameField is String ? nameField : null;
      final detailsField = m['details'];
      final description = detailsField is String ? detailsField : null;
      return ModelInfo(
        name: id,
        kinds: {ModelKind.chat},
        displayName: name,
        description: description,
        extra: {...m}..removeWhere((k, _) => ['name', 'details'].contains(k)),
      );
    });
  }
}
