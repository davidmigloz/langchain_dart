// ignore_for_file: avoid_print

import 'dart:io';

import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

import 'test_config.dart';

/// Integration tests for Live API WebSocket streaming.
///
/// These tests require a real API key set in the GEMINI_API_KEY
/// environment variable. If the key is not present, all tests are skipped.
void main() {
  String? apiKey;
  GoogleAIClient? client;
  LiveClient? liveClient;

  setUpAll(() {
    apiKey = Platform.environment['GEMINI_API_KEY'];
    if (apiKey == null || apiKey!.isEmpty) {
      print(
        '⚠️  GEMINI_API_KEY not set. Live API tests will be skipped.\n'
        '   To run these tests, export GEMINI_API_KEY=your_api_key',
      );
    } else {
      client = GoogleAIClient(
        config: GoogleAIConfig(authProvider: ApiKeyProvider(apiKey!)),
      );
      liveClient = client!.createLiveClient();
    }
  });

  tearDownAll(() async {
    await liveClient?.close();
    client?.close();
  });

  group('Connection & Setup', () {
    test(
      'connects to Live API and receives setup complete',
      () async {
        if (apiKey == null) {
          markTestSkipped('API key not available');
          return;
        }

        final session = await liveClient!.connect(
          model: defaultLiveModel,
          liveConfig: LiveConfig(
            generationConfig: LiveGenerationConfig.audioOnly(),
          ),
        );

        expect(session, isNotNull);
        expect(session.isConnected, isTrue);

        await session.close();
      },
      timeout: const Timeout(Duration(seconds: 30)),
    );

    test(
      'establishes connection and can receive messages',
      () async {
        if (apiKey == null) {
          markTestSkipped('API key not available');
          return;
        }

        final session = await liveClient!.connect(
          model: defaultLiveModel,
          liveConfig: LiveConfig(
            generationConfig: LiveGenerationConfig.audioOnly(),
          ),
        );

        // Connection is established after setup completes
        expect(session.isConnected, isTrue);

        // Send a text message and verify we can receive a response
        session.sendText('Hi');

        // Wait for at least one message (content or turn complete)
        var receivedMessage = false;
        await for (final message in session.messages) {
          receivedMessage = true;
          if (message is BidiGenerateContentServerContent) {
            if (message.turnComplete ?? false) break;
          }
        }

        expect(receivedMessage, isTrue);

        await session.close();
      },
      timeout: const Timeout(Duration(seconds: 60)),
    );
  });

  group('Text Exchange', () {
    test(
      'sends text and receives response',
      () async {
        if (apiKey == null) {
          markTestSkipped('API key not available');
          return;
        }

        final session = await liveClient!.connect(
          model: defaultLiveModel,
          liveConfig: LiveConfig(
            generationConfig: LiveGenerationConfig.audioOnly(),
          ),
        );

        // Send text
        session.sendText('Say hello');

        // Wait for turn complete
        var receivedResponse = false;
        messageLoop:
        await for (final message in session.messages) {
          switch (message) {
            case BidiGenerateContentServerContent(:final turnComplete):
              receivedResponse = true;
              if (turnComplete ?? false) {
                break messageLoop;
              }
            default:
              // Ignore other message types
              break;
          }
        }

        expect(receivedResponse, isTrue);

        await session.close();
      },
      timeout: const Timeout(Duration(seconds: 60)),
    );

    test(
      'receives turn complete signal',
      () async {
        if (apiKey == null) {
          markTestSkipped('API key not available');
          return;
        }

        final session = await liveClient!.connect(
          model: defaultLiveModel,
          liveConfig: LiveConfig(
            generationConfig: LiveGenerationConfig.audioOnly(),
          ),
        );

        session.sendText('Hi');

        var turnCompleted = false;
        await for (final message in session.messages) {
          if (message is BidiGenerateContentServerContent) {
            if (message.turnComplete ?? false) {
              turnCompleted = true;
              break;
            }
          }
        }

        expect(turnCompleted, isTrue);

        await session.close();
      },
      timeout: const Timeout(Duration(seconds: 60)),
    );
  });

  group('VAD Modes', () {
    test(
      'automatic VAD mode configuration works',
      () async {
        if (apiKey == null) {
          markTestSkipped('API key not available');
          return;
        }

        final session = await liveClient!.connect(
          model: defaultLiveModel,
          liveConfig: LiveConfig(
            generationConfig: LiveGenerationConfig.audioOnly(),
            realtimeInputConfig: RealtimeInputConfig.withVAD(
              silenceDurationMs: 500,
              activityHandling: ActivityHandling.startOfActivityInterrupts,
            ),
          ),
        );

        // If we got here without exception, VAD config was accepted
        expect(session.isConnected, isTrue);

        await session.close();
      },
      timeout: const Timeout(Duration(seconds: 30)),
    );

    test('manual VAD signals work', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final session = await liveClient!.connect(
        model: defaultLiveModel,
        liveConfig: LiveConfig(
          generationConfig: LiveGenerationConfig.audioOnly(),
          realtimeInputConfig: RealtimeInputConfig.manual(),
        ),
      );

      // Send manual activity signals with text
      session
        ..signalActivityStart()
        ..sendText('Hello')
        ..signalActivityEnd();

      // Should receive response
      var receivedContent = false;
      await for (final message in session.messages) {
        if (message is BidiGenerateContentServerContent) {
          receivedContent = true;
          if (message.turnComplete ?? false) {
            break;
          }
        }
      }

      expect(receivedContent, isTrue);

      await session.close();
    }, timeout: const Timeout(Duration(seconds: 60)));
  });

  group('Tool Calling', () {
    test(
      'can configure tools in session',
      () async {
        if (apiKey == null) {
          markTestSkipped('API key not available');
          return;
        }

        // Define a simple tool
        const tools = [
          Tool(
            functionDeclarations: [
              FunctionDeclaration(
                name: 'get_current_time',
                description: 'Gets the current time in a specific timezone',
                parameters: Schema(
                  type: SchemaType.object,
                  properties: {
                    'timezone': Schema(
                      type: SchemaType.string,
                      description: 'The timezone to get time for',
                    ),
                  },
                ),
              ),
            ],
          ),
        ];

        // Verify we can create a session with tools configured
        final session = await liveClient!.connect(
          model: defaultLiveModel,
          liveConfig: LiveConfig(
            generationConfig: LiveGenerationConfig.audioOnly(),
            tools: tools,
          ),
        );

        expect(session.isConnected, isTrue);

        // Send a message and get a response
        session.sendText('Hello');

        var receivedResponse = false;
        messageLoop:
        await for (final message in session.messages) {
          switch (message) {
            case BidiGenerateContentServerContent(:final turnComplete):
              receivedResponse = true;
              if (turnComplete ?? false) break messageLoop;
            case BidiGenerateContentToolCall():
              receivedResponse = true;
              break messageLoop;
            default:
              break;
          }
        }

        expect(receivedResponse, isTrue);

        await session.close();
      },
      timeout: const Timeout(Duration(seconds: 60)),
    );
  });

  group('Session Resumption', () {
    test(
      'can enable session resumption',
      () async {
        if (apiKey == null) {
          markTestSkipped('API key not available');
          return;
        }

        // Verify we can create a session with resumption enabled
        final session = await liveClient!.connect(
          model: defaultLiveModel,
          liveConfig: LiveConfig(
            generationConfig: LiveGenerationConfig.audioOnly(),
            sessionResumption: const SessionResumptionConfig.enabled(),
          ),
        );

        expect(session.isConnected, isTrue);

        session.sendText('Hello');

        // Wait for turn complete
        messageLoop:
        await for (final message in session.messages) {
          switch (message) {
            case BidiGenerateContentServerContent(:final turnComplete):
              if (turnComplete ?? false) break messageLoop;
            default:
              break;
          }
        }

        // The resumption token may or may not be provided depending on the model
        // We just verify the session worked with resumption enabled
        await session.close();
      },
      timeout: const Timeout(Duration(seconds: 60)),
    );

    test('resumes session with token', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // First session - get resumption token
      final session1 = await liveClient!.connect(
        model: defaultLiveModel,
        liveConfig: LiveConfig(
          generationConfig: LiveGenerationConfig.audioOnly(),
          sessionResumption: const SessionResumptionConfig.enabled(),
        ),
      );

      session1.sendText('Hello');

      String? resumptionToken;
      messageLoop1:
      await for (final message in session1.messages) {
        switch (message) {
          case SessionResumptionUpdate(:final newHandle):
            resumptionToken = newHandle;

          case BidiGenerateContentServerContent(:final turnComplete):
            if (turnComplete ?? false) break messageLoop1;

          default:
            break;
        }
      }

      final token = session1.resumptionToken ?? resumptionToken;
      await session1.close();

      if (token == null) {
        markTestSkipped('No resumption token received');
        return;
      }

      // Wait briefly before resuming
      await Future<void>.delayed(const Duration(seconds: 1));

      // Second session - resume
      final session2 = await liveClient!.resume(
        model: defaultLiveModel,
        resumptionToken: token,
        liveConfig: LiveConfig(
          generationConfig: LiveGenerationConfig.audioOnly(),
        ),
      );

      expect(session2.isConnected, isTrue);

      await session2.close();
    }, timeout: const Timeout(Duration(seconds: 60)));
  });
}
