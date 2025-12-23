import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('LiveConfig', () {
    group('fromJson', () {
      test('creates LiveConfig with all fields', () {
        final json = {
          'generationConfig': {
            'responseModalities': ['AUDIO', 'TEXT'],
            'temperature': 0.7,
          },
          'systemInstruction': {
            'role': 'user',
            'parts': [
              {'text': 'Be helpful'},
            ],
          },
          'tools': [
            {
              'functionDeclarations': [
                {'name': 'get_weather', 'description': 'Get weather'},
              ],
            },
          ],
          'realtimeInputConfig': {
            'activityHandling': 'START_OF_ACTIVITY_INTERRUPTS',
          },
          'sessionResumption': {'handle': 'resume-token'},
          'contextWindowCompression': {
            'slidingWindow': {'targetTokens': 1000},
          },
          'inputAudioTranscription': <String, dynamic>{},
          'outputAudioTranscription': <String, dynamic>{},
          'proactivity': {'proactiveAudio': true},
        };

        final config = LiveConfig.fromJson(json);

        expect(config.generationConfig, isNotNull);
        expect(
          config.generationConfig!.responseModalities,
          equals(['AUDIO', 'TEXT']),
        );
        expect(config.systemInstruction, isNotNull);
        expect(config.tools, isNotNull);
        expect(config.tools!.length, 1);
        expect(config.realtimeInputConfig, isNotNull);
        expect(config.sessionResumption, isNotNull);
        expect(config.contextWindowCompression, isNotNull);
        expect(config.inputAudioTranscription, isNotNull);
        expect(config.outputAudioTranscription, isNotNull);
        expect(config.proactivity, isNotNull);
      });

      test('creates LiveConfig with minimal fields', () {
        final json = <String, dynamic>{};
        final config = LiveConfig.fromJson(json);

        expect(config.generationConfig, isNull);
        expect(config.systemInstruction, isNull);
        expect(config.tools, isNull);
        expect(config.realtimeInputConfig, isNull);
        expect(config.sessionResumption, isNull);
        expect(config.contextWindowCompression, isNull);
        expect(config.inputAudioTranscription, isNull);
        expect(config.outputAudioTranscription, isNull);
        expect(config.proactivity, isNull);
      });

      test('creates LiveConfig with only generationConfig', () {
        final json = {
          'generationConfig': {
            'responseModalities': ['AUDIO'],
          },
        };
        final config = LiveConfig.fromJson(json);

        expect(config.generationConfig, isNotNull);
        expect(config.generationConfig!.responseModalities, equals(['AUDIO']));
        expect(config.systemInstruction, isNull);
      });
    });

    group('toJson', () {
      test('includes all non-null fields', () {
        final config = LiveConfig(
          generationConfig: LiveGenerationConfig.audioOnly(),
          realtimeInputConfig: RealtimeInputConfig.withVAD(
            silenceDurationMs: 500,
          ),
          inputAudioTranscription: AudioTranscriptionConfig.enabled(),
          outputAudioTranscription: AudioTranscriptionConfig.enabled(),
          proactivity: const ProactivityConfig(proactiveAudio: true),
        );

        final json = config.toJson();

        expect(json.containsKey('generationConfig'), true);
        expect(json.containsKey('realtimeInputConfig'), true);
        expect(json.containsKey('inputAudioTranscription'), true);
        expect(json.containsKey('outputAudioTranscription'), true);
        expect(json.containsKey('proactivity'), true);
      });

      test('omits null fields', () {
        const config = LiveConfig();
        final json = config.toJson();

        expect(json, isEmpty);
      });

      test('includes only specified fields', () {
        final config = LiveConfig(
          generationConfig: LiveGenerationConfig.textOnly(),
        );
        final json = config.toJson();

        expect(json.containsKey('generationConfig'), true);
        expect(json.containsKey('systemInstruction'), false);
        expect(json.containsKey('tools'), false);
      });
    });

    group('copyWith', () {
      test('with no params returns instance with same values', () {
        final original = LiveConfig(
          generationConfig: LiveGenerationConfig.audioOnly(),
          proactivity: const ProactivityConfig(proactiveAudio: true),
        );
        final copied = original.copyWith();

        expect(copied.generationConfig, original.generationConfig);
        expect(copied.proactivity, original.proactivity);
      });

      test('updates specified fields only', () {
        final original = LiveConfig(
          generationConfig: LiveGenerationConfig.audioOnly(),
          proactivity: const ProactivityConfig(proactiveAudio: true),
        );
        final newGenConfig = LiveGenerationConfig.textOnly();
        final updated = original.copyWith(generationConfig: newGenConfig);

        expect(updated.generationConfig, newGenConfig);
        expect(updated.proactivity, original.proactivity);
      });

      test('can update multiple fields', () {
        final original = LiveConfig(
          generationConfig: LiveGenerationConfig.audioOnly(),
        );
        final updated = original.copyWith(
          generationConfig: LiveGenerationConfig.textAndAudio(),
          inputAudioTranscription: AudioTranscriptionConfig.enabled(),
        );

        expect(updated.generationConfig!.responseModalities, contains('TEXT'));
        expect(updated.inputAudioTranscription, isNotNull);
      });
    });

    group('factory constructors', () {
      test('LiveConfig.audio creates audio-only config', () {
        final config = LiveConfig.audio(
          voiceName: 'Puck',
          silenceDurationMs: 500,
        );

        expect(config.generationConfig, isNotNull);
        expect(config.generationConfig!.responseModalities, equals(['AUDIO']));
        expect(config.realtimeInputConfig, isNotNull);
      });

      test('LiveConfig.textAndAudio creates combined config', () {
        final config = LiveConfig.textAndAudio(
          voiceName: 'Puck',
          enableTranscription: true,
        );

        expect(config.generationConfig, isNotNull);
        expect(
          config.generationConfig!.responseModalities,
          equals(['AUDIO', 'TEXT']),
        );
        expect(config.inputAudioTranscription, isNotNull);
        expect(config.outputAudioTranscription, isNotNull);
      });

      test('LiveConfig.textAndAudio without transcription', () {
        final config = LiveConfig.textAndAudio();

        expect(config.inputAudioTranscription, isNull);
        expect(config.outputAudioTranscription, isNull);
      });
    });

    test('round-trip conversion preserves data', () {
      final original = LiveConfig(
        generationConfig: LiveGenerationConfig.textAndAudio(temperature: 0.7),
        realtimeInputConfig: RealtimeInputConfig.withVAD(
          silenceDurationMs: 500,
        ),
        inputAudioTranscription: AudioTranscriptionConfig.enabled(),
        outputAudioTranscription: AudioTranscriptionConfig.enabled(),
        proactivity: const ProactivityConfig(proactiveAudio: true),
      );

      final json = original.toJson();
      final restored = LiveConfig.fromJson(json);

      expect(
        restored.generationConfig!.responseModalities,
        original.generationConfig!.responseModalities,
      );
      expect(
        restored.generationConfig!.temperature,
        original.generationConfig!.temperature,
      );
      expect(restored.realtimeInputConfig, isNotNull);
      expect(restored.inputAudioTranscription, isNotNull);
      expect(restored.outputAudioTranscription, isNotNull);
      expect(
        restored.proactivity!.proactiveAudio,
        original.proactivity!.proactiveAudio,
      );
    });

    test('toString includes generationConfig', () {
      final config = LiveConfig(
        generationConfig: LiveGenerationConfig.audioOnly(),
      );
      final str = config.toString();

      expect(str, contains('LiveConfig'));
      expect(str, contains('generationConfig'));
    });
  });
}
