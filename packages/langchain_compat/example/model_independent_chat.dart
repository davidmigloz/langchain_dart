// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

import 'provider_info.dart';

Future<void> main() async {
  const promptText = 'Tell me a joke about Dart programming.';

  print('\n--- Streaming responses ---');
  for (final provider in providers.values) {
    BaseChatModel chatModel;
    try {
      chatModel = provider.createModel();
    } on Exception catch (e) {
      print('[31m${provider.displayName}: ERROR creating model: $e[0m');
      continue;
    }
    try {
      if (provider.shortName == 'gemini-openai') {
        await for (final chunk in chatModel.stream(
          PromptValue.string(promptText),
          options: ChatOpenAIOptions(model: provider.defaultModel),
        )) {
          stdout.write(chunk.output.content);
        }
        print('');
      } else {
        await for (final chunk in chatModel.stream(
          PromptValue.string(promptText),
        )) {
          stdout.write(chunk.output.content);
        }
        print('');
      }
    } on Exception catch (e) {
      print('[31m${provider.displayName}: STREAM ERROR: $e[0m');
    }
  }
}
