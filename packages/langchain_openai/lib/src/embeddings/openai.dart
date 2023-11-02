import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:openai_dart/openai_dart.dart';

/// Wrapper around OpenAI Embeddings API.
///
/// Example:
/// ```dart
/// final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);
/// final res = await embeddings.embedQuery('Hello world');
/// ```
///
/// - [Embeddings guide](https://platform.openai.com/docs/guides/embeddings/limitations-risks)
/// - [Embeddings API docs](https://platform.openai.com/docs/api-reference/embeddings)
///
/// ### Authentication
///
/// The OpenAI API uses API keys for authentication. Visit your
/// [API Keys](https://platform.openai.com/account/api-keys) page to retrieve
/// the API key you'll use in your requests.
///
/// #### Organization (optional)
///
/// For users who belong to multiple organizations, you can specify which
/// organization is used for an API request. Usage from these API requests will
/// count against the specified organization's subscription quota.
///
/// ```dart
/// final client = OpenAIEmbeddings(
///   apiKey: 'OPENAI_API_KEY',
///   organization: 'org-dtDDtkEGoFccn5xaP5W1p3Rr',
/// );
/// ```
///
/// ### Advance
///
/// #### Custom HTTP client
///
/// You can always provide your own implementation of `http.Client` for further
/// customization:
///
/// ```dart
/// final client = OpenAIEmbeddings(
///   apiKey: 'OPENAI_API_KEY',
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
/// final client = OpenAIEmbeddings(
///   baseUrl: 'https://my-proxy.com',
///   headers: {'x-my-proxy-header': 'value'},
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
class OpenAIEmbeddings implements Embeddings {
  /// Create a new [OpenAIEmbeddings] instance.
  ///
  /// Main configuration options:
  /// - `apiKey`: your OpenAI API key. You can find your API key in the
  ///   [OpenAI dashboard](https://platform.openai.com/account/api-keys).
  /// - `organization`: your OpenAI organization ID (if applicable).
  /// - [OpenAIEmbeddings.model]
  /// - [OpenAIEmbeddings.batchSize]
  /// - [OpenAIEmbeddings.user]
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to OpenAI's API URL. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  OpenAIEmbeddings({
    final String? apiKey,
    final String? organization,
    final String? baseUrl,
    final Map<String, String>? headers,
    final http.Client? client,
    this.model = 'text-embedding-ada-002',
    this.batchSize = 512,
    this.user,
  }) : _client = OpenAIClient(
          apiKey: apiKey ?? '',
          organization: organization,
          baseUrl: baseUrl,
          headers: headers,
          client: client,
        );

  /// A client for interacting with OpenAI API.
  final OpenAIClient _client;

  /// ID of the model to use (e.g. 'text-embedding-ada-002').
  ///
  /// See https://platform.openai.com/docs/api-reference/embeddings/create#embeddings-create-model
  final String model;

  /// The maximum number of documents to embed in a single request.
  /// This is limited by max input tokens for the model
  /// (e.g. 8191 tokens for text-embedding-ada-002).
  final int batchSize;

  /// A unique identifier representing your end-user, which can help OpenAI to
  /// monitor and detect abuse.
  ///
  /// Ref: https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids
  final String? user;

  @override
  Future<List<List<double>>> embedDocuments(
    final List<Document> documents,
  ) async {
    // TODO use tiktoken to chunk documents that exceed the context length of the model
    final batches = chunkArray(documents, chunkSize: batchSize);

    final embeddings = await Future.wait(
      batches.map((final batch) async {
        final data = await _client.createEmbedding(
          request: CreateEmbeddingRequest(
            model: EmbeddingModel.string(model),
            input: EmbeddingInput.arrayString(
              batch.map((final doc) => doc.pageContent).toList(growable: false),
            ),
            user: user,
          ),
        );
        return data.data.map((final d) => d.embeddingVector);
      }),
    );

    return embeddings.expand((final e) => e).toList(growable: false);
  }

  @override
  Future<List<double>> embedQuery(final String query) async {
    final data = await _client.createEmbedding(
      request: CreateEmbeddingRequest(
        model: EmbeddingModel.string(model),
        input: EmbeddingInput.string(query),
        user: user,
      ),
    );
    return data.data.first.embeddingVector;
  }
}
