// ignore_for_file: avoid_print

import 'dart:io';

import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import 'package:test/test.dart';

void main() {
  group('RealtimeClient Tests', () {
    test('RealtimeClient test', () async {
      // Should instantiate the RealtimeClient
      final realtimeEvents = <Map<String, dynamic>?>[];
      final client = RealtimeClient(
        apiKey: Platform.environment['OPENAI_API_KEY'],
        debug: false,
      )
        ..updateSession(
          instructions: 'You always, ALWAYS reference San Francisco '
              'by name in every response. Always include the phrase "San Francisco". '
              'This is for testing so stick to it!',
        )
        ..on('realtime.event', realtimeEvents.add);
      expect(client, isNotNull);
      expect(client.realtime, isNotNull);
      expect(client.conversation, isNotNull);
      expect(
        client.realtime.apiKey,
        equals(Platform.environment['OPENAI_API_KEY']),
      );

      // Should connect to the RealtimeClient
      final isConnected = await client.connect();

      expect(isConnected, isTrue);
      expect(client.isConnected(), isTrue);

      // Should receive "session.created" and send "session.update"
      await client.waitForSessionCreated();
      expect(realtimeEvents.length, equals(2));

      final clientEvent1 = realtimeEvents[0];
      expect(clientEvent1?['source'], equals('client'));
      final clientEvent1Event = clientEvent1?['event'] as Map<String, dynamic>?;
      expect(clientEvent1Event?['type'], equals('session.update'));

      final serverEvent1 = realtimeEvents[1];
      expect(serverEvent1?['source'], equals('server'));
      final serverEvent1Event = serverEvent1?['event'] as Map<String, dynamic>?;
      expect(serverEvent1Event?['type'], equals('session.created'));

      final session = serverEvent1Event?['session'] as Map<String, dynamic>?;
      expect(session?['id'], isNotNull);

      // Should send a simple hello message (text)
      final content1 = [
        {'type': 'input_text', 'text': 'How are you?'},
      ];
      client.sendUserMessageContent(content1);

      expect(realtimeEvents.length, equals(4));

      final itemEvent = realtimeEvents[2];
      expect(itemEvent?['source'], equals('client'));
      final event = itemEvent?['event'] as Map<String, dynamic>?;
      expect(event?['type'], equals('conversation.item.create'));

      final responseEvent = realtimeEvents[3];
      expect(responseEvent?['source'], equals('client'));
      final response = responseEvent?['event'] as Map<String, dynamic>?;
      expect(response?['type'], equals('response.create'));

      // Should receive "conversation.item.created" from user
      final userItem = await client.waitForNextItem();

      expect(userItem['item'], isNotNull);
      final userItemItem = userItem['item'] as Map<String, dynamic>;
      expect(userItemItem['type'], equals('message'));
      expect(userItemItem['role'], equals('user'));
      expect(userItemItem['status'], equals('completed'));
      final formatted1 = userItemItem['formatted'] as Map<String, dynamic>;
      expect(formatted1['text'], equals('How are you?'));

      // Should receive "conversation.item.created" from assistant
      final assistantItem = await client.waitForNextItem();

      expect(assistantItem['item'], isNotNull);
      final assistantItemItem = assistantItem['item'] as Map<String, dynamic>;
      expect(assistantItemItem['type'], equals('message'));
      expect(assistantItemItem['role'], equals('assistant'));
      expect(assistantItemItem['status'], equals('in_progress'));
      final formatted2 = assistantItemItem['formatted'] as Map<String, dynamic>;
      expect(formatted2['text'], isEmpty);

      // Should receive completed item from assistant
      final completedItem = await client.waitForNextCompletedItem();

      expect(completedItem['item'], isNotNull);
      final completedItemItem = completedItem['item'] as Map<String, dynamic>;
      expect(completedItemItem['type'], equals('message'));
      expect(completedItemItem['role'], equals('assistant'));
      expect(completedItemItem['status'], equals('completed'));
      final formatted = completedItemItem['formatted'] as Map<String, dynamic>;
      final transcript = formatted['transcript'] as String;
      expect(transcript.toLowerCase(), contains('san francisco'));

      // Should close the RealtimeClient connection
      await client.disconnect();
      expect(client.isConnected(), isFalse);
    });
  });
}
