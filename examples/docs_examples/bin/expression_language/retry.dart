import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:langchain_core/utils.dart';

void main() async {
  final input = PromptValue.string('Explain why sky is blue in 2 lines');

  final model = ChatOpenAI(
    defaultOptions: const ChatOpenAIOptions(model: 'gpt-4o0'),
  );

  final modelRetry = model.withRetry(RetryOptions(addJitter: true));

  final res = modelRetry.stream(input);
  //print(res);
  await res.forEach((e) => print(e.output.content));
}
