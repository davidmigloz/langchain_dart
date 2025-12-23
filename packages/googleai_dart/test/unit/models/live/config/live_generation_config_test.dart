import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('LiveGenerationConfig', () {
    group('fromJson', () {
      test('creates LiveGenerationConfig with all fields', () {
        final json = {
          'responseModalities': ['AUDIO', 'TEXT'],
          'speechConfig': {
            'voiceConfig': {
              'prebuiltVoiceConfig': {'voiceName': 'Puck'},
            },
            'languageCode': 'en-US',
          },
          'temperature': 0.7,
          'maxOutputTokens': 1024,
          'topP': 0.9,
          'topK': 40,
        };

        final config = LiveGenerationConfig.fromJson(json);

        expect(config.responseModalities, equals(['AUDIO', 'TEXT']));
        expect(config.speechConfig, isNotNull);
        expect(config.temperature, 0.7);
        expect(config.maxOutputTokens, 1024);
        expect(config.topP, 0.9);
        expect(config.topK, 40);
      });

      test('creates LiveGenerationConfig with minimal fields', () {
        final json = <String, dynamic>{};
        final config = LiveGenerationConfig.fromJson(json);

        expect(config.responseModalities, isNull);
        expect(config.speechConfig, isNull);
        expect(config.temperature, isNull);
        expect(config.maxOutputTokens, isNull);
        expect(config.topP, isNull);
        expect(config.topK, isNull);
      });

      test('creates LiveGenerationConfig with only responseModalities', () {
        final json = {
          'responseModalities': ['AUDIO'],
        };
        final config = LiveGenerationConfig.fromJson(json);

        expect(config.responseModalities, equals(['AUDIO']));
        expect(config.speechConfig, isNull);
        expect(config.temperature, isNull);
      });

      test('handles numeric temperature as int', () {
        final json = {'temperature': 1};
        final config = LiveGenerationConfig.fromJson(json);

        expect(config.temperature, 1.0);
      });
    });

    group('toJson', () {
      test('includes all non-null fields', () {
        final config = LiveGenerationConfig(
          responseModalities: const ['AUDIO', 'TEXT'],
          speechConfig: SpeechConfig.withVoice('Puck'),
          temperature: 0.7,
          maxOutputTokens: 1024,
          topP: 0.9,
          topK: 40,
        );

        final json = config.toJson();

        expect(json['responseModalities'], equals(['AUDIO', 'TEXT']));
        expect(json['speechConfig'], isNotNull);
        expect(json['temperature'], 0.7);
        expect(json['maxOutputTokens'], 1024);
        expect(json['topP'], 0.9);
        expect(json['topK'], 40);
      });

      test('omits null fields', () {
        const config = LiveGenerationConfig();
        final json = config.toJson();

        expect(json, isEmpty);
      });

      test('includes only specified fields', () {
        const config = LiveGenerationConfig(
          responseModalities: ['TEXT'],
          temperature: 0.5,
        );
        final json = config.toJson();

        expect(json.containsKey('responseModalities'), true);
        expect(json.containsKey('temperature'), true);
        expect(json.containsKey('speechConfig'), false);
        expect(json.containsKey('maxOutputTokens'), false);
      });
    });

    group('copyWith', () {
      test('with no params returns instance with same values', () {
        const original = LiveGenerationConfig(
          responseModalities: ['AUDIO'],
          temperature: 0.7,
        );
        final copied = original.copyWith();

        expect(copied.responseModalities, original.responseModalities);
        expect(copied.temperature, original.temperature);
      });

      test('updates specified fields only', () {
        const original = LiveGenerationConfig(
          responseModalities: ['AUDIO'],
          temperature: 0.7,
        );
        final updated = original.copyWith(temperature: 0.9);

        expect(updated.responseModalities, original.responseModalities);
        expect(updated.temperature, 0.9);
      });

      test('can update multiple fields', () {
        const original = LiveGenerationConfig(
          responseModalities: ['AUDIO'],
          temperature: 0.7,
        );
        final updated = original.copyWith(
          responseModalities: ['TEXT'],
          temperature: 0.5,
          maxOutputTokens: 512,
        );

        expect(updated.responseModalities, equals(['TEXT']));
        expect(updated.temperature, 0.5);
        expect(updated.maxOutputTokens, 512);
      });
    });

    group('factory constructors', () {
      test('audioOnly creates audio-only config', () {
        final config = LiveGenerationConfig.audioOnly(
          temperature: 0.8,
          maxOutputTokens: 1024,
        );

        expect(config.responseModalities, equals(['AUDIO']));
        expect(config.temperature, 0.8);
        expect(config.maxOutputTokens, 1024);
      });

      test('audioOnly with speechConfig', () {
        final config = LiveGenerationConfig.audioOnly(
          speechConfig: SpeechConfig.withVoice('Puck'),
        );

        expect(config.responseModalities, equals(['AUDIO']));
        expect(config.speechConfig, isNotNull);
      });

      test('textOnly creates text-only config', () {
        final config = LiveGenerationConfig.textOnly(
          temperature: 0.5,
          maxOutputTokens: 2048,
        );

        expect(config.responseModalities, equals(['TEXT']));
        expect(config.temperature, 0.5);
        expect(config.maxOutputTokens, 2048);
      });

      test('textAndAudio creates combined config', () {
        final config = LiveGenerationConfig.textAndAudio(
          speechConfig: SpeechConfig.withVoice('Kore'),
          temperature: 0.7,
        );

        expect(config.responseModalities, equals(['AUDIO', 'TEXT']));
        expect(config.speechConfig, isNotNull);
        expect(config.temperature, 0.7);
      });

      test('textAndAudio without speechConfig', () {
        final config = LiveGenerationConfig.textAndAudio();

        expect(config.responseModalities, equals(['AUDIO', 'TEXT']));
        expect(config.speechConfig, isNull);
      });
    });

    test('round-trip conversion preserves data', () {
      final original = LiveGenerationConfig(
        responseModalities: const ['AUDIO', 'TEXT'],
        speechConfig: SpeechConfig.withVoice('Puck'),
        temperature: 0.7,
        maxOutputTokens: 1024,
        topP: 0.9,
        topK: 40,
      );

      final json = original.toJson();
      final restored = LiveGenerationConfig.fromJson(json);

      expect(restored.responseModalities, original.responseModalities);
      expect(restored.temperature, original.temperature);
      expect(restored.maxOutputTokens, original.maxOutputTokens);
      expect(restored.topP, original.topP);
      expect(restored.topK, original.topK);
    });

    test('toString includes key fields', () {
      const config = LiveGenerationConfig(
        responseModalities: ['AUDIO'],
        temperature: 0.7,
      );
      final str = config.toString();

      expect(str, contains('LiveGenerationConfig'));
      expect(str, contains('responseModalities'));
      expect(str, contains('temperature'));
    });
  });
}
