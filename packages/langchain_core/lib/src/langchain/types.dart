import 'package:meta/meta.dart';

import '../runnables/types.dart';

/// {@template base_lang_chain_options}
/// Base class for LangChain components' options.
/// {@endtemplate}
@immutable
class BaseLangChainOptions extends RunnableOptions {
  /// {@macro base_lang_chain_options}
  const BaseLangChainOptions({
    super.concurrencyLimit,
  });
}
