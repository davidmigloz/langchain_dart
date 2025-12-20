import 'package:anthropic_sdk_dart/anthropic_sdk_dart.dart';
import 'package:test/test.dart';

void main() {
  group('CountMessageTokensRequest tests', () {
    test('deserializes with all fields', () {
      final json = {
        'model': 'claude-3-5-sonnet-20241022',
        'messages': [
          {'role': 'user', 'content': 'Hello, Claude'},
        ],
        'system': 'You are a helpful assistant.',
        'tool_choice': {'type': 'auto'},
        'tools': [
          {
            'type': 'custom',
            'name': 'get_weather',
            'description': 'Get the weather',
            'input_schema': {
              'type': 'object',
              'properties': {
                'location': {'type': 'string'},
              },
            },
          },
        ],
        'thinking': {'type': 'disabled'},
      };
      final request = CountMessageTokensRequest.fromJson(json);
      expect(
        request.model,
        isA<CountMessageTokensRequestModelEnumeration>().having(
          (m) => m.value,
          'value',
          Models.claude35Sonnet20241022,
        ),
      );
      expect(request.messages, hasLength(1));
      expect(request.messages.first.role, MessageRole.user);
      expect(request.system, isNotNull);
      expect(request.toolChoice, isNotNull);
      expect(request.tools, hasLength(1));
      expect(request.thinking, isA<ThinkingConfigDisabled>());
    });

    test('deserializes with required fields only', () {
      final json = {
        'model': 'claude-3-5-sonnet-20241022',
        'messages': [
          {'role': 'user', 'content': 'Hello, Claude'},
        ],
      };
      final request = CountMessageTokensRequest.fromJson(json);
      expect(request.model, isA<CountMessageTokensRequestModelEnumeration>());
      expect(request.messages, hasLength(1));
      expect(request.system, isNull);
      expect(request.toolChoice, isNull);
      expect(request.tools, isNull);
      expect(request.thinking, isNull);
    });

    test('deserializes with custom model ID', () {
      final json = {
        'model': 'custom-model-id',
        'messages': [
          {'role': 'user', 'content': 'Hello'},
        ],
      };
      final request = CountMessageTokensRequest.fromJson(json);
      expect(
        request.model,
        isA<CountMessageTokensRequestModelString>().having(
          (m) => m.value,
          'value',
          'custom-model-id',
        ),
      );
    });

    test('deserializes system as string', () {
      final json = {
        'model': 'claude-3-5-sonnet-20241022',
        'messages': [
          {'role': 'user', 'content': 'Hello'},
        ],
        'system': 'You are helpful.',
      };
      final request = CountMessageTokensRequest.fromJson(json);
      expect(
        request.system,
        isA<CountMessageTokensRequestSystemString>().having(
          (s) => s.value,
          'value',
          'You are helpful.',
        ),
      );
    });

    test('deserializes system as array of blocks', () {
      final json = {
        'model': 'claude-3-5-sonnet-20241022',
        'messages': [
          {'role': 'user', 'content': 'Hello'},
        ],
        'system': [
          {'type': 'text', 'text': 'You are helpful.'},
        ],
      };
      final request = CountMessageTokensRequest.fromJson(json);
      expect(request.system, isA<CountMessageTokensRequestSystemListBlock>());
    });

    test('serializes correctly', () {
      final request = CountMessageTokensRequest(
        model: CountMessageTokensRequestModel.enumeration(
          Models.claude35Sonnet20241022,
        ),
        messages: const [
          Message(
            role: MessageRole.user,
            content: MessageContent.text('Hello'),
          ),
        ],
        system: const CountMessageTokensRequestSystem.string('Be helpful'),
      );
      final json = request.toJson();
      expect(json['model'], 'claude-3-5-sonnet-20241022');
      expect(json['messages'], hasLength(1));
      expect(json['system'], 'Be helpful');
    });

    test('serializes with null optional fields excluded', () {
      final request = CountMessageTokensRequest(
        model: CountMessageTokensRequestModel.enumeration(
          Models.claude35Sonnet20241022,
        ),
        messages: const [
          Message(
            role: MessageRole.user,
            content: MessageContent.text('Hello'),
          ),
        ],
      );
      final json = request.toJson();
      expect(json.containsKey('system'), isFalse);
      expect(json.containsKey('tool_choice'), isFalse);
      expect(json.containsKey('tools'), isFalse);
      expect(json.containsKey('thinking'), isFalse);
    });
  });

  group('CountMessageTokensResponse tests', () {
    test('deserializes with input_tokens', () {
      final json = {'input_tokens': 150};
      final response = CountMessageTokensResponse.fromJson(json);
      expect(response.inputTokens, 150);
    });

    test('serializes correctly', () {
      const response = CountMessageTokensResponse(inputTokens: 200);
      final json = response.toJson();
      expect(json['input_tokens'], 200);
    });

    test('round-trip serialization works', () {
      const original = CountMessageTokensResponse(inputTokens: 42);
      final json = original.toJson();
      final restored = CountMessageTokensResponse.fromJson(json);
      expect(restored.inputTokens, original.inputTokens);
    });
  });
}
