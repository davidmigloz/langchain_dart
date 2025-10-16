// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('GenerateAnswerRequest', () {
    group('fromJson', () {
      test('creates GenerateAnswerRequest with required fields only', () {
        final json = {
          'contents': [
            {
              'parts': [
                {'text': 'What is quantum computing?'},
              ],
              'role': 'user',
            },
          ],
          'answerStyle': 'ABSTRACTIVE',
        };

        final request = GenerateAnswerRequest.fromJson(json);

        expect(request.contents, hasLength(1));
        expect(request.answerStyle, AnswerStyle.abstractive);
        expect(request.inlinePassages, isNull);
        expect(request.semanticRetriever, isNull);
        expect(request.safetySettings, isNull);
        expect(request.temperature, isNull);
      });

      test('creates GenerateAnswerRequest with inline passages', () {
        final json = {
          'contents': [
            {
              'parts': [
                {'text': 'What is the capital?'},
              ],
            },
          ],
          'answerStyle': 'EXTRACTIVE',
          'inlinePassages': {
            'passages': [
              {
                'id': 'passage-1',
                'content': {
                  'parts': [
                    {'text': 'Paris is the capital of France.'},
                  ],
                },
              },
            ],
          },
        };

        final request = GenerateAnswerRequest.fromJson(json);

        expect(request.answerStyle, AnswerStyle.extractive);
        expect(request.inlinePassages, isNotNull);
        expect(request.inlinePassages!.passages, hasLength(1));
        expect(request.inlinePassages!.passages![0].id, 'passage-1');
      });

      test('creates GenerateAnswerRequest with semantic retriever', () {
        final json = {
          'contents': [
            {
              'parts': [
                {'text': 'Tell me about AI'},
              ],
            },
          ],
          'answerStyle': 'VERBOSE',
          'semanticRetriever': {
            'source': 'corpora/my-corpus',
            'query': {
              'parts': [
                {'text': 'artificial intelligence'},
              ],
            },
            'maxChunksCount': 5,
            'minimumRelevanceScore': 0.7,
          },
        };

        final request = GenerateAnswerRequest.fromJson(json);

        expect(request.answerStyle, AnswerStyle.verbose);
        expect(request.semanticRetriever, isNotNull);
        expect(request.semanticRetriever!.source, 'corpora/my-corpus');
        expect(request.semanticRetriever!.maxChunksCount, 5);
        expect(request.semanticRetriever!.minimumRelevanceScore, 0.7);
      });

      test('creates GenerateAnswerRequest with safety settings', () {
        final json = {
          'contents': [
            {
              'parts': [
                {'text': 'Question'},
              ],
            },
          ],
          'answerStyle': 'ABSTRACTIVE',
          'safetySettings': [
            {
              'category': 'HARM_CATEGORY_HARASSMENT',
              'threshold': 'BLOCK_MEDIUM_AND_ABOVE',
            },
          ],
          'temperature': 0.2,
        };

        final request = GenerateAnswerRequest.fromJson(json);

        expect(request.safetySettings, hasLength(1));
        expect(request.safetySettings![0].category, HarmCategory.harassment);
        expect(
          request.safetySettings![0].threshold,
          HarmBlockThreshold.blockMediumAndAbove,
        );
        expect(request.temperature, 0.2);
      });
    });

    group('toJson', () {
      test('converts GenerateAnswerRequest with required fields to JSON', () {
        const request = GenerateAnswerRequest(
          contents: [
            Content(
              parts: [TextPart('What is the meaning of life?')],
              role: 'user',
            ),
          ],
          answerStyle: AnswerStyle.abstractive,
        );

        final json = request.toJson();

        expect(json['contents'], hasLength(1));
        expect(json['answerStyle'], 'ABSTRACTIVE');
        expect(json.containsKey('inlinePassages'), false);
        expect(json.containsKey('semanticRetriever'), false);
        expect(json.containsKey('safetySettings'), false);
        expect(json.containsKey('temperature'), false);
      });

      test('converts GenerateAnswerRequest with inline passages to JSON', () {
        const request = GenerateAnswerRequest(
          contents: [
            Content(parts: [TextPart('Who founded Google?')]),
          ],
          answerStyle: AnswerStyle.extractive,
          inlinePassages: GroundingPassages(
            passages: [
              GroundingPassage(
                id: 'p1',
                content: Content(
                  parts: [
                    TextPart(
                      'Google was founded by Larry Page and Sergey Brin.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

        final json = request.toJson();

        expect(json['answerStyle'], 'EXTRACTIVE');
        expect(json['inlinePassages'], isNotNull);
        expect(json['inlinePassages']['passages'], hasLength(1));
        expect(json['inlinePassages']['passages'][0]['id'], 'p1');
      });

      test('converts GenerateAnswerRequest with temperature to JSON', () {
        const request = GenerateAnswerRequest(
          contents: [
            Content(parts: [TextPart('Test question')]),
          ],
          answerStyle: AnswerStyle.verbose,
          temperature: 0.5,
        );

        final json = request.toJson();

        expect(json['temperature'], 0.5);
      });

      test('omits null fields from JSON', () {
        const request = GenerateAnswerRequest(
          contents: [
            Content(parts: [TextPart('Question')]),
          ],
          answerStyle: AnswerStyle.abstractive,
        );

        final json = request.toJson();

        expect(json.containsKey('inlinePassages'), false);
        expect(json.containsKey('semanticRetriever'), false);
        expect(json.containsKey('safetySettings'), false);
        expect(json.containsKey('temperature'), false);
      });
    });

    test('round-trip conversion with required fields preserves data', () {
      const original = GenerateAnswerRequest(
        contents: [
          Content(parts: [TextPart('Test')], role: 'user'),
        ],
        answerStyle: AnswerStyle.extractive,
      );

      final json = original.toJson();
      final restored = GenerateAnswerRequest.fromJson(json);

      expect(restored.contents, hasLength(1));
      expect(restored.answerStyle, original.answerStyle);
      expect(restored.inlinePassages, isNull);
    });

    test('round-trip conversion with all fields preserves data', () {
      const original = GenerateAnswerRequest(
        contents: [
          Content(parts: [TextPart('Comprehensive question')], role: 'user'),
        ],
        answerStyle: AnswerStyle.verbose,
        inlinePassages: GroundingPassages(
          passages: [
            GroundingPassage(
              id: 'passage-1',
              content: Content(parts: [TextPart('Some passage text')]),
            ),
          ],
        ),
        safetySettings: [
          SafetySetting(
            category: HarmCategory.hateSpeech,
            threshold: HarmBlockThreshold.blockMediumAndAbove,
          ),
        ],
        temperature: 0.3,
      );

      final json = original.toJson();
      final restored = GenerateAnswerRequest.fromJson(json);

      expect(restored.answerStyle, original.answerStyle);
      expect(restored.inlinePassages, isNotNull);
      expect(restored.safetySettings, hasLength(1));
      expect(restored.temperature, 0.3);
    });
  });
}
