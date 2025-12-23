import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('VoiceConfig', () {
    group('fromJson', () {
      test('creates VoiceConfig with prebuiltVoiceConfig', () {
        final json = {
          'prebuiltVoiceConfig': {'voiceName': 'Puck'},
        };

        final config = VoiceConfig.fromJson(json);

        expect(config.prebuiltVoiceConfig, isNotNull);
        expect(config.prebuiltVoiceConfig!.voiceName, 'Puck');
      });

      test('creates VoiceConfig with minimal fields', () {
        final json = <String, dynamic>{};
        final config = VoiceConfig.fromJson(json);

        expect(config.prebuiltVoiceConfig, isNull);
      });
    });

    group('toJson', () {
      test('includes prebuiltVoiceConfig when set', () {
        const config = VoiceConfig(
          prebuiltVoiceConfig: PrebuiltVoiceConfig(voiceName: 'Kore'),
        );

        final json = config.toJson();

        expect(json['prebuiltVoiceConfig'], isNotNull);
        final prebuiltConfig =
            json['prebuiltVoiceConfig'] as Map<String, dynamic>;
        expect(prebuiltConfig['voiceName'], 'Kore');
      });

      test('omits null fields', () {
        const config = VoiceConfig();
        final json = config.toJson();

        expect(json, isEmpty);
      });
    });

    group('copyWith', () {
      test('with no params returns instance with same values', () {
        const original = VoiceConfig(
          prebuiltVoiceConfig: PrebuiltVoiceConfig(voiceName: 'Puck'),
        );
        final copied = original.copyWith();

        expect(
          copied.prebuiltVoiceConfig!.voiceName,
          original.prebuiltVoiceConfig!.voiceName,
        );
      });

      test('updates specified fields', () {
        const original = VoiceConfig(
          prebuiltVoiceConfig: PrebuiltVoiceConfig(voiceName: 'Puck'),
        );
        final updated = original.copyWith(
          prebuiltVoiceConfig: const PrebuiltVoiceConfig(voiceName: 'Kore'),
        );

        expect(updated.prebuiltVoiceConfig!.voiceName, 'Kore');
      });
    });

    group('factory constructors', () {
      test('prebuilt creates config with voice name', () {
        final config = VoiceConfig.prebuilt('Fenrir');

        expect(config.prebuiltVoiceConfig, isNotNull);
        expect(config.prebuiltVoiceConfig!.voiceName, 'Fenrir');
      });
    });

    test('round-trip conversion preserves data', () {
      const original = VoiceConfig(
        prebuiltVoiceConfig: PrebuiltVoiceConfig(voiceName: 'Aoede'),
      );

      final json = original.toJson();
      final restored = VoiceConfig.fromJson(json);

      expect(
        restored.prebuiltVoiceConfig!.voiceName,
        original.prebuiltVoiceConfig!.voiceName,
      );
    });

    test('toString includes prebuiltVoiceConfig', () {
      final config = VoiceConfig.prebuilt('Puck');
      final str = config.toString();

      expect(str, contains('VoiceConfig'));
      expect(str, contains('prebuiltVoiceConfig'));
    });
  });

  group('PrebuiltVoiceConfig', () {
    group('fromJson', () {
      test('creates PrebuiltVoiceConfig with voiceName', () {
        final json = {'voiceName': 'Leda'};
        final config = PrebuiltVoiceConfig.fromJson(json);

        expect(config.voiceName, 'Leda');
      });

      test('creates PrebuiltVoiceConfig with null voiceName', () {
        final json = <String, dynamic>{};
        final config = PrebuiltVoiceConfig.fromJson(json);

        expect(config.voiceName, isNull);
      });
    });

    group('toJson', () {
      test('includes voiceName when set', () {
        const config = PrebuiltVoiceConfig(voiceName: 'Orus');
        final json = config.toJson();

        expect(json['voiceName'], 'Orus');
      });

      test('omits null voiceName', () {
        const config = PrebuiltVoiceConfig();
        final json = config.toJson();

        expect(json, isEmpty);
      });
    });

    group('copyWith', () {
      test('with no params returns instance with same values', () {
        const original = PrebuiltVoiceConfig(voiceName: 'Zephyr');
        final copied = original.copyWith();

        expect(copied.voiceName, original.voiceName);
      });

      test('updates voiceName', () {
        const original = PrebuiltVoiceConfig(voiceName: 'Puck');
        final updated = original.copyWith(voiceName: 'Charon');

        expect(updated.voiceName, 'Charon');
      });
    });

    test('round-trip conversion preserves data', () {
      const original = PrebuiltVoiceConfig(voiceName: 'Kore');
      final json = original.toJson();
      final restored = PrebuiltVoiceConfig.fromJson(json);

      expect(restored.voiceName, original.voiceName);
    });

    test('toString includes voiceName', () {
      const config = PrebuiltVoiceConfig(voiceName: 'Fenrir');
      final str = config.toString();

      expect(str, contains('PrebuiltVoiceConfig'));
      expect(str, contains('voiceName'));
      expect(str, contains('Fenrir'));
    });
  });

  group('LiveVoices', () {
    test('contains all expected voices', () {
      expect(LiveVoices.puck, 'Puck');
      expect(LiveVoices.charon, 'Charon');
      expect(LiveVoices.kore, 'Kore');
      expect(LiveVoices.fenrir, 'Fenrir');
      expect(LiveVoices.aoede, 'Aoede');
      expect(LiveVoices.leda, 'Leda');
      expect(LiveVoices.orus, 'Orus');
      expect(LiveVoices.zephyr, 'Zephyr');
    });

    test('can be used with SpeechConfig.withVoice', () {
      final config = SpeechConfig.withVoice(LiveVoices.puck);

      expect(config.voiceConfig!.prebuiltVoiceConfig!.voiceName, 'Puck');
    });
  });
}
