import 'package:meta/meta.dart';

import '../callbacks/types.dart';
import '../langchain/types.dart';
import '../runnables/types.dart';
import '../vector_stores/types.dart';

/// {@template retriever_options}
/// Base class for [Retriever] options.
/// {@endtemplate}
@immutable
class RetrieverOptions extends BaseLangChainOptions {
  /// {@macro retriever_options}
  const RetrieverOptions({
    super.callbacks,
    super.tags,
    super.metadata,
    super.concurrencyLimit,
  });

  @override
  RetrieverOptions copyWith({
    Callbacks? callbacks,
    List<String>? tags,
    Map<String, dynamic>? metadata,
    int? concurrencyLimit,
  }) {
    return RetrieverOptions(
      callbacks: callbacks ?? this.callbacks,
      tags: tags ?? this.tags,
      metadata: metadata ?? this.metadata,
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );
  }

  @override
  RetrieverOptions merge(RunnableOptions? other) {
    if (other is RetrieverOptions) {
      return copyWith(
        callbacks: other.callbacks,
        tags: other.tags,
        metadata: other.metadata,
        concurrencyLimit: other.concurrencyLimit,
      );
    }
    return copyWith(concurrencyLimit: other?.concurrencyLimit);
  }
}

/// {@template vector_store_retriever_options}
/// Options for [VectorStoreRetriever].
/// {@endtemplate}
class VectorStoreRetrieverOptions extends RetrieverOptions {
  /// {@macro vector_store_retriever_options}
  const VectorStoreRetrieverOptions({
    this.searchType = const VectorStoreSimilaritySearch(),
    super.callbacks,
    super.tags,
    super.metadata,
    super.concurrencyLimit,
  });

  /// The type of search to perform, either:
  /// - [VectorStoreSearchType.similarity] (default)
  /// - [VectorStoreSearchType.mmr]
  final VectorStoreSearchType searchType;

  @override
  VectorStoreRetrieverOptions copyWith({
    VectorStoreSearchType? searchType,
    Callbacks? callbacks,
    List<String>? tags,
    Map<String, dynamic>? metadata,
    int? concurrencyLimit,
  }) {
    return VectorStoreRetrieverOptions(
      searchType: searchType ?? this.searchType,
      callbacks: callbacks ?? this.callbacks,
      tags: tags ?? this.tags,
      metadata: metadata ?? this.metadata,
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );
  }
}
