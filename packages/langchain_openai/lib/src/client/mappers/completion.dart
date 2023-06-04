import 'package:dart_openai/dart_openai.dart' as c;

import '../models/completion.dart';

extension OpenAICompletionModelMapper on c.OpenAICompletionModel {
  OpenAICompletionModel toModel() {
    return OpenAICompletionModel(
      id: id,
      created: created,
      model: model,
      choices: choices.map((final e) => e.toModel()).toList(growable: false),
      usage: usage?.toModel(),
    );
  }
}

extension _OpenAICompletionModelChoiceMapper on c.OpenAICompletionModelChoice {
  OpenAICompletionModelChoice toModel() {
    return OpenAICompletionModelChoice(
      text: text,
      index: index,
      logprobs: logprobs,
      finishReason: finishReason,
    );
  }
}

extension _OpenAICompletionModelUsageMapper on c.OpenAICompletionModelUsage {
  OpenAICompletionModelUsage toModel() {
    return OpenAICompletionModelUsage(
      promptTokens: promptTokens,
      completionTokens: completionTokens,
      totalTokens: totalTokens,
    );
  }
}
