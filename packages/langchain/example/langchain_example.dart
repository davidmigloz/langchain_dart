// ignore_for_file: avoid_print
import 'package:langchain/langchain.dart';

void main() async {
  final llm = FakeListLLM(
    responses: ['Why did the AI go on a diet? Because it had too many bytes!'],
  );
  final promptTemplate = PromptTemplate.fromTemplate(
    'tell me a joke about {subject}',
  );
  final prompt = promptTemplate.format({'subject': 'AI'});
  final result = await llm(prompt);
  print(result);
  // Why did the AI go on a diet? Because it had too many bytes!
}
