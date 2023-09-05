import 'package:langchain/langchain.dart';

import '../client/base.dart';
import '../client/openai_client.dart';

/// {@template openai_embeddings}
/// Wrapper around [OpenAI Embeddings API](https://platform.openai.com/docs/api-reference/embeddings).
///
/// Example:
/// ```dart
/// final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);
/// final res = await embeddings.embedQuery('Hello world');
/// ```
/// {@endtemplate}
class OpenAIEmbeddings implements Embeddings {
  /// {@macro openai_embeddings}
  OpenAIEmbeddings({
    final String? apiKey,
    final BaseOpenAIClient? apiClient,
    this.model = 'text-embedding-ada-002',
    this.batchSize = 512,
  })  : assert(
          apiKey != null || apiClient != null,
          'Either apiKey or apiClient must be provided.',
        ),
        _client = apiClient ?? OpenAIClient.instanceFor(apiKey: apiKey!);

  final BaseOpenAIClient _client;

  /// ID of the model to use (e.g. 'text-embedding-ada-002').
  ///
  /// See https://platform.openai.com/docs/api-reference/embeddings/create#embeddings/create-model
  final String model;

  /// The maximum number of documents to embed in a single request.
  /// This is limited by max input tokens for the model
  /// (e.g. 8191 tokens for text-embedding-ada-002).
  final int batchSize;

  @override
  Future<List<List<double>>> embedDocuments(
    final List<Document> documents,
  ) async {
    // TODO use tiktoken to chunk documents that exceed the context length of the model
    final batches = chunkArray(documents, chunkSize: batchSize);

    final embeddings = await Future.wait(
      batches.map((final batch) async {
        final data = await _client.createEmbeddings(
          model: model,
          input:
              batch.map((final doc) => doc.pageContent).toList(growable: false),
        );
        return data.data.map((final d) => d.embeddings);
      }),
    );

    return embeddings.expand((final e) => e).toList(growable: false);
  }

  @override
  Future<List<double>> embedQuery(final String query) async {
    final data = await _client.createEmbeddings(model: model, input: query);
    return data.data.first.embeddings;
  }
}
