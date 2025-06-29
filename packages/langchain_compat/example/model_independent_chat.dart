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
      print('${provider.displayName}: ERROR creating model: $e');
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
    } catch (e) {
      print('${provider.displayName}: STREAM ERROR: $e');
    }
  }
}

Future<String> sendPrompt(
  BaseChatModel model,
  String promptText, {
  ChatOpenAIOptions? options,
}) async {
  final prompt = PromptValue.chat([ChatMessage.humanText(promptText)]);
  final output = await model.invoke(prompt, options: options);
  return output.outputAsString;
}

Future<void> streamPrompt(
  BaseChatModel model,
  String promptText,
  String provider,
) async {
  final prompt = PromptValue.chat([ChatMessage.humanText(promptText)]);
  final stream = model.stream(prompt);
  stdout.write('$provider (${model.modelType}): ');
  await for (final chunk in stream) {
    stdout.write(chunk.output.content);
  }
  print('');
}
