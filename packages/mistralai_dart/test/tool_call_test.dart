import 'package:mistralai_dart/mistralai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('ToolCall deserialization tests', () {
    test('deserializes with all fields present', () {
      final json = {
        'id': 'call_123',
        'type': 'function',
        'function': {
          'name': 'get_weather',
          'arguments': '{"location": "Paris"}',
        },
        'index': 0,
      };
      final toolCall = ToolCall.fromJson(json);
      expect(toolCall.id, 'call_123');
      expect(toolCall.type, ToolCallType.function);
      expect(toolCall.function?.name, 'get_weather');
      expect(toolCall.function?.arguments, '{"location": "Paris"}');
      expect(toolCall.index, 0);
    });

    test('deserializes streaming chunk with only index (continuation)', () {
      // Simulates a streaming chunk that only has index
      final json = {'index': 0};
      final toolCall = ToolCall.fromJson(json);
      expect(toolCall.id, isNull);
      expect(toolCall.type, isNull);
      expect(toolCall.function, isNull);
      expect(toolCall.index, 0);
    });

    test('deserializes streaming chunk with partial function args', () {
      // Simulates a streaming chunk with partial arguments
      final json = {
        'index': 0,
        'function': {'arguments': '{"loc'},
      };
      final toolCall = ToolCall.fromJson(json);
      expect(toolCall.function?.arguments, '{"loc');
      expect(toolCall.function?.name, isNull);
    });

    test('deserializes with empty JSON', () {
      final json = <String, dynamic>{};
      final toolCall = ToolCall.fromJson(json);
      expect(toolCall.id, isNull);
      expect(toolCall.type, isNull);
      expect(toolCall.function, isNull);
      expect(toolCall.index, isNull);
    });

    test('serializes with null fields excluded', () {
      const toolCall = ToolCall(
        id: 'call_123',
        type: ToolCallType.function,
        function: FunctionCall(
          name: 'get_weather',
          arguments: '{"location": "Paris"}',
        ),
      );
      final json = toolCall.toJson();
      expect(json['id'], 'call_123');
      expect(json['type'], 'function');
      final functionJson = json['function'] as Map<String, dynamic>;
      expect(functionJson['name'], 'get_weather');
      expect(json.containsKey('index'), isFalse);
    });

    test('serializes streaming chunk with partial data', () {
      const toolCall = ToolCall(
        index: 0,
        function: FunctionCall(arguments: '{"loc'),
      );
      final json = toolCall.toJson();
      expect(json['index'], 0);
      final functionJson = json['function'] as Map<String, dynamic>;
      expect(functionJson['arguments'], '{"loc');
      expect(json.containsKey('id'), isFalse);
      expect(json.containsKey('type'), isFalse);
      expect(functionJson.containsKey('name'), isFalse);
    });
  });

  group('FunctionCall deserialization tests', () {
    test('deserializes with all fields', () {
      final json = {
        'name': 'get_weather',
        'arguments': '{"location": "Paris"}',
      };
      final functionCall = FunctionCall.fromJson(json);
      expect(functionCall.name, 'get_weather');
      expect(functionCall.arguments, '{"location": "Paris"}');
    });

    test('deserializes with only arguments (streaming)', () {
      final json = {'arguments': 'partial_args'};
      final functionCall = FunctionCall.fromJson(json);
      expect(functionCall.name, isNull);
      expect(functionCall.arguments, 'partial_args');
    });

    test('deserializes with only name', () {
      final json = {'name': 'get_weather'};
      final functionCall = FunctionCall.fromJson(json);
      expect(functionCall.name, 'get_weather');
      expect(functionCall.arguments, isNull);
    });

    test('deserializes with empty JSON', () {
      final json = <String, dynamic>{};
      final functionCall = FunctionCall.fromJson(json);
      expect(functionCall.name, isNull);
      expect(functionCall.arguments, isNull);
    });

    test('serializes with null fields excluded', () {
      const functionCall = FunctionCall(
        name: 'get_weather',
        arguments: '{"location": "Paris"}',
      );
      final json = functionCall.toJson();
      expect(json['name'], 'get_weather');
      expect(json['arguments'], '{"location": "Paris"}');
    });

    test('serializes with only arguments', () {
      const functionCall = FunctionCall(arguments: '{"partial": true}');
      final json = functionCall.toJson();
      expect(json['arguments'], '{"partial": true}');
      expect(json.containsKey('name'), isFalse);
    });
  });
}
