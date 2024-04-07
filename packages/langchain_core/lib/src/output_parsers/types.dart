import 'package:meta/meta.dart';

import '../langchain/types.dart';

/// {@template output_parser_options}
/// Options to pass to an output parser.
/// {@endtemplate}
@immutable
class OutputParserOptions extends BaseLangChainOptions {
  /// {@macro output_parser_options}
  const OutputParserOptions({
    super.concurrencyLimit,
  });
}
