import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart'
    show Content, EmbedContentRequest, GenerativeModel, TaskType;
import 'package:http/http.dart' as http;
import 'package:http/retry.dart' show RetryClient;

import '../../../chat/chat_providers/chat_provider.dart';
import '../../../custom_http_client.dart';
import '../../../language_models/language_models.dart';
import '../../chunk_list.dart';
import '../../embeddings_model.dart';
import '../../embeddings_result.dart';
import 'google_embeddings_model_options.dart';

/// Google AI embeddings model implementation.
class GoogleEmbeddingsModel
    extends EmbeddingsModel<GoogleEmbeddingsModelOptions> {
  /// Creates a new Google AI embeddings model.
  GoogleEmbeddingsModel({
    String? apiKey,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    int retries = 3,
    http.Client? client,
    String? name,
    super.dimensions,
    super.batchSize = 100,
  }) : _apiKey = apiKey ?? Platform.environment[apiKeyName]!,
       super(
         name: name ?? defaultName,
         defaultOptions: GoogleEmbeddingsModelOptions(
           dimensions: dimensions,
           batchSize: batchSize,
         ),
       ) {
    _httpClient = CustomHttpClient(
      baseHttpClient: client ?? RetryClient(http.Client(), retries: retries),
      baseUrl: Uri.parse(_baseUrl),
      headers: {'x-goog-api-key': _apiKey, ...?headers},
      queryParams: queryParams ?? const {},
    );
    _googleAiClient = _createGoogleAiClient();
  }

  /// The environment variable name for the Google API key.
  static final apiKeyName = ChatProvider.google.apiKeyName;

  /// The default model name.
  static const defaultName = 'text-embedding-004';

  static const _baseUrl = 'https://generativelanguage.googleapis.com/v1beta';

  final String _apiKey;
  late final CustomHttpClient _httpClient;
  late GenerativeModel _googleAiClient;

  @override
  Future<EmbeddingsResult> embedQuery(
    String query, {
    GoogleEmbeddingsModelOptions? options,
  }) async {
    final data = await _googleAiClient.embedContent(
      Content.text(query),
      taskType: TaskType.retrievalQuery,
      outputDimensionality: options?.dimensions ?? dimensions,
    );

    // Google doesn't provide token usage, so estimate
    final estimatedTokens = (query.length / 4).round();

    return EmbeddingsResult(
      id: 'google-embedding-${DateTime.now().millisecondsSinceEpoch}',
      output: data.embedding.values,
      finishReason: FinishReason.stop,
      metadata: {
        'model': name,
        'dimensions': options?.dimensions ?? dimensions,
        'query_length': query.length,
        'task_type': 'retrievalQuery',
      },
      usage: LanguageModelUsage(
        promptTokens: estimatedTokens,
        promptBillableCharacters: query.length,
        totalTokens: estimatedTokens,
      ),
    );
  }

  @override
  Future<BatchEmbeddingsResult> embedDocuments(
    List<String> texts, {
    GoogleEmbeddingsModelOptions? options,
  }) async {
    final effectiveBatchSize = options?.batchSize ?? batchSize ?? 100;
    final batches = chunkList(texts, chunkSize: effectiveBatchSize);
    final allEmbeddings = <List<double>>[];
    var totalCharacters = 0;

    for (final batch in batches) {
      final data = await _googleAiClient.batchEmbedContents(
        batch
            .map(
              (text) => EmbedContentRequest(
                Content.text(text),
                taskType: TaskType.retrievalDocument,
                outputDimensionality: options?.dimensions ?? dimensions,
              ),
            )
            .toList(growable: false),
      );

      // Extract embeddings
      final batchEmbeddings = data.embeddings
          .map((p) => p.values)
          .nonNulls
          .toList(growable: false);
      allEmbeddings.addAll(batchEmbeddings);

      // Count characters for estimation
      totalCharacters += batch.map((t) => t.length).reduce((a, b) => a + b);
    }

    // Google doesn't provide token usage, so estimate
    final estimatedTokens = (totalCharacters / 4).round();

    return BatchEmbeddingsResult(
      id: 'google-batch-embeddings-${DateTime.now().millisecondsSinceEpoch}',
      output: allEmbeddings,
      finishReason: FinishReason.stop,
      metadata: {
        'model': name,
        'dimensions': options?.dimensions ?? dimensions,
        'batch_count': batches.length,
        'total_texts': texts.length,
        'total_characters': totalCharacters,
      },
      usage: LanguageModelUsage(
        promptTokens: estimatedTokens,
        promptBillableCharacters: totalCharacters,
        totalTokens: estimatedTokens,
      ),
    );
  }

  @override
  void dispose() => _httpClient.close();

  /// Create a new [GenerativeModel] instance.
  GenerativeModel _createGoogleAiClient() =>
      GenerativeModel(model: name, apiKey: _apiKey, httpClient: _httpClient);
}
