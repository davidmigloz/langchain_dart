import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart' as g;

import '../../../language_models/language_models.dart';
import '../../tools/tool.dart';
import '../chat_models.dart';

/// Extension on [List<ChatMessage>] to convert chat messages to Google
/// Generative AI SDK content.
extension ChatMessagesMapper on List<ChatMessage> {
  /// Converts this list of [ChatMessage]s to a list of [g.Content]s.
  ///
  /// Groups consecutive ToolChatMessage objects into a single
  /// g.Content.functionResponses() as required by Google's API.
  List<g.Content> toContentList() {
    final nonSystemMessages = where(
      (msg) => msg is! SystemChatMessage,
    ).toList();
    final result = <g.Content>[];

    for (var i = 0; i < nonSystemMessages.length; i++) {
      final message = nonSystemMessages[i];

      if (message is ToolChatMessage) {
        // Collect all consecutive ToolChatMessage objects
        final toolMessages = [message];
        var j = i + 1;
        while (j < nonSystemMessages.length &&
            nonSystemMessages[j] is ToolChatMessage) {
          toolMessages.add(nonSystemMessages[j] as ToolChatMessage);
          j++;
        }

        // Create a single g.Content.functionResponses with all tool responses
        result.add(_mapToolChatMessages(toolMessages));

        // Skip the processed messages
        i = j - 1;
      } else {
        // Handle non-tool messages normally
        result.add(switch (message) {
          SystemChatMessage() => throw AssertionError(
            'System messages should be filtered out',
          ),
          final HumanChatMessage msg => _mapHumanChatMessage(msg),
          final AIChatMessage msg => _mapAIChatMessage(msg),
          final CustomChatMessage msg => _mapCustomChatMessage(msg),
          ToolChatMessage() => throw AssertionError(
            'ToolChatMessage should be handled above',
          ),
        });
      }
    }

    return result;
  }

  g.Content _mapHumanChatMessage(HumanChatMessage msg) {
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
              (p) => switch (p) {
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

  g.Content _mapAIChatMessage(AIChatMessage msg) {
    final contentParts = [
      if (msg.content.isNotEmpty) g.TextPart(msg.content),
      if (msg.toolCalls.isNotEmpty)
        ...msg.toolCalls.map(
          (call) => g.FunctionCall(call.name, call.arguments),
        ),
    ];
    return g.Content.model(contentParts);
  }

  /// Maps multiple ToolChatMessage objects to a single
  /// g.Content.functionResponses. This is required by Google's API - all
  /// function responses must be grouped together
  g.Content _mapToolChatMessages(List<ToolChatMessage> messages) {
    final functionResponses = messages.map((msg) {
      Map<String, Object?>? response;
      try {
        response = jsonDecode(msg.content) as Map<String, Object?>;
      } on Exception catch (_) {
        response = {'result': msg.content};
      }

      // Extract the original function name from our generated ID
      // Format: google_{toolName}_{argsHash} -> toolName
      final functionName = _extractFunctionNameFromId(msg.toolCallId);

      return g.FunctionResponse(functionName, response);
    }).toList();

    return g.Content.functionResponses(functionResponses);
  }

  /// Extracts the original function name from a generated tool call ID.
  ///
  /// For Google IDs in format "google_{toolName}_{argsHash}", returns toolName.
  /// For other providers or malformed IDs, returns the ID as-is.
  String _extractFunctionNameFromId(String toolCallId) {
    if (toolCallId.startsWith('google_')) {
      final parts = toolCallId.split('_');
      if (parts.length >= 3) {
        // Remove 'google' prefix and args hash suffix, keep the tool name
        return parts.sublist(1, parts.length - 1).join('_');
      }
    }
    // Fallback: return the ID as-is (for OpenAI/Anthropic native IDs)
    return toolCallId;
  }

  g.Content _mapCustomChatMessage(CustomChatMessage msg) =>
      g.Content(msg.role, [g.TextPart(msg.content)]);
}

/// Extension on [g.GenerateContentResponse] to convert to [ChatResult].
extension GenerateContentResponseMapper on g.GenerateContentResponse {
  /// Converts this [g.GenerateContentResponse] to a [ChatResult].
  ChatResult<AIChatMessage> toChatResult(String id, String model) {
    final candidate = candidates.first;
    return ChatResult<AIChatMessage>(
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
              (call) => AIChatMessageToolCall(
                id: '', // Google doesn't provide tool call IDs
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

  FinishReason _mapFinishReason(g.FinishReason? reason) => switch (reason) {
    g.FinishReason.unspecified => FinishReason.unspecified,
    g.FinishReason.stop => FinishReason.stop,
    g.FinishReason.maxTokens => FinishReason.length,
    g.FinishReason.safety => FinishReason.contentFilter,
    g.FinishReason.recitation => FinishReason.recitation,
    g.FinishReason.other => FinishReason.unspecified,
    null => FinishReason.unspecified,
  };
}

/// Extension on [List<ChatGoogleGenerativeAISafetySetting>] to convert to
/// Google SDK safety settings.
extension SafetySettingsMapper on List<ChatGoogleGenerativeAISafetySetting> {
  /// Converts this list of [ChatGoogleGenerativeAISafetySetting]s to a list of
  /// [g.SafetySetting]s.
  List<g.SafetySetting> toSafetySettings() => map(
    (setting) => g.SafetySetting(
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

/// Extension on [List<Tool>?] to convert to Google SDK tool list.
extension ChatToolListMapper on List<Tool>? {
  /// Converts this list of [Tool]s to a list of [g.Tool]s, optionally
  /// enabling code execution.
  List<g.Tool>? toToolList({required bool enableCodeExecution}) {
    final hasTools = this != null && this!.isNotEmpty;
    if (!hasTools && !enableCodeExecution) {
      return null;
    }
    final functionDeclarations = hasTools
        ? this!
              .map(
                (tool) => g.FunctionDeclaration(
                  tool.name,
                  tool.description,
                  Map<String, dynamic>.from(
                    tool.inputSchema.schemaMap ?? {},
                  ).toSchema(),
                ),
              )
              .toList(growable: false)
        : null;
    final codeExecution = enableCodeExecution ? g.CodeExecution() : null;
    if ((functionDeclarations == null || functionDeclarations.isEmpty) &&
        codeExecution == null) {
      return null;
    }
    return [
      g.Tool(
        functionDeclarations: functionDeclarations,
        codeExecution: codeExecution,
      ),
    ];
  }
}

/// Extension on [Map<String, dynamic>] to convert to Google SDK schema.
extension SchemaMapper on Map<String, dynamic> {
  /// Converts this map to a [g.Schema].
  g.Schema toSchema() {
    final jsonSchema = this;
    final type = jsonSchema['type'] as String;
    final description = jsonSchema['description'] as String?;
    final nullable = jsonSchema['nullable'] as bool?;
    final enumValues = (jsonSchema['enum'] as List?)?.cast<String>();
    final format = jsonSchema['format'] as String?;
    final items = jsonSchema['items'] != null
        ? Map<String, dynamic>.from(jsonSchema['items'] as Map)
        : null;
    final properties = jsonSchema['properties'] != null
        ? Map<String, dynamic>.from(jsonSchema['properties'] as Map)
        : null;
    final requiredProperties = (jsonSchema['required'] as List?)
        ?.cast<String>();

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
            (key, value) => MapEntry(
              key,
              Map<String, dynamic>.from(value as Map).toSchema(),
            ),
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

/// Extension on [ChatToolChoice] to convert to Google SDK tool config.
extension ChatToolChoiceMapper on ChatToolChoice {
  /// Converts this [ChatToolChoice] to a [g.ToolConfig].
  g.ToolConfig toToolConfig() => switch (this) {
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
