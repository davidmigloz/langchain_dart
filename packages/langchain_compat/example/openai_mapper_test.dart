import 'package:langchain_compat/langchain_compat.dart';
import 'package:langchain_compat/src/chat/chat_models/openai_chat/openai_message_mappers.dart';

void main() {
  print('Testing OpenAI message mapper...\n');
  
  // Create some test messages
  final messages = [
    Message.system('You are a helpful assistant.'),
    Message.user('What is 2+2?'),
    Message(
      role: MessageRole.model,
      parts: [
        TextPart('Let me calculate that for you.'),
        ToolPart.call(
          id: 'call_123',
          name: 'calculator',
          arguments: {'expression': '2+2'},
        ),
      ],
    ),
    Message(
      role: MessageRole.user,
      parts: [
        ToolPart.result(
          id: 'call_123',
          name: 'calculator',
          result: {'answer': 4},
        ),
      ],
    ),
    Message.model('The answer is 4.'),
  ];
  
  print('Original messages:');
  for (final msg in messages) {
    print('  ${msg.role}: ${_summarizeMessage(msg)}');
  }
  
  // Convert to OpenAI format
  final openAIMessages = messages.toOpenAIMessages();
  
  print('\nConverted to OpenAI format:');
  for (final msg in openAIMessages) {
    print('  ${msg.role}: ${_summarizeOpenAIMessage(msg)}');
  }
  
  print('\n✅ OpenAI mapper test completed!');
}

String _summarizeMessage(Message msg) {
  final parts = <String>[];
  
  for (final part in msg.parts) {
    switch (part) {
      case TextPart(:final text):
        parts.add(text);
      case DataPart(:final mimeType, :final bytes):
        parts.add('[Data: $mimeType, ${bytes.length} bytes]');
      case LinkPart(:final url):
        parts.add('[Link: $url]');
      case ToolPart(:final kind, :final name, :final id):
        if (kind == ToolPartKind.call) {
          parts.add('[Tool call: $name($id)]');
        } else {
          parts.add('[Tool result: $name($id)]');
        }
    }
  }
  
  return parts.join(' ');
}

String _summarizeOpenAIMessage(dynamic msg) {
  final role = msg.role.toString().split('.').last;
  switch (role) {
    case 'system':
      return msg.content ?? '';
    case 'user':
      if (msg.content is String) {
        return msg.content;
      } else {
        return '[Complex content]';
      }
    case 'assistant':
      final content = msg.content ?? '';
      final toolCalls = msg.toolCalls?.length ?? 0;
      if (toolCalls > 0) {
        return '$content [$toolCalls tool calls]';
      }
      return content;
    case 'tool':
      return 'Tool result for ${msg.toolCallId}: ${msg.content}';
    default:
      return '[Unknown role: $role]';
  }
}