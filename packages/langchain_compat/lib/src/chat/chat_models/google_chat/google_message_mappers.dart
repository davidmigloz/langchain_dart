import 'package:google_generative_ai/google_generative_ai.dart' as g;
import 'package:logging/logging.dart';

import '../../../language_models/language_models.dart';
import '../../tools/tool.dart';
import '../chat_message.dart' as msg;
import '../chat_models.dart';

/// Logger for Google message mapping operations.
final Logger _logger = Logger('dartantic.chat.mappers.google');

/// Extension on [List<msg.Message>] to convert messages to Google
/// Generative AI SDK content.
extension MessageListMapper on List<msg.ChatMessage> {
  /// Converts this list of [msg.ChatMessage]s to a list of [g.Content]s.
  ///
  /// Groups consecutive tool result messages into a single
  /// g.Content.functionResponses() as required by Google's API.
  List<g.Content> toContentList() {
    final nonSystemMessages = where(
      (message) => message.role != msg.MessageRole.system,
    ).toList();
    _logger.fine(
      'Converting ${nonSystemMessages.length} non-system messages to Google '
      'format',
    );
    final result = <g.Content>[];

    for (var i = 0; i < nonSystemMessages.length; i++) {
      final message = nonSystemMessages[i];

      // Check if this is a tool result message
      final hasToolResults = message.parts.whereType<msg.ToolPart>().any(
        (p) => p.result != null,
      );

      if (hasToolResults) {
        // Collect all consecutive tool result messages
        final toolMessages = [message];
        var j = i + 1;
        _logger.fine(
          'Found tool result message at index $i, collecting consecutive tool '
          'messages',
        );
        while (j < nonSystemMessages.length) {
          final nextMsg = nonSystemMessages[j];
          final nextHasToolResults = nextMsg.parts
              .whereType<msg.ToolPart>()
              .any((p) => p.result != null);
          if (nextHasToolResults) {
            toolMessages.add(nextMsg);
            j++;
          } else {
            break;
          }
        }

        // Create a single g.Content.functionResponses with all tool responses
        _logger.fine(
          'Creating function responses for ${toolMessages.length} tool '
          'messages',
        );
        result.add(_mapToolResultMessages(toolMessages));

        // Skip the processed messages
        i = j - 1;
      } else {
        // Handle non-tool messages normally
        result.add(_mapMessage(message));
      }
    }

    return result;
  }

  g.Content _mapMessage(msg.ChatMessage message) {
    switch (message.role) {
      case msg.MessageRole.system:
        throw AssertionError('System messages should be filtered out');
      case msg.MessageRole.user:
        return _mapUserMessage(message);
      case msg.MessageRole.model:
        return _mapModelMessage(message);
    }
  }

  g.Content _mapUserMessage(msg.ChatMessage message) {
    final contentParts = <g.Part>[];
    _logger.fine('Mapping user message with ${message.parts.length} parts');

    for (final part in message.parts) {
      switch (part) {
        case msg.TextPart(:final text):
          contentParts.add(g.TextPart(text));
        case msg.DataPart(:final bytes, :final mimeType):
          contentParts.add(g.DataPart(mimeType, bytes));
        case msg.LinkPart(:final url):
          contentParts.add(g.FilePart(Uri.parse(url)));
        case msg.ToolPart():
          // Tool parts in user messages are handled separately as tool results
          break;
      }
    }

    return g.Content.multi(contentParts);
  }

  g.Content _mapModelMessage(msg.ChatMessage message) {
    final contentParts = <g.Part>[];

    // Add text parts
    final textParts = message.parts.whereType<msg.TextPart>();
    _logger.fine('Mapping model message with ${message.parts.length} parts');
    for (final part in textParts) {
      if (part.text.isNotEmpty) {
        contentParts.add(g.TextPart(part.text));
      }
    }

    // Add tool calls
    final toolParts = message.parts.whereType<msg.ToolPart>();
    var toolCallCount = 0;
    for (final part in toolParts) {
      if (part.kind == msg.ToolPartKind.call) {
        // This is a tool call, not a result
        contentParts.add(g.FunctionCall(part.name, part.arguments ?? {}));
        toolCallCount++;
      }
    }
    _logger.fine('Added $toolCallCount tool calls to model message');

    return g.Content.model(contentParts);
  }

  /// Maps multiple tool result messages to a single
  /// g.Content.functionResponses. This is required by Google's API - all
  /// function responses must be grouped together
  g.Content _mapToolResultMessages(List<msg.ChatMessage> messages) {
    final functionResponses = <g.FunctionResponse>[];
    _logger.fine(
      'Mapping ${messages.length} tool result messages to Google function '
      'responses',
    );

    for (final message in messages) {
      for (final part in message.parts) {
        if (part is msg.ToolPart && part.kind == msg.ToolPartKind.result) {
          // Google's FunctionResponse requires a Map<String, Object?>
          // If the result is already a Map, use it directly
          // Otherwise, wrap it in a Map with a "result" key
          final response = switch (part.result) {
            final Map<String, Object?> map => map,
            _ => <String, Object?>{'result': part.result},
          };

          // Extract the original function name from our generated ID
          // Format: google_{toolName}_{argsHash} -> toolName
          final functionName = _extractFunctionNameFromId(part.id);
          _logger.fine('Creating function response for tool: $functionName');

          functionResponses.add(g.FunctionResponse(functionName, response));
        }
      }
    }

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
}

/// Extension on [g.GenerateContentResponse] to convert to [ChatResult].
extension GenerateContentResponseMapper on g.GenerateContentResponse {
  /// Converts this [g.GenerateContentResponse] to a [ChatResult].
  ChatResult<msg.ChatMessage> toChatResult(String id, String model) {
    final candidate = candidates.first;
    final parts = <msg.Part>[];
    _logger.fine(
      'Converting Google response to ChatResult: id=$id, model=$model',
    );

    // Process all parts from the response
    _logger.fine(
      'Processing ${candidate.content.parts.length} parts from Google response',
    );
    for (final part in candidate.content.parts) {
      switch (part) {
        case g.TextPart(:final text):
          if (text.isNotEmpty) {
            parts.add(msg.TextPart(text));
          }
        case g.DataPart(:final mimeType, :final bytes):
          parts.add(msg.DataPart(bytes: bytes, mimeType: mimeType));
        case g.FilePart(:final uri):
          parts.add(msg.LinkPart(url: uri.toString()));
        case g.FunctionCall(:final name, :final args):
          _logger.fine('Processing function call: $name');
          parts.add(
            msg.ToolPart.call(
              id: '', // Google doesn't provide tool call IDs
              name: name,
              arguments: args,
            ),
          );
        case g.FunctionResponse():
          // Function responses shouldn't appear in model output
          break;
        case g.ExecutableCode():
          // Could map to a custom part type in the future
          break;
        case g.CodeExecutionResult():
          // Could map to a custom part type in the future
          break;
      }
    }

    final message = msg.ChatMessage(role: msg.MessageRole.model, parts: parts);

    return ChatResult<msg.ChatMessage>(
      id: id,
      output: message,
      messages: [message],
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
  List<g.SafetySetting> toSafetySettings() {
    _logger.fine('Converting $length safety settings to Google format');
    return map(
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
}

/// Extension on [List<Tool>?] to convert to Google SDK tool list.
extension ChatToolListMapper on List<Tool>? {
  /// Converts this list of [Tool]s to a list of [g.Tool]s, optionally
  /// enabling code execution.
  List<g.Tool>? toToolList({required bool enableCodeExecution}) {
    final hasTools = this != null && this!.isNotEmpty;
    _logger.fine(
      'Converting tools to Google format: hasTools=$hasTools, '
      'enableCodeExecution=$enableCodeExecution, '
      'toolCount=${this?.length ?? 0}',
    );
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
    _logger.fine('Converting schema to Google format: type=$type');
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
          _logger.fine('Converting array schema with items');
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
          _logger.fine(
            'Converting object schema with ${properties.length} properties',
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

// TODO: Add tool choice support when it's re-implemented
