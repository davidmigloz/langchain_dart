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
    this.metadata = const {},
  });

  final String pageContent;
  final Map<String, dynamic> metadata;

  @override
  bool operator ==(covariant final Document other) {
    final mapEquals = const MapEquality<String, dynamic>().equals;
    return identical(this, other) ||
        pageContent == other.pageContent && mapEquals(metadata, other.metadata);
  }

  @override
  int get hashCode => pageContent.hashCode ^ metadata.hashCode;

  @override
  String toString() {
    return '''
Document{
  pageContent: $pageContent,
  metadata: $metadata,
}''';
  }
}
