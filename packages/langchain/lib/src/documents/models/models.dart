import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

/// {@template document}
/// Interface for interacting with a document.
/// {@endtemplate}
@immutable
class Document {
  /// {@macro document}
  const Document({
    this.id,
    required this.pageContent,
    this.metadata = const {},
  });

  /// Optional ID for the document.
  ///
  /// It can be used to identify the document in the vector store.
  final String? id;

  /// The text content of the document.
  final String pageContent;

  /// The metadata of the document.
  final Map<String, dynamic> metadata;

  /// Creates a document from a map.
  factory Document.fromMap(final Map<String, dynamic> map) {
    return Document(
      id: map['id'] as String?,
      pageContent: map['pageContent'] as String,
      metadata: map['metadata'] as Map<String, dynamic>,
    );
  }

  /// Converts the document to a map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pageContent': pageContent,
      'metadata': metadata,
    };
  }

  /// Creates a copy of the document.
  Document copyWith({
    final String? id,
    final String? pageContent,
    final Map<String, dynamic>? metadata,
  }) {
    return Document(
      id: id ?? this.id,
      pageContent: pageContent ?? this.pageContent,
      metadata: metadata ?? this.metadata,
    );
  }

  @override
  bool operator ==(covariant final Document other) {
    final mapEquals = const MapEquality<String, dynamic>().equals;
    return identical(this, other) ||
        id == other.id &&
            pageContent == other.pageContent &&
            mapEquals(metadata, other.metadata);
  }

  @override
  int get hashCode => id.hashCode ^ pageContent.hashCode ^ metadata.hashCode;

  @override
  String toString() {
    return 'Document{'
        'id: $id, '
        'pageContent: $pageContent, '
        'metadata: $metadata}';
  }
}
