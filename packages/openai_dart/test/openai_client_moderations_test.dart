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
          ModerationModels.omniModerationLatest,
        ),
        input: ModerationInput.string('I want to kill them.'),
      );
      final res = await client.createModeration(request: request);
      expect(res.id, isNotEmpty);
      expect(res.model, startsWith('omni-moderation-'));
      expect(res.results, hasLength(1));
      final result = res.results.first;
      expect(result.flagged, isTrue);
      expect(result.categories.violence, isTrue);
      expect(result.categories.sexual, isFalse);
      expect(result.categoryScores.violence, greaterThan(0.8));
      expect(result.categoryScores.sexual, lessThan(0.01));
      expect(result.categoryAppliedInputTypes.violence, hasLength(1));
    });

    test('Test multi-modal moderation', () async {
      const request = CreateModerationRequest(
        model: ModerationModel.model(
          ModerationModels.omniModerationLatest,
        ),
        input: ModerationInput.listModerationInputObject(
          [
            ModerationInputObject.imageUrl(
              imageUrl: ModerationInputObjectImageUrlImageUrl(
                url:
                    'https://upload.wikimedia.org/wikipedia/commons/9/92/95apple.jpeg',
              ),
            ),
            ModerationInputObject.text(text: 'I want to kill the apple.'),
          ],
        ),
      );
      final res = await client.createModeration(request: request);
      expect(res.id, isNotEmpty);
      expect(res.model, startsWith('omni-moderation-'));
      expect(res.results, hasLength(1));
      final result = res.results.first;
      expect(result.flagged, isTrue);
      expect(result.categories.violence, isTrue);
      expect(result.categories.sexual, isFalse);
      expect(result.categoryScores.violence, greaterThan(0.3));
      expect(result.categoryScores.sexual, lessThan(0.01));
      expect(result.categoryAppliedInputTypes.violence, hasLength(2));
    });
  });
}
