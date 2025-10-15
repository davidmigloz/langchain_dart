import 'package:langchain_core/vector_stores.dart';
import 'package:objectbox/objectbox.dart' show Condition;

/// {@template objectbox_similarity_search}
/// ObjectBox similarity search config.
///
/// ObjectBox supports filtering queries by id, content or metadata using
/// [Condition]. You can define the filter condition in the [filterCondition]
/// parameter.
///
/// Example:
/// ```dart
/// ObjectBoxSimilaritySearch(
///   k: 10,
///   scoreThreshold: 1.3,
///   filterCondition: ObjectBoxDocumentProps.metadata.contains('cat'),
/// );
/// ```
/// {@endtemplate}
class ObjectBoxSimilaritySearch extends VectorStoreSimilaritySearch {
  /// {@macro objectbox_similarity_search}
  ObjectBoxSimilaritySearch({
    super.k = 4,
    super.scoreThreshold,
    final Condition<Object>? filterCondition,
  }) : super(
         filter: filterCondition != null ? {'filter': filterCondition} : null,
       );
}
