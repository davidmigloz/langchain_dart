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
//   id: chatcmpl-9LBNiPXHzWIwc02rR6sS1HTcL9pOk,
//   output: AIChatMessage{
//     content: Why don't bears wear shoes?\nBecause they have bear feet!,
//   },
//   finishReason: FinishReason.stop,
//   metadata: {
//     model: gpt-3.5-turbo-0125,
//     created: 1714835666,
//     system_fingerprint: fp_3b956da36b
//   },
//   usage: LanguageModelUsage{
//     promptTokens: 13,
//     responseTokens: 13,
//     totalTokens: 26,
//   },
//   streaming: false
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
//   id: chatcmpl-9LBOohTtdg12zD8zzz2GX1ib24UXO,
//   output: AIChatMessage{
//     content: Why don't bears wear shoes? ,
//   },
//   finishReason: FinishReason.stop,
//   metadata: {
//     model: gpt-3.5-turbo-0125,
//     created: 1714835734,
//     system_fingerprint: fp_a450710239
//   },
//   usage: LanguageModelUsage{
//     promptTokens: 13,
//     responseTokens: 8,
//     totalTokens: 21
//   },
//   streaming: false
// }
```

### Attaching Tool Call information

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {foo}',
);

const tool = ToolSpec(
  name: 'joke',
  description: 'A joke',
  inputJsonSchema: {
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
        tools: const [tool],
        toolChoice: ChatToolChoice.forced(name: tool.name),
      ),
    );

final res = await chain.invoke({'foo': 'bears'});
print(res);
// ChatResult{
//   id: chatcmpl-9LBPyaZcFMgjmOvkD0JJKAyA4Cihb,
//   output: AIChatMessage{
//     content: ,
//     toolCalls: [
//       AIChatMessageToolCall{
//         id: call_JIhyfu6jdIXaDHfYzbBwCKdb,
//         name: joke,
//         argumentsRaw: {"setup":"Why don't bears like fast food?","punchline":"Because they can't catch it!"},
//         arguments: {
//           setup: Why don't bears like fast food?,
//           punchline: Because they can't catch it!
//         },
//       }
//     ],
//   },
//   finishReason: FinishReason.stop,
//   metadata: {
//     model: gpt-3.5-turbo-0125,
//     created: 1714835806,
//     system_fingerprint: fp_3b956da36b
//   },
//   usage: LanguageModelUsage{
//     promptTokens: 77,
//     responseTokens: 24,
//     totalTokens: 101
//   },
//   streaming: false
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

### Tools Output Parser

When you specify a tool that the model should call, you may just want to parse the tool call directly.

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate(
  'Tell me a joke about {foo}',
);

const tool = ToolSpec(
  name: 'joke',
  description: 'A joke',
  inputJsonSchema: {
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
        tools: const [tool],
        toolChoice: ChatToolChoice.forced(name: tool.name),
      ),
    ) |
    ToolsOutputParser();

final res = await chain.invoke({'foo': 'bears'});
print(res);
// [ParsedToolCall{
//   id: call_tDYrlcVwk7bCi9oh5IuknwHu,
//   name: joke,
//   arguments: {
//     setup: What do you call a bear with no teeth?, 
//     punchline: A gummy bear!
//   },
// }]
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

However, this is a bit verbose. We can simplify it by using `Runnable.getMapFromInput` which does the same under the hood:

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
