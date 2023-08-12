import 'package:langchain/langchain.dart';
import 'package:vertex_ai/vertex_ai.dart';

/// Mapper for [VertexAITextModelResponse] to [LLMResult].
extension VertexAITextModelResponseMapper on VertexAITextModelResponse {
  LLMResult toLLMResult() {
    return LLMResult(
      generations: predictions
          .map((final prediction) => prediction.toLLMGeneration())
          .toList(growable: false),
      usage: metadata.token.toLanguageModelUsage(),
      modelOutput: const {},
    );
  }
}

/// Mapper for [VertexAITextModelPrediction] to [LLMGeneration].
extension _VertexAITextModelPredictionMapper on VertexAITextModelPrediction {
  LLMGeneration toLLMGeneration() {
    return LLMGeneration(
      content,
      generationInfo: {
        'citations': citations,
        'safety_attributes': safetyAttributes,
      },
    );
  }
}

/// Mapper for [VertexAIResponseMetadataToken] to [LanguageModelUsage].
extension _VertexAIResponseMetadataTokenMapper
    on VertexAITextModelResponseMetadataToken {
  LanguageModelUsage toLanguageModelUsage() {
    return LanguageModelUsage(
      promptTokens: inputTotalTokens,
      promptBillableCharacters: inputTotalBillableCharacters,
      responseTokens: outputTotalTokens,
      responseBillableCharacters: outputTotalBillableCharacters,
      totalTokens: inputTotalTokens + outputTotalTokens,
    );
  }
}
