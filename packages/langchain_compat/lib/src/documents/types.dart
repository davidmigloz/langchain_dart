import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

/// {@template document}
/// Interface for interacting with a document.
/// {@endtemplate}
@immutable
class Document {
  /// {@macro document}
  const Document({
    required this.pageContent,
    this.id,
    this.metadata = const {},
  });

  /// Creates a document from a map.
  factory Document.fromMap(Map<String, dynamic> map) => Document(
    id: map['id'] as String?,
    pageContent: map['pageContent'] as String,
    metadata: map['metadata'] as Map<String, dynamic>,
  );

  /// Optional ID for the document.
  /// It can be used to identify the document in the vector store.
  final String? id;

  /// The text content of the document.
  final String pageContent;

  /// The metadata of the document.
  final Map<String, dynamic> metadata;

  /// Converts the document to a map.
  Map<String, dynamic> toMap() => {
    'id': id,
    'pageContent': pageContent,
    'metadata': metadata,
  };

  /// Creates a copy of the document.
  Document copyWith({
    String? id,
    String? pageContent,
    Map<String, dynamic>? metadata,
  }) => Document(
    id: id ?? this.id,
    pageContent: pageContent ?? this.pageContent,
    metadata: metadata ?? this.metadata,
  );

  @override
  bool operator ==(covariant Document other) {
    final mapEquals = const MapEquality<String, dynamic>().equals;
    return identical(this, other) ||
        id == other.id &&
            pageContent == other.pageContent &&
            mapEquals(metadata, other.metadata);
  }

  @override
  int get hashCode => id.hashCode ^ pageContent.hashCode ^ metadata.hashCode;

  /// Concatenates the current document with another document.
  Document concat(Document other) => Document(
    id: id ?? other.id,
    pageContent: '$pageContent${other.pageContent}',
    metadata: {...metadata, ...other.metadata},
  );

  @override
  String toString() =>
      'Document{'
      'id: $id, '
      'pageContent: $pageContent, '
      'metadata: $metadata}';
}
