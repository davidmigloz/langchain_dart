import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('ImageGenStreamEvent tests', () {
    test('deserializes partial image event', () {
      final json = {
        'type': 'image.generation.partial',
        'index': 0,
        'partial_image': 'base64partialdata...',
      };

      final event = ImageGenStreamEvent.fromJson(json);

      expect(event.type, 'image.generation.partial');
      expect(event.index, 0);
      expect(event.partialImage, 'base64partialdata...');
      expect(event.image, isNull);
    });

    test('deserializes complete image event', () {
      final json = {
        'type': 'image.generation.complete',
        'index': 0,
        'image': {
          'b64_json': 'base64completeimage...',
          'revised_prompt': 'A detailed prompt',
        },
      };

      final event = ImageGenStreamEvent.fromJson(json);

      expect(event.type, 'image.generation.complete');
      expect(event.index, 0);
      expect(event.partialImage, isNull);
      expect(event.image, isNotNull);
      expect(event.image!.b64Json, 'base64completeimage...');
      expect(event.image!.revisedPrompt, 'A detailed prompt');
    });

    test('deserializes event with url image', () {
      final json = {
        'type': 'image.generation.complete',
        'index': 1,
        'image': {'url': 'https://example.com/image.png'},
      };

      final event = ImageGenStreamEvent.fromJson(json);

      expect(event.type, 'image.generation.complete');
      expect(event.index, 1);
      expect(event.image, isNotNull);
      expect(event.image!.url, 'https://example.com/image.png');
    });

    test('deserializes event with only type', () {
      final json = {'type': 'image.generation.started'};

      final event = ImageGenStreamEvent.fromJson(json);

      expect(event.type, 'image.generation.started');
      expect(event.index, isNull);
      expect(event.partialImage, isNull);
      expect(event.image, isNull);
    });

    test('deserializes empty event', () {
      final json = <String, dynamic>{};

      final event = ImageGenStreamEvent.fromJson(json);

      expect(event.type, isNull);
      expect(event.index, isNull);
      expect(event.partialImage, isNull);
      expect(event.image, isNull);
    });

    test('serializes partial image event', () {
      const event = ImageGenStreamEvent(
        type: 'image.generation.partial',
        index: 0,
        partialImage: 'base64data...',
      );

      final json = event.toJson();

      expect(json['type'], 'image.generation.partial');
      expect(json['index'], 0);
      expect(json['partial_image'], 'base64data...');
      expect(json.containsKey('image'), isFalse);
    });

    test('serializes complete image event', () {
      const event = ImageGenStreamEvent(
        type: 'image.generation.complete',
        index: 0,
        image: Image(b64Json: 'base64complete...', revisedPrompt: 'A prompt'),
      );

      final json = event.toJson();

      expect(json['type'], 'image.generation.complete');
      expect(json['index'], 0);
      expect(json.containsKey('partial_image'), isFalse);
      expect(json['image'], isNotNull);
      expect(json['image']['b64_json'], 'base64complete...');
    });

    test('deserializes with multiple partial images index', () {
      final json = {
        'type': 'image.generation.partial',
        'index': 2,
        'partial_image': 'base64data_for_image_3...',
      };

      final event = ImageGenStreamEvent.fromJson(json);

      expect(event.index, 2);
      expect(event.partialImage, 'base64data_for_image_3...');
    });
  });
}
