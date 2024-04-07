import '../../language_models.dart';
import '../../memory.dart';
import '../../output_parsers.dart';
import '../../prompts.dart';

import 'base.dart';
import 'types.dart';

/// {@template llm_chain}
/// > NOTE: Chains are the legacy way of using LangChain and will eventually be
/// > removed. Use LangChain Expression Language (LCEL) instead, a more flexible
/// > and powerful way to combine different components.
///
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
  }) : super(defaultOptions: const ChainOptions());

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
  final BaseOutputParser? outputParser;

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

    final response = await llm.invoke(promptValue, options: llmOptions);

    final res = outputParser == null
        ? response.output
        : await outputParser!.invoke(response);

    return {
      outputKey: res,
      if (!returnFinalOnly) fullGenerationOutputKey: response,
    };
  }
}
