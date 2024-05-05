// ignore_for_file: public_member_api_docs
import 'package:collection/collection.dart';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';

import 'types.dart';

const _authorUser = 'user';
const _authorAI = 'model';

extension ChatMessagesMapper on List<ChatMessage> {
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
        ToolChatMessage() => throw UnsupportedError(
            'Google AI does not support tool messages',
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

extension GenerateContentResponseMapper on GenerateContentResponse {
  ChatResult toChatResult(final String id, final String model) {
    final candidate = candidates?.first;
    return ChatResult(
      id: id,
      output: AIChatMessage(
        content: candidate?.content?.parts
                ?.map((final p) => p.text)
                .whereNotNull()
                .join('\n') ??
            '',
      ),
      finishReason: _mapFinishReason(candidate?.finishReason),
      metadata: {
        'model': model,
        'block_reason': promptFeedback?.blockReason?.name,
      },
      usage: LanguageModelUsage(
        totalTokens: candidates?.map((final c) => c.tokenCount ?? 0).sum ?? 0,
      ),
    );
  }

  FinishReason _mapFinishReason(
    final CandidateFinishReason? reason,
  ) =>
      switch (reason) {
        CandidateFinishReason.finishReasonUnspecified =>
          FinishReason.unspecified,
        CandidateFinishReason.stop => FinishReason.stop,
        CandidateFinishReason.maxTokens => FinishReason.length,
        CandidateFinishReason.safety => FinishReason.contentFilter,
        CandidateFinishReason.recitation => FinishReason.recitation,
        CandidateFinishReason.other => FinishReason.unspecified,
        null => FinishReason.unspecified,
      };
}

extension SafetySettingsMapper on List<ChatGoogleGenerativeAISafetySetting> {
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
