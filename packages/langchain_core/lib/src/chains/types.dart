import 'package:meta/meta.dart';

import '../callbacks/types.dart';
import '../langchain/types.dart';
import '../runnables/types.dart';

/// Values to be used in the chain.
typedef ChainValues = Map<String, dynamic>;

/// {@template chain_options}
/// Options to pass to the chain.
/// {@endtemplate}
@immutable
class ChainOptions extends BaseLangChainOptions {
  /// {@macro chain_options}
  const ChainOptions({
    super.callbacks,
    super.tags,
    super.metadata,
    super.concurrencyLimit,
  });

  @override
  ChainOptions copyWith({
    Callbacks? callbacks,
    List<String>? tags,
    Map<String, dynamic>? metadata,
    int? concurrencyLimit,
  }) {
    return ChainOptions(
      callbacks: callbacks ?? this.callbacks,
      tags: tags ?? this.tags,
      metadata: metadata ?? this.metadata,
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );
  }

  @override
  ChainOptions merge(RunnableOptions? other) {
    if (other is ChainOptions) {
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
