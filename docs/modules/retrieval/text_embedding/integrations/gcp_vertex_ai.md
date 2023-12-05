# VertexAIEmbeddings

```dart
final embeddings = VertexAIEmbeddings(
  httpClient: authClient,
  project: 'your-project-id',
);
const text = 'This is a test document.';
final res = await embeddings.embedQuery(text);
final res = await embeddings.embedDocuments([text]);
```
