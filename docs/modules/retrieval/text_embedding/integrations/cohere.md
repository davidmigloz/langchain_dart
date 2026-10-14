# CohereEmbeddings

Wrapper around the [Cohere](https://cohere.com) v2 [Embed API](https://docs.cohere.com/reference/embed).

Cohere requires an `input_type` for every embed request. `CohereEmbeddings` handles this automatically: `embedDocuments` uses `search_document` and `embedQuery` uses `search_query`, so document and query embeddings are optimized for retrieval out of the box.

## Setup

To use `CohereEmbeddings` you need a Cohere account and an API key. You can get one [here](https://dashboard.cohere.com/api-keys).

Add the dependency:

```yaml
dependencies:
  langchain: {version}
  langchain_cohere: {version}
```

## Usage

```dart
final embeddings = CohereEmbeddings(
  apiKey: Platform.environment['COHERE_API_KEY'],
  model: 'embed-v4.0',
);

// Embedding a query
final queryVector = await embeddings.embedQuery('Hello world');

// Embedding documents
final docVectors = await embeddings.embedDocuments([
  const Document(pageContent: 'Hello world'),
  const Document(pageContent: 'Bye bye'),
]);

embeddings.close();
```

Documents are embedded in batches of at most 96 texts (the Cohere API limit per request). You can lower this with the `batchSize` parameter, and reduce the embedding dimensionality with the `dimensions` parameter (supported by `embed-v4.0`).
