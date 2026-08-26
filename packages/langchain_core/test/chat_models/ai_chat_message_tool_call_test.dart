import 'package:langchain_core/chat_models.dart';
import 'package:test/test.dart';

void main() {
  group('AIChatMessageToolCall metadata', () {
    test('defaults to an empty map', () {
      const toolCall = AIChatMessageToolCall(
        id: 'call_1',
        name: 'getWeather',
        argumentsRaw: '{}',
        arguments: {},
      );
      expect(toolCall.metadata, isEmpty);
    });

    test('stores provider-specific entries', () {
      const toolCall = AIChatMessageToolCall(
        id: 'call_1',
        name: 'getWeather',
        argumentsRaw: '{}',
        arguments: {},
        metadata: {'thought_signature': 'c2lnbmF0dXJl'},
      );
      expect(toolCall.metadata['thought_signature'], 'c2lnbmF0dXJl');
    });

    test('round-trips through toMap/fromMap', () {
      const toolCall = AIChatMessageToolCall(
        id: 'call_1',
        name: 'getWeather',
        argumentsRaw: '{}',
        arguments: {},
        metadata: {'thought_signature': 'c2lnbmF0dXJl'},
      );
      final restored = AIChatMessageToolCall.fromMap(toolCall.toMap());
      expect(restored, toolCall);
      expect(restored.metadata['thought_signature'], 'c2lnbmF0dXJl');
    });

    test('is included in equality', () {
      const withMetadata = AIChatMessageToolCall(
        id: 'call_1',
        name: 'getWeather',
        argumentsRaw: '{}',
        arguments: {},
        metadata: {'thought_signature': 'c2lnbmF0dXJl'},
      );
      const withoutMetadata = AIChatMessageToolCall(
        id: 'call_1',
        name: 'getWeather',
        argumentsRaw: '{}',
        arguments: {},
      );
      expect(withMetadata, isNot(equals(withoutMetadata)));
    });
  });

  group('AIChatMessage.concat tool-call metadata', () {
    test('preserves metadata when merging streamed chunks', () {
      const first = AIChatMessage(
        content: '',
        toolCalls: [
          AIChatMessageToolCall(
            id: 'call_1',
            name: 'getWea',
            argumentsRaw: '{"city":',
            arguments: {},
            metadata: {'thought_signature': 'c2lnbmF0dXJl'},
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
        merged.toolCalls.single.metadata['thought_signature'],
        'c2lnbmF0dXJl',
      );
    });

    test('later chunks win on conflicting metadata keys', () {
      const first = AIChatMessage(
        content: '',
        toolCalls: [
          AIChatMessageToolCall(
            id: 'call_1',
            name: 'getWeather',
            argumentsRaw: '{}',
            arguments: {},
            metadata: {'thought_signature': 'old'},
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
            metadata: {'thought_signature': 'new'},
          ),
        ],
      );

      final merged = first.concat(second);

      expect(merged.toolCalls.single.metadata['thought_signature'], 'new');
    });
  });
}
