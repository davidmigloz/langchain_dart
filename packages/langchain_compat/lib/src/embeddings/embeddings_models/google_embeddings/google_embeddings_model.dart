import 'package:google_generative_ai/google_generative_ai.dart'
    show Content, EmbedContentRequest, GenerativeModel, TaskType;
import 'package:http/http.dart' as http;
import 'package:http/retry.dart' show RetryClient;
import 'package:logging/logging.dart';

import '../../../chat/chat_providers/chat_provider.dart';
import '../../../custom_http_client.dart';
import '../../../language_models/language_models.dart';
import '../../../platform/platform.dart';
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
  }) : _apiKey = apiKey ?? getEnv(apiKeyName),
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

    _logger.info(
      'Created Google embeddings model: ${this.name} '
      '(dimensions: $dimensions, batchSize: $batchSize)',
    );
  }
  static final _logger = Logger('dartantic.embeddings.models.google');

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
    final queryLength = query.length;
    final effectiveDimensions = options?.dimensions ?? dimensions;

    _logger.fine(
      'Embedding query with Google model "$name" '
      '(length: $queryLength, dimensions: $effectiveDimensions)',
    );

    final data = await _googleAiClient.embedContent(
      Content.text(query),
      taskType: TaskType.retrievalQuery,
      outputDimensionality: effectiveDimensions,
    );

    // Google doesn't provide token usage, so estimate
    final estimatedTokens = (queryLength / 4).round();

    _logger.fine(
      'Google embedding query completed '
      '(estimated tokens: $estimatedTokens)',
    );

    final result = EmbeddingsResult(
      id: 'google-embedding-${DateTime.now().millisecondsSinceEpoch}',
      output: data.embedding.values,
      finishReason: FinishReason.stop,
      metadata: {
        'model': name,
        'dimensions': effectiveDimensions,
        'query_length': queryLength,
        'task_type': 'retrievalQuery',
      },
      usage: LanguageModelUsage(
        promptTokens: estimatedTokens,
        promptBillableCharacters: queryLength,
        totalTokens: estimatedTokens,
      ),
    );

    _logger.info(
      'Google embedding query result: '
      '${result.output.length} dimensions, '
      '${result.usage.totalTokens} estimated tokens',
    );

    return result;
  }

  @override
  Future<BatchEmbeddingsResult> embedDocuments(
    List<String> texts, {
    GoogleEmbeddingsModelOptions? options,
  }) async {
    final effectiveBatchSize = options?.batchSize ?? batchSize ?? 100;
    final effectiveDimensions = options?.dimensions ?? dimensions;
    final batches = chunkList(texts, chunkSize: effectiveBatchSize);
    final totalTexts = texts.length;
    final totalCharacters = texts.map((t) => t.length).reduce((a, b) => a + b);

    _logger.info(
      'Embedding $totalTexts documents with Google model "$name" '
      '(batches: ${batches.length}, batchSize: $effectiveBatchSize, '
      'dimensions: $effectiveDimensions, totalChars: $totalCharacters)',
    );

    final allEmbeddings = <List<double>>[];

    for (var i = 0; i < batches.length; i++) {
      final batch = batches[i];
      final batchCharacters = batch
          .map((t) => t.length)
          .reduce((a, b) => a + b);

      _logger.fine(
        'Processing batch ${i + 1}/${batches.length} '
        '(${batch.length} texts, $batchCharacters chars)',
      );

      final data = await _googleAiClient.batchEmbedContents(
        batch
            .map(
              (text) => EmbedContentRequest(
                Content.text(text),
                taskType: TaskType.retrievalDocument,
                outputDimensionality: effectiveDimensions,
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

      _logger.fine(
        'Batch ${i + 1} completed: '
        '${batchEmbeddings.length} embeddings',
      );
    }

    // Google doesn't provide token usage, so estimate
    final estimatedTokens = (totalCharacters / 4).round();

    final result = BatchEmbeddingsResult(
      id: 'google-batch-embeddings-${DateTime.now().millisecondsSinceEpoch}',
      output: allEmbeddings,
      finishReason: FinishReason.stop,
      metadata: {
        'model': name,
        'dimensions': effectiveDimensions,
        'batch_count': batches.length,
        'total_texts': totalTexts,
        'total_characters': totalCharacters,
      },
      usage: LanguageModelUsage(
        promptTokens: estimatedTokens,
        promptBillableCharacters: totalCharacters,
        totalTokens: estimatedTokens,
      ),
    );

    _logger.info(
      'Google batch embedding completed: '
      '${result.output.length} embeddings, '
      '${result.usage.totalTokens} estimated tokens',
    );

    return result;
  }

  @override
  void dispose() => _httpClient.close();

  /// Create a new [GenerativeModel] instance.
  GenerativeModel _createGoogleAiClient() =>
      GenerativeModel(model: name, apiKey: _apiKey, httpClient: _httpClient);
}
