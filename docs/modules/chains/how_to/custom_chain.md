# Custom chain

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
