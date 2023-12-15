// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_google/langchain_google.dart';

void main(final List<String> arguments) async {
  await _chatGoogleGenerativeAI();
  await _chatGoogleGenerativeAIMultiModal();
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
}

Future<void> _chatGoogleGenerativeAIMultiModal() async {
  final apiKey = Platform.environment['GOOGLEAI_API_KEY'];

  final chatModel = ChatGoogleGenerativeAI(
    apiKey: apiKey,
    defaultOptions: const ChatGoogleGenerativeAIOptions(
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
    options: const ChatGoogleGenerativeAIOptions(
      model: 'gemini-pro-vision',
    ),
  );
  print(res.firstOutputAsString);
  // -> 'A Red and Green Apple'
}
