import 'package:meta/meta.dart';

import '../runnables/types.dart';

/// {@template base_lang_chain_options}
/// Base options class for LangChain components.
/// {@endtemplate}
@immutable
class BaseLangChainOptions extends RunnableOptions {
  /// {@macro base_lang_chain_options}
  const BaseLangChainOptions({
    super.concurrencyLimit,
  });
}
