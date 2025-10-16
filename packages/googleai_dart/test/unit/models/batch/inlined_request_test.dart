// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/src/models/batch/inlined_request.dart';
import 'package:googleai_dart/src/models/content/content.dart';
import 'package:googleai_dart/src/models/content/part.dart';
import 'package:googleai_dart/src/models/generation/generate_content_request.dart';
import 'package:test/test.dart';

void main() {
  group('InlinedRequest', () {
    test('fromJson creates InlinedRequest with request and metadata', () {
      final json = {
        'request': {
          'contents': [
            {
              'parts': [
                {'text': 'Hello'},
              ],
              'role': 'user',
            },
          ],
        },
        'metadata': {'requestId': 'req-123', 'customField': 'value'},
      };

      final inlinedRequest = InlinedRequest.fromJson(json);

      expect(inlinedRequest.request, isNotNull);
      expect(inlinedRequest.request.contents.length, 1);
      expect(inlinedRequest.metadata, isNotNull);
      expect(inlinedRequest.metadata!['requestId'], 'req-123');
      expect(inlinedRequest.metadata!['customField'], 'value');
    });

    test('fromJson creates InlinedRequest without metadata', () {
      final json = {
        'request': {
          'contents': [
            {
              'parts': [
                {'text': 'Test'},
              ],
              'role': 'user',
            },
          ],
        },
      };

      final inlinedRequest = InlinedRequest.fromJson(json);

      expect(inlinedRequest.request, isNotNull);
      expect(inlinedRequest.metadata, isNull);
    });

    test('toJson creates JSON with request and metadata', () {
      const inlinedRequest = InlinedRequest(
        request: GenerateContentRequest(
          contents: [
            Content(parts: [TextPart('Hello')], role: 'user'),
          ],
        ),
        metadata: {'requestId': 'req-456'},
      );

      final json = inlinedRequest.toJson();

      expect(json['request'], isNotNull);
      expect(json['metadata'], isNotNull);
      expect(json['metadata']['requestId'], 'req-456');
    });

    test('toJson omits null metadata', () {
      const inlinedRequest = InlinedRequest(
        request: GenerateContentRequest(
          contents: [
            Content(parts: [TextPart('Test')], role: 'user'),
          ],
        ),
      );

      final json = inlinedRequest.toJson();

      expect(json['request'], isNotNull);
      expect(json.containsKey('metadata'), isFalse);
    });

    test('round-trip conversion preserves values', () {
      const original = InlinedRequest(
        request: GenerateContentRequest(
          contents: [
            Content(parts: [TextPart('Round trip')], role: 'user'),
          ],
        ),
        metadata: {'test': 'value'},
      );

      final json = original.toJson();
      final converted = InlinedRequest.fromJson(json);

      expect(
        converted.request.contents.length,
        original.request.contents.length,
      );
      expect(converted.metadata, original.metadata);
    });
  });
}
