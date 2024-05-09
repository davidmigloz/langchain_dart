# Google AI Embeddings

The embedding service in the [Gemini API](https://ai.google.dev/docs/embeddings_guide) generates state-of-the-art embeddings for words, phrases, and sentences. The resulting embeddings can then be used for NLP tasks, such as semantic search, text classification and clustering among many others.

## Available models

- `text-embedding-004`
  * Dimensions: 768 (with support for reduced dimensionality)
- `embedding-001`
  * Dimensions: 768

The previous list of models may not be exhaustive or up-to-date. Check out the [Google AI documentation](https://ai.google.dev/models/gemini) for the latest list of available models.

### Task type

Google AI support specifying a 'task type' when embedding documents. The task type is then used by the model to improve the quality of the embeddings. 

This integration uses the specifies the following task type:
- `retrievalDocument`: for embedding documents
- `retrievalQuery`: for embedding queries

## Usage

```dart
final apiKey = Platform.environment['GOOGLEAI_API_KEY'];
final embeddings = GoogleGenerativeAIEmbeddings(
  apiKey: apiKey,
);

// Embedding a document
const doc = Document(pageContent: 'This is a test document.');
final res1 = await embeddings.embedDocuments([doc]);
print(res1);
// [[0.05677966, 0.0030236526, -0.06441004, ...]]

// Embedding a retrieval query
const text = 'This is a test query.';
final res2 = await embeddings.embedQuery(text);
print(res2);
// [0.025963314, -0.06858828, -0.026590854, ...]

embeddings.close();
```

### Title

Google AI support specifying a document title when embedding documents. The title is then used by the model to improve the quality of the embeddings.

To specify a document title, add the title to the document's metadata. Then, specify the metadata key in the [docTitleKey] parameter.

Example:
```dart
final embeddings = GoogleGenerativeAIEmbeddings(
  apiKey: 'your-api-key',
);
final result = await embeddings.embedDocuments([
  Document(
    pageContent: 'Hello world',
    metadata: {'title': 'Hello!'},
  ),
]);
```
