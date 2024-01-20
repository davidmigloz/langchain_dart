# Vertex AI API Client

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![vertex_ai](https://img.shields.io/pub/v/vertex_ai.svg)](https://pub.dev/packages/vertex_ai)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Unofficial Dart client for the [Vertex AI](https://cloud.google.com/vertex-ai) API.

## Features

- [Generative AI](https://cloud.google.com/vertex-ai/docs/generative-ai/learn/overview)
  * Text models
  * Text chat models
  * Text embeddings models
- [Matching Engine](https://cloud.google.com/vertex-ai/docs/matching-engine/overview)
  * Create and manage indexes and index endpoints
  * Query indexes

## Generative AI

[Generative AI](https://cloud.google.com/vertex-ai/docs/generative-ai/learn/overview) 
support on Vertex AI (also known as `genai`) gives you access to Google's large 
generative AI models so you can use in your AI-powered applications.

### Authentication

The `VertexAIGenAIClient` delegates authentication to the 
[googleapis_auth](https://pub.dev/packages/googleapis_auth) package. 

To create an instance of `VertexAIGenAIClient` you need to provide an
[`AuthClient`](https://pub.dev/documentation/googleapis_auth/latest/googleapis_auth/AuthClient-class.html) 
instance.

There are several ways to obtain an `AuthClient` depending on your use case.
Check out the [googleapis_auth](https://pub.dev/packages/googleapis_auth) 
package documentation for more details.

Example using a service account JSON:

```dart
final serviceAccountCredentials = ServiceAccountCredentials.fromJson(
  json.decode(serviceAccountJson),
);
final authClient = await clientViaServiceAccount(
  serviceAccountCredentials,
  [VertexAIGenAIClient.cloudPlatformScope],
);
final vertexAi = VertexAIGenAIClient(
  authHttpClient: authClient,
  project: 'your-project-id',
);
```

The service account should have the following
[permission](https://cloud.google.com/vertex-ai/docs/general/iam-permissions):
- `aiplatform.endpoints.predict`

The required[OAuth2 scope](https://developers.google.com/identity/protocols/oauth2/scopes) 
is:
- `https://www.googleapis.com/auth/cloud-platform` (you can use the constant 
  `VertexAIGenAIClient.cloudPlatformScope`)

### Text models

[PaLM API for text](https://cloud.google.com/vertex-ai/docs/generative-ai/model-reference/text) 
is fine-tuned for language tasks such as classification, summarization, and 
entity extraction.

```dart
final res = await vertexAi.text.predict(
  prompt: 'What is the purpose of life?',
);
```

### Chat models

[PaLM API for chat](https://cloud.google.com/vertex-ai/docs/generative-ai/model-reference/text-chat) 
is fine-tuned for multi-turn chat, where the model keeps track of previous 
messages in the chat and uses it as context for generating new responses.

```dart
final res = await vertexAi.chat.predict(
  context: 'I want you to act as a Socrat.',
  messages: const [
    VertexAIChatModelMessage(
      author: 'USER',
      content: 'Is justice neccessary in a society?',
    ),
  ],
);
```

### Text embeddings

The [Text Embedding API](https://cloud.google.com/vertex-ai/docs/generative-ai/model-reference/text-embeddings) 
generates vector embeddings for input text. You can use embeddings for tasks 
like semantic search, recommendation, classification, and outlier detection.

```dart
final res = await vertexAi.textEmbeddings.predict(
  content: [
    const VertexAITextEmbeddingsModelContent(
      taskType: VertexAITextEmbeddingsModelTaskType.retrievalDocument,
      title: 'The Paradox of Wisdom',
      content: 'The only true wisdom is in knowing you know nothing',
    ),
);
```

## Matching Engine

[Vertex AI Matching Engine](https://cloud.google.com/vertex-ai/docs/matching-engine/overview) 
provides the industry's leading high-scale low latency vector database. These 
vector databases are commonly referred to as vector similarity-matching or an 
approximate nearest neighbor (ANN) service.

Matching Engine provides tooling to build use cases that match semantically 
similar items. More specifically, given a query item, Matching Engine finds the 
most semantically similar items to it from a large corpus of candidate items.

### Authentication

The `VertexAIMatchingEngineClient` delegates authentication to the
[googleapis_auth](https://pub.dev/packages/googleapis_auth) package.

To create an instance of `VertexAIMatchingEngineClient` you need to provide
an [`AuthClient`](https://pub.dev/documentation/googleapis_auth/latest/googleapis_auth/AuthClient-class.html)
instance.

There are several ways to obtain an `AuthClient` depending on your use case.
Check out the [googleapis_auth](https://pub.dev/packages/googleapis_auth)
package documentation for more details.

Example using a service account JSON:
```dart
final serviceAccountCredentials = ServiceAccountCredentials.fromJson(
  json.decode(serviceAccountJson),
);
final authClient = await clientViaServiceAccount(
  serviceAccountCredentials,
  [VertexAIGenAIClient.cloudPlatformScope],
);
final vertexAi = VertexAIMatchingEngineClient(
  authHttpClient: authClient,
  project: 'your-project-id',
  location: 'europe-west1',
);
```

To be able to create and manage indexes and index endpoints, the service
account should have the following [permissions](https://cloud.google.com/vertex-ai/docs/general/iam-permissions):
- `aiplatform.indexes.create`
- `aiplatform.indexes.get`
- `aiplatform.indexes.list`
- `aiplatform.indexes.update`
- `aiplatform.indexes.delete`
- `aiplatform.indexEndpoints.create`
- `aiplatform.indexEndpoints.get`
- `aiplatform.indexEndpoints.list`
- `aiplatform.indexEndpoints.update`
- `aiplatform.indexEndpoints.delete`
- `aiplatform.indexEndpoints.deploy`
- `aiplatform.indexEndpoints.undeploy`
 
If you just want to query an index endpoint, the service account only needs:
- `aiplatform.indexEndpoints.queryVectors`

The required[OAuth2 scope](https://developers.google.com/identity/protocols/oauth2/scopes)
  is:
- `https://www.googleapis.com/auth/cloud-platform` (you can use the constant
  `VertexAIMatchingEngineClient.cloudPlatformScope`)
  See: https://cloud.google.com/vertex-ai/docs/generative-ai/access-control

### Create an index

1. Generate embeddings for your data and save them to a file (see supported 
   formats [here](https://cloud.google.com/vertex-ai/docs/matching-engine/match-eng-setup/format-structure)).
2. Create a Cloud Storage bucket and upload the embeddings file.
3. Create the index:

```dart
final operation = await marchingEngine.indexes.create(
  displayName: 'test-index',
  description: 'This is a test index',
  metadata: const VertexAINearestNeighborSearch(
    contentsDeltaUri: 'gs://bucket-name/path-to-index-dir',
    config: VertexAINearestNeighborSearchConfig(
      dimensions: 768,
      algorithmConfig: VertexAITreeAhAlgorithmConfig(),
    ),
  ),
);
```

To check the status of the operation: 

```dart
final operation = await marchingEngine.indexes.operations.get(
  name: operation.name,
);
print(operation.done);
```

### Get index information

```dart
final index = await marchingEngine.indexes.get(id: '5086059315115065344');
```

You can also list all indexes:

```dart
final indexes = await marchingEngine.indexes.list();
```

### Update an index

```dart
final res = await marchingEngine.indexes.update(
  id: '5086059315115065344',
  metadata: const VertexAIIndexRequestMetadata(
    contentsDeltaUri: 'gs://bucket-name/path-to-index-dir',
    isCompleteOverwrite: true,
  ),
);
```

### Create an index endpoint

```dart
final operation = await marchingEngine.indexEndpoints.create(
  displayName: 'test-index-endpoint',
  description: 'This is a test index endpoint',
  publicEndpointEnabled: true,
);
```

To check the status of the operation:

```dart
final operation = await marchingEngine.indexEndpoints.operations.get(
  name: operation.name,
);
print(operation.done);
```

### Deploy an index to an index endpoint

```dart
final operation = await marchingEngine.indexEndpoints.deployIndex(
  indexId: '5086059315115065344',
  indexEndpointId: '8572232454792807200',
  deployedIndexId: 'deployment1',
  deployedIndexDisplayName: 'test-deployed-index',
);
```

You can check the status of the operation as shown above.

If you want to enable autoscaling:

```dart
final operation = await marchingEngine.indexEndpoints.deployIndex(
  indexId: '5086059315115065344',
  indexEndpointId: '8572232454792807200',
  deployedIndexId: 'deployment1',
  deployedIndexDisplayName: 'test-deployed-index',
  automaticResources: const VertexAIAutomaticResources(
    minReplicaCount: 2,
    maxReplicaCount: 10,
  ),
);
```

### Get index endpoint information

```dart
final ie = await marchingEngine.indexEndpoints.get(id: '8572232454792807200');
```

You can also list all index endpoints:

```dart
final indexEndpoints = await marchingEngine.indexEndpoints.list();
```

### Mutate index endpoint

```dart
final operation = await marchingEngine.indexEndpoints.mutateDeployedIndex(
  indexEndpointId: '8572232454792807200',
  deployedIndexId: 'deployment1',
  automaticResources: const VertexAIAutomaticResources(
    minReplicaCount: 2,
    maxReplicaCount: 20,
  ),
);
```

### Undeploy an index from an index endpoint

```dart
final operation = await marchingEngine.indexEndpoints.undeployIndex(
  indexEndpointId: '8572232454792807200',
  deployedIndexId: 'deployment1',
);
```

### Delete an index endpoint

```dart
final operation = await marchingEngine.indexEndpoints.delete(
  id: '8572232454792807200',
);
```

### Delete an index

```dart
final operation = await marchingEngine.indexes.delete(
  id: '5086059315115065344',
);
```

### Query an index using the index endpoint

Once you've created the index, you can run queries to get its nearest neighbors.

Mind that you will need a different `VertexAIMatchingEngineClient` for 
calling this method, as the public query endpoint has a different `rootUrl` 
than the rest of the API (e.g. https://xxxxxxxxxx.europe-west1-xxxxxxxxxxxx.vdb.vertexai.goog).

Check the `VertexAIIndexEndpoint.publicEndpointDomainName` of your index 
endpoint by calling `VertexAIMatchingEngineClient.indexEndpoints.get`. Then 
create a new client setting the [VertexAIMatchingEngineClient.rootUrl] to that 
value (mind that you need to add `https://` to the beginning of the domain 
name).

```dart
final machineEngineQuery = VertexAIMatchingEngineClient(
  authHttpClient: authClient,
  project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
  rootUrl:
      'https://1451028333.europe-west1-706285145444.vdb.vertexai.goog/',
);
final res = await machineEngineQuery.indexEndpoints.findNeighbors(
  indexEndpointId: '8572232454792807200',
  deployedIndexId: 'deployment1',
  queries: const [
    VertexAIFindNeighborsRequestQuery(
      datapoint: VertexAIIndexDatapoint(
        datapointId: 'your-datapoint-id',
        featureVector: [-0.0024800552055239677, 0.011974085122346878, ...],
      ),
      neighborCount: 3,
    ),
  ],
);
```

Docs: https://cloud.google.com/vertex-ai/docs/matching-engine/query-index-public-endpoint

## License

Vertex AI API Client is licensed under the [MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
