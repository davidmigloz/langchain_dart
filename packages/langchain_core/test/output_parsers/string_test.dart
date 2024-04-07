// ignore_for_file: unused_element
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/llms.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:test/test.dart';

void main() {
  group('StringOutputParser tests', () {
    test('StringOutputParser from LLMResult', () async {
      const result = LLMResult(
        id: 'id',
        output: 'Hello world!',
        finishReason: FinishReason.stop,
        metadata: {},
        usage: LanguageModelUsage(),
      );
      final res = await const StringOutputParser().invoke(result);
      expect(res, 'Hello world!');
    });

    test('StringOutputParser from ChatResult', () async {
      const result = ChatResult(
        id: 'id',
        output: AIChatMessage(content: 'Hello world!'),
        finishReason: FinishReason.stop,
        metadata: {},
        usage: LanguageModelUsage(),
      );
      final res = await const StringOutputParser().invoke(result);
      expect(res, 'Hello world!');
    });
  });
}
