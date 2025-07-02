import 'dart:io';

import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html_parser;
import 'package:http/http.dart' as http;

import '../../tools/base.dart';
import '../chat_models/chat_model.dart';
import '../chat_models/cohere_chat/cohere_chat_model.dart';
import '../chat_models/cohere_chat/cohere_chat_options.dart';
import 'model_info.dart';
import 'model_kind.dart';
import 'openai_provider.dart';

/// Provider for Cohere OpenAI-compatible API.
class CohereOpenAIProvider extends OpenAIProvider {
  /// Creates a new Cohere OpenAI provider instance.
  ///
  /// [name]: The canonical provider name (e.g., 'cohere', 'cohere-openai').
  /// [displayName]: Human-readable name for display. [defaultModel]: The
  /// default model for this provider. [defaultBaseUrl]: The default API
  /// endpoint. [apiKeyName]: The environment variable for the API key (if any).
  /// [isRemote]: True if the provider is cloud-based, false if local.
  CohereOpenAIProvider({
    required super.name,
    required super.displayName,
    required super.defaultModel,
    required super.defaultBaseUrl,
    required super.apiKeyName,
    required super.isRemote,
  });

  @override
  ChatModel<CohereChatOptions> createModel({
    String? model,
    List<ToolSpec>? tools,
    double? temperature,
    CohereChatOptions? options,
  }) => CohereChatModel(
    model: model ?? defaultModel,
    tools: tools,
    temperature: temperature,
    apiKey: apiKeyName.isNotEmpty ? Platform.environment[apiKeyName] : null,
    baseUrl: defaultBaseUrl,
    defaultOptions: CohereChatOptions(
      frequencyPenalty: options?.frequencyPenalty,
      logitBias: options?.logitBias,
      maxTokens: options?.maxTokens,
      n: options?.n,
      presencePenalty: options?.presencePenalty,
      responseFormat: options?.responseFormat,
      seed: options?.seed,
      stop: options?.stop,
      temperature: temperature ?? options?.temperature,
      topP: options?.topP,
      parallelToolCalls: options?.parallelToolCalls,
      serviceTier: options?.serviceTier,
      user: options?.user,
      concurrencyLimit: options?.concurrencyLimit ?? 1000,
      streamOptions: null, // Cohere requires streamOptions to be null
    ),
  );

  @override
  Future<Iterable<ModelInfo>> listModels() async {
    final url = Uri.parse('https://docs.cohere.com/docs/models');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch Cohere models docs: ${response.body}');
    }
    final doc = html_parser.parse(response.body);
    final models = <ModelInfo>[];
    // Find all tables whose first header cell is 'Model Name'
    for (final table in doc.querySelectorAll('table')) {
      final headerCells = table.querySelectorAll('th');
      if (headerCells.isEmpty) continue;
      final firstHeader = headerCells.first.text.trim().toLowerCase();
      if (firstHeader == 'model name') {
        // Try to determine kind from headers or parse as chat/embedding/other
        final headers = headerCells
            .map((th) => th.text.trim().toLowerCase())
            .toList();
        // Parse the table, passing headers for classification
        models.addAll(_parseCohereTableWithHeaders(table, headers));
      }
    }
    if (models.isEmpty) {
      throw Exception('No models found in Cohere docs.');
    }
    return models;
  }

  // Parse a Cohere model table, using headers to classify model kind
  List<ModelInfo> _parseCohereTableWithHeaders(
    dom.Element table,
    List<String> headers,
  ) {
    final rows = table.querySelectorAll('tbody tr');
    final result = <ModelInfo>[];
    for (final row in rows) {
      final cells = row.querySelectorAll('td');
      if (cells.isEmpty) continue;
      final id = cells[0].text.trim();
      final description = cells.length > 1 ? cells[1].text.trim() : null;
      final kinds = <ModelKind>{};
      final idLower = id.toLowerCase();
      // Heuristics based on model name
      if (idLower.contains('embed')) {
        kinds.add(ModelKind.embedding);
      }
      if (idLower.contains('command') ||
          idLower.contains('c4ai-aya') ||
          idLower.contains('vision')) {
        kinds.add(ModelKind.chat);
      }
      if (idLower.contains('rerank')) {
        kinds.add(ModelKind.other); // Consider ModelKind.rerank if you add it
      }
      // Only fall back to Modality column if name is ambiguous
      if (kinds.isEmpty) {
        final modalityIdx = headers.indexWhere(
          (h) => h == 'modality' || h == 'modalities',
        );
        if (modalityIdx != -1 && cells.length > modalityIdx) {
          final modality = cells[modalityIdx].text.trim().toLowerCase();
          if (modality.contains('text') && !modality.contains('embed')) {
            kinds.add(ModelKind.chat);
          } else if (modality.contains('embed')) {
            kinds.add(ModelKind.embedding);
          } else if (modality.contains('image') ||
              modality.contains('vision')) {
            kinds.add(ModelKind.image);
          } else if (modality.contains('audio')) {
            kinds.add(ModelKind.audio);
          } else if (modality.contains('tts')) {
            kinds.add(ModelKind.tts);
          } else {
            kinds.add(ModelKind.other);
          }
        }
      }
      // Ensure kinds is never empty
      if (kinds.isEmpty) kinds.add(ModelKind.other);
      // Try to get context window if present
      int? contextWindow;
      final contextIdx = headers.indexWhere(
        (h) => h.contains('context length'),
      );
      if (contextIdx != -1 && cells.length > contextIdx) {
        final text = cells[contextIdx].text;
        final match = RegExp(r'(\d+)k').firstMatch(text);
        if (match != null) {
          contextWindow = int.tryParse(match.group(1)!)! * 1000;
        }
      }
      result.add(
        ModelInfo(
          name: id,
          kinds: kinds,
          displayName: id,
          description: description,
          extra: {
            for (var i = 0; i < headers.length && i < cells.length; i++)
              headers[i]: cells[i].text.trim(),
            'description': description,
            if (contextWindow != null) 'contextWindow': contextWindow,
          },
        ),
      );
    }
    return result;
  }
}
