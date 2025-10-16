// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('GenerateAnswerResponse', () {
    group('fromJson', () {
      test('creates GenerateAnswerResponse with answer only', () {
        final json = {
          'answer': {
            'content': {
              'parts': [
                {'text': 'This is the answer.'},
              ],
              'role': 'model',
            },
            'finishReason': 'STOP',
          },
        };

        final response = GenerateAnswerResponse.fromJson(json);

        expect(response.answer, isNotNull);
        expect(response.answer!.content, isNotNull);
        expect(response.answerableProbability, isNull);
        expect(response.inputFeedback, isNull);
      });

      test('creates GenerateAnswerResponse with answerable probability', () {
        final json = {
          'answer': {
            'content': {
              'parts': [
                {'text': 'Answer text'},
              ],
            },
          },
          'answerableProbability': 0.95,
        };

        final response = GenerateAnswerResponse.fromJson(json);

        expect(response.answer, isNotNull);
        expect(response.answerableProbability, 0.95);
      });

      test('creates GenerateAnswerResponse with input feedback', () {
        final json = {
          'answer': {
            'content': {
              'parts': [
                {'text': 'The answer'},
              ],
            },
          },
          'answerableProbability': 0.6,
          'inputFeedback': {
            'safetyRatings': [
              {
                'category': 'HARM_CATEGORY_HARASSMENT',
                'probability': 'NEGLIGIBLE',
                'blocked': false,
              },
            ],
          },
        };

        final response = GenerateAnswerResponse.fromJson(json);

        expect(response.inputFeedback, isNotNull);
        expect(response.inputFeedback!.safetyRatings, hasLength(1));
        expect(
          response.inputFeedback!.safetyRatings![0].category,
          HarmCategory.harassment,
        );
      });

      test('creates GenerateAnswerResponse with blocked input', () {
        final json = {
          'inputFeedback': {
            'blockReason': 'SAFETY',
            'safetyRatings': [
              {
                'category': 'HARM_CATEGORY_HATE_SPEECH',
                'probability': 'HIGH',
                'blocked': true,
              },
            ],
          },
        };

        final response = GenerateAnswerResponse.fromJson(json);

        expect(response.answer, isNull);
        expect(response.inputFeedback, isNotNull);
        expect(response.inputFeedback!.blockReason, BlockReason.safety);
        expect(response.inputFeedback!.safetyRatings, hasLength(1));
      });

      test('handles null optional fields', () {
        final json = {
          'answer': null,
          'answerableProbability': null,
          'inputFeedback': null,
        };

        final response = GenerateAnswerResponse.fromJson(json);

        expect(response.answer, isNull);
        expect(response.answerableProbability, isNull);
        expect(response.inputFeedback, isNull);
      });

      test('creates GenerateAnswerResponse with all fields', () {
        final json = {
          'answer': {
            'content': {
              'parts': [
                {'text': 'Complete answer'},
              ],
              'role': 'model',
            },
            'finishReason': 'STOP',
            'safetyRatings': [
              {
                'category': 'HARM_CATEGORY_DANGEROUS_CONTENT',
                'probability': 'NEGLIGIBLE',
              },
            ],
          },
          'answerableProbability': 0.87,
          'inputFeedback': {
            'safetyRatings': [
              {'category': 'HARM_CATEGORY_HARASSMENT', 'probability': 'LOW'},
            ],
          },
        };

        final response = GenerateAnswerResponse.fromJson(json);

        expect(response.answer, isNotNull);
        expect(response.answerableProbability, 0.87);
        expect(response.inputFeedback, isNotNull);
      });
    });

    group('toJson', () {
      test('converts GenerateAnswerResponse with answer to JSON', () {
        const response = GenerateAnswerResponse(
          answer: Candidate(
            content: Content(parts: [TextPart('Answer text')], role: 'model'),
          ),
        );

        final json = response.toJson();

        expect(json['answer'], isNotNull);
        expect(json['answer']['content']['parts'][0]['text'], 'Answer text');
        expect(json.containsKey('answerableProbability'), false);
        expect(json.containsKey('inputFeedback'), false);
      });

      test('converts GenerateAnswerResponse with probability to JSON', () {
        const response = GenerateAnswerResponse(
          answer: Candidate(content: Content(parts: [TextPart('Text')])),
          answerableProbability: 0.75,
        );

        final json = response.toJson();

        expect(json['answerableProbability'], 0.75);
      });

      test('converts GenerateAnswerResponse with input feedback to JSON', () {
        const response = GenerateAnswerResponse(
          inputFeedback: InputFeedback(blockReason: BlockReason.other),
        );

        final json = response.toJson();

        expect(json['inputFeedback'], isNotNull);
        expect(json['inputFeedback']['blockReason'], 'OTHER');
      });

      test('omits null fields from JSON', () {
        const response = GenerateAnswerResponse();

        final json = response.toJson();

        expect(json.containsKey('answer'), false);
        expect(json.containsKey('answerableProbability'), false);
        expect(json.containsKey('inputFeedback'), false);
      });

      test('converts complete GenerateAnswerResponse to JSON', () {
        const response = GenerateAnswerResponse(
          answer: Candidate(
            content: Content(
              parts: [TextPart('Complete answer text')],
              role: 'model',
            ),
          ),
          answerableProbability: 0.92,
          inputFeedback: InputFeedback(
            safetyRatings: [
              SafetyRating(
                category: HarmCategory.harassment,
                probability: HarmProbability.negligible,
              ),
            ],
          ),
        );

        final json = response.toJson();

        expect(json['answer'], isNotNull);
        expect(json['answerableProbability'], 0.92);
        expect(json['inputFeedback'], isNotNull);
      });
    });

    test('round-trip conversion with answer preserves data', () {
      const original = GenerateAnswerResponse(
        answer: Candidate(
          content: Content(parts: [TextPart('Test answer')], role: 'model'),
        ),
      );

      final json = original.toJson();
      final restored = GenerateAnswerResponse.fromJson(json);

      expect(restored.answer, isNotNull);
      expect(restored.answerableProbability, isNull);
      expect(restored.inputFeedback, isNull);
    });

    test('round-trip conversion with all fields preserves data', () {
      const original = GenerateAnswerResponse(
        answer: Candidate(
          content: Content(
            parts: [TextPart('Comprehensive answer')],
            role: 'model',
          ),
        ),
        answerableProbability: 0.88,
        inputFeedback: InputFeedback(
          safetyRatings: [
            SafetyRating(
              category: HarmCategory.dangerousContent,
              probability: HarmProbability.low,
            ),
          ],
        ),
      );

      final json = original.toJson();
      final restored = GenerateAnswerResponse.fromJson(json);

      expect(restored.answer, isNotNull);
      expect(restored.answerableProbability, 0.88);
      expect(restored.inputFeedback, isNotNull);
      expect(restored.inputFeedback!.safetyRatings, hasLength(1));
    });
  });
}
