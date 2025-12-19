import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('PromptTokensDetails tests', () {
    test('deserializes with all fields', () {
      final json = {'cached_tokens': 100, 'audio_tokens': 50};

      final details = PromptTokensDetails.fromJson(json);

      expect(details.cachedTokens, 100);
      expect(details.audioTokens, 50);
    });

    test('deserializes with only cached_tokens', () {
      final json = {'cached_tokens': 200};

      final details = PromptTokensDetails.fromJson(json);

      expect(details.cachedTokens, 200);
      expect(details.audioTokens, isNull);
    });

    test('deserializes with only audio_tokens', () {
      final json = {'audio_tokens': 75};

      final details = PromptTokensDetails.fromJson(json);

      expect(details.cachedTokens, isNull);
      expect(details.audioTokens, 75);
    });

    test('deserializes with empty JSON', () {
      final json = <String, dynamic>{};

      final details = PromptTokensDetails.fromJson(json);

      expect(details.cachedTokens, isNull);
      expect(details.audioTokens, isNull);
    });

    test('serializes correctly', () {
      const details = PromptTokensDetails(cachedTokens: 150, audioTokens: 25);

      final json = details.toJson();

      expect(json['cached_tokens'], 150);
      expect(json['audio_tokens'], 25);
    });

    test('serializes with null fields excluded', () {
      const details = PromptTokensDetails(cachedTokens: 100);

      final json = details.toJson();

      expect(json['cached_tokens'], 100);
      expect(json.containsKey('audio_tokens'), isFalse);
    });
  });

  group('CompletionUsage with prompt_tokens_details tests', () {
    test('deserializes with prompt_tokens_details', () {
      final json = {
        'completion_tokens': 50,
        'prompt_tokens': 100,
        'total_tokens': 150,
        'prompt_tokens_details': {'cached_tokens': 80, 'audio_tokens': 20},
      };

      final usage = CompletionUsage.fromJson(json);

      expect(usage.completionTokens, 50);
      expect(usage.promptTokens, 100);
      expect(usage.totalTokens, 150);
      expect(usage.promptTokensDetails, isNotNull);
      expect(usage.promptTokensDetails!.cachedTokens, 80);
      expect(usage.promptTokensDetails!.audioTokens, 20);
    });

    test('deserializes without prompt_tokens_details', () {
      final json = {
        'completion_tokens': 50,
        'prompt_tokens': 100,
        'total_tokens': 150,
      };

      final usage = CompletionUsage.fromJson(json);

      expect(usage.completionTokens, 50);
      expect(usage.promptTokens, 100);
      expect(usage.totalTokens, 150);
      expect(usage.promptTokensDetails, isNull);
    });

    test('deserializes with null prompt_tokens_details', () {
      final json = {
        'completion_tokens': 50,
        'prompt_tokens': 100,
        'total_tokens': 150,
        'prompt_tokens_details': null,
      };

      final usage = CompletionUsage.fromJson(json);

      expect(usage.promptTokensDetails, isNull);
    });

    test('deserializes with both token details', () {
      final json = {
        'completion_tokens': 50,
        'prompt_tokens': 100,
        'total_tokens': 150,
        'completion_tokens_details': {
          'reasoning_tokens': 10,
          'accepted_prediction_tokens': 5,
          'rejected_prediction_tokens': 2,
        },
        'prompt_tokens_details': {'cached_tokens': 80, 'audio_tokens': 20},
      };

      final usage = CompletionUsage.fromJson(json);

      expect(usage.completionTokensDetails, isNotNull);
      expect(usage.completionTokensDetails!.reasoningTokens, 10);
      expect(usage.promptTokensDetails, isNotNull);
      expect(usage.promptTokensDetails!.cachedTokens, 80);
    });

    test('serializes with prompt_tokens_details', () {
      const usage = CompletionUsage(
        completionTokens: 50,
        promptTokens: 100,
        totalTokens: 150,
        promptTokensDetails: PromptTokensDetails(
          cachedTokens: 80,
          audioTokens: 20,
        ),
      );

      final json = usage.toJson();

      expect(json['completion_tokens'], 50);
      expect(json['prompt_tokens'], 100);
      expect(json['total_tokens'], 150);
      expect(json['prompt_tokens_details'], isNotNull);
      final promptDetails =
          json['prompt_tokens_details'] as Map<String, dynamic>;
      expect(promptDetails['cached_tokens'], 80);
      expect(promptDetails['audio_tokens'], 20);
    });
  });
}
