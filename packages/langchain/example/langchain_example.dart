// ignore_for_file: avoid_print
import 'package:langchain/langchain.dart';

void main() async {
  final promptTemplate = PromptTemplate.fromTemplate(
    'tell me a joke about {subject}',
  );
  final llm = FakeLLM(
    responses: ['Why did the AI go on a diet? Because it had too many bytes!'],
  );
  final chain = promptTemplate.pipe(llm).pipe(const StringOutputParser());
  final result = await chain.invoke({'subject': 'AI'});
  print(result);
  // Why did the AI go on a diet? Because it had too many bytes!
}
