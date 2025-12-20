part of 'content.dart';

/// A thought content block.
class ThoughtContent extends InteractionContent {
  @override
  String get type => 'thought';

  /// Signature to match the backend source to be part of the generation.
  final String? signature;

  /// A summary of the thought.
  final List<dynamic>? summary;

  /// Creates a [ThoughtContent] instance.
  const ThoughtContent({this.signature, this.summary});

  /// Creates a [ThoughtContent] from JSON.
  factory ThoughtContent.fromJson(Map<String, dynamic> json) => ThoughtContent(
    signature: json['signature'] as String?,
    summary: json['summary'] as List<dynamic>?,
  );

  @override
  Map<String, dynamic> toJson() => {
    'type': type,
    if (signature != null) 'signature': signature,
    if (summary != null) 'summary': summary,
  };

  /// Creates a copy with replaced values.
  ThoughtContent copyWith({
    Object? signature = unsetCopyWithValue,
    Object? summary = unsetCopyWithValue,
  }) {
    return ThoughtContent(
      signature: signature == unsetCopyWithValue
          ? this.signature
          : signature as String?,
      summary: summary == unsetCopyWithValue
          ? this.summary
          : summary as List<dynamic>?,
    );
  }
}
