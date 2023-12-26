import 'package:langchain/langchain.dart';
import 'package:ollama_dart/ollama_dart.dart';

import 'models.dart';

/// Mapper for [GenerateCompletionResponse].
extension LLMResultMapper on GenerateCompletionResponse {
  /// Converts a [GenerateCompletionResponse] to a [LLMResult].
  LLMResult toLLMResult({final bool streaming = false}) {
    return LLMResult(
      generations: [_toLLMGeneration()],
      usage: _toLanguageModelUsage(),
      modelOutput: {
        'created_at': createdAt,
        'model': model,
      },
      streaming: streaming,
    );
  }

  LLMGeneration _toLLMGeneration() {
    return LLMGeneration(
      response ?? '',
      generationInfo: {
        'done': done,
        'context': context,
        'total_duration': totalDuration,
        'load_duration': loadDuration,
        'prompt_eval_count': promptEvalCount,
        'prompt_eval_duration': promptEvalDuration,
        'eval_count': evalCount,
        'eval_duration': evalDuration,
      },
    );
  }

  LanguageModelUsage _toLanguageModelUsage() {
    return LanguageModelUsage(
      promptTokens: promptEvalCount,
      responseTokens: evalCount,
      totalTokens: (promptEvalCount != null && evalCount != null)
          ? promptEvalCount! + evalCount!
          : null,
    );
  }
}

/// Mapper for [OllamaResponseFormat] to [ResponseFormat].
extension OllamaResponseFormatMapper on OllamaResponseFormat {
  /// Converts a [OllamaResponseFormat] to a [ResponseFormat].
  ResponseFormat? toResponseFormat() => ResponseFormat.values
      .where((final f) => f.name.toLowerCase() == name.toLowerCase())
      .firstOrNull;
}
