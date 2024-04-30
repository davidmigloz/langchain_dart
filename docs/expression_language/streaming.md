# Streaming With LangChain

Streaming is critical in making applications based on LLMs feel responsive to end-users.

Important LangChain primitives like LLMs, parsers, prompts, retrievers, and agents implement the LangChain [Runnable Interface](/expression_language/interface.md).

This guide will show you how to use `.stream()` to stream the final output of the chain.

## Using Stream

All `Runnable` objects implement a method called `stream`.

These methods are designed to stream the final output in chunks, yielding each chunk as soon as it is available.

Streaming is only possible if all steps in the program know how to process an **input stream**; i.e., process an input chunk one at a time, and yield a corresponding output chunk.

The complexity of this processing can vary, from straightforward tasks like emitting tokens produced by an LLM, to more challenging ones like streaming parts of JSON results before the entire JSON is complete.

The best place to start exploring streaming is with the single most important components in LLM apps – the models themselves!

## LLMs and Chat Models

Large language models and their chat variants are the primary bottleneck in LLM based apps.

Large language models can take **several seconds** to generate a complete response to a query. This is far slower than the **~200-300 ms** threshold at which an application feels responsive to an end user.

The key strategy to make the application feel more responsive is to show intermediate progress; e.g., to stream the output from the model token by token.

```dart
final model = ChatOpenAI(apiKey: openAiApiKey);

final stream = model.stream(PromptValue.string('Hello! Tell me about yourself.'));
final chunks = <ChatResult>[];
await for (final chunk in stream) {
  chunks.add(chunk);
  stdout.write('${chunk.output.content}|');
}
// Hello|!| I| am| a| language| model| AI| created| by| Open|AI|,|...
```

Let’s have a look at one of the raw chunks:

```dart
print(chunks.first);
// ChatResult{
//   id: chatcmpl-9IHQvyTl9fyVmF7P6zamGaX1XAN6d,
//   output: AIChatMessage{
//     content: Hello,
//   },
//   finishReason: FinishReason.unspecified,
//   metadata: {
//     model: gpt-3.5-turbo-0125,
//     created: 1714143945,
//     system_fingerprint: fp_3b956da36b
//   },
//   streaming: true
// }
```

We got back a `ChatResult` instance as usual, but containing only a part of the full response (`Hello`). 

We can identify results that are streamed by checking the `streaming` field. The result objects are additive by design – one can simply add them up using the `.concat()` method to get the state of the response so far!

```dart
final result = chunks.sublist(0, 6).reduce((prev, next) => prev.concat(next));
print(result);
// ChatResult{
//   id: chatcmpl-9IHQvyTl9fyVmF7P6zamGaX1XAN6d,
//   output: AIChatMessage{
//     content: Hello! I am a language model
//   },
//   finishReason: FinishReason.unspecified,
//   metadata: {
//     model: gpt-3.5-turbo-0125,
//     created: 1714143945,
//     system_fingerprint: fp_3b956da36b
//   },
//   streaming: true
// }
```

## Chains

Virtually all LLM applications involve more steps than just a call to a language model.

Let’s build a simple chain using LangChain Expression Language (LCEL) that combines a prompt, model and a parser and verify that streaming works.

We will use `StringOutputParser` to parse the output from the model. This is a simple parser that extracts the string output from the result returned by the model.

> LCEL is a declarative way to specify a “program” by chaining together different LangChain primitives. Chains created using LCEL benefit from an automatic implementation of stream, allowing streaming of the final output. In fact, chains created with LCEL implement the entire standard Runnable interface. 

```dart
final model = ChatOpenAI(apiKey: openAiApiKey);
final prompt = ChatPromptTemplate.fromTemplate('Tell me a joke about {topic}');
const parser = StringOutputParser<ChatResult>();

final chain = prompt.pipe(model).pipe(parser);

final stream = chain.stream({'topic': 'parrot'});
await stream.forEach((final chunk) => stdout.write('$chunk|'));
// |Why| don|'t| you| ever| play| hide| and| seek| with| a| par|rot|?|
// |Because| they| always| squ|awk| when| they| find| you|!||
```

You might notice above that parser actually doesn't block the streaming output from the model, and instead processes each chunk individually. Many of the LCEL primitives also support this kind of transform-style passthrough streaming, which can be very convenient when constructing apps.

> You do not have to use the LangChain Expression Language to use LangChain and can instead rely on a standard imperative programming approach by calling invoke, batch or stream on each component individually, assigning the results to variables and then using them downstream as you see fit.  
> 
> If that works for your needs, then that’s fine by us 👌!

## Working with Input Streams

What if you wanted to stream JSON from the output as it was being generated?

If you were to rely on `json.decode` to parse the partial json, the parsing would fail as the partial json wouldn't be valid json.

You'd likely be at a complete loss of what to do and claim that it wasn't possible to stream JSON.

Well, turns out there is a way to do it - the parser needs to operate on the input stream, and attempt to “auto-complete” the partial json into a valid state.

Let’s see such a parser in action to understand what this means.

```dart
final model = ChatOpenAI(
  apiKey: openAiApiKey,
  defaultOptions: const ChatOpenAIOptions(
    responseFormat: ChatOpenAIResponseFormat(
      type: ChatOpenAIResponseFormatType.jsonObject,
    ),
  ),
);
final parser = JsonOutputParser<ChatResult>();

final chain = model.pipe(parser);

final stream = chain.stream(
  PromptValue.string(
    'Output a list of the countries france, spain and japan and their '
    'populations in JSON format. Use a dict with an outer key of '
    '"countries" which contains a list of countries. '
    'Each country should have the key "name" and "population"',
  ),
);
await stream.forEach((final chunk) => print('$chunk|'));
// {}|
// {countries: []}|
// {countries: [{}]}|
// {countries: [{name: }]}|
// {countries: [{name: France}]}|
// {countries: [{name: France, population: 670}]}|
// {countries: [{name: France, population: 670760}]}|
// {countries: [{name: France, population: 67076000}]}|
// {countries: [{name: France, population: 67076000}, {}]}|
// {countries: [{name: France, population: 67076000}, {name: }]}|
// {countries: [{name: France, population: 67076000}, {name: Spain}]}|
// {countries: [{name: France, population: 67076000}, {name: Spain, population: 467}]}|
// {countries: [{name: France, population: 67076000}, {name: Spain, population: 467237}]}|
// {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}]}|
// {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}, {}]}|
// {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}, {name: }]}|
// {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}, {name: Japan}]}|
// {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}, {name: Japan, population: 126}]}|
// {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}, {name: Japan, population: 126476}]}|
// {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}, {name: Japan, population: 126476461}]}|
```

### Transforming Streams

Now, instead of returning the complete JSON object, we want to extract the country names from the JSON as they are being generated. We can use `Runnable.mapInputStream` to transform the stream.

```dart
final mapper = Runnable.mapInputStream((Stream<Map<String, dynamic>> inputStream) {
  return inputStream.map((input) {
    final countries = (input['countries'] as List?)?.cast<Map<String, dynamic>>() ?? [];
    final countryNames = countries
        .map((country) => country['name'] as String?)
        .where((c) => c != null && c.isNotEmpty);
    return countryNames.join(', ');
  }).distinct();
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
await stream.forEach(print);
// France
// France, Spain
// France, Spain, Japan
```

## Non-streaming components

The following runnables cannot process individual input chunks and instead aggregate the streaming input from the previous step into a single value before processing it:
- `PromptTemplate`
- `ChatPromptTemplate`
- `LLM`
- `ChatModel`
- `Retriever`
- `Tool`
- `RunnableFunction`
- `RunnableRouter`

Let see what happens when we try to stream them. 🤨

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

final vectorStore = MemoryVectorStore(
  embeddings: OpenAIEmbeddings(apiKey: openaiApiKey),
);
await vectorStore.addDocuments(
  documents: const [
    Document(pageContent: 'LangChain was created by Harrison'),
    Document(
      pageContent: 'David ported LangChain to Dart in LangChain.dart',
    ),
  ],
);
final retriever = vectorStore.asRetriever();

await retriever.stream('Who created LangChain.dart?').forEach(print);
// [Document{pageContent: David ported LangChain to Dart in LangChain.dart}, 
// Document{pageContent: LangChain was created by Harrison}]
```

Stream just yielded the final result from that component.

This is OK 🥹! Not all components have to implement streaming – in some cases streaming is either unnecessary, difficult or just doesn’t make sense.

An LCEL chain constructed using non-streaming components, will still be able to stream in a lot of cases, with streaming of partial output starting after the last non-streaming step in the chain.

```dart
final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (
    ChatMessageType.system,
    'Answer the question based on only the following context:\n{context}',
  ),
  (ChatMessageType.human, '{question}'),
]);
final model = ChatOpenAI(apiKey: openaiApiKey);
const outputParser = StringOutputParser<ChatResult>();

final retrievalChain = Runnable.fromMap<String>({
  'context': retriever,
  'question': Runnable.passthrough(),
}).pipe(promptTemplate).pipe(model).pipe(outputParser);

await retrievalChain
    .stream('Who created LangChain.dart?')
    .forEach((chunk) => stdout.write('$chunk|'));
// |David| created| Lang|Chain|.dart|.||
```
