import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('BidiGenerateContentServerMessage', () {
    group('fromJson dispatch', () {
      test(
        'dispatches to BidiGenerateContentSetupComplete for setupComplete key',
        () {
          final json = {
            'setupComplete': {'sessionId': 'session-123'},
          };
          final message = BidiGenerateContentServerMessage.fromJson(json);

          expect(message, isA<BidiGenerateContentSetupComplete>());
          expect(
            (message as BidiGenerateContentSetupComplete).sessionId,
            'session-123',
          );
        },
      );

      test(
        'dispatches to BidiGenerateContentServerContent for serverContent key',
        () {
          final json = {
            'serverContent': {
              'turnComplete': true,
              'generationComplete': false,
            },
          };
          final message = BidiGenerateContentServerMessage.fromJson(json);

          expect(message, isA<BidiGenerateContentServerContent>());
          expect(
            (message as BidiGenerateContentServerContent).turnComplete,
            true,
          );
        },
      );

      test('dispatches to BidiGenerateContentToolCall for toolCall key', () {
        final json = {
          'toolCall': {
            'functionCalls': [
              {'name': 'get_weather', 'args': <String, dynamic>{}},
            ],
          },
        };
        final message = BidiGenerateContentServerMessage.fromJson(json);

        expect(message, isA<BidiGenerateContentToolCall>());
        expect(
          (message as BidiGenerateContentToolCall).functionCalls.length,
          1,
        );
      });

      test(
        'dispatches to BidiGenerateContentToolCallCancellation for toolCallCancellation key',
        () {
          final json = {
            'toolCallCancellation': {
              'ids': ['call-1', 'call-2'],
            },
          };
          final message = BidiGenerateContentServerMessage.fromJson(json);

          expect(message, isA<BidiGenerateContentToolCallCancellation>());
          expect((message as BidiGenerateContentToolCallCancellation).ids, [
            'call-1',
            'call-2',
          ]);
        },
      );

      test('dispatches to GoAway for goAway key', () {
        final json = {
          'goAway': {'timeLeft': 'PT30S'},
        };
        final message = BidiGenerateContentServerMessage.fromJson(json);

        expect(message, isA<GoAway>());
        expect((message as GoAway).timeLeft, 'PT30S');
      });

      test(
        'dispatches to SessionResumptionUpdate for sessionResumptionUpdate key',
        () {
          final json = {
            'sessionResumptionUpdate': {
              'newHandle': 'new-token-456',
              'resumable': true,
            },
          };
          final message = BidiGenerateContentServerMessage.fromJson(json);

          expect(message, isA<SessionResumptionUpdate>());
          expect(
            (message as SessionResumptionUpdate).newHandle,
            'new-token-456',
          );
        },
      );

      test('returns UnknownServerMessage for unknown key', () {
        final json = <String, dynamic>{
          'futureMessageType': <String, dynamic>{'data': 'value'},
        };

        final message = BidiGenerateContentServerMessage.fromJson(json);

        expect(message, isA<UnknownServerMessage>());
        final unknown = message as UnknownServerMessage;
        expect(unknown.rawJson, equals(json));
        expect(unknown.toJson(), equals(json));
        expect(unknown.toString(), contains('UnknownServerMessage'));
        expect(unknown.toString(), contains('futureMessageType'));
      });
    });
  });

  group('BidiGenerateContentSetupComplete', () {
    test('serializes with setupComplete wrapper key', () {
      const complete = BidiGenerateContentSetupComplete(
        sessionId: 'session-abc',
      );

      final json = complete.toJson();

      expect(json.containsKey('setupComplete'), true);
      final setupCompleteJson = json['setupComplete'] as Map<String, dynamic>;
      expect(setupCompleteJson['sessionId'], 'session-abc');
    });

    test('omits null sessionId', () {
      const complete = BidiGenerateContentSetupComplete();

      final json = complete.toJson();

      expect(json['setupComplete'], isEmpty);
    });

    test('deserializes from setupComplete wrapper', () {
      final json = {
        'setupComplete': {'sessionId': 'my-session'},
      };

      final message = BidiGenerateContentServerMessage.fromJson(json);
      expect(message, isA<BidiGenerateContentSetupComplete>());

      final complete = message as BidiGenerateContentSetupComplete;
      expect(complete.sessionId, 'my-session');
    });

    test('round-trip preserves sessionId', () {
      const original = BidiGenerateContentSetupComplete(sessionId: 'test-123');

      final json = original.toJson();
      final restored =
          BidiGenerateContentServerMessage.fromJson(json)
              as BidiGenerateContentSetupComplete;

      expect(restored.sessionId, original.sessionId);
    });

    test('toString includes sessionId', () {
      const complete = BidiGenerateContentSetupComplete(
        sessionId: 'session-xyz',
      );

      expect(complete.toString(), contains('BidiGenerateContentSetupComplete'));
      expect(complete.toString(), contains('sessionId'));
    });
  });

  group('BidiGenerateContentServerContent', () {
    test('serializes with serverContent wrapper key', () {
      const content = BidiGenerateContentServerContent(
        turnComplete: true,
        generationComplete: false,
        interrupted: false,
      );

      final json = content.toJson();

      expect(json.containsKey('serverContent'), true);
      final serverContentJson = json['serverContent'] as Map<String, dynamic>;
      expect(serverContentJson['turnComplete'], true);
      expect(serverContentJson['generationComplete'], false);
      expect(serverContentJson['interrupted'], false);
    });

    test('includes modelTurn when set', () {
      const content = BidiGenerateContentServerContent(
        modelTurn: Content(role: 'model', parts: [TextPart('Hello!')]),
        turnComplete: true,
      );

      final json = content.toJson();

      final serverContentJson = json['serverContent'] as Map<String, dynamic>;
      expect(serverContentJson['modelTurn'], isNotNull);
      final modelTurnJson =
          serverContentJson['modelTurn'] as Map<String, dynamic>;
      expect(modelTurnJson['role'], 'model');
    });

    test('includes transcriptions when set', () {
      const content = BidiGenerateContentServerContent(
        inputTranscription: Transcription(text: 'Hello'),
        outputTranscription: Transcription(text: 'Hi there'),
        turnComplete: true,
      );

      final json = content.toJson();

      final serverContentJson = json['serverContent'] as Map<String, dynamic>;
      expect(serverContentJson['inputTranscription'], isNotNull);
      final inputTranscriptionJson =
          serverContentJson['inputTranscription'] as Map<String, dynamic>;
      expect(inputTranscriptionJson['text'], 'Hello');
      expect(serverContentJson['outputTranscription'], isNotNull);
      final outputTranscriptionJson =
          serverContentJson['outputTranscription'] as Map<String, dynamic>;
      expect(outputTranscriptionJson['text'], 'Hi there');
    });

    test('omits null fields', () {
      const content = BidiGenerateContentServerContent(turnComplete: true);

      final json = content.toJson();
      final serverContent = json['serverContent'] as Map<String, dynamic>;

      expect(serverContent.containsKey('turnComplete'), true);
      expect(serverContent.containsKey('modelTurn'), false);
      expect(serverContent.containsKey('inputTranscription'), false);
      expect(serverContent.containsKey('outputTranscription'), false);
      expect(serverContent.containsKey('groundingMetadata'), false);
    });

    test('deserializes from serverContent wrapper', () {
      final json = {
        'serverContent': {
          'modelTurn': {
            'role': 'model',
            'parts': [
              {'text': 'Response text'},
            ],
          },
          'turnComplete': true,
          'generationComplete': true,
        },
      };

      final message = BidiGenerateContentServerMessage.fromJson(json);
      expect(message, isA<BidiGenerateContentServerContent>());

      final content = message as BidiGenerateContentServerContent;
      expect(content.modelTurn, isNotNull);
      expect(content.turnComplete, true);
      expect(content.generationComplete, true);
    });

    test('round-trip preserves all fields', () {
      const original = BidiGenerateContentServerContent(
        modelTurn: Content(role: 'model', parts: [TextPart('Test response')]),
        turnComplete: true,
        generationComplete: true,
        interrupted: false,
        inputTranscription: Transcription(text: 'Input'),
        outputTranscription: Transcription(text: 'Output'),
      );

      final json = original.toJson();
      final restored =
          BidiGenerateContentServerMessage.fromJson(json)
              as BidiGenerateContentServerContent;

      expect(restored.turnComplete, original.turnComplete);
      expect(restored.generationComplete, original.generationComplete);
      expect(restored.interrupted, original.interrupted);
      expect(
        restored.inputTranscription!.text,
        original.inputTranscription!.text,
      );
      expect(
        restored.outputTranscription!.text,
        original.outputTranscription!.text,
      );
    });

    test('toString includes status fields', () {
      const content = BidiGenerateContentServerContent(
        turnComplete: true,
        generationComplete: false,
        interrupted: true,
      );

      final str = content.toString();
      expect(str, contains('BidiGenerateContentServerContent'));
      expect(str, contains('turnComplete'));
      expect(str, contains('generationComplete'));
      expect(str, contains('interrupted'));
    });
  });

  group('BidiGenerateContentToolCall', () {
    test('serializes with toolCall wrapper key', () {
      const toolCall = BidiGenerateContentToolCall(
        functionCalls: [
          FunctionCall(
            name: 'get_weather',
            args: <String, dynamic>{'city': 'Seattle'},
          ),
        ],
      );

      final json = toolCall.toJson();

      expect(json.containsKey('toolCall'), true);
      final toolCallJson = json['toolCall'] as Map<String, dynamic>;
      expect(toolCallJson['functionCalls'], isNotNull);
      final functionCalls = toolCallJson['functionCalls'] as List<dynamic>;
      expect(functionCalls.length, 1);
    });

    test('deserializes from toolCall wrapper', () {
      final json = {
        'toolCall': {
          'functionCalls': [
            {
              'name': 'calculate',
              'args': {'x': 5, 'y': 10},
            },
            {
              'name': 'format',
              'args': {'value': 15},
            },
          ],
        },
      };

      final message = BidiGenerateContentServerMessage.fromJson(json);
      expect(message, isA<BidiGenerateContentToolCall>());

      final toolCall = message as BidiGenerateContentToolCall;
      expect(toolCall.functionCalls.length, 2);
      expect(toolCall.functionCalls[0].name, 'calculate');
      expect(toolCall.functionCalls[1].name, 'format');
    });

    test('round-trip preserves all fields', () {
      const original = BidiGenerateContentToolCall(
        functionCalls: [
          FunctionCall(
            name: 'test_func',
            args: <String, dynamic>{'param': 'value'},
          ),
        ],
      );

      final json = original.toJson();
      final restored =
          BidiGenerateContentServerMessage.fromJson(json)
              as BidiGenerateContentToolCall;

      expect(restored.functionCalls.length, original.functionCalls.length);
      expect(restored.functionCalls[0].name, original.functionCalls[0].name);
    });

    test('toString includes function call count', () {
      const toolCall = BidiGenerateContentToolCall(
        functionCalls: [
          FunctionCall(name: 'test', args: <String, dynamic>{}),
          FunctionCall(name: 'test2', args: <String, dynamic>{}),
        ],
      );

      expect(toolCall.toString(), contains('BidiGenerateContentToolCall'));
      expect(toolCall.toString(), contains('functionCalls: 2'));
    });
  });

  group('BidiGenerateContentToolCallCancellation', () {
    test('serializes with toolCallCancellation wrapper key', () {
      const cancellation = BidiGenerateContentToolCallCancellation(
        ids: ['call-1', 'call-2', 'call-3'],
      );

      final json = cancellation.toJson();

      expect(json.containsKey('toolCallCancellation'), true);
      final toolCallCancellationJson =
          json['toolCallCancellation'] as Map<String, dynamic>;
      expect(toolCallCancellationJson['ids'], ['call-1', 'call-2', 'call-3']);
    });

    test('deserializes from toolCallCancellation wrapper', () {
      final json = {
        'toolCallCancellation': {
          'ids': ['abc-123', 'def-456'],
        },
      };

      final message = BidiGenerateContentServerMessage.fromJson(json);
      expect(message, isA<BidiGenerateContentToolCallCancellation>());

      final cancellation = message as BidiGenerateContentToolCallCancellation;
      expect(cancellation.ids, ['abc-123', 'def-456']);
    });

    test('round-trip preserves all fields', () {
      const original = BidiGenerateContentToolCallCancellation(
        ids: ['id-1', 'id-2'],
      );

      final json = original.toJson();
      final restored =
          BidiGenerateContentServerMessage.fromJson(json)
              as BidiGenerateContentToolCallCancellation;

      expect(restored.ids, original.ids);
    });

    test('toString includes ids', () {
      const cancellation = BidiGenerateContentToolCallCancellation(
        ids: ['call-abc'],
      );

      expect(
        cancellation.toString(),
        contains('BidiGenerateContentToolCallCancellation'),
      );
      expect(cancellation.toString(), contains('ids'));
    });
  });

  group('GoAway', () {
    test('serializes with goAway wrapper key', () {
      const goAway = GoAway(timeLeft: 'PT60S');

      final json = goAway.toJson();

      expect(json.containsKey('goAway'), true);
      final goAwayJson = json['goAway'] as Map<String, dynamic>;
      expect(goAwayJson['timeLeft'], 'PT60S');
    });

    test('omits null timeLeft', () {
      const goAway = GoAway();

      final json = goAway.toJson();

      expect(json['goAway'], isEmpty);
    });

    test('deserializes from goAway wrapper', () {
      final json = {
        'goAway': {'timeLeft': 'PT30S'},
      };

      final message = BidiGenerateContentServerMessage.fromJson(json);
      expect(message, isA<GoAway>());

      final goAway = message as GoAway;
      expect(goAway.timeLeft, 'PT30S');
    });

    test('round-trip preserves timeLeft', () {
      const original = GoAway(timeLeft: 'PT120S');

      final json = original.toJson();
      final restored =
          BidiGenerateContentServerMessage.fromJson(json) as GoAway;

      expect(restored.timeLeft, original.timeLeft);
    });

    test('toString includes timeLeft', () {
      const goAway = GoAway(timeLeft: 'PT45S');

      expect(goAway.toString(), contains('GoAway'));
      expect(goAway.toString(), contains('timeLeft'));
      expect(goAway.toString(), contains('PT45S'));
    });
  });

  group('SessionResumptionUpdate', () {
    test('serializes with sessionResumptionUpdate wrapper key', () {
      const update = SessionResumptionUpdate(
        newHandle: 'token-xyz',
        resumable: true,
      );

      final json = update.toJson();

      expect(json.containsKey('sessionResumptionUpdate'), true);
      final sessionResumptionUpdateJson =
          json['sessionResumptionUpdate'] as Map<String, dynamic>;
      expect(sessionResumptionUpdateJson['newHandle'], 'token-xyz');
      expect(sessionResumptionUpdateJson['resumable'], true);
    });

    test('omits null fields', () {
      const update = SessionResumptionUpdate(resumable: true);

      final json = update.toJson();
      final updateJson =
          json['sessionResumptionUpdate'] as Map<String, dynamic>;

      expect(updateJson.containsKey('resumable'), true);
      expect(updateJson.containsKey('newHandle'), false);
    });

    test('deserializes from sessionResumptionUpdate wrapper', () {
      final json = {
        'sessionResumptionUpdate': {
          'newHandle': 'new-token-123',
          'resumable': true,
        },
      };

      final message = BidiGenerateContentServerMessage.fromJson(json);
      expect(message, isA<SessionResumptionUpdate>());

      final update = message as SessionResumptionUpdate;
      expect(update.newHandle, 'new-token-123');
      expect(update.resumable, true);
    });

    test('round-trip preserves all fields', () {
      const original = SessionResumptionUpdate(
        newHandle: 'handle-abc',
        resumable: false,
      );

      final json = original.toJson();
      final restored =
          BidiGenerateContentServerMessage.fromJson(json)
              as SessionResumptionUpdate;

      expect(restored.newHandle, original.newHandle);
      expect(restored.resumable, original.resumable);
    });

    test('toString masks newHandle for security', () {
      const update = SessionResumptionUpdate(
        newHandle: 'secret-handle-12345',
        resumable: true,
      );

      final str = update.toString();
      expect(str, contains('SessionResumptionUpdate'));
      expect(str, contains('...'));
      expect(str, isNot(contains('secret-handle-12345')));
    });

    test('toString shows null newHandle correctly', () {
      const update = SessionResumptionUpdate(resumable: false);

      final str = update.toString();
      expect(str, contains('null'));
    });
  });
}
