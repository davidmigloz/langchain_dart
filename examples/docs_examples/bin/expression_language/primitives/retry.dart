// ignore_for_file: avoid_print
import 'dart:io';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main() async {
  await _modelWithRetry();
  await _chainWithRetry();
  await _withRetryOptions();
  await _withDelayDurations();
}

Future<void> _modelWithRetry() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);
  final input = PromptValue.string('Explain why sky is blue in 2 lines');

  final modelWithRetry = model.withRetry();
  final res = await modelWithRetry.invoke(input);
  print(res);
  /*
  ChatResult{
  id: chatcmpl-9zmFYnu19Pd6ss3zVFHlKN71DILtx,
  output: AIChatMessage{
  content: The sky appears blue due to Rayleigh scattering, where shorter wavelengths of sunlight (blue light) are scattered more than longer wavelengths (red light) by the molecules in the Earth's atmosphere. This scattering effect is most prominent when the sun is high in the sky.,
  toolCalls: [],
},
  finishReason: FinishReason.stop,
  metadata: {model: gpt-4o-mini-2024-07-18, created: 1724510508, system_fingerprint: fp_48196bc67a},
  usage: LanguageModelUsage{
  promptTokens: 16,
  promptBillableCharacters: null,
  responseTokens: 52,
  responseBillableCharacters: null,
  totalTokens: 68}
,
  streaming: false
}
*/
}

Future<void> _chainWithRetry() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final promptTemplate =
      ChatPromptTemplate.fromTemplate('tell me a joke about {topic}');
  final model = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(model: 'gpt-4o'),
  );
  final chain = promptTemplate.pipe(model).withRetry();

  final res = await chain.batch(
    [
      {'topic': 'bears'},
      {'topic': 'cats'},
    ],
  );
  print(res);
  /*
  [ChatResult{
  id: chatcmpl-9zmjiMfHP2WP3PhM6YXdoHXS02ZAm,
  output: AIChatMessage{
  content: Sure, here's a bear-themed joke for you:

Why did the bear refuse to play cards?

Because he was afraid he might get spotted—he couldn’t bear the tension! 🐻♠️,
  toolCalls: [],
},
  finishReason: FinishReason.stop,
  metadata: {model: gpt-4o-2024-05-13, created: 1724512378, system_fingerprint: fp_3aa7262c27},
  usage: LanguageModelUsage{
  promptTokens: 13,
  promptBillableCharacters: null,
  responseTokens: 41,
  responseBillableCharacters: null,
  totalTokens: 54}
,
  streaming: false
}, ChatResult{
  id: chatcmpl-9zmji1gxCZ4yR3UtX7Af4TBrRhPP1,
  output: AIChatMessage{
  content: Sure, here's one for you:

Why did the cat sit on the computer?

Because it wanted to keep an eye on the mouse! 🐱🖱️,
  toolCalls: [],
},
  finishReason: FinishReason.stop,
  metadata: {model: gpt-4o-2024-05-13, created: 1724512378, system_fingerprint: fp_c9aa9c0491},
  usage: LanguageModelUsage{
  promptTokens: 13,
  promptBillableCharacters: null,
  responseTokens: 34,
  responseBillableCharacters: null,
  totalTokens: 47}
,
  streaming: false
}]
*/
}

Future<void> _withRetryOptions() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final input = PromptValue.string('Explain why sky is blue in 2 lines');
  final model = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(model: 'fake-model'),
  );
  final modelWithRetry = model.withRetry(
    maxRetries: 3,
    addJitter: true,
  );
  final res = await modelWithRetry.invoke(input);
  print(res);
  /*
  retry attempt 0 with delay duration 0:00:01.082000
  retry attempt 1 with delay duration 0:00:02.073000
  retry attempt 2 with delay duration 0:00:04.074000
  Unhandled exception:
  Exception: Function failed to return response and max retries exceeded, Error: OpenAIClientException({
  "uri": "https://api.openai.com/v1/chat/completions",
  "method": "POST",
  "code": 404,
  "message": "Unsuccessful response",
  "body": {
    "error": {
      "message": "The model `fake-model` does not exist or you do not have access to it.",
      "type": "invalid_request_error",
      "param": null,
      "code": "model_not_found"
    }
  }
})*/
}

Future<void> _withDelayDurations() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final input = PromptValue.string('Explain why sky is blue in 2 lines');
  final model = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(model: 'fake-model'),
  );
  final modelWithRetry = model.withRetry(
    maxRetries: 3,
    addJitter: false,
    delayDurations: const [
      Duration(seconds: 1),
      Duration(seconds: 2),
      Duration(seconds: 3),
    ],
  );
  final res = await modelWithRetry.invoke(input);
  print(res);
  // retried with delays provided in RetryOptions
  /*
retry attempt 0 with delay duration 0:00:01.000000
retry attempt 1 with delay duration 0:00:02.000000
retry attempt 2 with delay duration 0:00:03.000000
Unhandled exception:
Exception: Function failed to return response and max retries exceeded, Error: OpenAIClientException({
  "uri": "https://api.openai.com/v1/chat/completions",
  "method": "POST",
  "code": 401,
  "message": "Unsuccessful response",
  "body": {
    "error": {
      "message": "You didn't provide an API key. You need to provide your API key in an Authorization header using Bearer auth (i.e. Authorization: Bearer YOUR_KEY), or as the password field (with blank username) if you're accessing the API from your browser and are prompted for a username and password. You can obtain an API key from https://platform.openai.com/account/api-keys.",
      "type": "invalid_request_error",
      "param": null,
      "code": null
    }
  }
})
*/
}
