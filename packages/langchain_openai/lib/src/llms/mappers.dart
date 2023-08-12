import 'package:langchain/langchain.dart';
import '../client/models/models.dart';

/// Mapper for [OpenAICompletionModel] to [LLMResult].
extension OpenAICompletionMapper on OpenAICompletion {
  LLMResult toLLMResult() {
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
    );
  }
}

/// Mapper for [OpenAICompletionChoice] to [LLMGeneration].
extension _OpenAICompletionChoiceMapper on OpenAICompletionChoice {
  LLMGeneration toLLMGeneration() {
    return LLMGeneration(
      text,
      generationInfo: {
        'index': index,
        'logprobs': logprobs,
        'finish_reason': finishReason,
      },
    );
  }
}

/// Mapper for [OpenAICompletionUsage] to [LanguageModelUsage].
extension _OpenAICompletionUsageMapper on OpenAICompletionUsage {
  LanguageModelUsage toLanguageModelUsage() {
    return LanguageModelUsage(
      promptTokens: promptTokens,
      responseTokens: completionTokens,
      totalTokens: totalTokens,
    );
  }
}
