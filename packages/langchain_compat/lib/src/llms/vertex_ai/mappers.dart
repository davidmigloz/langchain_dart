// ignore_for_file: public_member_api_docs
import 'package:vertex_ai/vertex_ai.dart';

import '../../language_models/language_models.dart';
import '../../language_models/types.dart';
import '../../llms/types.dart';

extension VertexAITextModelResponseMapper on VertexAITextModelResponse {
  LLMResult toLLMResult(String id, String model) {
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
    VertexAITextModelResponseMetadataToken usage,
  ) => LanguageModelUsage(
      promptTokens: usage.inputTotalTokens,
      promptBillableCharacters: usage.inputTotalBillableCharacters,
      responseTokens: usage.outputTotalTokens,
      responseBillableCharacters: usage.outputTotalBillableCharacters,
      totalTokens: usage.inputTotalTokens + usage.outputTotalTokens,
    );
}
