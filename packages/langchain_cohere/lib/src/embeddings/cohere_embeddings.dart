import 'package:http/http.dart' as http;
import 'package:langchain_core/documents.dart';
import 'package:langchain_core/embeddings.dart';
import 'package:langchain_core/utils.dart';

import '../client/client.dart';

/// Wrapper around the [Cohere](https://docs.cohere.com) v2 Embed API.
///
/// Example:
/// ```dart
/// final embeddings = CohereEmbeddings(apiKey: '...');
/// final res = await embeddings.embedQuery('Hello world');
/// ```
///
/// - [Cohere Embed API docs](https://docs.cohere.com/reference/embed)
///
/// Cohere embedding models are optimized for the type of input they are
/// embedding. [embedDocuments] embeds using the `search_document` input type,
/// while [embedQuery] uses the `search_query` input type, as required by
/// Cohere for retrieval use cases.
///
/// ### Setup
///
/// To use `CohereEmbeddings` you need to have a Cohere account and an API key.
/// You can get one [here](https://dashboard.cohere.com/api-keys).
///
/// ### Available models
///
/// The following models are available at the moment:
/// - `embed-v4.0`: Cohere's most performant multimodal embedding model, with
///    a default embedding dimension of 1536 (256, 512 and 1024 also
///    available via [dimensions]).
/// - `embed-english-v3.0`: an English-only model with 1024 dimensions.
/// - `embed-multilingual-v3.0`: a multilingual model with 1024 dimensions.
/// - `embed-english-light-v3.0`: a smaller, faster English-only model with
///    384 dimensions.
///
/// Mind that this list may not be up-to-date.
/// Refer to the [documentation](https://docs.cohere.com/docs/models) for the updated list.
///
/// ### Advance
///
/// #### Custom HTTP client
///
/// You can always provide your own implementation of `http.Client` for further
/// customization:
///
/// ```dart
/// final client = CohereEmbeddings(
///   apiKey: 'COHERE_API_KEY',
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
/// final client = CohereEmbeddings(
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
class CohereEmbeddings extends Embeddings {
  /// Create a new [CohereEmbeddings] instance.
  ///
  /// Main configuration options:
  /// - `apiKey`: your Cohere API key. You can find your API key in the
  ///   [Cohere dashboard](https://dashboard.cohere.com/api-keys).
  /// - [CohereEmbeddings.model]
  /// - [CohereEmbeddings.batchSize]
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to Cohere's API URL. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  CohereEmbeddings({
    final String? apiKey,
    final String baseUrl = 'https://api.cohere.com',
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    this.model = 'embed-v4.0',
    this.dimensions,
    this.truncate,
    this.batchSize = 96,
  }) : _client = CohereClient(
         apiKey: apiKey,
         baseUrl: baseUrl,
         headers: headers,
         queryParams: queryParams,
         client: client,
       );

  /// A client for interacting with the Cohere API.
  final CohereClient _client;

  /// The embeddings model to use.
  final String model;

  /// The number of dimensions for output embeddings.
  /// Only supported by certain models (e.g. `embed-v4.0`).
  final int? dimensions;

  /// How to handle inputs longer than the maximum token length
  /// (`NONE`, `START` or `END`). Defaults to the API default (`END`).
  final String? truncate;

  /// The maximum number of texts to embed in a single request
  /// (the Cohere API allows up to 96).
  int batchSize;

  @override
  Future<List<List<double>>> embedDocuments(
    final List<Document> documents,
  ) async {
    final batches = chunkList(documents, chunkSize: batchSize);

    final embeddings = await Future.wait(
      batches.map((final batch) async {
        final data = await _client.embed(
          request: CohereEmbedRequest(
            model: model,
            texts: batch
                .map((final doc) => doc.pageContent)
                .toList(growable: false),
            inputType: CohereEmbeddingInputType.searchDocument,
            outputDimension: dimensions,
            truncate: truncate,
          ),
        );
        return data.embeddings;
      }),
    );

    return embeddings.expand((final e) => e).toList(growable: false);
  }

  @override
  Future<List<double>> embedQuery(final String query) async {
    final data = await _client.embed(
      request: CohereEmbedRequest(
        model: model,
        texts: [query],
        inputType: CohereEmbeddingInputType.searchQuery,
        outputDimension: dimensions,
        truncate: truncate,
      ),
    );
    // `CohereClient.embed` guarantees one embedding per input text, so exactly
    // one is present here. Returning `.first` surfaces a malformed/empty
    // response as an error instead of masking it as a zero-length vector.
    return data.embeddings.first;
  }

  /// Closes the client and cleans up any resources associated with it.
  void close() {
    _client.close();
  }
}
