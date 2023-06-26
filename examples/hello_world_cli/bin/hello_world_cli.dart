import 'dart:io';

import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  if (openaiApiKey == null) {
    stderr.writeln('You need to set your OpenAI key in the '
        'OPENAI_API_KEY environment variable.');
    exit(1);
  }

  final llm = OpenAI(apiKey: openaiApiKey, temperature: 0.9);

  stdout.writeln('How can I help you?');

  while (true) {
    stdout.write('> ');
    final query = stdin.readLineSync() ?? '';
    final result = await llm(query);
    stdout.writeln(result.trim());
  }
}
