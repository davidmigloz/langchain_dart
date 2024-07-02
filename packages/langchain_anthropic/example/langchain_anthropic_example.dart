// ignore_for_file: avoid_print, unused_element
import 'dart:io';

import 'package:langchain_anthropic/langchain_anthropic.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';

/// Check the docs for more examples:
/// https://langchaindart.dev
void main() async {
  // Uncomment the example you want to run:
  await _example1();
  // await _example2();
}

/// The most basic example of LangChain is calling a model on some input
Future<void> _example1() async {
  final openAiApiKey = Platform.environment['ANTHROPIC_API_KEY'];
  final llm = ChatAnthropic(
    apiKey: openAiApiKey,
    defaultOptions: const ChatAnthropicOptions(temperature: 1),
  );
  final ChatResult res = await llm.invoke(
    PromptValue.string('Tell me a joke'),
  );
  print(res);
}

/// Instead of waiting for the full response from the model, you can stream it
/// while it's being generated
Future<void> _example2() async {
  final openAiApiKey = Platform.environment['ANTHROPIC_API_KEY'];
  final llm = ChatAnthropic(
    apiKey: openAiApiKey,
    defaultOptions: const ChatAnthropicOptions(temperature: 1),
  );
  final Stream<ChatResult> stream = llm.stream(
    PromptValue.string('Tell me a joke'),
  );
  await stream.forEach((final chunk) => stdout.write(chunk.output.content));
}
