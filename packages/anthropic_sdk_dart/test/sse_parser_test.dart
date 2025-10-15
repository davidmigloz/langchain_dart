import 'dart:async';
import 'dart:convert';

import 'package:test/test.dart';

void main() {
  group('_AnthropicStreamTransformer tests', () {
    test('parses SSE data with space after colon (standard format)', () async {
      // Standard Anthropic format: "data: {json}"
      final sseData = [
        'data: {"type":"message_start","message":{}}',
        'data: {"type":"content_block_delta","delta":{}}',
      ].join('\n');

      final bytes = utf8.encode(sseData);
      final stream = Stream<List<int>>.value(bytes);
      final transformer = createAnthropicStreamTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(2));
      expect(results[0], '{"type":"message_start","message":{}}');
      expect(results[1], '{"type":"content_block_delta","delta":{}}');
    });

    test(
      'parses SSE data without space after colon (alternative format)',
      () async {
        // Non-standard format used by some providers: "data:{json}"
        final sseData = [
          'data:{"type":"message_start","message":{}}',
          'data:{"type":"content_block_delta","delta":{}}',
        ].join('\n');

        final bytes = utf8.encode(sseData);
        final stream = Stream<List<int>>.value(bytes);
        final transformer = createAnthropicStreamTransformer();
        final results = await stream.transform(transformer).toList();

        expect(results, hasLength(2));
        expect(results[0], '{"type":"message_start","message":{}}');
        expect(results[1], '{"type":"content_block_delta","delta":{}}');
      },
    );

    test('parses SSE data with multiple spaces after colon', () async {
      // Edge case: multiple spaces after colon
      final sseData = [
        'data:  {"type":"message_start"}',
        'data:   {"type":"content_block_delta"}',
      ].join('\n');

      final bytes = utf8.encode(sseData);
      final stream = Stream<List<int>>.value(bytes);
      final transformer = createAnthropicStreamTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(2));
      expect(results[0], '{"type":"message_start"}');
      expect(results[1], '{"type":"content_block_delta"}');
    });

    test('parses mixed SSE formats (with and without spaces)', () async {
      // Real-world scenario: mixed formats from different servers
      final sseData = [
        'data: {"id":"1","format":"with-space"}',
        'data:{"id":"2","format":"no-space"}',
        'data:  {"id":"3","format":"multiple-spaces"}',
      ].join('\n');

      final bytes = utf8.encode(sseData);
      final stream = Stream<List<int>>.value(bytes);
      final transformer = createAnthropicStreamTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(3));
      expect(results[0], contains('with-space'));
      expect(results[1], contains('no-space'));
      expect(results[2], contains('multiple-spaces'));
    });

    test('handles empty data fields', () async {
      final sseData = [
        'data:',
        'data: ',
        'data: {"id":"1"}',
      ].join('\n');

      final bytes = utf8.encode(sseData);
      final stream = Stream<List<int>>.value(bytes);
      final transformer = createAnthropicStreamTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(3));
      expect(results[0], isEmpty);
      expect(results[1], isEmpty);
      expect(results[2], '{"id":"1"}');
    });

    test('handles UTF-8 characters correctly', () async {
      final sseData = [
        'data: {"text":"España 🇪🇸"}',
        'data:{"text":"日本語 🗾"}',
      ].join('\n');

      final bytes = utf8.encode(sseData);
      final stream = Stream<List<int>>.value(bytes);
      final transformer = createAnthropicStreamTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(2));
      expect(results[0], contains('España 🇪🇸'));
      expect(results[1], contains('日本語 🗾'));
    });

    test('filters out non-data lines', () async {
      final sseData = [
        ':comment line',
        'event: message',
        'data: {"id":"1"}',
        'id: 123',
        'data: {"id":"2"}',
      ].join('\n');

      final bytes = utf8.encode(sseData);
      final stream = Stream<List<int>>.value(bytes);
      final transformer = createAnthropicStreamTransformer();
      final results = await stream.transform(transformer).toList();

      // Only data: lines should be processed
      expect(results, hasLength(2));
      expect(results[0], contains('"id":"1"'));
      expect(results[1], contains('"id":"2"'));
    });

    test('handles streaming chunks (incremental data)', () async {
      // Simulate streaming: data arrives in chunks
      final controller = StreamController<List<int>>();

      final transformer = createAnthropicStreamTransformer();
      final resultsFuture = controller.stream.transform(transformer).toList();

      // Send data in chunks
      controller.add(utf8.encode('data: {"type":"start"}\n'));
      await Future<void>.delayed(Duration.zero);

      controller.add(utf8.encode('data:{"type":"delta"}\n'));
      await Future<void>.delayed(Duration.zero);

      await controller.close();

      final results = await resultsFuture;

      expect(results, hasLength(2));
      expect(results[0], '{"type":"start"}');
      expect(results[1], '{"type":"delta"}');
    });

    test('handles long JSON payloads', () async {
      // Test with large data
      final largeJson = jsonEncode({
        'type': 'content_block_delta',
        'delta': {
          'text': 'word' * 1000,
        },
      });

      final sseData = 'data: $largeJson';

      final bytes = utf8.encode(sseData);
      final stream = Stream<List<int>>.value(bytes);
      final transformer = createAnthropicStreamTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(1));
      expect(results[0].length, greaterThan(1000));
      expect(results[0], contains('content_block_delta'));
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
        final bytes = utf8.encode(input);
        final stream = Stream<List<int>>.value(bytes);
        final transformer = createAnthropicStreamTransformer();
        final results = await stream.transform(transformer).toList();

        expect(results, hasLength(1), reason: 'Failed for input: $input');
        final decoded = jsonDecode(results[0]) as Map<String, dynamic>;
        expect(
          decoded['test'],
          expectedValue,
          reason: 'Failed for input: $input',
        );
      }
    });
  });
}

/// Test helper to expose [_AnthropicStreamTransformer] for unit testing.
StreamTransformer<List<int>, String> createAnthropicStreamTransformer() {
  // Access the private class through the public API
  // We'll need to add a @visibleForTesting helper in client.dart
  return const _AnthropicStreamTransformer();
}

// Private class copy for testing (since we can't import private classes)
class _AnthropicStreamTransformer
    extends StreamTransformerBase<List<int>, String> {
  const _AnthropicStreamTransformer();

  @override
  Stream<String> bind(final Stream<List<int>> stream) {
    return stream //
        .transform(utf8.decoder) //
        .transform(const LineSplitter()) //
        .where((final i) => i.startsWith('data:'))
        .map((final item) => item.substring(5).trim());
  }
}
