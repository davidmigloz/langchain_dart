import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  final openAiApiKey = Platform.environment['OPENAI_API_KEY'];

  if (openAiApiKey == null) {
    stderr.writeln('You need to set your OpenAI key in the '
        'OPENAI_API_KEY environment variable.');
    exit(1);
  }

  final llm = ChatOpenAI(
    apiKey: openAiApiKey,
    defaultOptions: const ChatOpenAIOptions(
      temperature: 0.9,
    ),
  );

  stdout.writeln('How can I help you?');

  while (true) {
    stdout.write('> ');
    final query = stdin.readLineSync() ?? '';
    final humanMessage = ChatMessage.humanText(query);
    final aiMessage = await llm.call([humanMessage]);
    stdout.writeln(aiMessage.content.trim());
  }
}
