import 'package:langchain/src/memory/memory.dart';
import 'package:langchain/src/memory/token_buffer.dart';
import 'package:langchain/src/model_io/chat_models/chat_models.dart';
import 'package:langchain/src/model_io/llms/fake.dart';
import 'package:test/test.dart';

void main() {
  group('ConversationTokenBufferMemory tests', () {
    test('Test buffer memory', () async {
      const model = FakeEchoLLM();
      final memory = ConversationTokenBufferMemory(llm: model);
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
      const model = FakeEchoLLM();
      final memory = ConversationTokenBufferMemory(
        llm: model,
        returnMessages: true,
        maxTokenLimit: 4,
      );
      final result1 = await memory.loadMemoryVariables();
      expect(result1, {BaseMemory.defaultMemoryKey: <ChatMessage>[]});

      await memory.saveContext(
        inputValues: {'foo': 'bar'},
        outputValues: {'bar': 'foo'},
      );
      final expectedResult = [
        ChatMessage.human('bar'),
        ChatMessage.ai('foo'),
      ];
      final result2 = await memory.loadMemoryVariables();
      expect(result2, {BaseMemory.defaultMemoryKey: expectedResult});

      await memory.saveContext(
        inputValues: {'foo': 'bar1'},
        outputValues: {'bar': 'foo1'},
      );

      final expectedResult2 = [
        ChatMessage.ai('foo'),
        ChatMessage.human('bar1'),
        ChatMessage.ai('foo1'),
      ];
      final result3 = await memory.loadMemoryVariables();
      expect(result3, {BaseMemory.defaultMemoryKey: expectedResult2});
    });

    test('Test buffer memory with pre-loaded history', () async {
      final pastMessages = [
        ChatMessage.human("My name's Jonas"),
        ChatMessage.ai('Nice to meet you, Jonas!'),
      ];
      const model = FakeEchoLLM();
      final memory = ConversationTokenBufferMemory(
        llm: model,
        maxTokenLimit: 3,
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
  });
}
