// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _llmChatModel();
  await _promptTemplates();
  await _chatPromptTemplates();
  await _commaSeparatedListOutputParser();
  await _composingLcel();
}

Future<void> _llmChatModel() async {
  final openAiApiKey = Platform.environment['OPENAI_API_KEY'];

  final llm = OpenAI(apiKey: openAiApiKey);
  final chatModel = ChatOpenAI(apiKey: openAiApiKey);

  const text =
      'What would be a good company name for a company that makes colorful socks?';
  final messages = [ChatMessage.humanText(text)];

  final res1 = await llm.invoke(PromptValue.string(text));
  print(res1.firstOutput);
  // 'Feetful of Fun'

  final res2 = await chatModel.invoke(PromptValue.chat(messages));
  print(res2.firstOutput);
  // AIChatMessage(content='RainbowSock Co.')
}

Future<void> _promptTemplates() async {
  final prompt = PromptTemplate.fromTemplate(
    'What is a good name for a company that makes {product}?',
  );
  final res = prompt.format({'product': 'colorful socks'});
  print(res);
  // 'What is a good name for a company that makes colorful socks?'
}

Future<void> _chatPromptTemplates() async {
  const template =
      'You are a helpful assistant that translates {input_language} to {output_language}.';
  const humanTemplate = '{text}';

  final chatPrompt = ChatPromptTemplate.fromTemplates(const [
    (ChatMessageType.system, template),
    (ChatMessageType.human, humanTemplate),
  ]);

  final res = chatPrompt.formatMessages({
    'input_language': 'English',
    'output_language': 'French',
    'text': 'I love programming.',
  });
  print(res);
  // [
  //   SystemMessage(content='You are a helpful assistant that translates English to French.'),
  //   HumanMessage(content='I love programming.')
  // ]
}

Future<void> _commaSeparatedListOutputParser() async {
  final res = await CommaSeparatedListOutputParser().parse('hi, bye');
  print(res);
  // ['hi',  'bye']
}

class CommaSeparatedListOutputParser extends BaseOutputParser<AIChatMessage,
    BaseLangChainOptions, List<String>> {
  @override
  Future<List<String>> parse(final String text) async {
    return text.trim().split(',');
  }
}

Future<void> _composingLcel() async {
  final openAiApiKey = Platform.environment['OPENAI_API_KEY'];

  const systemTemplate = '''
You are a helpful assistant who generates comma separated lists.
A user will pass in a category, and you should generate 5 objects in that category in a comma separated list.
ONLY return a comma separated list, and nothing more.
''';
  const humanTemplate = '{text}';

  final chatPrompt = ChatPromptTemplate.fromTemplates(const [
    (ChatMessageType.system, systemTemplate),
    (ChatMessageType.human, humanTemplate),
  ]);

  final chatModel = ChatOpenAI(apiKey: openAiApiKey);

  final chain =
      chatPrompt.pipe(chatModel).pipe(CommaSeparatedListOutputParser());

  // Alternative syntax:
  // final chain = chatPrompt | chatModel | CommaSeparatedListOutputParser();

  final res = await chain.invoke({'text': 'colors'});
  print(res);
  // ['red', 'blue', 'green', 'yellow', 'orange']
}
