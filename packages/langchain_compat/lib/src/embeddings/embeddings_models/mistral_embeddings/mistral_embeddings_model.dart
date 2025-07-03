import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../language_models/finish_reason.dart';
import '../../../language_models/language_model_usage.dart';
import '../../embeddings_model.dart';
import '../../embeddings_result.dart';
import 'mistral_embeddings_model_options.dart';

/// Mistral AI embeddings model implementation.
class MistralEmbeddingsModel
    extends EmbeddingsModel<MistralEmbeddingsModelOptions> {
  /// Creates a new Mistral embeddings model.
  const MistralEmbeddingsModel({
    required this.apiKey,
    required this.baseUrl,
    super.model,
    super.dimensions,
    super.batchSize = 100,
    this.encodingFormat,
    super.defaultOptions = const MistralEmbeddingsModelOptions(),
  });

  /// The API key for authentication.
  final String? apiKey;

  /// The base URL for the API.
  final String baseUrl;

  /// The encoding format for the embeddings.
  final String? encodingFormat;

  @override
  String get defaultModelName => 'mistral-embed';

  @override
  Future<EmbeddingsResult> embedQuery(
    String query, {
    MistralEmbeddingsModelOptions? options,
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
    MistralEmbeddingsModelOptions? options,
  }) async {
    final chunks = <List<String>>[];
    final actualBatchSize = options?.batchSize ?? batchSize ?? 100;

    for (var i = 0; i < texts.length; i += actualBatchSize) {
      chunks.add(
        texts.sublist(i, (i + actualBatchSize).clamp(0, texts.length)),
      );
    }

    final allEmbeddings = <List<double>>[];
    var totalPromptTokens = 0;
    var totalTokens = 0;
    var lastId = '';

    for (final chunk in chunks) {
      final response = await _makeRequest(chunk, options);
      final embeddings = (response['data'] as List<dynamic>)
          .map(
            (item) =>
                ((item as Map<String, dynamic>)['embedding'] as List<dynamic>)
                    .map((e) => (e as num).toDouble())
                    .toList(),
          )
          .toList();

      allEmbeddings.addAll(embeddings);

      // Accumulate usage data
      final usage = response['usage'] as Map<String, dynamic>?;
      if (usage != null) {
        totalPromptTokens += usage['prompt_tokens'] as int? ?? 0;
        totalTokens += usage['total_tokens'] as int? ?? 0;
      }

      lastId = response['id'] as String? ?? '';
    }

    final usage = LanguageModelUsage(
      promptTokens: totalPromptTokens > 0 ? totalPromptTokens : null,
      totalTokens: totalTokens > 0 ? totalTokens : null,
    );

    return BatchEmbeddingsResult(
      id: lastId,
      output: allEmbeddings,
      finishReason: FinishReason.stop,
      usage: usage,
      metadata: {'model': name, 'provider': 'mistral'},
    );
  }

  Future<Map<String, dynamic>> _makeRequest(
    List<String> texts,
    MistralEmbeddingsModelOptions? options,
  ) async {
    if (apiKey == null || apiKey!.isEmpty) {
      throw Exception('Mistral API key is required');
    }

    final url = Uri.parse('$baseUrl/embeddings');
    final body = {
      'model': name,
      'input': texts,
      if (dimensions != null || options?.dimensions != null)
        'dimensions': options?.dimensions ?? dimensions,
      if (encodingFormat != null || options?.encodingFormat != null)
        'encoding_format': options?.encodingFormat ?? encodingFormat,
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
        'Mistral embeddings API error: ${response.statusCode} ${response.body}',
      );
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  @override
  void close() {
    // Nothing to close for HTTP-based model
  }
}
