// ignore_for_file: avoid_print, unused_element

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';

import 'package:langchain_huggingface/src/llm/huggingface_inference.dart';

void main() async {
  // Uncomment the example you want to run:
  await _example1();
  await _example2();
}

/// The most basic building block of LangChain is calling an LLM on some input.
Future<void> _example1() async {
  final huggingFace = HuggingfaceInference.call(
    model: 'gpt2',
    apiKey: '....API_KEY...',
  );
  final result = await huggingFace('Who are  you?');
  print(result);
}

Future<void> _example2() async {
  final huggingFace = HuggingfaceInference.call(
    model: 'gpt2',
    apiKey: '....API_KEY...',
  );

  final str = huggingFace.stream(PromptValue.string('Who are you?'));

  str.listen(print);
}
