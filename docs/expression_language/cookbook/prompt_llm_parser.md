# Prompt + LLM

The most common and valuable composition is taking:

```
PromptTemplate / ChatPromptTemplate -> LLM / ChatModel -> OutputParser
```

Almost all other chains you build will use this building block.

## PromptTemplate + LLM

The simplest composition is just combing a prompt and model to create a chain that takes user input, adds it to a prompt, passes it to a model, and returns the raw model input.

Note, you can mix and match `PromptTemplate`/`ChatPromptTemplate` and `LLM`/`ChatModel` as you like here.

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {foo}',
);

final chain = promptTemplate | model;

final res = await chain.invoke({'foo': 'bears'});
print(res);
// ChatResult{
//   generations: [
//     ChatGeneration{
//       output: AIChatMessage{
//         content: Why don't bears wear shoes?\n\nBecause they have bear feet!,
//       },
//     },
//   ], 
//   usage: ...,
//   modelOutput: ...,
// }
```

Often times we want to attach options that'll be passed to each model call. You can do this in two ways:

1. Configuring the default options when instantiating the model. This will apply to all calls to the model.
2. Configuring the options when using the model in a chain by using the `.bind` method. This will only apply to the calls in that chain.

Let's look at some examples:

### Attaching Stop Sequences

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {foo}',
);

final chain = promptTemplate | model.bind(ChatOpenAIOptions(stop: ['\n']));

final res = await chain.invoke({'foo': 'bears'});
print(res);
// ChatResult{
//   generations: [
//     ChatGeneration{
//       output: AIChatMessage{
//         content: Why don't bears wear shoes?,
//       },
//     },
//   ], 
//   usage: ...,
//   modelOutput: ...,
// }
```

### Attaching Function Call information

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {foo}',
);

const function = ChatFunction(
  name: 'joke',
  description: 'A joke',
  parameters: {
    'type': 'object',
    'properties': {
      'setup': {
        'type': 'string',
        'description': 'The setup for the joke',
      },
      'punchline': {
        'type': 'string',
        'description': 'The punchline for the joke',
      },
    },
    'required': ['setup', 'punchline'],
  },
);

final chain = promptTemplate |
    model.bind(
      ChatOpenAIOptions(
        functions: const [function],
        functionCall: ChatFunctionCall.forced(functionName: function.name),
      ),
    );

final res = await chain.invoke({'foo': 'bears'});
print(res);
// ChatResult{
//   generations: [
//     ChatGeneration{
//       output: AIChatMessage{
//         content: ,
//         functionCall: AIChatMessageFunctionCall{
//           name: joke,
//           arguments: {
//             setup: Why don't bears wear shoes?,
//             punchline: Because they already have bear feet!
//           },
//         },    
//       },
//     },
//   ], 
//   usage: ...,
//   modelOutput: ...,
// }
```

## PromptTemplate + LLM + OutputParser

We can also add in an output parser to conveniently transform the raw LLM/ChatModel output into a consistent format.

### String Output Parser

If we just want the string output, we can use the `StringOutputParser`:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {foo}',
);

final chain = promptTemplate | model | StringOutputParser();

final res = await chain.invoke({'foo': 'bears'});
print(res);
// Why don't bears wear shoes? Because they have bear feet!
```

Notice that this now returns a string - a much more workable format for downstream tasks.

### Functions Output Parser

When you specify the function to return, you may just want to parse that directly.

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {foo}',
);

const function = ChatFunction(
  name: 'joke',
  description: 'A joke',
  parameters: {
    'type': 'object',
    'properties': {
      'setup': {
        'type': 'string',
        'description': 'The setup for the joke',
      },
      'punchline': {
        'type': 'string',
        'description': 'The punchline for the joke',
      },
    },
    'required': ['setup', 'punchline'],
  },
);

final chain = promptTemplate |
    model.bind(
      ChatOpenAIOptions(
        functions: const [function],
        functionCall: ChatFunctionCall.forced(functionName: function.name),
      ),
    ) |
    JsonOutputFunctionsParser();

final res = await chain.invoke({'foo': 'bears'});
print(res);
// {setup: Why don't bears wear shoes?, punchline: Because they have bear feet!}
```

Or we can even extract one of the arguments from the function call using the `JsonKeyOutputFunctionsParser`:

```dart
final chain = promptTemplate |
    model.bind(
      ChatOpenAIOptions(
        functions: const [function],
        functionCall: ChatFunctionCall.forced(functionName: function.name),
      ),
    ) |
    JsonKeyOutputFunctionsParser(keyName: 'setup');

final res = await chain.invoke({'foo': 'bears'});
print(res);
// Why don't bears wear socks?
```

## Simplifying input

To make invocation even simpler, we can add a `RunnableMap` to take care of creating the prompt input map with a `RunnablePassthrough` to get the input:

```dart
final map = Runnable.fromMap({
  'foo': Runnable.passthrough(),
});
final chain = map | promptTemplate | model | StringOutputParser();
```

*`Runnable.passthrough()` is a convenience method that creates a `RunnablePassthrough` object. This is a `Runnable` that takes the input it receives and passes it through as output.*

However, this is a bit verbose. We can simplify it by using `Runnable.getItemFromMap` which does the same under the hood:

```dart
final chain = Runnable.getMapFromInput('foo') |
    promptTemplate |
    model |
    StringOutputParser();
```

Now, we can invoke the chain with just the input we care about:

```dart
final res = await chain.invoke('bears');
print(res);
// Why don't bears wear shoes? Because they have bear feet!
```
