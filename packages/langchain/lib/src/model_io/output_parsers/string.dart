import '../../core/core.dart';
import 'output_parser.dart';

/// {@template string_output_parser}
/// Output parser that parses the first generation as String.
///
/// - [ModelOutput] - The output of the language model (`String` for LLMs or
/// `ChatMessage` for chat models).
///
/// Example:
/// ```dart
/// final model = ChatOpenAI(apiKey: openaiApiKey);
/// final promptTemplate = ChatPromptTemplate.fromTemplate(
///   'Tell me a joke about {topic}',
/// );
/// final chain = promptTemplate | model | const StringOutputParser();
/// final res = await chain.invoke({'topic': 'bears'});
/// print(res);
/// // Why don't bears wear shoes? Because they have bear feet!
/// ```
/// {@endtemplate}
class StringOutputParser<ModelOutput extends Object>
    extends BaseOutputParser<ModelOutput, BaseLangChainOptions, String> {
  /// {@macro string_output_parser}
  const StringOutputParser();

  @override
  Future<String> parse(final String text) {
    return Future.value(text);
  }
}
