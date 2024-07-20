import 'package:meta/meta.dart';

import '../langchain/types.dart';

/// Values to be used in the chain.
typedef ChainValues = Map<String, dynamic>;

/// {@template chain_options}
/// Options to pass to the chain.
/// {@endtemplate}
@immutable
class ChainOptions extends BaseLangChainOptions {
  /// {@macro chain_options}
  const ChainOptions({
    super.concurrencyLimit,
  });
}
