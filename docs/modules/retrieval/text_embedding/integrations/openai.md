# OpenAIEmbeddings

You can use the `OpenAIEmbeddings` wrapper to consume OpenAI embedding models.

```dart
final openAiApiKey = Platform.environment['OPENAI_API_KEY'];
final embeddings = OpenAIEmbeddings(apiKey: openAiApiKey);

// Embedding a document
const doc = Document(pageContent: 'This is a test document.');
final res1 = await embeddings.embedDocuments([doc]);
print(res1);
// [[-0.003105443, 0.011136302, -0.0040295827, -0.011749065, ...]]

// Embedding a retrieval query
const text = 'This is a test query.';
final res2 = await embeddings.embedQuery(text);
print(res2);
// [-0.005047946, 0.0050882488, -0.0051957234, -0.019143905, ...]

embeddings.close();
```
