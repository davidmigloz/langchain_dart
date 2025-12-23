# WebSocket Implementation Patterns

## Contents

- [Directory Structure](#directory-structure)
- [Sealed Message Classes](#sealed-message-classes)
- [Configuration Classes](#configuration-classes)
- [Enum Conventions](#enum-conventions)
- [JSON Serialization](#json-serialization)
- [WebSocket Connection](#websocket-connection)
- [Test Patterns](#test-patterns)
- [Export Organization](#export-organization)
- [Documentation Patterns](#documentation-patterns)

---

This document provides patterns for implementing Live API WebSocket changes in `googleai_dart`.

---

## Directory Structure

Live API models are organized under `lib/src/models/live/`:

```
lib/src/models/live/
├── config/                              # Configuration classes
│   ├── live_config.dart
│   ├── live_generation_config.dart
│   ├── speech_config.dart
│   ├── voice_config.dart
│   ├── realtime_input_config.dart
│   ├── automatic_activity_detection.dart
│   ├── session_resumption_config.dart
│   ├── context_window_compression_config.dart
│   ├── sliding_window.dart
│   ├── audio_transcription_config.dart
│   └── proactivity_config.dart
│
├── enums/                               # Enum types
│   ├── activity_handling.dart
│   ├── start_sensitivity.dart
│   ├── end_sensitivity.dart
│   └── turn_coverage.dart
│
├── messages/                            # WebSocket messages
│   ├── client/                          # Client → Server
│   │   ├── client_message.dart          # Sealed base class
│   │   ├── setup.dart
│   │   ├── client_content.dart
│   │   ├── realtime_input.dart
│   │   └── tool_response.dart
│   │
│   └── server/                          # Server → Client
│       ├── server_message.dart          # Sealed base class
│       ├── setup_complete.dart
│       ├── server_content.dart
│       ├── tool_call.dart
│       ├── tool_call_cancellation.dart
│       ├── go_away.dart
│       ├── session_resumption_update.dart
│       └── transcription.dart
│
└── auth/                                # Ephemeral token auth
    ├── auth_token.dart
    └── auth_token_service.dart
```

Live client classes are under `lib/src/live/`:

```
lib/src/live/
├── live_client.dart                     # Main client
├── live_session.dart                    # WebSocket session
└── websocket_adapter.dart               # Cross-platform adapter
```

Tests mirror this structure under `test/unit/models/live/`.

---

## Sealed Message Classes

### Base Sealed Class

```dart
/// Base class for WebSocket messages.
sealed class BidiGenerateContentClientMessage {
  const BidiGenerateContentClientMessage();

  /// Creates from JSON, dispatching to appropriate subclass.
  factory BidiGenerateContentClientMessage.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('setup')) {
      return BidiGenerateContentSetup.fromJson(
        json['setup'] as Map<String, dynamic>,
      );
    }
    if (json.containsKey('clientContent')) {
      return BidiGenerateContentClientContent.fromJson(
        json['clientContent'] as Map<String, dynamic>,
      );
    }
    // ... more message types
    throw FormatException('Unknown message type: ${json.keys}');
  }

  /// Converts to JSON with wrapper key.
  Map<String, dynamic> toJson();
}
```

### Concrete Message Class

```dart
/// Initial session setup message.
class BidiGenerateContentSetup extends BidiGenerateContentClientMessage {
  final String model;
  final LiveGenerationConfig? generationConfig;

  const BidiGenerateContentSetup({
    required this.model,
    this.generationConfig,
  });

  factory BidiGenerateContentSetup.fromJson(Map<String, dynamic> json) {
    return BidiGenerateContentSetup(
      model: json['model'] as String,
      generationConfig: json['generationConfig'] != null
          ? LiveGenerationConfig.fromJson(
              json['generationConfig'] as Map<String, dynamic>,
            )
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'setup': {
      'model': model,
      if (generationConfig != null)
        'generationConfig': generationConfig!.toJson(),
    },
  };

  // copyWith, toString, etc.
}
```

### JSON Structure

Client messages are wrapped with their type key:
```json
{ "setup": { "model": "gemini-2.0-flash-live-001", ... } }
{ "realtimeInput": { "audio": { "data": "..." } } }
```

Server messages follow the same pattern:
```json
{ "setupComplete": { "sessionId": "..." } }
{ "serverContent": { "modelTurn": { ... } } }
```

---

## Configuration Classes

### Standard Pattern

```dart
import '../copy_with_sentinel.dart';

/// Configuration for Live API sessions.
class LiveConfig {
  final LiveGenerationConfig? generationConfig;
  final SpeechConfig? speechConfig;
  final RealtimeInputConfig? realtimeInputConfig;
  final List<Tool>? tools;

  const LiveConfig({
    this.generationConfig,
    this.speechConfig,
    this.realtimeInputConfig,
    this.tools,
  });

  factory LiveConfig.fromJson(Map<String, dynamic> json) => LiveConfig(
    generationConfig: json['generationConfig'] != null
        ? LiveGenerationConfig.fromJson(
            json['generationConfig'] as Map<String, dynamic>,
          )
        : null,
    // ... more fields
  );

  Map<String, dynamic> toJson() => {
    if (generationConfig != null)
      'generationConfig': generationConfig!.toJson(),
    // ... more fields
  };

  LiveConfig copyWith({
    Object? generationConfig = unsetCopyWithValue,
    // ... more fields
  }) {
    return LiveConfig(
      generationConfig: generationConfig == unsetCopyWithValue
          ? this.generationConfig
          : generationConfig as LiveGenerationConfig?,
      // ... more fields
    );
  }
}
```

### Factory Constructors

Provide convenience factories for common configurations:

```dart
class LiveGenerationConfig {
  // ... fields

  /// Creates audio-only configuration.
  factory LiveGenerationConfig.audioOnly({
    double? temperature,
    int? maxOutputTokens,
  }) {
    return LiveGenerationConfig(
      responseModalities: ['AUDIO'],
      temperature: temperature,
      maxOutputTokens: maxOutputTokens,
    );
  }

  /// Creates text and audio configuration.
  factory LiveGenerationConfig.textAndAudio({
    double? temperature,
    int? maxOutputTokens,
  }) {
    return LiveGenerationConfig(
      responseModalities: ['AUDIO', 'TEXT'],
      temperature: temperature,
      maxOutputTokens: maxOutputTokens,
    );
  }
}
```

---

## Enum Conventions

### Standard Pattern

```dart
/// How the model handles user activity.
enum ActivityHandling {
  /// User activity interrupts model output.
  startOfActivityInterrupts('START_OF_ACTIVITY_INTERRUPTS'),

  /// User activity does not interrupt model.
  noInterruption('NO_INTERRUPTION');

  const ActivityHandling(this.value);

  /// The JSON value.
  final String value;

  /// Creates from JSON value.
  static ActivityHandling fromJson(String json) {
    return ActivityHandling.values.firstWhere(
      (e) => e.value == json,
      orElse: () => throw FormatException('Unknown ActivityHandling: $json'),
    );
  }

  /// Converts to JSON value.
  String toJson() => value;
}
```

---

## JSON Serialization

### Type Mappings

| OpenAPI Type | Dart Type | fromJson | toJson |
|--------------|-----------|----------|--------|
| string | String | `as String` | direct |
| integer | int | `as int` | direct |
| number | double | `(json['x'] as num).toDouble()` | direct |
| boolean | bool | `as bool` | direct |
| object | Map<String, dynamic> | `as Map<String, dynamic>` | direct |
| array | List<T> | `.map(...).toList()` | `.map(...).toList()` |
| bytes (base64) | List<int> | `base64Decode(str)` | `base64Encode(bytes)` |
| enum | EnumType | `EnumType.fromJson(str)` | `.toJson()` |
| $ref | ClassName | `ClassName.fromJson(map)` | `.toJson()` |

### Binary Data (Audio)

```dart
// Audio data in WebSocket messages uses base64
class RealtimeInputAudio {
  final List<int> data; // Raw PCM bytes

  factory RealtimeInputAudio.fromJson(Map<String, dynamic> json) {
    return RealtimeInputAudio(
      data: base64Decode(json['data'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'data': base64Encode(data),
  };
}
```

---

## WebSocket Connection

### Cross-Platform Adapter

```dart
import 'package:web_socket/web_socket.dart';

class WebSocketAdapter {
  WebSocket? _socket;

  Future<void> connect(Uri uri, {Map<String, String>? headers}) async {
    _socket = await WebSocket.connect(uri, protocols: headers);
  }

  void send(String message) {
    _socket?.sendText(message);
  }

  void sendBytes(List<int> bytes) {
    _socket?.sendBytes(Uint8List.fromList(bytes));
  }

  Stream<WebSocketEvent> get events => _socket!.events;

  Future<void> close([int? code, String? reason]) async {
    await _socket?.close(code, reason);
  }
}
```

### Event Handling

```dart
await for (final event in socket.events) {
  switch (event) {
    case TextDataReceived(:final text):
      final json = jsonDecode(text) as Map<String, dynamic>;
      final message = BidiGenerateContentServerMessage.fromJson(json);
      // Handle message
    case BinaryDataReceived(:final data):
      // Handle binary data (if used)
    case CloseReceived(:final code, :final reason):
      // Handle close
  }
}
```

---

## Test Patterns

Tests go in `test/unit/models/live/` mirroring the source structure.

### Config Class Test Template

```dart
import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('ConfigClassName', () {
    group('fromJson', () {
      test('creates ConfigClassName with all fields', () {
        final json = {
          'field1': 'value1',
          'field2': 42,
          'nestedConfig': {'subField': 'subValue'},
        };
        final config = ConfigClassName.fromJson(json);

        expect(config.field1, 'value1');
        expect(config.field2, 42);
        expect(config.nestedConfig?.subField, 'subValue');
      });

      test('creates ConfigClassName with minimal fields', () {
        final json = <String, dynamic>{};
        final config = ConfigClassName.fromJson(json);

        expect(config.field1, isNull);
        expect(config.field2, isNull);
      });

      test('handles null nested configs', () {
        final json = {'field1': 'value1'};
        final config = ConfigClassName.fromJson(json);
        expect(config.nestedConfig, isNull);
      });
    });

    group('toJson', () {
      test('includes all non-null fields', () {
        final config = ConfigClassName(
          field1: 'value1',
          field2: 42,
        );
        final json = config.toJson();

        expect(json['field1'], 'value1');
        expect(json['field2'], 42);
      });

      test('omits null fields', () {
        const config = ConfigClassName();
        final json = config.toJson();
        expect(json, isEmpty);
      });
    });

    group('copyWith', () {
      test('with no params returns instance with same values', () {
        final original = ConfigClassName(field1: 'value1');
        final copied = original.copyWith();
        expect(copied.field1, original.field1);
      });

      test('updates specified fields only', () {
        final original = ConfigClassName(field1: 'value1', field2: 42);
        final updated = original.copyWith(field1: 'newValue');
        expect(updated.field1, 'newValue');
        expect(updated.field2, 42);
      });

      test('can set fields to null explicitly', () {
        final original = ConfigClassName(field1: 'value1');
        final updated = original.copyWith(field1: null);
        expect(updated.field1, isNull);
      });
    });

    test('round-trip conversion preserves data', () {
      final original = ConfigClassName(
        field1: 'value1',
        field2: 42,
      );
      final json = original.toJson();
      final restored = ConfigClassName.fromJson(json);

      expect(restored.field1, original.field1);
      expect(restored.field2, original.field2);
    });

    test('toString includes key fields', () {
      final config = ConfigClassName(field1: 'value1');
      expect(config.toString(), contains('field1'));
      expect(config.toString(), contains('value1'));
    });
  });
}
```

### Sealed Message Class Test Template

```dart
import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('BidiGenerateContentClientMessage', () {
    group('BidiGenerateContentSetup', () {
      test('serializes with setup wrapper key', () {
        final setup = BidiGenerateContentSetup(
          model: 'gemini-2.0-flash-live-001',
          generationConfig: LiveGenerationConfig(
            responseModalities: ['AUDIO', 'TEXT'],
          ),
        );

        final json = setup.toJson();

        expect(json.containsKey('setup'), true);
        expect(json['setup']['model'], 'gemini-2.0-flash-live-001');
        expect(
          json['setup']['generationConfig']['responseModalities'],
          ['AUDIO', 'TEXT'],
        );
      });

      test('deserializes from setup wrapper', () {
        final json = {
          'setup': {
            'model': 'gemini-2.0-flash-live-001',
          },
        };

        final message = BidiGenerateContentClientMessage.fromJson(json);

        expect(message, isA<BidiGenerateContentSetup>());
        expect(
          (message as BidiGenerateContentSetup).model,
          'gemini-2.0-flash-live-001',
        );
      });

      test('round-trip preserves all fields', () {
        final original = BidiGenerateContentSetup(
          model: 'gemini-2.0-flash-live-001',
        );

        final json = original.toJson();
        final decoded = BidiGenerateContentClientMessage.fromJson(json);

        expect(decoded, isA<BidiGenerateContentSetup>());
        expect((decoded as BidiGenerateContentSetup).model, original.model);
      });
    });

    // Repeat for each message type...

    group('fromJson dispatch', () {
      test('dispatches to BidiGenerateContentSetup for setup key', () {
        final json = {'setup': {'model': 'test-model'}};
        final message = BidiGenerateContentClientMessage.fromJson(json);
        expect(message, isA<BidiGenerateContentSetup>());
      });

      test('dispatches to BidiGenerateContentClientContent for clientContent key', () {
        final json = {
          'clientContent': {
            'turns': [
              {'role': 'user', 'parts': [{'text': 'Hello'}]}
            ]
          }
        };
        final message = BidiGenerateContentClientMessage.fromJson(json);
        expect(message, isA<BidiGenerateContentClientContent>());
      });

      test('throws FormatException for unknown key', () {
        final json = {'unknownKey': {}};
        expect(
          () => BidiGenerateContentClientMessage.fromJson(json),
          throwsA(isA<FormatException>()),
        );
      });

      test('throws FormatException for empty JSON', () {
        final json = <String, dynamic>{};
        expect(
          () => BidiGenerateContentClientMessage.fromJson(json),
          throwsA(isA<FormatException>()),
        );
      });
    });
  });
}
```

### Enum Test Template

```dart
import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('ActivityHandling', () {
    test('fromJson handles all known values', () {
      expect(
        ActivityHandling.fromJson('START_OF_ACTIVITY_INTERRUPTS'),
        ActivityHandling.startOfActivityInterrupts,
      );
      expect(
        ActivityHandling.fromJson('NO_INTERRUPTION'),
        ActivityHandling.noInterruption,
      );
    });

    test('toJson returns correct string values', () {
      expect(
        ActivityHandling.startOfActivityInterrupts.toJson(),
        'START_OF_ACTIVITY_INTERRUPTS',
      );
      expect(
        ActivityHandling.noInterruption.toJson(),
        'NO_INTERRUPTION',
      );
    });

    test('fromJson throws FormatException for unknown value', () {
      expect(
        () => ActivityHandling.fromJson('INVALID_VALUE'),
        throwsA(isA<FormatException>()),
      );
    });

    test('round-trip preserves values', () {
      for (final value in ActivityHandling.values) {
        final json = value.toJson();
        final restored = ActivityHandling.fromJson(json);
        expect(restored, value);
      }
    });
  });

  // Repeat for StartSensitivity, EndSensitivity, TurnCoverage
}
```

---

## Export Organization

All Live API types must be exported in `lib/googleai_dart.dart`:

```dart
// Live API
export 'src/live/live_client.dart';
export 'src/live/live_session.dart';
export 'src/models/live/config/live_config.dart';
export 'src/models/live/config/live_generation_config.dart';
// ... all config classes
export 'src/models/live/enums/activity_handling.dart';
// ... all enums
export 'src/models/live/messages/client/client_message.dart';
// ... all message classes
```

---

## Documentation Patterns

### README Updates

Add Live API to README.md following existing format:

1. **Features Section** - Add subsection with checkmarks
2. **Table of Contents** - Add Live API link
3. **Quick Comparison** - Add row to table
4. **Usage Section** - Add code examples
5. **Examples Section** - Reference example file
6. **API Coverage** - Add methods to table

### Example File

Create `example/live_example.dart`:

```dart
// ignore_for_file: avoid_print
import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(/* config */);
  final liveClient = client.createLiveClient();

  final session = await liveClient.connect(
    model: 'gemini-2.0-flash-live-001',
    liveConfig: LiveConfig(
      generationConfig: LiveGenerationConfig(
        responseModalities: ['AUDIO', 'TEXT'],
      ),
    ),
  );

  // Send text
  session.sendText('Hello!');

  // Handle responses
  await for (final message in session.messages) {
    switch (message) {
      case BidiGenerateContentServerContent(:final modelTurn):
        print('Model: $modelTurn');
      case BidiGenerateContentToolCall(:final functionCalls):
        // Handle tool calls
        break;
      default:
        break;
    }
  }

  await session.close();
}
```

### CHANGELOG Entry

```markdown
## 0.X.0

- **Live API**: Added real-time bidirectional streaming support
  - `LiveClient` for WebSocket connections
  - Audio input/output (16kHz PCM input, 24kHz PCM output)
  - Tool calling in live sessions
  - Session resumption with tokens
  - Voice activity detection configuration
- Added `web_socket` dependency for cross-platform WebSocket support
```
