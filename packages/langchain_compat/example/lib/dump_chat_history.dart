// ignore_for_file: avoid_print

import 'package:langchain_compat/langchain_compat.dart';
import 'package:langchain_compat/src/chat/chat_models/chat_message.dart';

void dumpChatHistory(List<ChatMessage> history) {
  print('--------------------------------');
  print('# Chat History:');
  for (final message in history) {
    print('- ${_chatMessageToSingleLine(message)}');
  }
  print('--------------------------------');
}

String _chatMessageToSingleLine(ChatMessage message) {
  final type = message.runtimeType;
  if (message is SystemChatMessage) {
    final content = message.content.trim();
    return content.isNotEmpty
        ? "SystemChatMessage{content: '$content'}"
        : 'SystemChatMessage{}';
  } else if (message is HumanChatMessage) {
    final contentStr = _contentToSingleLine(message.content);
    return contentStr.isNotEmpty
        ? 'HumanChatMessage{content: $contentStr}'
        : 'HumanChatMessage{}';
  } else if (message is AIChatMessage) {
    final fields = <String>[];
    final content = message.content.trim();
    if (content.isNotEmpty) fields.add("content: '$content'");
    if (message.toolCalls.isNotEmpty) {
      fields.add(
        'toolCalls: '
        '[${message.toolCalls.map(_toolCallToSingleLine).join(', ')}]',
      );
    }
    return fields.isNotEmpty
        ? 'AIChatMessage{${fields.join(', ')}}'
        : 'AIChatMessage{}';
  } else if (message is ToolChatMessage) {
    final fields = <String>[];
    final toolCallId = message.toolCallId.trim();
    final content = message.content.trim();
    if (toolCallId.isNotEmpty) fields.add("toolCallId: '$toolCallId'");
    if (content.isNotEmpty) fields.add("content: '$content'");
    return fields.isNotEmpty
        ? 'ToolChatMessage{${fields.join(', ')}}'
        : 'ToolChatMessage{}';
  } else if (message is CustomChatMessage) {
    final fields = <String>[];
    final role = message.role.trim();
    final content = message.content.trim();
    if (role.isNotEmpty) fields.add("role: '$role'");
    if (content.isNotEmpty) fields.add("content: '$content'");
    return fields.isNotEmpty
        ? 'CustomChatMessage{${fields.join(', ')}}'
        : 'CustomChatMessage{}';
  } else {
    return '$type{UNKNOWN FIELDS}';
  }
}

String _toolCallToSingleLine(AIChatMessageToolCall call) {
  final fields = <String>[];
  final id = call.id.trim();
  final name = call.name.trim();
  final argumentsRaw = call.argumentsRaw.trim();
  if (id.isNotEmpty) fields.add("id: '$id'");
  if (name.isNotEmpty) fields.add("name: '$name'");
  if (argumentsRaw.isNotEmpty) fields.add("argumentsRaw: '$argumentsRaw'");
  if (call.arguments.isNotEmpty) {
    fields.add('arguments: ${_mapToSingleLine(call.arguments)}');
  }
  return '{${fields.join(', ')}}';
}

String _contentToSingleLine(ChatMessageContent content) {
  if (content is ChatMessageContentText) {
    final text = content.text.trim();
    return text.isNotEmpty
        ? "ChatMessageContentText{text: '$text'}"
        : 'ChatMessageContentText{}';
  } else if (content is ChatMessageContentImage) {
    final fields = <String>[];
    final data = content.data.trim();
    final mimeType = content.mimeType?.trim();
    if (data.isNotEmpty) fields.add("data: '$data'");
    if (mimeType != null && mimeType.isNotEmpty) {
      fields.add("mimeType: '$mimeType'");
    }
    fields.add('detail: ${content.detail.name}');
    return fields.isNotEmpty
        ? 'ChatMessageContentImage{${fields.join(', ')}}'
        : 'ChatMessageContentImage{}';
  } else if (content is ChatMessageContentMultiModal) {
    if (content.parts.isNotEmpty) {
      return 'ChatMessageContentMultiModal{parts: '
          '[${content.parts.map(_contentToSingleLine).join(', ')}]}';
    } else {
      return 'ChatMessageContentMultiModal{}';
    }
  } else {
    return '${content.runtimeType}{}';
  }
}

String _mapToSingleLine(Map map) {
  final entries = map.entries.where(
    (e) =>
        e.value != null &&
        (e.value is! String || (e.value as String).isNotEmpty),
  );
  final parts = entries.map((e) => '${e.key}: ${e.value}').join(', ');
  return '{$parts}';
}
