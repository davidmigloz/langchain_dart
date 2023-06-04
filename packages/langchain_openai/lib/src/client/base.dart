import 'models/models.dart';

abstract interface class BaseOpenAIClient {
  /// Given a prompt, the model will return one or more predicted completions,
  /// and can also return the probabilities of alternative tokens at each
  /// position.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create
  Future<OpenAICompletionModel> createCompletion({
    required final String model,
    required final List<String> prompts,
    final String? suffix,
    final int? maxTokens,
    final double? temperature,
    final double? topP,
    final int? n,
    final int? logprobs,
    final bool? echo,
    final List<String>? stop,
    final double? presencePenalty,
    final double? frequencyPenalty,
    final int? bestOf,
    final Map<String, dynamic>? logitBias,
    final String? user,
  });
}
