import 'package:collection/collection.dart';
import 'package:openai_dart/openai_dart.dart';

import '../language_models/language_models.dart';
import '../language_models/types.dart';
import '../llms/types.dart';

/// Extension on [CreateCompletionResponse] to convert to a list of
/// [LLMResult]s.
///
/// [CreateCompletionResponse] is the response from the OpenAI API for a
/// completion request.
extension CreateCompletionResponseMapper on CreateCompletionResponse {
  /// Converts this [CreateCompletionResponse] to a list of [LLMResult]s.
  List<LLMResult> toLLMResults({bool streaming = false}) {
    final metadata = {
      'created': created,
      'model': model,
      if (systemFingerprint != null) 'system_fingerprint': systemFingerprint,
    };
    final totalUsage = _mapUsage(usage);
    if (choices.isEmpty) {
      return [
        LLMResult(
          id: '$id:0',
          output: '',
          finishReason: FinishReason.unspecified,
          metadata: metadata,
          usage: totalUsage,
          streaming: streaming,
        ),
      ];
    }

    return choices
        .mapIndexed(
          (index, choice) => LLMResult(
            id: '$id:$index',
            output: choice.text,
            finishReason: _mapFinishReason(choice.finishReason),
            metadata: {
              ...metadata,
              if (choice.logprobs != null)
                'logprobs': choice.logprobs?.toJson(),
            },
            usage: totalUsage,
            streaming: streaming,
          ),
        )
        .toList(growable: false);
  }

  FinishReason _mapFinishReason(CompletionFinishReason? reason) =>
      switch (reason) {
        CompletionFinishReason.stop => FinishReason.stop,
        CompletionFinishReason.length => FinishReason.length,
        CompletionFinishReason.contentFilter => FinishReason.contentFilter,
        null => FinishReason.unspecified,
      };

  LanguageModelUsage _mapUsage(CompletionUsage? usage) => LanguageModelUsage(
    promptTokens: usage?.promptTokens,
    responseTokens: usage?.completionTokens,
    totalTokens: usage?.totalTokens,
  );
}
