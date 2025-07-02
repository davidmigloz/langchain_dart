import 'dart:convert';

import 'package:http/http.dart' as http;

import '../language_models/finish_reason.dart';
import '../language_models/language_model_usage.dart';
import 'cohere_embeddings_model_options.dart';
import 'embeddings_model.dart';
import 'embeddings_result.dart';

/// Cohere embeddings model implementation.
class CohereEmbeddingsModel
    extends EmbeddingsModel<CohereEmbeddingsModelOptions> {
  /// Creates a new Cohere embeddings model.
  const CohereEmbeddingsModel({
    required this.apiKey,
    required this.baseUrl,
    super.model,
    super.dimensions,
    super.batchSize = 96, // Cohere's default batch size limit
    this.inputType,
    this.embeddingTypes,
    this.truncate,
    super.defaultOptions = const CohereEmbeddingsModelOptions(),
  });

  /// The API key for authentication.
  final String? apiKey;

  /// The base URL for the API.
  final String baseUrl;

  /// The input type for the embeddings.
  final String? inputType;

  /// The embedding types to return.
  final List<String>? embeddingTypes;

  /// How to handle inputs longer than the maximum token length.
  final String? truncate;

  @override
  String get defaultModelName => 'embed-v4.0';

  @override
  Future<EmbeddingsResult> embedQuery(
    String query, {
    CohereEmbeddingsModelOptions? options,
  }) async {
    final result = await embedDocuments([query], options: options);
    return EmbeddingsResult(
      id: result.id,
      output: result.embeddings.first,
      finishReason: result.finishReason,
      usage: result.usage,
      metadata: result.metadata,
    );
  }

  @override
  Future<BatchEmbeddingsResult> embedDocuments(
    List<String> texts, {
    CohereEmbeddingsModelOptions? options,
  }) async {
    final chunks = <List<String>>[];
    final actualBatchSize = options?.batchSize ?? batchSize ?? 96;
    
    for (var i = 0; i < texts.length; i += actualBatchSize) {
      chunks.add(
        texts.sublist(i, (i + actualBatchSize).clamp(0, texts.length)),
      );
    }

    final allEmbeddings = <List<double>>[];
    var totalPromptTokens = 0;
    // var totalTokens = 0; // Unused in Cohere response
    var totalBillableCharacters = 0;
    var lastId = '';

    for (final chunk in chunks) {
      final response = await _makeRequest(chunk, options);
      
      // Handle Cohere v2 API response format
      List<List<double>> embeddings;
      if (response.containsKey('embeddings') && response['embeddings'] is Map) {
        // v2 API format: {"embeddings": {"float": [[...], [...]]}}
        final embeddingsMap = response['embeddings'] as Map<String, dynamic>;
        final floatEmbeddings = embeddingsMap['float'] as List<dynamic>;
        embeddings = floatEmbeddings
            .map((item) => (item as List<dynamic>)
                .map((e) => (e as num).toDouble())
                .toList())
            .toList();
      } else if (response.containsKey('embeddings') && response['embeddings'] is List) {
        // v1 API format: {"embeddings": [[...], [...]]}
        embeddings = (response['embeddings'] as List<dynamic>)
            .map((item) => (item as List<dynamic>)
                .map((e) => (e as num).toDouble())
                .toList())
            .toList();
      } else {
        throw Exception('Unexpected Cohere embeddings response format: ${response.keys}');
      }
      
      allEmbeddings.addAll(embeddings);

      // Accumulate usage data
      final meta = response['meta'] as Map<String, dynamic>?;
      if (meta != null) {
        final billedUnits = meta['billed_units'] as Map<String, dynamic>?;
        if (billedUnits != null) {
          totalPromptTokens += billedUnits['input_tokens'] as int? ?? 0;
          totalBillableCharacters +=
              billedUnits['search_units'] as int? ?? 0;
        }
      }

      lastId = response['id'] as String? ?? '';
    }

    final usage = LanguageModelUsage(
      promptTokens: totalPromptTokens > 0 ? totalPromptTokens : null,
      totalTokens: totalPromptTokens > 0 ? totalPromptTokens : null,
      promptBillableCharacters:
          totalBillableCharacters > 0 ? totalBillableCharacters : null,
    );

    return BatchEmbeddingsResult(
      id: lastId,
      output: allEmbeddings,
      finishReason: FinishReason.stop,
      usage: usage,
      metadata: {'model': name, 'provider': 'cohere'},
    );
  }

  Future<Map<String, dynamic>> _makeRequest(
    List<String> texts,
    CohereEmbeddingsModelOptions? options,
  ) async {
    if (apiKey == null || apiKey!.isEmpty) {
      throw Exception('Cohere API key is required');
    }

    final url = Uri.parse('$baseUrl/embed');
    final body = {
      'model': name,
      'texts': texts,
      if (inputType != null || options?.inputType != null)
        'input_type':
            options?.inputType ?? inputType ?? 'search_document',
      if (embeddingTypes != null || options?.embeddingTypes != null)
        'embedding_types':
            options?.embeddingTypes ?? embeddingTypes ?? ['float'],
      if (truncate != null || options?.truncate != null)
        'truncate': options?.truncate ?? truncate,
    };

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Cohere embeddings API error: '
        '${response.statusCode} ${response.body}',
      );
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  @override
  void close() {
    // Nothing to close for HTTP-based model
  }
}
