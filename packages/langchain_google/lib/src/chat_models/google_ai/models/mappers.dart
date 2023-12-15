import 'package:collection/collection.dart';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:langchain/langchain.dart';

import 'models.dart';

const _authorUser = 'user';
const _authorAI = 'model';

/// Messages mapper.
extension ChatMessagesMapper on List<ChatMessage> {
  /// Coverts a list of messages.
  List<Content> toContentList() {
    return map(
      (final message) => switch (message) {
        SystemChatMessage() => throw UnsupportedError(
            'Google AI does not support system messages at the moment. '
            'Attach your system message in the human message.',
          ),
        final HumanChatMessage msg => Content(
            role: _authorUser,
            parts: _mapHumanChatMessageContentParts(msg.content),
          ),
        final AIChatMessage aiChatMessage => Content(
            role: _authorAI,
            parts: [
              Part(text: aiChatMessage.content),
            ],
          ),
        final CustomChatMessage customChatMessage => Content(
            role: customChatMessage.role,
            parts: [
              Part(text: customChatMessage.content),
            ],
          ),
        FunctionChatMessage() => throw UnsupportedError(
            'Google AI does not support function messages',
          ),
      },
    ).toList(growable: false);
  }

  List<Part> _mapHumanChatMessageContentParts(
    final ChatMessageContent content,
  ) {
    return switch (content) {
      final ChatMessageContentText c => [Part(text: c.text)],
      final ChatMessageContentImage c => [
          Part(inlineData: Blob(mimeType: c.mimeType, data: c.data)),
        ],
      final ChatMessageContentMultiModal c => c.parts
          .map(
            (final p) => switch (p) {
              final ChatMessageContentText c => Part(text: c.text),
              final ChatMessageContentImage c => Part(
                  inlineData: Blob(mimeType: c.mimeType, data: c.data),
                ),
              ChatMessageContentMultiModal() => throw UnsupportedError(
                  'Cannot have multimodal content in multimodal content',
                ),
            },
          )
          .toList(growable: false),
    };
  }
}

/// Generation mapper.
extension GenerateContentResponseMapper on GenerateContentResponse {
  /// Converts generation
  ChatResult toChatResult(final String id, final String model) {
    return ChatResult(
      id: id,
      generations: _mapGenerations(),
      usage: LanguageModelUsage(
        totalTokens: candidates?.map((final c) => c.tokenCount ?? 0).sum ?? 0,
      ),
      modelOutput: {
        'model': model,
        'block_reason': promptFeedback?.blockReason?.name,
      },
    );
  }

  List<ChatGeneration> _mapGenerations() {
    return candidates
            ?.map(
              (final candidate) => ChatGeneration(
                AIChatMessage(
                  content: candidate.content?.parts
                          ?.map((final p) => p.text)
                          .whereNotNull()
                          .join('\n') ??
                      '',
                ),
                generationInfo: {
                  'index': candidate.index,
                  'finish_reason': candidate.finishReason?.name,
                },
              ),
            )
            .toList(growable: false) ??
        const [];
  }
}

/// Safety settings mapper.
extension SafetySettingsMapper on List<ChatGoogleGenerativeAISafetySetting> {
  /// Converts safety settings.
  List<SafetySetting> toSafetySettings() {
    return map(
      (final setting) => SafetySetting(
        category: switch (setting.category) {
          ChatGoogleGenerativeAISafetySettingCategory.harmCategoryUnspecified =>
            SafetySettingCategory.harmCategoryUnspecified,
          ChatGoogleGenerativeAISafetySettingCategory.harmCategoryDerogatory =>
            SafetySettingCategory.harmCategoryDerogatory,
          ChatGoogleGenerativeAISafetySettingCategory.harmCategoryToxicity =>
            SafetySettingCategory.harmCategoryToxicity,
          ChatGoogleGenerativeAISafetySettingCategory.harmCategoryViolence =>
            SafetySettingCategory.harmCategoryViolence,
          ChatGoogleGenerativeAISafetySettingCategory.harmCategorySexual =>
            SafetySettingCategory.harmCategorySexual,
          ChatGoogleGenerativeAISafetySettingCategory.harmCategoryMedical =>
            SafetySettingCategory.harmCategoryMedical,
          ChatGoogleGenerativeAISafetySettingCategory.harmCategoryDangerous =>
            SafetySettingCategory.harmCategoryDangerous,
          ChatGoogleGenerativeAISafetySettingCategory.harmCategoryHarassment =>
            SafetySettingCategory.harmCategoryHarassment,
          ChatGoogleGenerativeAISafetySettingCategory.harmCategoryHateSpeech =>
            SafetySettingCategory.harmCategoryHateSpeech,
          ChatGoogleGenerativeAISafetySettingCategory
                .harmCategorySexuallyExplicit =>
            SafetySettingCategory.harmCategorySexuallyExplicit,
          ChatGoogleGenerativeAISafetySettingCategory
                .harmCategoryDangerousContent =>
            SafetySettingCategory.harmCategoryDangerousContent,
        },
        threshold: switch (setting.threshold) {
          ChatGoogleGenerativeAISafetySettingThreshold
                .harmBlockThresholdUnspecified =>
            SafetySettingThreshold.harmBlockThresholdUnspecified,
          ChatGoogleGenerativeAISafetySettingThreshold.blockLowAndAbove =>
            SafetySettingThreshold.blockLowAndAbove,
          ChatGoogleGenerativeAISafetySettingThreshold.blockMediumAndAbove =>
            SafetySettingThreshold.blockMediumAndAbove,
          ChatGoogleGenerativeAISafetySettingThreshold.blockOnlyHigh =>
            SafetySettingThreshold.blockOnlyHigh,
          ChatGoogleGenerativeAISafetySettingThreshold.blockNone =>
            SafetySettingThreshold.blockNone,
        },
      ),
    ).toList(growable: false);
  }
}
