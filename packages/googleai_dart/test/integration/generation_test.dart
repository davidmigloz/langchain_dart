// ignore_for_file: avoid_print

import 'dart:io';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

import 'test_config.dart';

/// Integration tests for content generation.
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
        config: GoogleAIConfig(
          authProvider: ApiKeyProvider(apiKey!),
        ),
      );
    }
  });

  tearDownAll(() {
    client?.close();
  });

  group('generateContent - Integration', () {
    test('generates content with a simple text prompt', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final response = await client!.models.generateContent(
        model: defaultGenerativeModel,
        request: const GenerateContentRequest(
          contents: [
            Content(
              parts: [TextPart('Say "Hello, World!" and nothing else.')],
              role: 'user',
            ),
          ],
        ),
      );

      expect(response, isNotNull);
      expect(response.candidates, isNotEmpty);
      expect(response.candidates?.first.content, isNotNull);
      expect(response.candidates?.first.content?.parts, isNotEmpty);

      final firstPart = response.candidates!.first.content!.parts.first;
      expect(firstPart, isA<TextPart>());
      final textPart = firstPart as TextPart;
      expect(textPart.text.toLowerCase(), contains('hello'));
    });

    test('generates content with generation config', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final response = await client!.models.generateContent(
        model: defaultGenerativeModel,
        request: const GenerateContentRequest(
          contents: [
            Content(
              parts: [TextPart('Count from 1 to 3.')],
              role: 'user',
            ),
          ],
          generationConfig: GenerationConfig(
            temperature: 0.1,
            maxOutputTokens: 50,
            topP: 0.8,
          ),
        ),
      );

      expect(response, isNotNull);
      expect(response.candidates, isNotEmpty);
      expect(response.usageMetadata, isNotNull);
      expect(response.usageMetadata!.totalTokenCount, greaterThan(0));
    });

    test('generates content with multi-turn conversation', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final response = await client!.models.generateContent(
        model: defaultGenerativeModel,
        request: const GenerateContentRequest(
          contents: [
            Content(
              parts: [TextPart('My name is Alice.')],
              role: 'user',
            ),
            Content(
              parts: [TextPart('Hello Alice! Nice to meet you.')],
              role: 'model',
            ),
            Content(
              parts: [TextPart('What is my name?')],
              role: 'user',
            ),
          ],
        ),
      );

      expect(response, isNotNull);
      expect(response.candidates, isNotEmpty);

      final firstPart = response.candidates!.first.content!.parts.first;
      expect(firstPart, isA<TextPart>());
      final textPart = firstPart as TextPart;
      // Should mention Alice
      expect(textPart.text.toLowerCase(), contains('alice'));
    });

    test('handles API errors gracefully', () {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Try with invalid model name
      expect(
        () => client!.models.generateContent(
          model: 'invalid-model-name-xyz',
          request: const GenerateContentRequest(
            contents: [
              Content(
                parts: [TextPart('Hello')],
                role: 'user',
              ),
            ],
          ),
        ),
        throwsA(isA<ApiException>()),
      );
    });

    test('respects safety settings', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final response = await client!.models.generateContent(
        model: defaultGenerativeModel,
        request: const GenerateContentRequest(
          contents: [
            Content(
              parts: [TextPart('Tell me a safe joke.')],
              role: 'user',
            ),
          ],
          safetySettings: [
            SafetySetting(
              category: HarmCategory.harassment,
              threshold: HarmBlockThreshold.blockNone,
            ),
          ],
        ),
      );

      expect(response, isNotNull);
      expect(response.candidates, isNotEmpty);
    });
  });

  group('countTokens - Integration', () {
    test('counts tokens for a simple prompt', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final response = await client!.models.countTokens(
        model: defaultGenerativeModel,
        request: const CountTokensRequest(
          contents: [
            Content(
              parts: [TextPart('Hello, world!')],
              role: 'user',
            ),
          ],
        ),
      );

      expect(response, isNotNull);
      expect(response.totalTokens, greaterThan(0));
    });

    test('counts tokens for multi-turn conversation', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final response = await client!.models.countTokens(
        model: defaultGenerativeModel,
        request: const CountTokensRequest(
          contents: [
            Content(
              parts: [TextPart('What is 2+2?')],
              role: 'user',
            ),
            Content(
              parts: [TextPart('The answer is 4.')],
              role: 'model',
            ),
            Content(
              parts: [TextPart('What about 3+3?')],
              role: 'user',
            ),
          ],
        ),
      );

      expect(response, isNotNull);
      expect(response.totalTokens, greaterThan(5));
    });
  });
}
