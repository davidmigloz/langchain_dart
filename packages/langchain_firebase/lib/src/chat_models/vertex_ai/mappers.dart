// ignore_for_file: public_member_api_docs
import 'dart:convert';

// ignore: implementation_imports
import 'package:firebase_ai/src/content.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart' as f;
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/tools.dart';

import 'types.dart';

extension ChatMessagesMapper on List<ChatMessage> {
  List<f.Content> toContentList() {
    final result = <f.Content>[];

    // NOTE: Gemini/Vertex can return multiple FunctionCall parts in a single model turn.
    // The API requires the *next* turn to be ONE Content.functionResponses that includes
    // the SAME number of FunctionResponse parts, in the SAME order. If we send each
    // ToolChatMessage as its own content turn, counts won’t match and the SDK will throw.
    // Therefore, we batch consecutive ToolChatMessage instances into a single
    // f.Content.functionResponses([...]).
    List<f.FunctionResponse>? pendingToolResponses;

    void flushToolResponses() {
      if (pendingToolResponses != null && pendingToolResponses!.isNotEmpty) {
        result.add(f.Content.functionResponses(pendingToolResponses!));
        pendingToolResponses = null;
      }
    }

    for (final message in this) {
      if (message is SystemChatMessage) {
        continue; // System messages are ignored
      }

      if (message is ToolChatMessage) {
        // Start (or continue) a batch of tool responses
        pendingToolResponses ??= <f.FunctionResponse>[];
        pendingToolResponses!.add(_toolMsgToFunctionResponse(message));
        continue;
      }

      // Any non-tool message breaks the batch: flush before adding it
      flushToolResponses();

      switch (message) {
        case final HumanChatMessage msg:
          result.add(_mapHumanChatMessage(msg));
        case final AIChatMessage msg:
          result.add(_mapAIChatMessage(msg));
        case final CustomChatMessage msg:
          result.add(_mapCustomChatMessage(msg));
        default:
          throw UnsupportedError('Unknown message type: $message');
      }
    }

    // Flush remaining batched tool responses at the end
    flushToolResponses();

    return result;
  }

  f.Content _mapHumanChatMessage(final HumanChatMessage msg) {
    final contentParts = switch (msg.content) {
      final ChatMessageContentText c => [f.TextPart(c.text)],
      final ChatMessageContentImage c => [
          if (c.data.startsWith('gs:') || c.data.startsWith('http'))
            f.FileData(c.mimeType ?? '', c.data)
          else
            f.InlineDataPart(c.mimeType ?? '', base64Decode(c.data)),
        ],
      final ChatMessageContentMultiModal c => c.parts
          .map(
            (final p) => switch (p) {
              final ChatMessageContentText c => f.TextPart(c.text),
              final ChatMessageContentImage c =>
                c.data.startsWith('gs:') || c.data.startsWith('http')
                    ? f.FileData(c.mimeType ?? '', c.data)
                    : f.InlineDataPart(c.mimeType ?? '', base64Decode(c.data)),
              ChatMessageContentMultiModal() => throw UnsupportedError(
                  'Cannot have multimodal content in multimodal content',
                ),
            },
          )
          .toList(growable: false),
    };
    return f.Content.multi(contentParts);
  }

  f.Content _mapAIChatMessage(final AIChatMessage msg) {
    final contentParts = [
      if (msg.content.isNotEmpty) f.TextPart(msg.content),
      if (msg.toolCalls.isNotEmpty)
        ...msg.toolCalls.map(
          (final call) => f.FunctionCall(call.name, call.arguments),
        ),
    ];
    return f.Content.model(contentParts);
  }

  f.FunctionResponse _toolMsgToFunctionResponse(final ToolChatMessage msg) {
    Map<String, Object?> response;
    try {
      response = jsonDecode(msg.content) as Map<String, Object?>;
    } catch (_) {
      response = {'result': msg.content};
    }
    return f.FunctionResponse(msg.toolCallId, response);
  }

  f.Content _mapCustomChatMessage(final CustomChatMessage msg) {
    return f.Content(msg.role, [f.TextPart(msg.content)]);
  }
}

extension GenerateContentResponseMapper on f.GenerateContentResponse {
  ChatResult toChatResult(final String id, final String model) {
    final candidate = candidates.first;
    return ChatResult(
      id: id,
      output: AIChatMessage(
        content: candidate.content.parts
            .map(
              (p) => switch (p) {
                final f.TextPart p => p.text,
                final f.InlineDataPart p => base64Encode(p.bytes),
                final f.FileData p => p.fileUri,
                f.FunctionResponse() || f.FunctionCall() => '',
                UnknownPart() => '',
              },
            )
            .nonNulls
            .join('\n'),
        toolCalls: candidate.content.parts
            .whereType<f.FunctionCall>()
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
        'citation_metadata': candidate.citationMetadata?.citations
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
    final f.FinishReason? reason,
  ) =>
      switch (reason) {
        f.FinishReason.unknown => FinishReason.unspecified,
        f.FinishReason.stop => FinishReason.stop,
        f.FinishReason.maxTokens => FinishReason.length,
        f.FinishReason.safety => FinishReason.contentFilter,
        f.FinishReason.recitation => FinishReason.recitation,
        f.FinishReason.other => FinishReason.unspecified,
        null => FinishReason.unspecified,
      };
}

extension SafetySettingsMapper on List<ChatFirebaseVertexAISafetySetting> {
  List<f.SafetySetting> toSafetySettings() {
    return map(
      (final setting) => f.SafetySetting(
        switch (setting.category) {
          ChatFirebaseVertexAISafetySettingCategory.unspecified =>
            f.HarmCategory.unknown,
          ChatFirebaseVertexAISafetySettingCategory.harassment =>
            f.HarmCategory.harassment,
          ChatFirebaseVertexAISafetySettingCategory.hateSpeech =>
            f.HarmCategory.hateSpeech,
          ChatFirebaseVertexAISafetySettingCategory.sexuallyExplicit =>
            f.HarmCategory.sexuallyExplicit,
          ChatFirebaseVertexAISafetySettingCategory.dangerousContent =>
            f.HarmCategory.dangerousContent,
        },
        switch (setting.threshold) {
          ChatFirebaseVertexAISafetySettingThreshold.unspecified =>
            f.HarmBlockThreshold.none,
          ChatFirebaseVertexAISafetySettingThreshold.blockLowAndAbove =>
            f.HarmBlockThreshold.low,
          ChatFirebaseVertexAISafetySettingThreshold.blockMediumAndAbove =>
            f.HarmBlockThreshold.medium,
          ChatFirebaseVertexAISafetySettingThreshold.blockOnlyHigh =>
            f.HarmBlockThreshold.high,
          ChatFirebaseVertexAISafetySettingThreshold.blockNone =>
            f.HarmBlockThreshold.none,
        },
        f.HarmBlockMethod.unspecified,
      ),
    ).toList(growable: false);
  }
}

extension ChatToolListMapper on List<ToolSpec> {
  List<f.Tool> toToolList() {
    return [
      f.Tool.functionDeclarations(
        map((tool) {
          final schema = tool.inputJsonSchema.toSchema();
          return f.FunctionDeclaration(
            tool.name,
            tool.description,
            parameters: schema.properties ?? const {},
            optionalParameters: schema.optionalProperties ?? const [],
          );
        }).toList(growable: false),
      ),
    ];
  }
}

extension SchemaMapper on Map<String, dynamic> {
  f.Schema toSchema() {
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
          return f.Schema.enumString(
            enumValues: enumValues,
            description: description,
            nullable: nullable,
          );
        } else {
          return f.Schema.string(
            description: description,
            nullable: nullable,
          );
        }
      case 'number':
        return f.Schema.number(
          description: description,
          nullable: nullable,
          format: format,
        );
      case 'integer':
        return f.Schema.integer(
          description: description,
          nullable: nullable,
          format: format,
        );
      case 'boolean':
        return f.Schema.boolean(
          description: description,
          nullable: nullable,
        );
      case 'array':
        if (items != null) {
          final itemsSchema = items.toSchema();
          return f.Schema.array(
            description: description,
            nullable: nullable,
            items: itemsSchema,
          );
        }
        throw ArgumentError('Array schema must have "items" property');
      case 'object':
        if (properties != null) {
          final propertiesSchema = properties.map(
            (key, value) => MapEntry(
              key,
              (value as Map<String, dynamic>).toSchema(),
            ),
          );
          return f.Schema.object(
            properties: propertiesSchema,
            optionalProperties: requiredProperties != null
                ? propertiesSchema.keys
                    .where((key) => !requiredProperties.contains(key))
                    .toList(growable: false)
                : propertiesSchema.keys.toList(growable: false),
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
  f.ToolConfig toToolConfig() {
    return switch (this) {
      ChatToolChoiceNone _ => f.ToolConfig(
          functionCallingConfig: f.FunctionCallingConfig.none(),
        ),
      ChatToolChoiceAuto _ => f.ToolConfig(
          functionCallingConfig: f.FunctionCallingConfig.auto(),
        ),
      ChatToolChoiceRequired() => f.ToolConfig(
          functionCallingConfig: f.FunctionCallingConfig.auto(),
        ),
      final ChatToolChoiceForced t => f.ToolConfig(
          functionCallingConfig: f.FunctionCallingConfig.any({t.name}),
        ),
    };
  }
}
