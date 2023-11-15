import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('ChatMessageHistory tests', () {
    test('Test addMessage and getMessages', () async {
      final history = ChatMessageHistory();
      final message = ChatMessage.humanText('This is a test');
      await history.addChatMessage(message);
      expect(await history.getChatMessages(), [message]);
    });

    test('Test addUserMessage', () async {
      final history = ChatMessageHistory();
      await history.addHumanChatMessage('This is a human msg');
      final messages = await history.getChatMessages();
      expect(messages.first, isA<HumanChatMessage>());
      expect(messages.first.contentAsString, 'This is a human msg');
    });

    test('Test addAIChatMessage', () async {
      final history = ChatMessageHistory();
      await history.addAIChatMessage('This is an AI msg');
      final messages = await history.getChatMessages();
      expect(messages.first, isA<AIChatMessage>());
      expect(messages.first.contentAsString, 'This is an AI msg');
    });

    test('Test removeLast', () async {
      final history = ChatMessageHistory();
      final message = ChatMessage.humanText('This is a test');
      final message2 = ChatMessage.ai('This is an AI msg');
      await history.addChatMessage(message);
      await history.addChatMessage(message2);
      final oldestMessage = await history.removeLast();
      expect(oldestMessage, isA<AIChatMessage>());
      expect(oldestMessage.contentAsString, 'This is an AI msg');
      final messages = await history.getChatMessages();
      expect(messages.length, 1);
      expect(messages.first, isA<HumanChatMessage>());
      expect(messages.first.contentAsString, 'This is a test');
    });

    test('Test removeFirst', () async {
      final history = ChatMessageHistory();
      final message = ChatMessage.humanText('This is a test');
      final message2 = ChatMessage.ai('This is an AI msg');
      await history.addChatMessage(message);
      await history.addChatMessage(message2);
      final oldestMessage = await history.removeFirst();
      expect(oldestMessage, isA<HumanChatMessage>());
      expect(oldestMessage.contentAsString, 'This is a test');
      final messages = await history.getChatMessages();
      expect(messages.length, 1);
      expect(messages.first, isA<AIChatMessage>());
      expect(messages.first.contentAsString, 'This is an AI msg');
    });

    test('Test clear', () async {
      final history = ChatMessageHistory();
      final message = ChatMessage.humanText('This is a test');
      await history.addChatMessage(message);
      await history.clear();
      expect(await history.getChatMessages(), <ChatMessage>[]);
    });
  });
}
