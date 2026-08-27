import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:test/test.dart';

void main() {
  const placeholder = MessagePlaceholder(variableName: 'input');

  test('accepts a single chat message', () {
    final message = ChatMessage.humanText('hello');

    expect(placeholder.formatMessages({'input': message}), [message]);
  });

  test('accepts an ordered list of chat messages', () {
    final messages = <ChatMessage>[
      ChatMessage.tool(toolCallId: 'call-1', content: 'one'),
      ChatMessage.tool(toolCallId: 'call-2', content: 'two'),
    ];

    expect(placeholder.formatMessages({'input': messages}), messages);
  });

  test('rejects unrelated values', () {
    expect(
      () => placeholder.formatMessages({'input': 'hello'}),
      throwsArgumentError,
    );
  });
}
