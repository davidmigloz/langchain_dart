import '../copy_with_sentinel.dart';
import 'custom_metadata.dart';

/// A collection of Chunks.
///
/// Documents are hierarchical containers for chunks within a corpus.
///
/// Example name: `corpora/{corpus_id}/documents/my-awesome-doc-123a456b789c`
class Document {
  /// Creates a new [Document] instance.
  const Document({
    this.name,
    this.displayName,
    this.customMetadata,
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

  /// User-provided custom metadata stored as key-value pairs for querying.
  ///
  /// A maximum of 20 [CustomMetadata] per Document is supported.
  final List<CustomMetadata>? customMetadata;

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
      customMetadata: json['customMetadata'] != null
          ? (json['customMetadata'] as List)
                .map((e) => CustomMetadata.fromJson(e as Map<String, dynamic>))
                .toList()
          : null,
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
      if (customMetadata != null)
        'customMetadata': customMetadata!.map((e) => e.toJson()).toList(),
      if (createTime != null) 'createTime': createTime!.toIso8601String(),
      if (updateTime != null) 'updateTime': updateTime!.toIso8601String(),
    };
  }

  /// Creates a copy with replaced values.
  Document copyWith({
    Object? name = unsetCopyWithValue,
    Object? displayName = unsetCopyWithValue,
    Object? customMetadata = unsetCopyWithValue,
    Object? createTime = unsetCopyWithValue,
    Object? updateTime = unsetCopyWithValue,
  }) {
    return Document(
      name: name == unsetCopyWithValue ? this.name : name as String?,
      displayName: displayName == unsetCopyWithValue
          ? this.displayName
          : displayName as String?,
      customMetadata: customMetadata == unsetCopyWithValue
          ? this.customMetadata
          : customMetadata as List<CustomMetadata>?,
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
      'customMetadata: $customMetadata, '
      'createTime: $createTime, '
      'updateTime: $updateTime)';
}
