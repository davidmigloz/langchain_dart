// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_anthropic/langchain_anthropic.dart';

void main(final List<String> arguments) async {
  await _invokeModel();
  await _multiModal();
  await _streaming();
}

Future<void> _invokeModel() async {
  final apiKey = Platform.environment['ANTHROPIC_API_KEY'];

  final chatModel = ChatAnthropic(
    apiKey: apiKey,
    defaultOptions: const ChatAnthropicOptions(
      model: 'claude-3-5-sonnet-20240620',
      temperature: 0,
    ),
  );

  final chatPrompt = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that translates {input_language} to {output_language}.'
    ),
    (ChatMessageType.human, 'Text to translate:\n{text}'),
  ]);

  final chain = chatPrompt | chatModel | const StringOutputParser();

  final res = await chain.invoke({
    'input_language': 'English',
    'output_language': 'French',
    'text': 'I love programming.',
  });
  print(res);
  // -> 'J'adore programmer.'

  chatModel.close();
}

Future<void> _multiModal() async {
  final apiKey = Platform.environment['ANTHROPIC_API_KEY'];

  final chatModel = ChatAnthropic(
    apiKey: apiKey,
    defaultOptions: const ChatAnthropicOptions(
      model: 'claude-3-5-sonnet-20240620',
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
  // -> 'The fruit in the image is an apple.'

  chatModel.close();
}

Future<void> _streaming() async {
  final apiKey = Platform.environment['ANTHROPIC_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that replies only with numbers '
          'in order without any spaces or commas.',
    ),
    (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
  ]);

  final chatModel = ChatAnthropic(
    apiKey: apiKey,
    defaultOptions: const ChatAnthropicOptions(
      model: 'claude-3-5-sonnet-20240620',
      temperature: 0,
    ),
  );

  final chain = promptTemplate.pipe(chatModel).pipe(const StringOutputParser());

  final stream = chain.stream({'max_num': '30'});
  await stream.forEach(print);
  // 123
  // 456789101
  // 112131415161
  // 718192021222
  // 324252627282
  // 930

  chatModel.close();
}
