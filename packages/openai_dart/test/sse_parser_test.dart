import 'dart:async';
import 'dart:convert';

import 'package:openai_dart/src/client.dart';
import 'package:test/test.dart';

void main() {
  group('_OpenAIStreamTransformer tests', () {
    test('parses SSE data with space after colon (standard format)', () async {
      // Standard OpenAI format: "data: {json}"
      final sseData = [
        'data: {"id":"1","object":"text_completion","choices":[]}',
        'data: {"id":"2","object":"text_completion","choices":[]}',
        'data:[DONE]', // Should be filtered out
      ].join('\n');

      final bytes = utf8.encode(sseData) as List<int>;
      final stream = Stream<List<int>>.value(bytes);
      final transformer = createOpenAIStreamTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(2));
      expect(results[0], '{"id":"1","object":"text_completion","choices":[]}');
      expect(results[1], '{"id":"2","object":"text_completion","choices":[]}');
    });

    test(
      'parses SSE data without space after colon (LongCat format)',
      () async {
        // Non-standard format used by some providers: "data:{json}"
        final sseData = [
          'data:{"id":"1","object":"text_completion","choices":[]}',
          'data:{"id":"2","object":"text_completion","choices":[]}',
        ].join('\n');

        final bytes = utf8.encode(sseData) as List<int>;
        final stream = Stream<List<int>>.value(bytes);
        final transformer = createOpenAIStreamTransformer();
        final results = await stream.transform(transformer).toList();

        expect(results, hasLength(2));
        expect(
          results[0],
          '{"id":"1","object":"text_completion","choices":[]}',
        );
        expect(
          results[1],
          '{"id":"2","object":"text_completion","choices":[]}',
        );
      },
    );

    test('parses SSE data with multiple spaces after colon', () async {
      // Edge case: multiple spaces after colon
      final sseData = [
        'data:  {"id":"1","object":"text_completion"}',
        'data:   {"id":"2","object":"text_completion"}',
      ].join('\n');

      final bytes = utf8.encode(sseData) as List<int>;
      final stream = Stream<List<int>>.value(bytes);
      final transformer = createOpenAIStreamTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(2));
      expect(results[0], '{"id":"1","object":"text_completion"}');
      expect(results[1], '{"id":"2","object":"text_completion"}');
    });

    test('parses mixed SSE formats (with and without spaces)', () async {
      // Real-world scenario: mixed formats from different servers
      final sseData = [
        'data: {"id":"1","format":"with-space"}',
        'data:{"id":"2","format":"no-space"}',
        'data:  {"id":"3","format":"multiple-spaces"}',
      ].join('\n');

      final bytes = utf8.encode(sseData) as List<int>;
      final stream = Stream<List<int>>.value(bytes);
      final transformer = createOpenAIStreamTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(3));
      expect(results[0], contains('with-space'));
      expect(results[1], contains('no-space'));
      expect(results[2], contains('multiple-spaces'));
    });

    test('filters out [DONE] messages correctly', () async {
      final sseData = [
        'data: {"id":"1","object":"text_completion"}',
        'data:[DONE]', // Without space
        'data: [DONE]', // With space
      ].join('\n');

      final bytes = utf8.encode(sseData) as List<int>;
      final stream = Stream<List<int>>.value(bytes);
      final transformer = createOpenAIStreamTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(1));
      expect(results[0], contains('"id":"1"'));
    });

    test('handles empty data fields', () async {
      final sseData = [
        'data:',
        'data: ',
        'data: {"id":"1"}',
      ].join('\n');

      final bytes = utf8.encode(sseData) as List<int>;
      final stream = Stream<List<int>>.value(bytes);
      final transformer = createOpenAIStreamTransformer();
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

      final bytes = utf8.encode(sseData) as List<int>;
      final stream = Stream<List<int>>.value(bytes);
      final transformer = createOpenAIStreamTransformer();
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

      final bytes = utf8.encode(sseData) as List<int>;
      final stream = Stream<List<int>>.value(bytes);
      final transformer = createOpenAIStreamTransformer();
      final results = await stream.transform(transformer).toList();

      // Only data: lines should be processed
      expect(results, hasLength(2));
      expect(results[0], contains('"id":"1"'));
      expect(results[1], contains('"id":"2"'));
    });

    test('handles streaming chunks (incremental data)', () async {
      // Simulate streaming: data arrives in chunks
      final controller = StreamController<List<int>>();

      final transformer = createOpenAIStreamTransformer();
      final resultsFuture = controller.stream.transform(transformer).toList();

      // Send data in chunks
      controller.add(utf8.encode('data: {"id":"1"}\n'));
      await Future<void>.delayed(Duration.zero);

      controller.add(utf8.encode('data:{"id":"2"}\n'));
      await Future<void>.delayed(Duration.zero);

      controller.add(utf8.encode('data:[DONE]\n'));
      await controller.close();

      final results = await resultsFuture;

      expect(results, hasLength(2));
      expect(results[0], '{"id":"1"}');
      expect(results[1], '{"id":"2"}');
    });

    test('handles long JSON payloads', () async {
      // Test with large data
      final largeJson = json.encode({
        'id': '1',
        'choices': List.generate(
          100,
          (i) => {'index': i, 'text': 'word' * 100},
        ),
      });

      final sseData = 'data: $largeJson\ndata:[DONE]';

      final bytes = utf8.encode(sseData) as List<int>;
      final stream = Stream<List<int>>.value(bytes);
      final transformer = createOpenAIStreamTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(1));
      expect(results[0].length, greaterThan(1000));
      expect(results[0], contains('"id":"1"'));
    });
  });

  group('_PairwiseTransformer tests', () {
    test('pairs event and data with spaces (standard format)', () async {
      final lines = [
        'event: thread.created',
        'data: {"id":"thread_123","object":"thread"}',
      ];

      final stream = Stream.fromIterable(lines);
      final transformer = createPairwiseTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(1));
      expect(results[0].$1, 'thread.created');
      expect(results[0].$2, '{"id":"thread_123","object":"thread"}');
    });

    test('pairs event and data without spaces (LongCat format)', () async {
      final lines = [
        'event:thread.run.created',
        'data:{"id":"run_456","status":"queued"}',
      ];

      final stream = Stream.fromIterable(lines);
      final transformer = createPairwiseTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(1));
      expect(results[0].$1, 'thread.run.created');
      expect(results[0].$2, '{"id":"run_456","status":"queued"}');
    });

    test('pairs mixed format events and data', () async {
      final lines = [
        'event: thread.message.created', // With space
        'data:{"id":"msg_789","role":"assistant"}', // Without space
      ];

      final stream = Stream.fromIterable(lines);
      final transformer = createPairwiseTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(1));
      expect(results[0].$1, 'thread.message.created');
      expect(results[0].$2, '{"id":"msg_789","role":"assistant"}');
    });

    test('handles multiple event-data pairs in sequence', () async {
      final lines = [
        'event: thread.run.created',
        'data: {"id":"run_1","status":"queued"}',
        'event: thread.run.in_progress',
        'data: {"id":"run_1","status":"in_progress"}',
        'event: thread.run.completed',
        'data: {"id":"run_1","status":"completed"}',
      ];

      final stream = Stream.fromIterable(lines);
      final transformer = createPairwiseTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(3));

      expect(results[0].$1, 'thread.run.created');
      expect(results[0].$2, contains('queued'));

      expect(results[1].$1, 'thread.run.in_progress');
      expect(results[1].$2, contains('in_progress'));

      expect(results[2].$1, 'thread.run.completed');
      expect(results[2].$2, contains('completed'));
    });

    test('handles mixed formats in sequence', () async {
      final lines = [
        'event: message.delta', // Space
        'data:{"delta":"content 1"}', // No space
        'event:message.delta', // No space
        'data: {"delta":"content 2"}', // Space
        'event:done', // No space
        'data:[DONE]', // No space
      ];

      final stream = Stream.fromIterable(lines);
      final transformer = createPairwiseTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(3));
      expect(results[0].$1, 'message.delta');
      expect(results[1].$1, 'message.delta');
      expect(results[2].$1, 'done');
    });

    test('handles event with multiple spaces', () async {
      final lines = [
        'event:  thread.created', // Multiple spaces
        'data:  {"id":"thread_123"}', // Multiple spaces
      ];

      final stream = Stream.fromIterable(lines);
      final transformer = createPairwiseTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(1));
      expect(results[0].$1, 'thread.created');
      expect(results[0].$2, '{"id":"thread_123"}');
    });

    test('handles UTF-8 in event-data pairs', () async {
      final lines = [
        'event: message.delta',
        'data: {"text":"Hello 世界 🌍"}',
      ];

      final stream = Stream.fromIterable(lines);
      final transformer = createPairwiseTransformer();
      final results = await stream.transform(transformer).toList();

      expect(results, hasLength(1));
      expect(results[0].$2, contains('世界 🌍'));
    });

    test('ignores non-event/data lines', () async {
      final lines = [
        ':comment',
        'event: thread.created',
        'id: 123',
        'data: {"id":"thread_123"}',
        'retry: 1000',
      ];

      final stream = Stream.fromIterable(lines);
      final transformer = createPairwiseTransformer();
      final results = await stream.transform(transformer).toList();

      // Only event-data pairs are emitted
      expect(results, hasLength(1));
      expect(results[0].$1, 'thread.created');
    });

    test('handles streaming chunks for assistant API', () async {
      final controller = StreamController<String>();

      final transformer = createPairwiseTransformer();
      final resultsFuture = controller.stream.transform(transformer).toList();

      // Send event-data pairs in chunks
      controller.add('event: thread.run.step.delta');
      await Future<void>.delayed(Duration.zero);

      controller.add('data: {"delta":{"content":"chunk1"}}');
      await Future<void>.delayed(Duration.zero);

      controller.add('event:thread.run.step.delta');
      await Future<void>.delayed(Duration.zero);

      controller.add('data:{"delta":{"content":"chunk2"}}');
      await controller.close();

      final results = await resultsFuture;

      expect(results, hasLength(2));
      expect(results[0].$2, contains('chunk1'));
      expect(results[1].$2, contains('chunk2'));
    });
  });

  group('SSE spec compliance tests', () {
    test('OpenAIStreamTransformer complies with WHATWG SSE spec', () async {
      // Per WHATWG spec: space after colon is optional and should be stripped
      // Both "data:value" and "data: value" should result in "value"
      final testCases = [
        ('data:test', 'test'),
        ('data: test', 'test'),
        ('data:  test', 'test'),
        ('data:\ttest', 'test'), // Tab after colon
      ];

      for (final (input, expected) in testCases) {
        final bytes = utf8.encode(input) as List<int>;
        final stream = Stream<List<int>>.value(bytes);
        final transformer = createOpenAIStreamTransformer();
        final results = await stream.transform(transformer).toList();

        expect(results, hasLength(1), reason: 'Failed for input: $input');
        expect(results[0], expected, reason: 'Failed for input: $input');
      }
    });

    test('PairwiseTransformer complies with WHATWG SSE spec', () async {
      // Both "event:type" and "event: type" should result in "type"
      final testCases = [
        (('event:test', 'data:value'), ('test', 'value')),
        (('event: test', 'data: value'), ('test', 'value')),
        (('event:  test', 'data:  value'), ('test', 'value')),
      ];

      for (final (input, expected) in testCases) {
        final stream = Stream.fromIterable([input.$1, input.$2]);
        final transformer = createPairwiseTransformer();
        final results = await stream.transform(transformer).toList();

        expect(results, hasLength(1), reason: 'Failed for: ${input.$1}');
        expect(results[0].$1, expected.$1, reason: 'Event mismatch');
        expect(results[0].$2, expected.$2, reason: 'Data mismatch');
      }
    });
  });
}
