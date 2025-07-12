// ignore_for_file: avoid_print

import 'package:langchain_compat/langchain_compat.dart';

void dumpMessageHistory(List<ChatMessage> history) {
  print('--------------------------------');
  print('# Message History:');
  for (final message in history) {
    print('- ${_messageToSingleLine(message)}');
    if (message.metadata.isNotEmpty) {
      print('  Metadata: ${message.metadata}');
    }
  }
  print('--------------------------------');
}

String _messageToSingleLine(ChatMessage message) {
  final roleName = message.role.name;
  final parts = [
    for (final part in message.parts)
      switch (part) {
        (final TextPart _) => 'TextPart{${part.text.trim()}}',
        (final DataPart _) =>
          'DataPart{mimeType: ${part.mimeType}, size: ${part.bytes.length}}',
        (final LinkPart _) => 'LinkPart{url: ${part.url}}',
        (final ToolPart _) => switch (part.kind) {
          ToolPartKind.call =>
            'ToolPart.call{id: ${part.id}, name: ${part.name}, '
                'args: ${part.arguments}}',
          ToolPartKind.result =>
            'ToolPart.result{id: ${part.id}, name: ${part.name}, '
                'result: ${part.result}}',
        },
        (final Part _) => throw UnimplementedError(),
      },
  ];

  return 'Message.$roleName(${parts.join(', ')})';
}
