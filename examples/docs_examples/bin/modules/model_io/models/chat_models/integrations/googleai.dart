// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_google/langchain_google.dart';

void main(final List<String> arguments) async {
  await _chatGoogleGenerativeAI();
  await _chatGoogleGenerativeAIMultiModal();
  await _chatOpenAIStreaming();
}

Future<void> _chatGoogleGenerativeAI() async {
  final apiKey = Platform.environment['GOOGLEAI_API_KEY'];

  final chatModel = ChatGoogleGenerativeAI(
    apiKey: apiKey,
    defaultOptions: const ChatGoogleGenerativeAIOptions(
      temperature: 0,
    ),
  );

  const template = '''
You are a helpful assistant that translates {input_language} to {output_language}. 

Text to translate: 
{text}''';
  final humanMessagePrompt =
      HumanChatMessagePromptTemplate.fromTemplate(template);
  final chatPrompt =
      ChatPromptTemplate.fromPromptMessages([humanMessagePrompt]);

  final chain = chatPrompt | chatModel | const StringOutputParser();

  final res = await chain.invoke({
    'input_language': 'English',
    'output_language': 'French',
    'text': 'I love programming.',
  });
  print(res);
  // -> 'J'adore la programmation.'

  chatModel.close();
}

Future<void> _chatGoogleGenerativeAIMultiModal() async {
  final apiKey = Platform.environment['GOOGLEAI_API_KEY'];

  final chatModel = ChatGoogleGenerativeAI(
    apiKey: apiKey,
    defaultOptions: const ChatGoogleGenerativeAIOptions(
      model: 'gemini-pro-vision',
      temperature: 0,
    ),
  );
  final res = await chatModel.invoke(
    PromptValue.chat([
      ChatMessage.human(
        ChatMessageContent.multiModal([
          ChatMessageContent.text('What fruit is this?'),
          ChatMessageContent.image(
            mimeType: 'image/jpeg',
            data: base64.encode(
              await File('./bin/assets/apple.jpeg').readAsBytes(),
            ),
          ),
        ]),
      ),
    ]),
  );
  print(res.output.content);
  // -> 'A Red and Green Apple'

  chatModel.close();
}

Future<void> _chatOpenAIStreaming() async {
  final apiKey = Platform.environment['GOOGLEAI_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplate(
      'You are a helpful assistant that replies only with numbers '
      'in order without any spaces or commas '
      'List the numbers from 1 to {max_num}');

  final chatModel = ChatGoogleGenerativeAI(apiKey: apiKey);

  final chain = promptTemplate.pipe(chatModel).pipe(const StringOutputParser());

  final stream = chain.stream({'max_num': '30'});
  await stream.forEach(print);
  // 1234567891011121
  // 31415161718192021222324252627282
  // 930

  chatModel.close();
}
