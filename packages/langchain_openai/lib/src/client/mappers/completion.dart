import 'package:dart_openai/dart_openai.dart' as c;

import '../models/completion.dart';

extension OpenAICompletionMapper on c.OpenAICompletionModel {
  OpenAICompletion toModel() {
    return OpenAICompletion(
      id: id,
      created: created,
      model: model,
      choices: choices.map((final e) => e.toModel()).toList(growable: false),
      usage: usage?.toModel(),
    );
  }
}

extension _OpenAICompletionChoiceMapper on c.OpenAICompletionModelChoice {
  OpenAICompletionChoice toModel() {
    return OpenAICompletionChoice(
      text: text,
      index: index,
      logprobs: logprobs,
      finishReason: finishReason,
    );
  }
}

extension _OpenAICompletionUsageMapper on c.OpenAICompletionModelUsage {
  OpenAICompletionUsage toModel() {
    return OpenAICompletionUsage(
      promptTokens: promptTokens,
      completionTokens: completionTokens,
      totalTokens: totalTokens,
    );
  }
}
