# OpenAI Dart Client

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![openai_dart](https://img.shields.io/pub/v/openai_dart.svg)](https://pub.dev/packages/openai_dart)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Unofficial Dart client for [OpenAI](https://platform.openai.com/docs/api-reference) API.

## Features

- Generated from the official OpenAI [OpenAPI specification](https://github.com/openai/openai-openapi)
- Fully type-safe, [documented](https://pub.dev/documentation/openai_dart/latest/) and tested
- All platforms supported (including streaming on web)
- Authentication with organization support
- Custom base URL, headers and query params support (e.g. HTTP proxies)
- Custom HTTP client support (e.g. SOCKS5 proxies or advanced use cases)
- Partial Azure OpenAI API support
- It can be used to consume OpenAI-compatible APIs like [TogetherAI](https://www.together.ai/), [Anyscale](https://www.anyscale.com/), [OpenRouter](https://openrouter.ai), [One API](https://github.com/songquanpeng/one-api), etc.

**Supported endpoints:**

- Chat (with tools and streaming support)
- Completions (legacy)
- Embeddings
- Fine-tuning
- Images
- Models
- Moderations
- Assistants (beta)
- Threads (beta)
- Messages (beta)
- Runs (beta)

## Table of contents

- [Usage](#usage)
  * [Authentication](#authentication)
    + [Organization (optional)](#organization-optional)
  * [Chat](#chat)
  * [Completions (legacy)](#completions-legacy)
  * [Embeddings](#embeddings)
  * [Fine-tuning](#fine-tuning)
  * [Images](#images)
  * [Models](#models)
  * [Moderations](#moderations)
  * [Assistants (beta)](#assistants-beta)
  * [Threads (beta)](#threads-beta)
  * [Messages (beta)](#messages-beta)
  * [Runs (beta)](#runs-beta)
- [Advance Usage](#advance-usage)
  * [Azure OpenAI Service](#azure-openai-service)
  * [Default HTTP client](#default-http-client)
  * [Custom HTTP client](#custom-http-client)
  * [Using a proxy](#using-a-proxy)
    + [HTTP proxy](#http-proxy)
    + [SOCKS5 proxy](#socks5-proxy)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Usage

### Authentication

The OpenAI API uses API keys for authentication. Visit your [API Keys](https://platform.openai.com/account/api-keys) page to retrieve the API key you'll use in your requests.

> **Remember that your API key is a secret!**  
> Do not share it with others or expose it in any client-side code (browsers, apps). Production requests must be routed through your own backend server where your API key can be securely loaded from an environment variable or key management service.

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
final client = OpenAIClient(apiKey: openaiApiKey);
```

#### Organization (optional)

For users who belong to multiple organizations, you can specify which organization is used for an API request. Usage from these API requests will count against the specified organization's subscription quota.

```dart
final client = OpenAIClient(
  apiKey: openaiApiKey,
  organization: 'org-dtDDtkEGoFccn5xaP5W1p3Rr',
);
```

### Chat

Given a list of messages comprising a conversation, the model will return a response.

Related guide: [Chat Completions](https://platform.openai.com/docs/guides/text-generation)

**Create chat completion:**

```dart
final res = await client.createChatCompletion(
  request: CreateChatCompletionRequest(
    model: ChatCompletionModel.modelId('gpt-4'),
    messages: [
      ChatCompletionMessage.system(
        content: 'You are a helpful assistant.',
      ),
      ChatCompletionMessage.user(
        content: ChatCompletionUserMessageContent.string('Hello!'),
      ),
    ],
    temperature: 0,
  ),
);
print(res.choices.first.message.content);
// Hello! How can I assist you today?
```

`ChatCompletionModel` is a sealed class that offers two ways to specify the model:
- `ChatCompletionModel.modelId('model-id')`: the model ID as string (e.g. `'gpt-4'` or your fine-tuned model ID).
- `ChatCompletionModel.model(ChatCompletionModels.gpt4)`: a value from `ChatCompletionModels` enum which lists all of the available models.

`ChatCompletionMessage` is a sealed class that supports the following message types:
- `ChatCompletionMessage.system()`: a system message.
- `ChatCompletionMessage.user()`: a user message.
- `ChatCompletionMessage.assistant()`: an assistant message.
- `ChatCompletionMessage.tool()`: a tool message.
- `ChatCompletionMessage.function()`: a function message.

`ChatCompletionMessage.user()` takes a `ChatCompletionUserMessageContent` object that supports the following content types:
- `ChatCompletionUserMessageContent.string('content')`: string content.
- `ChatCompletionUserMessageContent.parts([...])`: multi-modal content (check the 'Multi-modal prompt' section below).
  * `ChatCompletionMessageContentPart.text('content')`: text content.
  * `ChatCompletionMessageContentPart.image(imageUrl: ...)`: image content.

**Stream chat completion:**

```dart
final stream = client.createChatCompletionStream(
  request: CreateChatCompletionRequest(
    model: ChatCompletionModel.modelId('gpt-3.5-turbo'),
    messages: [
      ChatCompletionMessage.system(
        content:
            'You are a helpful assistant that replies only with numbers '
            'in order without any spaces or commas',
      ),
      ChatCompletionMessage.user(
        content: ChatCompletionUserMessageContent.string(
          'List the numbers from 1 to 9',
        ),
      ),
    ],
  ),
);
await for (final res in stream) {
  print(res.choices.first.delta.content);
}
// 123
// 456
// 789
```

**Multi-modal prompt:**

```dart
final res = await client.createChatCompletion(
  request: CreateChatCompletionRequest(
    model: ChatCompletionModel.model(
      ChatCompletionModels.gpt4VisionPreview,
    ),
    messages: [
      ChatCompletionMessage.system(
        content: 'You are a helpful assistant.',
      ),
      ChatCompletionMessage.user(
        content: ChatCompletionUserMessageContent.parts(
          [
            ChatCompletionMessageContentPart.text(
              text: 'What fruit is this?',
            ),
            ChatCompletionMessageContentPart.image(
              imageUrl: ChatCompletionMessageImageUrl(
                url: 'https://upload.wikimedia.org/wikipedia/commons/9/92/95apple.jpeg',
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);
print(res.choices.first.message.content);
// The fruit in the image is an apple.
```

**JSON mode:**

```dart
final res = await client.createChatCompletion(
  request: CreateChatCompletionRequest(
    model: ChatCompletionModel.model(
      ChatCompletionModels.gpt41106Preview,
    ),
    messages: [
      ChatCompletionMessage.system(
        content:
          'You are a helpful assistant. That extracts names from text '
          'and returns them in a JSON array.',
      ),
      ChatCompletionMessage.user(
        content: ChatCompletionUserMessageContent.string(
          'John, Mary, and Peter.',
        ),
      ),
    ],
    temperature: 0,
    responseFormat: ChatCompletionResponseFormat(
      type: ChatCompletionResponseFormatType.jsonObject,
    ),
  ),
);
// { "names": ["John", "Mary", "Peter"] }
```

**Tools:**

```dart
const function = FunctionObject(
  name: 'get_current_weather',
  description: 'Get the current weather in a given location',
  parameters: {
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The city and state, e.g. San Francisco, CA',
      },
      'unit': {
        'type': 'string',
        'description': 'The unit of temperature to return',
        'enum': ['celsius', 'fahrenheit'],
      },
    },
    'required': ['location'],
  },
);
const tool = ChatCompletionTool(
  type: ChatCompletionToolType.function,
  function: function,
);

final res1 = await client.createChatCompletion(
  request: CreateChatCompletionRequest(
    model: const ChatCompletionModel.model(
      ChatCompletionModels.gpt35Turbo,
    ),
    messages: [
      ChatCompletionMessage.system(
        content: 'You are a helpful assistant.',
      ),
      ChatCompletionMessage.user(
        content: ChatCompletionUserMessageContent.string(
          'What’s the weather like in Boston right now?',
        ),
      ),
    ],
    tools: [tool],
    toolChoice: ChatCompletionToolChoiceOption.tool(
      ChatCompletionNamedToolChoice(
        type: ChatCompletionNamedToolChoiceType.function,
        function: ChatCompletionFunctionCallOption(name: function.name),
      ),
    ),
  ),
);

final toolCall = res1.choices.first.message.toolCalls!.first;
final functionCall = toolCall.function;
final arguments = json.decode(functionCall.arguments) as Map<String, dynamic>;
final functionResult = getCurrentWeather(arguments['location'], arguments['unit']);

final res2 = await client.createChatCompletion(
  request: CreateChatCompletionRequest(
    model: ChatCompletionModel.modelId('gpt-3.5-turbo'),
    messages: [
      ChatCompletionMessage.system(
        content: 'You are a helpful assistant.',
      ),
      ChatCompletionMessage.user(
        content: ChatCompletionUserMessageContent.string(
          'What’s the weather like in Boston right now?',
        ),
      ),
      ChatCompletionMessage.tool(
        toolCallId: toolCall.id,
        content: json.encode(functionResult),
      ),
    ],
    tools: [tool],
  ),
);
final answer = res2.choices.first.message.content;
// The weather in Boston right now is sunny with a temperature of 22°C
```

**Function calling:** (deprecated in favor of tools)

```dart
const function = FunctionObject(
  name: 'get_current_weather',
  description: 'Get the current weather in a given location',
  parameters: {
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The city and state, e.g. San Francisco, CA',
      },
      'unit': {
        'type': 'string',
        'description': 'The unit of temperature to return',
        'enum': ['celsius', 'fahrenheit'],
      },
    },
    'required': ['location'],
  },
);

final res1 = await client.createChatCompletion(
  request: CreateChatCompletionRequest(
    model: ChatCompletionModel.modelId('gpt-3.5-turbo'),
    messages: [
      ChatCompletionMessage.system(
        content: 'You are a helpful assistant.',
      ),
      ChatCompletionMessage.user(
        content: ChatCompletionUserMessageContent.string(
          'What’s the weather like in Boston right now?',
        ),
      ),
    ],
    functions: [function],
  ),
);

final arguments = json.decode(
  res1.choices.first.message.functionCall!.arguments,
) as Map<String, dynamic>;
final functionResult = getCurrentWeather(arguments['location'], arguments['unit']);

final res2 = await client.createChatCompletion(
  request: CreateChatCompletionRequest(
    model: ChatCompletionModel.modelId('gpt-3.5-turbo'),
    messages: [
      ChatCompletionMessage.system(
        content: 'You are a helpful assistant.',
      ),
      ChatCompletionMessage.user(
        content: ChatCompletionUserMessageContent.string(
          'What’s the weather like in Boston right now?',
        ),
      ),
      ChatCompletionMessage.function(
        name: function.name,
        content: json.encode(functionResult),
      ),
    ],
    functions: [function],
  ),
);
final answer = res2.choices.first.message.content;
// The weather in Boston right now is sunny with a temperature of 22°C
```

### Completions (legacy)

Given a prompt, the model will return one or more predicted completions, and can also return the probabilities of alternative tokens at each position.

> Most developer should use our Chat Completions API to leverage our best and newest models. 
> Most models that support the legacy Completions endpoint will be shut off on January 4th, 2024.

**Create completion:**

```dart
final res = await client.createCompletion(
  request: CreateCompletionRequest(
    model: CompletionModel.modelId('gpt-3.5-turbo-instruct'),
    prompt: CompletionPrompt.string('Say this is a test'),
    maxTokens: 7,
    temperature: 0,
  ),
);
print(res.choices.first.text);
// This is a test.
```

`CompletionModel` is a sealed class that offers two ways to specify the model:
- `CompletionModel.modelId('model-id')`: the model ID as string (e.g. `'gpt-3.5-turbo-instruct'` or your fine-tuned model ID).
- `CompletionModel.model(CompletionModels.gpt35TurboInstruct)`: a value from `CompletionModels` enum which lists all of the available models.

`CompletionPrompt` is a sealed class that offers four ways to specify the prompt:
- `CompletionPrompt.string('prompt')`: the prompt as string.
- `CompletionPrompt.tokens([...])`: the tokenized prompt.
- `CompletionPrompt.listString(['prompt'])`: batch of string prompts.
- `CompletionPrompt.listTokens([[...]])`: batch of tokenized prompts.

**Stream completion:**

```dart
final stream = client.createCompletionStream(
  request: CreateCompletionRequest(
    model: 'gpt-3.5-turbo-instruct',
    prompt: [
      'Say this is a test',
    ],
    maxTokens: 7,
    temperature: 0,
  ),
);
await for (final res in stream) {
  print(res.choices.first.text);
}
```

### Embeddings

Get a vector representation of a given input that can be easily consumed by machine learning models and algorithms.

Related guide: [Embeddings](https://platform.openai.com/docs/guides/embeddings)

**Create embedding:**

```dart
final res = await client.createEmbedding(
  request: CreateEmbeddingRequest(
    model: EmbeddingModel.modelId('text-embedding-3-small'),
    input: EmbeddingInput.string('The food was delicious and the waiter...'),
  ),
);
print(res.data.first.embeddingVector);
// [0.002253932, -0.009333183, 0.01574578, -0.007790351, -0.004711035, ...]
```

`EmbeddingModel` is a sealed class that offers two ways to specify the model:
- `EmbeddingModel.modelId('model-id')`: the model ID as string.
- `EmbeddingModel.model(EmbeddingModels.textEmbedding3Small)`: a value from `EmbeddingModels` enum which lists all of the available models.

`EmbeddingInput` is a sealed class that offers four ways to specify the embedding input:
- `EmbeddingInput.string('input')`: the input as string.
- `EmbeddingInput.tokens([...])`: the tokenized input.
- `EmbeddingInput.listString(['input'])`: batch of string inputs.
- `EmbeddingInput.listTokens([[...]])`: batch of tokenized inputs.

You can also request the embedding vector encoded as a base64 string:

```dart
final res = await client.createEmbedding(
  request: CreateEmbeddingRequest(
    model: EmbeddingModel.modelId('text-embedding-3-small'),
    input: EmbeddingInput.string('The food was delicious and the waiter...'),
    encodingFormat: EmbeddingEncodingFormat.base64,
  ),
);
print(res.data.first.embeddingVectorBase64);
// tLYTOzXqGLxL/YA8M0b/uwdfmrsdNXM8iJIfvEOOHL3IJeK7Ok3rv...
```

### Fine-tuning

Manage fine-tuning jobs to tailor a model to your specific training data.

Related guide: [Fine-tune models](https://platform.openai.com/docs/guides/fine-tuning)

**Create fine-tuning job:**

```dart
const request = CreateFineTuningJobRequest(
  model: FineTuningModel.modelId('gpt-3.5-turbo'),
  trainingFile: 'file-abc123',
  validationFile: 'file-abc123',
  hyperparameters: FineTuningJobHyperparameters(
    nEpochs: FineTuningNEpochs.mode(FineTuningNEpochsOptions.auto),
  ),
);
final res = await client.createFineTuningJob(request: request);
```

**List fine-tuning jobs:**

```dart
final res = await client.listPaginatedFineTuningJobs();
```

**Retrieve fine-tuning job:**

```dart
final res = await client.retrieveFineTuningJob(
  fineTuningJobId: 'ft-AF1WoRqd3aJAHsqc9NY7iL8F',
);
```

**Cancel fine-tuning job:**

```dart
final res = await client.cancelFineTuningJob(
  fineTuningJobId: 'ft-AF1WoRqd3aJAHsqc9NY7iL8F',
);
```

**List fine-tuning events:**

```dart
final res = await client.listFineTuningEvents(
  fineTuningJobId: 'ft-AF1WoRqd3aJAHsqc9NY7iL8F',
);
```

### Images

Given a prompt and/or an input image, the model will generate a new image.

Related guide: [Image generation](https://platform.openai.com/docs/guides/images)

**Create image:**

```dart
final res = await client.createImage(
  request: CreateImageRequest(
    model: CreateImageRequestModel.model(ImageModels.dallE3),
    prompt: 'A cute baby sea otter',
    quality: ImageQuality.hd,
    size: ImageSize.v1024x1792,
    style: ImageStyle.natural,
  ),
);
print(res.data.first.url);
// https://oaidalleapiprodscus.blob.core.windows.net/private/...
```

### Models

List and describe the various models available in the API. You can refer to the [Models](https://platform.openai.com/docs/models) documentation to understand what models are available and the differences between them.

**List models:**

```dart
final res = await client.listModels();
print(res.data.first.id);
// text-search-babbage-doc-001
```

**Retrieve model:**

```dart
final res = await client.retrieveModel(model: 'gpt-4');
print(res.ownedBy);
// openai
```

**Delete fine-tune model:**

```dart
final res = await client.deleteModel(
  model: 'ft:gpt-3.5-turbo-0613:langchain::7qTVM5AR',
);
print(res.deleted);
// true
```

### Moderations

Given an input text, outputs if the model classifies it as violating OpenAI's content policy.

Related guide: [Moderations](https://platform.openai.com/docs/guides/moderation)

**Create moderation:**

```dart
final res = await client.createModeration(
  request: CreateModerationRequest(
    model: ModerationModel.modelId('text-moderation-latest'),
    input: ModerationInput.string('I want to kill them.'),
  ),
);
print(res.results.first.categories.violence);
// true
print(res.results.first.categoryScores.violence);
// 0.9925811290740967
```

`ModerationModel` is a sealed class that offers two ways to specify the model:
- `ModerationModel.modelId('model-id')`: the model ID as string.
- `ModerationModel.model(ModerationModels.textModerationLatest)`: a value from `ModerationModels` enum which lists all of the available models.

`ModerationInput` is a sealed class that offers four ways to specify the embedding input:
- `ModerationInput.string('input')`: the input as string.
- `ModerationInput.listString(['input'])`: batch of string inputs.

### Assistants (beta)

Build assistants that can call models and use tools to perform tasks.

[Get started with the Assistants API](https://platform.openai.com/docs/assistants/overview)

**Create assistant:**

```dart
final res = await client.createAssistant(
  request: CreateAssistantRequest(
    model: CreateAssistantRequestModel.string('gpt-4'),
    name: 'Math Tutor',
    description: 'Help students with math homework',
    instructions: 'You are a personal math tutor. Write and run code to answer math questions.',
    tools: [AssistantTools.codeInterpreter()],
  ),
);
```

**Create assistant file:**

```dart
final res = await client.createAssistantFile(
  assistantId: assistantId,
  request: CreateAssistantFileRequest(fileId: fileId),
);
```

**List assistants:**

```dart
final res = await client.listAssistants();
```

**List assistant files:**

```dart
final res = await client.listAssistantFiles(assistantId: assistantId);
```

**Retrieve assistant:**

```dart
final res = await client.getAssistant(assistantId: assistantId);
```

**Retrieve assistant file:**

```dart
final res = await client.getAssistantFile(assistantId: assistantId, fileId: fileId);
```

**Modify assistant:**

```dart
final res = await client.modifyAssistant(
  assistantId: assistantId,
  request: ModifyAssistantRequest(name: 'New name'),
);
```

**Delete assistant:**

```dart
final res = await client.deleteAssistant(assistantId: assistantId);
```

**Delete assistant file:**

```dart
final res = await client.deleteAssistantFile(assistantId: assistantId, fileId: fileId);
```

### Threads (beta)

Create threads that assistants can interact with.

Related guide: [Assistants](https://platform.openai.com/docs/assistants/overview)

**Create thread:**

```dart
final res = await client.createThread(
  request: CreateThreadRequest(),
);
```

**Retrieve thread:**

```dart
final res = await client.getThread(threadId: threadId);
```

**Modify thread:**

```dart
final res = await client.modifyThread(
  threadId: threadId,
  request: ModifyThreadRequest(metadata: {'new': 'metadata'}),
);
```

**Delete thread:**

```dart
final res = await client.deleteThread(threadId: threadId);
```

### Messages (beta)

Create messages within threads.

Related guide: [Assistants](https://platform.openai.com/docs/assistants/overview)

**Create message:**

```dart
final res = await client.createThreadMessage(
  threadId: threadId,
  request: CreateMessageRequest(
    role: CreateMessageRequestRole.user,
    content: 'I need to solve the equation `3x + 11 = 14`. Can you help me?',
  ),
);
```

**List messages:**

```dart
final res = await client.listThreadMessages(threadId: threadId);
```

**List message files:**

```dart
final res = await client.listThreadMessageFiles(threadId: threadId, messageId: messageId);
```

**Retrieve message:**

```dart
final res = await client.getThreadMessage(threadId: threadId, messageId: messageId);
```

**Retrieve message file:**

```dart
final res = await client.getThreadMessageFile(
  threadId: threadId,
  messageId: messageId,
  fileId: fileId,
);
```

**Modify message:**

```dart
final res = await client.modifyThreadMessage(
  threadId: threadId,
  messageId: messageId,
  request: ModifyMessageRequest(metadata: {'new': 'metadata'}),
);
```

### Runs (beta)

Represents an execution run on a thread.

Related guide: [Assistants](https://platform.openai.com/docs/assistants/overview)

**Create run:**

```dart
final res = await client.createThreadRun(
  threadId: threadId,
  request: CreateRunRequest(
    assistantId: assistantId,
    instructions: 'Please address the user as Jane Doe. The user has a premium account.',
  ),
);
```

**Create thread and run:**

```dart
final res = await client.createThreadAndRun(
  request: CreateThreadAndRunRequest(
    assistantId: assistantId,
    instructions: 'Please address the user as Jane Doe. The user has a premium account.',
  ),
);
```

**List runs:**

```dart
final res = await client.listThreadRuns(threadId: threadId);
```

**List run steps:**

```dart
final res = await client.listThreadRunSteps(threadId: threadId, runId: runId);
```

**Retrieve run:**

```dart
final res = await client.getThreadRun(threadId: threadId, runId: runId);
```

**Retrieve run step:**

```dart
final res = await client.getThreadRunStep(threadId: threadId, runId: runId, stepId: stepId);
```

**Modify run:**

```dart
final res = await client.modifyThreadRun(
  threadId: threadId,
  runId: runId,
  request: ModifyRunRequest(metadata: {'new': 'metadata'}),
);
```

**Submit tool outputs to run:**

```dart
final res = await client.submitThreadToolOutputsToRun(
  threadId: threadId,
  runId: runId,
  request: SubmitToolOutputsRunRequest(
    toolOutputs: [
      RunSubmitToolOutput(
        toolCallId: 'call_abc123',
        output: '28C',
      ),
    ],
  ),
);
```

**Cancel a run:**

```dart
final res = await client.cancelThreadRun(threadId: threadId, runId: runId);
```

## Advance Usage

### Azure OpenAI Service

OpenAI's models are also available as an [Azure service](https://learn.microsoft.com/en-us/azure/ai-services/openai/overview). 

Although the Azure OpenAI API is similar to the official OpenAI API, there are subtle differences between them. This client is intended to be used with the official OpenAI API, but most of the functionality should work with the Azure OpenAI API as well.

If you want to use this client with the Azure OpenAI API (at your own risk), you can do so by instantiating the client as follows:

```dart
final client = OpenAIClient(
  baseUrl: 'https://YOUR_RESOURCE_NAME.openai.azure.com/openai/deployments/YOUR_DEPLOYMENT_NAME',
  headers: { 'api-key': 'YOUR_API_KEY' },
  queryParams: { 'api-version': 'API_VERSION' },
);
```

- `YOUR_RESOURCE_NAME`: This value can be found in the Keys & Endpoint section when examining your resource from the Azure portal.
- `YOUR_DEPLOYMENT_NAME`: This value will correspond to the custom name you chose for your deployment when you deployed a model. This value can be found under Resource Management > Deployments in the Azure portal.
- `YOUR_API_KEY`: This value can be found in the Keys & Endpoint section when examining your resource from the Azure portal.
- `API_VERSION`: The Azure OpenAI API version to use (e.g. `2023-05-15`). Try to use the [latest version available](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/cognitiveservices/data-plane/AzureOpenAI/inference), it will probably be the closest to the official OpenAI API.

### OpenAI-compatible APIs

This client can be used to consume APIs that are compatible with the OpenAI API spec.

[TogetherAI](https://www.together.ai/):

```dart
final client = OpenAIClient(
  baseUrl: 'https://api.together.xyz/v1',
  headers: { 'api-key': 'YOUR_TOGETHER_AI_API_KEY' },
);
```

[Anyscale](https://www.anyscale.com/):

```dart
final client = OpenAIClient(
  baseUrl: 'https://api.endpoints.anyscale.com/v1',
  headers: { 'api-key': 'YOUR_ANYSCALE_API_KEY' },
);
```

[OpenRouter](https://openrouter.ai):

```dart
final client = OpenAIClient(
  baseUrl: 'https://openrouter.ai/api/v1',
  headers: { 'api-key': 'YOUR_OPEN_ROUTER_API_KEY' },
);
```

Etc.

### Default HTTP client

By default, the client uses the following implementation of `http.Client`:

- Non-web: [`IOClient`](https://pub.dev/documentation/http/latest/io_client/IOClient-class.html)
- Web: [`FetchClient`](https://pub.dev/documentation/fetch_client/latest/fetch_client/FetchClient-class.html) (to support streaming on web)

### Custom HTTP client

You can always provide your own implementation of `http.Client` for further customization:

```dart
final client = OpenAIClient(
  apiKey: 'OPENAI_API_KEY',
  client: MyHttpClient(),
);
```

### Using a proxy

#### HTTP proxy

You can use your own HTTP proxy by overriding the `baseUrl` and providing your required `headers`:

```dart 
final client = OpenAIClient(
  baseUrl: 'https://my-proxy.com',
  headers: {
      'x-my-proxy-header': 'value',
  },
);
```

If you need further customization, you can always provide your own `http.Client`.

#### SOCKS5 proxy

To use a SOCKS5 proxy, you can use the [`socks5_proxy`](https://pub.dev/packages/socks5_proxy) package:

```dart
final baseHttpClient = HttpClient();
SocksTCPClient.assignToHttpClient(baseHttpClient, [
  ProxySettings(InternetAddress.loopbackIPv4, 1080),
]);
final httpClient = IOClient(baseClient);

final client = OpenAIClient(
  client: httpClient,
);
```

## Acknowledgements

The generation of this client was made possible by the [openapi_spec](https://github.com/tazatechnology/openapi_spec) package.

## License

OpenAI Dart Client is licensed under the [MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
