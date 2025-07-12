import 'dart:typed_data';

import 'package:meta/meta.dart';

/// A message in a conversation between a user and a model.
@immutable
class ChatMessage {
  /// Creates a new message.
  const ChatMessage({
    required this.role,
    required this.parts,
    this.metadata = const {},
  });

  /// Creates a system message.
  factory ChatMessage.system(String text, {Map<String, dynamic>? metadata}) =>
      ChatMessage(
        role: MessageRole.system,
        parts: [TextPart(text)],
        metadata: metadata ?? const {},
      );

  /// Creates a user message with text.
  factory ChatMessage.user(String text, {Map<String, dynamic>? metadata}) =>
      ChatMessage(
        role: MessageRole.user,
        parts: [TextPart(text)],
        metadata: metadata ?? const {},
      );

  /// Creates a user message with parts.
  factory ChatMessage.userParts(
    List<Part> parts, {
    Map<String, dynamic>? metadata,
  }) =>
      ChatMessage(
        role: MessageRole.user,
        parts: parts,
        metadata: metadata ?? const {},
      );

  /// Creates a model message with text.
  factory ChatMessage.model(String text, {Map<String, dynamic>? metadata}) =>
      ChatMessage(
        role: MessageRole.model,
        parts: [TextPart(text)],
        metadata: metadata ?? const {},
      );

  /// Creates a model message with parts.
  factory ChatMessage.modelParts(
    List<Part> parts, {
    Map<String, dynamic>? metadata,
  }) =>
      ChatMessage(
        role: MessageRole.model,
        parts: parts,
        metadata: metadata ?? const {},
      );

  /// The role of the message author.
  final MessageRole role;

  /// The content parts of the message.
  final List<Part> parts;

  /// Optional metadata associated with this message.
  /// Can include information like suppressed content, warnings, etc.
  final Map<String, dynamic> metadata;

  /// Gets the text content of the message by concatenating all text parts.
  String get text => parts.whereType<TextPart>().map((p) => p.text).join();

  /// Checks if this message contains any tool calls.
  bool get hasToolCalls =>
      parts.whereType<ToolPart>().any((p) => p.kind == ToolPartKind.call);

  /// Gets all tool calls in this message.
  List<ToolPart> get toolCalls => parts
      .whereType<ToolPart>()
      .where((p) => p.kind == ToolPartKind.call)
      .toList();

  /// Checks if this message contains any tool results.
  bool get hasToolResults =>
      parts.whereType<ToolPart>().any((p) => p.kind == ToolPartKind.result);

  /// Gets all tool results in this message.
  List<ToolPart> get toolResults => parts
      .whereType<ToolPart>()
      .where((p) => p.kind == ToolPartKind.result)
      .toList();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatMessage &&
          runtimeType == other.runtimeType &&
          role == other.role &&
          _listEquals(parts, other.parts) &&
          _mapEquals(metadata, other.metadata);

  @override
  int get hashCode => role.hashCode ^ parts.hashCode ^ metadata.hashCode;

  @override
  String toString() =>
      'Message(role: $role, parts: $parts, metadata: $metadata)';
}

/// The role of a message author.
enum MessageRole {
  /// A message from the system that sets context or instructions.
  system,

  /// A message from the end user.
  user,

  /// A message from the model.
  model,
}

/// Base class for message content parts.
@immutable
abstract class Part {
  /// Creates a new part.
  const Part();
}

/// A text part of a message.
@immutable
class TextPart extends Part {
  /// Creates a new text part.
  const TextPart(this.text);

  /// The text content.
  final String text;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextPart &&
          runtimeType == other.runtimeType &&
          text == other.text;

  @override
  int get hashCode => text.hashCode;

  @override
  String toString() => 'TextPart($text)';
}

/// A data part containing binary data (e.g., images).
@immutable
class DataPart extends Part {
  /// Creates a new data part.
  const DataPart({required this.bytes, required this.mimeType, this.name});

  /// The binary data.
  final Uint8List bytes;

  /// The MIME type of the data.
  final String mimeType;

  /// Optional name for the data.
  final String? name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataPart &&
          runtimeType == other.runtimeType &&
          _listEquals(bytes, other.bytes) &&
          mimeType == other.mimeType &&
          name == other.name;

  @override
  int get hashCode => bytes.hashCode ^ mimeType.hashCode ^ name.hashCode;

  @override
  String toString() =>
      'DataPart(mimeType: $mimeType, name: $name, bytes: ${bytes.length})';
}

/// A link part referencing external content.
@immutable
class LinkPart extends Part {
  /// Creates a new link part.
  const LinkPart({required this.url, this.mimeType, this.name});

  /// The URL of the external content.
  final String url;

  /// Optional MIME type of the linked content.
  final String? mimeType;

  /// Optional name for the link.
  final String? name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinkPart &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          mimeType == other.mimeType &&
          name == other.name;

  @override
  int get hashCode => url.hashCode ^ mimeType.hashCode ^ name.hashCode;

  @override
  String toString() => 'LinkPart(url: $url, mimeType: $mimeType, name: $name)';
}

/// A tool interaction part of a message.
@immutable
class ToolPart extends Part {
  /// Creates a tool call part.
  const ToolPart.call({
    required this.id,
    required this.name,
    required this.arguments,
    this.argumentsRawString,
  }) : kind = ToolPartKind.call,
       result = null;

  /// Creates a tool result part.
  const ToolPart.result({
    required this.id,
    required this.name,
    required this.result,
  }) : kind = ToolPartKind.result,
       arguments = null,
       argumentsRawString = null;

  /// The kind of tool interaction.
  final ToolPartKind kind;

  /// The unique identifier for this tool interaction.
  final String id;

  /// The name of the tool.
  final String name;

  /// The arguments for a tool call (null for results).
  final Map<String, dynamic>? arguments;

  /// The raw arguments string from the provider (for streaming compatibility).
  final String? argumentsRawString;

  /// The result of a tool execution (null for calls).
  final dynamic result;

  /// The raw arguments as a JSON string (for compatibility).
  String get argumentsRaw =>
      argumentsRawString ??
      (arguments != null
          ? (arguments!.isEmpty ? '{}' : _jsonEncode(arguments))
          : '');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToolPart &&
          runtimeType == other.runtimeType &&
          kind == other.kind &&
          id == other.id &&
          name == other.name &&
          _mapEquals(arguments, other.arguments) &&
          argumentsRawString == other.argumentsRawString &&
          result == other.result;

  @override
  int get hashCode =>
      kind.hashCode ^
      id.hashCode ^
      name.hashCode ^
      arguments.hashCode ^
      argumentsRawString.hashCode ^
      result.hashCode;

  @override
  String toString() {
    if (kind == ToolPartKind.call) {
      return 'ToolPart.call(id: $id, name: $name, arguments: $arguments)';
    } else {
      return 'ToolPart.result(id: $id, name: $name, result: $result)';
    }
  }
}

/// The kind of tool interaction.
enum ToolPartKind {
  /// A request to call a tool.
  call,

  /// The result of a tool execution.
  result,
}

// Helper functions for equality checks
bool _listEquals<T>(List<T>? a, List<T>? b) {
  if (a == null) return b == null;
  if (b == null || a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

bool _mapEquals<K, V>(Map<K, V>? a, Map<K, V>? b) {
  if (a == null) return b == null;
  if (b == null || a.length != b.length) return false;
  for (final key in a.keys) {
    if (!b.containsKey(key) || a[key] != b[key]) return false;
  }
  return true;
}

String _jsonEncode(dynamic object) {
  // Simple JSON encoding for common cases
  if (object == null) return 'null';
  if (object is String) return '"${object.replaceAll('"', r'\"')}"';
  if (object is num || object is bool) return object.toString();
  if (object is List) {
    final items = object.map(_jsonEncode).join(',');
    return '[$items]';
  }
  if (object is Map) {
    final entries = object.entries
        .map((e) => '"${e.key}":${_jsonEncode(e.value)}')
        .join(',');
    return '{$entries}';
  }
  return object.toString();
}
