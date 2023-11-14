// ignore_for_file: avoid_redundant_argument_values
@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAI Images API tests', () {
    late OpenAIClient client;

    setUp(() {
      client = OpenAIClient(
        apiKey: Platform.environment['OPENAI_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test call create image API', () async {
      const request = CreateImageRequest(
        model: CreateImageRequestModel.model(ImageModels.dallE2),
        prompt: 'A cute baby sea otter',
        quality: ImageQuality.standard,
        size: ImageSize.v1024x1024,
        style: ImageStyle.natural,
      );
      final res = await client.createImage(request: request);
      expect(res.created, greaterThan(0));
      expect(res.data, hasLength(1));
      final image = res.data.first;
      expect(image.b64Json, isNull);
      expect(image.url, startsWith('http'));
      expect(image.revisedPrompt, isNull);
    });

    test('Test call create image API returned in base64', () async {
      const request = CreateImageRequest(
        prompt: 'A cute baby sea otter',
        n: 2,
        responseFormat: ImageResponseFormat.b64Json,
        size: ImageSize.v256x256,
      );
      final res = await client.createImage(request: request);
      expect(res.created, greaterThan(0));
      expect(res.data, hasLength(2));
      final image1 = res.data.first;
      expect(image1.b64Json, isNotEmpty);
      expect(image1.url, isNull);
    });
  });
}
