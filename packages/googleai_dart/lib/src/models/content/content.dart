import '../copy_with_sentinel.dart';
import 'part.dart';

/// Represents a message in a conversation (user or model turn).
class Content {
  /// Producer of content: "user" or "model".
  final String? role;

  /// Multi-part message content.
  final List<Part> parts;

  /// Creates a [Content].
  const Content({required this.parts, this.role});

  /// Creates a [Content] from JSON.
  factory Content.fromJson(Map<String, dynamic> json) => Content(
    role: json['role'] as String?,
    parts: ((json['parts'] as List?) ?? [])
        .map((e) => Part.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  /// Converts to JSON.
  Map<String, dynamic> toJson() => {
    if (role != null) 'role': role,
    'parts': parts.map((e) => e.toJson()).toList(),
  };

  /// Creates a copy with replaced values.
  Content copyWith({
    Object? role = unsetCopyWithValue,
    Object? parts = unsetCopyWithValue,
  }) {
    return Content(
      role: role == unsetCopyWithValue ? this.role : role as String?,
      parts: parts == unsetCopyWithValue ? this.parts : parts! as List<Part>,
    );
  }
}
