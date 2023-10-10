# OpenAI

Let's load the OpenAI Embedding class.

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);
const text = 'This is a test document.';
final res = await embeddings.embedQuery(text);
final res = await embeddings.embedDocuments([text]);
```
