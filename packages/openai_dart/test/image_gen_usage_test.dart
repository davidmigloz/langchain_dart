import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('ImageGenUsage tests', () {
    test('deserializes with all fields', () {
      final json = {
        'total_tokens': 1000,
        'input_tokens': 750,
        'output_tokens': 250,
        'input_tokens_details': {'text_tokens': 500, 'image_tokens': 250},
      };

      final usage = ImageGenUsage.fromJson(json);

      expect(usage.totalTokens, 1000);
      expect(usage.inputTokens, 750);
      expect(usage.outputTokens, 250);
      expect(usage.inputTokensDetails.textTokens, 500);
      expect(usage.inputTokensDetails.imageTokens, 250);
    });

    test('deserializes with empty input_tokens_details', () {
      final json = {
        'total_tokens': 500,
        'input_tokens': 400,
        'output_tokens': 100,
        'input_tokens_details': <String, dynamic>{},
      };

      final usage = ImageGenUsage.fromJson(json);

      expect(usage.totalTokens, 500);
      expect(usage.inputTokens, 400);
      expect(usage.outputTokens, 100);
      expect(usage.inputTokensDetails.textTokens, isNull);
      expect(usage.inputTokensDetails.imageTokens, isNull);
    });

    test('deserializes with only text_tokens in details', () {
      final json = {
        'total_tokens': 300,
        'input_tokens': 200,
        'output_tokens': 100,
        'input_tokens_details': {'text_tokens': 200},
      };

      final usage = ImageGenUsage.fromJson(json);

      expect(usage.inputTokensDetails.textTokens, 200);
      expect(usage.inputTokensDetails.imageTokens, isNull);
    });

    test('deserializes with only image_tokens in details', () {
      final json = {
        'total_tokens': 400,
        'input_tokens': 300,
        'output_tokens': 100,
        'input_tokens_details': {'image_tokens': 300},
      };

      final usage = ImageGenUsage.fromJson(json);

      expect(usage.inputTokensDetails.textTokens, isNull);
      expect(usage.inputTokensDetails.imageTokens, 300);
    });

    test('serializes correctly', () {
      const usage = ImageGenUsage(
        totalTokens: 1500,
        inputTokens: 1000,
        outputTokens: 500,
        inputTokensDetails: ImageGenUsageInputTokensDetails(
          textTokens: 700,
          imageTokens: 300,
        ),
      );

      final json = usage.toJson();

      expect(json['total_tokens'], 1500);
      expect(json['input_tokens'], 1000);
      expect(json['output_tokens'], 500);
      final inputDetails = json['input_tokens_details'] as Map<String, dynamic>;
      expect(inputDetails['text_tokens'], 700);
      expect(inputDetails['image_tokens'], 300);
    });
  });

  group('ImageGenUsageInputTokensDetails tests', () {
    test('deserializes with all fields', () {
      final json = {'text_tokens': 100, 'image_tokens': 200};

      final details = ImageGenUsageInputTokensDetails.fromJson(json);

      expect(details.textTokens, 100);
      expect(details.imageTokens, 200);
    });

    test('deserializes with empty JSON', () {
      final json = <String, dynamic>{};

      final details = ImageGenUsageInputTokensDetails.fromJson(json);

      expect(details.textTokens, isNull);
      expect(details.imageTokens, isNull);
    });

    test('serializes with null fields excluded', () {
      const details = ImageGenUsageInputTokensDetails(textTokens: 50);

      final json = details.toJson();

      expect(json['text_tokens'], 50);
      expect(json.containsKey('image_tokens'), isFalse);
    });
  });

  group('ImagesResponse with usage tests', () {
    test('deserializes with usage field', () {
      final json = {
        'created': 1700000000,
        'data': [
          {'b64_json': 'base64data'},
        ],
        'usage': {
          'total_tokens': 800,
          'input_tokens': 600,
          'output_tokens': 200,
          'input_tokens_details': {'text_tokens': 400, 'image_tokens': 200},
        },
      };

      final response = ImagesResponse.fromJson(json);

      expect(response.created, 1700000000);
      expect(response.data, hasLength(1));
      expect(response.usage, isNotNull);
      expect(response.usage!.totalTokens, 800);
      expect(response.usage!.inputTokens, 600);
      expect(response.usage!.outputTokens, 200);
      expect(response.usage!.inputTokensDetails.textTokens, 400);
      expect(response.usage!.inputTokensDetails.imageTokens, 200);
    });

    test('deserializes without usage field (backward compatibility)', () {
      final json = {'created': 1700000000, 'data': <Map<String, dynamic>>[]};

      final response = ImagesResponse.fromJson(json);

      expect(response.created, 1700000000);
      expect(response.usage, isNull);
    });

    test('serializes with usage field', () {
      const response = ImagesResponse(
        created: 1700000000,
        data: [],
        usage: ImageGenUsage(
          totalTokens: 500,
          inputTokens: 400,
          outputTokens: 100,
          inputTokensDetails: ImageGenUsageInputTokensDetails(
            textTokens: 300,
            imageTokens: 100,
          ),
        ),
      );

      final json = response.toJson();

      expect(json['usage'], isNotNull);
      final usage = json['usage'] as Map<String, dynamic>;
      expect(usage['total_tokens'], 500);
      expect(usage['input_tokens'], 400);
      expect(usage['output_tokens'], 100);
    });
  });
}
