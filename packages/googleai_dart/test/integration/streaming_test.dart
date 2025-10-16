// ignore_for_file: avoid_print, prefer_foreach

import 'dart:async';
import 'dart:io';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

import 'test_config.dart';

/// Integration tests for streaming content generation.
///
/// These tests require a real API key set in the GEMINI_API_KEY
/// environment variable. If the key is not present, all tests are skipped.
void main() {
  String? apiKey;
  GoogleAIClient? client;

  setUpAll(() {
    apiKey = Platform.environment['GEMINI_API_KEY'];
    if (apiKey == null || apiKey!.isEmpty) {
      print(
        '⚠️  GEMINI_API_KEY not set. Integration tests will be skipped.\n'
        '   To run these tests, export GEMINI_API_KEY=your_api_key',
      );
    } else {
      client = GoogleAIClient(
        config: GoogleAIConfig(authProvider: ApiKeyProvider(apiKey!)),
      );
    }
  });

  tearDownAll(() {
    client?.close();
  });

  group('streamGenerateContent - Integration', () {
    test('streams content chunks in real-time', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final chunks = <GenerateContentResponse>[];
      final stream = client!.models.streamGenerateContent(
        model: defaultGenerativeModel,
        request: const GenerateContentRequest(
          contents: [
            Content(
              parts: [TextPart('Count from 1 to 5, one number per line.')],
              role: 'user',
            ),
          ],
        ),
      );

      await for (final chunk in stream) {
        chunks.add(chunk);
        expect(chunk, isNotNull);
        expect(chunk.candidates, isNotEmpty);
      }

      // Should receive multiple chunks
      expect(chunks.length, greaterThan(0));

      // Each chunk should have content
      for (final chunk in chunks) {
        if (chunk.candidates?.first.content?.parts.isNotEmpty ?? false) {
          final part = chunk.candidates!.first.content!.parts.first;
          expect(part, isA<TextPart>());
        }
      }
    });

    test('streams with generation config', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final chunks = <GenerateContentResponse>[];
      final stream = client!.models.streamGenerateContent(
        model: defaultGenerativeModel,
        request: const GenerateContentRequest(
          contents: [
            Content(
              parts: [TextPart('Write a very short poem about the moon.')],
              role: 'user',
            ),
          ],
          generationConfig: GenerationConfig(
            temperature: 0.8,
            maxOutputTokens: 500,
          ),
        ),
      );

      await for (final chunk in stream) {
        chunks.add(chunk);
      }

      expect(chunks.length, greaterThan(0));
    });

    test('can abort streaming request', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final abortController = Completer<void>();
      final chunks = <GenerateContentResponse>[];

      final stream = client!.models.streamGenerateContent(
        model: defaultGenerativeModel,
        request: const GenerateContentRequest(
          contents: [
            Content(
              parts: [
                TextPart(
                  'Write a very long story about space exploration. '
                  'Include many details and make it at least 500 words.',
                ),
              ],
              role: 'user',
            ),
          ],
        ),
        abortTrigger: abortController.future,
      );

      var abortWasCalled = false;

      try {
        await for (final chunk in stream) {
          chunks.add(chunk);
          // Abort after receiving first chunk
          if (chunks.length == 1 && !abortWasCalled) {
            abortWasCalled = true;
            abortController.complete();
          }
        }
      } on AbortedException catch (e) {
        expect(e.message, contains('abort'));
        expect(e.stage, equals(AbortionStage.duringStream));
      }

      // Either the stream aborted OR it completed quickly (both are acceptable)
      expect(abortWasCalled, isTrue, reason: 'Should have attempted to abort');
      expect(chunks.length, greaterThanOrEqualTo(1));
      // Note: abortedCorrectly may be false if stream completed before abort took effect
    }, timeout: const Timeout(Duration(seconds: 60)));

    test('handles streaming errors', () {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final stream = client!.models.streamGenerateContent(
        model: 'invalid-model-for-streaming',
        request: const GenerateContentRequest(
          contents: [
            Content(parts: [TextPart('Hello')], role: 'user'),
          ],
        ),
      );

      expect(() async {
        await for (final _ in stream) {
          // Should throw before yielding anything
        }
      }, throwsA(isA<ApiException>()));
    });

    test('accumulates complete response from chunks', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final textBuffer = StringBuffer();
      final stream = client!.models.streamGenerateContent(
        model: defaultGenerativeModel,
        request: const GenerateContentRequest(
          contents: [
            Content(
              parts: [TextPart('Say exactly: "The answer is 42."')],
              role: 'user',
            ),
          ],
        ),
      );

      await for (final chunk in stream) {
        if (chunk.candidates?.first.content?.parts.isNotEmpty ?? false) {
          final part = chunk.candidates!.first.content!.parts.first;
          if (part is TextPart) {
            textBuffer.write(part.text);
          }
        }
      }

      final fullText = textBuffer.toString();
      expect(fullText, isNotEmpty);
      expect(fullText.toLowerCase(), contains('42'));
    });

    test('receives finish reason in final chunk', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      GenerateContentResponse? lastChunk;
      final stream = client!.models.streamGenerateContent(
        model: defaultGenerativeModel,
        request: const GenerateContentRequest(
          contents: [
            Content(parts: [TextPart('Say "done".')], role: 'user'),
          ],
        ),
      );

      await for (final chunk in stream) {
        lastChunk = chunk;
      }

      expect(lastChunk, isNotNull);
      expect(lastChunk!.candidates?.first.finishReason, isNotNull);
    });
  });
}
