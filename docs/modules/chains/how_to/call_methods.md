# Different call methods

All classes inherited from `BaseChain` offer a few ways of running chain logic. 
The most direct one is by `call()` (a chain is a 
[callable object](https://dart.dev/language/callable-objects)):

```dart
final chat = ChatOpenAI(apiKey: openaiApiKey, temperature: 0);
const template = 'Tell me a {adjective} joke';
final prompt = PromptTemplate.fromTemplate(template);
final chain = LLMChain(llm: chat, prompt: prompt);
final res = await chain({'adjective': 'corny'});
print(res);
// -> {adjective: corny, text: Why did the tomato turn red? Because it saw the salad dressing!}
```

By default, `call()` returns both the input and output key values. You can 
configure it to only return output key values by setting `returnOnlyOutputs` to 
`true`.

```dart
final res = await chain({'adjective': 'corny'}, returnOnlyOutputs: true);
print(res);
// -> {text: Why did the tomato turn red? Because it saw the salad dressing!}
```

If the `Chain` only outputs one output key (i.e. only has one element in its 
`outputKeys`), you can use `run` method. Note that run outputs a `String` 
instead of a `Map`.

```dart
final res = await chain.run({'adjective': 'corny'});
print(res);
// -> 'Why did the tomato turn red? Because it saw the salad dressing!'
```

In the case of one input key, you can input the string directly without 
specifying the input mapping.

```dart
// These two are equivalent
final res1 = await chain.run({'adjective': 'corny'});
final res2 = await chain.run('corny');
// -> 'Why did the tomato turn red? Because it saw the salad dressing!'

// These two are also equivalent
final res3 = await chain({'adjective': 'corny'});
final res4 = await chain('corny');
// -> {adjective: corny, text: Why did the tomato turn red? Because it saw the salad dressing!}
```

Tips: You can easily integrate a Chain object as a Tool in your Agent via its 
run method.

## Add memory to chains

`Chain` supports taking a `BaseMemory` object as its memory argument, allowing
`Chain` object to persist data across multiple calls. In other words, it makes 
`Chain` a stateful object.

```dart
final chat = ChatOpenAI(apiKey: openaiApiKey, temperature: 0);
final memory = ConversationBufferMemory(returnMessages: true);
final conversation = ConversationChain(llm: chat, memory: memory);

final output1 = await conversation.run(
  'Answer briefly. What are the first 3 colors of a rainbow?',
);
print(output1);
// -> 'The first three colors of a rainbow are red, orange, and yellow.'

final output2 = await conversation.run('And the next 4?');
print(output2);
// -> 'The next four colors of a rainbow are green, blue, indigo, and violet.'
```

Essentially, `BaseMemory` defines an interface of how LangChain stores memory. 
It allows reading of stored data through `loadMemoryVariables` method and 
storing new data through `saveContext` method. You can learn more about it 
in [Memory](/modules/memory/memory.md) section.
