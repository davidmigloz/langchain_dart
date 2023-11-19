import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:tiktoken/tiktoken.dart';
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
    this.publisher = 'google',
    this.model = 'text-bison',
    this.defaultOptions = const VertexAIOptions(),
  }) : client = VertexAIGenAIClient(
          httpClient: httpClient,
          project: project,
          location: location,
          rootUrl: rootUrl ?? 'https://$location-aiplatform.googleapis.com/',
        );

  /// A client for interacting with Vertex AI API.
  final VertexAIGenAIClient client;

  /// The publisher of the model.
  ///
  /// Use `google` for first-party models.
  final String publisher;

  /// The text model to use.
  ///
  /// To use the latest model version, specify the model name without a version
  /// number (e.g. `text-bison`).
  /// To use a stable model version, specify the model version number
  /// (e.g. `text-bison@001`).
  ///
  /// You can find a list of available models here:
  /// https://cloud.google.com/vertex-ai/docs/generative-ai/learn/models
  final String model;

  /// The default options to use when calling the model.
  final VertexAIOptions defaultOptions;

  /// Scope required for Vertex AI API calls.
  static const cloudPlatformScope = VertexAIGenAIClient.cloudPlatformScope;

  @override
  String get modelType => 'vertex-ai';

  @override
  Future<LLMResult> generate(
    final String prompt, {
    final VertexAIOptions? options,
  }) async {
    final result = await client.text.predict(
      prompt: prompt,
      publisher: publisher,
      model: model,
      parameters: VertexAITextModelRequestParams(
        maxOutputTokens:
            options?.maxOutputTokens ?? defaultOptions.maxOutputTokens,
        temperature: options?.temperature ?? defaultOptions.temperature,
        topP: options?.topP ?? defaultOptions.topP,
        topK: options?.topK ?? defaultOptions.topK,
        stopSequences: options?.stopSequences ?? defaultOptions.stopSequences,
        candidateCount:
            options?.candidateCount ?? defaultOptions.candidateCount,
      ),
    );
    return result.toLLMResult(model);
  }

  /// Tokenizes the given prompt using tiktoken.
  ///
  /// Currently Google does not provide a tokenizer for Vertex AI models.
  /// So we use tiktoken and text-davinci-003 model to get an approximation
  /// for counting tokens. Mind that the actual tokens will be totally
  /// different from the ones used by the Vertex AI model.
  ///
  /// - [promptValue] The prompt to tokenize.
  @override
  Future<List<int>> tokenize(
    final PromptValue promptValue, {
    final VertexAIOptions? options,
  }) async {
    final encoding = encodingForModel('text-davinci-003');
    return encoding.encode(promptValue.toString());
  }
}
