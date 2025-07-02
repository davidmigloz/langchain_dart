// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

Future<void> main() async {
  const promptText = 'Tell me a joke about Dart programming.';
  var exitCode = 0;

  for (final provider in ChatProvider.all) {
    ChatModel? model;
    try {
      model = provider.createModel(model: provider.defaultModel);
      stdout.writeln(
        '\n# ${provider.displayName} (${provider.name}:${model.name})',
      );
      await model
          .stream([
            HumanChatMessage(content: ChatMessageContent.text(promptText)),
          ])
          .forEach((chunk) {
            stdout.write(chunk.output.content);
          });
      stdout.writeln();
    } on Exception catch (e) {
      stdout.writeln(
        '${provider.displayName} (${provider.name}:${model?.name}): $e',
      );
      exitCode = 1;
    }
  }

  exit(exitCode);
}
