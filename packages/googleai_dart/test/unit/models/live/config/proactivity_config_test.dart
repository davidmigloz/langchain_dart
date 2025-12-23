import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('ProactivityConfig', () {
    group('fromJson', () {
      test('creates ProactivityConfig with proactiveAudio true', () {
        final json = {'proactiveAudio': true};
        final config = ProactivityConfig.fromJson(json);

        expect(config.proactiveAudio, true);
      });

      test('creates ProactivityConfig with proactiveAudio false', () {
        final json = {'proactiveAudio': false};
        final config = ProactivityConfig.fromJson(json);

        expect(config.proactiveAudio, false);
      });

      test('creates ProactivityConfig with minimal fields', () {
        final json = <String, dynamic>{};
        final config = ProactivityConfig.fromJson(json);

        expect(config.proactiveAudio, isNull);
      });
    });

    group('toJson', () {
      test('includes proactiveAudio when true', () {
        const config = ProactivityConfig(proactiveAudio: true);
        final json = config.toJson();

        expect(json['proactiveAudio'], true);
      });

      test('includes proactiveAudio when false', () {
        const config = ProactivityConfig(proactiveAudio: false);
        final json = config.toJson();

        expect(json['proactiveAudio'], false);
      });

      test('omits null fields', () {
        const config = ProactivityConfig();
        final json = config.toJson();

        expect(json, isEmpty);
      });
    });

    group('copyWith', () {
      test('with no params returns instance with same values', () {
        const original = ProactivityConfig(proactiveAudio: true);
        final copied = original.copyWith();

        expect(copied.proactiveAudio, original.proactiveAudio);
      });

      test('updates proactiveAudio', () {
        const original = ProactivityConfig(proactiveAudio: true);
        final updated = original.copyWith(proactiveAudio: false);

        expect(updated.proactiveAudio, false);
      });
    });

    group('factory constructors', () {
      test('enabled creates config with proactiveAudio true', () {
        final config = ProactivityConfig.enabled();

        expect(config.proactiveAudio, true);
      });

      test('disabled creates config with proactiveAudio false', () {
        final config = ProactivityConfig.disabled();

        expect(config.proactiveAudio, false);
      });
    });

    test('round-trip conversion preserves data', () {
      const original = ProactivityConfig(proactiveAudio: true);
      final json = original.toJson();
      final restored = ProactivityConfig.fromJson(json);

      expect(restored.proactiveAudio, original.proactiveAudio);
    });

    test('toString includes proactiveAudio', () {
      const config = ProactivityConfig(proactiveAudio: true);
      final str = config.toString();

      expect(str, contains('ProactivityConfig'));
      expect(str, contains('proactiveAudio'));
      expect(str, contains('true'));
    });
  });
}
