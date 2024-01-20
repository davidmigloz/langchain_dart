# Together AI Embeddings

[Together AI](https://www.together.ai/) offers several leading [embedding models](https://docs.together.ai/docs/embedding-models#embedding-models) through its OpenAI compatible API.

You can consume Together AI API using the `OpenAIEmbeddings` wrapper in the same way you would use the OpenAI API.

The only difference is that you need to change the base URL to `https://api.together.xyz/v1`:

```dart
final togetherAiApiKey = Platform.environment['TOGETHER_AI_API_KEY'];
final embeddings = OpenAIEmbeddings(
  apiKey: togetherAiApiKey,
  baseUrl: 'https://api.together.xyz/v1',
  model: 'togethercomputer/m2-bert-80M-32k-retrieval',
);

// Embedding a document
const doc = Document(pageContent: 'This is a test document.');
final res1 = await embeddings.embedDocuments([doc]);
print(res1);
// [[-0.038838703, 0.0580902, 0.022614542, 0.0078403875, ...]]

// Embedding a retrieval query
const text = 'This is a test query.';
final res2 = await embeddings.embedQuery(text);
print(res2);
// [-0.019722218, 0.04656633, -0.0074559706, 0.005712764, ...]

embeddings.close();
```
