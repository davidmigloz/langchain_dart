import '../runnables/runnable.dart';
import 'types.dart';

/// {@template base_llm_output_parser}
/// Class to parse the output of a [Runnable] invocation.
/// {@endtemplate}
abstract class BaseOutputParser<ParserInput extends Object?,
        CallOptions extends OutputParserOptions, ParserOutput extends Object?>
    extends Runnable<ParserInput, CallOptions, ParserOutput> {
  /// {@macro base_llm_output_parser}
  const BaseOutputParser({
    required super.defaultOptions,
  });

  /// Invokes the output parser on the given input.
  ///
  /// - [input] - The result of an LLM call.
  /// - [options] - Not used.
  @override
  Future<ParserOutput> invoke(
    final ParserInput input, {
    final CallOptions? options,
  });
}
