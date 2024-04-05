// ignore_for_file: public_member_api_docs
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:vertex_ai/vertex_ai.dart';

const _authorUser = 'USER';
const _authorAI = 'AI';

extension ChatMessageMapper on ChatMessage {
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

extension ChatExampleMapper on ChatExample {
  VertexAITextChatModelExample toVertexAIChatExample() {
    return VertexAITextChatModelExample(
      input: input.toVertexAIChatMessage(),
      output: output.toVertexAIChatMessage(),
    );
  }
}

extension VertexAITextChatModelResponseMapper on VertexAITextChatModelResponse {
  ChatResult toChatResult(final String id, final String model) {
    final prediction = predictions.first;
    final candidate = prediction.candidates.first;
    return ChatResult(
      id: id,
      output: AIChatMessage(content: candidate.content),
      finishReason: FinishReason.unspecified,
      metadata: {
        'model': model,
        'citations': prediction.citations.firstOrNull?.firstOrNull?.toMap(),
        'safety_attributes': prediction.safetyAttributes.firstOrNull?.toMap(),
      },
      usage: _mapUsage(metadata.token),
    );
  }

  LanguageModelUsage _mapUsage(
    final VertexAITextChatModelResponseMetadataToken usage,
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
