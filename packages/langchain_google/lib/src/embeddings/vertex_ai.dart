import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:vertex_ai/vertex_ai.dart';

/// {@template vertex_ai_embeddings}
/// Wrapper around GCP Vertex AI text embedding models API
///
/// Example:
/// ```dart
/// final embeddings = VertexAIEmbeddings(
///   httpClient: authClient,
///   project: 'your-project-id',
/// );
/// final result = await embeddings.embedQuery('Hello world');
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
/// To create an instance of `VertexAIEmbeddings` you need to provide an
/// HTTP client that handles authentication. The easiest way to do this is to
/// use [`AuthClient`](https://pub.dev/documentation/googleapis_auth/latest/googleapis_auth/AuthClient-class.html)
/// from the [googleapis_auth](https://pub.dev/packages/googleapis_auth)
/// package.
///
/// To create an instance of `VertexAIEmbeddings` you need to provide an
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
///   [VertexAIEmbeddings.cloudPlatformScope],
/// );
/// final vertexAi = VertexAIEmbeddings(
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
///   constant `VertexAIEmbeddings.cloudPlatformScope`)
///
/// See: https://cloud.google.com/vertex-ai/docs/generative-ai/access-control
///
/// ### Available models
///
/// - `textembedding-gecko`
///   * Max input token: 3072
///   * Output: 768-dimensional vector embeddings
/// - `textembedding-gecko-multilingual`: support over 100 non-English languages
///   * Max input token: 3072
///   * Output: 768-dimensional vector embeddings
///
/// The previous list of models may not be exhaustive or up-to-date. Check out
/// the [Vertex AI documentation](https://cloud.google.com/vertex-ai/docs/generative-ai/learn/models)
/// for the latest list of available models.
///
/// ### Task type
///
/// Embedding models released after August 2023 support specifying a
/// 'task type' when embedding documents. The task type is then used by the
/// model to improve the quality of the embeddings.
///
/// This class uses the specifies the following task type:
/// - `retrievalDocument`: for embedding documents
/// - `retrievalQuery`: for embedding queries
///
/// ### Title
///
/// Embedding models released after August 2023 support specifying a document
/// title when embedding documents. The title is then used by the model to
/// improve the quality of the embeddings.
///
/// To specify a document title, add the title to the document's metadata.
/// Then, specify the metadata key in the [docTitleKey] parameter.
///
/// Example:
/// ```dart
/// final embeddings = VertexAIEmbeddings(
///   httpClient: authClient,
///   project: 'your-project-id',
///   docTitleKey: 'title',
/// );
/// final result = await embeddings.embedDocuments([
///   Document(
///     pageContent: 'Hello world',
///     metadata: {'title': 'Hello!'},
///   ),
/// ]);
/// ```
/// {@endtemplate}
class VertexAIEmbeddings implements Embeddings {
  /// {@macro vertex_ai_embeddings}
  VertexAIEmbeddings({
    required final http.Client httpClient,
    required final String project,
    final String location = 'us-central1',
    final String? rootUrl,
    this.publisher = 'google',
    this.model = 'textembedding-gecko',
    this.batchSize = 5,
    this.docTitleKey = 'title',
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

  /// The embeddings model to use.
  ///
  /// To use the latest model version, specify the model name without a version
  /// number (e.g. `textembedding-gecko`).
  /// To use a stable model version, specify the model version number
  /// (e.g. `textembedding-gecko@001`).
  ///
  /// You can find a list of available models here:
  /// https://cloud.google.com/vertex-ai/docs/generative-ai/learn/models
  final String model;

  /// The maximum number of documents to embed in a single request.
  ///
  /// `textembedding-gecko` has a limit of up to 5 input texts per request.
  final int batchSize;

  /// The metadata key used to store the document's (optional) title.
  final String docTitleKey;

  /// Scope required for Vertex AI API calls.
  static const cloudPlatformScope = VertexAIGenAIClient.cloudPlatformScope;

  @override
  Future<List<List<double>>> embedDocuments(
    final List<Document> documents,
  ) async {
    final batches = chunkArray(documents, chunkSize: batchSize);

    final embeddings = await Future.wait(
      batches.map((final batch) async {
        final data = await client.textEmbeddings.predict(
          content: batch.map(
            (final doc) {
              final taskType = _getTaskType(
                defaultTaskType:
                    VertexAITextEmbeddingsModelTaskType.retrievalDocument,
              );
              final title = taskType ==
                      VertexAITextEmbeddingsModelTaskType.retrievalDocument
                  ? doc.metadata[docTitleKey]
                  : null;
              return VertexAITextEmbeddingsModelContent(
                taskType: taskType,
                title: title,
                content: doc.pageContent,
              );
            },
          ).toList(growable: false),
          publisher: publisher,
          model: model,
        );
        return data.predictions
            .map((final p) => p.values)
            .toList(growable: false);
      }),
    );

    return embeddings.expand((final e) => e).toList(growable: false);
  }

  @override
  Future<List<double>> embedQuery(final String query) async {
    final data = await client.textEmbeddings.predict(
      content: [
        VertexAITextEmbeddingsModelContent(
          taskType: _getTaskType(
            defaultTaskType: VertexAITextEmbeddingsModelTaskType.retrievalQuery,
          ),
          content: query,
        ),
      ],
      publisher: publisher,
      model: model,
    );
    return data.predictions.first.values;
  }

  VertexAITextEmbeddingsModelTaskType? _getTaskType({
    required final VertexAITextEmbeddingsModelTaskType defaultTaskType,
  }) {
    // Models released before August 2023 do not support taskType.
    // Currently 'textembedding-gecko' points to 'textembedding-gecko@001'
    // Ref: https://cloud.google.com/vertex-ai/docs/generative-ai/learn/model-versioning
    if (model == 'textembedding-gecko' || model == 'textembedding-gecko@001') {
      return null;
    }

    return VertexAITextEmbeddingsModelTaskType.retrievalDocument;
  }
}
