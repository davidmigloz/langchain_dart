/// TESTING PHILOSOPHY:
/// 1. DO NOT catch exceptions - let them bubble up for diagnosis
/// 2. DO NOT add provider filtering except by capabilities (e.g. ProviderCaps)
/// 3. DO NOT add performance tests
/// 4. DO NOT add regression tests
/// 5. 80% cases = common usage patterns tested across ALL capable providers
/// 6. Edge cases = rare scenarios tested on Google only to avoid timeouts
/// 7. Each functionality should only be tested in ONE file - no duplication

import 'dart:async';

import 'package:langchain_compat/langchain_compat.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

void main() {
  group('Logging', () {
    group('basic logging setup (80% cases)', () {
      test('logging can be enabled globally', () {
        // Save current state
        final originalLevel = Logger.root.level;

        // Enable logging
        Logger.root.level = Level.ALL;
        expect(Logger.root.level, equals(Level.ALL));

        // Restore original state
        Logger.root.level = originalLevel;
      });

      test('logging can be configured per logger', () {
        final logger = Logger('TestLogger');

        // Configure specific logger
        logger.level = Level.WARNING;
        expect(logger.level, equals(Level.WARNING));

        // Reset
        logger.clearListeners();
      });

      test('log messages can be captured', () async {
        // Save current state
        final originalLevel = Logger.root.level;

        // Set up logging
        Logger.root.level = Level.ALL;
        final logs = <LogRecord>[];
        final subscription = Logger.root.onRecord.listen(logs.add);

        // Create a logger and log something
        final logger = Logger('TestLogger');
        logger.info('Test message');

        // Allow async processing
        await Future.delayed(Duration.zero);

        // Verify log was captured
        expect(logs, isNotEmpty);
        expect(logs.first.message, equals('Test message'));
        expect(logs.first.level, equals(Level.INFO));

        // Cleanup
        await subscription.cancel();
        Logger.root.level = originalLevel;
      });
    });

    group('provider logging (80% cases)', () {
      test('agent operations produce logs', () async {
        // Save current state
        final originalLevel = Logger.root.level;

        // Set up logging
        Logger.root.level = Level.ALL;
        final logs = <LogRecord>[];
        final subscription = Logger.root.onRecord.listen(logs.add);

        // Run an agent operation
        final agent = Agent('openai:gpt-4o-mini');
        await agent.run('Say "test"');

        // Allow async processing
        await Future.delayed(const Duration(milliseconds: 100));

        // Should have produced some logs
        expect(logs, isNotEmpty);

        // Cleanup
        await subscription.cancel();
        Logger.root.level = originalLevel;
      });

      test('streaming operations produce logs', () async {
        // Save current state
        final originalLevel = Logger.root.level;

        // Set up logging
        Logger.root.level = Level.ALL;
        final logs = <LogRecord>[];
        final subscription = Logger.root.onRecord.listen(logs.add);

        // Run a streaming operation
        final agent = Agent('openai:gpt-4o-mini');
        final chunks = <String>[];
        await for (final chunk in agent.runStream('Say "test"')) {
          chunks.add(chunk.output);
          if (chunks.length >= 3) break; // Limit chunks
        }

        // Allow async processing
        await Future.delayed(const Duration(milliseconds: 100));

        // Should have produced logs
        expect(logs, isNotEmpty);

        // Cleanup
        await subscription.cancel();
        Logger.root.level = originalLevel;
      });
    });

    group('log filtering (80% cases)', () {
      test('can filter logs by level', () async {
        // Save current state
        final originalLevel = Logger.root.level;

        // Set up logging with WARNING level
        Logger.root.level = Level.WARNING;
        final logs = <LogRecord>[];
        final subscription = Logger.root.onRecord.listen(logs.add);

        // Log at different levels
        final logger = Logger('TestLogger');
        logger.fine('Fine message'); // Should not appear
        logger.info('Info message'); // Should not appear
        logger.warning('Warning message'); // Should appear
        logger.severe('Severe message'); // Should appear

        // Allow async processing
        await Future.delayed(Duration.zero);

        // Only WARNING and above should be captured
        expect(logs.length, equals(2));
        expect(logs[0].message, equals('Warning message'));
        expect(logs[1].message, equals('Severe message'));

        // Cleanup
        await subscription.cancel();
        Logger.root.level = originalLevel;
      });

      test('can filter logs by logger name', () async {
        // Save current state
        final originalLevel = Logger.root.level;

        // Set up logging
        Logger.root.level = Level.ALL;
        final logs = <LogRecord>[];
        final subscription = Logger.root.onRecord
            .where((record) => record.loggerName.contains('Special'))
            .listen(logs.add);

        // Log from different loggers
        Logger('RegularLogger').info('Regular message');
        Logger('SpecialLogger').info('Special message');
        Logger('AnotherSpecialLogger').info('Another special message');

        // Allow async processing
        await Future.delayed(Duration.zero);

        // Only logs from loggers with 'Special' in name
        expect(logs.length, equals(2));
        expect(logs.every((log) => log.loggerName.contains('Special')), isTrue);

        // Cleanup
        await subscription.cancel();
        Logger.root.level = originalLevel;
      });
    });

    group('edge cases', () {
      test('handles high-volume logging', () async {
        // Save current state
        final originalLevel = Logger.root.level;

        // Set up logging
        Logger.root.level = Level.ALL;
        final logs = <LogRecord>[];
        final subscription = Logger.root.onRecord.listen(logs.add);

        // Generate many log messages rapidly
        final logger = Logger('HighVolumeLogger');
        for (var i = 0; i < 1000; i++) {
          logger.info('Message $i');
        }

        // Allow async processing
        await Future.delayed(const Duration(milliseconds: 100));

        // Should capture all logs
        expect(logs.length, equals(1000));

        // Cleanup
        await subscription.cancel();
        Logger.root.level = originalLevel;
      });

      test('handles concurrent logging', () async {
        // Save current state
        final originalLevel = Logger.root.level;

        // Set up logging
        Logger.root.level = Level.ALL;
        final logs = <LogRecord>[];
        final subscription = Logger.root.onRecord.listen(logs.add);

        // Log concurrently from multiple futures
        final futures = <Future>[];
        for (var i = 0; i < 10; i++) {
          futures.add(
            Future(() {
              final logger = Logger('ConcurrentLogger$i');
              for (var j = 0; j < 10; j++) {
                logger.info('Message $j from logger $i');
              }
            }),
          );
        }

        await Future.wait(futures);
        await Future.delayed(const Duration(milliseconds: 100));

        // Should capture all 100 logs
        expect(logs.length, equals(100));

        // Cleanup
        await subscription.cancel();
        Logger.root.level = originalLevel;
      });

      test('handles log exceptions gracefully', () async {
        // Save current state
        final originalLevel = Logger.root.level;

        // Set up logging with a listener that throws
        Logger.root.level = Level.ALL;
        var goodListenerCalled = 0;

        // Add a bad listener that throws
        final badSubscription = Logger.root.onRecord.listen((record) {
          throw Exception('Bad listener');
        });

        // Add a good listener
        final goodSubscription = Logger.root.onRecord.listen((record) {
          goodListenerCalled++;
        });

        // Log something
        final logger = Logger('TestLogger');
        logger.info('Test message');

        // Allow async processing
        await Future.delayed(Duration.zero);

        // Good listener should still be called
        expect(goodListenerCalled, greaterThan(0));

        // Cleanup
        await badSubscription.cancel();
        await goodSubscription.cancel();
        Logger.root.level = originalLevel;
      });

      test('handles null and empty log messages', () async {
        // Save current state
        final originalLevel = Logger.root.level;

        // Set up logging
        Logger.root.level = Level.ALL;
        final logs = <LogRecord>[];
        final subscription = Logger.root.onRecord.listen(logs.add);

        // Log empty and whitespace messages
        final logger = Logger('TestLogger');
        logger.info('');
        logger.info('   ');
        logger.info('\n\t');

        // Allow async processing
        await Future.delayed(Duration.zero);

        // Should capture all logs even if empty
        expect(logs.length, equals(3));

        // Cleanup
        await subscription.cancel();
        Logger.root.level = originalLevel;
      });
    });
  });
}
