# RunnableBinding: Configuring runnables at runtime

Sometimes we want to invoke a `Runnable` within a `Runnable` sequence with constant options that are not part of the output of the preceding `Runnable` in the sequence, and which are not part of the user input. We can use `Runnable.bind()` to pass these options in.

Suppose we have a simple prompt + model sequence:

```dart
final model = ChatOpenAI(apiKey: openaiApiKey);
const outputParser = StringOutputParser<ChatResult>();

final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system,
    'Write out the following equation using algebraic symbols then solve it. '
        'Use the format\n\nEQUATION:...\nSOLUTION:...\n\n'),
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

and want to call the model with certain `stop` words:

```dart
final chain2 = Runnable.getMapFromInput<String>('equation_statement')
    .pipe(promptTemplate)
    .pipe(model.bind(ChatOpenAIOptions(stop: ['SOLUTION'])))
    .pipe(outputParser);
final res2 = await chain2.invoke('x raised to the third plus seven equals 12');
print(res2);
// EQUATION: \( x^3 + 7 = 12 \)
```

You can use this pattern to configure different options for the same runnable without having to create a new instance. For example, you can use different models for different prompts:

```dart
final chatModel = ChatOpenAI(apiKey: openaiApiKey);
const outputParser = StringOutputParser<ChatResult>();
final prompt1 = PromptTemplate.fromTemplate('How are you {name}?');
final prompt2 = PromptTemplate.fromTemplate('How old are you {name}?');

final chain = Runnable.fromMap({
  'q1': prompt1 |
  chatModel.bind(ChatOpenAIOptions(model: 'gpt-4-turbo')) |
  outputParser,
  'q2': prompt2 |
  chatModel.bind(ChatOpenAIOptions(model: 'gpt-3.5-turbo')) |
  outputParser,
});

final res = await chain.invoke({'name': 'David'});
print(res);
// {q1: Hello! I'm just a computer program, so I don't have feelings,
// q2: I am an AI digital assistant, so I do not have an age like humans do.}
```

Another similar use case is to use different `temperature` settings for different parts of the chain. You can easily do this by using `model.bind(ChatOpenAIOptions(temperature: 1))` as shown above.

## Attaching tools

One particularly useful application of `Runnable.bind()` is to attach the tools that the model can call.

```dart
final model = ChatOpenAI(apiKey: openaiApiKey);
final outputParser = ToolsOutputParser();

final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'Write out the following equation using algebraic symbols then solve it.'),
  (ChatMessageType.human, '{equation_statement}'),
]);

const tool = ToolSpec(
  name: 'solver',
  description: 'Formulates and solves an equation',
  inputJsonSchema: {
    'type': 'object',
    'properties': {
      'equation': {
        'type': 'string',
        'description': 'The algebraic expression of the equation',
      },
      'solution': {
        'type': 'string',
        'description': 'The solution to the equation',
      },
    },
    'required': ['equation', 'solution'],
  },
);

final chain = Runnable.getMapFromInput<String>('equation_statement')
    .pipe(promptTemplate)
    .pipe(model.bind(ChatOpenAIOptions(tools: [tool])))
    .pipe(outputParser);

final res = await chain.invoke('x raised to the third plus seven equals 12');
print(res);
// [ParsedToolCall{
//   id: call_T2Y3g7rU5s0CzEG4nL35FJYK,
//   name: solver,
//   arguments: {
//     equation: x^3 + 7 = 12, 
//     solution: x = 1
//   },
// }]
```
