import 'package:googleai_dart/src/models/generation/image_config.dart';
import 'package:test/test.dart';

void main() {
  group('ImageConfig', () {
    group('fromJson', () {
      test('creates ImageConfig with all fields', () {
        final json = {'aspectRatio': '16:9', 'imageSize': '2K'};

        final config = ImageConfig.fromJson(json);

        expect(config.aspectRatio, '16:9');
        expect(config.imageSize, '2K');
      });

      test('creates ImageConfig with minimal fields', () {
        final json = <String, dynamic>{};

        final config = ImageConfig.fromJson(json);

        expect(config.aspectRatio, isNull);
        expect(config.imageSize, isNull);
      });
    });

    group('toJson', () {
      test('converts ImageConfig with all fields to JSON', () {
        const config = ImageConfig(aspectRatio: '4:3', imageSize: '4K');

        final json = config.toJson();

        expect(json['aspectRatio'], '4:3');
        expect(json['imageSize'], '4K');
      });

      test('omits null fields from JSON', () {
        const config = ImageConfig(aspectRatio: '1:1');

        final json = config.toJson();

        expect(json['aspectRatio'], '1:1');
        expect(json.containsKey('imageSize'), false);
      });
    });

    test('round-trip conversion preserves data', () {
      const original = ImageConfig(aspectRatio: '9:16', imageSize: '1K');

      final json = original.toJson();
      final restored = ImageConfig.fromJson(json);

      expect(restored.aspectRatio, original.aspectRatio);
      expect(restored.imageSize, original.imageSize);
    });

    group('copyWith', () {
      test('creates copy with replaced values', () {
        const original = ImageConfig(aspectRatio: '1:1', imageSize: '1K');

        final copy = original.copyWith(aspectRatio: '16:9');

        expect(copy.aspectRatio, '16:9');
        expect(copy.imageSize, '1K');
      });

      test('can set values to null', () {
        const original = ImageConfig(aspectRatio: '1:1', imageSize: '2K');

        final copy = original.copyWith(imageSize: null);

        expect(copy.aspectRatio, '1:1');
        expect(copy.imageSize, isNull);
      });
    });

    test('toString includes all fields', () {
      const config = ImageConfig(aspectRatio: '16:9', imageSize: '4K');

      final str = config.toString();

      expect(str, contains('ImageConfig('));
      expect(str, contains('aspectRatio: 16:9'));
      expect(str, contains('imageSize: 4K'));
    });
  });
}
