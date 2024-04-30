# Function: Run custom logic

As we discussed in the [Mapper: Mapping input values](/expression_language/primitives/map.md) section, it is common to need to map the output value of a previous runnable to a new value that conforms to the input requirements of the next runnable. `Runnable.mapInput`, `Runnable.mapInputStream`, `Runnable.getItemFromMap`, and `Runnable.getMapFromInput` are the easiest way to do that with minimal boilerplate. However, sometimes you may need more control over the input and output values. This is where `Runnable.fromFunction` comes in.

The main differences between `Runnable.mapInput` and `Runnable.fromFunction` are:
- `Runnable.fromFunction` allows you to define separate logic for invoke vs stream.
- `Runnable.fromFunction` allows you to access the invocation options.

## Runnable.fromFunction

In the following example, we use `Runnable.fromFunction` to log the output value of the previous `Runnable`. Note that we have print different messages depending on whether the chain is invoked or streamed.

```dart
Runnable<T, RunnableOptions, T> logOutput<T extends Object>(String stepName) {
  return Runnable.fromFunction<T, T>(
    invoke: (input, options) {
      print('Output from step "$stepName":\n$input\n---');
      return Future.value(input);
    },
    stream: (inputStream, options) {
      return inputStream.map((input) {
        print('Chunk from step "$stepName":\n$input\n---');
        return input;
      });
    },
  );
}

final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (
    ChatMessageType.system,
    'Write out the following equation using algebraic symbols then solve it. '
        'Use the format:\nEQUATION:...\nSOLUTION:...\n',
  ),
  (ChatMessageType.human, '{equation_statement}'),
]);

final chain = Runnable.getMapFromInput<String>('equation_statement')
    .pipe(logOutput('getMapFromInput'))
    .pipe(promptTemplate)
    .pipe(logOutput('promptTemplate'))
    .pipe(ChatOpenAI(apiKey: openaiApiKey))
    .pipe(logOutput('chatModel'))
    .pipe(const StringOutputParser())
    .pipe(logOutput('outputParser'));
```

When we invoke the chain, we get the following output:
```dart
await chain.invoke('x raised to the third plus seven equals 12');
// Output from step "getMapFromInput":
// {equation_statement: x raised to the third plus seven equals 12}
// ---
// Output from step "promptTemplate":
// System: Write out the following equation using algebraic symbols then solve it. Use the format
//
// EQUATION:...
// SOLUTION:...
//
// Human: x raised to the third plus seven equals 12
// ---
// Output from step "chatModel":
// ChatResult{
//   id: chatcmpl-9JcVxKcryIhASLnpSRMXkOE1t1R9G,
//   output: AIChatMessage{
//     content:
//       EQUATION: \( x^3 + 7 = 12 \)
//       SOLUTION:
//       Subtract 7 from both sides of the equation:
//       \( x^3 = 5 \)
//
//       Take the cube root of both sides:
//       \( x = \sqrt[3]{5} \)
//
//       Therefore, the solution is \( x = \sqrt[3]{5} \),
//   },
//   finishReason: FinishReason.stop,
//   metadata: {
//     model: gpt-3.5-turbo-0125,
//     created: 1714463309,
//     system_fingerprint: fp_3b956da36b
//   },
//   usage: LanguageModelUsage{
//     promptTokens: 47,
//     responseTokens: 76,
//     totalTokens: 123
//   },
//   streaming: false
// }
// ---
// Output from step "outputParser":
// EQUATION: \( x^3 + 7 = 12 \)
//
// SOLUTION:
// Subtract 7 from both sides of the equation:
// \( x^3 = 5 \)
//
// Take the cube root of both sides:
// \( x = \sqrt[3]{5} \)
//
// Therefore, the solution is \( x = \sqrt[3]{5} \)
```

When we stream the chain, we get the following output:
```dart
chain.stream('x raised to the third plus seven equals 12').listen((_){});
// Chunk from step "getMapFromInput":
// {equation_statement: x raised to the third plus seven equals 12}
// ---
// Chunk from step "promptTemplate":
// System: Write out the following equation using algebraic symbols then solve it. Use the format:
// EQUATION:...
// SOLUTION:...
// 
// Human: x raised to the third plus seven equals 12
// ---
// Chunk from step "chatModel":
// ChatResult{
//   id: chatcmpl-9JcdKMy2yBlJhW2fxVu43Qn0gqofK, 
//   output: AIChatMessage{
//     content: E,
//   },
//   finishReason: FinishReason.unspecified,
//   metadata: {
//     model: gpt-3.5-turbo-0125, 
//     created: 1714463766, 
//     system_fingerprint: fp_3b956da36b
//   },
//   usage: LanguageModelUsage{},
//   streaming: true
// }
// ---
// Chunk from step "outputParser":
// E
// ---
// Chunk from step "chatModel":
// ChatResult{
//   id: chatcmpl-9JcdKMy2yBlJhW2fxVu43Qn0gqofK, 
//   output: AIChatMessage{
//     content: QU,
//   },
//   finishReason: FinishReason.unspecified,
//   metadata: {
//     model: gpt-3.5-turbo-0125, 
//     created: 1714463766, 
//     system_fingerprint: fp_3b956da36b
//   },
//   usage: LanguageModelUsage{},
//   streaming: true
// }
// ---
// Chunk from step "outputParser":
// QU
// ---
// Chunk from step "chatModel":
// ChatResult{
//   id: chatcmpl-9JcdKMy2yBlJhW2fxVu43Qn0gqofK, 
//   output: AIChatMessage{
//     content: ATION,
//   },
//   finishReason: FinishReason.unspecified,
//   metadata: {
//     model: gpt-3.5-turbo-0125, 
//     created: 1714463766, 
//     system_fingerprint: fp_3b956da36b
//   },
//   usage: LanguageModelUsage{},
//   streaming: true
// }
// ---
// Chunk from step "outputParser":
// ATION
// ---
// ...
```
