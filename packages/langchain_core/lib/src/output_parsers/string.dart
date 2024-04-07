import '../../llms.dart';
import '../chat_models/types.dart';
import '../documents/document.dart';
import '../language_models/types.dart';
import 'base.dart';
import 'types.dart';

/// {@template string_output_parser}
/// Output parser that returns the output of the previous [Runnable] as a
/// `String`.
///
/// - [ParserInput] - The type of the input to the parser.
///
/// If the input is:
/// - `null`, the parser returns an empty String.
/// - A [LLMResult], the parser returns the output String.
/// - A [ChatResult], the parser returns the content of the output message as a String.
/// - A [ChatMessage], the parser returns the content of the message as a String.
/// - A [Document], the parser returns the page content as a String.
/// - Anything else, the parser returns the String representation of the input.
///
/// Example:
/// ```dart
/// final model = ChatOpenAI(apiKey: openAiApiKey);
/// final promptTemplate = ChatPromptTemplate.fromTemplate(
///   'Tell me a joke about {topic}',
/// );
/// final chain = promptTemplate | model | StringOutputParser();
/// final res = await chain.invoke({'topic': 'bears'});
/// print(res);
/// // Why don't bears wear shoes? Because they have bear feet!
/// ```
/// {@endtemplate}
class StringOutputParser<ParserInput extends Object?>
    extends BaseOutputParser<ParserInput, OutputParserOptions, String> {
  /// {@macro string_output_parser}
  const StringOutputParser()
      : super(defaultOptions: const OutputParserOptions());

  @override
  Future<String> invoke(
    final ParserInput input, {
    final OutputParserOptions? options,
  }) {
    final output = switch (input) {
      null => '',
      final LanguageModelResult res => res.outputAsString,
      final ChatMessage res => res.contentAsString,
      final Document res => res.pageContent,
      _ => input.toString(),
    };
    return Future.value(output);
  }
}
