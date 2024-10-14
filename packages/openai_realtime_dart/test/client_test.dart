// ignore_for_file: avoid_print

import 'dart:convert';
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

    test('Tool calling test', timeout: const Timeout(Duration(minutes: 5)),
        () async {
      final realtimeEvents = <Map<String, dynamic>?>[];
      bool toolCalled = false;
      final client = RealtimeClient(
        apiKey: Platform.environment['OPENAI_API_KEY'],
        debug: true,
      )
        ..addTool(
          {
            'name': 'get_weather',
            'description': 'Retrieves the weather for a location '
                'given its latitude and longitude coordinate pair.',
            'parameters': {
              'type': 'object',
              'properties': {
                'lat': {
                  'type': 'number',
                  'description': 'Latitude of the location',
                },
                'lng': {
                  'type': 'number',
                  'description': 'Longitude of the location',
                },
              },
              'required': ['lat', 'lng'],
            },
          },
          (Map<String, dynamic> params) async {
            toolCalled = true;
            final result = await HttpClient()
                .getUrl(
                  Uri.parse(
                    'https://api.open-meteo.com/v1/forecast?'
                    'latitude=${params['lat']}&'
                    'longitude=${params['lng']}&'
                    'current=temperature_2m,wind_speed_10m',
                  ),
                )
                .then((request) => request.close())
                .then((res) => res.transform(const Utf8Decoder()).join())
                .then(jsonDecode);
            return result;
          },
        )
        ..on('realtime.event', realtimeEvents.add);

      final isConnected = await client.connect();
      expect(isConnected, isTrue);

      // Should receive "session.created" and send "session.update"
      await client.waitForSessionCreated();
      expect(realtimeEvents.length, equals(2));

      // Send user message
      final content1 = [
        {
          'type': 'input_text',
          'text': "What's the current weather in San Francisco, CA?",
        },
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

      // Wait for user message to be received
      final uItem1 = await client.waitForNextItem();

      expect(uItem1['item'], isNotNull);
      final uItem1Data = uItem1['item'] as Map<String, dynamic>;
      expect(uItem1Data['type'], equals('message'));
      expect(uItem1Data['role'], equals('user'));
      expect(uItem1Data['status'], equals('completed'));
      final uItem1Formatted = uItem1Data['formatted'] as Map<String, dynamic>;
      expect(uItem1Formatted['text'], isNotEmpty);

      // Should receive "function_call" from assistant
      final aItem1 = await client.waitForNextCompletedItem();
      expect(aItem1['item'], isNotNull);
      final aItem1Data = aItem1['item'] as Map<String, dynamic>;
      expect(aItem1Data['type'], equals('function_call'));
      expect(aItem1Data['status'], equals('completed'));
      expect(aItem1Data['name'], equals('get_weather'));
      expect(aItem1Data['arguments'], isNotNull);
      final aItem1Args =
          jsonDecode(aItem1Data['arguments'] as String) as Map<String, dynamic>;
      expect(aItem1Args['lat'], isNotNull);
      expect(aItem1Args['lng'], isNotNull);

      // Should sent "function_call_output" to assistant
      final fItem1 = await client.waitForNextCompletedItem();
      expect(fItem1['item'], isNotNull);
      final fItem1Data = fItem1['item'] as Map<String, dynamic>;
      expect(fItem1Data['type'], equals('function_call_output'));
      expect(fItem1Data['status'], equals('completed'));
      expect(fItem1Data['call_id'], isNotEmpty);
      expect(fItem1Data['output'], isNotEmpty);
      expect(toolCalled, isTrue);

      // Should receive response from assistant
      final aItem2 = await client.waitForNextCompletedItem();
      expect(aItem2['item'], isNotNull);
      final aItem2Data = aItem2['item'] as Map<String, dynamic>;
      expect(aItem2Data['type'], equals('message'));
      expect(aItem1Data['status'], equals('completed'));
      expect(aItem2Data['role'], equals('assistant'));
      final aItem2Formatted = aItem2Data['formatted'] as Map<String, dynamic>;
      expect(aItem2Formatted['transcript'], isNotEmpty);

      // Should close the RealtimeClient connection
      await client.disconnect();
      expect(client.isConnected(), isFalse);
    });
  });
}
