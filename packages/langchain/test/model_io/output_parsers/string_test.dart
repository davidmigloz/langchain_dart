// ignore_for_file: unused_element
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('StringOutputParser tests', () {
    test('StringOutputParser from LLMResult', () async {
      const result = LLMResult(generations: [LLMGeneration('Hello world!')]);
      final res =
          await const StringOutputParser().parseResult(result.generations);
      expect(res, 'Hello world!');
    });

    test('StringOutputParser from ChatResult', () async {
      final result = ChatResult(
        generations: [ChatGeneration(ChatMessage.ai('Hello world!'))],
      );
      final res =
          await const StringOutputParser().parseResult(result.generations);
      expect(res, 'Hello world!');
    });
  });
}
