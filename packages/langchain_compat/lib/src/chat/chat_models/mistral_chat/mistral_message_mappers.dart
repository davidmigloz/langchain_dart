import 'package:logging/logging.dart';
import 'package:mistralai_dart/mistralai_dart.dart';

import '../../../language_models/language_models.dart';
import '../chat_message.dart' as msg;
import '../chat_models.dart';

/// Logger for Mistral message mapping operations.
final Logger _logger = Logger('dartantic.chat.mappers.mistral');

/// Extension on [List<msg.Message>] to convert messages to Mistral SDK
/// messages.
extension MessageListMapper on List<msg.ChatMessage> {
  /// Converts this list of [msg.ChatMessage]s to a list of Mistral SDK
  /// [ChatCompletionMessage]s.
  List<ChatCompletionMessage> toChatCompletionMessages() {
    _logger.fine('Converting $length messages to Mistral format');
    return map(_mapMessage).toList(growable: false);
  }

  ChatCompletionMessage _mapMessage(msg.ChatMessage message) {
    _logger.fine(
      'Mapping ${message.role.name} message with ${message.parts.length} parts',
    );
    switch (message.role) {
      case msg.MessageRole.system:
        return ChatCompletionMessage(
          role: ChatCompletionMessageRole.system,
          content: _extractTextContent(message),
        );
      case msg.MessageRole.user:
        return ChatCompletionMessage(
          role: ChatCompletionMessageRole.user,
          content: _extractTextContent(message),
        );
      case msg.MessageRole.model:
        // Check for tool calls
        final toolParts = message.parts.whereType<msg.ToolPart>().toList();
        if (toolParts.isNotEmpty) {
          _logger.warning(
            'Mistral AI does not support tool calls, '
            'found ${toolParts.length} tool parts',
          );
          throw UnsupportedError('Mistral AI does not support tool calls');
        }

        return ChatCompletionMessage(
          role: ChatCompletionMessageRole.assistant,
          content: _extractTextContent(message),
        );
    }
  }

  String _extractTextContent(msg.ChatMessage message) {
    final textParts = message.parts.whereType<msg.TextPart>();
    if (textParts.isEmpty) {
      _logger.fine('No text parts found in message');
      return '';
    }
    final content = textParts.map((p) => p.text).join('\n');
    _logger.fine('Extracted text content: ${content.length} characters');
    return content;
  }
}

/// Extension on [ChatCompletionResponse] to convert to [ChatResult].
extension ChatResultMapper on ChatCompletionResponse {
  /// Converts this [ChatCompletionResponse] to a [ChatResult].
  ChatResult<msg.ChatMessage> toChatResult() {
    final choice = choices.first;
    final content = choice.message?.content ?? '';
    _logger.fine(
      'Converting Mistral response to ChatResult: id=$id, '
      'content=${content.length} characters',
    );

    final message = msg.ChatMessage(
      role: msg.MessageRole.model,
      parts: content.isNotEmpty ? [msg.TextPart(content)] : [],
    );

    return ChatResult<msg.ChatMessage>(
      id: id,
      output: message,
      messages: [message],
      finishReason: _mapFinishReason(choice.finishReason),
      metadata: {'model': model, 'created': created},
      usage: _mapUsage(usage),
    );
  }

  LanguageModelUsage _mapUsage(ChatCompletionUsage usage) {
    _logger.fine(
      'Mapping usage: prompt=${usage.promptTokens}, '
      'response=${usage.completionTokens}, total=${usage.totalTokens}',
    );
    return LanguageModelUsage(
      promptTokens: usage.promptTokens,
      responseTokens: usage.completionTokens,
      totalTokens: usage.totalTokens,
    );
  }
}

/// Mapper for [ChatCompletionStreamResponse].
extension CreateChatCompletionStreamResponseMapper
    on ChatCompletionStreamResponse {
  /// Converts a [ChatCompletionStreamResponse] to a [ChatResult].
  ChatResult<msg.ChatMessage> toChatResult() {
    final choice = choices.first;
    final content = choice.delta.content ?? '';
    _logger.fine(
      'Converting Mistral stream response to ChatResult: id=$id, '
      'content=${content.length} characters',
    );

    final message = msg.ChatMessage(
      role: msg.MessageRole.model,
      parts: content.isNotEmpty ? [msg.TextPart(content)] : [],
    );

    return ChatResult<msg.ChatMessage>(
      id: id,
      output: message,
      messages: [message],
      finishReason: _mapFinishReason(choice.finishReason),
      metadata: {'model': model, 'created': created},
      usage: const LanguageModelUsage(),
    );
  }
}

FinishReason _mapFinishReason(ChatCompletionFinishReason? reason) {
  final mapped = switch (reason) {
    ChatCompletionFinishReason.stop => FinishReason.stop,
    ChatCompletionFinishReason.length => FinishReason.length,
    ChatCompletionFinishReason.modelLength => FinishReason.length,
    null => FinishReason.unspecified,
  };
  _logger.fine('Mapped finish reason: $reason -> $mapped');
  return mapped;
}
