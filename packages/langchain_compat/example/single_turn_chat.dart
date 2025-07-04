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
        .sendStream([
          Message(role: MessageRole.user, parts: [TextPart(promptText)]),
        ])
        .forEach((chunk) {
          final text = chunk.output.parts
              .whereType<TextPart>()
              .map((p) => p.text)
              .join();
          stdout.write(text);
        });
    stdout.writeln();
  }
}
