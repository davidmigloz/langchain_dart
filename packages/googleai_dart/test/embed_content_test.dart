// ignore_for_file: avoid_redundant_argument_values
@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Google AI embed content API tests', () {
    late GoogleAIClient client;

    setUp(() async {
      client = GoogleAIClient(
        apiKey: Platform.environment['GOOGLEAI_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test embed content with embedding-001', () async {
      final res = await client.embedContent(
        modelId: 'embedding-001',
        request: const EmbedContentRequest(
          content: Content(parts: [Part(text: '123456789')]),
        ),
      );
      expect(res.embedding?.values, hasLength(768));
    });
  });
}
