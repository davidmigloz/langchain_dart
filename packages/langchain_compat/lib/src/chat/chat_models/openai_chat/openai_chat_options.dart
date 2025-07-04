import 'package:meta/meta.dart';
import 'package:openai_dart/openai_dart.dart' show ChatCompletionStreamOptions;

import '../chat_model_options.dart';

/// Generation options to pass into the Chat Model.
@immutable
class OpenAIChatOptions extends ChatModelOptions {
  /// Creates a new chat openai options instance.
  const OpenAIChatOptions({
    this.frequencyPenalty,
    this.logitBias,
    this.maxTokens,
    this.n,
    this.presencePenalty,
    this.responseFormat,
    this.seed,
    this.stop,
    this.temperature,
    this.topP,
    this.parallelToolCalls,
    this.serviceTier,
    this.user,
    this.streamOptions,
    this.toolChoice,
    this.logprobs,
    this.topLogprobs,
  });

  /// Stream options for OpenAI chat completions.
  ///
  /// If null, no stream options are sent (the default). Some providers (e.g.,
  /// Cohere) do not support streamOptions at all and will forcibly set this to
  /// null. For most providers, you can set options like includeUsage.
  ///
  /// Example:
  ///   - For Cohere: `streamOptions` is always null.
  ///   - For OpenAI: `streamOptions` can be set to
  ///     ChatCompletionStreamOptions(...).
  final ChatCompletionStreamOptions? streamOptions;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// their existing frequency in the text so far, decreasing the model's
  /// likelihood to repeat the same line verbatim.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-frequency_penalty
  final double? frequencyPenalty;

  /// Modify the likelihood of specified tokens appearing in the completion.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-logit_bias
  final Map<String, int>? logitBias;

  /// The maximum number of tokens to generate in the chat completion.
  /// Defaults to inf.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-max_tokens
  final int? maxTokens;

  /// How many chat completion choices to generate for each input message.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-n
  final int? n;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// whether they appear in the text so far, increasing the model's likelihood
  /// to talk about new topics.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-presence_penalty
  final double? presencePenalty;

  /// An object specifying the format that the model must output.
  ///
  /// Setting to ChatOpenAIResponseFormatType.jsonObject enables JSON mode,
  /// which guarantees the message the model generates is valid JSON.
  ///
  /// Important: when using JSON mode you must still instruct the model to
  /// produce JSON yourself via some conversation message, for example via your
  /// system message. If you don't do this, the model may generate an unending
  /// stream of whitespace until the generation reaches the token limit, which
  /// may take a lot of time and give the appearance of a "stuck" request.
  /// Also note that the message content may be partial (i.e. cut off) if
  /// `finish_reason="length"`, which indicates the generation exceeded
  /// `max_tokens` or the conversation exceeded the max context length.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-response_format
  final dynamic responseFormat;

  /// This feature is in Beta. If specified, our system will make a best effort
  /// to sample deterministically, such that repeated requests with the same
  /// seed and parameters should return the same result. Determinism is not
  /// guaranteed, and you should refer to the system_fingerprint response
  /// parameter to monitor changes in the backend.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-seed
  final int? seed;

  /// Up to 4 sequences where the API will stop generating further tokens.
  ///
  /// Ref: https://platform.openai.com/docs/api-reference/chat/create#chat-create-stop
  final List<String>? stop;

  /// What sampling temperature to use, between 0 and 2.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-temperature
  final double? temperature;

  /// An alternative to sampling with temperature, called nucleus sampling,
  /// where the model considers the results of the tokens with top_p
  /// probability mass.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-top_p
  final double? topP;

  /// Whether to enable parallel tool calling during tool use.
  /// By default, it is enabled.
  ///
  ///
  /// Ref: https://platform.openai.com/docs/guides/function-calling/parallel-function-calling
  final bool? parallelToolCalls;

  /// Specifies the latency tier to use for processing the request.
  /// This is relevant for customers subscribed to the scale tier service.
  final ChatOpenAIServiceTier? serviceTier;

  /// A unique identifier representing your end-user, which can help OpenAI to
  /// monitor and detect abuse.
  ///
  /// Ref: https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids
  final String? user;
  
  /// Controls which (if any) tool is called by the model.
  final dynamic toolChoice;
  
  /// Whether to return log probabilities of the output tokens or not.
  final bool? logprobs;
  
  /// An integer between 0 and 20 specifying the number of most likely tokens to return at each token position.
  final int? topLogprobs;
}

/// Specifies the latency tier to use for processing the request.
/// This is relevant for customers subscribed to the scale tier service.
enum ChatOpenAIServiceTier {
  /// The system will utilize scale tier credits until they are exhausted.
  auto,

  /// The request will be processed using the default service tier with a lower
  /// uptime SLA and no latency guarantee.
  vDefault,
}

/// {@template openai_refusal_exception}
/// Exception thrown when OpenAI Structured Outputs API returns a refusal.
///
/// When using OpenAI's Structured Outputs API with user-generated input, the
/// model may occasionally refuse to fulfill the request for safety reasons.
///
/// See here for more on refusals:
/// https://platform.openai.com/docs/guides/structured-outputs/refusals
/// {@endtemplate}
class OpenAIRefusalException implements Exception {
  /// {@macro openai_refusal_exception}
  const OpenAIRefusalException(this.message);

  /// The refusal message.
  final String message;

  @override
  String toString() => 'OpenAIRefusalException: $message';
}
