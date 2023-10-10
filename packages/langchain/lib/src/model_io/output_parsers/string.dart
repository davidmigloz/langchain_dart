import '../../core/core.dart';
import 'output_parser.dart';

/// {@template string_output_parser}
/// Output parser that parses the first generation as String.
/// {@endtemplate}
class StringOutputParser<LLMOutput extends Object,
        CallOptions extends BaseLangChainOptions>
    extends BaseTransformOutputParser<LLMOutput, CallOptions, String> {
  /// {@macro string_output_parser}
  const StringOutputParser();

  @override
  Future<String> parse(final String text) {
    return Future.value(text);
  }
}
