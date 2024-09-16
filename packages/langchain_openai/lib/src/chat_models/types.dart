import 'package:collection/collection.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:meta/meta.dart';

/// {@template chat_openai_options}
/// Options to pass into the OpenAI Chat Model.
///
/// Available [ChatOpenAIOptions.model]s:
/// - `chatgpt-4o-latest`
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
/// - `gpt-4o-2024-08-06`
/// - `gpt-4o-mini`
/// - `gpt-4o-mini-2024-07-18`
/// - `gpt-3.5-turbo`
/// - `gpt-3.5-turbo-16k`
/// - `gpt-3.5-turbo-16k-0613`
/// - `gpt-3.5-turbo-0125`
/// - `gpt-3.5-turbo-0301`
/// - `gpt-3.5-turbo-0613`
/// - `gpt-3.5-turbo-1106`
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

  @override
  ChatOpenAIOptions copyWith({
    final String? model,
    final double? frequencyPenalty,
    final Map<String, int>? logitBias,
    final int? maxTokens,
    final int? n,
    final double? presencePenalty,
    final ChatOpenAIResponseFormat? responseFormat,
    final int? seed,
    final List<String>? stop,
    final double? temperature,
    final double? topP,
    final List<ToolSpec>? tools,
    final ChatToolChoice? toolChoice,
    final bool? parallelToolCalls,
    final ChatOpenAIServiceTier? serviceTier,
    final String? user,
    final int? concurrencyLimit,
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
  ChatOpenAIOptions merge(covariant final ChatOpenAIOptions? other) {
    return copyWith(
      model: other?.model,
      frequencyPenalty: other?.frequencyPenalty,
      logitBias: other?.logitBias,
      maxTokens: other?.maxTokens,
      n: other?.n,
      presencePenalty: other?.presencePenalty,
      responseFormat: other?.responseFormat,
      seed: other?.seed,
      stop: other?.stop,
      temperature: other?.temperature,
      topP: other?.topP,
      tools: other?.tools,
      toolChoice: other?.toolChoice,
      parallelToolCalls: other?.parallelToolCalls,
      serviceTier: other?.serviceTier,
      user: other?.user,
      concurrencyLimit: other?.concurrencyLimit,
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
sealed class ChatOpenAIResponseFormat {
  const ChatOpenAIResponseFormat();

  /// The model will respond with text.
  static const text = ChatOpenAIResponseFormatText();

  /// The model will respond with a valid JSON object.
  static const jsonObject = ChatOpenAIResponseFormatJsonObject();

  /// The model will respond with a valid JSON object that adheres to the
  /// specified schema.
  factory ChatOpenAIResponseFormat.jsonSchema(
    final ChatOpenAIJsonSchema jsonSchema,
  ) =>
      ChatOpenAIResponseFormatJsonSchema(jsonSchema: jsonSchema);
}

/// {@template chat_openai_response_format_text}
/// The model will respond with text.
/// {@endtemplate}
class ChatOpenAIResponseFormatText extends ChatOpenAIResponseFormat {
  /// {@macro chat_openai_response_format_text}
  const ChatOpenAIResponseFormatText();
}

/// {@template chat_openai_response_format_json_object}
/// The model will respond with a valid JSON object.
/// {@endtemplate}
class ChatOpenAIResponseFormatJsonObject extends ChatOpenAIResponseFormat {
  /// {@macro chat_openai_response_format_json_object}
  const ChatOpenAIResponseFormatJsonObject();
}

/// {@template chat_openai_response_format_json_schema}
/// The model will respond with a valid JSON object that adheres to the
/// specified schema.
/// {@endtemplate}
@immutable
class ChatOpenAIResponseFormatJsonSchema extends ChatOpenAIResponseFormat {
  /// {@macro chat_openai_response_format_json_schema}
  const ChatOpenAIResponseFormatJsonSchema({
    required this.jsonSchema,
  });

  /// The JSON schema that the model must adhere to.
  final ChatOpenAIJsonSchema jsonSchema;

  @override
  bool operator ==(covariant ChatOpenAIResponseFormatJsonSchema other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType && jsonSchema == other.jsonSchema;
  }

  @override
  int get hashCode => jsonSchema.hashCode;
}

/// {@template chat_openai_json_schema}
/// Specifies the schema for the response format.
/// {@endtemplate}
@immutable
class ChatOpenAIJsonSchema {
  /// {@macro chat_openai_json_schema}
  const ChatOpenAIJsonSchema({
    required this.name,
    required this.schema,
    this.description,
    this.strict = false,
  });

  /// The name of the response format. Must be a-z, A-Z, 0-9, or contain
  /// underscores and dashes, with a maximum length of 64.
  final String name;

  /// A description of what the response format is for, used by the model to
  /// determine how to respond in the format.
  final String? description;

  /// The schema for the response format, described as a JSON Schema object.
  final Map<String, dynamic> schema;

  /// Whether to enable strict schema adherence when generating the output.
  /// If set to true, the model will always follow the exact schema defined in
  /// the `schema` field. Only a subset of JSON Schema is supported when
  /// `strict` is `true`. To learn more, read the
  /// [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
  final bool strict;

  @override
  bool operator ==(covariant ChatOpenAIJsonSchema other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            name == other.name &&
            description == other.description &&
            const MapEquality<String, dynamic>().equals(schema, other.schema) &&
            strict == other.strict;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        const MapEquality<String, dynamic>().hash(schema) ^
        strict.hashCode;
  }
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
  String toString() {
    return 'OpenAIRefusalException: $message';
  }
}
