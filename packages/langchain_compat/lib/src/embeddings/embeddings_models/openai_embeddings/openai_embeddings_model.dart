import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:openai_dart/openai_dart.dart';

import '../../../chat/chat_models/openai_chat/openai_chat_model.dart';
import '../../../http/retry_http_client.dart';
import '../../../language_models/language_models.dart';
import '../../../platform/platform.dart';
import '../../chunk_list.dart';
import '../../embeddings_model.dart';
import '../../embeddings_result.dart';
import 'openai_embeddings_model_options.dart';

/// OpenAI embeddings model implementation.
class OpenAIEmbeddingsModel
    extends EmbeddingsModel<OpenAIEmbeddingsModelOptions> {
  /// Creates a new OpenAI embeddings model.
  OpenAIEmbeddingsModel({
    String? name,
    String? apiKey,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    http.Client? client,
    super.dimensions,
    super.batchSize = 512,
    String? user,
  }) : _client = OpenAIClient(
         apiKey: apiKey ?? getEnv(apiKeyName),
         organization: null,
         baseUrl: _baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client != null
             ? RetryHttpClient(inner: client)
             : RetryHttpClient(inner: http.Client()),
       ),
       _user = user,
       super(
         name: name ?? defaultName,
         defaultOptions: OpenAIEmbeddingsModelOptions(
           dimensions: dimensions,
           batchSize: batchSize,
           user: user,
         ),
       ) {
    _logger.info(
      'Created OpenAI embeddings model: ${this.name} '
      '(dimensions: $dimensions, batchSize: $batchSize)',
    );
  }
  static final _logger = Logger('dartantic.embeddings.models.openai');

  /// The environment variable name for the OpenAI API key.
  static const apiKeyName = OpenAIChatModel.apiKeyName;

  /// The default model name for this provider.
  static const defaultName = 'text-embedding-3-small';

  static const _baseUrl = 'https://api.openai.com/v1';
  final OpenAIClient _client;
  final String? _user;

  @override
  Future<EmbeddingsResult> embedQuery(
    String query, {
    OpenAIEmbeddingsModelOptions? options,
  }) async {
    final queryLength = query.length;
    final effectiveDimensions = options?.dimensions ?? dimensions;

    _logger.fine(
      'Embedding query with OpenAI model "$name" '
      '(length: $queryLength, dimensions: $effectiveDimensions)',
    );

    final data = await _client.createEmbedding(
      request: CreateEmbeddingRequest(
        model: EmbeddingModel.modelId(name),
        input: EmbeddingInput.string(query),
        dimensions: effectiveDimensions,
        user: options?.user ?? _user,
      ),
    );

    _logger.fine(
      'OpenAI embedding query completed '
      '(tokens: ${data.usage?.totalTokens})',
    );

    final result = EmbeddingsResult(
      id: 'embedding-${DateTime.now().millisecondsSinceEpoch}',
      output: data.data.first.embeddingVector,
      finishReason: FinishReason.stop,
      metadata: {
        'model': name,
        'dimensions': effectiveDimensions,
        'query_length': queryLength,
      },
      usage: LanguageModelUsage(
        promptTokens: data.usage?.promptTokens,
        totalTokens: data.usage?.totalTokens,
      ),
    );

    _logger.info(
      'OpenAI embedding query result: '
      '${result.output.length} dimensions, '
      '${result.usage.totalTokens} tokens',
    );

    return result;
  }

  @override
  Future<BatchEmbeddingsResult> embedDocuments(
    List<String> texts, {
    OpenAIEmbeddingsModelOptions? options,
  }) async {
    final effectiveBatchSize = options?.batchSize ?? batchSize ?? 512;
    final effectiveDimensions = options?.dimensions ?? dimensions;
    final batches = chunkList(texts, chunkSize: effectiveBatchSize);
    final totalTexts = texts.length;
    final totalCharacters = texts.map((t) => t.length).reduce((a, b) => a + b);

    _logger.info(
      'Embedding $totalTexts documents with OpenAI model "$name" '
      '(batches: ${batches.length}, batchSize: $effectiveBatchSize, '
      'dimensions: $effectiveDimensions, totalChars: $totalCharacters)',
    );

    var totalUsage = const LanguageModelUsage();
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

      final data = await _client.createEmbedding(
        request: CreateEmbeddingRequest(
          model: EmbeddingModel.modelId(name),
          input: EmbeddingInput.listString(batch.toList(growable: false)),
          dimensions: effectiveDimensions,
          user: options?.user ?? _user,
        ),
      );

      // Extract embeddings
      final batchEmbeddings = data.data.map((d) => d.embeddingVector).toList();
      allEmbeddings.addAll(batchEmbeddings);

      // Accumulate usage
      final batchUsage = LanguageModelUsage(
        promptTokens: data.usage?.promptTokens,
        totalTokens: data.usage?.totalTokens,
      );
      totalUsage = totalUsage.concat(batchUsage);

      _logger.fine(
        'Batch ${i + 1} completed: '
        '${batchEmbeddings.length} embeddings, '
        '${batchUsage.totalTokens} tokens',
      );
    }

    final result = BatchEmbeddingsResult(
      id: 'batch-embeddings-${DateTime.now().millisecondsSinceEpoch}',
      output: allEmbeddings,
      finishReason: FinishReason.stop,
      metadata: {
        'model': name,
        'dimensions': effectiveDimensions,
        'batch_count': batches.length,
        'total_texts': totalTexts,
      },
      usage: totalUsage,
    );

    _logger.info(
      'OpenAI batch embedding completed: '
      '${result.output.length} embeddings, '
      '${result.usage.totalTokens} total tokens',
    );

    return result;
  }

  @override
  void dispose() => _client.endSession();
}
