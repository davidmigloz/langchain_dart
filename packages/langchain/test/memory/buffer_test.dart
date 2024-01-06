import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('ConversationBufferMemory tests', () {
    test('Test buffer memory', () async {
      final memory = ConversationBufferMemory();
      final result1 = await memory.loadMemoryVariables();
      expect(result1, {BaseMemory.defaultMemoryKey: ''});

      await memory.saveContext(
        inputValues: {'foo': 'bar'},
        outputValues: {'bar': 'foo'},
      );
      const expectedString = 'Human: bar\nAI: foo';
      final result2 = await memory.loadMemoryVariables();
      expect(result2, {BaseMemory.defaultMemoryKey: expectedString});
    });

    test('Test buffer memory return messages', () async {
      final memory = ConversationBufferMemory(returnMessages: true);
      final result1 = await memory.loadMemoryVariables();
      expect(result1, {BaseMemory.defaultMemoryKey: <ChatMessage>[]});

      await memory.saveContext(
        inputValues: {'foo': 'bar'},
        outputValues: {'bar': 'foo'},
      );
      final expectedResult = [
        ChatMessage.humanText('bar'),
        ChatMessage.ai('foo'),
      ];
      final result2 = await memory.loadMemoryVariables();
      expect(result2, {BaseMemory.defaultMemoryKey: expectedResult});
    });

    test('Test chat message as input and output', () async {
      final memory = ConversationBufferMemory(returnMessages: true);
      final result1 = await memory.loadMemoryVariables();
      expect(result1, {BaseMemory.defaultMemoryKey: <ChatMessage>[]});

      await memory.saveContext(
        inputValues: {'foo': ChatMessage.function(name: 'foo', content: 'bar')},
        outputValues: {'bar': ChatMessage.ai('baz')},
      );
      final expectedResult = [
        ChatMessage.function(name: 'foo', content: 'bar'),
        ChatMessage.ai('baz'),
      ];
      final result2 = await memory.loadMemoryVariables();
      expect(result2, {BaseMemory.defaultMemoryKey: expectedResult});
    });

    test('Test buffer memory with pre-loaded history', () async {
      final pastMessages = [
        ChatMessage.humanText("My name's Jonas"),
        ChatMessage.ai('Nice to meet you, Jonas!'),
      ];
      final memory = ConversationBufferMemory(
        returnMessages: true,
        chatHistory: ChatMessageHistory(messages: pastMessages),
      );
      final result = await memory.loadMemoryVariables();
      expect(result, {BaseMemory.defaultMemoryKey: pastMessages});
    });

    test('Test clear memory', () async {
      final memory = ConversationBufferMemory();
      await memory.saveContext(
        inputValues: {'foo': 'bar'},
        outputValues: {'bar': 'foo'},
      );
      const expectedString = 'Human: bar\nAI: foo';
      final result1 = await memory.loadMemoryVariables();
      expect(result1, {BaseMemory.defaultMemoryKey: expectedString});

      await memory.clear();
      final result2 = await memory.loadMemoryVariables();
      expect(result2, {BaseMemory.defaultMemoryKey: ''});
    });

    test('Test reserved keys are ignored when selecting prompt input keys',
        () async {
      final memory = ConversationBufferMemory(returnMessages: true);
      await memory.saveContext(
        inputValues: {
          'foo': 'bar',
          'stop': 'stop',
          BaseActionAgent.agentScratchpadInputKey: 'baz',
        },
        outputValues: {'bar': 'foo'},
      );
      final expectedResult = [
        ChatMessage.humanText('bar'),
        ChatMessage.ai('foo'),
      ];
      final result1 = await memory.loadMemoryVariables();
      expect(result1, {BaseMemory.defaultMemoryKey: expectedResult});
    });

    test('Test multiple input values with inputKey specified', () async {
      final memory = ConversationBufferMemory(
        returnMessages: true,
        inputKey: 'foo2',
      );
      await memory.saveContext(
        inputValues: {
          'foo1': 'bar1',
          'foo2': 'bar2',
          BaseActionAgent.agentScratchpadInputKey: 'baz',
        },
        outputValues: {'bar': 'foo'},
      );
      final expectedResult = [
        ChatMessage.humanText('bar2'),
        ChatMessage.ai('foo'),
      ];
      final result1 = await memory.loadMemoryVariables();
      expect(result1, {BaseMemory.defaultMemoryKey: expectedResult});
    });

    test(
        'Test error is thrown if inputKey not specified when using with '
        'multiple input values', () async {
      final memory = ConversationBufferMemory(returnMessages: true);

      // expect throws exception if no input keys are selected
      expect(
        () async => memory.saveContext(
          inputValues: {
            'foo1': 'bar1',
            'foo2': 'bar2',
          },
          outputValues: {'bar': 'foo'},
        ),
        throwsException,
      );
    });
  });
}
