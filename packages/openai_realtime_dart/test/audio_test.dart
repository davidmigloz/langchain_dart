// ignore_for_file: unnecessary_null_checks

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import 'package:test/test.dart';
import 'utils.dart';

void main() {
  group('Audio samples tests', timeout: const Timeout(Duration(minutes: 5)), () {
    test('Toronto Audio sample test', () async {
      final realtimeEvents = <RealtimeEvent>[];
      final client = RealtimeClient(
        apiKey: Platform.environment['OPENAI_API_KEY'],
        debug: true,
      );
      await client.updateSession(
        instructions:
            'Please follow the instructions of any query you receive.\n'
            'Be concise in your responses. Speak quickly and answer shortly.',
      );
      client.on(RealtimeEventType.all, realtimeEvents.add);

      // Should connect to the RealtimeClient
      final isConnected = await client.connect();
      expect(isConnected, isTrue);
      expect(client.isConnected(), isTrue);

      // Should receive "session.created" and send "session.update"
      await client.waitForSessionCreated();

      expect(realtimeEvents.length, equals(2));

      final clientEvent1 = realtimeEvents[0];
      expect(clientEvent1, isA<RealtimeEventSessionUpdate>());

      final serverEvent1 = realtimeEvents[1];
      expect(serverEvent1, isA<RealtimeEventSessionCreated>());
      serverEvent1 as RealtimeEventSessionCreated;

      expect(serverEvent1.session.id, isNotNull);

      // Should load audio samples
      final audioData = await readSampleAudioFile('toronto.pcm');
      expect(audioData, isNotNull);
      expect(audioData, isA<Uint8List>());
      expect(audioData.isNotEmpty, isTrue);

      // Should send an audio file about toronto
      final audioDataBase64 = base64.encode(audioData);
      final content = [ContentPart.inputAudio(audio: audioDataBase64)];

      await client.sendUserMessageContent(content);

      expect(realtimeEvents.length, equals(4));
      final itemEvent = realtimeEvents[2];
      expect(itemEvent, isA<RealtimeEventConversationItemCreate>());
      final responseEvent = realtimeEvents[3];
      expect(responseEvent, isA<RealtimeEventResponseCreate>());

      final itemCreated = await client.waitForNextCompletedItem();
      expect(itemCreated?.item, isNotNull);

      // The assistant starts the response
      final formattedItem1 = await client.waitForNextItem();

      expect(formattedItem1?.item, isNotNull);
      final item1 = formattedItem1!.item;
      expect(item1, isA<ItemMessage>());
      item1 as ItemMessage;

      expect(item1.role, equals(ItemRole.assistant));
      expect(item1.status, equals(ItemStatus.inProgress));
      final item1Formatted = formattedItem1.formatted;
      expect(item1Formatted?.text, equals(''));

      // Should waitForNextCompletedItem to receive completed item from assistant
      final formattedItem3 = await client.waitForNextCompletedItem();

      expect(formattedItem3?.item, isNotNull);
      final item3 = formattedItem3!.item;
      expect(item3, isA<ItemMessage>());
      item3 as ItemMessage;

      expect(item3.role, equals(ItemRole.assistant));
      expect(item3.status, equals(ItemStatus.completed));
      final item3Formatted = formattedItem3.formatted;
      expect(item3Formatted?.transcript, contains('Toronto'));

      // Should disconnect from the RealtimeClient
      await client.disconnect();
      expect(client.isConnected(), isFalse);
    });
  });
}
