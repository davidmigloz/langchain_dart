@Tags(['integration'])
library;

import 'dart:async';
import 'dart:io';

import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

import 'test_config.dart';

void main() {
  group('Error Scenarios', () {
    final apiKey = Platform.environment['GEMINI_API_KEY'];
    GoogleAIClient? client;

    setUpAll(() {
      if (apiKey == null) {
        throw StateError(
          'GEMINI_API_KEY environment variable must be set for integration tests',
        );
      }
    });

    setUp(() {
      client = GoogleAIClient(
        config: GoogleAIConfig(
          authProvider: ApiKeyProvider(apiKey!),
        ),
      );
    });

    tearDown(() {
      client?.close();
      client = null;
    });

    group('Invalid API Key', () {
      test('throws ApiException for invalid API key', () async {
        // Create a separate client with invalid key
        final invalidClient = GoogleAIClient(
          config: const GoogleAIConfig(
            authProvider: ApiKeyProvider('invalid-api-key-12345'),
          ),
        );
        addTearDown(invalidClient.close);

        await expectLater(
          invalidClient.models.generateContent(
            model: defaultGenerativeModel,
            request: const GenerateContentRequest(
              contents: [
                Content(
                  parts: [TextPart('test')],
                  role: 'user',
                ),
              ],
            ),
          ),
          throwsA(
            isA<ApiException>()
                .having((e) => e.code, 'code', equals(400))
                .having(
                  (e) => e.message,
                  'message',
                  contains('API key'),
                ),
          ),
        );
      });
    });

    group('Invalid Model', () {
      test('throws ApiException for non-existent model', () async {
        await expectLater(
          client!.models.generateContent(
            model: 'invalid-model-xyz-999',
            request: const GenerateContentRequest(
              contents: [
                Content(
                  parts: [TextPart('test')],
                  role: 'user',
                ),
              ],
            ),
          ),
          throwsA(
            isA<ApiException>().having(
              (e) => e.code,
              'code',
              equals(404),
            ),
          ),
        );
      });
    });

    group('Empty Content', () {
      test('handles empty parts list', () async {
        await expectLater(
          client!.models.generateContent(
            model: defaultGenerativeModel,
            request: const GenerateContentRequest(
              contents: [
                Content(
                  parts: [],
                  role: 'user',
                ),
              ],
            ),
          ),
          throwsA(isA<ApiException>()),
        );
      });

      test('handles empty text', () async {
        // Empty text should be handled by the API
        // The behavior may vary - could succeed or fail
        try {
          await client!.models.generateContent(
            model: defaultGenerativeModel,
            request: const GenerateContentRequest(
              contents: [
                Content(
                  parts: [TextPart('')],
                  role: 'user',
                ),
              ],
            ),
          );
          // If it succeeds, that's valid behavior
        } on ApiException {
          // If it fails with ApiException, that's also valid
        }
      });
    });

    group('Request Abortion', () {
      test('can abort in-flight request', () async {
        // Create an abort controller
        final abortController = Completer<void>();

        // Start a long-running request with abort trigger
        final requestFuture = client!.models.generateContent(
          model: defaultGenerativeModel,
          request: const GenerateContentRequest(
            contents: [
              Content(
                parts: [
                  TextPart(
                    'Write a very long and detailed essay about the '
                    'history of computing, covering early mechanical computers, '
                    'the development of electronic computers, transistors, '
                    'integrated circuits, microprocessors, personal computers, '
                    'the internet, mobile computing, cloud computing, and '
                    'artificial intelligence. Include at least 20 paragraphs.',
                  ),
                ],
                role: 'user',
              ),
            ],
          ),
          abortTrigger: abortController.future,
        );

        // Trigger abort after a short delay (during request)
        await Future<void>.delayed(const Duration(milliseconds: 50));
        abortController.complete();

        // Verify AbortedException is thrown
        await expectLater(
          requestFuture,
          throwsA(
            isA<AbortedException>()
                .having((e) => e.correlationId, 'correlationId', isNotEmpty)
                .having((e) => e.timestamp, 'timestamp', isNotNull)
                .having(
                  (e) => e.stage,
                  'stage',
                  anyOf(
                    AbortionStage.beforeRequest,
                    AbortionStage.duringRequest,
                  ),
                ),
          ),
        );
      });

      test('can abort streaming request', () async {
        // Create an abort controller
        final abortController = Completer<void>();
        var receivedChunks = 0;

        try {
          // Start streaming with a long request
          await for (final _ in client!.models.streamGenerateContent(
            model: defaultGenerativeModel,
            request: const GenerateContentRequest(
              contents: [
                Content(
                  parts: [
                    TextPart(
                      'Write a very long and detailed story about space '
                      'exploration, covering the history of space travel, '
                      'modern missions to Mars, the International Space Station, '
                      'future possibilities for interstellar travel, and '
                      'the search for extraterrestrial life. Include many '
                      'paragraphs with detailed descriptions.',
                    ),
                  ],
                  role: 'user',
                ),
              ],
            ),
            abortTrigger: abortController.future,
          )) {
            receivedChunks++;
            // Abort after receiving a few chunks
            if (receivedChunks >= 3 && !abortController.isCompleted) {
              abortController.complete();
            }
          }
          fail('Expected AbortedException to be thrown');
        } on AbortedException catch (e) {
          // Verify the exception has correct properties
          expect(e.stage, equals(AbortionStage.duringStream));
          expect(e.correlationId, isNotEmpty);
          expect(e.timestamp, isNotNull);
          expect(e.message.toLowerCase(), contains('abort'));
          // Verify we received at least some chunks before aborting
          expect(receivedChunks, greaterThanOrEqualTo(3));
        }
      });

      test('handles stream cancellation without abort', () async {
        final abortController = Completer<void>();

        final subscription = client!.models
            .streamGenerateContent(
          model: defaultGenerativeModel,
          request: const GenerateContentRequest(
            contents: [
              Content(
                parts: [
                  TextPart(
                    'Write a very long and detailed story about space '
                    'exploration covering multiple topics.',
                  ),
                ],
                role: 'user',
              ),
            ],
          ),
          abortTrigger: abortController.future,
        )
            .listen((chunk) {
          // Consume chunks
        });

        // Wait a bit then cancel subscription (without using abort)
        await Future<void>.delayed(const Duration(seconds: 1));
        await subscription.cancel();

        // Trigger abort AFTER cancellation - this should not cause StateError
        await Future<void>.delayed(const Duration(milliseconds: 200));
        abortController.complete();

        // Wait to ensure no StateError is thrown
        await Future<void>.delayed(const Duration(milliseconds: 200));

        // Test passes if we reach here without crash
      });

      test('handles abort before stream starts', () async {
        // Complete abort trigger IMMEDIATELY
        final abortController = Completer<void>()..complete();

        try {
          await for (final _ in client!.models.streamGenerateContent(
            model: defaultGenerativeModel,
            request: const GenerateContentRequest(
              contents: [
                Content(
                  parts: [TextPart('test')],
                  role: 'user',
                ),
              ],
            ),
            abortTrigger: abortController.future,
          )) {
            fail('Should not receive any chunks');
          }
          fail('Should throw AbortedException');
        } on AbortedException catch (e) {
          expect(e.stage, AbortionStage.duringStream);
        }
      });

      test('abort after completion is no-op', () async {
        final abortController = Completer<void>();

        // Use a fast request that completes quickly
        final response = await client!.models.generateContent(
          model: defaultGenerativeModel,
          request: const GenerateContentRequest(
            contents: [
              Content(
                parts: [TextPart('Say hello')], // Short request
                role: 'user',
              ),
            ],
          ),
          abortTrigger: abortController.future,
        );

        // Verify response received
        expect(response.candidates, isNotEmpty);

        // Trigger abort AFTER completion (should be no-op)
        abortController.complete();

        await Future<void>.delayed(const Duration(milliseconds: 100));
        // Should not crash or throw
      });

      test('abort reports correct stage', () async {
        final abortController = Completer<void>();

        // Abort very early
        Future<void>.delayed(const Duration(milliseconds: 10), () {
          if (!abortController.isCompleted) {
            abortController.complete();
          }
        });

        try {
          await client!.models.generateContent(
            model: defaultGenerativeModel,
            request: const GenerateContentRequest(
              contents: [
                Content(
                  parts: [TextPart('Write a long essay')],
                  role: 'user',
                ),
              ],
            ),
            abortTrigger: abortController.future,
          );
          fail('Should throw');
        } on AbortedException catch (e) {
          // Stage should be beforeRequest or duringRequest
          expect(
            e.stage,
            anyOf(AbortionStage.beforeRequest, AbortionStage.duringRequest),
          );
        }
      });
    });

    group('Invalid Request Parameters', () {
      test('handles invalid generation config', () async {
        // Temperature outside valid range
        await expectLater(
          client!.models.generateContent(
            model: defaultGenerativeModel,
            request: const GenerateContentRequest(
              contents: [
                Content(
                  parts: [TextPart('test')],
                  role: 'user',
                ),
              ],
              generationConfig: GenerationConfig(
                temperature: 999.0, // Invalid - should be 0.0-2.0
              ),
            ),
          ),
          throwsA(isA<ApiException>()),
        );
      });
    });

    group('Error Context Preservation', () {
      test('preserves request metadata in exceptions', () async {
        // Create a separate client with invalid key
        final invalidClient = GoogleAIClient(
          config: const GoogleAIConfig(
            authProvider: ApiKeyProvider('invalid-key'),
          ),
        );
        addTearDown(invalidClient.close);

        try {
          await invalidClient.models.generateContent(
            model: defaultGenerativeModel,
            request: const GenerateContentRequest(
              contents: [
                Content(
                  parts: [TextPart('test')],
                  role: 'user',
                ),
              ],
            ),
          );
          fail('Should have thrown ApiException');
        } on ApiException catch (e) {
          // Verify request metadata is present
          expect(e.requestMetadata, isNotNull);
          expect(e.requestMetadata!.correlationId, isNotEmpty);
          expect(e.requestMetadata!.timestamp, isNotNull);

          // Verify we got the exception
          expect(e, isA<ApiException>());
          expect(e.code, equals(400));
        }
      });
    });
  });
}
