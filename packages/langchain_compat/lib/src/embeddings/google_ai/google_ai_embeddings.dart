import 'package:google_generative_ai/google_generative_ai.dart'
    show Content, EmbedContentRequest, GenerativeModel, TaskType;
import 'package:http/http.dart' as http;
import 'package:http/retry.dart' show RetryClient;

import '../../documents/document.dart';
import '../../embeddings/base.dart';
import '../../utils/chunk.dart';
import '../../utils/https_client/http_client.dart';

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
/// - `text-embedding-004`
///   * Dimensions: 768 (with support for reduced dimensionality)
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
/// - `retrievalDocument`: for [embedDocuments]
/// - `retrievalQuery`: for [embedQuery]
///
/// ### Reduced dimensionality
///
/// Some embedding models support specifying a smaller number of dimensions
/// for the resulting embeddings. This can be useful when you want to save
/// computing and storage costs with minor performance loss. Use the
/// [dimensions] parameter to specify the number of dimensions.
///
/// You can also use this feature to reduce the dimensions to 2D or 3D for
/// visualization purposes.
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
  ///   [Google AI Studio dashboard](https://aistudio.google.com/app/apikey).
  /// - `model`: the embeddings model to use. You can find a list of available
  ///   embedding models here: https://ai.google.dev/models/gemini
  /// - [GoogleGenerativeAIEmbeddings.dimensions]
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
  /// - `retries`: the number of retries to attempt if a request fails.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  GoogleGenerativeAIEmbeddings({
    final String? apiKey,
    final String? baseUrl,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final int retries = 3,
    final http.Client? client,
    String model = 'text-embedding-004',
    this.dimensions,
    this.batchSize = 100,
    this.docTitleKey = 'title',
  }) : _model = model,
       _httpClient = CustomHttpClient(
         baseHttpClient: client ?? RetryClient(http.Client(), retries: retries),
         baseUrl: Uri.parse(
           baseUrl ?? 'https://generativelanguage.googleapis.com/v1beta',
         ),
         headers: {if (apiKey != null) 'x-goog-api-key': apiKey, ...?headers},
         queryParams: queryParams ?? const {},
       ) {
    _googleAiClient = _createGoogleAiClient(model, apiKey ?? '', _httpClient);
  }

  /// The HTTP client to use.
  final CustomHttpClient _httpClient;

  /// A client for interacting with Google AI API.
  late GenerativeModel _googleAiClient;

  /// The embeddings model to use.
  String _model;

  /// Set the embeddings model to use.
  set model(final String model) {
    _recreateGoogleAiClient(model);
    _model = model;
  }

  /// Get the embeddings model to use.
  String get model => _model;

  /// The number of dimensions the resulting output embeddings should have.
  /// Only supported in `text-embedding-004` and later models.
  int? dimensions;

  /// The maximum number of documents to embed in a single request.
  int batchSize;

  /// The metadata key used to store the document's (optional) title.
  String docTitleKey;

  /// Set or replace the API key.
  set apiKey(final String value) =>
      _httpClient.headers['x-goog-api-key'] = value;

  /// Get the API key.
  String get apiKey => _httpClient.headers['x-goog-api-key'] ?? '';

  @override
  Future<List<List<double>>> embedDocuments(
    final List<Document> documents,
  ) async {
    final batches = chunkList(documents, chunkSize: batchSize);

    final embeddings = await Future.wait(
      batches.map((final batch) async {
        final data = await _googleAiClient.batchEmbedContents(
          batch
              .map((final doc) => EmbedContentRequest(
                  Content.text(doc.pageContent),
                  taskType: TaskType.retrievalDocument,
                  title: doc.metadata[docTitleKey],
                  outputDimensionality: dimensions,
                ))
              .toList(growable: false),
        );
        return data.embeddings
            .map((final p) => p.values)
            .nonNulls
            .toList(growable: false);
      }),
    );

    return embeddings.expand((final e) => e).toList(growable: false);
  }

  @override
  Future<List<double>> embedQuery(final String query) async {
    final data = await _googleAiClient.embedContent(
      Content.text(query),
      taskType: TaskType.retrievalQuery,
      outputDimensionality: dimensions,
    );
    return data.embedding.values;
  }

  /// Closes the client and cleans up any resources associated with it.
  void close() {
    _httpClient.close();
  }

  /// Create a new [GenerativeModel] instance.
  GenerativeModel _createGoogleAiClient(
    final String model, [
    final String? apiKey,
    final CustomHttpClient? httpClient,
  ]) => GenerativeModel(
      model: model,
      apiKey: apiKey ?? this.apiKey,
      httpClient: httpClient ?? _httpClient,
    );

  /// Recreate the [GenerativeModel] instance.
  void _recreateGoogleAiClient(final String model) {
    _googleAiClient = _createGoogleAiClient(model);
  }
}
