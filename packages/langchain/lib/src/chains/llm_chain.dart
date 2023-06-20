import '../language_models/base.dart';
import '../language_models/models/models.dart';
import '../output_parsers/output_parser.dart';
import '../prompts/base_prompt.dart';
import 'base.dart';
import 'models/models.dart';

/// {@template llm_chain}
/// Chain to run queries against LLMs.
///
/// It takes in a prompt template, formats it with the user input and returns
/// the response from an LLM.
///
/// Example:
/// ```dart
/// final prompt = PromptTemplate.fromTemplate('Tell me a {adjective} joke');
/// final chain = LLMChain(llm: OpenAI(apiKey: '...'), prompt: prompt);
/// final res = await chain.run('bad');
/// ```
/// {@endtemplate}
class LLMChain<LLMInput extends Object, LLMOptions extends LanguageModelOptions,
    LLMOutput extends Object, P extends Object> extends BaseChain {
  /// {@macro llm_chain}
  const LLMChain({
    required this.prompt,
    required this.llm,
    this.outputParser,
    super.memory,
    this.outputKey = 'text',
  });

  /// Prompt object to use.
  final BasePromptTemplate prompt;

  /// LLM Wrapper to use.
  final BaseLanguageModel<LLMInput, LLMOptions, LLMOutput> llm;

  /// OutputParser to use.
  final BaseOutputParser<P>? outputParser;

  /// Key to use for output, defaults to `text`.
  final String outputKey;

  @override
  String get chainType => 'llm';

  @override
  Set<String> get inputKeys => prompt.inputVariables;

  @override
  Set<String> get outputKeys => {outputKey};

  @override
  Future<ChainValues> callInternal(final ChainValues inputs) async {
    final promptValue = prompt.formatPrompt(inputs);

    final response = await llm.generatePrompt(promptValue);
    String output = response.firstOutputAsString;

    if (outputParser != null) {
      final res = await outputParser?.parseWithPrompt(output, promptValue);
      output = res.toString();
    }

    return {outputKey: output};
  }
}
