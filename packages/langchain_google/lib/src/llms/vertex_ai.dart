import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:vertex_ai/vertex_ai.dart';

import 'models/mappers.dart';
import 'models/models.dart';

/// {@template vertex_ai}
/// Wrapper around GCP Vertex AI text models API (aka PaLM API for text).
///
/// Example:
/// ```dart
/// final llm = VertexAI(
///   authHttpClient: authClient,
///   project: 'your-project-id',
/// );
/// final result = await llm('Hello world!');
/// ```
///
/// Vertex AI documentation:
/// https://cloud.google.com/vertex-ai/docs/generative-ai/language-model-overview
///
/// ### Set up your Google Cloud Platform project
///
/// 1. [Select or create a Google Cloud project](https://console.cloud.google.com/cloud-resource-manager).
/// 2. [Make sure that billing is enabled for your project](https://cloud.google.com/billing/docs/how-to/modify-project).
/// 3. [Enable the Vertex AI API](https://console.cloud.google.com/flows/enableapi?apiid=aiplatform.googleapis.com).
/// 4. [Configure the Vertex AI location](https://cloud.google.com/vertex-ai/docs/general/locations).
///
/// ### Authentication
///
/// To create an instance of `VertexAI` you need to provide an
/// HTTP client that handles authentication. The easiest way to do this is to
/// use [`AuthClient`](https://pub.dev/documentation/googleapis_auth/latest/googleapis_auth/AuthClient-class.html)
/// from the [googleapis_auth](https://pub.dev/packages/googleapis_auth)
/// package.
///
/// To create an instance of `VertexAI` you need to provide an
/// [`AuthClient`](https://pub.dev/documentation/googleapis_auth/latest/googleapis_auth/AuthClient-class.html)
/// instance.
///
/// There are several ways to obtain an `AuthClient` depending on your use case.
/// Check out the [googleapis_auth](https://pub.dev/packages/googleapis_auth)
/// package documentation for more details.
///
/// Example using a service account JSON:
///
/// ```dart
/// final serviceAccountCredentials = ServiceAccountCredentials.fromJson(
///   json.decode(serviceAccountJson),
/// );
/// final authClient = await clientViaServiceAccount(
///   serviceAccountCredentials,
///   [VertexAI.cloudPlatformScope],
/// );
/// final vertexAi = VertexAI(
///   httpClient: authClient,
///   project: 'your-project-id',
/// );
/// ```
///
/// The service account should have the following
/// [permission](https://cloud.google.com/vertex-ai/docs/general/iam-permissions):
/// - `aiplatform.endpoints.predict`
///
/// The required[OAuth2 scope](https://developers.google.com/identity/protocols/oauth2/scopes)
/// is:
/// - `https://www.googleapis.com/auth/cloud-platform` (you can use the
///   constant `VertexAI.cloudPlatformScope`)
///
/// See: https://cloud.google.com/vertex-ai/docs/generative-ai/access-control
///
/// ### Available models
///
/// - `text-bison`
///   * Max input token: 8192
///   * Max output tokens: 1024
///   * Training data: Up to Feb 2023
/// - `text-bison-32k`
///   * Max input and output tokens combined: 32k
///   * Training data: Up to Aug 2023
/// - `text-unicorn`
///   * Max input token: 8192
///   * Max output tokens: 1024
///   * Training data: Up to Feb 2023
///
/// The previous list of models may not be exhaustive or up-to-date. Check out
/// the [Vertex AI documentation](https://cloud.google.com/vertex-ai/docs/generative-ai/learn/models)
/// for the latest list of available models.
///
/// ### Model options
///
/// You can define default options to use when calling the model (e.g.
/// temperature, stop sequences, etc. ) using the [defaultOptions] parameter.
///
/// The default options can be overridden when calling the model using the
/// `options` parameter.
///
/// Example:
/// ```dart
/// final llm = VertexAI(
///   httpClient: authClient,
///   project: 'your-project-id',
///   defaultOptions: VertexAIOptions(
///     temperature: 0.9,
///   ),
/// );
/// final result = await llm(
///   'Hello world!',
///   options: VertexAIOptions(
///     temperature: 0.5,
///    ),
/// );
/// ```
/// {@endtemplate}
class VertexAI extends BaseLLM<VertexAIOptions> {
  /// {@macro vertex_ai}
  VertexAI({
    required final http.Client httpClient,
    required final String project,
    final String location = 'us-central1',
    final String? rootUrl,
    this.defaultOptions = const VertexAIOptions(
      publisher: 'google',
      model: 'text-bison',
    ),
  }) : client = VertexAIGenAIClient(
          httpClient: httpClient,
          project: project,
          location: location,
          rootUrl: rootUrl ?? 'https://$location-aiplatform.googleapis.com/',
        );

  /// A client for interacting with Vertex AI API.
  final VertexAIGenAIClient client;

  /// The default options to use when calling the model.
  VertexAIOptions defaultOptions;

  /// Scope required for Vertex AI API calls.
  static const cloudPlatformScope = VertexAIGenAIClient.cloudPlatformScope;

  @override
  String get modelType => 'vertex-ai';

  @override
  Future<LLMResult> generate(
    final String prompt, {
    final VertexAIOptions? options,
  }) async {
    final model =
        options?.model ?? defaultOptions.model ?? throwNullModelError();
    final result = await client.text.predict(
      prompt: prompt,
      publisher: options?.publisher ??
          ArgumentError.checkNotNull(
            defaultOptions.publisher,
            'VertexAIOptions.publisher',
          ),
      model: model,
      parameters: VertexAITextModelRequestParams(
        maxOutputTokens:
            options?.maxOutputTokens ?? defaultOptions.maxOutputTokens ?? 1024,
        temperature: options?.temperature ?? defaultOptions.temperature ?? 0.2,
        topP: options?.topP ?? defaultOptions.topP ?? 0.95,
        topK: options?.topK ?? defaultOptions.topK ?? 40,
        stopSequences:
            options?.stopSequences ?? defaultOptions.stopSequences ?? const [],
        candidateCount:
            options?.candidateCount ?? defaultOptions.candidateCount ?? 1,
      ),
    );
    return result.toLLMResult(model);
  }

  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final VertexAIOptions? options,
  }) async {
    throw UnsupportedError(
      'VertexAI does not support tokenize, only countTokens',
    );
  }

  @override
  Future<int> countTokens(
    final PromptValue promptValue, {
    final VertexAIOptions? options,
  }) async {
    final model =
        options?.model ?? defaultOptions.model ?? throwNullModelError();
    final res = await client.text.countTokens(
      prompt: promptValue.toString(),
      publisher: options?.publisher ??
          ArgumentError.checkNotNull(
            defaultOptions.publisher,
            'VertexAIOptions.publisher',
          ),
      model: model,
    );
    return res.totalTokens;
  }
}
