import '../runnables/runnable.dart';
import 'types.dart';

/// {@template base_lang_chain}
/// Base class for LangChain components (language models, chains, tools, etc.).
/// {@endtemplate}
abstract class BaseLangChain<RunInput extends Object,
CallOptions extends BaseLangChainOptions, RunOutput extends Object>
    extends Runnable<RunInput, CallOptions, RunOutput> {
  /// {@macro base_lang_chain}
  const BaseLangChain();
}
