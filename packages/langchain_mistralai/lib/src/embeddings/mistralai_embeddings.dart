import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:mistralai_dart/mistralai_dart.dart';

/// Wrapper around [Mistral AI](https://docs.mistral.ai) Embeddings API.
///
/// Example:
/// ```dart
/// final embeddings = MistralAIEmbeddings(apiKey: ...);
/// final res = await embeddings.embedQuery('Hello world');
/// ```
///
/// - [Mistral AI API docs](https://docs.mistral.ai)
///
/// ### Setup
///
/// To use `MistralAIEmbeddings` you need to have a Mistral AI account and an API key.
/// You can get one [here](https://console.mistral.ai/users).
///
/// ### Available models
///
/// The following models are available at the moment:
/// - `mistral-embed`: an embedding model with a 1024 embedding dimensions designed
///    with retrieval capabilities in mind. It achieves a retrieval score of 55.26 on MTEB.
///
/// Mind that this list may not be up-to-date.
/// Refer to the [documentation](https://docs.mistral.ai/models) for the updated list.
///
/// ### Advance
///
/// #### Custom HTTP client
///
/// You can always provide your own implementation of `http.Client` for further
/// customization:
///
/// ```dart
/// final client = MistralAIEmbeddings(
///   apiKey: 'MISTRAL_AI_API_KEY',
///   client: MyHttpClient(),
/// );
/// ```
///
/// #### Using a proxy
///
/// ##### HTTP proxy
///
/// You can use your own HTTP proxy by overriding the `baseUrl` and providing
/// your required `headers`:
///
/// ```dart
/// final client = MistralAIEmbeddings(
///   baseUrl: 'https://my-proxy.com',
///   headers: {'x-my-proxy-header': 'value'},
///   queryParams: {'x-my-proxy-query-param': 'value'},
/// );
/// ```
///
/// If you need further customization, you can always provide your own
/// `http.Client`.
///
/// ##### SOCKS5 proxy
///
/// To use a SOCKS5 proxy, you can use the
/// [`socks5_proxy`](https://pub.dev/packages/socks5_proxy) package and a
/// custom `http.Client`.
class MistralAIEmbeddings implements Embeddings {
  /// Create a new [MistralAIEmbeddings] instance.
  ///
  /// Main configuration options:
  /// - `apiKey`: your Mistral AI API key. You can find your API key in the
  ///   [Mistral AI dashboard](https://console.mistral.ai/users/).
  /// - [MistralAIEmbeddings.model]
  /// - [MistralAIEmbeddings.batchSize]
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to Mistral AI's API URL. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  MistralAIEmbeddings({
    final String? apiKey,
    final String baseUrl = 'https://api.mistral.ai/v1',
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    this.model = 'mistral-embed',
    this.batchSize = 512,
  }) : _client = MistralAIClient(
          apiKey: apiKey,
          baseUrl: baseUrl,
          headers: headers,
          queryParams: queryParams,
          client: client,
        );

  /// A client for interacting with Mistral AI API.
  final MistralAIClient _client;

  /// The embeddings model to use.
  final String model;

  /// The maximum number of documents to embed in a single request.
  int batchSize;

  @override
  Future<List<List<double>>> embedDocuments(
    final List<Document> documents,
  ) async {
    final batches = chunkArray(documents, chunkSize: batchSize);

    final embeddings = await Future.wait(
      batches.map((final batch) async {
        final data = await _client.createEmbedding(
          request: EmbeddingRequest(
            model: EmbeddingModel.modelId(model),
            input: batch
                .map((final doc) => doc.pageContent)
                .toList(growable: false),
          ),
        );
        return data.data.map((final d) => d.embedding);
      }),
    );

    return embeddings.expand((final e) => e).toList(growable: false);
  }

  @override
  Future<List<double>> embedQuery(final String query) async {
    final data = await _client.createEmbedding(
      request: EmbeddingRequest(
        model: EmbeddingModel.modelId(model),
        input: [query],
      ),
    );
    return data.data.firstOrNull?.embedding ?? [];
  }

  /// Closes the client and cleans up any resources associated with it.
  void close() {
    _client.endSession();
  }
}
