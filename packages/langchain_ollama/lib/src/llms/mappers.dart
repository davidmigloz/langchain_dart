// ignore_for_file: public_member_api_docs

import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/llms.dart';
import 'package:ollama_dart/ollama_dart.dart';

import 'types.dart';

extension LLMResultMapper on GenerateResponse {
  LLMResult toLLMResult(final String id, {final bool streaming = false}) {
    return LLMResult(
      id: id,
      output: response ?? '',
      finishReason: _mapFinishReason(doneReason),
      metadata: {
        'model': model,
        'created_at': createdAt,
        'done': done,
        'total_duration': totalDuration,
        'load_duration': loadDuration,
        'prompt_eval_count': promptEvalCount,
        'prompt_eval_duration': promptEvalDuration,
        'eval_count': evalCount,
        'eval_duration': evalDuration,
      },
      usage: _mapUsage(),
      streaming: streaming,
    );
  }

  LanguageModelUsage _mapUsage() {
    return LanguageModelUsage(
      promptTokens: promptEvalCount,
      responseTokens: evalCount,
      totalTokens: (promptEvalCount != null && evalCount != null)
          ? promptEvalCount! + evalCount!
          : null,
    );
  }

  FinishReason _mapFinishReason(final DoneReason? reason) => switch (reason) {
    DoneReason.stop => FinishReason.stop,
    DoneReason.length => FinishReason.length,
    DoneReason.load => FinishReason.unspecified,
    DoneReason.unload => FinishReason.unspecified,
    null => FinishReason.unspecified,
  };
}

extension GenerateStreamResultMapper on GenerateStreamEvent {
  LLMResult toLLMResult(final String id, {final bool streaming = false}) {
    return LLMResult(
      id: id,
      output: response ?? '',
      finishReason: (done ?? false) ? FinishReason.stop : FinishReason.unspecified,
      metadata: {'model': model, 'created_at': createdAt, 'done': done},
      usage: const LanguageModelUsage(),
      streaming: streaming,
    );
  }
}

extension OllamaResponseFormatMapper on OllamaResponseFormat {
  ResponseFormat toFormat() {
    return switch (this) {
      OllamaResponseFormat.json => const JsonFormat(),
    };
  }
}

extension OllamaThinkingLevelMapper on OllamaThinkingLevel {
  ThinkValue toThinkValue() {
    return switch (this) {
      OllamaThinkingLevel.high => const ThinkWithLevel(ThinkLevel.high),
      OllamaThinkingLevel.medium => const ThinkWithLevel(ThinkLevel.medium),
      OllamaThinkingLevel.low => const ThinkWithLevel(ThinkLevel.low),
    };
  }
}
