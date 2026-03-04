// ignore_for_file: public_member_api_docs
import 'package:collection/collection.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/llms.dart';
import 'package:openai_dart/openai_dart.dart' as oai;

extension CompletionMapper on oai.Completion {
  List<LLMResult> toLLMResults({final bool streaming = false}) {
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
          (final index, final choice) => LLMResult(
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

  FinishReason _mapFinishReason(final oai.FinishReason? reason) =>
      switch (reason) {
        oai.FinishReason.stop => FinishReason.stop,
        oai.FinishReason.length => FinishReason.length,
        oai.FinishReason.contentFilter => FinishReason.contentFilter,
        _ => FinishReason.unspecified,
      };

  LanguageModelUsage _mapUsage(final oai.Usage? usage) {
    return LanguageModelUsage(
      promptTokens: usage?.promptTokens,
      responseTokens: usage?.completionTokens,
      totalTokens: usage?.totalTokens,
    );
  }
}
