import 'dart:convert';

import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('BidiGenerateContentClientMessage', () {
    group('fromJson dispatch', () {
      test('dispatches to BidiGenerateContentSetup for setup key', () {
        final json = {
          'setup': {'model': 'models/gemini-2.0-flash-live-001'},
        };
        final message = BidiGenerateContentClientMessage.fromJson(json);

        expect(message, isA<BidiGenerateContentSetup>());
        expect(
          (message as BidiGenerateContentSetup).model,
          'models/gemini-2.0-flash-live-001',
        );
      });

      test(
        'dispatches to BidiGenerateContentClientContent for clientContent key',
        () {
          final json = {
            'clientContent': {
              'turns': [
                {
                  'role': 'user',
                  'parts': [
                    {'text': 'Hello'},
                  ],
                },
              ],
              'turnComplete': true,
            },
          };
          final message = BidiGenerateContentClientMessage.fromJson(json);

          expect(message, isA<BidiGenerateContentClientContent>());
          expect(
            (message as BidiGenerateContentClientContent).turnComplete,
            true,
          );
        },
      );

      test(
        'dispatches to BidiGenerateContentRealtimeInput for realtimeInput key',
        () {
          final json = {
            'realtimeInput': {'text': 'Hello there'},
          };
          final message = BidiGenerateContentClientMessage.fromJson(json);

          expect(message, isA<BidiGenerateContentRealtimeInput>());
          expect(
            (message as BidiGenerateContentRealtimeInput).text,
            'Hello there',
          );
        },
      );

      test(
        'dispatches to BidiGenerateContentToolResponse for toolResponse key',
        () {
          final json = {
            'toolResponse': {
              'functionResponses': [
                {
                  'name': 'get_weather',
                  'response': {'temperature': 72},
                },
              ],
            },
          };
          final message = BidiGenerateContentClientMessage.fromJson(json);

          expect(message, isA<BidiGenerateContentToolResponse>());
          expect(
            (message as BidiGenerateContentToolResponse)
                .functionResponses
                .length,
            1,
          );
        },
      );

      test('returns UnknownClientMessage for unknown key', () {
        final json = <String, dynamic>{
          'futureMessageType': <String, dynamic>{'data': 'value'},
        };

        final message = BidiGenerateContentClientMessage.fromJson(json);

        expect(message, isA<UnknownClientMessage>());
        final unknown = message as UnknownClientMessage;
        expect(unknown.rawJson, equals(json));
        expect(unknown.toJson(), equals(json));
        expect(unknown.toString(), contains('UnknownClientMessage'));
        expect(unknown.toString(), contains('futureMessageType'));
      });
    });
  });

  group('BidiGenerateContentSetup', () {
    test('serializes with setup wrapper key', () {
      const setup = BidiGenerateContentSetup(
        model: 'models/gemini-2.0-flash-live-001',
      );

      final json = setup.toJson();

      expect(json.containsKey('setup'), true);
      final setupJson = json['setup'] as Map<String, dynamic>;
      expect(setupJson['model'], 'models/gemini-2.0-flash-live-001');
    });

    test('includes all optional fields when set', () {
      final setup = BidiGenerateContentSetup(
        model: 'models/gemini-2.0-flash-live-001',
        generationConfig: LiveGenerationConfig.audioOnly(),
        systemInstruction: const Content(
          role: 'user',
          parts: [TextPart('Be helpful')],
        ),
        realtimeInputConfig: RealtimeInputConfig.withVAD(
          silenceDurationMs: 500,
        ),
        sessionResumption: SessionResumptionConfig.resume('token-123'),
        inputAudioTranscription: AudioTranscriptionConfig.enabled(),
        outputAudioTranscription: AudioTranscriptionConfig.enabled(),
        proactivity: const ProactivityConfig(proactiveAudio: true),
      );

      final json = setup.toJson();
      final setupJson = json['setup'] as Map<String, dynamic>;

      expect(setupJson['model'], 'models/gemini-2.0-flash-live-001');
      expect(setupJson['generationConfig'], isNotNull);
      expect(setupJson['systemInstruction'], isNotNull);
      expect(setupJson['realtimeInputConfig'], isNotNull);
      expect(setupJson['sessionResumption'], isNotNull);
      expect(setupJson['inputAudioTranscription'], isNotNull);
      expect(setupJson['outputAudioTranscription'], isNotNull);
      expect(setupJson['proactivity'], isNotNull);
    });

    test('omits null optional fields', () {
      const setup = BidiGenerateContentSetup(
        model: 'models/gemini-2.0-flash-live-001',
      );

      final json = setup.toJson();
      final setupJson = json['setup'] as Map<String, dynamic>;

      expect(setupJson.containsKey('generationConfig'), false);
      expect(setupJson.containsKey('systemInstruction'), false);
      expect(setupJson.containsKey('tools'), false);
    });

    test('deserializes from setup wrapper', () {
      final json = {
        'setup': {
          'model': 'models/gemini-2.0-flash-live-001',
          'generationConfig': {
            'responseModalities': ['AUDIO'],
          },
        },
      };

      final message = BidiGenerateContentClientMessage.fromJson(json);
      expect(message, isA<BidiGenerateContentSetup>());

      final setup = message as BidiGenerateContentSetup;
      expect(setup.model, 'models/gemini-2.0-flash-live-001');
      expect(setup.generationConfig, isNotNull);
      expect(setup.generationConfig!.responseModalities, equals(['AUDIO']));
    });

    test('round-trip preserves all fields', () {
      final original = BidiGenerateContentSetup(
        model: 'models/gemini-2.0-flash-live-001',
        generationConfig: LiveGenerationConfig.textAndAudio(temperature: 0.7),
        realtimeInputConfig: RealtimeInputConfig.withVAD(
          silenceDurationMs: 500,
        ),
        proactivity: const ProactivityConfig(proactiveAudio: true),
      );

      final json = original.toJson();
      final restored =
          BidiGenerateContentClientMessage.fromJson(json)
              as BidiGenerateContentSetup;

      expect(restored.model, original.model);
      expect(
        restored.generationConfig!.temperature,
        original.generationConfig!.temperature,
      );
      expect(
        restored
            .realtimeInputConfig!
            .automaticActivityDetection!
            .silenceDurationMs,
        original
            .realtimeInputConfig!
            .automaticActivityDetection!
            .silenceDurationMs,
      );
      expect(
        restored.proactivity!.proactiveAudio,
        original.proactivity!.proactiveAudio,
      );
    });

    test('toString includes model', () {
      const setup = BidiGenerateContentSetup(
        model: 'models/gemini-2.0-flash-live-001',
      );

      expect(setup.toString(), contains('BidiGenerateContentSetup'));
      expect(setup.toString(), contains('model'));
    });
  });

  group('BidiGenerateContentClientContent', () {
    test('serializes with clientContent wrapper key', () {
      const content = BidiGenerateContentClientContent(
        turns: [
          Content(role: 'user', parts: [TextPart('Hello')]),
        ],
        turnComplete: true,
      );

      final json = content.toJson();

      expect(json.containsKey('clientContent'), true);
      final clientContentJson = json['clientContent'] as Map<String, dynamic>;
      expect(clientContentJson['turns'], isNotNull);
      expect(clientContentJson['turnComplete'], true);
    });

    test('deserializes from clientContent wrapper', () {
      final json = {
        'clientContent': {
          'turns': [
            {
              'role': 'user',
              'parts': [
                {'text': 'Hello'},
              ],
            },
          ],
          'turnComplete': true,
        },
      };

      final message = BidiGenerateContentClientMessage.fromJson(json);
      expect(message, isA<BidiGenerateContentClientContent>());

      final content = message as BidiGenerateContentClientContent;
      expect(content.turns.length, 1);
      expect(content.turns[0].role, 'user');
      expect(content.turnComplete, true);
    });

    test('round-trip preserves all fields', () {
      const original = BidiGenerateContentClientContent(
        turns: [
          Content(role: 'user', parts: [TextPart('Hello')]),
          Content(role: 'model', parts: [TextPart('Hi there!')]),
        ],
        turnComplete: false,
      );

      final json = original.toJson();
      final restored =
          BidiGenerateContentClientMessage.fromJson(json)
              as BidiGenerateContentClientContent;

      expect(restored.turns.length, original.turns.length);
      expect(restored.turnComplete, original.turnComplete);
    });

    test('toString includes turn count', () {
      const content = BidiGenerateContentClientContent(
        turns: [
          Content(role: 'user', parts: [TextPart('Hello')]),
        ],
        turnComplete: true,
      );

      expect(content.toString(), contains('BidiGenerateContentClientContent'));
      expect(content.toString(), contains('turns: 1'));
    });
  });

  group('BidiGenerateContentRealtimeInput', () {
    test('serializes text input with realtimeInput wrapper key', () {
      const input = BidiGenerateContentRealtimeInput(text: 'Hello');

      final json = input.toJson();

      expect(json.containsKey('realtimeInput'), true);
      final realtimeInputJson = json['realtimeInput'] as Map<String, dynamic>;
      expect(realtimeInputJson['text'], 'Hello');
    });

    test('serializes audio input', () {
      final input = BidiGenerateContentRealtimeInput.audio([0, 1, 2, 3]);

      final json = input.toJson();

      final realtimeInputJson = json['realtimeInput'] as Map<String, dynamic>;
      expect(realtimeInputJson['audio'], isNotNull);
      final audioJson = realtimeInputJson['audio'] as Map<String, dynamic>;
      expect(audioJson['mimeType'], 'audio/pcm;rate=16000');
      expect(audioJson['data'], base64Encode([0, 1, 2, 3]));
    });

    test('serializes activity signals', () {
      final startActivity = BidiGenerateContentRealtimeInput.startActivity();
      final endActivity = BidiGenerateContentRealtimeInput.endActivity();

      final startJson =
          startActivity.toJson()['realtimeInput'] as Map<String, dynamic>;
      final endJson =
          endActivity.toJson()['realtimeInput'] as Map<String, dynamic>;
      // Activity signals are serialized as empty objects per API spec
      expect(startJson['activityStart'], <String, dynamic>{});
      expect(endJson['activityEnd'], <String, dynamic>{});
    });

    test('deserializes from realtimeInput wrapper', () {
      final json = {
        'realtimeInput': {'text': 'Hello there', 'activityStart': true},
      };

      final message = BidiGenerateContentClientMessage.fromJson(json);
      expect(message, isA<BidiGenerateContentRealtimeInput>());

      final input = message as BidiGenerateContentRealtimeInput;
      expect(input.text, 'Hello there');
      expect(input.activityStart, true);
    });

    test('factory textInput creates text message', () {
      final input = BidiGenerateContentRealtimeInput.textInput('Hi!');

      expect(input.text, 'Hi!');
      expect(input.audio, isNull);
      expect(input.video, isNull);
    });

    test('round-trip preserves all fields', () {
      const original = BidiGenerateContentRealtimeInput(
        text: 'Hello',
        activityEnd: true,
        audioStreamEnd: true,
      );

      final json = original.toJson();
      final restored =
          BidiGenerateContentClientMessage.fromJson(json)
              as BidiGenerateContentRealtimeInput;

      expect(restored.text, original.text);
      expect(restored.activityEnd, original.activityEnd);
      expect(restored.audioStreamEnd, original.audioStreamEnd);
    });

    test('toString includes content types', () {
      const input = BidiGenerateContentRealtimeInput(
        text: 'Hello',
        activityStart: true,
      );

      final str = input.toString();
      expect(str, contains('BidiGenerateContentRealtimeInput'));
      expect(str, contains('text'));
      expect(str, contains('activityStart'));
    });
  });

  group('BidiGenerateContentToolResponse', () {
    test('serializes with toolResponse wrapper key', () {
      const response = BidiGenerateContentToolResponse(
        functionResponses: [
          FunctionResponse(
            name: 'get_weather',
            response: <String, dynamic>{'temperature': 72},
          ),
        ],
      );

      final json = response.toJson();

      expect(json.containsKey('toolResponse'), true);
      final toolResponseJson = json['toolResponse'] as Map<String, dynamic>;
      expect(toolResponseJson['functionResponses'], isNotNull);
      final functionResponses =
          toolResponseJson['functionResponses'] as List<dynamic>;
      expect(functionResponses.length, 1);
    });

    test('deserializes from toolResponse wrapper', () {
      final json = {
        'toolResponse': {
          'functionResponses': [
            {
              'name': 'get_weather',
              'response': {'temp': 72},
            },
          ],
        },
      };

      final message = BidiGenerateContentClientMessage.fromJson(json);
      expect(message, isA<BidiGenerateContentToolResponse>());

      final response = message as BidiGenerateContentToolResponse;
      expect(response.functionResponses.length, 1);
      expect(response.functionResponses[0].name, 'get_weather');
    });

    test('round-trip preserves all fields', () {
      const original = BidiGenerateContentToolResponse(
        functionResponses: [
          FunctionResponse(
            name: 'calculate',
            response: <String, dynamic>{'result': 42},
          ),
          FunctionResponse(
            name: 'lookup',
            response: <String, dynamic>{'found': true, 'value': 'test'},
          ),
        ],
      );

      final json = original.toJson();
      final restored =
          BidiGenerateContentClientMessage.fromJson(json)
              as BidiGenerateContentToolResponse;

      expect(
        restored.functionResponses.length,
        original.functionResponses.length,
      );
      expect(
        restored.functionResponses[0].name,
        original.functionResponses[0].name,
      );
      expect(
        restored.functionResponses[1].name,
        original.functionResponses[1].name,
      );
    });

    test('toString includes function response count', () {
      const response = BidiGenerateContentToolResponse(
        functionResponses: [
          FunctionResponse(name: 'test', response: <String, dynamic>{}),
        ],
      );

      expect(response.toString(), contains('BidiGenerateContentToolResponse'));
      expect(response.toString(), contains('functionResponses: 1'));
    });
  });
}
