// ignore_for_file: avoid_dynamic_calls

import 'dart:async';
import 'dart:convert';

import 'package:googleai_dart/src/utils/streaming_parser.dart';
import 'package:test/test.dart';

void main() {
  group('parseSSE', () {
    test('parses valid SSE data lines with space (standard format)', () async {
      final input = Stream.fromIterable([
        'data: {"message": "hello"}',
        'data: {"message": "world"}',
      ]);

      final results = await parseSSE(input).toList();

      expect(results, hasLength(2));
      expect(results[0]['message'], equals('hello'));
      expect(results[1]['message'], equals('world'));
    });

    test('parses SSE data lines without space (alternative format)', () async {
      // Some providers omit the space after the colon
      final input = Stream.fromIterable([
        'data:{"message": "hello"}',
        'data:{"message": "world"}',
      ]);

      final results = await parseSSE(input).toList();

      expect(results, hasLength(2));
      expect(results[0]['message'], equals('hello'));
      expect(results[1]['message'], equals('world'));
    });

    test('parses mixed SSE formats (with and without spaces)', () async {
      final input = Stream.fromIterable([
        'data: {"format": "with-space"}',
        'data:{"format": "no-space"}',
        'data:  {"format": "multiple-spaces"}',
      ]);

      final results = await parseSSE(input).toList();

      expect(results, hasLength(3));
      expect(results[0]['format'], equals('with-space'));
      expect(results[1]['format'], equals('no-space'));
      expect(results[2]['format'], equals('multiple-spaces'));
    });

    test('ignores lines without data prefix', () async {
      final input = Stream.fromIterable([
        'event: message',
        'data: {"valid": true}',
        'id: 123',
        'data: {"valid": false}',
      ]);

      final results = await parseSSE(input).toList();

      expect(results, hasLength(2));
      expect(results[0]['valid'], isTrue);
      expect(results[1]['valid'], isFalse);
    });

    test('handles [DONE] sentinel', () async {
      final input = Stream.fromIterable([
        'data: {"count": 1}',
        'data: [DONE]',
        'data: {"count": 2}',
      ]);

      final results = await parseSSE(input).toList();

      expect(results, hasLength(2));
      expect(results[0]['count'], equals(1));
      expect(results[1]['count'], equals(2));
    });

    test('skips empty data lines', () async {
      final input = Stream.fromIterable([
        'data: ',
        'data: {"valid": true}',
        'data:   ',
      ]);

      final results = await parseSSE(input).toList();

      expect(results, hasLength(1));
      expect(results[0]['valid'], isTrue);
    });

    test('handles malformed JSON gracefully', () async {
      final input = Stream.fromIterable([
        'data: {"valid": true}',
        'data: {invalid json',
        'data: {"valid": false}',
      ]);

      final results = await parseSSE(input).toList();

      expect(results, hasLength(2));
      expect(results[0]['valid'], isTrue);
      expect(results[1]['valid'], isFalse);
    });

    test('handles nested JSON objects', () async {
      final input = Stream.fromIterable([
        'data: {"nested": {"level": 1, "data": {"level": 2}}}',
      ]);

      final results = await parseSSE(input).toList();

      expect(results, hasLength(1));
      expect(results[0]['nested']['level'], equals(1));
      expect(results[0]['nested']['data']['level'], equals(2));
    });

    test('handles arrays in JSON', () async {
      final input = Stream.fromIterable([
        'data: {"items": [1, 2, 3], "names": ["a", "b"]}',
      ]);

      final results = await parseSSE(input).toList();

      expect(results, hasLength(1));
      expect(results[0]['items'], equals([1, 2, 3]));
      expect(results[0]['names'], equals(['a', 'b']));
    });

    test('handles Unicode characters', () async {
      final input = Stream.fromIterable([
        'data: {"emoji": "🚀", "chinese": "你好", "arabic": "مرحبا"}',
      ]);

      final results = await parseSSE(input).toList();

      expect(results, hasLength(1));
      expect(results[0]['emoji'], equals('🚀'));
      expect(results[0]['chinese'], equals('你好'));
      expect(results[0]['arabic'], equals('مرحبا'));
    });

    test('handles empty stream', () async {
      final input = Stream<String>.fromIterable([]);

      final results = await parseSSE(input).toList();

      expect(results, isEmpty);
    });

    test('handles stream with only comments and metadata', () async {
      final input = Stream.fromIterable([
        'event: start',
        'id: 123',
        ':comment',
        'retry: 3000',
      ]);

      final results = await parseSSE(input).toList();

      expect(results, isEmpty);
    });

    test('WHATWG spec compliance: space after colon is optional', () async {
      // Per WHATWG spec: space after colon is optional and should be stripped
      // Both "data:value" and "data: value" should result in same parsed value
      final testCases = [
        ('data:{"test":true}', true),
        ('data: {"test":true}', true),
        ('data:  {"test":true}', true), // Multiple spaces
        ('data:\t{"test":true}', true), // Tab after colon
      ];

      for (final (input, expectedValue) in testCases) {
        final stream = Stream.fromIterable([input]);
        final results = await parseSSE(stream).toList();

        expect(results, hasLength(1), reason: 'Failed for input: $input');
        expect(
          results[0]['test'],
          expectedValue,
          reason: 'Failed for input: $input',
        );
      }
    });
  });

  group('parseNDJSON', () {
    test('parses valid NDJSON lines', () async {
      final input = Stream.fromIterable([
        '{"line": 1}',
        '{"line": 2}',
        '{"line": 3}',
      ]);

      final results = await parseNDJSON(input).toList();

      expect(results, hasLength(3));
      expect(results[0]['line'], equals(1));
      expect(results[1]['line'], equals(2));
      expect(results[2]['line'], equals(3));
    });

    test('skips empty lines', () async {
      final input = Stream.fromIterable([
        '{"valid": true}',
        '',
        '{"valid": false}',
        '   ',
      ]);

      final results = await parseNDJSON(input).toList();

      expect(results, hasLength(2));
      expect(results[0]['valid'], isTrue);
      expect(results[1]['valid'], isFalse);
    });

    test('handles malformed JSON gracefully', () async {
      final input = Stream.fromIterable([
        '{"valid": true}',
        '{invalid',
        '{"valid": false}',
      ]);

      final results = await parseNDJSON(input).toList();

      expect(results, hasLength(2));
      expect(results[0]['valid'], isTrue);
      expect(results[1]['valid'], isFalse);
    });

    test('handles nested objects', () async {
      final input = Stream.fromIterable([
        '{"data": {"nested": {"deep": "value"}}}',
      ]);

      final results = await parseNDJSON(input).toList();

      expect(results, hasLength(1));
      expect(results[0]['data']['nested']['deep'], equals('value'));
    });

    test('handles arrays', () async {
      final input = Stream.fromIterable([
        '{"numbers": [1, 2, 3], "strings": ["a", "b", "c"]}',
      ]);

      final results = await parseNDJSON(input).toList();

      expect(results, hasLength(1));
      expect(results[0]['numbers'], equals([1, 2, 3]));
      expect(results[0]['strings'], equals(['a', 'b', 'c']));
    });

    test('trims whitespace', () async {
      final input = Stream.fromIterable([
        '  {"key": "value"}  ',
        '\t{"key": "value2"}\t',
      ]);

      final results = await parseNDJSON(input).toList();

      expect(results, hasLength(2));
      expect(results[0]['key'], equals('value'));
      expect(results[1]['key'], equals('value2'));
    });

    test('handles empty stream', () async {
      final input = Stream<String>.fromIterable([]);

      final results = await parseNDJSON(input).toList();

      expect(results, isEmpty);
    });
  });

  group('bytesToLines', () {
    test('converts bytes to lines', () async {
      final bytes = utf8.encode('line1\nline2\nline3\n');
      final input = Stream.value(bytes);

      final results = await bytesToLines(input).toList();

      expect(results, hasLength(3));
      expect(results, equals(['line1', 'line2', 'line3']));
    });

    test('handles chunked input', () async {
      final input = Stream.fromIterable([
        utf8.encode('first'),
        utf8.encode('line\nse'),
        utf8.encode('cond'),
        utf8.encode('line\n'),
      ]);

      final results = await bytesToLines(input).toList();

      expect(results, hasLength(2));
      expect(results, equals(['firstline', 'secondline']));
    });

    test('handles different line endings', () async {
      final bytes = utf8.encode('line1\nline2\r\nline3\r');
      final input = Stream.value(bytes);

      final results = await bytesToLines(input).toList();

      // LineSplitter handles \n and \r\n
      expect(results.length, greaterThanOrEqualTo(2));
      expect(results[0], equals('line1'));
      expect(results[1], equals('line2'));
    });

    test('handles Unicode characters', () async {
      final bytes = utf8.encode('emoji: 🚀\nchinese: 你好\narabic: مرحبا\n');
      final input = Stream.value(bytes);

      final results = await bytesToLines(input).toList();

      expect(results, hasLength(3));
      expect(results[0], equals('emoji: 🚀'));
      expect(results[1], equals('chinese: 你好'));
      expect(results[2], equals('arabic: مرحبا'));
    });

    test('handles empty chunks', () async {
      final input = Stream.fromIterable([
        utf8.encode(''),
        utf8.encode('line1\n'),
        utf8.encode(''),
        utf8.encode('line2\n'),
      ]);

      final results = await bytesToLines(input).toList();

      expect(results, hasLength(2));
      expect(results, equals(['line1', 'line2']));
    });

    test('handles single byte chunks', () async {
      const text = 'ab\ncd\n';
      final input = Stream.fromIterable(
        text.codeUnits.map((c) => [c]),
      );

      final results = await bytesToLines(input).toList();

      expect(results, hasLength(2));
      expect(results, equals(['ab', 'cd']));
    });

    test('handles empty stream', () async {
      final input = Stream<List<int>>.fromIterable([]);

      final results = await bytesToLines(input).toList();

      expect(results, isEmpty);
    });
  });

  group('Integration Tests', () {
    test('SSE full pipeline: bytes → lines → JSON', () async {
      final bytes = utf8.encode(
        'data: {"id": 1}\n'
        'data: {"id": 2}\n'
        'data: [DONE]\n',
      );
      final byteStream = Stream.value(bytes);

      final results = await parseSSE(bytesToLines(byteStream)).toList();

      expect(results, hasLength(2));
      expect(results[0]['id'], equals(1));
      expect(results[1]['id'], equals(2));
    });

    test('NDJSON full pipeline: bytes → lines → JSON', () async {
      final bytes = utf8.encode(
        '{"id": 1}\n'
        '{"id": 2}\n'
        '{"id": 3}\n',
      );
      final byteStream = Stream.value(bytes);

      final results = await parseNDJSON(bytesToLines(byteStream)).toList();

      expect(results, hasLength(3));
      expect(results[0]['id'], equals(1));
      expect(results[1]['id'], equals(2));
      expect(results[2]['id'], equals(3));
    });

    test('handles real-world SSE streaming scenario', () async {
      final chunks = [
        'event: message\n',
        'data: {"chunk": 1, "text": "Hello"}\n',
        '\n',
        'event: message\n',
        'data: {"chunk": 2, "text": " world"}\n',
        '\n',
        'data: [DONE]\n',
      ];

      final byteStream = Stream.fromIterable(
        chunks.map((chunk) => utf8.encode(chunk)),
      );

      final results = await parseSSE(bytesToLines(byteStream)).toList();

      expect(results, hasLength(2));
      expect(results[0]['chunk'], equals(1));
      expect(results[0]['text'], equals('Hello'));
      expect(results[1]['chunk'], equals(2));
      expect(results[1]['text'], equals(' world'));
    });
  });
}
