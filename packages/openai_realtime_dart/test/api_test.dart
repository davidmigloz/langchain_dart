import 'dart:io';

import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import 'package:test/test.dart';

void main() {
  group('RealtimeAPI Tests', () {
    late RealtimeAPI realtime;

    setUp(() {
      realtime = RealtimeAPI(
        apiKey: Platform.environment['OPENAI_API_KEY'],
        debug: false,
      );
    });

    tearDown(() async {
      if (realtime.isConnected()) {
        await realtime.disconnect();
      }
    });

    test('Should instantiate the RealtimeAPI with no apiKey', () {
      final apiWithoutKey = RealtimeAPI(debug: false);
      expect(apiWithoutKey, isNotNull);
      expect(apiWithoutKey.apiKey, isNull);
    });

    test('Should fail to connect to the RealtimeAPI with no apiKey', () async {
      final apiWithoutKey = RealtimeAPI(debug: false);
      await apiWithoutKey.connect();

      final event = await apiWithoutKey.waitForNext(
        'server.error',
        timeout: const Duration(seconds: 1),
      );

      expect(event, isNotNull);
      expect(event?['error'], isNotNull);
      final error = event?['error'] as Map<String, dynamic>?;
      expect(error?['message'], contains('Missing bearer'));
    });

    test('Should instantiate the RealtimeAPI', () {
      expect(realtime, isNotNull);
      expect(realtime.apiKey, equals(Platform.environment['OPENAI_API_KEY']));
    });

    test('Should connect to the RealtimeAPI', () async {
      final isConnected = await realtime.connect();

      expect(isConnected, isTrue);
      expect(realtime.isConnected(), isTrue);
    });

    test('Should close the RealtimeAPI connection', () async {
      await realtime.connect();
      await realtime.disconnect();

      expect(realtime.isConnected(), isFalse);
    });

    test('Should handle multiple connections and disconnections', () async {
      for (int i = 0; i < 3; i++) {
        final isConnected = await realtime.connect();
        expect(isConnected, isTrue, reason: 'Connection $i failed');
        expect(realtime.isConnected(), isTrue, reason: 'Connection $i failed');

        await realtime.disconnect();
        expect(
          realtime.isConnected(),
          isFalse,
          reason: 'Disconnection $i failed',
        );
      }
    });

    test('Should receive server events', () async {
      await realtime.connect();

      final event = await realtime.waitForNext('server.session.created');
      expect(event, isNotNull);
      expect(event?['session'], isNotNull);
      final session = event?['session'] as Map<String, dynamic>;
      expect(session['id'], isNotNull);
    });

    test('Should receive server error events', () async {
      await realtime.connect();

      final testEvent = {
        'type': 'test_event',
        'data': {'message': 'Hello, World!'},
      };

      // Set up the listener before sending the event
      final eventFuture = realtime.waitForNext('server.error');

      realtime.send('test_event', testEvent['data'] as Map<String, dynamic>?);

      final receivedEvent = await eventFuture;
      expect(receivedEvent, isNotNull);
    });
  });
}
