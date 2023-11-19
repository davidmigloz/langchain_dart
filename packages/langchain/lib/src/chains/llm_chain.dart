import '../memory/base.dart';
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
class LLMChain<
    LLMType extends BaseLanguageModel,
    LLMOptions extends LanguageModelOptions,
    OutputParserType extends BaseLLMOutputParser,
    MemoryType extends BaseMemory> extends BaseChain<MemoryType> {
  /// {@macro llm_chain}
  const LLMChain({
    required this.llm,
    this.llmOptions,
    required this.prompt,
    super.memory,
    this.outputParser,
    this.outputKey = defaultOutputKey,
    this.returnFinalOnly = true,
  });

  /// Language model to call.
  final LLMType llm;

  /// Options to pass to the language model.
  final LLMOptions? llmOptions;

  /// Prompt object to use.
  final BasePromptTemplate prompt;

  /// OutputParser to use.
  ///
  /// Defaults to one that takes the most likely string but does not change it
  /// otherwise.
  final OutputParserType? outputParser;

  /// Key to use for output.
  final String outputKey;

  /// Whether to return only the final parsed result.
  /// If false, it will return a bunch of extra information about the
  /// generation.
  final bool returnFinalOnly;

  /// Default output key.
  static const defaultOutputKey = 'output';

  /// Output key to use for returning the full generation.
  static const fullGenerationOutputKey = 'full_generation';

  @override
  String get chainType => 'llm';

  @override
  Set<String> get inputKeys =>
      prompt.inputVariables.difference(memory?.memoryKeys ?? {});

  @override
  Set<String> get outputKeys =>
      returnFinalOnly ? {outputKey} : {outputKey, fullGenerationOutputKey};

  @override
  String get runOutputKey => outputKey;

  @override
  Future<ChainValues> callInternal(final ChainValues inputs) async {
    final promptValue = prompt.formatPrompt(inputs);

    final response = await llm.generatePrompt(promptValue, options: llmOptions);

    final res = outputParser == null
        ? response.generations.firstOrNull?.output
        : await outputParser!.parseResultWithPrompt(
            response.generations,
            promptValue,
          );

    return {
      outputKey: res,
      if (!returnFinalOnly) fullGenerationOutputKey: response.generations.first,
    };
  }
}
