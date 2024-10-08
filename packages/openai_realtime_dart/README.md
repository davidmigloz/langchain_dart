# OpenAI Realtime API Dart Client

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![openai_realtime_dart](https://img.shields.io/pub/v/openai_realtime_dart.svg)](https://pub.dev/packages/openai_realtime_dart)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Unofficial Dart client for the [OpenAI Realtime API](https://platform.openai.com/docs/guides/realtime).

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
client.updateSession(instructions: 'You are a great, upbeat friend.');
client.updateSession(voice: 'alloy');
client.updateSession(
  turnDetection: {'type': 'none'},
  inputAudioTranscription: {'model': 'whisper-1'},
);

// Set up event handling
client.on('conversation.updated', (event) {
  // item is the current item being updated
  final item = event?['item'];
  // delta can be null or populated
  final delta = event?['delta'];
  // you can fetch a full list of items at any time
});

// Connect to Realtime API
await client.connect();

// Send a item and triggers a generation
client.sendUserMessageContent([
  {'type': 'input_text', 'text': 'How are you?'},
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
  - There is **no item validation**, you will have to rely on the API specification directly
  - Dispatches events as `server.{event_name}` and `client.{event_name}`, respectively
3. [`RealtimeConversation`](./lib/src/conversation.dart)
  - Exists on client instance as `client.conversation`
  - Stores a client-side cache of the current conversation
  - Has **event validation**, will validate incoming events to make sure it can cache them properly

## Using the client

The client comes packaged with some basic utilities that make it easy to build realtime apps quickly.

### Sending messages

Sending messages to the server from the user is easy.

```dart
client.sendUserMessageContent([
  {'type': 'input_text', 'text': 'How are you?'},
]);
// or (empty audio)
client.sendUserMessageContent([
  {'type': 'input_audio', 'audio': Int16List(0)},
]);
```

### Sending streaming audio

To send streaming audio, use the `.appendInputAudio()` method. If you're in `turn_detection: 'disabled'` mode, then you need to use `.createResponse()` to tell the model to respond.

```dart
// Send user audio, must be Int16List
// Default audio format is pcm16 with sample rate of 24,000 Hz
// This populates 1s of noise in 0.1s chunks
for (var i = 0; i < 10; i++) {
  final data = Int16List(2400);
  for (var n = 0; n < 2400; n++) {
    final value = (Random().nextDouble() * 2 - 1) * 0x8000;
    data[n] = value.toInt();
  }
  client.appendInputAudio(data);
}
// Pending audio is committed and model is asked to generate
client.createResponse();
```

### Adding and using tools

Working with tools is easy. Just call `.addTool()` and set a callback as the second parameter. The callback will be executed with the parameters for the tool, and the result will be automatically sent back to the model.

```dart
// We can add tools as well, with callbacks specified
client.addTool(
  {
    'name': 'get_weather',
    'description': 'Retrieves the weather for a given lat, lng coordinate pair. Specify a label for the location.',
    'parameters': {
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
        'location': {
          'type': 'string',
          'description': 'Name of the location',
        },
      },
      'required': ['lat', 'lng', 'location'],
    },
  },
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
        .then((response) => response.transform(Utf8Decoder()).join())
        .then(jsonDecode);
    return result;
  },
);
```

#### Manually using tools

The `.addTool()` method automatically runs a tool handler and triggers a response on handler completion. Sometimes you may not want that, for example: using tools to generate a schema that you use for other purposes.

In this case, we can use the `tools` item with `updateSession`. In this case you **must** specify `type: 'function'`, which is not required for `.addTool()`.

**Note:** Tools added with `.addTool()` will **not** be overridden when updating sessions manually like this, but every `updateSession()` change will override previous `updateSession()` changes. Tools added via `.addTool()` are persisted and appended to anything set manually here.

```dart
client.updateSession(
  tools: [
    {
      'type': 'function',
      'name': 'get_weather',
      'description':
          'Retrieves the weather for a given lat, lng coordinate pair. Specify a label for the location.',
      'parameters': {
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
          'location': {
            'type': 'string',
            'description': 'Name of the location',
          },
        },
        'required': ['lat', 'lng', 'location'],
      },
    },
  ],
);
```

Then, to handle function calls...

```dart
client.on('conversation.item.completed', (event) {
  final item = event?['item'] as Map<String, dynamic>?;
  if (item?['type'] == 'function_call') {
    // your function call is complete, execute some custom code
  }
});
```

### Interrupting the model

You may want to manually interrupt the model, especially in `turn_detection: 'disabled'` mode. To do this, we can use:

```dart
// id is the id of the item currently being generated
// sampleCount is the number of audio samples that have been heard by the listener
client.cancelResponse(id, sampleCount);
```

This method will cause the model to immediately cease generation, but also truncate the item being played by removing all audio after `sampleCount` and clearing the text response. By using this method you can interrupt the model and prevent it from "remembering" anything it has generated that is ahead of where the user's state is.

## Client events

If you need more manual control and want to send custom client events according to the [Realtime Client Events API Reference](https://platform.openai.com/docs/api-reference/realtime-client-events), you can use `client.realtime.send()` like so:

```dart
client.realtime.send('conversation.item.create', {
  'item': {
    'type': 'function_call_output',
    'call_id': 'my-call-id',
    'output': '{function_succeeded:true}',
  },
});
```

### Utility events

With `RealtimeClient` we have reduced the event overhead from server events to **five** main events that are most critical for your application control flow. These events **are not** part of the API specification itself, but wrap logic to make application development easier.

```dart
// Errors like connection failures
client.on('error', (event) {
  // do something
});

// In VAD mode, the user starts speaking
// we can use this to stop audio playback of a previous response if necessary
client.on('conversation.interrupted', (event) {
  // do something
});

// Includes all changes to conversations
// delta may be populated
client.on('conversation.updated', (event) {
  final item = event?['item'] as Map<String, dynamic>?;
  final delta = event?['delta'] as Map<String, dynamic>?;
  
  // get all items, e.g. if you need to update a chat window
  final items = client.conversation.getItems();
  
  final type = item?['type'] as String?;
  switch (type) {
    case 'message':
      // system, user, or assistant message (item.role)
    case 'function_call':
      // always a function call from the model
    case 'function_call_output':
      // always a response from the user / application
  }
  if (delta != null) {
    // Only one of the following will be populated for any given event
    // delta['audio'] -> Int16Array, audio added
    // delta['transcript'] -> string, transcript added
    // delta['arguments'] -> string, function arguments added
  }
});

// Only triggered after item added to conversation
client.on('conversation.item.appended', (event) {
  final item = event?['item'] as Map<String, dynamic>?;
  // item?['status'] -> can be 'in_progress' or 'completed' 
});

// Only triggered after item completed in conversation
// will always be triggered after conversation.item.appended
client.on('conversation.item.completed', (event) {
  final item = event?['item'] as Map<String, dynamic>?;
  // item?['status'] -> will always be 'completed'
});
```

### Server events

If you want more control over your application development, you can use the `realtime.event` event and choose only to respond to **server** events. The full documentation for these events are available on the [Realtime Server Events API Reference](https://platform.openai.com/docs/api-reference/realtime-server-events).

```dart
// all events, can use for logging, debugging, or manual event handling
client.on('realtime.event', (event ) {
  final time = event?['time'] as String?;
  final source = event?['source'] as String?;
  final eventPayload = event?['event'] as Map<String, dynamic>?;
  if (source == 'server') {
    // do something
  }
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
