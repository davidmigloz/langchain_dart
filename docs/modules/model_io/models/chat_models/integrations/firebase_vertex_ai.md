# Vertex AI for Firebase

The [Vertex AI Gemini API](https://firebase.google.com/docs/vertex-ai) gives you access to the latest generative AI models from Google: the Gemini models. If you need to call the Vertex AI Gemini API directly from your mobile or web app you can use the `ChatFirebaseVertexAI` class instead of the [`ChatVertexAI`](/modules/model_io/models/chat_models/integrations/gcp_vertex_ai.md) class which is designed to be used on the server-side. 

`ChatFirebaseVertexAI` is built specifically for use with mobile and web apps, offering security options against unauthorized clients as well as integrations with other Firebase services.

## Key capabilities

- **Multimodal input**: The Gemini models are multimodal, so prompts sent to the Gemini API can include text, images (even PDFs), video, and audio.
- **Growing suite of capabilities**: You can call the Gemini API directly from your mobile or web app, build an AI chat experience, use function calling, and more. 
- **Security for production apps**: Use Firebase App Check to protect the Vertex AI Gemini API from abuse by unauthorized clients.
- **Robust infrastructure**: Take advantage of scalable infrastructure that's built for use with mobile and web apps, like managing structured data with Firebase database offerings (like Cloud Firestore) and dynamically setting run-time configurations with Firebase Remote Config.

## Setup

### 1. Set up a Firebase project

Check the [Firebase documentation](https://firebase.google.com/docs/vertex-ai/get-started?platform=flutter) for the latest information on how to set up the Vertex AI for Firebase in your Firebase project.

In summary, you need to:
1. Upgrade your billing plan to the Blaze pay-as-you-go pricing plan.
2. Enable the required APIs (`aiplatform.googleapis.com` and `firebaseml.googleapis.com`).
3. Integrate the Firebase SDK into your app (if you haven't already).
4. Recommended: Enable Firebase App Check to protect the Vertex AI Gemini API from abuse by unauthorized clients.

### 2. Add the LangChain.dart Google package

Add the `langchain_google` package to your `pubspec.yaml` file.

```yaml
dependencies:
  langchain: {version}
  langchain_google: {version}
```

Internally, `langchain_google` uses the [`firebase_vertexai`](https://pub.dev/packages/firebase_vertexai) SDK to interact with the Vertex AI for Firebase API.

### 3. Initialize your Firebase app

```yaml 
await Firebase.initializeApp();
```

### 4. Call the Vertex AI Gemini API

```dart
final chatModel = ChatFirebaseVertexAI();
final chatPrompt = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'You are a helpful assistant that translates {input_language} to {output_language}.'),
  (ChatMessageType.human, 'Text to translate:\n{text}'),
]);

final chain = chatPrompt | chatModel | StringOutputParser();

final res = await chain.invoke({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.',
});
print(res);
// -> 'J'adore programmer.'
```

> Check out the [sample project](https://github.com/davidmigloz/langchain_dart/tree/main/packages/langchain_firebase/example) to see a complete project using Vertex AI for Firebase.

## Available models

The following models are available:
- `gemini-1.0-pro`
  * text -> text model
  * Max input token: 30720
  * Max output tokens: 2048
- `gemini-1.0-pro-vision`:
  * text / image -> text model
  * Max input token: 12288
  * Max output tokens: 4096
- `gemini-1.5-pro-preview-0514`:
  * text / image / audio -> text model
  * Max input token: 1048576
  * Max output tokens: 8192
- `gemini-1.5-flash-preview-0514`:
  * text / image / audio -> text model
  * Max input token: 1048576
  * Max output tokens: 8192
      
Mind that this list may not be up-to-date. Refer to the [documentation](https://firebase.google.com/docs/vertex-ai/gemini-models) for the updated list.

## Multimodal support

```dart
final chatModel = ChatFirebaseVertexAI(
  defaultOptions: ChatFirebaseVertexAIOptions(
    model: 'gemini-1.5-pro-preview-0409',
  ),
);
final res = await chatModel.invoke(
  PromptValue.chat([
    ChatMessage.human(
      ChatMessageContent.multiModal([
        ChatMessageContent.text('What fruit is this?'),
        ChatMessageContent.image(
          mimeType: 'image/jpeg',
          data: base64.encode(
            await File('./bin/assets/apple.jpeg').readAsBytes(),
          ),
        ),
      ]),
    ),
  ]),
);
print(res.output.content);
// -> 'That is an apple.'
```

## Streaming

```dart
final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (ChatMessageType.system, 'You are a helpful assistant that replies only with numbers in order without any spaces or commas.'),
  (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
]);

final chatModel = ChatFirebaseVertexAI(
  defaultOptions: ChatFirebaseVertexAIOptions(
    model: 'gemini-1.5-pro-preview-0409',
  ),
);

final chain = promptTemplate.pipe(chatModel).pipe(StringOutputParser());

final stream = chain.stream({'max_num': '30'});
await stream.forEach(print);
// 1
// 2345678910111213
// 1415161718192021
// 222324252627282930 
```

## Tool calling

`ChatGoogleGenerativeAI` supports tool calling.

Check the [docs](https://langchaindart.com/#/modules/model_io/models/chat_models/how_to/tools) for more information on how to use tools.

Example:
```dart
const tool = ToolSpec(
  name: 'get_current_weather',
  description: 'Get the current weather in a given location',
  inputJsonSchema: {
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The city and state, e.g. San Francisco, CA',
      },
    },
    'required': ['location'],
  },
);
final chatModel = ChatFirebaseVertexAI(
  defaultOptions: ChatFirebaseVertexAIOptions(
    model: 'gemini-1.5-pro-preview-0409',
    temperature: 0,
    tools: [tool],
  ),
);
final res = await model.invoke(
  PromptValue.string('What’s the weather like in Boston and Madrid right now in celsius?'),
);
```

## Prevent abuse with Firebase App Check

You can use Firebase App Check to protect the Vertex AI Gemini API from abuse by unauthorized clients. Check the [Firebase documentation](https://firebase.google.com/docs/vertex-ai/app-check) for more information.

## Locations

When initializing the Vertex AI service, you can optionally specify a location in which to run the service and access a model. If you don't specify a location, the default is us-central1. See the list of [available locations](https://firebase.google.com/docs/vertex-ai/locations?platform=flutter#available-locations).

```dart
final chatModel = ChatFirebaseVertexAI(
  location: 'us-central1',
);
```

## Alternatives

- [`ChatVertexAI`](/modules/model_io/models/chat_models/integrations/gcp_vertex_ai.md): Use this class to call the Vertex AI Gemini API from the server-side.
- [`ChatGoogleGenerativeAI`](/modules/model_io/models/chat_models/integrations/googleai.md): Use this class to call the "Google AI" version of the Gemini API that provides free-of-charge access (within limits and where available). This API is not intended for production use but for experimentation and prototyping. After you're familiar with how a Gemini API works, migrate to the Vertex AI for Firebase, which have many additional features important for mobile and web apps, like protecting the API from abuse using Firebase App Check.
