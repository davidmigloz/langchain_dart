import 'chat_message.dart';

/// Manages tool call ID generation and matching for providers that don't
/// natively support tool call IDs (e.g., Ollama, Google).
/// 
/// This class provides deterministic ID generation based on tool name and
/// arguments to ensure proper tool call/result matching even when results
/// come back in a different order than the original calls.
class ToolCallIdManager {
  /// Creates a new [ToolCallIdManager] with the given [prefix].
  /// 
  /// The [prefix] should identify the provider (e.g., 'ollama', 'google').
  const ToolCallIdManager(this.prefix);

  /// The prefix used for generated tool call IDs.
  final String prefix;

  /// Assigns unique IDs to tool calls that don't have them.
  /// 
  /// This method generates deterministic IDs based on the tool name and
  /// arguments hash, ensuring that:
  /// - The same tool call always gets the same ID
  /// - Different tool calls get different IDs
  /// - Tool results can be matched correctly regardless of order
  /// 
  /// Tool calls that already have non-empty IDs are left unchanged.
  List<AIChatMessageToolCall> assignIds(
      List<AIChatMessageToolCall> toolCalls) =>
      toolCalls.map((toolCall) {
        if (toolCall.id.isNotEmpty) {
          // Tool call already has an ID, keep it as-is
          return toolCall;
        }

        // Generate a deterministic ID based on tool name and arguments
        final id = _generateId(toolCall.name, toolCall.argumentsRaw);
        
        return AIChatMessageToolCall(
          id: id,
          name: toolCall.name,
          argumentsRaw: toolCall.argumentsRaw,
          arguments: toolCall.arguments,
        );
      }).toList();

  /// Generates a deterministic ID for a tool call.
  /// 
  /// The ID format is: `{prefix}_{toolName}_{argsHash}`
  /// 
  /// This ensures that:
  /// - Tool calls with the same name and arguments get the same ID
  /// - Tool calls with different names or arguments get different IDs
  /// - IDs are deterministic and reproducible
  String _generateId(String toolName, String argumentsRaw) {
    final argsHash = argumentsRaw.hashCode.abs();
    return '${prefix}_${toolName}_$argsHash';
  }

  /// Validates that all tool calls in a list have unique IDs.
  /// 
  /// This is useful for debugging and ensuring the ID generation
  /// is working correctly.
  bool validateUniqueIds(List<AIChatMessageToolCall> toolCalls) {
    final ids = toolCalls.map((tc) => tc.id).toSet();
    return ids.length == toolCalls.length;
  }

  /// Gets debugging information about tool call IDs.
  /// 
  /// Returns a map showing the ID generation for each tool call.
  Map<String, String> getDebugInfo(List<AIChatMessageToolCall> toolCalls) {
    final info = <String, String>{};
    
    for (var i = 0; i < toolCalls.length; i++) {
      final toolCall = toolCalls[i];
      final generatedId = toolCall.id.isEmpty 
          ? _generateId(toolCall.name, toolCall.argumentsRaw)
          : toolCall.id;
      
      info['toolCall_$i'] = 'name: ${toolCall.name}, '
          'args: ${toolCall.argumentsRaw}, '
          'id: ${toolCall.id}, '
          'generated: $generatedId';
    }
    
    return info;
  }
}
