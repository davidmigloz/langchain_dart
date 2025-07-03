// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

Future<void> main() async {
  const promptText = 'Tell me a joke about Dart programming.';

  for (final provider in ChatProvider.all) {
    final model = provider.createModel();
    stdout.writeln(
      '\n# ${provider.displayName} (${provider.name}:${model.name})',
    );
    await model
        .stream([
          HumanChatMessage(content: ChatMessageContent.text(promptText)),
        ])
        .forEach((chunk) => stdout.write(chunk.output));
    stdout.writeln();
  }

  exit(0);
}
