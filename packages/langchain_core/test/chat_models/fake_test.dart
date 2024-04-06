import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:test/test.dart';

void main() {
  group('FakeChatModel tests', () {
    test('Test model returns given responses', () async {
      final chatModel = FakeChatModel(responses: ['foo', 'bar']);
      final res1 = await chatModel.invoke(
        PromptValue.chat([ChatMessage.humanText('Hello')]),
      );
      expect(res1.outputAsString, 'foo');
      final res2 = await chatModel.invoke(
        PromptValue.chat([ChatMessage.humanText('World')]),
      );
      expect(res2.outputAsString, 'bar');
    });
  });
}
