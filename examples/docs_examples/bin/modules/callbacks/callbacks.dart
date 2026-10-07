// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main() async {
  await _invokeWithCallbacks();
  await _streamWithCallbacks();
}

Future<void> _invokeWithCallbacks() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final handler = LoggingHandler();
  final model = ChatOpenAI(apiKey: openaiApiKey);

  await model.invoke(
    PromptValue.chat([ChatMessage.humanText('What is 2 + 2?')]),
    options: ChatOpenAIOptions(callbacks: [handler]),
  );
  // [a1b2c3d4] onChatModelStart: What is 2 + 2?
  // [a1b2c3d4] onLlmEnd: 2 + 2 equals 4.
}

Future<void> _streamWithCallbacks() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final handler = LoggingHandler();
  final model = ChatOpenAI(apiKey: openaiApiKey);

  await model
      .stream(
        PromptValue.chat([ChatMessage.humanText('Count from 1 to 5')]),
        options: ChatOpenAIOptions(callbacks: [handler]),
      )
      .toList();
  // [a1b2c3d4] onChatModelStart: Count from 1 to 5
  // [a1b2c3d4] onLlmNewToken: "1"
  // [a1b2c3d4] onLlmNewToken: ","
  // [a1b2c3d4] onLlmNewToken: " 2"
  // ...
  // [a1b2c3d4] onLlmEnd: 1, 2, 3, 4, 5
}

class LoggingHandler extends BaseCallbackHandler {
  @override
  void onChatModelStart({
    required RunInfo runInfo,
    required List<ChatMessage> messages,
  }) {
    print(
      '[${_short(runInfo.runId)}] onChatModelStart: '
      '${messages.last.contentAsString}',
    );
  }

  @override
  void onLlmNewToken({required RunInfo runInfo, required String token}) {
    print('[${_short(runInfo.runId)}] onLlmNewToken: "$token"');
  }

  @override
  void onLlmEnd({
    required RunInfo runInfo,
    required LanguageModelResult<Object> output,
  }) {
    print('[${_short(runInfo.runId)}] onLlmEnd: ${output.outputAsString}');
  }

  @override
  void onLlmError({required RunInfo runInfo, required Object error}) {
    print('[${_short(runInfo.runId)}] onLlmError: $error');
  }

  String _short(String id) => id.substring(0, 8);
}
