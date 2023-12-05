import 'package:meta/meta.dart';

import '../../../core/base.dart';
import '../../vector_stores/models/models.dart';
import '../retrievers.dart';

/// {@template retriever_options}
/// Base class for [Retriever] options.
/// {@endtemplate}
@immutable
class RetrieverOptions extends BaseLangChainOptions {
  /// {@macro retriever_options}
  const RetrieverOptions();
}

/// {@template vector_store_retriever_options}
/// Options for [VectorStoreRetriever].
/// {@endtemplate}
class VectorStoreRetrieverOptions extends RetrieverOptions {
  /// {@macro vector_store_retriever_options}
  const VectorStoreRetrieverOptions({
    this.searchType = const VectorStoreSimilaritySearch(),
  });

  /// The type of search to perform, either:
  /// - [VectorStoreSearchType.similarity] (default)
  /// - [VectorStoreSearchType.mmr]
  final VectorStoreSearchType searchType;
}
