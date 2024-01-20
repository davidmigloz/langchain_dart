# Anyscale Embeddings

[Anyscale](https://www.anyscale.com/) offers several [embedding models](https://docs.endpoints.anyscale.com/guides/models/#embedding-models) through its OpenAI compatible API.

You can consume Anyscale API using the `OpenAIEmbeddings` wrapper in the same way you would use the OpenAI API.

The only difference is that you need to change the base URL to `https://api.endpoints.anyscale.com/v1`:

```dart
final anyscaleApiKey = Platform.environment['ANYSCALE_API_KEY'];
final embeddings = OpenAIEmbeddings(
  apiKey: anyscaleApiKey,
  baseUrl: 'https://api.endpoints.anyscale.com/v1',
  model: 'thenlper/gte-large',
);

// Embedding a document
const doc = Document(pageContent: 'This is a test document.');
final res1 = await embeddings.embedDocuments([doc]);
print(res1);
// [[-0.0011281073093414307, -0.013280618004500866, 0.02164546772837639, ...]]

// Embedding a retrieval query
const text = 'This is a test query.';
final res2 = await embeddings.embedQuery(text);
print(res2);
// [-0.027850965037941933, 0.00269310618750751, 0.008118202909827232, ...]

embeddings.close();
```
