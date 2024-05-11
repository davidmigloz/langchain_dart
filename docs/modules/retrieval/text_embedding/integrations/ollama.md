# OllamaEmbeddings

```dart
final embeddings = OllamaEmbeddings(model: 'llama3');
const text = 'This is a test document.';
final res = await embeddings.embedQuery(text);
final res = await embeddings.embedDocuments([text]);
```
