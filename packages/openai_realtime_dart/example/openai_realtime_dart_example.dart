// ignore_for_file: cascade_invocations, unused_local_variable
import 'dart:io';

import 'package:openai_realtime_dart/openai_realtime_dart.dart';

Future<void> main() async {
  final client = RealtimeClient(
    apiKey: Platform.environment['OPENAI_API_KEY'],
  );

  // Can set parameters ahead of connecting, either separately or all at once
  client.updateSession(instructions: 'You are a great, upbeat friend.');
  client.updateSession(voice: 'alloy');
  client.updateSession(
    turnDetection: {'type': 'none'},
    inputAudioTranscription: {'model': 'whisper-1'},
  );

  // Set up event handling
  client.on('conversation.updated', (event) {
    // item is the current item being updated
    final item = event?['item'];
    // delta can be null or populated
    final delta = event?['delta'];
    // you can fetch a full list of items at any time
  });

  // Connect to Realtime API
  await client.connect();

  // Send a item and triggers a generation
  client.sendUserMessageContent([
    {'type': 'input_text', 'text': 'How are you?'},
  ]);
}
