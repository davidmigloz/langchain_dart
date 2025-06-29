import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../language_models/language_models.dart';
import '../tools/base.dart';

/// OpenAI defaults
const String openAIDefaultModel = 'gpt-3.5-turbo';

/// Google Generative AI defaults
const String googleAIDefaultModel = 'gemini-1.5-flash';

/// Vertex AI defaults
const String vertexAIDefaultPublisher = 'google';

/// Vertex AI defaults
const String vertexAIDefaultModel = 'chat-bison';

/// Default options for each provider
const ChatOpenAIOptions defaultOpenAIOptions = ChatOpenAIOptions(
  model: openAIDefaultModel,
);

/// {@template chat_openai_options}
/// Options to pass into the OpenAI Chat Model.
///
/// Available [ChatOpenAIOptions.model]s:
/// - `gpt-4.1`
/// - `gpt-4.1-mini`
/// - `gpt-4.1-nano`
/// - `gpt-4.1-2025-04-14`
/// - `gpt-4.1-mini-2025-04-14`
/// - `gpt-4.1-nano-2025-04-14`
/// - `o4-mini`
/// - `o4-mini-2025-04-16`
/// - `o3`
/// - `o3-2025-04-16`
/// - `o3-mini`
/// - `o3-mini-2025-01-31`
/// - `o1`
/// - `o1-2024-12-17`
/// - `o1-preview`
/// - `o1-preview-2024-09-12`
/// - `o1-mini`
/// - `o1-mini-2024-09-12`
/// - `gpt-4o`
/// - `gpt-4o-2024-11-20`
/// - `gpt-4o-2024-08-06`
/// - `gpt-4o-2024-05-13`
/// - `gpt-4o-audio-preview`
/// - `gpt-4o-audio-preview-2024-10-01`
/// - `gpt-4o-audio-preview-2024-12-17`
/// - `gpt-4o-audio-preview-2025-06-03`
/// - `gpt-4o-mini-audio-preview`
/// - `gpt-4o-mini-audio-preview-2024-12-17`
/// - `gpt-4o-search-preview`
/// - `gpt-4o-mini-search-preview`
/// - `gpt-4o-search-preview-2025-03-11`
/// - `gpt-4o-mini-search-preview-2025-03-11`
/// - `chatgpt-4o-latest`
/// - `codex-mini-latest`
/// - `gpt-4o-mini`
/// - `gpt-4o-mini-2024-07-18`
/// - `gpt-4-turbo`
/// - `gpt-4-turbo-2024-04-09`
/// - `gpt-4-0125-preview`
/// - `gpt-4-turbo-preview`
/// - `gpt-4-1106-preview`
/// - `gpt-4-vision-preview`
/// - `gpt-4`
/// - `gpt-4-0314`
/// - `gpt-4-0613`
/// - `gpt-4-32k`
/// - `gpt-4-32k-0314`
/// - `gpt-4-32k-0613`
/// - `gpt-3.5-turbo`
/// - `gpt-3.5-turbo-16k`
/// - `gpt-3.5-turbo-0301`
/// - `gpt-3.5-turbo-0613`
/// - `gpt-3.5-turbo-1106`
/// - `gpt-3.5-turbo-0125`
/// - `gpt-3.5-turbo-16k-0613`
///
/// Mind that the list may be outdated.
/// See https://platform.openai.com/docs/models for the latest list.
/// {@endtemplate}
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
  }) => ChatOpenAIOptions(
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

  @override
  ChatOpenAIOptions merge(covariant ChatOpenAIOptions? other) => copyWith(
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

  @override
  bool operator ==(covariant ChatOpenAIOptions other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          model == other.model &&
          frequencyPenalty == other.frequencyPenalty &&
          const MapEquality<String, int>().equals(logitBias, other.logitBias) &&
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

  @override
  int get hashCode =>
      model.hashCode ^
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

/// {@template chat_openai_response_format}
/// An object specifying the format that the model must output.
/// {@endtemplate}
sealed class ChatOpenAIResponseFormat {
  const ChatOpenAIResponseFormat();

  /// The model will respond with a valid JSON object that adheres to the
  /// specified schema.
  factory ChatOpenAIResponseFormat.jsonSchema(
    ChatOpenAIJsonSchema jsonSchema,
  ) => ChatOpenAIResponseFormatJsonSchema(jsonSchema: jsonSchema);

  /// The model will respond with text.
  static const text = ChatOpenAIResponseFormatText();

  /// The model will respond with a valid JSON object.
  static const jsonObject = ChatOpenAIResponseFormatJsonObject();
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
class ChatOpenAIResponseFormatJsonSchema extends ChatOpenAIResponseFormat {
  /// {@macro chat_openai_response_format_json_schema}
  const ChatOpenAIResponseFormatJsonSchema({required this.jsonSchema});

  /// The JSON schema that the model must adhere to.
  final ChatOpenAIJsonSchema jsonSchema;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(covariant ChatOpenAIResponseFormatJsonSchema other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && jsonSchema == other.jsonSchema;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => jsonSchema.hashCode;
}

/// {@template chat_openai_json_schema}
/// Specifies the schema for the response format.
/// {@endtemplate}
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
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(covariant ChatOpenAIJsonSchema other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          const MapEquality<String, dynamic>().equals(schema, other.schema) &&
          strict == other.strict;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      const MapEquality<String, dynamic>().hash(schema) ^
      strict.hashCode;
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

/// {@template chat_message}
/// A message in a chat.
/// {@endtemplate}
@immutable
sealed class ChatMessage {
  const ChatMessage();
  factory ChatMessage.fromMap(Map<String, dynamic> map) =>
      switch (map['type']) {
        'system' => SystemChatMessage.fromMap(map),
        'human' => HumanChatMessage.fromMap(map),
        'ai' => AIChatMessage.fromMap(map),
        'tool' => ToolChatMessage.fromMap(map),
        'custom' => CustomChatMessage.fromMap(map),
        null => throw ArgumentError('Type is required'),
        _ => throw UnimplementedError('Unknown type: [39m${map['type']}'),
      };
  factory ChatMessage.system(String content) =>
      SystemChatMessage(content: content);
  factory ChatMessage.human(ChatMessageContent content) =>
      HumanChatMessage(content: content);
  factory ChatMessage.humanText(String text) =>
      HumanChatMessage(content: ChatMessageContent.text(text));
  factory ChatMessage.ai(
    String content, {
    List<AIChatMessageToolCall> toolCalls = const [],
  }) => AIChatMessage(content: content, toolCalls: toolCalls);
  factory ChatMessage.tool({
    required String toolCallId,
    required String content,
  }) => ToolChatMessage(toolCallId: toolCallId, content: content);
  factory ChatMessage.custom(String content, {required String role}) =>
      CustomChatMessage(content: content, role: role);

  /// Convert the message to a map.
  Map<String, dynamic> toMap() => {};

  /// Get the content of the message as a string.
  String get contentAsString => switch (this) {
    final SystemChatMessage system => system.content,
    final HumanChatMessage human => switch (human.content) {
      final ChatMessageContentText text => text.text,
      final ChatMessageContentImage image => image.data,
      final ChatMessageContentMultiModal multiModal =>
        multiModal.parts
            .map(
              (p) => switch (p) {
                final ChatMessageContentText text => text.text,
                final ChatMessageContentImage image => image.data,
                ChatMessageContentMultiModal _ => '',
              },
            )
            .join('\n'),
    },
    final AIChatMessage ai => ai.content,
    final ToolChatMessage tool => tool.content,
    final CustomChatMessage custom => custom.content,
  };

  /// Concatenate this message with another message.
  ChatMessage concat(ChatMessage other);
}

/// {@template system_chat_message}
/// A system message in a chat.
/// {@endtemplate}
@immutable
class SystemChatMessage extends ChatMessage {
  /// {@macro system_chat_message}
  const SystemChatMessage({required this.content});

  /// Create a system chat message from a map.
  factory SystemChatMessage.fromMap(Map<String, dynamic> map) =>
      SystemChatMessage(content: map['content'] as String);
  @override
  Map<String, dynamic> toMap() => {
    ...super.toMap(),
    'content': content,
    'type': 'system',
  };

  /// The content of the message.
  final String content;

  /// The default prefix for the message.
  static const defaultPrefix = 'System';
  @override
  bool operator ==(covariant SystemChatMessage other) =>
      identical(this, other) || content == other.content;
  @override
  int get hashCode => content.hashCode;
  @override
  SystemChatMessage concat(ChatMessage other) {
    if (other is! SystemChatMessage) {
      return this;
    }
    return SystemChatMessage(content: content + other.content);
  }

  @override
  String toString() =>
      '''
SystemChatMessage{
  content: $content,
}''';
}

/// {@template human_chat_message}
/// A human message in a chat.
/// {@endtemplate}
@immutable
class HumanChatMessage extends ChatMessage {
  /// {@macro human_chat_message}
  const HumanChatMessage({required this.content});

  /// Create a human chat message from a map.
  factory HumanChatMessage.fromMap(Map<String, dynamic> map) =>
      HumanChatMessage(content: ChatMessageContent.fromMap(map['content']));
  @override
  Map<String, dynamic> toMap() => {
    ...super.toMap(),
    'content': content.toMap(),
    'type': 'human',
  };

  /// The content of the message.
  final ChatMessageContent content;

  /// The default prefix for the message.
  static const defaultPrefix = 'Human';
  @override
  bool operator ==(covariant HumanChatMessage other) =>
      identical(this, other) || content == other.content;
  @override
  int get hashCode => content.hashCode;
  @override
  HumanChatMessage concat(ChatMessage other) {
    if (other is! HumanChatMessage) {
      return this;
    }
    final thisContent = content;
    final otherContent = other.content;
    if (thisContent is ChatMessageContentText) {
      return switch (otherContent) {
        ChatMessageContentText(text: final text) => HumanChatMessage(
          content: ChatMessageContent.text(thisContent.text + text),
        ),
        final ChatMessageContentImage image => HumanChatMessage(
          content: ChatMessageContentMultiModal(parts: [thisContent, image]),
        ),
        final ChatMessageContentMultiModal multiModal => HumanChatMessage(
          content: ChatMessageContentMultiModal(
            parts: [thisContent, ...multiModal.parts],
          ),
        ),
      };
    } else if (thisContent is ChatMessageContentImage) {
      return switch (otherContent) {
        final ChatMessageContentText text => HumanChatMessage(
          content: ChatMessageContentMultiModal(parts: [thisContent, text]),
        ),
        final ChatMessageContentImage image => HumanChatMessage(
          content: ChatMessageContentMultiModal(parts: [thisContent, image]),
        ),
        final ChatMessageContentMultiModal multiModal => HumanChatMessage(
          content: ChatMessageContentMultiModal(
            parts: [thisContent, ...multiModal.parts],
          ),
        ),
      };
    } else if (thisContent is ChatMessageContentMultiModal) {
      return switch (otherContent) {
        final ChatMessageContentText text => HumanChatMessage(
          content: ChatMessageContentMultiModal(
            parts: [...thisContent.parts, text],
          ),
        ),
        final ChatMessageContentImage image => HumanChatMessage(
          content: ChatMessageContentMultiModal(
            parts: [...thisContent.parts, image],
          ),
        ),
        final ChatMessageContentMultiModal multiModal => HumanChatMessage(
          content: ChatMessageContentMultiModal(
            parts: [...thisContent.parts, ...multiModal.parts],
          ),
        ),
      };
    } else {
      throw ArgumentError('Unknown ChatMessageContent type: $thisContent');
    }
  }

  @override
  String toString() =>
      '''
HumanChatMessage{
  content: $content,
}''';
}

/// {@template ai_chat_message}
/// An AI message in a chat.
/// {@endtemplate}
@immutable
class AIChatMessage extends ChatMessage {
  /// {@macro ai_chat_message}
  const AIChatMessage({required this.content, this.toolCalls = const []});

  /// Create an AI chat message from a map.
  factory AIChatMessage.fromMap(Map<String, dynamic> map) => AIChatMessage(
    content: map['content'] as String,
    toolCalls: (map['toolCalls'] as List<dynamic>)
        .map((i) => i as Map<String, dynamic>)
        .map(AIChatMessageToolCall.fromMap)
        .toList(growable: false),
  );
  @override
  Map<String, dynamic> toMap() => {
    ...super.toMap(),
    'content': content,
    'toolCalls': toolCalls.map((t) => t.toMap()).toList(growable: false),
    'type': 'ai',
  };

  /// The content of the message.
  final String content;

  /// The tool calls in the message.
  final List<AIChatMessageToolCall> toolCalls;

  /// The default prefix for the message.
  static const defaultPrefix = 'AI';
  @override
  bool operator ==(covariant AIChatMessage other) {
    final listEquals = const DeepCollectionEquality().equals;
    return identical(this, other) ||
        content == other.content && listEquals(toolCalls, other.toolCalls);
  }

  @override
  int get hashCode => content.hashCode ^ toolCalls.hashCode;
  @override
  AIChatMessage concat(ChatMessage other) {
    if (other is! AIChatMessage) {
      return this;
    }
    final toolCalls = <AIChatMessageToolCall>[];
    if (this.toolCalls.isNotEmpty || other.toolCalls.isNotEmpty) {
      final thisToolCallsById = {
        for (final toolCall in this.toolCalls) toolCall.id: toolCall,
      };
      final otherToolCallsById = {
        for (final toolCall in other.toolCalls)
          (toolCall.id.isNotEmpty
                  ? toolCall.id
                  : (this.toolCalls.lastOrNull?.id ?? '')):
              toolCall,
      };
      final toolCallsIds = {
        ...thisToolCallsById.keys,
        ...otherToolCallsById.keys,
      };
      for (final id in toolCallsIds) {
        final thisToolCall = thisToolCallsById[id];
        final otherToolCall = otherToolCallsById[id];
        toolCalls.add(
          AIChatMessageToolCall(
            id: id,
            name: (thisToolCall?.name ?? '') + (otherToolCall?.name ?? ''),
            argumentsRaw:
                (thisToolCall?.argumentsRaw ?? '') +
                (otherToolCall?.argumentsRaw ?? ''),
            arguments: {
              ...?thisToolCall?.arguments,
              ...?otherToolCall?.arguments,
            },
          ),
        );
      }
    }
    return AIChatMessage(
      content: content + other.content,
      toolCalls: toolCalls,
    );
  }

  @override
  String toString() =>
      '''
AIChatMessage{
  content: $content,
  toolCalls: $toolCalls,
}''';
}

/// {@template tool_chat_message}
/// A tool message in a chat.
/// {@endtemplate}
@immutable
class ToolChatMessage extends ChatMessage {
  /// {@macro tool_chat_message}
  const ToolChatMessage({required this.toolCallId, required this.content});

  /// Create a tool chat message from a map.
  factory ToolChatMessage.fromMap(Map<String, dynamic> map) => ToolChatMessage(
    toolCallId: map['toolCallId'] as String,
    content: map['content'] as String,
  );
  @override
  Map<String, dynamic> toMap() => {
    ...super.toMap(),
    'content': content,
    'toolCallId': toolCallId,
    'type': 'tool',
  };

  /// The ID of the tool call.
  final String toolCallId;

  /// The content of the message.
  final String content;

  /// The default prefix for the message.
  static const defaultPrefix = 'Tool';
  @override
  bool operator ==(covariant ToolChatMessage other) =>
      identical(this, other) ||
      toolCallId == other.toolCallId && content == other.content;
  @override
  int get hashCode => toolCallId.hashCode ^ content.hashCode;
  @override
  ToolChatMessage concat(ChatMessage other) {
    if (other is! ToolChatMessage) {
      return this;
    }
    return ToolChatMessage(
      toolCallId: toolCallId,
      content: content + other.content,
    );
  }

  @override
  String toString() =>
      '''
ToolChatMessage{
  toolCallId: $toolCallId,
  content: $content,
}''';
}

/// {@template custom_chat_message}
/// A custom message in a chat.
/// {@endtemplate}
@immutable
class CustomChatMessage extends ChatMessage {
  /// {@macro custom_chat_message}
  const CustomChatMessage({required this.content, required this.role});

  /// Create a custom chat message from a map.
  factory CustomChatMessage.fromMap(Map<String, dynamic> map) =>
      CustomChatMessage(
        content: map['content'] as String,
        role: map['role'] as String,
      );
  @override
  Map<String, dynamic> toMap() => {
    ...super.toMap(),
    'content': content,
    'role': role,
    'type': 'custom',
  };

  /// The content of the message.
  final String content;

  /// The role of the message.
  final String role;
  @override
  bool operator ==(covariant CustomChatMessage other) =>
      identical(this, other) || content == other.content && role == other.role;
  @override
  int get hashCode => content.hashCode ^ role.hashCode;
  @override
  CustomChatMessage concat(ChatMessage other) {
    if (other is! CustomChatMessage) {
      return this;
    }
    return CustomChatMessage(role: role, content: content + other.content);
  }

  @override
  String toString() =>
      '''
CustomChatMessage{
  content: $content,
  role: $role,
}''';
}

/// {@template chat_message_content}
/// A content of a message in a chat.
/// {@endtemplate}
@immutable
sealed class ChatMessageContent {
  /// {@macro chat_message_content}
  const ChatMessageContent();

  /// Create a chat message content from a map.
  factory ChatMessageContent.fromMap(Map<String, dynamic> map) =>
      switch (map['type']) {
        'text' => ChatMessageContentText.fromMap(map),
        'image' => ChatMessageContentImage.fromMap(map),
        'multi_modal' => ChatMessageContentMultiModal.fromMap(map),
        null => throw ArgumentError('Type is required'),
        _ => throw UnimplementedError('Unknown type: [39m${map['type']}'),
      };

  /// Create a text chat message content.
  factory ChatMessageContent.text(String text) =>
      ChatMessageContentText(text: text);

  /// Create an image chat message content.
  factory ChatMessageContent.image({
    required String data,
    String? mimeType,
    ChatMessageContentImageDetail imageDetail =
        ChatMessageContentImageDetail.auto,
  }) => ChatMessageContentImage(
    data: data,
    mimeType: mimeType,
    detail: imageDetail,
  );

  /// Create a multi-modal chat message content.
  factory ChatMessageContent.multiModal(List<ChatMessageContent> parts) =>
      ChatMessageContentMultiModal(parts: parts);

  /// Convert the chat message content to a map.
  Map<String, dynamic> toMap() => {};
}

/// {@template chat_message_content_text}
/// A text content of a message in a chat.
/// {@endtemplate}
class ChatMessageContentText extends ChatMessageContent {
  /// {@macro chat_message_content_text}
  const ChatMessageContentText({required this.text});

  /// Create a text chat message content from a map.
  factory ChatMessageContentText.fromMap(Map<String, dynamic> map) =>
      ChatMessageContentText(text: map['content'] as String);

  /// The text of the content.
  final String text;
  @override
  Map<String, dynamic> toMap() => {
    ...super.toMap(),
    'type': 'text',
    'content': text,
  };
  @override
  bool operator ==(covariant ChatMessageContentText other) =>
      identical(this, other) || text == other.text;
  @override
  int get hashCode => text.hashCode;
  @override
  String toString() =>
      '''
ChatMessageContentText{
  text: $text,
}''';
}

/// {@template chat_message_content_image}
/// An image content of a message in a chat.
/// {@endtemplate}
class ChatMessageContentImage extends ChatMessageContent {
  /// {@macro chat_message_content_image}
  const ChatMessageContentImage({
    required this.data,
    this.mimeType,
    this.detail = ChatMessageContentImageDetail.auto,
  });

  /// Create an image chat message content from a map.
  factory ChatMessageContentImage.fromMap(Map<String, dynamic> map) =>
      ChatMessageContentImage(
        data: map['data'] as String,
        mimeType: map['mimeType'] as String?,
        detail: ChatMessageContentImageDetail.values.firstWhere(
          (i) => map['detail'] == i.name,
          orElse: () => ChatMessageContentImageDetail.auto,
        ),
      );

  /// The data of the content.
  final String data;

  /// The MIME type of the content.
  final String? mimeType;

  /// The detail of the content.
  final ChatMessageContentImageDetail detail;
  @override
  Map<String, dynamic> toMap() => {
    ...super.toMap(),
    'type': 'image',
    'data': data,
    'mimeType': mimeType,
    'detail': detail.name,
  };
  @override
  bool operator ==(covariant ChatMessageContentImage other) =>
      identical(this, other) ||
      data == other.data &&
          mimeType == other.mimeType &&
          detail == other.detail;
  @override
  int get hashCode => data.hashCode ^ mimeType.hashCode ^ detail.hashCode;
  @override
  String toString() =>
      '''
ChatMessageContentImage{
  url: $data,
  mimeType: $mimeType,
  imageDetail: $detail,
}''';
}

/// {@template chat_message_content_multi_modal}
/// A multi-modal content of a message in a chat.
/// {@endtemplate}
@immutable
class ChatMessageContentMultiModal extends ChatMessageContent {
  /// {@macro chat_message_content_multi_modal}
  ChatMessageContentMultiModal({required this.parts})
    : assert(
        !parts.any((p) => p is ChatMessageContentMultiModal),
        'Multi-modal messages cannot contain other multi-modal messages.',
      );

  /// Create a multi-modal chat message content from a map.
  factory ChatMessageContentMultiModal.fromMap(Map<String, dynamic> map) =>
      ChatMessageContentMultiModal(
        parts: (map['parts'] as List<dynamic>)
            .whereType<Map<String, dynamic>>()
            .map(ChatMessageContent.fromMap)
            .toList(growable: false),
      );
  @override
  Map<String, dynamic> toMap() => {
    ...super.toMap(),
    'type': 'multi_modal',
    'parts': parts.map((p) => p.toMap()).toList(growable: false),
  };

  /// The parts of the content.
  final List<ChatMessageContent> parts;
  @override
  bool operator ==(covariant ChatMessageContentMultiModal other) =>
      identical(this, other) || parts == other.parts;
  @override
  int get hashCode => parts.hashCode;
  @override
  String toString() =>
      '''
ChatMessageContentMultiModal{
  parts: $parts,
}''';
}

/// The detail of an image chat message content.
enum ChatMessageContentImageDetail {
  /// The detail is auto.
  auto,

  /// The detail is low.
  low,

  /// The detail is high.
  high,
}

/// {@template chat_tool_choice}
/// A tool choice in a chat.
/// {@endtemplate}
sealed class ChatToolChoice {
  /// {@macro chat_tool_choice}
  const ChatToolChoice();
  factory ChatToolChoice.forced({required String name}) =>
      ChatToolChoiceForced(name: name);
  factory ChatToolChoice.fromMap(Map<String, dynamic> map) =>
      switch (map['type']) {
        'none' => ChatToolChoiceNone.fromMap(),
        'auto' => ChatToolChoiceAuto.fromMap(),
        'required' => ChatToolChoiceRequired.fromMap(),
        'forced' => ChatToolChoiceForced.fromMap(map),
        null => throw ArgumentError('Type is required'),
        _ => throw UnimplementedError('Unknown type: [39m${map['type']}'),
      };

  /// A none tool choice.
  static const none = ChatToolChoiceNone();

  /// An auto tool choice.
  static const auto = ChatToolChoiceAuto();

  /// A required tool choice.
  static const required = ChatToolChoiceRequired();

  /// Convert the tool choice to a map.
  Map<String, dynamic> toMap() => {};
}

/// {@template chat_tool_choice_none}
/// A none tool choice in a chat.
/// {@endtemplate}
final class ChatToolChoiceNone extends ChatToolChoice {
  /// {@macro chat_tool_choice_none}
  const ChatToolChoiceNone();

  /// Create a none tool choice from a map.
  factory ChatToolChoiceNone.fromMap() => const ChatToolChoiceNone();

  /// Convert the none tool choice to a map.
  @override
  Map<String, dynamic> toMap() => {...super.toMap(), 'type': 'none'};
}

/// {@template chat_tool_choice_auto}
/// An auto tool choice in a chat.
/// {@endtemplate}
final class ChatToolChoiceAuto extends ChatToolChoice {
  /// {@macro chat_tool_choice_auto}
  const ChatToolChoiceAuto();

  /// Create an auto tool choice from a map.
  factory ChatToolChoiceAuto.fromMap() => const ChatToolChoiceAuto();

  /// Convert the auto tool choice to a map.
  @override
  Map<String, dynamic> toMap() => {...super.toMap(), 'type': 'auto'};
}

/// {@template chat_tool_choice_required}
/// A required tool choice in a chat.
/// {@endtemplate}
final class ChatToolChoiceRequired extends ChatToolChoice {
  /// {@macro chat_tool_choice_required}
  const ChatToolChoiceRequired();

  /// Create a required tool choice from a map.
  factory ChatToolChoiceRequired.fromMap() => const ChatToolChoiceRequired();

  /// Convert the required tool choice to a map.
  @override
  Map<String, dynamic> toMap() => {...super.toMap(), 'type': 'required'};
}

/// {@template chat_tool_choice_forced}
/// A forced tool choice in a chat.
/// {@endtemplate}
@immutable
final class ChatToolChoiceForced extends ChatToolChoice {
  /// {@macro chat_tool_choice_forced}
  const ChatToolChoiceForced({required this.name});

  /// Create a forced tool choice from a map.
  factory ChatToolChoiceForced.fromMap(Map<String, dynamic> map) =>
      ChatToolChoiceForced(name: map['name'] as String);

  /// The name of the tool choice.
  final String name;
  @override
  Map<String, dynamic> toMap() => {
    ...super.toMap(),
    'type': 'forced',
    'name': name,
  };
  @override
  bool operator ==(covariant ChatToolChoiceForced other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && name == other.name;
  @override
  int get hashCode => name.hashCode;
}

/// {@template ai_chat_message_tool_call}
/// A tool call in an AI message in a chat.
/// {@endtemplate}
@immutable
class AIChatMessageToolCall {
  /// {@macro ai_chat_message_tool_call}
  const AIChatMessageToolCall({
    required this.id,
    required this.name,
    required this.argumentsRaw,
    required this.arguments,
  });

  /// Converts a map to a [AIChatMessageToolCall].
  factory AIChatMessageToolCall.fromMap(Map<String, dynamic> map) =>
      AIChatMessageToolCall(
        id: map['id'] as String,
        name: map['name'] as String,
        argumentsRaw: map['argumentsRaw'] as String,
        arguments: (map['arguments'] as Map<String, dynamic>?) ?? {},
      );

  /// The id of the tool to call.
  ///
  /// This is used to match up the tool results later.
  final String id;

  /// The name of the tool to call.
  final String name;

  /// The raw arguments JSON string (needed to parse streaming responses).
  final String argumentsRaw;

  /// The arguments to pass to the tool in JSON Map format.
  ///
  /// Note that the model does not always generate a valid JSON, in that case,
  /// [arguments] will be empty but you can still see the raw response in
  /// [argumentsRaw].
  ///
  /// The model may also hallucinate parameters not defined by your tool schema.
  /// Validate the arguments in your code before calling your tool.
  final Map<String, dynamic> arguments;

  /// Converts the [AIChatMessageToolCall] to a [Map].
  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'argumentsRaw': argumentsRaw,
    'arguments': arguments,
  };

  @override
  bool operator ==(covariant AIChatMessageToolCall other) {
    final mapEquals = const DeepCollectionEquality().equals;
    return identical(this, other) ||
        id == other.id &&
            name == other.name &&
            argumentsRaw == other.argumentsRaw &&
            mapEquals(arguments, other.arguments);
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ argumentsRaw.hashCode ^ arguments.hashCode;

  @override
  String toString() =>
      '''
AIChatMessageToolCall{
  id: $id,
  name: $name,
  argumentsRaw: $argumentsRaw,
  arguments: $arguments,
}''';
}

/// {@template chat_model_options}
/// Options for a chat model.
/// {@endtemplate}
abstract class ChatModelOptions extends LanguageModelOptions {
  /// {@macro chat_model_options}
  const ChatModelOptions({
    super.model,
    this.tools,
    this.toolChoice,
    super.concurrencyLimit,
  });

  /// A list of tools the model may call.
  final List<ToolSpec>? tools;

  /// Controls which (if any) tool is called by the model.
  final ChatToolChoice? toolChoice;

  @override
  ChatModelOptions copyWith({
    String? model,
    List<ToolSpec>? tools,
    ChatToolChoice? toolChoice,
    int? concurrencyLimit,
  });
}

/// {@template chat_result}
/// A result of a chat.
/// {@endtemplate}
@immutable
class ChatResult extends LanguageModelResult<AIChatMessage> {
  /// {@macro chat_result}
  const ChatResult({
    required super.id,
    required super.output,
    required super.finishReason,
    required super.metadata,
    required super.usage,
    super.streaming = false,
  });

  @override
  String get outputAsString => output.content;

  @override
  ChatResult concat(LanguageModelResult<AIChatMessage> other) => ChatResult(
    id: other.id.isNotEmpty ? other.id : id,
    output: output.concat(other.output),
    finishReason:
        finishReason != FinishReason.unspecified &&
            other.finishReason == FinishReason.unspecified
        ? finishReason
        : other.finishReason,
    metadata: {...metadata, ...other.metadata},
    usage: usage.concat(other.usage),
    streaming: other.streaming,
  );

  @override
  String toString() =>
      '''
ChatResult{
  id: $id, 
  output: $output,
  finishReason: $finishReason,
  metadata: $metadata,
  usage: $usage,
  streaming: $streaming
}''';
}
