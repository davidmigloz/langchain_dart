import '../model_io/model_io.dart';
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
    LLMOutput extends Object, ParserOutput extends Object> extends BaseChain {
  /// {@macro llm_chain}
  const LLMChain({
    required this.prompt,
    required this.llm,
    this.outputKey = 'text',
    this.outputParser,
    this.returnFinalOnly = true,
    this.llmOptions,
    super.memory,
  });

  /// Prompt object to use.
  final BasePromptTemplate prompt;

  /// Language model to call.
  final BaseLanguageModel<LLMInput, LLMOptions, LLMOutput> llm;

  /// Key to use for output.
  final String outputKey;

  /// OutputParser to use.
  ///
  /// Defaults to one that takes the most likely string but does not change it
  /// otherwise.
  final BaseLLMOutputParser<LLMOutput, ParserOutput>? outputParser;

  /// Whether to return only the final parsed result.
  /// If false, it will return a bunch of extra information about the
  /// generation.
  final bool returnFinalOnly;

  /// Options to pass to the language model.
  final LLMOptions? llmOptions;

  /// Output key to use for returning the full generation.
  static const fullGenerationOutputKey = 'full_generation';

  @override
  String get chainType => 'llm';

  @override
  Set<String> get inputKeys => prompt.inputVariables;

  @override
  Set<String> get outputKeys =>
      returnFinalOnly ? {outputKey} : {outputKey, fullGenerationOutputKey};

  @override
  String get runOutputKey => outputKey;

  @override
  Future<ChainValues> callInternal(final ChainValues inputs) async {
    final promptValue = prompt.formatPrompt(inputs);

    final response = await llm.generatePrompt(promptValue, options: llmOptions);

    final res = switch (outputParser) {
      null => response.firstOutputAsString,
      _ => await outputParser!.parseResultWithPrompt(
          response.generations,
          promptValue,
        ),
    };

    return {
      outputKey: res,
      if (!returnFinalOnly) fullGenerationOutputKey: response.generations.first,
    };
  }
}
