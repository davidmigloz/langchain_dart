import 'package:langchain/langchain.dart';
import 'package:openai_dart/openai_dart.dart';

extension CreateCompletionResponseMapper on CreateCompletionResponse {
  LLMResult toLLMResult({final bool streaming = false}) {
    return LLMResult(
      generations: choices
          .map((final choice) => choice.toLLMGeneration())
          .toList(growable: false),
      usage: usage?.toLanguageModelUsage(),
      modelOutput: {
        'id': id,
        'created': created,
        'model': model,
      },
      streaming: streaming,
    );
  }
}

extension _CompletionChoiceMapper on CompletionChoice {
  LLMGeneration toLLMGeneration() {
    final json = toJson();
    return LLMGeneration(
      text,
      generationInfo: {
        'index': index,
        'logprobs': json['logprobs'],
        'finish_reason': json['finish_reason'],
      },
    );
  }
}

extension _CompletionUsageMapper on CompletionUsage {
  LanguageModelUsage toLanguageModelUsage() {
    return LanguageModelUsage(
      promptTokens: promptTokens,
      responseTokens: completionTokens,
      totalTokens: totalTokens,
    );
  }
}
