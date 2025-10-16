import 'package:meta/meta.dart';

import '../langchain/types.dart';
import '../vector_stores/types.dart';

/// {@template retriever_options}
/// Base class for [Retriever] options.
/// {@endtemplate}
@immutable
class RetrieverOptions extends BaseLangChainOptions {
  /// {@macro retriever_options}
  const RetrieverOptions({super.concurrencyLimit});
}

/// {@template vector_store_retriever_options}
/// Options for [VectorStoreRetriever].
/// {@endtemplate}
class VectorStoreRetrieverOptions extends RetrieverOptions {
  /// {@macro vector_store_retriever_options}
  const VectorStoreRetrieverOptions({
    this.searchType = const VectorStoreSimilaritySearch(),
    super.concurrencyLimit,
  });

  /// The type of search to perform, either:
  /// - [VectorStoreSearchType.similarity] (default)
  /// - [VectorStoreSearchType.mmr]
  final VectorStoreSearchType searchType;

  @override
  VectorStoreRetrieverOptions copyWith({
    final VectorStoreSearchType? searchType,
    final int? concurrencyLimit,
  }) {
    return VectorStoreRetrieverOptions(
      searchType: searchType ?? this.searchType,
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );
  }
}
