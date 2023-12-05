// ignore_for_file: avoid_print, avoid_redundant_argument_values
import 'package:langchain/langchain.dart';
import 'package:langchain_ollama/langchain_ollama.dart';

void main(final List<String> arguments) async {
  await _chatOllama();
  await _chatOllamaStreaming();
}

Future<void> _chatOllama() async {
  final chatModel = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llama2',
      temperature: 0,
    ),
  );

  const template =
      'You are a helpful assistant that translates {input_language} to {output_language}.';
  final systemMessagePrompt =
      SystemChatMessagePromptTemplate.fromTemplate(template);
  const humanTemplate = '{text}';
  final humanMessagePrompt =
      HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);
  final chatPrompt = ChatPromptTemplate.fromPromptMessages(
    [systemMessagePrompt, humanMessagePrompt],
  );

  final chain = chatPrompt | chatModel | const StringOutputParser();

  final res = await chain.invoke({
    'input_language': 'English',
    'output_language': 'French',
    'text': 'I love programming.',
  });
  print(res);
  // -> 'La traduction est : "J'aime le programming.'
}

Future<void> _chatOllamaStreaming() async {
  final promptTemplate = ChatPromptTemplate.fromPromptMessages([
    SystemChatMessagePromptTemplate.fromTemplate(
      'You are a helpful assistant that replies only with numbers '
      'in order without any spaces or commas',
    ),
    HumanChatMessagePromptTemplate.fromTemplate(
      'List the numbers from 1 to {max_num}',
    ),
  ]);
  final chat = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llama2',
      temperature: 0,
    ),
  );
  const stringOutputParser = StringOutputParser<AIChatMessage>();

  final chain = promptTemplate.pipe(chat).pipe(stringOutputParser);

  final stream = chain.stream({'max_num': '9'});
  await stream.forEach(print);
  // 1
  // 2
  // 3
  // ..
  // 9
}
