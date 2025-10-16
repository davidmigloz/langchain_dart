// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main() async {
  await _modelWithFallbacks();
  await _modelWithMultipleFallbacks();
  await _chainWithFallbacks();
}

Future<void> _modelWithFallbacks() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final fakeOpenAIModel = ChatOpenAI(
    defaultOptions: const ChatOpenAIOptions(model: 'tomato'),
  );

  final latestModel = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(model: 'gpt-4o'),
  );

  final modelWithFallbacks = fakeOpenAIModel.withFallbacks([latestModel]);

  final prompt = PromptValue.string('Explain why sky is blue in 2 lines');

  final res = await modelWithFallbacks.invoke(prompt);
  print(res);
  /*
{
  "ChatResult": {
    "id": "chatcmpl-9nKBcFNkzo5qUrdNB92b36J0d1meA",
    "output": {
      "AIChatMessage": {
        "content": "The sky appears blue because molecules in the Earth's atmosphere scatter shorter wavelength blue light from the sun more effectively than longer wavelengths like red. This scattering process is known as Rayleigh scattering.",
        "toolCalls": []
      }
    },
    "finishReason": "FinishReason.stop",
    "metadata": {
      "model": "gpt-4o-2024-05-13",
      "created": 1721542696,
      "system_fingerprint": "fp_400f27fa1f"
    },
    "usage": {
      "LanguageModelUsage": {
        "promptTokens": 16,
        "promptBillableCharacters": null,
        "responseTokens": 36,
        "responseBillableCharacters": null,
        "totalTokens": 52
      }
    },
    "streaming": false
  }
}
*/
}

Future<void> _modelWithMultipleFallbacks() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final fakeOpenAIModel1 = ChatOpenAI(
    defaultOptions: const ChatOpenAIOptions(model: 'tomato'),
  );

  final fakeOpenAIModel2 = ChatOpenAI(
    defaultOptions: const ChatOpenAIOptions(model: 'potato'),
  );

  final latestModel = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(model: 'gpt-4o'),
  );

  final modelWithFallbacks = fakeOpenAIModel1.withFallbacks([
    fakeOpenAIModel2,
    latestModel,
  ]);

  final prompt = PromptValue.string('Explain why sky is blue in 2 lines');

  final res = await modelWithFallbacks.invoke(prompt);
  print(res);
  /*
  {
  "id": "chatcmpl-9nLKW345nrh0nzmw18iO35XnoQ2jo",
  "output": {
    "content": "The sky appears blue due to Rayleigh scattering, where shorter blue wavelengths of sunlight are scattered more than other colors by the molecules in Earth's atmosphere. This scattering disperses blue light in all directions, making the sky look blue.",
    "toolCalls": []
  },
  "finishReason": "FinishReason.stop",
  "metadata": {
    "model": "gpt-4o-2024-05-13",
    "created": 1721547092,
    "system_fingerprint": "fp_c4e5b6fa31"
  },
  "usage": {
    "promptTokens": 16,
    "promptBillableCharacters": null,
    "responseTokens": 45,
    "responseBillableCharacters": null,
    "totalTokens": 61
  },
  "streaming": false
}
*/
}

Future<void> _chainWithFallbacks() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final fakeOpenAIModel = ChatOpenAI(
    defaultOptions: const ChatOpenAIOptions(model: 'tomato'),
  );

  final latestModel = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(model: 'gpt-4o'),
  );

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'tell me a joke about {topic}',
  );

  final badChain = promptTemplate.pipe(fakeOpenAIModel);
  final goodChain = promptTemplate.pipe(latestModel);

  final chainWithFallbacks = badChain.withFallbacks([goodChain]);

  final res = await chainWithFallbacks.batch([
    {'topic': 'bears'},
    {'topic': 'cats'},
  ]);
  print(res);
  /*
[
  {
    "id": "chatcmpl-9nKncT4IpAxbUxrEqEKGB0XUeyGRI",
    "output": {
      "content": "Sure! How about this one?\n\nWhy did the bear bring a suitcase to the forest?\n\nBecause it wanted to pack a lunch! 🐻🌲",
      "toolCalls": []
    },
    "finishReason": "FinishReason.stop",
    "metadata": {
      "model": "gpt-4o-2024-05-13",
      "created": 1721545052,
      "system_fingerprint": "fp_400f27fa1f"
    },
    "usage": {
      "promptTokens": 13,
      "promptBillableCharacters": null,
      "responseTokens": 31,
      "responseBillableCharacters": null,
      "totalTokens": 44
    },
    "streaming": false
  },
  {
    "id": "chatcmpl-9nKnc58FpXFTPkzZfm2hHxJ5VSQQh",
    "output": {
      "content": "Sure, here's a cat joke for you:\n\nWhy was the cat sitting on the computer?\n\nBecause it wanted to keep an eye on the mouse!",
      "toolCalls": []
    },
    "finishReason": "FinishReason.stop",
    "metadata": {
      "model": "gpt-4o-2024-05-13",
      "created": 1721545052,
      "system_fingerprint": "fp_c4e5b6fa31"
    },
    "usage": {
      "promptTokens": 13,
      "promptBillableCharacters": null,
      "responseTokens": 29,
      "responseBillableCharacters": null,
      "totalTokens": 42
    },
    "streaming": false
  }
]
*/
}
