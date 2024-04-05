// ignore_for_file: public_member_api_docs
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/llms.dart';
import 'package:vertex_ai/vertex_ai.dart';

extension VertexAITextModelResponseMapper on VertexAITextModelResponse {
  LLMResult toLLMResult(final String id, final String model) {
    final prediction = predictions.first;
    return LLMResult(
      id: id,
      output: prediction.content,
      finishReason: FinishReason.unspecified,
      metadata: {
        'model': model,
        'citations': prediction.citations.firstOrNull?.toMap(),
        'safety_attributes': prediction.safetyAttributes.toMap(),
      },
      usage: _mapUsage(metadata.token),
    );
  }

  LanguageModelUsage _mapUsage(
    final VertexAITextModelResponseMetadataToken usage,
  ) {
    return LanguageModelUsage(
      promptTokens: usage.inputTotalTokens,
      promptBillableCharacters: usage.inputTotalBillableCharacters,
      responseTokens: usage.outputTotalTokens,
      responseBillableCharacters: usage.outputTotalBillableCharacters,
      totalTokens: usage.inputTotalTokens + usage.outputTotalTokens,
    );
  }
}
