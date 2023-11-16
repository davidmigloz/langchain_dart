import 'package:langchain/langchain.dart';
import 'package:vertex_ai/vertex_ai.dart';

/// Mapper for [VertexAITextModelResponse] to [LLMResult].
extension VertexAITextModelResponseMapper on VertexAITextModelResponse {
  /// Converts a [VertexAITextModelResponse] to a [LLMResult].
  LLMResult toLLMResult(final String model) {
    return LLMResult(
      generations: predictions
          .map((final prediction) => prediction.toLLMGeneration())
          .toList(growable: false),
      usage: metadata.token.toLanguageModelUsage(),
      modelOutput: {
        'model': model,
      },
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

/// Mapper for [_VertexAIResponseMetadataTokenMapper] to [LanguageModelUsage].
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
