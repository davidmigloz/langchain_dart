import 'package:langchain/src/chat_models/chat_models.dart';
import 'package:langchain/src/memory/buffer_memory.dart';
import 'package:langchain/src/stores/message/in_memory.dart';
import 'package:test/test.dart';

void main() {
  group('ConversationBufferMemory tests', () {
    test('Test buffer memory', () async {
      final memory = ConversationBufferMemory();
      final result1 = await memory.loadMemoryVariables();
      expect(result1, {'history': ''});

      await memory.saveContext({'foo': 'bar'}, {'bar': 'foo'});
      const expectedString = 'Human: bar\nAI: foo';
      final result2 = await memory.loadMemoryVariables();
      expect(result2, {'history': expectedString});
    });

    test('Test buffer memory return messages', () async {
      final memory = ConversationBufferMemory(returnMessages: true);
      final result1 = await memory.loadMemoryVariables();
      expect(result1, {'history': <ChatMessage>[]});

      await memory.saveContext({'foo': 'bar'}, {'bar': 'foo'});
      final expectedResult = [
        ChatMessage.human('bar'),
        ChatMessage.ai('foo'),
      ];
      final result2 = await memory.loadMemoryVariables();
      expect(result2, {'history': expectedResult});
    });

    test('Test buffer memory with pre-loaded history', () async {
      final pastMessages = [
        ChatMessage.human("My name's Jonas"),
        ChatMessage.ai('Nice to meet you, Jonas!'),
      ];
      final memory = ConversationBufferMemory(
        returnMessages: true,
        chatHistory: ChatMessageHistory(messages: pastMessages),
      );
      final result = await memory.loadMemoryVariables();
      expect(result, {'history': pastMessages});
    });

    test('Test clear memory', () async {
      final memory = ConversationBufferMemory();
      await memory.saveContext({'foo': 'bar'}, {'bar': 'foo'});
      const expectedString = 'Human: bar\nAI: foo';
      final result1 = await memory.loadMemoryVariables();
      expect(result1, {'history': expectedString});

      memory.clear();
      final result2 = await memory.loadMemoryVariables();
      expect(result2, {'history': ''});
    });
  });
}
