# Custom LLM

This tutorial goes over how to create a custom LLM wrapper, in case you want to
use your own LLM or a different wrapper than one that is supported in LangChain.

To create you custom LLM you have to:

- Extend `SimpleLLM` (or `BaseLLM` if you need more control).
- Implement the `callInternal()` method that takes in a string, some optional 
  stop words, and returns a string.

Let's implement a very simple custom LLM that just returns the first N
characters of the input.

```dart
class CustomLLM extends SimpleLLM {
  const CustomLLM({
    required this.n,
  });

  final int n;

  @override
  String get modelType => 'custom';

  @override
  Future<String> callInternal(
      final String prompt, {
        final LLMOptions? options,
      }) {
    return Future<String>.value(prompt.substring(0, n));
  }
}
```

We can now use this as an any other LLM.

```dart
const llm = CustomLLM(n: 10);
final result = await llm('This is a foobar thing');
print(result);
// -> 'This is a '
```
