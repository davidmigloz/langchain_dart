import 'package:mistralai_dart/mistralai_dart.dart';

import '../../../language_models/language_models.dart';
import '../chat_models.dart';
import '../message.dart' as msg;

/// Extension on [List<msg.Message>] to convert messages to Mistral SDK
/// messages.
extension MessageListMapper on List<msg.Message> {
  /// Converts this list of [msg.Message]s to a list of Mistral SDK
  /// [ChatCompletionMessage]s.
  List<ChatCompletionMessage> toChatCompletionMessages() =>
      map(_mapMessage).toList(growable: false);

  ChatCompletionMessage _mapMessage(msg.Message message) {
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
          throw UnsupportedError('Mistral AI does not support tool calls');
        }
        
        return ChatCompletionMessage(
          role: ChatCompletionMessageRole.assistant,
          content: _extractTextContent(message),
        );
    }
  }

  String _extractTextContent(msg.Message message) {
    final textParts = message.parts.whereType<msg.TextPart>();
    if (textParts.isEmpty) {
      return '';
    }
    return textParts.map((p) => p.text).join('\n');
  }
}

/// Extension on [ChatCompletionResponse] to convert to [ChatResult].
extension ChatResultMapper on ChatCompletionResponse {
  /// Converts this [ChatCompletionResponse] to a [ChatResult].
  ChatResult<msg.Message> toChatResult() {
    final choice = choices.first;
    final content = choice.message?.content ?? '';
    
    final message = msg.Message(
      role: msg.MessageRole.model,
      parts: content.isNotEmpty ? [msg.TextPart(content)] : [],
    );
    
    return ChatResult<msg.Message>(
      id: id,
      output: message,
      messages: [message],
      finishReason: _mapFinishReason(choice.finishReason),
      metadata: {'model': model, 'created': created},
      usage: _mapUsage(usage),
    );
  }

  LanguageModelUsage _mapUsage(ChatCompletionUsage usage) => LanguageModelUsage(
    promptTokens: usage.promptTokens,
    responseTokens: usage.completionTokens,
    totalTokens: usage.totalTokens,
  );
}

/// Mapper for [ChatCompletionStreamResponse].
extension CreateChatCompletionStreamResponseMapper
    on ChatCompletionStreamResponse {
  /// Converts a [ChatCompletionStreamResponse] to a [ChatResult].
  ChatResult<msg.Message> toChatResult() {
    final choice = choices.first;
    final content = choice.delta.content ?? '';
    
    final message = msg.Message(
      role: msg.MessageRole.model,
      parts: content.isNotEmpty ? [msg.TextPart(content)] : [],
    );
    
    return ChatResult<msg.Message>(
      id: id,
      output: message,
      messages: [message],
      finishReason: _mapFinishReason(choice.finishReason),
      metadata: {'model': model, 'created': created},
      usage: const LanguageModelUsage(),
    );
  }
}

FinishReason _mapFinishReason(ChatCompletionFinishReason? reason) =>
    switch (reason) {
      ChatCompletionFinishReason.stop => FinishReason.stop,
      ChatCompletionFinishReason.length => FinishReason.length,
      ChatCompletionFinishReason.modelLength => FinishReason.length,
      null => FinishReason.unspecified,
    };