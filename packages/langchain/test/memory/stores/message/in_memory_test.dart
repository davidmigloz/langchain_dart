import 'package:langchain/src/memory/stores/stores.dart';
import 'package:langchain/src/model_io/chat_models/chat_models.dart';
import 'package:test/test.dart';

void main() {
  group('ChatMessageHistory tests', () {
    test('Test addMessage and getMessages', () async {
      final history = ChatMessageHistory();
      final message = ChatMessage.human('This is a test');
      history.addChatMessage(message);
      expect(await history.getChatMessages(), [message]);
    });

    test('Test addUserMessage', () async {
      final history = ChatMessageHistory()
        ..addUserChatMessage('This is a human msg');
      final messages = await history.getChatMessages();
      expect(messages.first, isA<HumanChatMessage>());
      expect(messages.first.content, 'This is a human msg');
    });

    test('Test addAIChatMessage', () async {
      final history = ChatMessageHistory()
        ..addAIChatMessage('This is an AI msg');
      final messages = await history.getChatMessages();
      expect(messages.first, isA<AIChatMessage>());
      expect(messages.first.content, 'This is an AI msg');
    });

    test('Test clear', () async {
      final history = ChatMessageHistory();
      final message = ChatMessage.human('This is a test');
      history
        ..addChatMessage(message)
        ..clear();
      expect(await history.getChatMessages(), <ChatMessage>[]);
    });
  });
}
