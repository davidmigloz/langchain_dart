import 'package:langchain/langchain.dart';
import 'package:vertex_ai/vertex_ai.dart';

const _authorUser = 'USER';
const _authorAI = 'AI';

/// Mapper for [ChatMessage] to [VertexAITextChatModelMessage].
extension ChatMessageMapper on ChatMessage {
  /// Converts a [ChatMessage] to a [VertexAITextChatModelMessage].
  VertexAITextChatModelMessage toVertexAIChatMessage() {
    return switch (this) {
      final HumanChatMessage humanChatMessage => VertexAITextChatModelMessage(
          author: _authorUser,
          content: switch (humanChatMessage.content) {
            final ChatMessageContentText c => c.text,
            _ => throw UnsupportedError(
                'VertexAI only support ChatMessageContentText',
              ),
          },
        ),
      final AIChatMessage aiChatMessage => VertexAITextChatModelMessage(
          author: _authorAI,
          content: aiChatMessage.content,
        ),
      final CustomChatMessage customChatMessage => VertexAITextChatModelMessage(
          author: customChatMessage.role,
          content: customChatMessage.content,
        ),
      _ => throw UnsupportedError('Unsupported ChatMessage type $this'),
    };
  }
}

/// Mapper for [ChatExample].
extension ChatExampleMapper on ChatExample {
  /// Converts a [ChatExample] to a [VertexAITextChatModelExample].
  VertexAITextChatModelExample toVertexAIChatExample() {
    return VertexAITextChatModelExample(
      input: input.toVertexAIChatMessage(),
      output: output.toVertexAIChatMessage(),
    );
  }
}

/// Mapper for [ChatGeneration] to [VertexAITextChatModelResponse].
extension VertexAITextChatModelResponseMapper on VertexAITextChatModelResponse {
  /// Converts a [ChatGeneration] to a [VertexAITextChatModelResponse].
  ChatResult toChatResult(final String id, final String model) {
    return ChatResult(
      id: id,
      generations: predictions
          .map((final prediction) => prediction.toChatGeneration())
          .toList(growable: false),
      usage: metadata.token.toLanguageModelUsage(),
      modelOutput: {
        'model': model,
      },
    );
  }
}

/// Mapper for [VertexAITextChatModelPrediction] to [ChatGeneration].
extension _VertexAITextModelPredictionMapper
    on VertexAITextChatModelPrediction {
  ChatGeneration toChatGeneration() {
    return ChatGeneration(
      candidates.first.toAIChatMessage(),
      generationInfo: {
        'citations': citations,
        'safety_attributes': safetyAttributes,
      },
    );
  }
}

/// Mapper for [VertexAITextChatModelMessage] to [ChatMessage].
extension _VertexAITextChatModelMessageMapper on VertexAITextChatModelMessage {
  AIChatMessage toAIChatMessage() {
    return AIChatMessage(content: content);
  }
}

/// Mapper for [VertexAITextChatModelResponseMetadataToken] to [LanguageModelUsage].
extension _VertexAIResponseMetadataTokenMapper
    on VertexAITextChatModelResponseMetadataToken {
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
