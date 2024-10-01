# Mapper: Mapping input values

It is common to need to map the output value of a previous runnable to a new value that conforms to the input requirements of the next runnable. This is where `Runnable.mapInput` comes in.

## Runnable.mapInput

`Runnable.mapInput` allows you to define a function that maps the input value to a new value.

In the following example, we retrieve a list of `Document` objects from our vector store, and we want to combine them into a single string to feed it in our prompt. To do this, we use `Runnable.mapInput` to implement the combination logic.

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
final setupAndRetrieval = Runnable.fromMap<String>({
  'context': retriever.pipe(
    Runnable.mapInput((docs) => docs.map((d) => d.pageContent).join('\n')),
  ),
  'question': Runnable.passthrough(),
});

final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (ChatMessageType.system, 'Answer the question based on only the following context:\n{context}'),
  (ChatMessageType.human, '{question}'),
]);

final model = ChatOpenAI(apiKey: openaiApiKey);
const outputParser = StringOutputParser<ChatResult>();
final chain = setupAndRetrieval
    .pipe(promptTemplate)
    .pipe(model)
    .pipe(outputParser);

final res = await chain.invoke('Who created LangChain.dart?');
print(res);
// David created LangChain.dart
```

## Runnable.mapInputStream

By default, when running a chain using `stream` instead of `invoke`, `Runnable.mapInput` will be called for every item in the input stream. If you need more control over the input stream, you can use `Runnable.mapInputStream` instead which takes the input stream as a parameter and returns a new stream.

In the following example, the model streams the output in chunks and the output parser processes each of them individually. However, we want our chain to output only only the last chunk. We can use `Runnable.mapInputStream` to get the last chunk from the input stream.

```dart
final model = ChatOpenAI(
  apiKey: openAiApiKey,
  defaultOptions: ChatOpenAIOptions(
    responseFormat: ChatOpenAIResponseFormat(
      type: ChatOpenAIResponseFormatType.jsonObject,
    ),
  ),
);
final parser = JsonOutputParser<ChatResult>();
final mapper = Runnable.mapInputStream((Stream<Map<String, dynamic>> inputStream) async* {
  yield await inputStream.last;
});

final chain = model.pipe(parser).pipe(mapper);

final stream = chain.stream(
  PromptValue.string(
    'Output a list of the countries france, spain and japan and their '
        'populations in JSON format. Use a dict with an outer key of '
        '"countries" which contains a list of countries. '
        'Each country should have the key "name" and "population"',
  ),
);
await stream.forEach((final chunk) => print('$chunk|'));
// {countries: [{name: France, population: 65273511}, {name: Spain, population: 46754778}, {name: Japan, population: 126476461}]}|
```

> Note: for more complex use-cases where you want to define separate logic for when the chain is run using `invoke` or `stream`, you can use `Runnable.function`.

## Runnable.getItemFromMap

Sometimes the previous runnable returns a map, and you want to get a value from it to feed it to the next runnable. You can use `Runnable.getItemFromMap` to get a value from an input map.

In the following example, we want to feed to our retriever the question but the input is a map with several other values. We can use `Runnable.getItemFromMap` to get the question from the input map, as well as to propagate the other values to the next runnable.

```dart
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

> Note: this is equivalent to  
> `Runnable.mapInput<Map<String, dynamic>, RunOutput>((input) => input[key])`

## Runnable.getMapFromInput

Sometimes the previous runnable returns a single item, but the next runnable expects a map. You can use `Runnable.getMapFromInput` to format the input for the next runnable.

In the following example, we want our chain input type to be a String, but the prompt template expects a map. We can use `Runnable.getMapFromInput` to format the input for the prompt template.

```dart
final model = ChatOpenAI(apiKey: openaiApiKey);
const outputParser = StringOutputParser<ChatResult>();

final promptTemplate = ChatPromptTemplate.fromTemplates([
  (
  ChatMessageType.system,
  'Write out the following equation using algebraic symbols then solve it. '
      'Use the format\n\nEQUATION:...\nSOLUTION:...\n\n',
  ),
  (ChatMessageType.human, '{equation_statement}'),
]);

final chain = Runnable.getMapFromInput<String>('equation_statement')
    .pipe(promptTemplate)
    .pipe(model)
    .pipe(outputParser);

final res = await chain.invoke('x raised to the third plus seven equals 12');
print(res);
// EQUATION: \(x^3 + 7 = 12\)
//
// SOLUTION:
// Subtract 7 from both sides:
// \(x^3 = 5\)
//
// Take the cube root of both sides:
// \(x = \sqrt[3]{5}\)
```

> Note: this is equivalent to  
> `Runnable.mapInput<RunInput, Map<String, dynamic>>((input) => {key: input})`
