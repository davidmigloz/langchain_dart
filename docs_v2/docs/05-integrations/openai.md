# OpenAI

This notebook provides a quick overview for getting started with [OpenAI](https://platform.openai.com/docs/introduction) chat models. For detailed documentation of all `ChatOpenAI` features and configurations head to the [API reference](https://pub.dev/documentation/langchain_openai/latest/langchain_openai/ChatOpenAI-class.html).

OpenAI has several chat models. You can find information about their latest models and their costs, context windows, and supported input types in the [OpenAI docs](https://platform.openai.com/docs/models).

> Note that certain OpenAI models can also be accessed via the [Microsoft Azure platform](https://azure.microsoft.com/en-us/products/ai-services/openai-service). Check out the API reference for more information on how to use the Azure with `ChatOpenAI`.

## Setup

To access OpenAI models you'll need to create an OpenAI account, get an API key, and install the [langchain_openai](https://pub.dev/packages/langchain_openai) integration package.

### Credentials

Head to the [OpenAI Platform](https://platform.openai.com), sign up and get your [API key](https://platform.openai.com/account/api-keys).

### Installation

The LangChain.dart OpenAI integration lives in the [langchain_openai](https://pub.dev/packages/langchain_openai) package:

```yaml
dart pub add langchain_openai
```

## Usage

### Instantiation

Now we can instantiate our model object and generate chat completions:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

final chatModel = ChatOpenAI(
  apiKey: openaiApiKey,
  defaultOptions: ChatOpenAIOptions(
    model: 'gpt-4o'
    temperature: 0,
    // ...other options
  ),
);
```

If you are using a proxy, you can override the base URL, headers, and other options:

```dart
final client = ChatOpenAI(
  baseUrl: 'https://my-proxy.com',
  headers: {'x-my-proxy-header': 'value'},
);
```

### Invocation

Now you can generate completions by calling the `invoke` method:

```dart
final messages = [
  ChatMessage.system('You are a helpful assistant that translates English to French.'),
  ChatMessage.humanText('I love programming.'),
];
final prompt = PromptValue.chat(messages);
final res = await llm.invoke(prompt);
// -> 'J'adore la programmation.'
```

### Chaining

We can chain our model with a prompt template or output parser to create a more complex pipeline:

```dart
final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'You are a helpful assistant that translates {input_language} to {output_language}.'),
  (ChatMessageType.human, '{text}'),
]);

final chain = promptTemplate | chatModel | StringOutputParser();

final res = await chain.invoke({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.',
});
print(res);
// -> 'J'adore la programmation.'
```

### Streaming

OpenAI models support [streaming](/docs/06-lcel/05-streaming.md) the output of th model as it is generated. 

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system,
    'You are a helpful assistant that replies only with numbers '
      'in order without any spaces or commas',
  ),
  (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
]);

final chat = ChatOpenAI(apiKey: openaiApiKey);

final chain = promptTemplate.pipe(chat).pipe(StringOutputParser());

final stream = chain.stream({'max_num': '9'});
await stream.forEach(print);
// 123
// 456
// 789
```

### Multimodal support

OpenAI's models have [vision capabilities](https://platform.openai.com/docs/guides/vision), meaning the models can take in images and answer questions about them.

You can send the image as a base64-encoded string:

```dart
final prompt = PromptValue.chat([
  ChatMessage.system('You are a helpful assistant.'),
  ChatMessage.human(
    ChatMessageContent.multiModal([
      ChatMessageContent.text('What fruit is this?'),
      ChatMessageContent.image(
        mimeType: 'image/jpeg',
        data: '/9j/4AAQSkZJRgABAQAAAQABAAD...Rdu1j//2Q==', // base64-encoded image
      ),
    ]),
  ),
]);
```

Or you can send the URL where the image is hosted:

```dart
final prompt = PromptValue.chat([
  ChatMessage.system('You are a helpful assistant.'),
  ChatMessage.human(
    ChatMessageContent.multiModal([
      ChatMessageContent.text('What fruit is this?'),
      ChatMessageContent.image(
        data: 'https://upload.wikimedia.org/wikipedia/commons/9/92/95apple.jpeg',
      ),
    ]),
  ),
]);
```

### Tool calling

OpenAI has a [tool calling](docs/04-how_to/03-tools.md) (we use "tool calling" and "function calling" interchangeably here) API that lets you describe tools and their arguments, and have the model return a JSON object with a tool to invoke and the inputs to that tool. tool-calling is extremely useful for building tool-using chains and agents, and for getting structured outputs from models more generally.


```dart
const tool = ToolSpec(
  name: 'get_current_weather',
  description: 'Get the current weather in a given location',
  inputJsonSchema: {
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The city and country, e.g. San Francisco, US',
      },
    },
    'required': ['location'],
  },
);

final chatModel = ChatOllama(
  defaultOptions: ChatOllamaOptions(
    model: 'gpt-4o'
    temperature: 0,
    tools: [tool],
  ),
);

final res = await chatModel.invoke(
  PromptValue.string('What’s the weather like in Boston and Madrid right now in celsius?'),
);
print(res.output.toolCalls);
// [AIChatMessageToolCall{
//   id: a621064b-03b3-4ca6-8278-f37504901034,
//   name: get_current_weather,
//   arguments: {location: Boston, US},
// }, 
// AIChatMessageToolCall{
//   id: f160d9ba-ae7d-4abc-a910-2b6cd503ec53,
//   name: get_current_weather,
//   arguments: {location: Madrid, ES},
// }]
```

Notice that the returned `AIChatMessage` has a `toolCalls` field. This contains in a standardized tool call format that is model-provider agnostic.

You can also stream OpenAI tool calls. `ToolsOutputParser` is a useful tool for this case, as it concatenates the chunks progressively and tries to complete the partial JSON into a valid one:

```dart
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
        'description': 'The punchline to the joke',
      },
    },
    'required': ['location', 'punchline'],
  },
);
final promptTemplate = ChatPromptTemplate.fromTemplate(
  'tell me a long joke about {foo}',
);
final chat = ChatOpenAI(
  apiKey: openaiApiKey,
  defaultOptions: ChatOpenAIOptions(
    tools: [tool],
    toolChoice: ChatToolChoice.forced(name: 'joke'),
  ),
);
final outputParser = ToolsOutputParser();

final chain = promptTemplate.pipe(chat).pipe(outputParser);

final stream = chain.stream({'foo': 'bears'});
await for (final chunk in stream) {
  final args = chunk.first.arguments;
  print(args);
}
// {}
// {setup: }
// {setup: Why don't}
// {setup: Why don't bears}
// {setup: Why don't bears like fast food}
// {setup: Why don't bears like fast food?, punchline: }
// {setup: Why don't bears like fast food?, punchline: Because}
// {setup: Why don't bears like fast food?, punchline: Because they can't}
// {setup: Why don't bears like fast food?, punchline: Because they can't catch it!}
```

### Structured Outputs

[Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs) is a feature that ensures the model will always generate responses that adhere to your supplied JSON Schema, so you don't need to worry about the model omitting a required key, or hallucinating an invalid enum value.

```dart
final prompt = PromptValue.chat([
  ChatMessage.system(
    'Extract the data of any companies mentioned in the '
    'following statement. Return a JSON list.',
  ),
  ChatMessage.humanText(
    'Google was founded in the USA, while Deepmind was founded in the UK',
  ),
]);
final chatModel = ChatOpenAI(
  apiKey: openaiApiKey,
  defaultOptions: ChatOpenAIOptions(
    model: 'gpt-4o',
    temperature: 0,
    responseFormat: ChatOpenAIResponseFormat.jsonSchema(
      ChatOpenAIJsonSchema(
        name: 'Companies',
        description: 'A list of companies',
        strict: true,
        schema: {
          'type': 'object',
          'properties': {
            'companies': {
              'type': 'array',
              'items': {
                'type': 'object',
                'properties': {
                  'name': {'type': 'string'},
                  'origin': {'type': 'string'},
                },
                'additionalProperties': false,
                'required': ['name', 'origin'],
              },
            },
          },
          'additionalProperties': false,
          'required': ['companies'],
        },
      ),
    ),
  ),
);

final res = await chatModel.invoke(prompt);
// {
//   "companies": [
//     {
//       "name": "Google",
//       "origin": "USA"
//     },
//     {
//       "name": "Deepmind",
//       "origin": "UK"
//     }
//   ]
// }
```

When you use `strict: true`, the model outputs will match the supplied schema exactly. Mind that the strict mode only support a [subset of JSON schema](https://platform.openai.com/docs/guides/structured-outputs/supported-schemas) for performance reasons. Under-the-hood, OpenAI uses a technique known as constrained sampling or constrained decoding. For each JSON Schema, they compute a grammar that represents that schema, and pre-process its components to make it easily accessible during model sampling. This is why the first request with a new schema incurs a latency penalty. Typical schemas take under 10 seconds to process on the first request, but more complex schemas may take up to a minute.

### JSON mode

When [JSON mode](https://platform.openai.com/docs/guides/structured-outputs/json-mode) is turned on, the model's output is ensured to be valid JSON. You can use it in combination with a `JsonOutputParser` to parse the response into a JSON map.

> JSON mode is a more basic version of the Structured Outputs feature. While JSON mode ensures that model output is valid JSON, Structured Outputs reliably matches the model's output to the schema you specify. It is recommended that you use Structured Outputs if it is supported for your use case.

```dart
final prompt = PromptValue.chat([
  ChatMessage.system(
    "Extract the 'name' and 'origin' of any companies mentioned in the "
        'following statement. Return a JSON list.',
  ),
  ChatMessage.humanText(
    'Google was founded in the USA, while Deepmind was founded in the UK',
  ),
]);
final llm = ChatOpenAI(
  apiKey: openaiApiKey,
  defaultOptions: const ChatOpenAIOptions(
    model: 'gpt-4-turbo',
    temperature: 0,
    responseFormat: ChatOpenAIResponseFormat.jsonObject,
  ),
);
final chain = llm.pipe(JsonOutputParser());
final res = await chain.invoke(prompt);
print(res);
// {
//   "companies": [
//     {
//       "name": "Google",
//       "origin": "USA"
//     },
//     {
//       "name": "Deepmind",
//       "origin": "UK"
//     }
//   ]
// }
```

### Fine-tuning

You can call [fine-tuned OpenAI models](https://platform.openai.com/docs/guides/fine-tuning) by passing in your corresponding modelName parameter.

This generally takes the form of `ft:{OPENAI_MODEL_NAME}:{ORG_NAME}::{MODEL_ID}`. For example:

```dart
final chatModel = ChatOpenAI(
  apiKey: openaiApiKey,
  defaultOptions: ChatOpenAIOptions(
    model: 'ft:gpt-3.5-turbo-0613:langchain::7qTVM5AR'
  ),
);
```

## API reference

For detailed documentation of all ChatOpenAI features and configurations head to the [API reference](https://pub.dev/documentation/langchain_openai/latest).
