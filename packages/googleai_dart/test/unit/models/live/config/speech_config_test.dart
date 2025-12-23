import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('SpeechConfig', () {
    group('fromJson', () {
      test('creates SpeechConfig with all fields', () {
        final json = {
          'voiceConfig': {
            'prebuiltVoiceConfig': {'voiceName': 'Puck'},
          },
          'languageCode': 'en-US',
        };

        final config = SpeechConfig.fromJson(json);

        expect(config.voiceConfig, isNotNull);
        expect(config.languageCode, 'en-US');
      });

      test('creates SpeechConfig with minimal fields', () {
        final json = <String, dynamic>{};
        final config = SpeechConfig.fromJson(json);

        expect(config.voiceConfig, isNull);
        expect(config.languageCode, isNull);
      });

      test('creates SpeechConfig with only voiceConfig', () {
        final json = {
          'voiceConfig': {
            'prebuiltVoiceConfig': {'voiceName': 'Kore'},
          },
        };
        final config = SpeechConfig.fromJson(json);

        expect(config.voiceConfig, isNotNull);
        expect(config.languageCode, isNull);
      });

      test('creates SpeechConfig with only languageCode', () {
        final json = {'languageCode': 'es-ES'};
        final config = SpeechConfig.fromJson(json);

        expect(config.voiceConfig, isNull);
        expect(config.languageCode, 'es-ES');
      });
    });

    group('toJson', () {
      test('includes all non-null fields', () {
        final config = SpeechConfig(
          voiceConfig: VoiceConfig.prebuilt('Puck'),
          languageCode: 'en-US',
        );

        final json = config.toJson();

        expect(json['voiceConfig'], isNotNull);
        expect(json['languageCode'], 'en-US');
      });

      test('omits null fields', () {
        const config = SpeechConfig();
        final json = config.toJson();

        expect(json, isEmpty);
      });

      test('includes only voiceConfig when specified', () {
        final config = SpeechConfig(voiceConfig: VoiceConfig.prebuilt('Kore'));
        final json = config.toJson();

        expect(json.containsKey('voiceConfig'), true);
        expect(json.containsKey('languageCode'), false);
      });
    });

    group('copyWith', () {
      test('with no params returns instance with same values', () {
        final original = SpeechConfig(
          voiceConfig: VoiceConfig.prebuilt('Puck'),
          languageCode: 'en-US',
        );
        final copied = original.copyWith();

        expect(copied.languageCode, original.languageCode);
      });

      test('updates specified fields only', () {
        final original = SpeechConfig(
          voiceConfig: VoiceConfig.prebuilt('Puck'),
          languageCode: 'en-US',
        );
        final updated = original.copyWith(languageCode: 'es-ES');

        expect(updated.languageCode, 'es-ES');
      });
    });

    group('factory constructors', () {
      test('withVoice creates config with voice', () {
        final config = SpeechConfig.withVoice('Puck');

        expect(config.voiceConfig, isNotNull);
        expect(config.voiceConfig!.prebuiltVoiceConfig!.voiceName, 'Puck');
        expect(config.languageCode, isNull);
      });

      test('withVoice with languageCode', () {
        final config = SpeechConfig.withVoice('Kore', languageCode: 'ja-JP');

        expect(config.voiceConfig, isNotNull);
        expect(config.languageCode, 'ja-JP');
      });
    });

    test('round-trip conversion preserves data', () {
      final original = SpeechConfig(
        voiceConfig: VoiceConfig.prebuilt('Puck'),
        languageCode: 'en-US',
      );

      final json = original.toJson();
      final restored = SpeechConfig.fromJson(json);

      expect(restored.languageCode, original.languageCode);
      expect(
        restored.voiceConfig!.prebuiltVoiceConfig!.voiceName,
        original.voiceConfig!.prebuiltVoiceConfig!.voiceName,
      );
    });

    test('toString includes all fields', () {
      final config = SpeechConfig(
        voiceConfig: VoiceConfig.prebuilt('Puck'),
        languageCode: 'en-US',
      );
      final str = config.toString();

      expect(str, contains('SpeechConfig'));
      expect(str, contains('voiceConfig'));
      expect(str, contains('languageCode'));
    });
  });
}
