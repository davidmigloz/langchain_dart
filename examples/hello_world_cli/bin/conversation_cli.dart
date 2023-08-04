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

  final chatOpenAI = ChatOpenAI(
    apiKey: openAiApiKey,
    temperature: 0.0,
    maxTokens: 512,
    model: 'gpt-3.5-turbo-0613',
  );

  final conversation = ConversationChain(
    llm: chatOpenAI,
    memory: ConversationBufferMemory(),
  );

  while (true) {
    stdout.write('> ');
    final humanMessage = stdin.readLineSync() ?? '';
    final aiMessage = await conversation.run(humanMessage);
    stdout.writeln(aiMessage);
  }
}
