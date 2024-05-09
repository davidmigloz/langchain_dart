// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:google_generative_ai/google_generative_ai.dart' as g;
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';

import 'types.dart';

extension ChatMessagesMapper on List<ChatMessage> {
  List<g.Content> toContentList() {
    return where((msg) => msg is! SystemChatMessage)
        .map(
          (final message) => switch (message) {
            SystemChatMessage() =>
              throw AssertionError('System messages should be filtered out'),
            final HumanChatMessage msg =>
              g.Content.multi(_mapHumanChatMessageContentParts(msg.content)),
            final AIChatMessage msg =>
              g.Content.model([g.TextPart(msg.content)]),
            final CustomChatMessage msg =>
              g.Content(msg.role, [g.TextPart(msg.content)]),
            ToolChatMessage() => throw UnsupportedError(
                'Google AI does not support tool messages',
              ),
          },
        )
        .toList(growable: false);
  }

  List<g.Part> _mapHumanChatMessageContentParts(
    final ChatMessageContent content,
  ) {
    return switch (content) {
      final ChatMessageContentText c => [g.TextPart(c.text)],
      final ChatMessageContentImage c => [
          if (c.data.startsWith('http'))
            g.FilePart(Uri.parse(c.data))
          else
            g.DataPart(c.mimeType ?? '', base64Decode(c.data)),
        ],
      final ChatMessageContentMultiModal c => c.parts
          .map(
            (final p) => switch (p) {
              final ChatMessageContentText c => g.TextPart(c.text),
              final ChatMessageContentImage c => c.data.startsWith('http')
                  ? g.FilePart(Uri.parse(c.data))
                  : g.DataPart(c.mimeType ?? '', base64Decode(c.data)),
              ChatMessageContentMultiModal() => throw UnsupportedError(
                  'Cannot have multimodal content in multimodal content',
                ),
            },
          )
          .toList(growable: false),
    };
  }
}

extension GenerateContentResponseMapper on g.GenerateContentResponse {
  ChatResult toChatResult(final String id, final String model) {
    final candidate = candidates.first;
    return ChatResult(
      id: id,
      output: AIChatMessage(
        content: candidate.content.parts
            .map(
              (p) => switch (p) {
                final g.TextPart p => p.text,
                final g.DataPart p => base64Encode(p.bytes),
                final g.FilePart p => p.uri.toString(),
                g.FunctionResponse() => throw UnimplementedError(
                    'FunctionResponse part not yet supported',
                  ),
                g.FunctionCall() => throw UnimplementedError(
                    'FunctionResponse part not yet supported',
                  ),
              },
            )
            .whereNotNull()
            .join('\n'),
      ),
      finishReason: _mapFinishReason(candidate.finishReason),
      metadata: {
        'model': model,
        'block_reason': promptFeedback?.blockReason?.name,
        'block_reason_message': promptFeedback?.blockReasonMessage,
        'safety_ratings': candidate.safetyRatings
            ?.map(
              (r) => {
                'category': r.category.name,
                'probability': r.probability.name,
              },
            )
            .toList(growable: false),
        'citation_metadata': candidate.citationMetadata?.citationSources
            .map(
              (s) => {
                'start_index': s.startIndex,
                'end_index': s.endIndex,
                'uri': s.uri.toString(),
                'license': s.license,
              },
            )
            .toList(growable: false),
        'finish_message': candidate.finishMessage,
      },
      usage: LanguageModelUsage(
        promptTokens: usageMetadata?.promptTokenCount,
        responseTokens: usageMetadata?.candidatesTokenCount,
        totalTokens: usageMetadata?.totalTokenCount,
      ),
    );
  }

  FinishReason _mapFinishReason(
    final g.FinishReason? reason,
  ) =>
      switch (reason) {
        g.FinishReason.unspecified => FinishReason.unspecified,
        g.FinishReason.stop => FinishReason.stop,
        g.FinishReason.maxTokens => FinishReason.length,
        g.FinishReason.safety => FinishReason.contentFilter,
        g.FinishReason.recitation => FinishReason.recitation,
        g.FinishReason.other => FinishReason.unspecified,
        null => FinishReason.unspecified,
      };
}

extension SafetySettingsMapper on List<ChatGoogleGenerativeAISafetySetting> {
  List<g.SafetySetting> toSafetySettings() {
    return map(
      (final setting) => g.SafetySetting(
        switch (setting.category) {
          ChatGoogleGenerativeAISafetySettingCategory.unspecified =>
            g.HarmCategory.unspecified,
          ChatGoogleGenerativeAISafetySettingCategory.harassment =>
            g.HarmCategory.harassment,
          ChatGoogleGenerativeAISafetySettingCategory.hateSpeech =>
            g.HarmCategory.hateSpeech,
          ChatGoogleGenerativeAISafetySettingCategory.sexuallyExplicit =>
            g.HarmCategory.sexuallyExplicit,
          ChatGoogleGenerativeAISafetySettingCategory.dangerousContent =>
            g.HarmCategory.dangerousContent,
        },
        switch (setting.threshold) {
          ChatGoogleGenerativeAISafetySettingThreshold.unspecified =>
            g.HarmBlockThreshold.unspecified,
          ChatGoogleGenerativeAISafetySettingThreshold.blockLowAndAbove =>
            g.HarmBlockThreshold.low,
          ChatGoogleGenerativeAISafetySettingThreshold.blockMediumAndAbove =>
            g.HarmBlockThreshold.medium,
          ChatGoogleGenerativeAISafetySettingThreshold.blockOnlyHigh =>
            g.HarmBlockThreshold.high,
          ChatGoogleGenerativeAISafetySettingThreshold.blockNone =>
            g.HarmBlockThreshold.none,
        },
      ),
    ).toList(growable: false);
  }
}
