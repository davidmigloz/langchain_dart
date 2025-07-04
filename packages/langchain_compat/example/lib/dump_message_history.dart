// ignore_for_file: avoid_print

import 'package:langchain_compat/langchain_compat.dart';

void dumpMessageHistory(List<Message> history) {
  print('--------------------------------');
  print('# Message History:');
  for (final message in history) {
    print('- ${_messageToSingleLine(message)}');
  }
  print('--------------------------------');
}

String _messageToSingleLine(Message message) {
  final roleName = message.role.name;
  final parts = <String>[];
  
  for (final part in message.parts) {
    if (part is TextPart) {
      parts.add('TextPart{${part.text.trim()}}');
    } else if (part is DataPart) {
      parts.add('DataPart{mimeType: ${part.mimeType}, size: ${part.bytes.length}}');
    } else if (part is LinkPart) {
      parts.add('LinkPart{url: ${part.url}}');
    } else if (part is ToolPart) {
      if (part.kind == ToolPartKind.call) {
        parts.add('ToolPart.call{id: ${part.id}, name: ${part.name}, args: ${part.arguments}}');
      } else {
        parts.add('ToolPart.result{id: ${part.id}, name: ${part.name}, result: ${part.result}}');
      }
    }
  }
  
  final partsStr = parts.isEmpty ? 'no parts' : parts.join(', ');
  return 'Message{role: $roleName, parts: [$partsStr]}';
}