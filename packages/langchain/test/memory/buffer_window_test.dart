import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('ConversationBufferWindowMemory tests', () {
    test('Test buffer memory', () async {
      final memory = ConversationBufferWindowMemory();
      final result1 = await memory.loadMemoryVariables();
      expect(result1, {'history': ''});

      await memory.saveContext(
        inputValues: {'foo': 'bar'},
        outputValues: {'bar': 'foo'},
      );
      const expectedString = 'Human: bar\nAI: foo';
      final result2 = await memory.loadMemoryVariables();
      expect(result2, {BaseMemory.defaultMemoryKey: expectedString});
    });

    test('Test buffer memory return messages', () async {
      final memory = ConversationBufferWindowMemory(k: 1, returnMessages: true);
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

      await memory.saveContext(
        inputValues: {'foo': 'bar1'},
        outputValues: {'bar': 'foo1'},
      );

      final expectedResult2 = [
        ChatMessage.humanText('bar1'),
        ChatMessage.ai('foo1'),
      ];
      final result3 = await memory.loadMemoryVariables();
      expect(result3, {BaseMemory.defaultMemoryKey: expectedResult2});
    });

    test('Test buffer memory with pre-loaded history', () async {
      final pastMessages = [
        ChatMessage.humanText("My name's Jonas"),
        ChatMessage.ai('Nice to meet you, Jonas!'),
      ];
      final memory = ConversationBufferWindowMemory(
        returnMessages: true,
        chatHistory: ChatMessageHistory(messages: pastMessages),
      );
      final result = await memory.loadMemoryVariables();
      expect(result, {BaseMemory.defaultMemoryKey: pastMessages});
    });

    test('Test k limit', () async {
      final m1 = ChatMessage.humanText("My name's Jonas");
      final m2 = ChatMessage.ai('Nice to meet you, Jonas!');
      final m3 = ChatMessage.humanText('What is your name?');
      final m4 = ChatMessage.ai("My name's GPT-3");
      final pastMessages = [m1, m2, m3, m4];
      // k = 0
      final memory0 = ConversationBufferWindowMemory(
        returnMessages: true,
        k: 0,
        chatHistory: ChatMessageHistory(messages: pastMessages),
      );
      final res0 = await memory0.loadMemoryVariables();
      expect(res0[BaseMemory.defaultMemoryKey], isEmpty);
      // k = 1
      final memory1 = ConversationBufferWindowMemory(
        returnMessages: true,
        k: 1,
        chatHistory: ChatMessageHistory(messages: pastMessages),
      );
      final res1 = await memory1.loadMemoryVariables();
      expect(
        res1[BaseMemory.defaultMemoryKey],
        equals([m3, m4]),
      );
      // k = 2
      final memory2 = ConversationBufferWindowMemory(
        returnMessages: true,
        k: 2,
        chatHistory: ChatMessageHistory(messages: pastMessages),
      );
      final res2 = await memory2.loadMemoryVariables();
      expect(
        res2[BaseMemory.defaultMemoryKey],
        equals([m1, m2, m3, m4]),
      );
      // k = 3
      final memory3 = ConversationBufferWindowMemory(
        returnMessages: true,
        k: 3,
        chatHistory: ChatMessageHistory(messages: pastMessages),
      );
      final res3 = await memory3.loadMemoryVariables();
      expect(
        res3[BaseMemory.defaultMemoryKey],
        equals([m1, m2, m3, m4]),
      );
    });

    test('Test clear memory', () async {
      final memory = ConversationBufferWindowMemory();
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
  });
}
