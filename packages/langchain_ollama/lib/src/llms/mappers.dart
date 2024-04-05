// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/llms.dart';
import 'package:ollama_dart/ollama_dart.dart';

import 'types.dart';

extension LLMResultMapper on GenerateCompletionResponse {
  LLMResult toLLMResult(final String id, {final bool streaming = false}) {
    return LLMResult(
      id: id,
      output: response ?? '',
      finishReason: FinishReason.unspecified,
      metadata: {
        'model': model,
        'created_at': createdAt,
        'done': done,
        'context': json.encode(context),
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
}

extension OllamaResponseFormatMapper on OllamaResponseFormat {
  ResponseFormat? toResponseFormat() => ResponseFormat.values
      .where((final f) => f.name.toLowerCase() == name.toLowerCase())
      .firstOrNull;
}
