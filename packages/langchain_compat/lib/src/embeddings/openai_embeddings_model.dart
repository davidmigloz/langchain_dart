import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:openai_dart/openai_dart.dart';

import '../language_models/language_models.dart';
import 'chunk_list.dart';
import 'embeddings_model.dart';
import 'embeddings_result.dart';
import 'openai_embeddings_model_options.dart';

/// OpenAI embeddings model implementation.
class OpenAIEmbeddingsModel
    extends EmbeddingsModel<OpenAIEmbeddingsModelOptions> {
  /// Creates a new OpenAI embeddings model.
  OpenAIEmbeddingsModel({
    String? apiKey,
    String baseUrl = 'https://api.openai.com/v1',
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    http.Client? client,
    super.model,
    super.dimensions,
    super.batchSize = 512,
    String? user,
  }) : _client = OpenAIClient(
         apiKey: apiKey ?? Platform.environment['OPENAI_API_KEY'] ?? '',
         organization: null,
         baseUrl: baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client,
       ),
       _user = user,
       super(
         defaultOptions: OpenAIEmbeddingsModelOptions(
           dimensions: dimensions,
           batchSize: batchSize,
           user: user,
         ),
       );

  final OpenAIClient _client;
  final String? _user;

  @override
  String get defaultModelName => 'text-embedding-3-small';

  @override
  Future<EmbeddingsResult> embedQuery(
    String query, {
    OpenAIEmbeddingsModelOptions? options,
  }) async {
    final data = await _client.createEmbedding(
      request: CreateEmbeddingRequest(
        model: EmbeddingModel.modelId(name),
        input: EmbeddingInput.string(query),
        dimensions: options?.dimensions ?? dimensions,
        user: options?.user ?? _user,
      ),
    );

    return EmbeddingsResult(
      id: 'embedding-${DateTime.now().millisecondsSinceEpoch}',
      output: data.data.first.embeddingVector,
      finishReason: FinishReason.stop,
      metadata: {
        'model': name,
        'dimensions': options?.dimensions ?? dimensions,
        'query_length': query.length,
      },
      usage: LanguageModelUsage(
        promptTokens: data.usage?.promptTokens,
        totalTokens: data.usage?.totalTokens,
      ),
    );
  }

  @override
  Future<BatchEmbeddingsResult> embedDocuments(
    List<String> texts, {
    OpenAIEmbeddingsModelOptions? options,
  }) async {
    final effectiveBatchSize = options?.batchSize ?? batchSize ?? 512;
    final batches = chunkList(texts, chunkSize: effectiveBatchSize);
    var totalUsage = const LanguageModelUsage();
    final allEmbeddings = <List<double>>[];

    for (final batch in batches) {
      final data = await _client.createEmbedding(
        request: CreateEmbeddingRequest(
          model: EmbeddingModel.modelId(name),
          input: EmbeddingInput.listString(batch.toList(growable: false)),
          dimensions: options?.dimensions ?? dimensions,
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
    }

    return BatchEmbeddingsResult(
      id: 'batch-embeddings-${DateTime.now().millisecondsSinceEpoch}',
      output: allEmbeddings,
      finishReason: FinishReason.stop,
      metadata: {
        'model': name,
        'dimensions': options?.dimensions ?? dimensions,
        'batch_count': batches.length,
        'total_texts': texts.length,
      },
      usage: totalUsage,
    );
  }

  @override
  void close() {
    _client.endSession();
  }
}
