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
      chatModel = provider.createModel();
      await for (final chunk in chatModel.stream(
        PromptValue.string(promptText),
      )) {
        stdout.write(chunk.output.content);
      }
      print('');
    } on Exception catch (e) {
      print('${provider.displayName}: $e');
      exitCode = 1;
    }
  }

  exit(exitCode);
}
