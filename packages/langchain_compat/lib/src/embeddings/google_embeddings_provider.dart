import 'package:google_generative_ai/google_generative_ai.dart'
    show Content, EmbedContentRequest, GenerativeModel, TaskType;
import 'package:http/http.dart' as http;
import 'package:http/retry.dart' show RetryClient;

import '../custom_http_client.dart';
import '../language_models/language_models.dart';
import 'chunk_list.dart';
import 'embeddings_provider.dart';
import 'embeddings_result.dart';

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
/// This class specifies the following task type:
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
/// {@endtemplate}
class GoogleEmbeddingsProvider implements EmbeddingsProvider {
  /// Create a new [GoogleEmbeddingsProvider] instance.
  ///
  /// Main configuration options:
  /// - `apiKey`: your Google AI API key. You can find your API key in the
  ///   [Google AI Studio dashboard](https://aistudio.google.com/app/apikey).
  /// - `model`: the embeddings model to use. You can find a list of available
  ///   embedding models here: https://ai.google.dev/models/gemini
  /// - [GoogleEmbeddingsProvider.dimensions]
  /// - [GoogleEmbeddingsProvider.batchSize]
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
  GoogleEmbeddingsProvider({
    String? apiKey,
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    int retries = 3,
    http.Client? client,
    String model = 'text-embedding-004',
    this.dimensions,
    this.batchSize = 100,
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
  set model(String model) {
    _recreateGoogleAiClient(model);
    _model = model;
  }

  /// Get the embeddings model to use.
  String get model => _model;

  /// The number of dimensions the resulting output embeddings should have.
  /// Only supported in `text-embedding-004` and later models.
  int? dimensions;

  /// The maximum number of texts to embed in a single request.
  int batchSize;

  /// Set or replace the API key.
  set apiKey(String value) => _httpClient.headers['x-goog-api-key'] = value;

  /// Get the API key.
  String get apiKey => _httpClient.headers['x-goog-api-key'] ?? '';

  @override
  Future<BatchEmbeddingsResult> embedDocuments(List<String> texts) async {
    final batches = chunkList(texts, chunkSize: batchSize);
    final allEmbeddings = <List<double>>[];
    var totalCharacters = 0;

    for (final batch in batches) {
      final data = await _googleAiClient.batchEmbedContents(
        batch
            .map(
              (text) => EmbedContentRequest(
                Content.text(text),
                taskType: TaskType.retrievalDocument,
                outputDimensionality: dimensions,
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
        'model': _model,
        'dimensions': dimensions,
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
  Future<EmbeddingsResult> embedQuery(String query) async {
    final data = await _googleAiClient.embedContent(
      Content.text(query),
      taskType: TaskType.retrievalQuery,
      outputDimensionality: dimensions,
    );

    // Google doesn't provide token usage, so estimate
    final estimatedTokens = (query.length / 4).round();

    return EmbeddingsResult(
      id: 'google-embedding-${DateTime.now().millisecondsSinceEpoch}',
      output: data.embedding.values,
      finishReason: FinishReason.stop,
      metadata: {
        'model': _model,
        'dimensions': dimensions,
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
  @Deprecated('Use embedDocuments() for usage tracking')
  Future<List<List<double>>> embedDocumentsRaw(List<String> texts) async {
    final result = await embedDocuments(texts);
    return result.embeddings;
  }

  @override
  @Deprecated('Use embedQuery() for usage tracking')
  Future<List<double>> embedQueryRaw(String query) async {
    final result = await embedQuery(query);
    return result.embeddings;
  }

  /// Closes the client and cleans up any resources associated with it.
  void close() {
    _httpClient.close();
  }

  /// Create a new [GenerativeModel] instance.
  GenerativeModel _createGoogleAiClient(
    String model, [
    String? apiKey,
    CustomHttpClient? httpClient,
  ]) => GenerativeModel(
    model: model,
    apiKey: apiKey ?? this.apiKey,
    httpClient: httpClient ?? _httpClient,
  );

  /// Recreate the [GenerativeModel] instance.
  void _recreateGoogleAiClient(String model) {
    _googleAiClient = _createGoogleAiClient(model);
  }

  @override
  String get displayName => 'Google';
}
