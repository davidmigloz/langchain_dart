# Passthrough: Passing inputs through

`RunnablePassthrough` on its own allows you to pass inputs unchanged. This typically is used in conjunction with `RunnableMap` to pass data through to a new key in the map.

See the example below:

```dart
final runnable = Runnable.fromMap<Map<String, dynamic>>({
  'passed': Runnable.passthrough(),
  'modified': Runnable.mapInput((input) => (input['num'] as int) + 1),
});

final res = await runnable.invoke({'num': 1});
print(res);
// {passed: {num: 1}, modified: 2}
```

As seen above, `passed` key was called with `RunnablePassthrough` and so it simply passed on `{'num': 1}`.

We also set a second key in the map with `modified`. This uses a map input to set a single value adding 1 to the num, which resulted in `modified` key with the value of 2.

## Retrieval Example

In the example below, we see a use case where we use `RunnablePassthrough` along with `RunnableMap`.

```dart
final vectorStore = MemoryVectorStore(
  embeddings: OpenAIEmbeddings(apiKey: openaiApiKey),
);
await vectorStore.addDocuments(
  documents: [
    Document(pageContent: 'LangChain was created by Harrison'),
    Document(pageContent: 'David ported LangChain to Dart in LangChain.dart'),
  ],
);
final retriever = vectorStore.asRetriever();
final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'Answer the question based on only the following context:\n{context}'),
  (ChatMessageType.human, '{question}'),
]);
final model = ChatOpenAI(apiKey: openaiApiKey);
const outputParser = StringOutputParser<ChatResult>();

final retrievalChain = Runnable.fromMap<String>({
  'context': retriever,
  'question': Runnable.passthrough(),
}).pipe(promptTemplate).pipe(model).pipe(outputParser);

final res = await retrievalChain.invoke('Who created LangChain.dart?');
print(res);
// David created LangChain.dart.
```

Here the input to prompt is expected to be a map with keys “context” and “question”. The user input is just the question. So we need to get the context using our retriever and passthrough the user input under the “question” key. In this case, the RunnablePassthrough allows us to pass on the user’s question to the prompt and model.
