import 'package:uuid/uuid.dart';

import '../chat_message.dart';

/// Centralized helper for generating and coordinating tool call IDs across
/// all providers.
///
/// This class provides consistent tool ID generation and coordination for
/// providers that don't supply their own IDs (Google, Ollama) and for fixing
/// providers that supply empty IDs (Google's OpenAI endpoint).
class ToolIdHelpers {
  static const _uuid = Uuid();

  /// Generates a unique tool call ID.
  ///
  /// Returns a standard UUID v4 for maximum compatibility across all
  /// providers. Some providers have strict requirements for ID format
  /// (alphanumeric + dashes).
  static String generateToolCallId({
    required String toolName,
    String? providerHint,
    Map<String, dynamic>? arguments,
    int? index,
  }) => _uuid.v4();

  /// Validates that a tool call ID is well-formed.
  /// Any non-empty string is considered valid since providers may use their
  /// own ID formats.
  static bool isValidToolCallId(String id) => id.isNotEmpty;

  /// Extracts the tool name from a generated tool call ID.
  ///
  /// Since we now use pure UUIDs, this method can't extract tool names.
  /// Returns null as tool names must be tracked separately.
  static String? extractToolNameFromId(String toolCallId) => null;

  /// Fixes empty or invalid tool call IDs in a message.
  ///
  /// This is used by providers that receive empty IDs (like Google's OpenAI
  /// endpoint) or no IDs (like native Google and Ollama).
  static List<Part> assignToolCallIds(
    List<Part> parts, {
    required String providerHint,
  }) {
    var toolIndex = 0;
    return parts.map((part) {
      if (part is ToolPart && part.kind == ToolPartKind.call) {
        if (part.id.isEmpty) {
          // Generate a new ID for this tool call
          final newId = generateToolCallId(
            toolName: part.name,
            providerHint: providerHint,
            arguments: part.arguments,
            index: toolIndex++,
          );
          return ToolPart.call(
            id: newId,
            name: part.name,
            arguments: part.arguments ?? {},
          );
        }
      }
      return part;
    }).toList();
  }
}

/// Coordinates tool IDs across multiple simultaneous tool calls in a response.
///
/// This class manages the relationship between tool calls and their results,
/// ensuring proper ID matching even when multiple tools are called in parallel.
class ToolIdCoordinator {
  /// Creates a new coordinator instance.
  ToolIdCoordinator();

  /// Map of tool call IDs to their metadata.
  final Map<String, _ToolCallMetadata> _toolCalls = {};

  /// Registers a tool call with the coordinator.
  ///
  /// This should be called when a tool call is identified in a model response.
  void registerToolCall({
    required String id,
    required String name,
    Map<String, dynamic>? arguments,
  }) {
    _toolCalls[id] = _ToolCallMetadata(
      id: id,
      name: name,
      arguments: arguments,
      registeredAt: DateTime.now(),
    );
  }

  /// Validates that a tool result ID matches a registered tool call.
  ///
  /// Returns true if the ID corresponds to a registered tool call.
  bool validateToolResultId(String id) => _toolCalls.containsKey(id);

  /// Gets the tool name for a given tool call ID.
  ///
  /// Returns null if the ID is not registered.
  String? getToolNameForId(String id) => _toolCalls[id]?.name;

  /// Gets all registered tool call IDs.
  List<String> get registeredIds => _toolCalls.keys.toList();

  /// Validates that all tool calls have corresponding results.
  ///
  /// Returns a list of tool call IDs that don't have results.
  List<String> findUnmatchedToolCalls(List<String> resultIds) {
    final resultIdSet = resultIds.toSet();
    return _toolCalls.keys.where((id) => !resultIdSet.contains(id)).toList();
  }

  /// Clears all registered tool calls.
  void clear() {
    _toolCalls.clear();
  }

  /// Creates a debug string showing the current state.
  String debugString() {
    final buffer = StringBuffer('ToolIdCoordinator State:\n');
    for (final entry in _toolCalls.entries) {
      final meta = entry.value;
      buffer.writeln('  ${entry.key}: ${meta.name} (${meta.arguments})');
    }
    return buffer.toString();
  }
}

/// Metadata for a registered tool call.
class _ToolCallMetadata {
  _ToolCallMetadata({
    required this.id,
    required this.name,
    required this.registeredAt,
    this.arguments,
  });

  final String id;
  final String name;
  final Map<String, dynamic>? arguments;
  final DateTime registeredAt;
}

/// Extension methods for validating tool ID consistency in messages.
extension ToolIdValidation on ChatMessage {
  /// Validates that all tool results have matching tool calls.
  ///
  /// Returns a list of validation errors, or empty list if valid.
  List<String> validateToolIds() {
    final errors = <String>[];
    final toolCalls = parts.whereType<ToolPart>().where(
      (p) => p.kind == ToolPartKind.call,
    );
    final toolResults = parts.whereType<ToolPart>().where(
      (p) => p.kind == ToolPartKind.result,
    );

    // Check for empty IDs
    for (final call in toolCalls) {
      if (call.id.isEmpty) {
        errors.add('Tool call "${call.name}" has empty ID');
      }
    }

    for (final result in toolResults) {
      if (result.id.isEmpty) {
        errors.add('Tool result for "${result.name}" has empty ID');
      }
    }

    // In a single message, we can't validate call/result matching
    // That requires coordination across multiple messages
    return errors;
  }

  /// Ensures all tool calls in this message have valid IDs.
  ///
  /// Returns a new message with IDs assigned to any tool calls that lack them.
  ChatMessage ensureToolCallIds({required String providerHint}) {
    final needsUpdate = parts.any(
      (part) =>
          part is ToolPart && part.kind == ToolPartKind.call && part.id.isEmpty,
    );

    if (!needsUpdate) return this;

    return ChatMessage(
      role: role,
      parts: ToolIdHelpers.assignToolCallIds(parts, providerHint: providerHint),
    );
  }
}

/// Extension for coordinating tool IDs across a conversation.
extension ConversationToolIdValidation on List<ChatMessage> {
  /// Validates tool ID consistency across the entire conversation.
  ///
  /// Ensures every tool result has a matching tool call with the same ID.
  List<String> validateConversationToolIds() {
    final errors = <String>[];
    final coordinator = ToolIdCoordinator();

    for (var i = 0; i < length; i++) {
      final message = this[i];

      // Validate individual message
      errors.addAll(message.validateToolIds().map((e) => 'Message $i: $e'));

      // Register tool calls
      for (final part in message.parts) {
        if (part is ToolPart && part.kind == ToolPartKind.call) {
          coordinator.registerToolCall(
            id: part.id,
            name: part.name,
            arguments: part.arguments,
          );
        }
      }

      // Validate tool results have matching calls
      for (final part in message.parts) {
        if (part is ToolPart && part.kind == ToolPartKind.result) {
          if (!coordinator.validateToolResultId(part.id)) {
            errors.add(
              'Message $i: Tool result "${part.name}" has ID "${part.id}" '
              'with no matching tool call',
            );
          }
        }
      }
    }

    return errors;
  }
}
