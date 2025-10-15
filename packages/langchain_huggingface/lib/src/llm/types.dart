import 'package:langchain_core/llms.dart';
import 'package:langchain_core/src/language_models/types.dart';
import 'package:meta/meta.dart';

@immutable
class HuggingFaceOptions extends LLMOptions {
  const HuggingFaceOptions(
      {this.topK,
      this.topP,
      super.model,
      this.temperature,
      this.repetitionPenalty,
      this.maxNewTokens,
      this.maxTime,
      this.returnFullText,
      this.numReturnSequences,
      this.useCache,
      this.waitForModel,
      this.doSample});

  /// (Default: true). Boolean. There is a cache layer on the inference API to speedup requests we have already seen.
  /// Most models can use those results as is as models are deterministic (meaning the results will be the same anyway).
  /// However if you use a non deterministic model, you can set this parameter to prevent the caching mechanism from being
  /// used resulting in a real new query.
  final bool? useCache;

  /// (Default: false) Boolean. If the model is not ready, wait for it instead of receiving 503. It limits the number of requests
  /// required to get your inference done. It is advised to only set this flag to true after receiving a 503
  /// error as it will limit hanging in your application to known places.
  final bool? waitForModel;

  /// (Default: None). Integer to define the top tokens considered within the sample operation to create new text.
  final int? topK;

  /// (Default: None). Float to define the tokens that are within the sample operation of text generation.
  /// Add tokens in the sample for more probable to least probable until the sum of the probabilities
  /// is greater than top_p.
  final double? topP;

  /// (Default: 1.0). Float (0.0-100.0). The temperature of the sampling operation. 1 means regular sampling,
  /// 0 means always take the highest score, 100.0 is getting closer to uniform probability.
  final double? temperature;

  /// (Default: None). Float (0.0-100.0). The more a token is used within generation the more it is penalized
  /// to not be picked in successive generation passes.
  final double? repetitionPenalty;

  /// (Default: None). Int (0-250). The amount of new tokens to be generated, this does not include the input
  /// length it is a estimate of the size of generated text you want. Each new tokens slows down the request,
  /// so look for balance between response times and length of text generated.
  final int? maxNewTokens;

  /// (Default: None). Float (0-120.0). The amount of time in seconds that the query should take maximum.
  /// Network can cause some overhead so it will be a soft limit. Use that in combination
  /// with [maxNewTokens] for best results.
  final double? maxTime;

  /// (Default: True). Bool. If set to False, the return results will not contain the
  /// original query making it easier for prompting.
  final bool? returnFullText;

  /// (Default: 1). Integer. The number of proposition you want to be returned.
  final int? numReturnSequences;

  /// (Optional: True). Bool. Whether or not to use sampling, use greedy
  /// decoding otherwise
  final bool? doSample;

  @override
  HuggingFaceOptions copyWith(
      {final String? model,
      final int? concurrencyLimit,
      final int? topK,
      final double? topP,
      final double? temperature,
      final double? repetitionPenalty,
      final int? maxNewTokens,
      final double? maxTime,
      final bool? returnFullText,
      final int? numReturnSequences,
      final bool? doSample}) {
    return HuggingFaceOptions(
      model: model ?? this.model,
      repetitionPenalty: repetitionPenalty ?? this.repetitionPenalty,
      returnFullText: returnFullText ?? this.returnFullText,
      numReturnSequences: numReturnSequences ?? this.numReturnSequences,
      doSample: doSample ?? this.doSample,
      topK: topK ?? this.topK,
      temperature: temperature ?? this.temperature,
      topP: topP ?? this.topP,
      maxTime: maxTime ?? this.maxTime,
      maxNewTokens: maxNewTokens ?? this.maxNewTokens,
    );
  }
}
