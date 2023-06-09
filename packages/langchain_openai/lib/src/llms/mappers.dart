import 'package:langchain/langchain.dart';
import '../client/models/models.dart';

extension OpenAICompletionMapper on OpenAICompletion {
  LLMResult toChatResult({
    required final int numPrompts,
    required final int n,
  }) {
    final generations = List.generate(
      numPrompts,
      (final i) => choices
          .sublist(i * n, (i + 1) * n)
          .map((final choice) => choice.toLLMGeneration())
          .toList(growable: false),
      growable: false,
    );
    return LLMResult(
      generations: generations,
      tokensUsage: usage?.totalTokens,
      modelOutput: {
        'id': id,
        'created': created,
        'model': model,
      },
    );
  }
}

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
