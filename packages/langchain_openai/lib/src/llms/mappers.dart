import 'package:langchain/langchain.dart';
import '../client/models/models.dart';

/// Mapper for [OpenAICompletionModel] to [LLMResult].
extension OpenAICompletionMapper on OpenAICompletion {
  LLMResult toChatResult() {
    return LLMResult(
      generations: choices
          .map((final choice) => choice.toLLMGeneration())
          .toList(growable: false),
      tokensUsage: usage?.totalTokens,
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
