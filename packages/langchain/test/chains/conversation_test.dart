import 'package:langchain/src/chains/conversation.dart';
import 'package:langchain/src/model_io/llms/fake.dart';
import 'package:langchain/src/model_io/prompts/prompts.dart';
import 'package:test/test.dart';

void main() {
  group('ConversationChain tests', () {
    test('Test conversation chain works', () async {
      const llm = FakeEchoLLM();
      final chain = ConversationChain(
        llm: llm,
      );

      final prompt = chain.prompt as PromptTemplate;
      final template = prompt.template;

      const userInput1 = 'Hello';
      final expectedRes1 = template
          .replaceAll('{history}', '')
          .replaceAll('{input}', userInput1);
      final res1 = await chain.run(userInput1);
      expect(res1, expectedRes1);

      const userInput2 = 'World';
      final expectedRes2 = template
          .replaceAll('{history}', 'Human: $userInput1\nAI: $expectedRes1')
          .replaceAll('{input}', userInput2);
      final res2 = await chain.run(userInput2);
      expect(res2, expectedRes2);
    });
  });
}
