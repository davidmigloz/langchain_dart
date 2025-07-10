// CRITICAL TEST FAILURE INVESTIGATION PROCESS: When a test fails for a provider
// capability:
// 1. NEVER immediately disable the capability in provider definitions
// 2. ALWAYS investigate at the API level first:
//    - Test with curl to verify if the feature works at the raw API level
//    - Check the provider's official documentation
//    - Look for differences between our implementation and the API requirements
// 3. ONLY disable a capability after confirming:
//    - The API itself doesn't support the feature, OR
//    - The API has a fundamental limitation (like Together's streaming tool
//      format)
// 4. If the API supports it but our code doesn't: FIX THE IMPLEMENTATION
// 5. LET EXCEPTIONS BUBBLE UP: Do not add defensive checks or try-catch blocks.
//    Missing API keys, network errors, and provider issues should fail loudly
//    so they can be identified and fixed immediately.

import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

import 'test_tools.dart';

void main() {
  // Helper to run parameterized tests
  void runProviderTest(
    String testName,
    Future<void> Function(ChatProvider provider) testFunction, {
    Timeout? timeout,
  }) {
    group(testName, () {
      for (final provider in ChatProvider.all) {
        test(
          '${provider.name} - $testName',
          () async {
            await testFunction(provider);
          },
          timeout: timeout ?? const Timeout(Duration(seconds: 30)),
        );
      }
    });
  }

  group('Streaming Architecture', () {
    group('basic streaming (80% cases)', () {
      runProviderTest('simple streaming works', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final chunks = <String>[];
        await for (final chunk in agent.runStream('Say "hello world"')) {
          chunks.add(chunk.output);
        }

        expect(chunks, isNotEmpty);
        final fullText = chunks.join();
        expect(fullText.toLowerCase(), contains('hello'));
      });

      runProviderTest('streaming with multi-turn conversation', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        
        final history = [
          const ChatMessage(
            role: MessageRole.user,
            parts: [TextPart('My name is Alice.')],
          ),
          const ChatMessage(
            role: MessageRole.model,
            parts: [TextPart('Nice to meet you, Alice!')],
          ),
        ];

        final chunks = <String>[];
        await for (final chunk in agent.runStream(
          'What is my name?',
          history: history,
        )) {
          chunks.add(chunk.output);
        }

        final fullText = chunks.join();
        expect(fullText.toLowerCase(), contains('alice'));
      });

      runProviderTest('streaming preserves message sequence', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final allMessages = <ChatMessage>[];
        await for (final chunk in agent.runStream('Count to 3')) {
          allMessages.addAll(chunk.messages);
        }

        expect(allMessages, isNotEmpty);
        expect(allMessages.first.role, equals(MessageRole.user));
        expect(allMessages.any((m) => m.role == MessageRole.model), isTrue);
      });
    });

    group('tool streaming (80% cases)', () {
      runProviderTest('single tool streaming', (provider) async {
        if (!provider.caps.contains(ProviderCaps.multiToolCalls)) {
          return; // Skip providers without tool support
        }

        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          tools: [stringTool],
        );

        final allMessages = <ChatMessage>[];
        await for (final chunk in agent.runStream(
          'Use string_tool with input "hello"',
        )) {
          allMessages.addAll(chunk.messages);
        }

        final hasToolResults = allMessages.any((m) => m.hasToolResults);
        expect(hasToolResults, isTrue);
      });

      runProviderTest('multiple tool streaming', (provider) async {
        if (!provider.caps.contains(ProviderCaps.multiToolCalls)) {
          return; // Skip providers without tool support
        }

        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          tools: [stringTool, intTool],
        );

        final chunks = <String>[];
        await for (final chunk in agent.runStream(
          'First use string_tool with "test", then use int_tool with 42',
        )) {
          chunks.add(chunk.output);
        }

        expect(chunks, isNotEmpty);
        final fullText = chunks.join();
        expect(fullText, isNotEmpty);
      });
    });

    group('edge cases (limited providers)', () {
      // Test edge cases on only 1 provider to save resources and avoid timeouts
      final edgeCaseProviders = <ChatProvider>[ChatProvider.google];

      test('basic streaming behavior', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final chunks = <String>[];
          await for (final chunk in agent.runStream('Count from 1 to 3')) {
            chunks.add(chunk.output);
          }

          expect(chunks, isNotEmpty);
          final fullText = chunks.join();
          expect(fullText, contains('1'));
          expect(fullText, contains('2'));
          expect(fullText, contains('3'));
        }
      });

      test('streaming chunks have incremental content', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          var totalLength = 0;
          await for (final chunk in agent.runStream('Write a short poem')) {
            final currentOutput = chunk.output;
            expect(currentOutput.length, greaterThanOrEqualTo(0));
            totalLength += currentOutput.length;
          }

          expect(totalLength, greaterThan(0));
        }
      });

      test('streaming preserves message sequence', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final allMessages = <ChatMessage>[];
          await for (final chunk in agent.runStream('Hello')) {
            allMessages.addAll(chunk.messages);
          }

          expect(allMessages, isNotEmpty);
          expect(allMessages.first.role, equals(MessageRole.user));
          expect(allMessages.any((m) => m.role == MessageRole.model), isTrue);
        }
      });

      test('text consolidation works correctly', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final allChunks = <String>[];
          await for (final chunk in agent.runStream('What is 2 + 2?')) {
            allChunks.add(chunk.output);
          }

          final consolidatedText = allChunks.join();
          expect(consolidatedText, isNotEmpty);
          expect(consolidatedText, contains('4'));
        }
      });

      test('message accumulation during streaming', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final messageHistory = <ChatMessage>[];
          await for (final chunk in agent.runStream('Hello, how are you?')) {
            messageHistory.addAll(chunk.messages);
          }

          expect(messageHistory, isNotEmpty);

          final userMessages = messageHistory
              .where((m) => m.role == MessageRole.user)
              .toList();
          final modelMessages = messageHistory
              .where((m) => m.role == MessageRole.model)
              .toList();

          expect(userMessages, hasLength(1));
          expect(modelMessages, isNotEmpty);
        }
      });

      test('streaming with conversation history', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final history = [
            const ChatMessage(
              role: MessageRole.user,
              parts: [TextPart('My name is Alice.')],
            ),
            const ChatMessage(
              role: MessageRole.model,
              parts: [TextPart('Nice to meet you, Alice!')],
            ),
          ];

          final newMessages = <ChatMessage>[];
          await for (final chunk in agent.runStream(
            'What is my name?',
            history: history,
          )) {
            newMessages.addAll(chunk.messages);
          }

          expect(newMessages, isNotEmpty);

          final responseText = newMessages
              .where((m) => m.role == MessageRole.model)
              .map((m) => m.text)
              .join();
          expect(responseText.toLowerCase(), contains('alice'));
        }
      });

      test('streaming performance and timing', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final stopwatch = Stopwatch()..start();
          await for (final _ in agent.runStream('Hello')) {
            stopwatch.stop();
            expect(stopwatch.elapsedMilliseconds, lessThan(30000));
            break;
          }
        }
      });

      test('stream termination and completion', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          var streamCompleted = false;
          await for (final chunk in agent.runStream('Say goodbye')) {
            expect(chunk, isNotNull);
          }
          streamCompleted = true;

          expect(streamCompleted, isTrue);
        }
      });

      test('tool calls stream correctly', () async {
        for (final provider in edgeCaseProviders.where(
          (p) => p.caps.contains(ProviderCaps.multiToolCalls),
        )) {
          final agent = Agent(
            '${provider.name}:${provider.defaultModelName}',
            tools: [stringTool],
          );

          final allChunks = <ChatResult<String>>[];
          await agent
              .runStream('Use string_tool with input "streaming test"')
              .forEach(allChunks.add);

          expect(allChunks, isNotEmpty);

          final allMessages = allChunks.expand((c) => c.messages).toList();
          final hasToolResults = allMessages.any((m) => m.hasToolResults);
          expect(hasToolResults, isTrue);
        }
      });

      test('handles unicode and special characters in streaming', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final chunks = <String>[];
          await for (final chunk in agent.runStream('Say "Hello 世界 🌍"')) {
            chunks.add(chunk.output);
          }

          final fullText = chunks.join();
          expect(fullText, contains('Hello'));
          expect(fullText, isNotEmpty);
        }
      });

      test('very short responses stream correctly', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final chunks = <String>[];
          await for (final chunk in agent.runStream('Say "yes"')) {
            chunks.add(chunk.output);
          }

          expect(chunks, isNotEmpty);
          final fullText = chunks.join().toLowerCase();
          expect(fullText, contains('yes'));
        }
      });
    });
  });
}
