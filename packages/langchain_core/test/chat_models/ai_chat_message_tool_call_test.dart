import 'package:langchain_core/chat_models.dart';
import 'package:test/test.dart';

void main() {
  group('AIChatMessageToolCall provider data', () {
    test('defaults to an empty map', () {
      const toolCall = AIChatMessageToolCall(
        id: 'call_1',
        name: 'getWeather',
        argumentsRaw: '{}',
        arguments: {},
      );
      expect(toolCall.providerData, isEmpty);
    });

    test('stores provider-specific entries', () {
      const toolCall = AIChatMessageToolCall(
        id: 'call_1',
        name: 'getWeather',
        argumentsRaw: '{}',
        arguments: {},
        providerData: {
          'google': {'thoughtSignature': 'c2lnbmF0dXJl'},
        },
      );
      expect(
        (toolCall.providerData['google'] as Map)['thoughtSignature'],
        'c2lnbmF0dXJl',
      );
    });

    test('round-trips through toMap/fromMap', () {
      const toolCall = AIChatMessageToolCall(
        id: 'call_1',
        name: 'getWeather',
        argumentsRaw: '{}',
        arguments: {},
        providerData: {
          'google': {'thoughtSignature': 'c2lnbmF0dXJl'},
        },
      );
      final restored = AIChatMessageToolCall.fromMap(toolCall.toMap());
      expect(restored, toolCall);
      expect(
        (restored.providerData['google'] as Map)['thoughtSignature'],
        'c2lnbmF0dXJl',
      );
    });

    test('deserializes legacy maps without provider data', () {
      final restored = AIChatMessageToolCall.fromMap(const {
        'id': 'call_1',
        'name': 'getWeather',
        'argumentsRaw': '{}',
        'arguments': <String, dynamic>{},
      });

      expect(restored.providerData, isEmpty);
    });

    test('is included in equality', () {
      const withMetadata = AIChatMessageToolCall(
        id: 'call_1',
        name: 'getWeather',
        argumentsRaw: '{}',
        arguments: {},
        providerData: {
          'google': {'thoughtSignature': 'c2lnbmF0dXJl'},
        },
      );
      const withoutMetadata = AIChatMessageToolCall(
        id: 'call_1',
        name: 'getWeather',
        argumentsRaw: '{}',
        arguments: {},
      );
      expect(withMetadata, isNot(equals(withoutMetadata)));
    });

    test('equal values have equal hashes', () {
      const first = AIChatMessageToolCall(
        id: 'call_1',
        name: 'getWeather',
        argumentsRaw: '{"city":"Madrid"}',
        arguments: {'city': 'Madrid'},
        providerData: {
          'google': {'thoughtSignature': 'c2lnbmF0dXJl'},
        },
      );
      const second = AIChatMessageToolCall(
        id: 'call_1',
        name: 'getWeather',
        argumentsRaw: '{"city":"Madrid"}',
        arguments: {'city': 'Madrid'},
        providerData: {
          'google': {'thoughtSignature': 'c2lnbmF0dXJl'},
        },
      );

      expect(first, second);
      expect(first.hashCode, second.hashCode);
    });
  });

  group('AIChatMessage.concat tool-call provider data', () {
    test('preserves provider data when merging streamed chunks', () {
      const first = AIChatMessage(
        content: '',
        toolCalls: [
          AIChatMessageToolCall(
            id: 'call_1',
            name: 'getWea',
            argumentsRaw: '{"city":',
            arguments: {},
            providerData: {
              'google': {'thoughtSignature': 'c2lnbmF0dXJl'},
            },
          ),
        ],
      );
      const second = AIChatMessage(
        content: '',
        toolCalls: [
          AIChatMessageToolCall(
            id: 'call_1',
            name: 'ther',
            argumentsRaw: '"Madrid"}',
            arguments: {'city': 'Madrid'},
          ),
        ],
      );

      final merged = first.concat(second);

      expect(merged.toolCalls.single.name, 'getWeather');
      expect(
        (merged.toolCalls.single.providerData['google']
            as Map)['thoughtSignature'],
        'c2lnbmF0dXJl',
      );
    });

    test('later chunks win on conflicting nested provider-data keys', () {
      const first = AIChatMessage(
        content: '',
        toolCalls: [
          AIChatMessageToolCall(
            id: 'call_1',
            name: 'getWeather',
            argumentsRaw: '{}',
            arguments: {},
            providerData: {
              'google': {'thoughtSignature': 'old', 'retained': true},
            },
          ),
        ],
      );
      const second = AIChatMessage(
        content: '',
        toolCalls: [
          AIChatMessageToolCall(
            id: 'call_1',
            name: '',
            argumentsRaw: '',
            arguments: {},
            providerData: {
              'google': {'thoughtSignature': 'new'},
            },
          ),
        ],
      );

      final merged = first.concat(second);

      final googleData =
          merged.toolCalls.single.providerData['google']
              as Map<String, dynamic>;
      expect(googleData['thoughtSignature'], 'new');
      expect(googleData['retained'], isTrue);
    });
  });
}
