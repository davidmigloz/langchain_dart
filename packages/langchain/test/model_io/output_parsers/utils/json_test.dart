import 'package:langchain/src/model_io/output_parsers/utils/json.dart';
import 'package:test/test.dart';

void main() {
  group('parsePartialJson tests', () {
    test('Valid JSON input should be parsed correctly', () {
      const jsonString = '{"name": "John", "age": 30}';
      final result = parsePartialJson(jsonString) as Map<String, dynamic>;
      expect(result['name'], equals('John'));
      expect(result['age'], equals(30));
    });

    test('Missing closing brace should be parsed correctly', () {
      const jsonString = '{"name": "John", "age": 30';
      final result = parsePartialJson(jsonString) as Map<String, dynamic>;
      expect(result, equals({'name': 'John', 'age': 30}));
    });

    test('Missing value should return null', () {
      const jsonString = '{"name": "John", "age":';
      final result = parsePartialJson(jsonString);
      expect(result, isNull);
    });

    test('Invalid JSON should return null', () {
      const jsonString = '{"name": "John, "age": 30}';
      final result = parsePartialJson(jsonString);
      expect(result, isNull);
    });

    test('should handle strings with whitespace', () {
      const jsonString = '  {"name": "John Doe"}  ';
      final result = parsePartialJson(jsonString) as Map<String, dynamic>;
      expect(result['name'], equals('John Doe'));
    });
  });
}
