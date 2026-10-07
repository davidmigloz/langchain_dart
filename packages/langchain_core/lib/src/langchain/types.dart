import 'package:meta/meta.dart';

import '../callbacks/types.dart';
import '../runnables/types.dart';

/// {@template base_lang_chain_options}
/// Base options class for LangChain components.
/// {@endtemplate}
@immutable
class BaseLangChainOptions extends RunnableOptions {
  /// {@macro base_lang_chain_options}
  const BaseLangChainOptions({
    this.callbacks,
    this.tags,
    this.metadata,
    super.concurrencyLimit,
  });

  /// Callback handlers to invoke during the run.
  final Callbacks? callbacks;

  /// Tags to associate with the run.
  final List<String>? tags;

  /// Metadata to associate with the run.
  final Map<String, dynamic>? metadata;

  @override
  BaseLangChainOptions copyWith({
    Callbacks? callbacks,
    List<String>? tags,
    Map<String, dynamic>? metadata,
    int? concurrencyLimit,
  }) {
    return BaseLangChainOptions(
      callbacks: callbacks ?? this.callbacks,
      tags: tags ?? this.tags,
      metadata: metadata ?? this.metadata,
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );
  }

  @override
  BaseLangChainOptions merge(RunnableOptions? other) {
    if (other is BaseLangChainOptions) {
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
