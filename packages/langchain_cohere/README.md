# 🦜️🔗 LangChain.dart / Cohere

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![docs](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/pages%2Fpages-build-deployment?logo=github&label=docs)](https://github.com/davidmigloz/langchain_dart/actions/workflows/pages/pages-build-deployment)
![Discord](https://img.shields.io/discord/1123158322812555295?label=discord)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

[Cohere](https://cohere.com) module for [LangChain.dart](https://github.com/davidmigloz/langchain_dart).

## Features

- Chat models:
  * `ChatCohere`: wrapper around the Cohere v2 [Chat API](https://docs.cohere.com/reference/chat) (Command models). Supports `invoke`, `stream` and tool calling.
- Embeddings:
  * `CohereEmbeddings`: wrapper around the Cohere v2 [Embed API](https://docs.cohere.com/reference/embed). Uses the `search_document` / `search_query` input types for documents and queries respectively, as required by Cohere.

## Usage

### Chat

```dart
final chatModel = ChatCohere(
  apiKey: Platform.environment['COHERE_API_KEY'],
  defaultOptions: const ChatCohereOptions(
    model: 'command-r-plus-08-2024',
    temperature: 0,
  ),
);
final prompt = PromptValue.chat([
  ChatMessage.system('You are a helpful assistant.'),
  ChatMessage.humanText('Tell me a joke.'),
]);
final res = await chatModel.invoke(prompt);
print(res.output.contentAsString);
chatModel.close();
```

Streaming:

```dart
final stream = chatModel.stream(prompt);
await for (final chunk in stream) {
  stdout.write(chunk.output.contentAsString);
}
```

### Embeddings

```dart
final embeddings = CohereEmbeddings(
  apiKey: Platform.environment['COHERE_API_KEY'],
  model: 'embed-v4.0',
);
final queryVector = await embeddings.embedQuery('Hello world');
final docVectors = await embeddings.embedDocuments([
  const Document(pageContent: 'Hello world'),
  const Document(pageContent: 'Bye bye'),
]);
embeddings.close();
```

## License

LangChain.dart is licensed under the
[MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
