# Vertex AI Matching Engine Setup

Script that creates a [Vertex AI Matching Engine](https://cloud.google.com/vertex-ai/docs/matching-engine/overview) 
index and index endpoint ready to be used with LangChains.dart 
[`VertexAIMatchingEngine`](https://pub.dev/documentation/langchain_google/latest/langchain_google/VertexAIMatchingEngine-class.html) 
vector store.

## Usage

1. Create a Cloud Storage bucket.
2. Create a test document and upload it to the bucket: `/documents/0.json`  
   JSON structure: `{"id": "0", "pageContent": "...", "metadata": {}}`
3. Create its embedding and place it in the bucket: /indexes/index.json  
   JSON structure: `{"id": "0", "embedding": [0.1, 0.2, 0.3, ...]}`
4. Change the config in the script (`projectId`, `projectLocation`, etc.)
5. Run this script: `dart run bin/vertex_ai_matching_engine_setup.dart`
6. The script will output the configuration for `VertexAIMatchingEngine`.

Example output:

```dart
final vectorStore = VertexAIMatchingEngine(
  authHttpClient: authClient,
  project: 'my-project-id',
  location: 'europe-west1',
  queryRootUrl: 'https://xxxxxxxxxx.europe-west1-xxxxxxxxxxxx.vdb.vertexai.goog/',
  indexId: 'xxxxxxxxxx',
  gcsBucketName: 'my_index_bucket',
  embeddings: embeddings,
);
```
