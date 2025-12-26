import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('ImagesResponse tests', () {
    test('deserializes with all new fields', () {
      final json = {
        'created': 1700000000,
        'data': [
          {'b64_json': 'base64data', 'revised_prompt': 'A cute cat'},
        ],
        'background': 'transparent',
        'output_format': 'png',
        'size': '1024x1024',
        'quality': 'high',
      };

      final response = ImagesResponse.fromJson(json);

      expect(response.created, 1700000000);
      expect(response.data, hasLength(1));
      expect(response.data.first.b64Json, 'base64data');
      expect(response.background, ImagesResponseBackground.transparent);
      expect(response.outputFormat, ImagesResponseOutputFormat.png);
      expect(response.size, ImagesResponseSize.v1024x1024);
      expect(response.quality, ImagesResponseQuality.high);
    });

    test('deserializes without new fields (backward compatibility)', () {
      final json = {
        'created': 1700000000,
        'data': [
          {'url': 'https://example.com/image.png'},
        ],
      };

      final response = ImagesResponse.fromJson(json);

      expect(response.created, 1700000000);
      expect(response.data, hasLength(1));
      expect(response.data.first.url, 'https://example.com/image.png');
      expect(response.background, isNull);
      expect(response.outputFormat, isNull);
      expect(response.size, isNull);
      expect(response.quality, isNull);
    });

    test('deserializes with opaque background', () {
      final json = {
        'created': 1700000000,
        'data': <Map<String, dynamic>>[],
        'background': 'opaque',
      };

      final response = ImagesResponse.fromJson(json);

      expect(response.background, ImagesResponseBackground.opaque);
    });

    test('deserializes with webp output format', () {
      final json = {
        'created': 1700000000,
        'data': <Map<String, dynamic>>[],
        'output_format': 'webp',
      };

      final response = ImagesResponse.fromJson(json);

      expect(response.outputFormat, ImagesResponseOutputFormat.webp);
    });

    test('deserializes with jpeg output format', () {
      final json = {
        'created': 1700000000,
        'data': <Map<String, dynamic>>[],
        'output_format': 'jpeg',
      };

      final response = ImagesResponse.fromJson(json);

      expect(response.outputFormat, ImagesResponseOutputFormat.jpeg);
    });

    test('deserializes with 1024x1536 size', () {
      final json = {
        'created': 1700000000,
        'data': <Map<String, dynamic>>[],
        'size': '1024x1536',
      };

      final response = ImagesResponse.fromJson(json);

      expect(response.size, ImagesResponseSize.v1024x1536);
    });

    test('deserializes with 1536x1024 size', () {
      final json = {
        'created': 1700000000,
        'data': <Map<String, dynamic>>[],
        'size': '1536x1024',
      };

      final response = ImagesResponse.fromJson(json);

      expect(response.size, ImagesResponseSize.v1536x1024);
    });

    test('deserializes with low quality', () {
      final json = {
        'created': 1700000000,
        'data': <Map<String, dynamic>>[],
        'quality': 'low',
      };

      final response = ImagesResponse.fromJson(json);

      expect(response.quality, ImagesResponseQuality.low);
    });

    test('deserializes with medium quality', () {
      final json = {
        'created': 1700000000,
        'data': <Map<String, dynamic>>[],
        'quality': 'medium',
      };

      final response = ImagesResponse.fromJson(json);

      expect(response.quality, ImagesResponseQuality.medium);
    });

    test('serializes with new fields', () {
      const response = ImagesResponse(
        created: 1700000000,
        data: [],
        background: ImagesResponseBackground.transparent,
        outputFormat: ImagesResponseOutputFormat.png,
        size: ImagesResponseSize.v1024x1024,
        quality: ImagesResponseQuality.high,
      );

      final json = response.toJson();

      expect(json['created'], 1700000000);
      expect(json['data'], isEmpty);
      expect(json['background'], 'transparent');
      expect(json['output_format'], 'png');
      expect(json['size'], '1024x1024');
      expect(json['quality'], 'high');
    });

    test('serializes without null fields', () {
      const response = ImagesResponse(created: 1700000000, data: []);

      final json = response.toJson();

      expect(json['created'], 1700000000);
      expect(json.containsKey('background'), isFalse);
      expect(json.containsKey('output_format'), isFalse);
      expect(json.containsKey('size'), isFalse);
      expect(json.containsKey('quality'), isFalse);
    });
  });

  group('ImagesResponse enums tests', () {
    test('ImagesResponseBackground enum values', () {
      expect(ImagesResponseBackground.values, hasLength(2));
      expect(
        ImagesResponseBackground.values,
        containsAll([
          ImagesResponseBackground.transparent,
          ImagesResponseBackground.opaque,
        ]),
      );
    });

    test('ImagesResponseOutputFormat enum values', () {
      expect(ImagesResponseOutputFormat.values, hasLength(3));
      expect(
        ImagesResponseOutputFormat.values,
        containsAll([
          ImagesResponseOutputFormat.png,
          ImagesResponseOutputFormat.webp,
          ImagesResponseOutputFormat.jpeg,
        ]),
      );
    });

    test('ImagesResponseSize enum values', () {
      expect(ImagesResponseSize.values, hasLength(3));
      expect(
        ImagesResponseSize.values,
        containsAll([
          ImagesResponseSize.v1024x1024,
          ImagesResponseSize.v1024x1536,
          ImagesResponseSize.v1536x1024,
        ]),
      );
    });

    test('ImagesResponseQuality enum values', () {
      expect(ImagesResponseQuality.values, hasLength(3));
      expect(
        ImagesResponseQuality.values,
        containsAll([
          ImagesResponseQuality.low,
          ImagesResponseQuality.medium,
          ImagesResponseQuality.high,
        ]),
      );
    });
  });
}
