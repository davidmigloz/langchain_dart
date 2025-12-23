// ignore_for_file: avoid_print, unused_local_variable, unreachable_from_main
// ignore_for_file: cascade_invocations
import 'dart:io';

import 'package:googleai_dart/googleai_dart.dart';

/// Example demonstrating the Gemini Live API for real-time streaming.
///
/// The Live API provides bidirectional WebSocket streaming for:
/// - Real-time audio conversations
/// - Text streaming
/// - Tool/function calling in live sessions
/// - Session resumption
///
/// Audio Format:
/// - Input: 16kHz, 16-bit, mono PCM
/// - Output: 24kHz, 16-bit, mono PCM
void main() async {
  // Get API key from environment
  final apiKey = Platform.environment['GOOGLE_AI_API_KEY'];
  if (apiKey == null) {
    print('Please set GOOGLE_AI_API_KEY environment variable');
    exit(1);
  }

  // Create the main client
  final client = GoogleAIClient(
    config: GoogleAIConfig(authProvider: ApiKeyProvider(apiKey)),
  );

  // Create a Live client for WebSocket streaming
  final liveClient = client.createLiveClient();

  try {
    // Connect to the Live API with configuration
    final session = await liveClient.connect(
      model: 'gemini-2.0-flash-live-001',
      liveConfig: LiveConfig(
        generationConfig: LiveGenerationConfig.textAndAudio(
          speechConfig: SpeechConfig.withVoice(LiveVoices.puck),
          temperature: 0.7,
        ),
        // Enable transcription for both input and output
        inputAudioTranscription: AudioTranscriptionConfig.enabled(),
        outputAudioTranscription: AudioTranscriptionConfig.enabled(),
        // Configure voice activity detection
        realtimeInputConfig: RealtimeInputConfig.withVAD(
          silenceDurationMs: 500,
          activityHandling: ActivityHandling.startOfActivityInterrupts,
        ),
      ),
    );

    print('Connected! Session ID: ${session.sessionId}');

    // Send a text message
    session.sendText('Hello! Tell me a short joke.');

    // Listen for responses
    await for (final message in session.messages) {
      switch (message) {
        case BidiGenerateContentSetupComplete(:final sessionId):
          print('Setup complete, session: $sessionId');

        case BidiGenerateContentServerContent(
          :final modelTurn,
          :final turnComplete,
          :final interrupted,
          :final inputTranscription,
          :final outputTranscription,
        ):
          // Handle model response
          if (modelTurn != null) {
            for (final part in modelTurn.parts) {
              if (part is TextPart) {
                print('Model (text): ${part.text}');
              } else if (part is InlineDataPart) {
                // Audio data (24kHz PCM)
                print('Model (audio): ${part.inlineData.data.length} bytes');
              }
            }
          }

          // Show transcriptions
          if (inputTranscription?.text != null) {
            print('User said: ${inputTranscription!.text}');
          }
          if (outputTranscription?.text != null) {
            print('Model said: ${outputTranscription!.text}');
          }

          if (turnComplete ?? false) {
            print('--- Turn complete ---');
            // Exit after one turn for this example
            break;
          }

          if (interrupted ?? false) {
            print('--- Model was interrupted ---');
          }

        case BidiGenerateContentToolCall(:final functionCalls):
          // Handle tool calls
          print('Tool calls requested: ${functionCalls.length}');

          // Execute tools and send responses
          final responses = <FunctionResponse>[];
          for (final call in functionCalls) {
            print('  - ${call.name}(${call.args})');
            // In a real app, execute the function here
            responses.add(
              FunctionResponse(
                name: call.name,
                response: {'result': 'Tool executed successfully'},
              ),
            );
          }
          session.sendToolResponse(responses);

        case BidiGenerateContentToolCallCancellation(:final ids):
          print('Tool calls cancelled: $ids');

        case GoAway(:final timeLeft):
          print('Server requested disconnect, time left: $timeLeft');
          // Save resumption token for later reconnection
          if (session.resumptionToken != null) {
            print('Save this token to resume: ${session.resumptionToken}');
          }

        case SessionResumptionUpdate(:final newHandle, :final resumable):
          print('Resumption update - resumable: $resumable');
        // Store newHandle for session resumption

        case UnknownServerMessage(:final rawJson):
          // Handle future message types gracefully
          print('Unknown message type: ${rawJson.keys}');
      }
    }

    await session.close();
    print('Session closed');
  } on LiveConnectionException catch (e) {
    print('Connection failed: ${e.message}');
  } on LiveSessionSetupException catch (e) {
    print('Setup failed: ${e.message}');
  } finally {
    await liveClient.close();
    client.close();
  }
}

/// Example: Sending audio data
void sendAudioExample(LiveSession session, List<int> pcmAudioBytes) {
  // Audio must be 16kHz, 16-bit, mono PCM
  session.sendAudio(pcmAudioBytes);
}

/// Example: Manual voice activity detection
void manualVADExample(LiveSession session) {
  // Signal when user starts speaking
  session.signalActivityStart();

  // ... user speaks ...

  // Signal when user stops speaking
  session.signalActivityEnd();
}

/// Example: Session resumption
Future<void> resumeSessionExample(
  LiveClient liveClient,
  String resumptionToken,
) async {
  final session = await liveClient.resume(
    model: 'gemini-2.0-flash-live-001',
    resumptionToken: resumptionToken,
    liveConfig: LiveConfig(
      generationConfig: LiveGenerationConfig.textAndAudio(),
    ),
  );

  print('Session resumed! New session ID: ${session.sessionId}');
}
