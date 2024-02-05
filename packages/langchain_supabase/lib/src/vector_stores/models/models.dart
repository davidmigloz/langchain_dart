import 'package:langchain/langchain.dart';

/// {@template supabase_similarity_search}
/// Supabase similarity search config.
///
/// Supabase supports filtering queries by metadata using
/// the [filter] parameter: the query will return all rows from the table
/// where the JSON metadata column contains a key-value pair
/// where the key is "key" and the value is "value" as in [filter].
///
/// Example:
/// ```dart
/// SupabaseSimilaritySearch(
///   k: 5,
///   filter: {'animal: 'cat'},
///   scoreThreshold: 0.8,
/// ),
/// ```
/// {@endtemplate}
class SupabaseSimilaritySearch extends VectorStoreSimilaritySearch {
  /// {@macro supabase_similarity_search}
  const SupabaseSimilaritySearch({
    super.k = 4,
    super.filter,
    super.scoreThreshold,
  });
}
