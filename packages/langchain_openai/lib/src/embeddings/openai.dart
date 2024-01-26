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
/// You can also use this wrapper to consume OpenAI-compatible APIs like
/// [Anyscale](https://www.anyscale.com), [Together AI](https://www.together.ai), etc.
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
/// #### Azure OpenAI Service
///
/// OpenAI's models are also available as an [Azure service](https://learn.microsoft.com/en-us/azure/ai-services/openai/overview).
///
/// Although the Azure OpenAI API is similar to the official OpenAI API, there
/// are subtle differences between them. This client is intended to be used
/// with the official OpenAI API, but most of the functionality should work
/// with the Azure OpenAI API as well.
///
/// If you want to use this client with the Azure OpenAI API (at your own risk),
/// you can do so by instantiating the client as follows:
///
/// ```dart
/// final client = OpenAIEmbeddings(
///   baseUrl: 'https://YOUR_RESOURCE_NAME.openai.azure.com/openai/deployments/YOUR_DEPLOYMENT_NAME',
///   headers: { 'api-key': 'YOUR_API_KEY' },
///   queryParams: { 'api-version': 'API_VERSION' },
/// );
/// ```
///
/// - `YOUR_RESOURCE_NAME`: This value can be found in the Keys & Endpoint
///    section when examining your resource from the Azure portal.
/// - `YOUR_DEPLOYMENT_NAME`: This value will correspond to the custom name
///    you chose for your deployment when you deployed a model. This value can be found under Resource Management > Deployments in the Azure portal.
/// - `YOUR_API_KEY`: This value can be found in the Keys & Endpoint section
///    when examining your resource from the Azure portal.
/// - `API_VERSION`: The Azure OpenAI API version to use (e.g. `2023-05-15`).
///    Try to use the [latest version available](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/cognitiveservices/data-plane/AzureOpenAI/inference),
///    it will probably be the closest to the official OpenAI API.
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
  /// - [OpenAIEmbeddings.dimensions]
  /// - [OpenAIEmbeddings.batchSize]
  /// - [OpenAIEmbeddings.user]
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to OpenAI's API URL. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters (e.g. Azure OpenAI API
  ///   required to attach a `version` query parameter to every request).
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  OpenAIEmbeddings({
    final String? apiKey,
    final String? organization,
    final String baseUrl = 'https://api.openai.com/v1',
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
    this.model = 'text-embedding-3-small',
    this.dimensions,
    this.batchSize = 512,
    this.user,
  }) : _client = OpenAIClient(
          apiKey: apiKey ?? '',
          organization: organization,
          baseUrl: baseUrl,
          headers: headers,
          queryParams: queryParams,
          client: client,
        );

  /// A client for interacting with OpenAI API.
  final OpenAIClient _client;

  /// ID of the model to use (e.g. 'text-embedding-3-small').
  ///
  /// Available models:
  /// - `text-embedding-3-small`
  /// - `text-embedding-3-large`
  /// - `text-embedding-ada-002`
  ///
  /// Mind that the list may be outdated.
  /// See https://platform.openai.com/docs/models for the latest list.
  String model;

  /// The number of dimensions the resulting output embeddings should have.
  /// Only supported in `text-embedding-3` and later models.
  int? dimensions;

  /// The maximum number of documents to embed in a single request.
  /// This is limited by max input tokens for the model
  /// (e.g. 8191 tokens for text-embedding-3-small).
  int batchSize;

  /// A unique identifier representing your end-user, which can help OpenAI to
  /// monitor and detect abuse.
  ///
  /// Ref: https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids
  String? user;

  /// Set or replace the API key.
  set apiKey(final String value) => _client.apiKey = value;

  /// Get the API key.
  String get apiKey => _client.apiKey;

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
            model: EmbeddingModel.modelId(model),
            input: EmbeddingInput.listString(
              batch.map((final doc) => doc.pageContent).toList(growable: false),
            ),
            dimensions: dimensions,
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
        model: EmbeddingModel.modelId(model),
        input: EmbeddingInput.string(query),
        dimensions: dimensions,
        user: user,
      ),
    );
    return data.data.first.embeddingVector;
  }

  /// Closes the client and cleans up any resources associated with it.
  void close() {
    _client.endSession();
  }
}
