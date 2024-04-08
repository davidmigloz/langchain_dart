# Get started

LCEL makes it easy to build complex chains from basic components, and supports out of the box functionality such as streaming, parallelism, and logging.

# Basic example: prompt + model + output parser

The most basic and common use case is chaining a prompt template and a model together. To see how this works, let’s create a chain that takes a topic and generates a joke:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {topic}',
);
final model = ChatOpenAI(apiKey: openaiApiKey);
const outputParser = StringOutputParser<ChatResult>();

final chain = promptTemplate.pipe(model).pipe(outputParser);

final res = await chain.invoke({'topic': 'ice cream'});
print(res);
// Why did the ice cream truck break down?
// Because it had too many "scoops"!
```

Notice this line of this code, where we piece together then different components into a single chain using LCEL:

```dart
final chain = promptTemplate.pipe(model).pipe(outputParser);
```

The `.pipe()` method (or `|` operator) is similar to a unix pipe operator, which chains together the different components feeds the output from one component as input into the next component.

In this chain the user input is passed to the prompt template, then the prompt template output is passed to the model, then the model output is passed to the output parser. Let’s take a look at each component individually to really understand what’s going on.

## 1. Prompt

`promptTemplate` is a `BasePromptTemplate`, which means it takes in a map of template variables and produces a `PromptValue`. A `PromptValue` is a wrapper around a completed prompt that can be passed to either an `LLM` (which takes a string as input) or `ChatModel` (which takes a sequence of messages as input). It can work with either language model type because it defines logic both for producing `ChatMessage` and for producing a string.

```dart
final promptValue = await promptTemplate.invoke({'topic': 'ice cream'});

final messages = promptValue.toChatMessages();
print(messages);
// [HumanChatMessage{
//   content: ChatMessageContentText{
//     text: Tell me a joke about ice cream,
//   },
// }]

final string = promptValue.toString();
print(string);
// Human: Tell me a joke about ice cream
```

## 2. Model

The `PromptValue` is then passed to `model`. In this case our `model` is a `ChatModel`, meaning it will output a `ChatMessage`.

```dart
final chatOutput = await model.invoke(promptValue);
print(chatOutput.output);
// AIChatMessage{
//   content: Why did the ice cream truck break down? 
//   Because it couldn't make it over the rocky road!,
// }
```

If our model was an `LLM`, it would output a `String`.

```dart
final llm = OpenAI(apiKey: openaiApiKey);
final llmOutput = await llm.invoke(promptValue);
print(llmOutput.output);
// Why did the ice cream go to therapy?
// Because it had a rocky road!
```

## 3. Output parser

And lastly we pass our `model` output to the `outputParser`, which is a `BaseOutputParser` meaning it takes either a `String` or a `ChatMessage` as input. The `StringOutputParser` specifically simple converts any input into a `String`.

```dart
final parsed = await outputParser.invoke(chatOutput);
print(parsed);
// Why did the ice cream go to therapy?
// Because it had a rocky road!
```

## 4. Entire Pipeline

To follow the steps along:

1. We pass in user input on the desired topic as `{'topic': 'ice cream'}`
2. The `promptTemplate` component takes the user input, which is then used to construct a `PromptValue` after using the `topic` to construct the prompt.
3. The `model` component takes the generated prompt, and passes into the OpenAI chat model for evaluation. The generated output from the model is a `ChatMessage` object (specifically an `AIChatMessage`).
4. Finally, the `outputParser` component takes in a `ChatMessage`, and transforms this into a `String`, which is returned from the invoke method.

Note that if you’re curious about the output of any components, you can always test out a smaller version of the chain such as `promptTemplate` or `promptTemplate.pipe(model)` to see the intermediate results.

## RAG Search Example

For our next example, we want to run a retrieval-augmented generation chain to add some context when responding to questions.

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

// 1. Create a vector store and add documents to it
final vectorStore = MemoryVectorStore(
  embeddings: OpenAIEmbeddings(apiKey: openaiApiKey),
);
await vectorStore.addDocuments(
  documents: [
    Document(pageContent: 'LangChain was created by Harrison'),
    Document(pageContent: 'David ported LangChain to Dart in LangChain.dart'),
  ],
);

// 2. Construct a RAG prompt template
final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'Answer the question based on only the following context:\n{context}'),
  (ChatMessageType.human, '{question}'),
]);

// 3. Create a Runnable that combines the retrieved documents into a single string
final docCombiner = Runnable.fromFunction<List<Document>, String>((docs, _) {
  return docs.map((final d) => d.pageContent).join('\n');
});

// 4. Define the RAG pipeline
final chain = Runnable.fromMap<String>({
  'context': vectorStore.asRetriever().pipe(docCombiner),
  'question': Runnable.passthrough(),
})
    .pipe(promptTemplate)
    .pipe(ChatOpenAI(apiKey: openaiApiKey))
    .pipe(StringOutputParser());

// 5. Run the pipeline
final res = await chain.invoke('Who created LangChain.dart?');
print(res);
// David created LangChain.dart
```

In this chain we add some extra logic around retrieving context from a vector store.

We first instantiate our vector store and add some documents to it. Then we define our prompt, which takes in two input variables:

- `context` -> this is a string which is returned from our vector store based on a semantic search from the input.
- `question` -> this is the question we want to ask.

In our `chain`, we use a `RunnableMap` which is special type of runnable that takes an object of runnables and executes them all in parallel. It then returns an object with the same keys as the input object, but with the values replaced with the output of the runnables.

In our case, it has two sub-chains to get the data required by our prompt:

- `context` -> this is a `RunnableFunction` which takes the input from the `.invoke()` call, makes a request to our vector store, and returns the retrieved documents combined in a single String.
- `question` -> this uses a `RunnablePassthrough` which simply passes whatever the input was through to the next step, and in our case it returns it to the key in the object we defined.

Finally, we chain together the prompt, model, and output parser as before.
