import 'package:googleapis_auth/googleapis_auth.dart';
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
/// The `VertexAI` wrapper delegates authentication to the
/// [googleapis_auth](https://pub.dev/packages/googleapis_auth) package.
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
///   authHttpClient: authClient,
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
/// {@endtemplate}
class VertexAI extends BaseLLM<VertexAIOptions> {
  /// {@macro vertex_ai}
  VertexAI({
    required final AuthClient authHttpClient,
    required final String project,
    final String location = 'us-central1',
    final String? rootUrl,
    this.publisher = 'google',
    this.model = 'text-bison',
    this.maxOutputTokens = 1024,
    this.temperature = 0.2,
    this.topP = 0.95,
    this.topK = 40,
  }) : client = VertexAIGenAIClient(
          authHttpClient: authHttpClient,
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

  /// Maximum number of tokens that can be generated in the response. A token
  /// is approximately four characters. 100 tokens correspond to roughly
  /// 60-80 words.
  ///
  /// Specify a lower value for shorter responses and a higher value for longer
  /// responses.
  ///
  /// Range: [1, 1024]
  final int maxOutputTokens;

  /// The temperature is used for sampling during response generation, which
  /// occurs when topP and topK are applied. Temperature controls the degree of
  /// randomness in token selection. Lower temperatures are good for prompts
  /// that require a more deterministic and less open-ended or creative
  /// response, while higher temperatures can lead to more diverse or creative
  /// results. A temperature of 0 is deterministic, meaning that the highest
  /// probability response is always selected.
  ///
  /// For most use cases, try starting with a temperature of 0.2. If the model
  /// returns a response that's too generic, too short, or the model gives a
  /// fallback response, try increasing the temperature.
  ///
  /// Range: [0.0, 1.0]
  final double temperature;

  /// Top-P changes how the model selects tokens for output. Tokens are
  /// selected from the most (see top-K) to least probable until the sum of
  /// their probabilities equals the top-P value. For example, if tokens A, B,
  /// and C have a probability of 0.3, 0.2, and 0.1 and the top-P value is 0.5,
  /// then the model will select either A or B as the next token by using
  /// temperature and excludes C as a candidate.
  ///
  /// Specify a lower value for less random responses and a higher value for
  /// more random responses.
  ///
  /// Range: [0.0, 1.0]
  final double topP;

  /// Top-K changes how the model selects tokens for output. A top-K of 1 means
  /// the next selected token is the most probable among all tokens in the
  /// model's vocabulary (also called greedy decoding), while a top-K of 3
  /// means that the next token is selected from among the three most probable
  /// tokens by using temperature.
  ///
  /// For each token selection step, the top-K tokens with the highest
  /// probabilities are sampled. Then tokens are further filtered based on
  /// top-P with the final token selected using temperature sampling.
  ///
  /// Specify a lower value for less random responses and a higher value for
  /// more random responses.
  ///
  /// Range: [1, 40]
  final int topK;

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
        maxOutputTokens: maxOutputTokens,
        temperature: temperature,
        topP: topP,
        topK: topK,
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
  Future<List<int>> tokenize(final PromptValue promptValue) async {
    final encoding = encodingForModel('text-davinci-003');
    return encoding.encode(promptValue.toString());
  }
}
