import 'package:langchain/langchain.dart';
import 'package:vertex_ai/vertex_ai.dart';

const _authorUser = 'USER';
const _authorAI = 'AI';

/// Mapper for [ChatMessage] to [VertexAITextChatModelMessage].
extension ChatMessageMapper on ChatMessage {
  VertexAITextChatModelMessage toVertexAIChatMessage() {
    return switch (this) {
      final HumanChatMessage humanChatMessage => VertexAITextChatModelMessage(
          author: _authorUser,
          content: humanChatMessage.content,
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

extension ChatExampleMapper on ChatExample {
  VertexAITextChatModelExample toVertexAIChatExample() {
    return VertexAITextChatModelExample(
      input: input.toVertexAIChatMessage(),
      output: output.toVertexAIChatMessage(),
    );
  }
}

/// Mapper for [ChatGeneration] to [VertexAITextChatModelResponse].
extension VertexAITextChatModelResponseMapper on VertexAITextChatModelResponse {
  ChatResult toChatResult(final String model) {
    return ChatResult(
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
      candidates.first.toChatMessage(),
      generationInfo: {
        'citations': citations,
        'safety_attributes': safetyAttributes,
      },
    );
  }
}

/// Mapper for [VertexAITextChatModelMessage] to [ChatMessage].
extension _VertexAITextChatModelMessageMapper on VertexAITextChatModelMessage {
  ChatMessage toChatMessage() {
    return switch (author) {
      _authorUser => ChatMessage.human(content),
      _authorAI => ChatMessage.ai(content),
      _ => ChatMessage.custom(content, role: author ?? 'unknown'),
    };
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
