// ignore_for_file: cascade_invocations, unused_local_variable
import 'dart:io';

import 'package:openai_realtime_dart/openai_realtime_dart.dart';

Future<void> main() async {
  final client = RealtimeClient(
    apiKey: Platform.environment['OPENAI_API_KEY'],
  );

  // Can set parameters ahead of connecting, either separately or all at once
  await client.updateSession(instructions: 'You are a great, upbeat friend.');
  await client.updateSession(voice: Voice.alloy);
  await client.updateSession(
    turnDetection: null,
    inputAudioTranscription: const InputAudioTranscriptionConfig(
      model: 'whisper-1',
    ),
  );

  // Set up event handling
  client.on(RealtimeEventType.conversationUpdated, (e) {
    final event = e as RealtimeEventConversationUpdated;
    // item is the current item being updated
    final item = event.result.item;
    // delta can be null or populated
    final delta = event.result.delta;
    // you can fetch a full list of items at any time
  });

  // Connect to Realtime API
  // You can specify a custom model if needed
  // await client.connect(model: 'gpt-4o-mini-realtime-preview');
  await client.connect();

  // Send a item and triggers a generation
  await client.sendUserMessageContent(const [
    ContentPart.text(text: 'How are you?'),
  ]);
}
