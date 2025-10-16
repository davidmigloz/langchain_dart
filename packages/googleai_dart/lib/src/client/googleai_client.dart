import 'dart:convert';

import 'package:http/http.dart' as http;

import '../interceptors/auth_interceptor.dart';
import '../interceptors/error_interceptor.dart';
import '../interceptors/logging_interceptor.dart';
import '../models/models/operation.dart';
import '../resources/batches_resource.dart';
import '../resources/cached_contents_resource.dart';
import '../resources/corpora_resource.dart';
import '../resources/files/files_resource.dart';
import '../resources/generated_files_resource.dart';
import '../resources/models_resource.dart';
import '../resources/rag_stores_resource.dart';
import '../resources/tuned_models_resource.dart';
import 'config.dart';
import 'interceptor_chain.dart';
import 'request_builder.dart';
import 'retry_wrapper.dart';

/// Main client for the GoogleAI API.
///
/// Provides access to all GoogleAI (Gemini) API resources through a
/// resource-based organization that mirrors the official REST API structure.
///
/// ## Resource Organization
///
/// API methods are grouped into logical resources:
/// - [models] - Content generation, embeddings, predictions, model info
/// - [tunedModels] - Custom tuned model management and generation
/// - [files] - File upload and management
/// - [generatedFiles] - Generated file (video) output management
/// - [cachedContents] - Context caching for cost/latency optimization
/// - [batches] - Batch operation management
/// - [corpora] - Corpus management for semantic retrieval
/// - [ragStores] - RAG store document management
///
/// ## Example Usage
///
/// ```dart
/// final client = GoogleAIClient(
///   config: GoogleAIConfig(
///     authProvider: ApiKeyProvider('YOUR_API_KEY'),
///   ),
/// );
///
/// // Generate content
/// final response = await client.models.generateContent(
///   model: 'gemini-2.5-flash',
///   request: GenerateContentRequest(
///     contents: [
///       Content(parts: [TextPart('Hello!')], role: 'user'),
///     ],
///   ),
/// );
///
/// // Upload a file
/// final file = await client.files.upload(
///   filePath: '/path/to/image.jpg',
///   mimeType: 'image/jpeg',
/// );
///
/// // Create a corpus
/// final corpus = await client.corpora.create(
///   corpus: Corpus(displayName: 'My Knowledge Base'),
/// );
///
/// client.close();
/// ```
class GoogleAIClient {
  /// Configuration.
  final GoogleAIConfig config;

  /// HTTP client.
  final http.Client _httpClient;

  /// Request builder.
  late final RequestBuilder _requestBuilder;

  /// Interceptor chain.
  late final InterceptorChain _interceptorChain;

  /// Resource for models API (generation, embeddings, predictions).
  late final ModelsResource models;

  /// Resource for tuned models API (custom model management).
  late final TunedModelsResource tunedModels;

  /// Resource for files API (file upload and management).
  late final FilesResource files;

  /// Resource for generated files API (video outputs).
  late final GeneratedFilesResource generatedFiles;

  /// Resource for cached contents API (context caching).
  late final CachedContentsResource cachedContents;

  /// Resource for batches API (batch operation management).
  late final BatchesResource batches;

  /// Resource for corpora API (semantic retrieval).
  late final CorporaResource corpora;

  /// Resource for RAG stores API (document management).
  late final RagStoresResource ragStores;

  /// Creates a [GoogleAIClient].
  ///
  /// Optionally accepts custom [config] for authentication and endpoint settings,
  /// and a custom [httpClient] for testing or advanced use cases.
  GoogleAIClient({
    GoogleAIConfig? config,
    http.Client? httpClient,
  }) : config = config ?? const GoogleAIConfig(),
       _httpClient = httpClient ?? http.Client() {
    _requestBuilder = RequestBuilder(config: this.config);

    // Interceptor order is Auth → Logging → Error
    // Retry wraps the transport layer, not in the interceptor chain
    _interceptorChain = InterceptorChain(
      httpClient: _httpClient,
      interceptors: [
        AuthInterceptor(config: this.config),
        LoggingInterceptor(config: this.config),
        const ErrorInterceptor(),
      ],
      retryWrapper: RetryWrapper(config: this.config),
    );

    // Initialize all API resources
    models = ModelsResource(
      config: this.config,
      httpClient: _httpClient,
      interceptorChain: _interceptorChain,
      requestBuilder: _requestBuilder,
    );

    tunedModels = TunedModelsResource(
      config: this.config,
      httpClient: _httpClient,
      interceptorChain: _interceptorChain,
      requestBuilder: _requestBuilder,
    );

    files = FilesResource(
      config: this.config,
      httpClient: _httpClient,
      interceptorChain: _interceptorChain,
      requestBuilder: _requestBuilder,
    );

    generatedFiles = GeneratedFilesResource(
      config: this.config,
      httpClient: _httpClient,
      interceptorChain: _interceptorChain,
      requestBuilder: _requestBuilder,
    );

    cachedContents = CachedContentsResource(
      config: this.config,
      httpClient: _httpClient,
      interceptorChain: _interceptorChain,
      requestBuilder: _requestBuilder,
    );

    batches = BatchesResource(
      config: this.config,
      httpClient: _httpClient,
      interceptorChain: _interceptorChain,
      requestBuilder: _requestBuilder,
    );

    corpora = CorporaResource(
      config: this.config,
      httpClient: _httpClient,
      interceptorChain: _interceptorChain,
      requestBuilder: _requestBuilder,
    );

    ragStores = RagStoresResource(
      config: this.config,
      httpClient: _httpClient,
      interceptorChain: _interceptorChain,
      requestBuilder: _requestBuilder,
    );
  }

  /// Gets the status of a long-running operation.
  ///
  /// This is a convenience method that works with any operation name, regardless
  /// of which resource it belongs to. For resource-specific operation methods,
  /// use the operations sub-resource on the parent resource (e.g.,
  /// `models.operations(model: ...).get()` or `tunedModels.operations(parent: ...).get()`).
  ///
  /// The [name] is the operation resource name (e.g., "operations/abc123",
  /// "tunedModels/my-model/operations/abc123").
  ///
  /// Returns the [Operation] with its current status.
  Future<Operation> getOperation({required String name}) async {
    final url = _requestBuilder.buildUrl('/v1beta/$name');

    final headers = _requestBuilder.buildHeaders();

    final httpRequest = http.Request('GET', url)..headers.addAll(headers);

    final response = await _interceptorChain.execute(httpRequest);

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    return Operation.fromJson(responseBody);
  }

  /// Closes the HTTP client and releases resources.
  ///
  /// Call this method when you're done using the client to free up resources.
  void close() {
    _httpClient.close();
  }
}
