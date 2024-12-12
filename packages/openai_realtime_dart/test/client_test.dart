import 'dart:convert';
import 'dart:io';

import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import 'package:test/test.dart';

void main() {
  group('RealtimeClient Tests', () {
    test('RealtimeClient test', () async {
      final realtimeEvents = <RealtimeEvent>[];
      final client = RealtimeClient(
        apiKey: Platform.environment['OPENAI_API_KEY'],
        debug: true,
      );
      await client.updateSession(
        instructions: 'You always, ALWAYS reference San Francisco '
            'by name in every response. Always include the phrase "San Francisco". '
            'This is for testing so stick to it!',
      );
      client.on(RealtimeEventType.all, realtimeEvents.add);

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
      expect(clientEvent1, isA<RealtimeEventSessionUpdate>());

      final serverEvent1 = realtimeEvents[1];
      expect(serverEvent1, isA<RealtimeEventSessionCreated>());
      serverEvent1 as RealtimeEventSessionCreated;

      expect(serverEvent1.session.id, isNotNull);

      // Should send a simple hello message (text)
      final content1 = [
        const ContentPart.text(text: 'How are you?'),
      ];
      await client.sendUserMessageContent(content1);

      expect(realtimeEvents.length, equals(4));
      final itemEvent = realtimeEvents[2];
      expect(itemEvent, isA<RealtimeEventConversationItemCreate>());
      final responseEvent = realtimeEvents[3];
      expect(responseEvent, isA<RealtimeEventResponseCreate>());

      // The assistant starts the response
      final assistantItem = await client.waitForNextItem();

      expect(assistantItem?.item, isNotNull);
      final assistantItemItem = assistantItem!.item as ItemMessage;
      expect(assistantItemItem.type, equals(ItemType.message));
      expect(assistantItemItem.role, equals(ItemRole.assistant));
      expect(assistantItemItem.status, equals(ItemStatus.inProgress));
      final formatted2 = assistantItem.formatted;
      expect(formatted2?.text, isEmpty);

      // Should receive completed item from assistant
      final completedItem = await client.waitForNextCompletedItem();

      expect(completedItem?.item, isNotNull);
      final completedItemItem = completedItem!.item as ItemMessage;
      expect(completedItemItem.type, equals(ItemType.message));
      expect(completedItemItem.role, equals(ItemRole.assistant));
      expect(completedItemItem.status, equals(ItemStatus.completed));
      final formatted = completedItem.formatted;
      expect(formatted?.transcript.toLowerCase(), contains('san francisco'));

      // Should close the RealtimeClient connection
      await client.disconnect();
      expect(client.isConnected(), isFalse);
    });

    test('Tool calling test', timeout: const Timeout(Duration(minutes: 5)),
        () async {
      final realtimeEvents = <RealtimeEvent>[];
      var toolCalled = false;
      final client = RealtimeClient(
        apiKey: Platform.environment['OPENAI_API_KEY'],
        debug: true,
      );
      await client.addTool(
        const ToolDefinition(
          name: 'get_weather',
          description: 'Retrieves the weather for a location '
              'given its latitude and longitude coordinate pair.',
          parameters: {
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
        ),
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
      );
      client.on(RealtimeEventType.all, realtimeEvents.add);

      final isConnected = await client.connect();
      expect(isConnected, isTrue);

      // Should receive "session.created" and send "session.update"
      await client.waitForSessionCreated();
      expect(realtimeEvents.length, equals(2));

      // Send user message
      const content1 = [
        ContentPart.inputText(
          text: "What's the current weather in San Francisco, CA?",
        ),
      ];
      await client.sendUserMessageContent(content1);

      expect(realtimeEvents.length, equals(4));

      final itemEvent = realtimeEvents[2];
      expect(itemEvent, isA<RealtimeEventConversationItemCreate>());

      final responseEvent = realtimeEvents[3];
      expect(responseEvent, isA<RealtimeEventResponseCreate>());

      final itemCreated = await client.waitForNextCompletedItem();
      expect(itemCreated?.item, isNotNull);

      // Should receive "function_call" from assistant
      final aItem1 = await client.waitForNextCompletedItem();
      expect(aItem1?.item, isNotNull);
      final aItem1Data = aItem1!.item as ItemFunctionCall;
      expect(aItem1Data.type, equals(ItemType.functionCall));
      expect(aItem1Data.status, equals(ItemStatus.completed));
      expect(aItem1Data.name, equals('get_weather'));
      expect(aItem1Data.arguments, isNotNull);
      final aItem1Args =
          jsonDecode(aItem1Data.arguments) as Map<String, dynamic>;
      expect(aItem1Args['lat'], isNotNull);
      expect(aItem1Args['lng'], isNotNull);

      // Should sent "function_call_output" to assistant
      final fItem1 = await client.waitForNextCompletedItem();
      expect(fItem1?.item, isNotNull);
      final fItem1Data = fItem1!.item as ItemFunctionCallOutput;
      expect(fItem1Data.type, equals(ItemType.functionCallOutput));
      expect(fItem1Data.callId, isNotEmpty);
      expect(fItem1Data.output, isNotEmpty);
      expect(toolCalled, isTrue);

      // Should receive response from assistant
      final aItem2 = await client.waitForNextCompletedItem();
      expect(aItem2?.item, isNotNull);
      final aItem2Data = aItem2!.item as ItemMessage;
      expect(aItem2Data.type, equals(ItemType.message));
      expect(aItem1Data.status, equals(ItemStatus.completed));
      expect(aItem2Data.role, equals(ItemRole.assistant));
      final aItem2Formatted = aItem2.formatted;
      expect(aItem2Formatted?.transcript, isNotEmpty);

      // Should close the RealtimeClient connection
      await client.disconnect();
      expect(client.isConnected(), isFalse);
    });
  });
}
