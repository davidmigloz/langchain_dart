// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:langchain_compat/langchain_compat.dart';

/// Dumps a ChatResult with its metadata for debugging
void dumpChatResult(ChatResult result, {String? label}) {
  if (label != null) {
    print('\n=== $label ===');
  }
  
  print('Result ID: ${result.id}');
  
  // Show usage if available
  if (result.usage.totalTokens != null) {
    print('Usage: ${result.usage.promptTokens ?? 0} prompt + '
        '${result.usage.responseTokens ?? 0} response = '
        '${result.usage.totalTokens} total tokens');
  }
  
  // Show finish reason
  print('Finish Reason: ${result.finishReason.name}');
  
  // Show metadata if present
  if (result.metadata.isNotEmpty) {
    print('\nMetadata:');
    const encoder = JsonEncoder.withIndent('  ');
    print(encoder.convert(result.metadata));
  }
  
  // Show messages
  if (result.messages.isNotEmpty) {
    print('\nMessages:');
    for (var i = 0; i < result.messages.length; i++) {
      final msg = result.messages[i];
      print('  [$i] ${_messageToSummary(msg)}');
    }
  }
  
  // Show output if it's a ChatMessage
  if (result.output is ChatMessage) {
    final outputSummary = _messageToSummary(result.output as ChatMessage);
    print('\nOutput: $outputSummary');
  } else {
    print('\nOutput: ${result.output}');
  }
}

/// Dumps streaming results with metadata tracking
void dumpStreamingResults(List<ChatResult> results) {
  print('\n=== Streaming Results Summary ===');
  print('Total chunks: ${results.length}');
  
  // Collect all unique metadata keys
  final allMetadataKeys = <String>{};
  for (final result in results) {
    allMetadataKeys.addAll(result.metadata.keys);
  }
  
  if (allMetadataKeys.isNotEmpty) {
    print('\nMetadata keys found: ${allMetadataKeys.join(', ')}');
    
    // Show interesting metadata
    for (final result in results) {
      final meta = result.metadata;
      if (meta.containsKey('suppressed_text') ||
          meta.containsKey('suppressed_tool_calls') ||
          meta.containsKey('extra_return_results')) {
        print('\nChunk with suppressed content:');
        print(const JsonEncoder.withIndent('  ').convert(meta));
      }
    }
  }
}

String _messageToSummary(ChatMessage message) {
  final parts = <String>[];
  
  for (final part in message.parts) {
    if (part is TextPart) {
      final preview = part.text.length > 50 
          ? '${part.text.substring(0, 47)}...' 
          : part.text;
      parts.add('Text("$preview")');
    } else if (part is ToolPart) {
      if (part.kind == ToolPartKind.call) {
        parts.add('ToolCall(${part.name})');
      } else {
        parts.add('ToolResult(${part.name})');
      }
    } else if (part is DataPart) {
      parts.add('Data(${part.mimeType})');
    } else if (part is LinkPart) {
      parts.add('Link(${part.url})');
    }
  }
  
  return '${message.role.name}: [${parts.join(', ')}]';
}
