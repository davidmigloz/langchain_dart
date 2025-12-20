import '../copy_with_sentinel.dart';

/// A collection of content within a corpus.
///
/// Documents are containers within a corpus.
///
/// Example name: `corpora/{corpus_id}/documents/my-awesome-doc-123a456b789c`
class Document {
  /// Creates a new [Document] instance.
  const Document({
    this.name,
    this.displayName,
    this.createTime,
    this.updateTime,
  });

  /// The Document resource name.
  ///
  /// Immutable. Identifier.
  /// The ID can contain up to 40 lowercase alphanumeric or dash characters.
  ///
  /// Example: `corpora/{corpus_id}/documents/my-awesome-doc-123a456b789c`
  final String? name;

  /// Human-readable display name.
  ///
  /// The display name must be no more than 512 characters,
  /// including whitespace.
  ///
  /// Example: "Semantic Retriever Documentation"
  final String? displayName;

  /// Timestamp when the Document was created.
  ///
  /// Output only.
  final DateTime? createTime;

  /// Timestamp when the Document was last updated.
  ///
  /// Output only.
  final DateTime? updateTime;

  /// Creates a [Document] from JSON.
  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      name: json['name'] as String?,
      displayName: json['displayName'] as String?,
      createTime: json['createTime'] != null
          ? DateTime.parse(json['createTime'] as String)
          : null,
      updateTime: json['updateTime'] != null
          ? DateTime.parse(json['updateTime'] as String)
          : null,
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (displayName != null) 'displayName': displayName,
      if (createTime != null) 'createTime': createTime!.toIso8601String(),
      if (updateTime != null) 'updateTime': updateTime!.toIso8601String(),
    };
  }

  /// Creates a copy with replaced values.
  Document copyWith({
    Object? name = unsetCopyWithValue,
    Object? displayName = unsetCopyWithValue,
    Object? createTime = unsetCopyWithValue,
    Object? updateTime = unsetCopyWithValue,
  }) {
    return Document(
      name: name == unsetCopyWithValue ? this.name : name as String?,
      displayName: displayName == unsetCopyWithValue
          ? this.displayName
          : displayName as String?,
      createTime: createTime == unsetCopyWithValue
          ? this.createTime
          : createTime as DateTime?,
      updateTime: updateTime == unsetCopyWithValue
          ? this.updateTime
          : updateTime as DateTime?,
    );
  }

  @override
  String toString() =>
      'Document('
      'name: $name, '
      'displayName: $displayName, '
      'createTime: $createTime, '
      'updateTime: $updateTime)';
}
