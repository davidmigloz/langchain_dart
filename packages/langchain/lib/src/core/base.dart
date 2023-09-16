import 'package:meta/meta.dart';

import 'runnable/base.dart';

/// {@template base_lang_chain}
/// Base class for LangChain components (language models, chains, tools, etc.).
/// {@endtemplate}
abstract class BaseLangChain<RunInput extends Object,
        CallOptions extends BaseLangChainOptions, RunOutput extends Object>
    extends Runnable<RunInput, CallOptions, RunOutput> {
  /// {@macro base_lang_chain}
  const BaseLangChain();
}

/// {@template base_lang_chain_options}
/// Base class for LangChain options.
/// {@endtemplate}
@immutable
class BaseLangChainOptions {
  /// {@macro base_lang_chain_options}
  const BaseLangChainOptions();
}
