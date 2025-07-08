import 'dart:convert';

import '../chat_message.dart';

/// Static helper methods for extracting specific types of parts from a list.
class MessagePartHelpers {
  /// Extracts and concatenates all text content from TextPart instances.
  ///
  /// Returns a single string with all text content concatenated together
  /// without any separators. Empty text parts are included in the result.
  static String extractText(List<Part> parts) =>
      parts.whereType<TextPart>().map((p) => p.text).join();

  /// Extracts all tool call parts from the list.
  ///
  /// Returns only ToolPart instances where kind == ToolPartKind.call.
  static List<ToolPart> extractToolCalls(List<Part> parts) => parts
      .whereType<ToolPart>()
      .where((p) => p.kind == ToolPartKind.call)
      .toList();

  /// Extracts all tool result parts from the list.
  ///
  /// Returns only ToolPart instances where kind == ToolPartKind.result.
  static List<ToolPart> extractToolResults(List<Part> parts) => parts
      .whereType<ToolPart>()
      .where((p) => p.kind == ToolPartKind.result)
      .toList();
}

/// Static helper methods for handling tool results of any type.
class ToolResultHelpers {
  /// Serializes the result to a string representation.
  ///
  /// If the result is already a String, returns it as-is.
  /// Otherwise, encodes it as JSON.
  static String serialize(dynamic result) =>
      result is String ? result : json.encode(result);

  /// Ensures the result is wrapped in a Map&lt;String, dynamic&gt;.
  ///
  /// If the result is already a Map&lt;String, dynamic&gt;, returns it as-is.
  /// Otherwise, wraps it in a map with key 'result'.
  static Map<String, dynamic> ensureMap(dynamic result) {
    // Only return as-is if it's already Map<String, dynamic>
    if (result is Map<String, dynamic>) {
      return result;
    }
    return <String, dynamic>{'result': result};
  }
}
