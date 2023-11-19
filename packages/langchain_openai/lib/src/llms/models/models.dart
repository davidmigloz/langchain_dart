import 'package:langchain/langchain.dart';

/// {@template openai_options}
/// Options to pass into the OpenAI LLM.
/// {@endtemplate}
class OpenAIOptions extends LLMOptions {
  /// {@macro openai_options}
  const OpenAIOptions({
    this.model = 'gpt-3.5-turbo-instruct',
    this.bestOf = 1,
    this.frequencyPenalty = 0,
    this.logitBias,
    this.logprobs,
    this.maxTokens = 256,
    this.n = 1,
    this.presencePenalty = 0,
    this.seed,
    this.stop,
    this.suffix,
    this.temperature = 1,
    this.topP = 1,
    this.user,
  });

  /// ID of the model to use (e.g. 'gpt-3.5-turbo-instruct').
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-model
  final String model;

  /// Generates best_of completions server-side and returns the "best"
  /// (the one with the highest log probability per token).
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-best_of
  final int bestOf;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// their existing frequency in the text so far, decreasing the model's
  /// likelihood to repeat the same line verbatim.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-frequency_penalty
  final double frequencyPenalty;

  /// Modify the likelihood of specified tokens appearing in the completion.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-logit_bias
  final Map<String, int>? logitBias;

  /// Include the log probabilities on the `logprobs` most likely tokens, as
  /// well the chosen tokens. For example, if `logprobs` is 5, the API will
  /// return a list of the 5 most likely tokens. The API will always return the
  /// `logprob` of the sampled token, so there may be up to `logprobs+1`
  /// elements in the response.
  ///
  /// The maximum value for logprobs is 5.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-logprobs
  final int? logprobs;

  /// The maximum number of tokens to generate in the completion.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-max_tokens
  final int? maxTokens;

  /// How many completions to generate for each prompt.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-n
  final int n;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// whether they appear in the text so far, increasing the model's likelihood
  /// to talk about new topics.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-presence_penalty
  final double presencePenalty;

  /// If specified, our system will make a best effort to sample
  /// deterministically, such that repeated requests with the same seed and
  /// parameters should return the same result.
  ///
  /// Determinism is not guaranteed, and you should refer to the
  /// `system_fingerprint` response parameter to monitor changes in the backend.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-seed
  final int? seed;

  /// Up to 4 sequences where the API will stop generating further tokens.
  /// The returned text will not contain the stop sequence.
  ///
  /// Ref: https://platform.openai.com/docs/api-reference/completions/create#completions-create-stop
  final List<String>? stop;

  /// The suffix that comes after a completion of inserted text.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-suffix
  final String? suffix;

  /// What sampling temperature to use, between 0 and 2.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-temperature
  final double temperature;

  /// An alternative to sampling with temperature, called nucleus sampling,
  /// where the model considers the results of the tokens with top_p
  /// probability mass.
  ///
  /// See https://platform.openai.com/docs/api-reference/completions/create#completions-create-top_p
  final double topP;

  /// A unique identifier representing your end-user, which can help OpenAI to
  /// monitor and detect abuse.
  ///
  /// If you need to send different users in different requests, you can set
  /// this field in [OpenAIOptions.user] instead.
  ///
  /// Ref: https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids
  final String? user;
}
