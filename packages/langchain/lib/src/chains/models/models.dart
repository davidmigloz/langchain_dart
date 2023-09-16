import 'package:meta/meta.dart';

import '../../core/core.dart';

/// Values to be used in the chain.
typedef ChainValues = Map<String, dynamic>;

/// {@template chain_options}
/// Options to pass to a chain.
/// {@endtemplate}
@immutable
abstract class ChainOptions extends BaseLangChainOptions {
  /// {@macro chain_options}
  const ChainOptions();
}
