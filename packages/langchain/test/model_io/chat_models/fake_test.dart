import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('FakeChatModel tests', () {
    test('Test model returns given responses', () async {
      final chatModel = FakeChatModel(responses: ['foo', 'bar']);
      final res1 = await chatModel.generate([ChatMessage.humanText('Hello')]);
      expect(res1.firstOutputAsString, 'foo');
      final res2 = await chatModel.generate([ChatMessage.humanText('World')]);
      expect(res2.firstOutputAsString, 'bar');
    });
  });
}
