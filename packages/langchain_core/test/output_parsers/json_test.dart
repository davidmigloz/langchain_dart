import 'package:langchain_core/output_parsers.dart';
import 'package:test/test.dart';

void main() {
  group('JsonOutputParser tests', () {
    test('Valid JSON input should be parsed correctly', () async {
      final parser = JsonOutputParser<String>();
      final result = await parser.invoke('{"name": "John", "age": 30}');
      expect(result, equals({'name': 'John', 'age': 30}));
    });

    test('Whitespace in JSON input should be handled correctly', () async {
      final parser = JsonOutputParser<String>();
      final result = await parser.invoke('  {"name": "John Doe"}  ');
      expect(result, equals({'name': 'John Doe'}));
    });

    test('Clearing the parser should reset the last result', () async {
      final parser = JsonOutputParser<String>();
      final result1 = await parser.invoke('{"name": "John", "age": 30}');
      expect(result1, equals({'name': 'John', 'age': 30}));
      final result2 = await parser.invoke('{"name": "Ana", "age": 40}');
      expect(result2, equals({'name': 'Ana', 'age': 40}));
    });

    test('Valid JSON stream should be parsed correctly', () async {
      final parser = JsonOutputParser<String>();
      final inputStream = Stream.fromIterable([
        '{"name": "John"',
        ', "age": 30}',
      ]);
      final result = await parser.streamFromInputStream(inputStream).toList();
      expect(
        result,
        equals([
          {'name': 'John'},
          {'name': 'John', 'age': 30},
        ]),
      );
    });

    test('Calling stream twice should parse the latest input', () async {
      final parser = JsonOutputParser<String>();
      final inputStream1 = Stream.fromIterable(['{"name": "John", "age": 30}']);
      final result1 = await parser.streamFromInputStream(inputStream1).toList();
      expect(
        result1,
        equals([
          {'name': 'John', 'age': 30},
        ]),
      );
      final inputStream2 = Stream.fromIterable(['{"name": "Ana", "age": 40}']);
      final result2 = await parser.streamFromInputStream(inputStream2).toList();
      expect(
        result2,
        equals([
          {'name': 'Ana', 'age': 40},
        ]),
      );
    });

    test('Test reduceOutputStream', () async {
      final parser = JsonOutputParser<String>(reduceOutputStream: true);
      final inputStream = Stream.fromIterable([
        '{"name": "John"',
        ', "age": 30}',
      ]);
      final result = await parser.streamFromInputStream(inputStream).toList();
      expect(
        result,
        equals([
          {'name': 'John', 'age': 30},
        ]),
      );
    });
  });
}
