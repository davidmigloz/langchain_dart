import 'package:collection/collection.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:meta/meta.dart';

/// {@template chat_openai_options}
/// Options to pass into the OpenAI Chat Model.
///
/// Available [ChatOpenAIOptions.model]s:
/// - `gpt-4`
/// - `gpt-4-32k`
/// - `gpt-4-32k-0314`
/// - `gpt-4-32k-0613`
/// - `gpt-4-0125-preview`
/// - `gpt-4-0314`
/// - `gpt-4-0613`
/// - `gpt-4-1106-preview`
/// - `gpt-4-turbo`
/// - `gpt-4-turbo-2024-04-09`
/// - `gpt-4-turbo-preview`
/// - `gpt-4-vision-preview`
/// - `gpt-4o`
/// - `gpt-4o-2024-05-13`
/// - `gpt-4o-mini`
/// - `gpt-4o-mini-2024-07-18`
/// - `gpt-3.5-turbo`
/// - `gpt-3.5-turbo-16k`
///
/// Mind that the list may be outdated.
/// See https://platform.openai.com/docs/models for the latest list.
/// {@endtemplate}
@immutable
class ChatOpenAIOptions extends ChatModelOptions {
  /// {@macro chat_openai_options}
  const ChatOpenAIOptions({
    super.model,
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
    super.tools,
    super.toolChoice,
    this.parallelToolCalls,
    this.serviceTier,
    this.user,
    super.concurrencyLimit,
  });

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
  /// Setting to [ChatOpenAIResponseFormatType.jsonObject] enables JSON mode,
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
  final ChatOpenAIResponseFormat? responseFormat;

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

  /// Creates a copy of this [ChatOpenAIOptions] object with the given fields
  /// replaced with the new values.
  ChatOpenAIOptions copyWith({
    String? model,
    double? frequencyPenalty,
    Map<String, int>? logitBias,
    int? maxTokens,
    int? n,
    double? presencePenalty,
    ChatOpenAIResponseFormat? responseFormat,
    int? seed,
    List<String>? stop,
    double? temperature,
    double? topP,
    List<ToolSpec>? tools,
    ChatToolChoice? toolChoice,
    bool? parallelToolCalls,
    ChatOpenAIServiceTier? serviceTier,
    String? user,
    int? concurrencyLimit,
  }) {
    return ChatOpenAIOptions(
      model: model ?? this.model,
      frequencyPenalty: frequencyPenalty ?? this.frequencyPenalty,
      logitBias: logitBias ?? this.logitBias,
      maxTokens: maxTokens ?? this.maxTokens,
      n: n ?? this.n,
      presencePenalty: presencePenalty ?? this.presencePenalty,
      responseFormat: responseFormat ?? this.responseFormat,
      seed: seed ?? this.seed,
      stop: stop ?? this.stop,
      temperature: temperature ?? this.temperature,
      topP: topP ?? this.topP,
      tools: tools ?? this.tools,
      toolChoice: toolChoice ?? this.toolChoice,
      parallelToolCalls: parallelToolCalls ?? this.parallelToolCalls,
      serviceTier: serviceTier ?? this.serviceTier,
      user: user ?? this.user,
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );
  }

  @override
  bool operator ==(covariant final ChatOpenAIOptions other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            model == other.model &&
            frequencyPenalty == other.frequencyPenalty &&
            const MapEquality<String, int>()
                .equals(logitBias, other.logitBias) &&
            maxTokens == other.maxTokens &&
            n == other.n &&
            presencePenalty == other.presencePenalty &&
            responseFormat == other.responseFormat &&
            seed == other.seed &&
            const ListEquality<String>().equals(stop, other.stop) &&
            temperature == other.temperature &&
            topP == other.topP &&
            const ListEquality<ToolSpec>().equals(tools, other.tools) &&
            toolChoice == other.toolChoice &&
            parallelToolCalls == other.parallelToolCalls &&
            serviceTier == other.serviceTier &&
            user == other.user &&
            concurrencyLimit == other.concurrencyLimit;
  }

  @override
  int get hashCode {
    return model.hashCode ^
        frequencyPenalty.hashCode ^
        const MapEquality<String, int>().hash(logitBias) ^
        maxTokens.hashCode ^
        n.hashCode ^
        presencePenalty.hashCode ^
        responseFormat.hashCode ^
        seed.hashCode ^
        const ListEquality<String>().hash(stop) ^
        temperature.hashCode ^
        topP.hashCode ^
        const ListEquality<ToolSpec>().hash(tools) ^
        toolChoice.hashCode ^
        parallelToolCalls.hashCode ^
        serviceTier.hashCode ^
        user.hashCode ^
        concurrencyLimit.hashCode;
  }
}

/// {@template chat_openai_response_format}
/// An object specifying the format that the model must output.
/// {@endtemplate}
class ChatOpenAIResponseFormat {
  /// {@macro chat_openai_response_format}
  const ChatOpenAIResponseFormat({
    required this.type,
  });

  /// The format type.
  final ChatOpenAIResponseFormatType type;
}

/// Types of response formats.
enum ChatOpenAIResponseFormatType {
  /// Standard text mode.
  text,

  /// [ChatOpenAIResponseFormatType.jsonObject] enables JSON mode, which
  /// guarantees the message the model generates is valid JSON.
  jsonObject,
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
