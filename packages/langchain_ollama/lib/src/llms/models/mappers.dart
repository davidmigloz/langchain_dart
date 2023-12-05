import 'package:langchain/langchain.dart';
import 'package:ollama_dart/ollama_dart.dart';

/// Mapper for [GenerateCompletionResponse].
extension GenerateCompletionResponseMapper on GenerateCompletionResponse {
  /// Converts a [GenerateCompletionResponse] to a [LLMResult].
  LLMResult toLLMResult({final bool streaming = false}) {
    return LLMResult(
      generations: [
        toLLMGeneration(),
      ],
      usage: toLanguageModelUsage(),
      modelOutput: {
        'created_at': createdAt,
        'model': model,
        "total_duration": totalDuration,
        "load_duration": loadDuration,
        "prompt_eval_count": promptEvalCount,
        "prompt_eval_duration": promptEvalDuration,
        "eval_count": evalCount,
        "eval_duration": evalDuration,
        "done": done,
      },
      streaming: streaming,
    );
  }

  LLMGeneration toLLMGeneration() {
    final json = toJson();
    return LLMGeneration(
      response ?? '',
      generationInfo: {
        "model": json["model"],
        "total_duration": json["total_duration"],
        "load_duration": json["load_duration"],
        "prompt_eval_count": json["prompt_eval_count"],
        "prompt_eval_duration": json["prompt_eval_duration"],
        "eval_count": json["eval_count"],
        "eval_duration": json["eval_duration"],
        "created_at": json["created_at"],
        "done": json["done"],
      },
    );
  }

  LanguageModelUsage toLanguageModelUsage() {
    return LanguageModelUsage(
      promptTokens: promptEvalCount,
      responseTokens: evalCount,
      totalTokens: (promptEvalCount != null && evalCount != null)
          ? promptEvalCount! + evalCount!
          : null,
    );
  }
}

/// Mapper for [ResponseFormat]
extension ResponseFormatMapper on ResponseFormat {
  /// Returns a [ResponseFormat] enum that matches the provided [name]
  static ResponseFormat? fromString(String? name) => ResponseFormat.values
      .where(
        (element) => element.name.toLowerCase() == name?.toLowerCase(),
      )
      .firstOrNull;
}
