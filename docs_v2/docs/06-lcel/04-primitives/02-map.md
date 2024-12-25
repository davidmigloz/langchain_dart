# RunnableMap: Formatting inputs & concurrency

The `RunnableMap` primitive is essentially a map whose values are runnables. It runs all of its values concurrently, and each value is called with the overall input of the `RunnableMap`. The final return value is a map with the results of each value under its appropriate key.

It is useful for running operations concurrently, but can also be useful for manipulating the output of one `Runnable` to match the input format of the next `Runnable` in a sequence.

Here the input to prompt is expected to be a map with keys “context” and “question”. The user input is just the question. So we need to get the context using our retriever and passthrough the user input under the “question” key.

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

## Using Runnable.getItemFromMap as shorthand

Sometimes you need to extract one value from a map and pass it to the next `Runnable`. You can use `Runnable.getItemFromMap` to do this. It takes the input map and returns the value of the provided key.

```dart
final vectorStore = MemoryVectorStore(
  embeddings: OpenAIEmbeddings(apiKey: openaiApiKey),
);
await vectorStore.addDocuments(
  documents: [
    const Document(pageContent: 'LangChain was created by Harrison'),
    const Document(
      pageContent: 'David ported LangChain to Dart in LangChain.dart',
    ),
  ],
);
final retriever = vectorStore.asRetriever();
final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (
    ChatMessageType.system,
    'Answer the question based on only the following context:\n{context}\n'
        'Answer in the following language: {language}',
  ),
  (ChatMessageType.human, '{question}'),
]);
final model = ChatOpenAI(apiKey: openaiApiKey);
const outputParser = StringOutputParser<ChatResult>();

final retrievalChain = Runnable.fromMap<Map<String, dynamic>>({
  'context': Runnable.getItemFromMap('question').pipe(retriever),
  'question': Runnable.getItemFromMap('question'),
  'language': Runnable.getItemFromMap('language'),
}).pipe(promptTemplate).pipe(model).pipe(outputParser);

final res = await retrievalChain.invoke({
  'question': 'Who created LangChain.dart?',
  'language': 'Spanish',
});
print(res);
// David portó LangChain a Dart en LangChain.dart
```

## Running steps concurrently

`RunnableMap` makes it easy to execute multiple `Runnables` concurrently and to return the output of these Runnables as a map.

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);
const outputParser = StringOutputParser<ChatResult>();

final jokeChain = PromptTemplate.fromTemplate('tell me a joke about {topic}')
    .pipe(model)
    .pipe(outputParser);
final poemChain =
    PromptTemplate.fromTemplate('write a 2-line poem about {topic}')
        .pipe(model)
        .pipe(outputParser);

final mapChain = Runnable.fromMap<Map<String, dynamic>>({
  'joke': jokeChain,
  'poem': poemChain,
});

final res = await mapChain.invoke({
  'topic': 'bear',
});
print(res);
// {joke: Why did the bear bring a flashlight to the party? Because he wanted to be the "light" of the party!, 
//  poem: In the forest's hush, the bear prowls wide, A silent guardian, a force of nature's pride.}
```

Each branch of the `RunnableMap` is still run on the same isolate, but they are run concurrently. In the example above, the two requests to the OpenAI API are made concurrently, without waiting for the first to finish before starting the second.
