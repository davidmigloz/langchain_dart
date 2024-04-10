import 'package:collection/collection.dart';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:http/http.dart' as http;
import 'package:langchain_core/documents.dart';
import 'package:langchain_core/embeddings.dart';
import 'package:langchain_core/utils.dart';

/// {@template google_generative_ai_embeddings}
/// Wrapper around Google AI embedding models API
///
/// Example:
/// ```dart
/// final embeddings = GoogleGenerativeAIEmbeddings(
///   apiKey: 'your-api-key',
/// );
/// final result = await embeddings.embedQuery('Hello world');
/// ```
///
/// Google AI documentation: https://ai.google.dev/
///
/// ### Available models
///
/// - `embedding-001`
///   * Optimized for creating embeddings for text of up to 2048 tokens
///
/// The previous list of models may not be exhaustive or up-to-date. Check out
/// the [Google AI documentation](https://ai.google.dev/models/gemini)
/// for the latest list of available models.
///
/// ### Task type
///
/// Google AI support specifying a 'task type' when embedding documents.
/// The task type is then used by the model to improve the quality of the
/// embeddings.
///
/// This class uses the specifies the following task type:
/// - `retrievalDocument`: for embedding documents
/// - `retrievalQuery`: for embedding queries
///
/// ### Title
///
/// Google AI support specifying a document title when embedding documents.
/// The title is then used by the model to improve the quality of the
/// embeddings.
///
/// To specify a document title, add the title to the document's metadata.
/// Then, specify the metadata key in the [docTitleKey] parameter.
///
/// Example:
/// ```dart
/// final embeddings = GoogleGenerativeAIEmbeddings(
///   apiKey: 'your-api-key',
/// );
/// final result = await embeddings.embedDocuments([
///   Document(
///     pageContent: 'Hello world',
///     metadata: {'title': 'Hello!'},
///   ),
/// ]);
/// ```
/// {@endtemplate}
class GoogleGenerativeAIEmbeddings implements Embeddings {
  /// Create a new [GoogleGenerativeAIEmbeddings] instance.
  ///
  /// Main configuration options:
  /// - `apiKey`: your Google AI API key. You can find your API key in the
  ///   [Google AI Studio dashboard](https://makersuite.google.com/app/apikey).
  /// - [GoogleGenerativeAIEmbeddings.model]
  /// - [GoogleGenerativeAIEmbeddings.batchSize]
  /// - [GoogleGenerativeAIEmbeddings.docTitleKey]
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to Google AI's API URL. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  GoogleGenerativeAIEmbeddings({
    final String? apiKey,
    final String? baseUrl,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    this.model = 'embedding-001',
    this.dimensions,
    this.batchSize = 100,
    this.docTitleKey = 'title',
  }) : _client = GoogleAIClient(
          apiKey: apiKey,
          baseUrl: baseUrl,
          headers: headers,
          queryParams: queryParams,
          client: client,
        );

  /// A client for interacting with Google AI API.
  final GoogleAIClient _client;

  /// The embeddings model to use.
  ///
  /// You can find a list of available embedding models here:
  /// https://ai.google.dev/models/gemini
  String model;

  /// The number of dimensions the resulting output embeddings should have.
  /// Only supported in `text-embedding-004` and later models.
  int? dimensions;

  /// The maximum number of documents to embed in a single request.
  int batchSize;

  /// The metadata key used to store the document's (optional) title.
  String docTitleKey;

  /// Set or replace the API key.
  set apiKey(final String value) => _client.apiKey = value;

  /// Get the API key.
  String get apiKey => _client.apiKey;

  @override
  Future<List<List<double>>> embedDocuments(
    final List<Document> documents,
  ) async {
    final batches = chunkList(documents, chunkSize: batchSize);

    final List<List<List<double>>> embeddings = await Future.wait(
      batches.map((final batch) async {
        final data = await _client.batchEmbedContents(
          modelId: model,
          request: BatchEmbedContentsRequest(
            requests: batch.map((final doc) {
              return EmbedContentRequest(
                title: doc.metadata[docTitleKey],
                content: Content(parts: [Part(text: doc.pageContent)]),
                taskType: EmbedContentRequestTaskType.retrievalDocument,
                model: 'models/$model',
                outputDimensionality: dimensions,
              );
            }).toList(growable: false),
          ),
        );
        return data.embeddings
                ?.map((final p) => p.values)
                .whereNotNull()
                .toList(growable: false) ??
            const [];
      }),
    );

    return embeddings.expand((final e) => e).toList(growable: false);
  }

  @override
  Future<List<double>> embedQuery(final String query) async {
    final data = await _client.embedContent(
      modelId: model,
      request: EmbedContentRequest(
        content: Content(parts: [Part(text: query)]),
        taskType: EmbedContentRequestTaskType.retrievalQuery,
      ),
    );
    return data.embedding?.values ?? const [];
  }

  /// Closes the client and cleans up any resources associated with it.
  void close() {
    _client.endSession();
  }
}
