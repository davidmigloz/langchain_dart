# OpenAI Realtime API Dart Client

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![openai_realtime_dart](https://img.shields.io/pub/v/openai_realtime_dart.svg)](https://pub.dev/packages/openai_realtime_dart)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Unofficial Dart client for the [OpenAI Realtime API](https://platform.openai.com/docs/guides/realtime), a stateful, event-based API that communicates over a WebSocket.

> Note: If you are looking for a client for the [REST OpenAI API](https://platform.openai.com/docs/api-reference), please check the [openai_dart](https://pub.dev/packages/openai_dart) package.

## Table of contents

- [Quickstart](#quickstart)
    * [Browser quickstart](#browser-quickstart)
- [Project structure](#project-structure)
- [Using the client](#using-the-client)
    * [Sending messages](#sending-messages)
    * [Sending streaming audio](#sending-streaming-audio)
    * [Adding and using tools](#adding-and-using-tools)
        + [Manually using tools](#manually-using-tools)
    * [Interrupting the model](#interrupting-the-model)
- [Client events](#client-events)
    * [Utility events](#utility-events)
    * [Server events](#server-events)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Quickstart

This library is built to be used both server-side and client-side (e.g. Flutter apps).

```dart
final client = RealtimeClient(
  apiKey: Platform.environment['OPENAI_API_KEY'],
);

// Can set parameters ahead of connecting, either separately or all at once
await client.updateSession(instructions: 'You are a great, upbeat friend.');
await client.updateSession(voice: Voice.alloy);
await client.updateSession(
  turnDetection: TurnDetection(
    type: TurnDetectionType.serverVad,
  ),
  inputAudioTranscription: InputAudioTranscriptionConfig(
    model: 'whisper-1',
  ),
);

// Set up event handling
client.on(RealtimeEventType.conversationUpdated, (event) {
  // item is the current item being updated
  final result = (event as RealtimeEventConversationUpdated).result;
  final item = result.item;
  final delta = result.delta;
  // you can fetch a full list of items at any time
  final items = client.conversation.getItems();
});

// Connect to Realtime API
await client.connect();

// Send a item and triggers a generation
await client.sendUserMessageContent([
  const ContentPart.inputText(text: 'How are you?'),
]);
```

### Browser quickstart

You can use this client directly from the browser in e.g.
**We do not recommend this, your API keys are at risk if you connect to OpenAI directly from the browser.**
In order to instantiate the client in a browser environment, use:

```dart
final client = RealtimeClient(
  apiKey: Platform.environment['OPENAI_API_KEY'], 
  dangerouslyAllowAPIKeyInBrowser: true,
);
```

If you are running your own relay server, you can instead connect to the relay server URL like so:

```dart
final client = RealtimeClient(url: RELAY_SERVER_URL);
```

## Project structure

In this package, there are three primitives for interfacing with the Realtime API. We recommend starting with the `RealtimeClient`, but more advanced users may be more comfortable working closer to the metal.

1. [`RealtimeClient`](./lib/src/client.dart)
  - Primary abstraction for interfacing with the Realtime API
  - Enables rapid application development with a simplified control flow
  - Has custom `conversation.updated`, `conversation.item.appended`, `conversation.item.completed`, `conversation.interrupted` and `realtime.event` events
  - These events send item deltas and conversation history
2. [`RealtimeAPI`](./lib/src/api.dart)
  - Exists on client instance as `client.realtime`
  - Thin wrapper over [WebSocket](https://developer.mozilla.org/en-US/docs/Web/API/WebSocket)
  - Use this for connecting to the API, authenticating, and sending items
  - Dispatches events according to the `RealtimeEventType` enum
3. [`RealtimeConversation`](./lib/src/conversation.dart)
  - Exists on client instance as `client.conversation`
  - Stores a client-side cache of the current conversation
  - Has **event validation**, will validate incoming events to make sure it can cache them properly

## Using the client

The client comes packaged with some basic utilities that make it easy to build realtime apps quickly.

### Sending messages

Sending messages to the server from the user is easy.

```dart
await client.sendUserMessageContent([
  const ContentPart.inputText(text: 'How are you?'),
]);
// or (empty audio)
await client.sendUserMessageContent([
  ContentPart.inputAudio(audio: ''), // Base64 encoded audio
]);
```

### Sending streaming audio

To send streaming audio, use the `.appendInputAudio()` method. If you're in manual mode (no turn detection), then you need to use `.createResponse()` to tell the model to respond.

```dart
// Send user audio, must be Uint8List
// Default audio format is pcm16 with sample rate of 24,000 Hz
// This populates 1s of noise in 0.1s chunks
for (var i = 0; i < 10; i++) {
  final data = Uint8List(2400);
  for (var n = 0; n < 2400; n++) {
    final value = (Random().nextDouble() * 2 - 1) * 0x8000;
    data[n] = value.toInt();
  }
  await client.appendInputAudio(data);
}
// Pending audio is committed and model is asked to generate
await client.createResponse();
```

### Adding and using tools

Working with tools is easy. Just call `.addTool()` and set a callback as the second parameter. The callback will be executed with the parameters for the tool, and the result will be automatically sent back to the model.

```dart
await client.addTool(
  const ToolDefinition(
    name: 'get_weather',
    description: 'Retrieves the weather for a location given its latitude and longitude coordinate pair.',
    parameters: {
      'type': 'object',
      'properties': {
        'lat': {
          'type': 'number',
          'description': 'Latitude of the location',
        },
        'lng': {
          'type': 'number',
          'description': 'Longitude of the location',
        },
      },
      'required': ['lat', 'lng'],
    },
  ),
  (Map<String, dynamic> params) async {
    final result = await HttpClient()
        .getUrl(
          Uri.parse(
            'https://api.open-meteo.com/v1/forecast?'
            'latitude=${params['lat']}&'
            'longitude=${params['lng']}&'
            'current=temperature_2m,wind_speed_10m',
          ),
        )
        .then((request) => request.close())
        .then((res) => res.transform(const Utf8Decoder()).join())
        .then(jsonDecode);
    return result;
  },
);
```

#### Manually using tools

The `.addTool()` method automatically runs a tool handler and triggers a response on handler completion. Sometimes you may not want that, for example: using tools to generate a schema that you use for other purposes.

In this case, we can use the `tools` parameter with `updateSession`. 

**Note:** Tools added with `.addTool()` will **not** be overridden when updating sessions manually like this, but every `updateSession()` change will override previous `updateSession()` changes. Tools added via `.addTool()` are persisted and appended to anything set manually here.

```dart
await client.updateSession(
  tools: [
    const ToolDefinition(
      name: 'get_weather',
      description: 'Retrieves the weather for a location given its latitude and longitude coordinate pair.',
      parameters: {
        'type': 'object',
        'properties': {
          'lat': {
            'type': 'number',
            'description': 'Latitude',
          },
          'lng': {
            'type': 'number',
            'description': 'Longitude',
          },
        },
        'required': ['lat', 'lng'],
      },
    ),
  ],
);
```

Then, to handle function calls...

```dart
client.on(RealtimeEventType.conversationItemCompleted, (event) {
  final item = (event as RealtimeEventConversationItemCompleted).item;
  if (item.item is ItemFunctionCall) {
    // your function call is complete, execute some custom code
  }
});
```

### Interrupting the model

You may want to manually interrupt the model, especially when not using turn detection. To do this, we can use:

```dart
// id is the id of the item currently being generated
// sampleCount is the number of audio samples that have been heard by the listener
await client.cancelResponse(id, sampleCount);
```

This method will cause the model to immediately cease generation, but also truncate the item being played by removing all audio after `sampleCount` and clearing the text response. By using this method you can interrupt the model and prevent it from "remembering" anything it has generated that is ahead of where the user's state is.

## Client events

The `RealtimeClient` provides strongly typed events that map to the [Realtime API Events](https://platform.openai.com/docs/api-reference/realtime-events). You can listen to specific events using the `RealtimeEventType` enum.

```dart
client.realtime.send(
  RealtimeEvent.conversationItemCreate(
    eventId: RealtimeUtils.generateId(),
    item: Item.functionCallOutput(
      id: RealtimeUtils.generateId(),
      callId: 'my-call-id',
      output: '{function_succeeded:true}',
    ),
  ),
);
```

### Utility events

With `RealtimeClient` we have reduced the event overhead from server events to **five** main events that are most critical for your application control flow:

```dart
// Errors like connection failures
client.on(RealtimeEventType.error, (event) {
  final error = (event as RealtimeEventError).error;
  // do something with the error
});

// In VAD mode, the user starts speaking
// we can use this to stop audio playback of a previous response if necessary
client.on(RealtimeEventType.conversationInterrupted, (event) {
  // handle interruption
});

// Includes all changes to conversations
client.on(RealtimeEventType.conversationUpdated, (event) {
  final result = (event as RealtimeEventConversationUpdated).result;
  final item = result.item;
  final delta = result.delta;
  
  // get all items, e.g. if you need to update a chat window
  final items = client.conversation.getItems();
  
  if (item?.item case final ItemMessage message) {
    // system, user, or assistant message (message.role)
  } else if (item?.item case final ItemFunctionCall functionCall) {
    // always a function call from the model
  } else if (item?.item case final ItemFunctionCallOutput functionCallOutput) {
    // always a response from the user / application
  }
  
  if (delta != null) {
    // Only one of the following will be populated for any given event
    // delta.audio -> Uint8List, audio added
    // delta.transcript -> string, transcript added
    // delta.arguments -> string, function arguments added
  }
});

// Only triggered after item added to conversation
client.on(RealtimeEventType.conversationItemAppended, (event) {
  final item = (event as RealtimeEventConversationItemAppended).item;
  // item.status can be ItemStatus.inProgress or ItemStatus.completed
});

// Only triggered after item completed in conversation
// will always be triggered after conversation.item.appended
client.on(RealtimeEventType.conversationItemCompleted, (event) {
  final item = (event as RealtimeEventConversationItemCompleted).item;
  // item.status will always be ItemStatus.completed
});
```

### Server events

If you want more control over your application development, you can use the `RealtimeEventType.all` event and choose only to respond to **server** events. The full documentation for these events are available on the [Realtime Server Events API Reference](https://platform.openai.com/docs/api-reference/realtime-server-events).

```dart
// all events, can use for logging, debugging, or manual event handling
client.on(RealtimeEventType.all, (event) {
  // Handle any RealtimeEvent
});
```

## Logging

This package uses the [logging](https://pub.dev/packages/logging) package to log messages. 

In debug mode, records with `Level.INFO` and above are printed to the console.

### Listen to all logs

```dart
import 'package:logging/logging.dart';

final logger = Logger('openai_realtime_dart');
logger.level = Level.ALL; // custom log level filtering, default is Level.INFO
logger.onRecord.listen((record) {
  print('${record.level.name}: ${record.time}: ${record.message}');
});
```

## Acknowledgements

This package is based on the [OpenAI Realtime API Reference Client](https://github.com/openai/openai-realtime-api-beta).

## License

OpenAI Realtime API Dart Client is licensed under the [MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
