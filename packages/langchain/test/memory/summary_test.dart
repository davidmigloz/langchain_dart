import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('ConversationSummaryMemory tests', () {
    test('Test summary memory', () async {
      final model = FakeHandlerLLM(
        handler: (final prompt, final options, final callCount) {
          switch (callCount) {
            case 1:
              expect(
                prompt,
                'Progressively summarize the lines of conversation provided, adding onto the previous summary returning a new summary.\n\n'
                'EXAMPLE\n'
                'Current summary:\n'
                'The human asks what the AI thinks of artificial intelligence. The AI thinks artificial intelligence is a force for good.\n\n'
                'New lines of conversation:\n'
                'Human: Why do you think artificial intelligence is a force for good?\n'
                'AI: Because artificial intelligence will help humans reach their full potential.\n\n'
                'New summary:\n'
                'The human asks what the AI thinks of artificial intelligence. The AI thinks artificial intelligence is a force for good because it will help humans reach their full potential.\n'
                'END OF EXAMPLE\n\n'
                'Current summary:\n\n'
                '\n'
                'New lines of conversation:\n'
                'Human: bar\nAI: foo\n\n'
                'New summary:',
              );
              return 'Human said foo';
            default:
              throw TestFailure('Unexpected call count: $callCount');
          }
        },
      );
      final memory = ConversationSummaryMemory(llm: model);
      final result1 = await memory.loadMemoryVariables();
      expect(result1, {BaseMemory.defaultMemoryKey: ''});

      await memory.saveContext(
        inputValues: {'foo': 'bar'},
        outputValues: {'bar': 'foo'},
      );
      final result2 = await memory.loadMemoryVariables();
      expect(result2, {BaseMemory.defaultMemoryKey: 'System: Human said foo'});
    });

    test('Test summary memory return system messages', () async {
      final model = FakeHandlerLLM(
        handler: (final prompt, final options, final callCount) {
          switch (callCount) {
            case 1:
              expect(
                prompt,
                'Progressively summarize the lines of conversation provided, adding onto the previous summary returning a new summary.\n\n'
                'EXAMPLE\n'
                'Current summary:\n'
                'The human asks what the AI thinks of artificial intelligence. The AI thinks artificial intelligence is a force for good.\n\n'
                'New lines of conversation:\n'
                'Human: Why do you think artificial intelligence is a force for good?\n'
                'AI: Because artificial intelligence will help humans reach their full potential.\n\n'
                'New summary:\n'
                'The human asks what the AI thinks of artificial intelligence. The AI thinks artificial intelligence is a force for good because it will help humans reach their full potential.\n'
                'END OF EXAMPLE\n\n'
                'Current summary:\n\n'
                '\n'
                'New lines of conversation:\n'
                'Human: bar\nAI: foo\n\n'
                'New summary:',
              );
              return 'Human said foo';
            case 2:
              expect(
                prompt,
                'Progressively summarize the lines of conversation provided, adding onto the previous summary returning a new summary.\n\n'
                'EXAMPLE\n'
                'Current summary:\n'
                'The human asks what the AI thinks of artificial intelligence. The AI thinks artificial intelligence is a force for good.\n\n'
                'New lines of conversation:\n'
                'Human: Why do you think artificial intelligence is a force for good?\n'
                'AI: Because artificial intelligence will help humans reach their full potential.\n\n'
                'New summary:\n'
                'The human asks what the AI thinks of artificial intelligence. The AI thinks artificial intelligence is a force for good because it will help humans reach their full potential.\n'
                'END OF EXAMPLE\n\n'
                'Current summary:\nHuman said foo\n'
                '\n'
                'New lines of conversation:\n'
                'Human: bar1\nAI: foo1\n\n'
                'New summary:',
              );
              return 'Human said bar';
            default:
              throw TestFailure('Unexpected call count: $callCount');
          }
        },
      );
      final memory =
          ConversationSummaryMemory(llm: model, returnMessages: true);
      final result1 = await memory.loadMemoryVariables();
      expect(result1, {BaseMemory.defaultMemoryKey: <ChatMessage>[]});

      await memory.saveContext(
        inputValues: {'foo': 'bar'},
        outputValues: {'bar': 'foo'},
      );
      final expectedResult = [ChatMessage.system('Human said foo')];
      final result2 = await memory.loadMemoryVariables();
      expect(result2, {BaseMemory.defaultMemoryKey: expectedResult});

      await memory.saveContext(
        inputValues: {'foo': 'bar1'},
        outputValues: {'bar': 'foo1'},
      );

      final expectedResult2 = [ChatMessage.system('Human said bar')];
      final result3 = await memory.loadMemoryVariables();
      expect(result3, {BaseMemory.defaultMemoryKey: expectedResult2});
    });

    test('Test buffer memory with pre-loaded history', () async {
      const prompt = PromptTemplate(
        inputVariables: {'summary', 'new_lines'},
        template: 'Please summary {summary} with {new_lines}',
      );
      final model = FakeHandlerLLM(
        handler: (final prompt, final options, final callCount) {
          switch (callCount) {
            case 1:
              expect(
                prompt,
                "Please summary  with Human: My name's Jonas\nAI: Nice to meet you, Jonas!",
              );
              return 'Human said foo';
            default:
              throw TestFailure('Unexpected call count: $callCount');
          }
        },
      );
      final pastMessages = [
        ChatMessage.humanText("My name's Jonas"),
        ChatMessage.ai('Nice to meet you, Jonas!'),
      ];
      final memory = await ConversationSummaryMemory.fromMessages(
        llm: model,
        chatHistory: ChatMessageHistory(messages: pastMessages),
        summaryPromptTemplate: prompt,
      );
      final result = await memory.loadMemoryVariables();
      expect(result, {BaseMemory.defaultMemoryKey: 'System: Human said foo'});
    });

    test('Test clear memory', () async {
      const prompt = PromptTemplate(
        inputVariables: {'summary', 'new_lines'},
        template: 'Please summary {summary} with {new_lines}',
      );
      final model = FakeHandlerLLM(
        handler: (final prompt, final options, final callCount) {
          switch (callCount) {
            case 1:
              expect(
                prompt,
                'Please summary Human said bar with Human: bar\nAI: foo',
              );
              return 'Human said foo';
            default:
              throw TestFailure('Unexpected call count: $callCount');
          }
        },
      );
      final memory = ConversationSummaryMemory(
        llm: model,
        summaryPromptTemplate: prompt,
        initialSummary: 'Human said bar',
      );
      await memory.saveContext(
        inputValues: {'foo': 'bar'},
        outputValues: {'bar': 'foo'},
      );
      const expectedString = 'System: Human said foo';
      final result1 = await memory.loadMemoryVariables();
      expect(result1, {BaseMemory.defaultMemoryKey: expectedString});

      await memory.clear();
      final result2 = await memory.loadMemoryVariables();
      expect(result2, {BaseMemory.defaultMemoryKey: ''});
    });

    test('Test summaryMessageBuilder', () async {
      const prompt = PromptTemplate(
        inputVariables: {'summary', 'new_lines'},
        template: 'Please summary {summary} with {new_lines}',
      );
      final model = FakeHandlerLLM(
        handler: (final prompt, final options, final callCount) {
          switch (callCount) {
            case 1:
              expect(
                prompt,
                "Please summary  with Human: My name's Jonas\nAI: Nice to meet you, Jonas!",
              );
              return 'Human said foo';
            default:
              throw TestFailure('Unexpected call count: $callCount');
          }
        },
      );
      final memory = ConversationSummaryMemory(
        llm: model,
        summaryPromptTemplate: prompt,
        summaryMessageBuilder: ChatMessage.ai,
      );
      await memory.saveContext(
        inputValues: {'foo': "My name's Jonas"},
        outputValues: {'bar': 'Nice to meet you, Jonas!'},
      );
      final result = await memory.loadMemoryVariables();
      expect(result, {BaseMemory.defaultMemoryKey: 'AI: Human said foo'});
    });
  });
}
