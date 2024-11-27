// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_google/langchain_google.dart';

void main(final List<String> arguments) async {
  await _chatGoogleGenerativeAI();
  await _chatGoogleGenerativeAIMultiModal();
  await _chatOpenAIStreaming();
  await _codeExecution();
}

Future<void> _chatGoogleGenerativeAI() async {
  final apiKey = Platform.environment['GOOGLEAI_API_KEY'];

  final chatModel = ChatGoogleGenerativeAI(
    apiKey: apiKey,
    defaultOptions: const ChatGoogleGenerativeAIOptions(
      model: 'gemini-1.5-pro-latest',
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

Future<void> _chatGoogleGenerativeAIMultiModal() async {
  final apiKey = Platform.environment['GOOGLEAI_API_KEY'];

  final chatModel = ChatGoogleGenerativeAI(
    apiKey: apiKey,
    defaultOptions: const ChatGoogleGenerativeAIOptions(
      model: 'gemini-1.5-pro-latest',
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
  // -> 'That is an apple.'

  chatModel.close();
}

Future<void> _chatOpenAIStreaming() async {
  final apiKey = Platform.environment['GOOGLEAI_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that replies only with numbers '
          'in order without any spaces or commas.',
    ),
    (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
  ]);

  final chatModel = ChatGoogleGenerativeAI(
    apiKey: apiKey,
    defaultOptions: const ChatGoogleGenerativeAIOptions(
      model: 'gemini-1.5-pro-latest',
      temperature: 0,
    ),
  );

  final chain = promptTemplate.pipe(chatModel).pipe(const StringOutputParser());

  final stream = chain.stream({'max_num': '30'});
  await stream.forEach(print);
  // 1
  // 2345678910111213
  // 1415161718192021
  // 222324252627282930

  chatModel.close();
}

Future<void> _codeExecution() async {
  final apiKey = Platform.environment['GOOGLEAI_API_KEY'];

  final chatModel = ChatGoogleGenerativeAI(
    apiKey: apiKey,
    defaultOptions: const ChatGoogleGenerativeAIOptions(
      model: 'gemini-1.5-flash',
      enableCodeExecution: true,
    ),
  );

  final res = await chatModel.invoke(
    PromptValue.string(
      'Calculate the fibonacci sequence up to 10 terms. '
      'Return only the last term without explanations.',
    ),
  );
  final text = res.output.content;
  print(text); // 34
  final executableCode = res.metadata['executable_code'] as String;
  print(executableCode);
  final codeExecutionResult =
      res.metadata['code_execution_result'] as Map<String, dynamic>;
  print(codeExecutionResult);
}
