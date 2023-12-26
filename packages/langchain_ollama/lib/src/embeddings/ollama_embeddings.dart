import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:ollama_dart/ollama_dart.dart';

/// Wrapper around [Ollama](https://ollama.ai) Embeddings API.
///
/// Ollama allows you to run open-source large language models,
/// such as Llama 2, locally.
///
/// For a complete list of supported models and model variants, see the
/// [Ollama model library](https://ollama.ai/library).
///
/// Example:
/// ```dart
/// final embeddings = OllamaEmbeddings(model: 'llama2');
/// final res = await embeddings.embedQuery('Hello world');
/// ```
///
/// - [Ollama API docs](https://github.com/jmorganca/ollama/blob/main/docs/api.md#generate-embeddings)
///
/// ### Setup
///
/// 1. Download and install [Ollama](https://ollama.ai)
/// 2. Fetch a model via `ollama pull <model family>`
///   * e.g., for `Llama-7b`: `ollama pull llama2`
///
/// ### Advance
///
/// #### Custom HTTP client
///
/// You can always provide your own implementation of `http.Client` for further
/// customization:
///
/// ```dart
/// final client = Ollama(
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
/// final client = Ollama(
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
class OllamaEmbeddings implements Embeddings {
  /// Create a new [OllamaEmbeddings] instance.
  ///
  /// Main configuration options:
  /// - `baseUrl`: the base URL of Ollama API.
  ///
  /// Advance configuration options:
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  OllamaEmbeddings({
    this.model = 'llama2',
    final String baseUrl = 'http://localhost:11434/api',
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
  }) : _client = OllamaClient(
          baseUrl: baseUrl,
          headers: headers,
          queryParams: queryParams,
          client: client,
        );

  /// A client for interacting with Ollama API.
  final OllamaClient _client;

  /// The embeddings model to use.
  final String model;

  @override
  Future<List<List<double>>> embedDocuments(
    final List<Document> documents,
  ) async {
    final embeddings = <List<double>>[];
    for (final doc in documents) {
      final data = await _client.generateEmbedding(
        request: GenerateEmbeddingRequest(
          model: model,
          prompt: doc.pageContent,
        ),
      );
      embeddings.add(data.embedding ?? []);
    }
    return embeddings;
  }

  @override
  Future<List<double>> embedQuery(final String query) async {
    final data = await _client.generateEmbedding(
      request: GenerateEmbeddingRequest(
        model: model,
        prompt: query,
      ),
    );
    return data.embedding ?? [];
  }

  /// Closes the client and cleans up any resources associated with it.
  void close() {
    _client.endSession();
  }
}
