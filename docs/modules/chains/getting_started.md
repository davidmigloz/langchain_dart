# Getting Started

## Different ways of calling chains

All classes inherited from `BaseChain` offer a few ways of running chain logic. The most direct one 
is by `call()` (a chain is a [callable object](https://dart.dev/language/callable-objects)):

```dart
final chat = final chat = ChatOpenAI(
  apiKey: openaiApiKey,
  defaultOptions: const ChatOpenAIOptions(
    temperature: 0,
  ),
);
const template = 'Tell me a {adjective} joke';
final prompt = PromptTemplate.fromTemplate(template);
final chain = LLMChain(llm: chat, prompt: prompt);
final res = await chain({'adjective': 'corny'});
print(res);
// -> {adjective: corny, text: Why did the tomato turn red? Because it saw the salad dressing!}
```

By default, `call()` returns both the input and output key values. You can configure it to only 
return output key values by setting `returnOnlyOutputs` to `true`.

```dart
final res = await chain({'adjective': 'corny'}, returnOnlyOutputs: true);
print(res);
// -> {text: Why did the tomato turn red? Because it saw the salad dressing!}
```

If the `Chain` only outputs one output key (i.e. only has one element in its `outputKeys`), you can 
use `run` method. Note that run outputs a `String` instead of a `Map`.

```dart
final res = await chain.run({'adjective': 'corny'});
print(res);
// -> 'Why did the tomato turn red? Because it saw the salad dressing!'
```

In the case of one input key, you can input the string directly without specifying the input 
mapping.

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

Tips: You can easily integrate a Chain object as a Tool in your Agent via its run method.

## Add memory to chains

`Chain` supports taking a `BaseMemory` object as its memory argument, allowing `Chain` object to 
persist data across multiple calls. In other words, it makes `Chain` a stateful object.

```dart
final chat = final chat = ChatOpenAI(
  apiKey: openaiApiKey,
  defaultOptions: const ChatOpenAIOptions(
    temperature: 0,
  ),
);
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

Essentially, `BaseMemory` defines an interface of how LangChain stores memory. It allows reading 
of stored data through `loadMemoryVariables` method and storing new data through `saveContext` 
method. You can learn more about it in [Memory](/modules/memory/memory.md) section.

## Debug Chain

TODO

## Combine chains with the `SequentialChain`

TODO

## Create a custom chain

LangChain provides many chains out of the box, but sometimes you may want to create a custom chain 
for your specific use case. For this example, we will create a custom chain that concatenates the 
outputs of 2 `LLMChains`.

In order to create a custom chain:

1. Start by subclassing the `BaseChain` class. 
2. Fill out the `inputKeys` and `outputKeys` properties. 
3. Implement the `callInternal` method that runs the logic of the chain.

These steps are demonstrated in the example below:

```dart
class ConcatenateChain extends BaseChain {
  const ConcatenateChain({
    required this.chain1,
    required this.chain2,
  });

  final LLMChain chain1;
  final LLMChain chain2;

  @override
  String get chainType => 'concat';

  @override
  Set<String> get inputKeys {
    // Union of the input keys of the two chains
    return <String>{
      ...chain1.inputKeys,
      ...chain2.inputKeys,
    };
  }

  @override
  Set<String> get outputKeys => const {'concat_output'};

  @override
  Future<ChainValues> callInternal(final ChainValues values) async {
    final output1 = await chain1.run(values);
    final output2 = await chain2.run(values);
    return {'concat_output': output1 + output2};
  }
}
```

Now, we can try running the chain that we called:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final llm = OpenAI(
  apiKey: openaiApiKey,
  defaultOptions: const OpenAIOptions(temperature: 0.9),
);

final prompt1 = PromptTemplate.fromTemplate(
'What is a good name for a company that makes {product}?',
);
final chain1 = LLMChain(llm: llm, prompt: prompt1);

final prompt2 = PromptTemplate.fromTemplate(
'What is a good slogan for a company that makes {product}?',
);
final chain2 = LLMChain(llm: llm, prompt: prompt2);

final concatChain = ConcatenateChain(chain1: chain1, chain2: chain2);
final concatOutput = await concatChain.run('colorful socks');
print(concatOutput);
// -> '\nFancy Footwear.\n\nSock it to 'em with style!'
```

That’s it! For more details about how to do cool things with Chains, check out the how-to guide 
for chains.
