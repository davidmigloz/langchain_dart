import 'dart:convert';

import 'package:json_schema/json_schema.dart';
import 'package:ollama_dart/ollama_dart.dart' as o;

import '../../../language_models/finish_reason.dart';
import '../../../language_models/language_model_usage.dart';
import '../../tools/tool.dart';
import '../chat_message.dart' as msg;
import '../chat_result.dart';
import 'ollama_chat_options.dart';

/// Creates a [o.GenerateChatCompletionRequest] from the given input.
o.GenerateChatCompletionRequest generateChatCompletionRequest(
  List<msg.ChatMessage> messages, {
  required String modelName,
  required OllamaChatOptions? options,
  required OllamaChatOptions defaultOptions,
  List<Tool>? tools,
  double? temperature,
  JsonSchema? outputSchema,
  bool stream = false,
}) {
  // Use native Ollama format parameter for structured output
  final format = outputSchema != null
      ? outputSchema.schemaMap
      : options?.format ?? defaultOptions.format;

  return o.GenerateChatCompletionRequest(
    model: modelName,
    messages: messages.toMessages(),
    format: format,
    keepAlive: options?.keepAlive ?? defaultOptions.keepAlive,
    tools: tools?.toOllamaTools(),
    // Ollama does not currently support toolChoice on the wire, but we pass it
    // for future compatibility.
    stream: stream,
    options: o.RequestOptions(
      numKeep: options?.numKeep ?? defaultOptions.numKeep,
      seed: options?.seed ?? defaultOptions.seed,
      numPredict: options?.numPredict ?? defaultOptions.numPredict,
      topK: options?.topK ?? defaultOptions.topK,
      topP: options?.topP ?? defaultOptions.topP,
      minP: options?.minP ?? defaultOptions.minP,
      tfsZ: options?.tfsZ ?? defaultOptions.tfsZ,
      typicalP: options?.typicalP ?? defaultOptions.typicalP,
      repeatLastN: options?.repeatLastN ?? defaultOptions.repeatLastN,
      temperature:
          temperature ?? options?.temperature ?? defaultOptions.temperature,
      repeatPenalty: options?.repeatPenalty ?? defaultOptions.repeatPenalty,
      presencePenalty:
          options?.presencePenalty ?? defaultOptions.presencePenalty,
      frequencyPenalty:
          options?.frequencyPenalty ?? defaultOptions.frequencyPenalty,
      mirostat: options?.mirostat ?? defaultOptions.mirostat,
      mirostatTau: options?.mirostatTau ?? defaultOptions.mirostatTau,
      mirostatEta: options?.mirostatEta ?? defaultOptions.mirostatEta,
      penalizeNewline:
          options?.penalizeNewline ?? defaultOptions.penalizeNewline,
      stop: options?.stop ?? defaultOptions.stop,
      numa: options?.numa ?? defaultOptions.numa,
      numCtx: options?.numCtx ?? defaultOptions.numCtx,
      numBatch: options?.numBatch ?? defaultOptions.numBatch,
      numGpu: options?.numGpu ?? defaultOptions.numGpu,
      mainGpu: options?.mainGpu ?? defaultOptions.mainGpu,
      lowVram: options?.lowVram ?? defaultOptions.lowVram,
      f16Kv: options?.f16KV ?? defaultOptions.f16KV,
      logitsAll: options?.logitsAll ?? defaultOptions.logitsAll,
      vocabOnly: options?.vocabOnly ?? defaultOptions.vocabOnly,
      useMmap: options?.useMmap ?? defaultOptions.useMmap,
      useMlock: options?.useMlock ?? defaultOptions.useMlock,
      numThread: options?.numThread ?? defaultOptions.numThread,
    ),
  );
}

/// Extension on [List<Tool>] to convert to Ollama SDK tool list.
extension OllamaToolListMapper on List<Tool> {
  /// Converts this list of [Tool]s to a list of Ollama SDK [o.Tool]s.
  List<o.Tool> toOllamaTools() => map(
    (tool) => o.Tool(
      type: o.ToolType.function,
      function: o.ToolFunction(
        name: tool.name,
        description: tool.description,
        parameters: Map<String, dynamic>.from(tool.inputSchema.schemaMap ?? {}),
      ),
    ),
  ).toList(growable: false);
}

/// Extension on [List<msg.Message>] to convert messages to Ollama SDK
/// messages.
extension MessageListMapper on List<msg.ChatMessage> {
  /// Converts this list of [msg.ChatMessage]s to a list of Ollama SDK
  /// [o.Message]s.
  List<o.Message> toMessages() =>
      map(_mapMessage).expand((msg) => msg).toList(growable: false);

  List<o.Message> _mapMessage(msg.ChatMessage message) {
    switch (message.role) {
      case msg.MessageRole.system:
        return [
          o.Message(
            role: o.MessageRole.system,
            content: _extractTextContent(message),
          ),
        ];
      case msg.MessageRole.user:
        // Check if this is a tool result message
        final toolParts = message.parts.whereType<msg.ToolPart>().toList();
        if (toolParts.any((p) => p.result != null)) {
          // Tool result message
          return toolParts
              .where((p) => p.result != null)
              .map(
                (p) => o.Message(role: o.MessageRole.tool, content: p.result!),
              )
              .toList();
        } else {
          return _mapUserMessage(message);
        }
      case msg.MessageRole.model:
        return _mapModelMessage(message);
    }
  }

  List<o.Message> _mapUserMessage(msg.ChatMessage message) {
    final textParts = message.parts.whereType<msg.TextPart>().toList();
    final dataParts = message.parts.whereType<msg.DataPart>().toList();

    if (dataParts.isEmpty) {
      // Text-only message
      final text = textParts.map((p) => p.text).join('\n');
      return [o.Message(role: o.MessageRole.user, content: text)];
    } else if (textParts.length == 1 && dataParts.isNotEmpty) {
      // Single text with images (Ollama's preferred format)
      return [
        o.Message(
          role: o.MessageRole.user,
          content: textParts.first.text,
          images: dataParts
              .map((p) => base64Encode(p.bytes))
              .toList(growable: false),
        ),
      ];
    } else {
      // Multiple parts - map each separately
      return message.parts
          .map((part) {
            if (part is msg.TextPart) {
              return o.Message(role: o.MessageRole.user, content: part.text);
            } else if (part is msg.DataPart) {
              return o.Message(
                role: o.MessageRole.user,
                content: base64Encode(part.bytes),
              );
            }
            return null;
          })
          .nonNulls
          .toList(growable: false);
    }
  }

  List<o.Message> _mapModelMessage(msg.ChatMessage message) {
    final textContent = _extractTextContent(message);
    final toolParts = message.parts.whereType<msg.ToolPart>().toList();

    return [
      o.Message(
        role: o.MessageRole.assistant,
        content: textContent,
        toolCalls: toolParts.isNotEmpty
            ? toolParts
                  .where(
                    (p) => p.kind == msg.ToolPartKind.call,
                  ) // Only tool calls, not results
                  .map(
                    (p) => o.ToolCall(
                      function: o.ToolCallFunction(
                        name: p.name,
                        arguments: p.arguments ?? {},
                      ),
                    ),
                  )
                  .toList(growable: false)
            : null,
      ),
    ];
  }

  String _extractTextContent(msg.ChatMessage message) {
    final textParts = message.parts.whereType<msg.TextPart>();
    if (textParts.isEmpty) {
      return '';
    }
    return textParts.map((p) => p.text).join('\n');
  }
}

/// Extension on [o.GenerateChatCompletionResponse] to convert to [ChatResult].
extension ChatResultMapper on o.GenerateChatCompletionResponse {
  /// Converts this [o.GenerateChatCompletionResponse] to a [ChatResult].
  ChatResult<msg.ChatMessage> toChatResult(String id) {
    final parts = <msg.Part>[];

    // Add text content
    if (message.content.isNotEmpty) {
      parts.add(msg.TextPart(message.content));
    }

    // Add tool calls
    if (message.toolCalls != null) {
      for (final toolCall in message.toolCalls!) {
        if (toolCall.function != null) {
          parts.add(
            msg.ToolPart.call(
              id: '', // Ollama doesn't provide tool call IDs
              name: toolCall.function!.name,
              arguments: toolCall.function!.arguments,
            ),
          );
        }
      }
    }

    final responseMessage = msg.ChatMessage(
      role: msg.MessageRole.model,
      parts: parts,
    );

    return ChatResult<msg.ChatMessage>(
      id: id,
      output: responseMessage,
      messages: [responseMessage],
      finishReason: FinishReason.unspecified,
      metadata: {
        'model': model,
        'created_at': createdAt,
        'done': done,
        'total_duration': totalDuration,
        'load_duration': loadDuration,
        'prompt_eval_count': promptEvalCount,
        'prompt_eval_duration': promptEvalDuration,
        'eval_count': evalCount,
        'eval_duration': evalDuration,
      },
      usage: const LanguageModelUsage(),
    );
  }
}
