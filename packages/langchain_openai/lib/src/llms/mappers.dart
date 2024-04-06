// ignore_for_file: public_member_api_docs
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/llms.dart';
import 'package:openai_dart/openai_dart.dart';

extension CreateCompletionResponseMapper on CreateCompletionResponse {
  LLMResult toLLMResult(final String id, {final bool streaming = false}) {
    final choice = choices.first;

    return LLMResult(
      id: id,
      output: choice.text,
      finishReason: _mapFinishReason(choice.finishReason),
      metadata: {
        'created': created,
        'model': model,
        'system_fingerprint': systemFingerprint,
        'logprobs': choice.logprobs?.toJson(),
      },
      usage: _mapUsage(usage),
      streaming: streaming,
    );
  }

  FinishReason _mapFinishReason(
    final CompletionFinishReason? reason,
  ) =>
      switch (reason) {
        CompletionFinishReason.stop => FinishReason.stop,
        CompletionFinishReason.length => FinishReason.length,
        CompletionFinishReason.contentFilter => FinishReason.contentFilter,
        null => FinishReason.unspecified,
      };

  LanguageModelUsage _mapUsage(final CompletionUsage? usage) {
    return LanguageModelUsage(
      promptTokens: usage?.promptTokens,
      responseTokens: usage?.completionTokens,
      totalTokens: usage?.totalTokens,
    );
  }
}
