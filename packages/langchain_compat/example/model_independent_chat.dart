// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

import 'provider_info.dart';

Future<void> main() async {
  const promptText = 'Tell me a joke about Dart programming.';
  var exitCode = 0;

  for (final provider in providers.values) {
    BaseChatModel chatModel;
    try {
      stdout.write('${provider.displayName}: ');
      chatModel = provider.createModel();
      await chatModel.stream(PromptValue.string(promptText)).forEach((chunk) {
        stdout.write(chunk.output.content);
      });
      stdout.writeln();
    } on Exception catch (e) {
      stdout.writeln('${provider.displayName}: $e');
      exitCode = 1;
    }
  }

  exit(exitCode);
}
