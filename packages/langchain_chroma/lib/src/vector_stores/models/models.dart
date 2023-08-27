import 'package:langchain/langchain.dart';

/// {@template chroma_similarity_search}
/// Chroma similarity search config.
///
/// Chroma supports filtering queries by metadata and document contents.
/// The [where] filter is used to filter by metadata, and the [whereDocument]
/// filter is used to filter by document contents.
///
/// Check out the filtering section of the Chroma docs for more info:
/// https://docs.trychroma.com/usage-guide?lang=js#using-where-filters
///
/// Example:
/// ```dart
/// ChromaSimilaritySearch(
///   k: 5,
///   where: {'style: 'style1'},
///   scoreThreshold: 0.8,
/// ),
/// ```
/// {@endtemplate}
class ChromaSimilaritySearch extends VectorStoreSimilaritySearch {
  /// {@macro chroma_similarity_search}
  const ChromaSimilaritySearch({
    super.k = 4,
    final Map<String, dynamic>? where,
    this.whereDocument,
    super.scoreThreshold,
  }) : super(filter: where);

  /// Optional query condition to filter results based on document content.
  final Map<String, dynamic>? whereDocument;
}
