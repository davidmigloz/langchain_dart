@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAI Moderations API tests', () {
    late OpenAIClient client;

    setUp(() {
      client = OpenAIClient(
        apiKey: Platform.environment['OPENAI_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test call moderations API', () async {
      const request = CreateModerationRequest(
        model: ModerationModel.model(
          ModerationModels.textModerationLatest,
        ),
        input: ModerationInput.string('I want to kill them.'),
      );
      final res = await client.createModeration(request: request);
      expect(res.id, isNotEmpty);
      expect(res.model, startsWith('text-moderation-'));
      expect(res.results, hasLength(1));
      final result = res.results.first;
      expect(result.flagged, isTrue);
      expect(result.categories.violence, isTrue);
      expect(result.categories.sexual, isFalse);
      expect(result.categoryScores.violence, greaterThan(0.8));
      expect(result.categoryScores.sexual, lessThan(0.2));
    });
  });
}
