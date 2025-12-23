import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('SessionResumptionConfig', () {
    group('fromJson', () {
      test('creates SessionResumptionConfig with handle', () {
        final json = {'handle': 'resume-token-123'};

        final config = SessionResumptionConfig.fromJson(json);

        expect(config.handle, 'resume-token-123');
      });

      test('creates SessionResumptionConfig with all fields', () {
        final json = {'handle': 'resume-token-123', 'transparent': true};

        final config = SessionResumptionConfig.fromJson(json);

        expect(config.handle, 'resume-token-123');
        expect(config.transparent, true);
      });

      test('creates SessionResumptionConfig with minimal fields', () {
        final json = <String, dynamic>{};
        final config = SessionResumptionConfig.fromJson(json);

        expect(config.handle, isNull);
        expect(config.transparent, isNull);
      });
    });

    group('toJson', () {
      test('includes handle when specified', () {
        const config = SessionResumptionConfig(handle: 'token-789');

        final json = config.toJson();

        expect(json['handle'], 'token-789');
      });

      test('includes transparent when specified', () {
        const config = SessionResumptionConfig(
          handle: 'token-789',
          transparent: true,
        );

        final json = config.toJson();

        expect(json['handle'], 'token-789');
        expect(json['transparent'], true);
      });

      test('omits null fields', () {
        const config = SessionResumptionConfig();
        final json = config.toJson();

        expect(json, isEmpty);
      });
    });

    group('copyWith', () {
      test('with no params returns instance with same values', () {
        const original = SessionResumptionConfig(
          handle: 'token-123',
          transparent: true,
        );
        final copied = original.copyWith();

        expect(copied.handle, original.handle);
        expect(copied.transparent, original.transparent);
      });

      test('updates specified fields only', () {
        const original = SessionResumptionConfig(handle: 'token-123');
        final updated = original.copyWith(handle: 'new-token');

        expect(updated.handle, 'new-token');
      });

      test('updates transparent field', () {
        const original = SessionResumptionConfig(handle: 'token-123');
        final updated = original.copyWith(transparent: true);

        expect(updated.handle, 'token-123');
        expect(updated.transparent, true);
      });
    });

    group('factory constructors', () {
      test('resume creates config with handle', () {
        final config = SessionResumptionConfig.resume('resume-token');

        expect(config.handle, 'resume-token');
      });

      test('resume creates config with handle and transparent', () {
        final config = SessionResumptionConfig.resume(
          'resume-token',
          transparent: true,
        );

        expect(config.handle, 'resume-token');
        expect(config.transparent, true);
      });

      test('enabled creates config to enable resumption', () {
        const config = SessionResumptionConfig.enabled();

        expect(config.handle, isNull);
        expect(config.transparent, isNull);
      });

      test('enabled creates config with transparent', () {
        const config = SessionResumptionConfig.enabled(transparent: true);

        expect(config.handle, isNull);
        expect(config.transparent, true);
      });
    });

    test('round-trip conversion preserves data', () {
      const original = SessionResumptionConfig(
        handle: 'test-token',
        transparent: true,
      );

      final json = original.toJson();
      final restored = SessionResumptionConfig.fromJson(json);

      expect(restored.handle, original.handle);
      expect(restored.transparent, original.transparent);
    });

    test('toString masks handle for security', () {
      const config = SessionResumptionConfig(handle: 'secret-token-12345');
      final str = config.toString();

      expect(str, contains('SessionResumptionConfig'));
      // Handle should be masked
      expect(str, contains('...'));
      expect(str, isNot(contains('secret-token-12345')));
    });

    test('toString shows null handle correctly', () {
      const config = SessionResumptionConfig();
      final str = config.toString();

      expect(str, contains('null'));
    });
  });
}
