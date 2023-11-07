# Vertex AI Vector Search (former Vertex AI Matching Engine)

A vector store that uses [Vertex AI Vector Search](https://cloud.google.com/vertex-ai/docs/vector-search/overview).

Vertex AI Vector Search provides a high-scale low latency vector database.

This vector stores relies on two GCP services:
- Vertex AI Matching Engine: to store the vectors and perform similarity searches.
- Google Cloud Storage: to store the documents and the vectors to add to the index.

Currently it only supports Batch Updates, it doesn't support Streaming Updates. Batch Updates take around 1h to be applied to the index ([more info](https://cloud.google.com/vertex-ai/docs/matching-engine/update-rebuild-index#update_index_content_with_batch_updates)).

## Set up your Google Cloud Platform project

1. [Select or create a Google Cloud project](https://console.cloud.google.com/cloud-resource-manager).
2. [Make sure that billing is enabled for your project](https://cloud.google.com/billing/docs/how-to/modify-project).
3. [Enable the Vertex AI API](https://console.cloud.google.com/flows/enableapi?apiid=aiplatform.googleapis.com).
4. [Configure the Vertex AI location](https://cloud.google.com/vertex-ai/docs/general/locations).

## Create your Vertex AI Vector Search index

To use this vector store, first you need to create a Vertex AI Vector Search index and expose it in a Vertex AI index endpoint.

You can use [vertex_ai](https://pub.dev/packages/vertex_ai) Dart package to do that.

Check out [this sample](https://github.com/davidmigloz/langchain_dart/tree/main/examples/vertex_ai_matching_engine_setup) script that creates the index and index endpoint ready to be used with LangChains.dart.

## Authentication

To create an instance of `VertexAIMatchingEngine` you need to provide an HTTP client that handles authentication. The easiest way to do this is to use [`AuthClient`](https://pub.dev/documentation/googleapis_auth/latest/googleapis_auth/AuthClient-class.html) from the [googleapis_auth](https://pub.dev/packages/googleapis_auth) package.

There are several ways to obtain an `AuthClient` depending on your use case. Check out the [googleapis_auth](https://pub.dev/packages/googleapis_auth) package documentation for more details.

Example using a service account JSON:

```dart
final serviceAccountCredentials = ServiceAccountCredentials.fromJson(
  json.decode(serviceAccountJson),
);
final authClient = await clientViaServiceAccount(
  serviceAccountCredentials,
  VertexAIMatchingEngine.cloudPlatformScopes,
);
final vectorStore = VertexAIMatchingEngine(
  httpClient: authClient,
  project: 'your-project-id',
  location: 'europe-west1',
  indexId: 'your-index-id',
  gcsBucketName: 'your-gcs-bucket-name',
  embeddings: embeddings,
);
```

The minimum required permissions for the service account if you just need to query the index are:
- `aiplatform.indexes.get`
- `aiplatform.indexEndpoints.get`
- `aiplatform.indexEndpoints.queryVectors`
- `storage.objects.get`

If you also need to add new vectors to the index, the service account should have the following permissions as well:
- `aiplatform.indexes.update`
- `storage.objects.create`
- `storage.objects.update`

The required[OAuth2 scope](https://developers.google.com/identity/protocols/oauth2/scopes) is:
- `https://www.googleapis.com/auth/cloud-platform`
- `https://www.googleapis.com/auth/devstorage.full_control`

You can use the constant `VertexAIMatchingEngine.cloudPlatformScopes`.

## Vector attributes filtering

Vertex AI Matching Engine allows you to add attributes to the vectors that you can later use to restrict vector matching searches to a subset of the index.

To add attributes to the vectors, add a `restricts` key to the document metadata with the attributes that you want to add. For example:

```dart
final doc = Document(
 id: 'doc1',
 pageContent: 'The cat is a domestic species of small carnivorous mammal',
 metadata: {
   'restricts': [
     {
       'namespace': 'class',
       'allow': ['cat', 'pet']
     },
     {
       'namespace': 'category',
       'allow': ['feline']
     }
   ],
   'otherMetadata': '...',
 },
);
```

Check out [the documentation](https://cloud.google.com/vertex-ai/docs/matching-engine/filtering) for more details.

After adding the attributes to the documents, you can use the use them to restrict the similarity search results. Example:

```dart
final vectorStore = VertexAIMatchingEngine(...);
final res = await vectorStore.similaritySearch(
  query: 'What should I feed my cat?',
  config: VertexAIMatchingEngineSimilaritySearch(
    k: 5,
    scoreThreshold: 0.8,
    filters: [
      const VertexAIMatchingEngineFilter(
        namespace: 'class',
        allowList: ['cat'],
      ),
    ],
  ),
);
```
