// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart' as g;

import '../../language_models/types.dart';
import '../../tools/base.dart';
import '../types.dart';

extension ChatMessagesMapper on List<ChatMessage> {
  List<g.Content> toContentList() {
    return where((msg) => msg is! SystemChatMessage)
        .map(
          (final message) => switch (message) {
            SystemChatMessage() => throw AssertionError(
              'System messages should be filtered out',
            ),
            final HumanChatMessage msg => _mapHumanChatMessage(msg),
            final AIChatMessage msg => _mapAIChatMessage(msg),
            final ToolChatMessage msg => _mapToolChatMessage(msg),
            final CustomChatMessage msg => _mapCustomChatMessage(msg),
          },
        )
        .toList(growable: false);
  }

  g.Content _mapHumanChatMessage(final HumanChatMessage msg) {
    final contentParts = switch (msg.content) {
      final ChatMessageContentText c => [g.TextPart(c.text)],
      final ChatMessageContentImage c => [
        if (c.data.startsWith('http'))
          g.FilePart(Uri.parse(c.data))
        else
          g.DataPart(c.mimeType ?? '', base64Decode(c.data)),
      ],
      final ChatMessageContentMultiModal c =>
        c.parts
            .map(
              (final p) => switch (p) {
                final ChatMessageContentText c => g.TextPart(c.text),
                final ChatMessageContentImage c =>
                  c.data.startsWith('http')
                      ? g.FilePart(Uri.parse(c.data))
                      : g.DataPart(c.mimeType ?? '', base64Decode(c.data)),
                ChatMessageContentMultiModal() => throw UnsupportedError(
                  'Cannot have multimodal content in multimodal content',
                ),
              },
            )
            .toList(growable: false),
    };
    return g.Content.multi(contentParts);
  }

  g.Content _mapAIChatMessage(final AIChatMessage msg) {
    final contentParts = [
      if (msg.content.isNotEmpty) g.TextPart(msg.content),
      if (msg.toolCalls.isNotEmpty)
        ...msg.toolCalls.map(
          (final call) => g.FunctionCall(call.name, call.arguments),
        ),
    ];
    return g.Content.model(contentParts);
  }

  g.Content _mapToolChatMessage(final ToolChatMessage msg) {
    Map<String, Object?>? response;
    try {
      response = jsonDecode(msg.content) as Map<String, Object?>;
    } catch (_) {
      response = {'result': msg.content};
    }

    return g.Content.functionResponses([
      g.FunctionResponse(msg.toolCallId, response),
    ]);
  }

  g.Content _mapCustomChatMessage(final CustomChatMessage msg) {
    return g.Content(msg.role, [g.TextPart(msg.content)]);
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
                g.FunctionResponse() || g.FunctionCall() => '',
                g.ExecutableCode() => '',
                g.CodeExecutionResult() => '',
                _ => throw AssertionError('Unknown part type: $p'),
              },
            )
            .nonNulls
            .join('\n'),
        toolCalls: candidate.content.parts
            .whereType<g.FunctionCall>()
            .map(
              (final call) => AIChatMessageToolCall(
                id: call.name,
                name: call.name,
                argumentsRaw: jsonEncode(call.args),
                arguments: call.args,
              ),
            )
            .toList(growable: false),
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
        'executable_code': candidate.content.parts
            .whereType<g.ExecutableCode>()
            .map((code) => code.toJson())
            .toList(growable: false),
        'code_execution_result': candidate.content.parts
            .whereType<g.CodeExecutionResult>()
            .map((result) => result.toJson())
            .toList(growable: false),
      },
      usage: LanguageModelUsage(
        promptTokens: usageMetadata?.promptTokenCount,
        responseTokens: usageMetadata?.candidatesTokenCount,
        totalTokens: usageMetadata?.totalTokenCount,
      ),
    );
  }

  FinishReason _mapFinishReason(final g.FinishReason? reason) =>
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

extension ChatToolListMapper on List<ToolSpec>? {
  List<g.Tool>? toToolList({required final bool enableCodeExecution}) {
    if (this == null && !enableCodeExecution) {
      return null;
    }

    return [
      g.Tool(
        functionDeclarations: this
            ?.map(
              (tool) => g.FunctionDeclaration(
                tool.name,
                tool.description,
                tool.inputJsonSchema.toSchema(),
              ),
            )
            .toList(growable: false),
        codeExecution: enableCodeExecution ? g.CodeExecution() : null,
      ),
    ];
  }
}

extension SchemaMapper on Map<String, dynamic> {
  g.Schema toSchema() {
    final jsonSchema = this;
    final type = jsonSchema['type'] as String;
    final description = jsonSchema['description'] as String?;
    final nullable = jsonSchema['nullable'] as bool?;
    final enumValues = jsonSchema['enum'] as List<String>?;
    final format = jsonSchema['format'] as String?;
    final items = jsonSchema['items'] as Map<String, dynamic>?;
    final properties = jsonSchema['properties'] as Map<String, dynamic>?;
    final requiredProperties = jsonSchema['required'] as List<String>?;

    switch (type) {
      case 'string':
        if (enumValues != null) {
          return g.Schema.enumString(
            enumValues: enumValues,
            description: description,
            nullable: nullable,
          );
        } else {
          return g.Schema.string(description: description, nullable: nullable);
        }
      case 'number':
        return g.Schema.number(
          description: description,
          nullable: nullable,
          format: format,
        );
      case 'integer':
        return g.Schema.integer(
          description: description,
          nullable: nullable,
          format: format,
        );
      case 'boolean':
        return g.Schema.boolean(description: description, nullable: nullable);
      case 'array':
        if (items != null) {
          final itemsSchema = items.toSchema();
          return g.Schema.array(
            items: itemsSchema,
            description: description,
            nullable: nullable,
          );
        }
        throw ArgumentError('Array schema must have "items" property');
      case 'object':
        if (properties != null) {
          final propertiesSchema = properties.map(
            (key, value) =>
                MapEntry(key, (value as Map<String, dynamic>).toSchema()),
          );
          return g.Schema.object(
            properties: propertiesSchema,
            requiredProperties: requiredProperties,
            description: description,
            nullable: nullable,
          );
        }
        throw ArgumentError('Object schema must have "properties" property');
      default:
        throw ArgumentError('Invalid schema type: $type');
    }
  }
}

extension ChatToolChoiceMapper on ChatToolChoice {
  g.ToolConfig toToolConfig() {
    return switch (this) {
      ChatToolChoiceNone _ => g.ToolConfig(
        functionCallingConfig: g.FunctionCallingConfig(
          mode: g.FunctionCallingMode.none,
        ),
      ),
      ChatToolChoiceAuto _ => g.ToolConfig(
        functionCallingConfig: g.FunctionCallingConfig(
          mode: g.FunctionCallingMode.auto,
        ),
      ),
      ChatToolChoiceRequired() => g.ToolConfig(
        functionCallingConfig: g.FunctionCallingConfig(
          mode: g.FunctionCallingMode.any,
        ),
      ),
      final ChatToolChoiceForced t => g.ToolConfig(
        functionCallingConfig: g.FunctionCallingConfig(
          mode: g.FunctionCallingMode.any,
          allowedFunctionNames: {t.name},
        ),
      ),
    };
  }
}
