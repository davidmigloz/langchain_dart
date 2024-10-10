import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import 'package:test/test.dart';
import 'utils.dart';

void main() {
  group('Audio samples tests', timeout: const Timeout(Duration(minutes: 5)),
      () {
    test('Toronto Audio sample test', () async {
      // Should connect to the RealtimeClient
      final realtimeEvents = <Map<String, dynamic>?>[];
      final client = RealtimeClient(
        apiKey: Platform.environment['OPENAI_API_KEY'],
        debug: false,
      )
        ..updateSession(
          instructions:
              'Please follow the instructions of any query you receive.\n'
              'Be concise in your responses. Speak quickly and answer shortly.',
        )
        ..on('realtime.event', realtimeEvents.add);

      final isConnected = await client.connect();
      expect(isConnected, isTrue);
      expect(client.isConnected(), isTrue);

      // Should receive "session.created" and send "session.update"
      await client.waitForSessionCreated();

      expect(realtimeEvents.length, equals(2));

      final clientEvent1 = realtimeEvents[0];
      expect(clientEvent1?['source'], equals('client'));
      final clientEventData1 = clientEvent1?['event'] as Map<String, dynamic>?;
      expect(clientEventData1?['type'], equals('session.update'));

      final serverEvent1 = realtimeEvents[1];
      expect(serverEvent1?['source'], equals('server'));
      final serverEventData1 = serverEvent1?['event'] as Map<String, dynamic>?;
      expect(serverEventData1?['type'], equals('session.created'));

      final session = serverEventData1?['session'] as Map<String, dynamic>?;
      expect(session?['id'], isNotNull);

      // Should load audio samples
      final audioData = await readSampleAudioFile('toronto.pcm');
      expect(audioData, isNotNull);
      expect(audioData, isA<Uint8List>());
      expect(audioData.isNotEmpty, isTrue);

      // Should send an audio file about toronto
      final audioDataBase64 = base64.encode(audioData);
      final content = [
        {'type': 'input_audio', 'audio': audioDataBase64},
      ];

      client.sendUserMessageContent(content);
      expect(realtimeEvents.length, equals(4));

      final itemEvent = realtimeEvents[2];
      expect(itemEvent?['source'], equals('client'));
      final itemEventData = itemEvent?['event'] as Map<String, dynamic>?;
      expect(itemEventData?['type'], equals('conversation.item.create'));

      final responseEvent = realtimeEvents[3];
      expect(responseEvent, isNotNull);
      expect(responseEvent?['source'], equals('client'));
      final responseEventData =
          responseEvent?['event'] as Map<String, dynamic>?;
      expect(responseEventData?['type'], equals('response.create'));

      // Should waitForNextItem to receive "conversation.item.created" from user
      final result1 = await client.waitForNextItem();
      final item1 = result1['item'] as Map<String, dynamic>?;

      expect(item1, isNotNull);
      expect(item1!['type'], equals('message'));
      expect(item1['role'], equals('user'));
      expect(item1['status'], equals('completed'));
      final item1Formatted = item1['formatted'] as Map<String, dynamic>?;
      expect(item1Formatted?['text'], equals(''));

      // Should waitForNextItem to receive "conversation.item.created" from assistant
      final result2 = await client.waitForNextItem();
      final item2 = result2['item'] as Map<String, dynamic>?;

      expect(item2, isNotNull);
      expect(item2!['type'], equals('message'));
      expect(item2['role'], equals('assistant'));
      expect(item2['status'], equals('in_progress'));
      final item2Formatted = item2['formatted'] as Map<String, dynamic>?;
      expect(item2Formatted?['text'], equals(''));

      // Should waitForNextCompletedItem to receive completed item from assistant
      final result3 = await client.waitForNextCompletedItem();
      final item3 = result3['item'] as Map<String, dynamic>?;

      expect(item3, isNotNull);
      expect(item3!['type'], equals('message'));
      expect(item3['role'], equals('assistant'));
      expect(item3['status'], equals('completed'));
      final item3Formatted = item3['formatted'] as Map<String, dynamic>?;
      final item3Transcript = item3Formatted?['transcript'] as String?;
      expect(item3Transcript?.toLowerCase(), contains('toronto'));

      // Should disconnect from the RealtimeClient
      await client.disconnect();
      expect(client.isConnected(), isFalse);
    });
  });
}
