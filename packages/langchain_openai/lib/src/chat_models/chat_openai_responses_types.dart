import 'package:collection/collection.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:meta/meta.dart';

/// {@template chat_openai_responses_options}
/// Options to pass into the OpenAI Responses API Chat Model.
///
/// Available [ChatOpenAIResponsesOptions.model]s:
/// - `gpt-5`
/// - `gpt-5-mini`
/// - `gpt-5-nano`
/// - `gpt-4.1`
/// - `gpt-4.1-mini`
/// - `gpt-4.1-nano`
/// - `o4-mini`
/// - `o3`
/// - `o3-mini`
/// - `o1`
/// - `gpt-4o`
/// - `gpt-4o-mini`
///
/// Mind that the list may be outdated.
/// See https://platform.openai.com/docs/models for the latest list.
/// {@endtemplate}
@immutable
class ChatOpenAIResponsesOptions extends ChatModelOptions {
  /// {@macro chat_openai_responses_options}
  const ChatOpenAIResponsesOptions({
    super.model,
    this.instructions,
    this.previousResponseId,
    this.store,
    this.reasoningEffort,
    this.metadata,
    this.frequencyPenalty,
    this.topLogprobs,
    this.maxOutputTokens,
    this.presencePenalty,
    this.responseFormat,
    this.temperature,
    this.topP,
    super.tools,
    super.toolChoice,
    this.parallelToolCalls,
    this.serviceTier,
    this.truncation,
    super.concurrencyLimit,
  });

  /// A system (or developer) message inserted at the beginning of the
  /// model's context as an alternative to adding a [SystemChatMessage].
  ///
  /// See https://platform.openai.com/docs/api-reference/responses/create#responses-create-instructions
  final String? instructions;

  /// The unique ID of the previous response to the model. Use this to
  /// create multi-turn conversations. The model will use the previous
  /// response to inform its response.
  ///
  /// See https://platform.openai.com/docs/api-reference/responses/create#responses-create-previous_response_id
  final String? previousResponseId;

  /// Whether or not to store the output of this chat completion request.
  ///
  /// See https://platform.openai.com/docs/api-reference/responses/create#responses-create-store
  final bool? store;

  /// Constrains effort on reasoning for reasoning models.
  /// Supported values are `low`, `medium`, and `high`.
  ///
  /// See https://platform.openai.com/docs/api-reference/responses/create#responses-create-reasoning
  final ChatOpenAIResponsesReasoningEffort? reasoningEffort;

  /// Developer-defined tags and values used for filtering completions.
  ///
  /// See https://platform.openai.com/docs/api-reference/responses/create#responses-create-metadata
  final Map<String, String>? metadata;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// their existing frequency in the text so far, decreasing the model's
  /// likelihood to repeat the same line verbatim.
  ///
  /// See https://platform.openai.com/docs/api-reference/responses/create#responses-create-frequency_penalty
  final double? frequencyPenalty;

  /// Number of most likely tokens to return at each token position.
  ///
  /// See https://platform.openai.com/docs/api-reference/responses/create#responses-create-top_logprobs
  final int? topLogprobs;

  /// The maximum number of output tokens to generate in the response.
  ///
  /// See https://platform.openai.com/docs/api-reference/responses/create#responses-create-max_output_tokens
  final int? maxOutputTokens;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// whether they appear in the text so far, increasing the model's likelihood
  /// to talk about new topics.
  ///
  /// See https://platform.openai.com/docs/api-reference/responses/create#responses-create-presence_penalty
  final double? presencePenalty;

  /// An object specifying the format that the model must output.
  ///
  /// See https://platform.openai.com/docs/api-reference/responses/create#responses-create-text
  final ChatOpenAIResponsesResponseFormat? responseFormat;

  /// What sampling temperature to use, between 0 and 2.
  ///
  /// See https://platform.openai.com/docs/api-reference/responses/create#responses-create-temperature
  final double? temperature;

  /// An alternative to sampling with temperature, called nucleus sampling,
  /// where the model considers the results of the tokens with top_p
  /// probability mass.
  ///
  /// See https://platform.openai.com/docs/api-reference/responses/create#responses-create-top_p
  final double? topP;

  /// Whether to enable parallel tool calling during tool use.
  ///
  /// See https://platform.openai.com/docs/api-reference/responses/create#responses-create-parallel_tool_calls
  final bool? parallelToolCalls;

  /// Specifies the latency tier to use for processing the request.
  final ChatOpenAIResponsesServiceTier? serviceTier;

  /// The truncation strategy to use for the model.
  ///
  /// See https://platform.openai.com/docs/api-reference/responses/create#responses-create-truncation
  final ChatOpenAIResponsesTruncation? truncation;

  @override
  ChatOpenAIResponsesOptions copyWith({
    final String? model,
    final String? instructions,
    final String? previousResponseId,
    final bool? store,
    final ChatOpenAIResponsesReasoningEffort? reasoningEffort,
    final Map<String, String>? metadata,
    final double? frequencyPenalty,
    final int? topLogprobs,
    final int? maxOutputTokens,
    final double? presencePenalty,
    final ChatOpenAIResponsesResponseFormat? responseFormat,
    final double? temperature,
    final double? topP,
    final List<ToolSpec>? tools,
    final ChatToolChoice? toolChoice,
    final bool? parallelToolCalls,
    final ChatOpenAIResponsesServiceTier? serviceTier,
    final ChatOpenAIResponsesTruncation? truncation,
    final int? concurrencyLimit,
  }) {
    return ChatOpenAIResponsesOptions(
      model: model ?? this.model,
      instructions: instructions ?? this.instructions,
      previousResponseId: previousResponseId ?? this.previousResponseId,
      store: store ?? this.store,
      reasoningEffort: reasoningEffort ?? this.reasoningEffort,
      metadata: metadata ?? this.metadata,
      frequencyPenalty: frequencyPenalty ?? this.frequencyPenalty,
      topLogprobs: topLogprobs ?? this.topLogprobs,
      maxOutputTokens: maxOutputTokens ?? this.maxOutputTokens,
      presencePenalty: presencePenalty ?? this.presencePenalty,
      responseFormat: responseFormat ?? this.responseFormat,
      temperature: temperature ?? this.temperature,
      topP: topP ?? this.topP,
      tools: tools ?? this.tools,
      toolChoice: toolChoice ?? this.toolChoice,
      parallelToolCalls: parallelToolCalls ?? this.parallelToolCalls,
      serviceTier: serviceTier ?? this.serviceTier,
      truncation: truncation ?? this.truncation,
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );
  }

  @override
  ChatOpenAIResponsesOptions merge(
    covariant final ChatOpenAIResponsesOptions? other,
  ) {
    return copyWith(
      model: other?.model,
      instructions: other?.instructions,
      previousResponseId: other?.previousResponseId,
      store: other?.store,
      reasoningEffort: other?.reasoningEffort,
      metadata: other?.metadata,
      frequencyPenalty: other?.frequencyPenalty,
      topLogprobs: other?.topLogprobs,
      maxOutputTokens: other?.maxOutputTokens,
      presencePenalty: other?.presencePenalty,
      responseFormat: other?.responseFormat,
      temperature: other?.temperature,
      topP: other?.topP,
      tools: other?.tools,
      toolChoice: other?.toolChoice,
      parallelToolCalls: other?.parallelToolCalls,
      serviceTier: other?.serviceTier,
      truncation: other?.truncation,
      concurrencyLimit: other?.concurrencyLimit,
    );
  }

  @override
  bool operator ==(covariant final ChatOpenAIResponsesOptions other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            model == other.model &&
            instructions == other.instructions &&
            previousResponseId == other.previousResponseId &&
            store == other.store &&
            reasoningEffort == other.reasoningEffort &&
            const MapEquality<String, String>().equals(
              metadata,
              other.metadata,
            ) &&
            frequencyPenalty == other.frequencyPenalty &&
            topLogprobs == other.topLogprobs &&
            maxOutputTokens == other.maxOutputTokens &&
            presencePenalty == other.presencePenalty &&
            responseFormat == other.responseFormat &&
            temperature == other.temperature &&
            topP == other.topP &&
            const ListEquality<ToolSpec>().equals(tools, other.tools) &&
            toolChoice == other.toolChoice &&
            parallelToolCalls == other.parallelToolCalls &&
            serviceTier == other.serviceTier &&
            truncation == other.truncation &&
            concurrencyLimit == other.concurrencyLimit;
  }

  @override
  int get hashCode {
    return model.hashCode ^
        instructions.hashCode ^
        previousResponseId.hashCode ^
        store.hashCode ^
        reasoningEffort.hashCode ^
        const MapEquality<String, String>().hash(metadata) ^
        frequencyPenalty.hashCode ^
        topLogprobs.hashCode ^
        maxOutputTokens.hashCode ^
        presencePenalty.hashCode ^
        responseFormat.hashCode ^
        temperature.hashCode ^
        topP.hashCode ^
        const ListEquality<ToolSpec>().hash(tools) ^
        toolChoice.hashCode ^
        parallelToolCalls.hashCode ^
        serviceTier.hashCode ^
        truncation.hashCode ^
        concurrencyLimit.hashCode;
  }
}

/// {@template chat_openai_responses_response_format}
/// An object specifying the format that the model must output.
/// {@endtemplate}
sealed class ChatOpenAIResponsesResponseFormat {
  const ChatOpenAIResponsesResponseFormat();

  /// The model will respond with text.
  static const text = ChatOpenAIResponsesResponseFormatText();

  /// The model will respond with a valid JSON object.
  static const jsonObject = ChatOpenAIResponsesResponseFormatJsonObject();

  /// The model will respond with a valid JSON object that adheres to the
  /// specified schema.
  factory ChatOpenAIResponsesResponseFormat.jsonSchema({
    required final String name,
    final String? description,
    required final Map<String, dynamic> schema,
    final bool? strict,
  }) => ChatOpenAIResponsesResponseFormatJsonSchema(
    name: name,
    description: description,
    schema: schema,
    strict: strict,
  );
}

/// {@template chat_openai_responses_response_format_text}
/// The model will respond with text.
/// {@endtemplate}
class ChatOpenAIResponsesResponseFormatText
    extends ChatOpenAIResponsesResponseFormat {
  /// {@macro chat_openai_responses_response_format_text}
  const ChatOpenAIResponsesResponseFormatText();
}

/// {@template chat_openai_responses_response_format_json_object}
/// The model will respond with a valid JSON object.
/// {@endtemplate}
class ChatOpenAIResponsesResponseFormatJsonObject
    extends ChatOpenAIResponsesResponseFormat {
  /// {@macro chat_openai_responses_response_format_json_object}
  const ChatOpenAIResponsesResponseFormatJsonObject();
}

/// {@template chat_openai_responses_response_format_json_schema}
/// The model will respond with a valid JSON object that adheres to the
/// specified schema.
/// {@endtemplate}
@immutable
class ChatOpenAIResponsesResponseFormatJsonSchema
    extends ChatOpenAIResponsesResponseFormat {
  /// {@macro chat_openai_responses_response_format_json_schema}
  const ChatOpenAIResponsesResponseFormatJsonSchema({
    required this.name,
    this.description,
    required this.schema,
    this.strict,
  });

  /// The name of the response format.
  final String name;

  /// A description of what the response format is for.
  final String? description;

  /// The schema for the response format, described as a JSON Schema object.
  final Map<String, dynamic> schema;

  /// Whether to enable strict schema adherence.
  final bool? strict;

  @override
  bool operator ==(
    covariant ChatOpenAIResponsesResponseFormatJsonSchema other,
  ) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            name == other.name &&
            description == other.description &&
            const MapEquality<String, dynamic>().equals(schema, other.schema) &&
            strict == other.strict;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      const MapEquality<String, dynamic>().hash(schema) ^
      strict.hashCode;
}

/// Constrains effort on reasoning for reasoning models.
enum ChatOpenAIResponsesReasoningEffort {
  /// Low effort
  low,

  /// Medium effort
  medium,

  /// High effort
  high,
}

/// Specifies the latency tier to use for processing the request.
enum ChatOpenAIResponsesServiceTier {
  /// The system will utilize scale tier credits until they are exhausted.
  auto,

  /// The request will be processed using the default service tier.
  vDefault,
}

/// The truncation strategy to use for the model.
enum ChatOpenAIResponsesTruncation {
  /// Automatically truncate input.
  auto,

  /// Do not truncate input (may fail if input exceeds context).
  disabled,
}
