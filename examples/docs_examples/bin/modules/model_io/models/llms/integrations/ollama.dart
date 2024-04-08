// ignore_for_file: avoid_print, avoid_redundant_argument_values
import 'package:langchain/langchain.dart';
import 'package:langchain_ollama/langchain_ollama.dart';

void main(final List<String> arguments) async {
  await _ollama();
  await _ollamaStreaming();
}

Future<void> _ollama() async {
  final prompt = PromptTemplate.fromTemplate(
    'What is a good name for a company that makes {product}?',
  );
  final llm = Ollama(
    defaultOptions: const OllamaOptions(
      model: 'llama2',
    ),
  );

  final chain = prompt | llm | const StringOutputParser();
  final res = await chain.invoke({'product': 'colorful socks'});
  print(res);
  // -> 'SoleMates'
}

Future<void> _ollamaStreaming() async {
  final promptTemplate = PromptTemplate.fromTemplate(
    'List the numbers from 1 to {max_num} in order without any spaces or commas',
  );
  final llm = Ollama(
    defaultOptions: const OllamaOptions(
      model: 'llama2',
    ),
  );
  const stringOutputParser = StringOutputParser<LLMResult>();
  final chain = promptTemplate | llm | stringOutputParser;

  final stream = chain.stream({'max_num': '9'});
  await stream.forEach(print);
  // 1
  // 2
  // 3
  // ..
  // 9
}
