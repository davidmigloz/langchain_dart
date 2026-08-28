import 'package:meta/meta.dart';

/// {@template cohere_chat_request}
/// Request for the Cohere v2 Chat API (`POST /v2/chat`).
///
/// This is an intentionally minimal, hand-written representation of the
/// request body. It only covers the subset of the API surface needed by
/// `ChatCohere`. Refer to the
/// [Cohere OpenAPI spec](https://github.com/cohere-ai/cohere-developer-experience/blob/main/cohere-openapi.yaml)
/// if you need to extend it (or to generate a full-blown client).
/// {@endtemplate}
@immutable
class CohereChatRequest {
  /// {@macro cohere_chat_request}
  const CohereChatRequest({
    required this.model,
    required this.messages,
    this.tools,
    this.toolChoice,
    this.temperature,
    this.p,
    this.k,
    this.maxTokens,
    this.stopSequences,
    this.seed,
    this.frequencyPenalty,
    this.presencePenalty,
    this.stream = false,
  });

  /// The name of the model to use (e.g. `command-r-plus-08-2024`).
  final String model;

  /// The conversation messages.
  final List<CohereMessage> messages;

  /// A list of tools the model may call.
  final List<CohereTool>? tools;

  /// Controls whether the model is forced to use tools
  /// (`REQUIRED` or `NONE`).
  final String? toolChoice;

  /// The sampling temperature (between 0 and 1 for Cohere models).
  final double? temperature;

  /// Nucleus sampling probability mass (`p` parameter, between 0.01 and 0.99).
  final double? p;

  /// Top-k sampling (`k` parameter, between 0 and 500).
  final int? k;

  /// The maximum number of tokens to generate.
  final int? maxTokens;

  /// Up to 5 strings that will stop generation when encountered.
  final List<String>? stopSequences;

  /// Seed for deterministic sampling (best effort).
  final int? seed;

  /// Penalizes tokens proportionally to their frequency so far
  /// (between 0 and 1).
  final double? frequencyPenalty;

  /// Penalizes all tokens that have appeared so far (between 0 and 1).
  final double? presencePenalty;

  /// Whether to stream the response as server-sent events.
  final bool stream;

  /// Converts the request to a JSON-serializable map.
  Map<String, dynamic> toJson() => {
    'model': model,
    'messages': messages.map((final m) => m.toJson()).toList(growable: false),
    if (tools != null && tools!.isNotEmpty)
      'tools': tools!.map((final t) => t.toJson()).toList(growable: false),
    if (toolChoice != null) 'tool_choice': toolChoice,
    if (temperature != null) 'temperature': temperature,
    if (p != null) 'p': p,
    if (k != null) 'k': k,
    if (maxTokens != null) 'max_tokens': maxTokens,
    if (stopSequences != null && stopSequences!.isNotEmpty)
      'stop_sequences': stopSequences,
    if (seed != null) 'seed': seed,
    if (frequencyPenalty != null) 'frequency_penalty': frequencyPenalty,
    if (presencePenalty != null) 'presence_penalty': presencePenalty,
    'stream': stream,
  };
}

/// {@template cohere_message}
/// A message in a Cohere v2 chat conversation.
/// {@endtemplate}
@immutable
sealed class CohereMessage {
  /// {@macro cohere_message}
  const CohereMessage();

  /// Creates a system message.
  const factory CohereMessage.system(final String content) =
      CohereSystemMessage;

  /// Creates a user message.
  const factory CohereMessage.user(final String content) = CohereUserMessage;

  /// Creates an assistant message.
  const factory CohereMessage.assistant(
    final String? content, {
    final List<CohereToolCall>? toolCalls,
    final String? toolPlan,
  }) = CohereAssistantMessage;

  /// Creates a tool result message.
  const factory CohereMessage.tool({
    required final String toolCallId,
    required final String content,
  }) = CohereToolMessage;

  /// Converts the message to a JSON-serializable map.
  Map<String, dynamic> toJson();
}

/// {@template cohere_system_message}
/// A system message in a Cohere v2 chat conversation.
/// {@endtemplate}
@immutable
class CohereSystemMessage extends CohereMessage {
  /// {@macro cohere_system_message}
  const CohereSystemMessage(this.content);

  /// The content of the message.
  final String content;

  @override
  Map<String, dynamic> toJson() => {'role': 'system', 'content': content};
}

/// {@template cohere_user_message}
/// A user message in a Cohere v2 chat conversation.
/// {@endtemplate}
@immutable
class CohereUserMessage extends CohereMessage {
  /// {@macro cohere_user_message}
  const CohereUserMessage(this.content);

  /// The content of the message.
  final String content;

  @override
  Map<String, dynamic> toJson() => {'role': 'user', 'content': content};
}

/// {@template cohere_assistant_message}
/// An assistant message in a Cohere v2 chat conversation.
/// {@endtemplate}
@immutable
class CohereAssistantMessage extends CohereMessage {
  /// {@macro cohere_assistant_message}
  const CohereAssistantMessage(this.content, {this.toolCalls, this.toolPlan});

  /// The content of the message.
  final String? content;

  /// The tool calls made by the assistant.
  final List<CohereToolCall>? toolCalls;

  /// The plan the assistant generated before calling tools.
  final String? toolPlan;

  @override
  Map<String, dynamic> toJson() => {
    'role': 'assistant',
    if (content != null) 'content': content,
    if (toolCalls != null && toolCalls!.isNotEmpty)
      'tool_calls': toolCalls!
          .map((final t) => t.toJson())
          .toList(growable: false),
    if (toolPlan != null) 'tool_plan': toolPlan,
  };
}

/// {@template cohere_tool_message}
/// A tool result message in a Cohere v2 chat conversation.
/// {@endtemplate}
@immutable
class CohereToolMessage extends CohereMessage {
  /// {@macro cohere_tool_message}
  const CohereToolMessage({required this.toolCallId, required this.content});

  /// The id of the tool call this message is a response to.
  final String toolCallId;

  /// The result of the tool call.
  final String content;

  @override
  Map<String, dynamic> toJson() => {
    'role': 'tool',
    'tool_call_id': toolCallId,
    'content': content,
  };
}

/// {@template cohere_tool}
/// A tool that the model may call, described using a JSON schema.
/// {@endtemplate}
@immutable
class CohereTool {
  /// {@macro cohere_tool}
  const CohereTool({
    required this.name,
    required this.description,
    required this.parameters,
  });

  /// The name of the tool.
  final String name;

  /// A description of what the tool does.
  final String description;

  /// The parameters the tool accepts, as a JSON schema object.
  final Map<String, dynamic> parameters;

  /// Converts the tool to a JSON-serializable map.
  Map<String, dynamic> toJson() => {
    'type': 'function',
    'function': {
      'name': name,
      'description': description,
      'parameters': parameters,
    },
  };
}

/// {@template cohere_tool_call}
/// A tool call requested by the model.
/// {@endtemplate}
@immutable
class CohereToolCall {
  /// {@macro cohere_tool_call}
  const CohereToolCall({required this.id, required this.function});

  /// Creates a [CohereToolCall] from a JSON map.
  factory CohereToolCall.fromJson(final Map<String, dynamic> json) {
    final function = json['function'] as Map<String, dynamic>? ?? const {};
    return CohereToolCall(
      id: json['id'] as String? ?? '',
      function: CohereFunctionCall(
        name: function['name'] as String? ?? '',
        arguments: function['arguments'] as String? ?? '',
      ),
    );
  }

  /// The id of the tool call.
  final String id;

  /// The function the model wants to call.
  final CohereFunctionCall function;

  /// Converts the tool call to a JSON-serializable map.
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': 'function',
    'function': {'name': function.name, 'arguments': function.arguments},
  };
}

/// {@template cohere_function_call}
/// The function the model wants to call, with its arguments encoded as a
/// JSON string.
/// {@endtemplate}
@immutable
class CohereFunctionCall {
  /// {@macro cohere_function_call}
  const CohereFunctionCall({required this.name, required this.arguments});

  /// The name of the function.
  final String name;

  /// The arguments of the function, encoded as a JSON string.
  final String arguments;
}

/// {@template cohere_usage}
/// Token usage information returned by the Cohere API.
/// {@endtemplate}
@immutable
class CohereUsage {
  /// {@macro cohere_usage}
  const CohereUsage({this.inputTokens, this.outputTokens});

  /// Creates a [CohereUsage] from a JSON map.
  ///
  /// Prefers the `tokens` object (actual tokens processed) and falls back to
  /// `billed_units` when not present.
  factory CohereUsage.fromJson(final Map<String, dynamic> json) {
    final tokens =
        json['tokens'] as Map<String, dynamic>? ??
        json['billed_units'] as Map<String, dynamic>? ??
        const {};
    return CohereUsage(
      inputTokens: (tokens['input_tokens'] as num?)?.toInt(),
      outputTokens: (tokens['output_tokens'] as num?)?.toInt(),
    );
  }

  /// The number of tokens in the prompt.
  final int? inputTokens;

  /// The number of tokens in the generated completion.
  final int? outputTokens;
}

/// {@template cohere_chat_response}
/// Response from the Cohere v2 Chat API (`POST /v2/chat`).
/// {@endtemplate}
@immutable
class CohereChatResponse {
  /// {@macro cohere_chat_response}
  const CohereChatResponse({
    required this.id,
    this.finishReason,
    this.text,
    this.toolPlan,
    this.toolCalls = const [],
    this.usage,
  });

  /// Creates a [CohereChatResponse] from a JSON map.
  factory CohereChatResponse.fromJson(final Map<String, dynamic> json) {
    final message = json['message'] as Map<String, dynamic>? ?? const {};
    final content = message['content'] as List<dynamic>? ?? const [];
    final text = content
        .whereType<Map<String, dynamic>>()
        .where((final block) => block['type'] == 'text')
        .map((final block) => block['text'] as String? ?? '')
        .join();
    final toolCalls = (message['tool_calls'] as List<dynamic>? ?? const [])
        .whereType<Map<String, dynamic>>()
        .map(CohereToolCall.fromJson)
        .toList(growable: false);
    final usage = json['usage'] as Map<String, dynamic>?;
    return CohereChatResponse(
      id: json['id'] as String? ?? '',
      finishReason: json['finish_reason'] as String?,
      text: text.isNotEmpty ? text : null,
      toolPlan: message['tool_plan'] as String?,
      toolCalls: toolCalls,
      usage: usage != null ? CohereUsage.fromJson(usage) : null,
    );
  }

  /// The id of the response.
  final String id;

  /// The reason the model stopped generating tokens
  /// (`COMPLETE`, `STOP_SEQUENCE`, `MAX_TOKENS`, `TOOL_CALL` or `ERROR`).
  final String? finishReason;

  /// The generated text (concatenation of all text content blocks).
  final String? text;

  /// The plan the model generated before calling tools.
  final String? toolPlan;

  /// The tool calls requested by the model.
  final List<CohereToolCall> toolCalls;

  /// Token usage information.
  final CohereUsage? usage;
}

/// {@template cohere_chat_stream_event}
/// An event of the Cohere v2 Chat streaming API
/// (`POST /v2/chat` with `stream: true`).
///
/// The relevant event types are:
/// - `message-start`: carries the message [id].
/// - `content-delta`: carries a [textDelta].
/// - `tool-plan-delta`: carries a [toolPlanDelta].
/// - `tool-call-start`: carries the [toolCallId], [toolCallName] and initial
///   [toolCallArgumentsDelta].
/// - `tool-call-delta`: carries a [toolCallArgumentsDelta].
/// - `message-end`: carries the [finishReason] and [usage].
///
/// Other event types (`content-start`, `content-end`, `tool-call-end`,
/// `citation-*`, ...) are parsed but carry no payload relevant to this
/// integration.
/// {@endtemplate}
@immutable
class CohereChatStreamEvent {
  /// {@macro cohere_chat_stream_event}
  const CohereChatStreamEvent({
    required this.type,
    this.id,
    this.index,
    this.textDelta,
    this.toolPlanDelta,
    this.toolCallId,
    this.toolCallName,
    this.toolCallArgumentsDelta,
    this.finishReason,
    this.usage,
  });

  /// Creates a [CohereChatStreamEvent] from a JSON map.
  factory CohereChatStreamEvent.fromJson(final Map<String, dynamic> json) {
    final delta = json['delta'] as Map<String, dynamic>? ?? const {};
    final message = delta['message'] as Map<String, dynamic>? ?? const {};
    // In `message-start` events `content` and `tool_calls` are (empty) lists,
    // while in delta events they are maps.
    final rawContent = message['content'];
    final content = rawContent is Map<String, dynamic>
        ? rawContent
        : const <String, dynamic>{};
    final rawToolCalls = message['tool_calls'];
    final toolCalls = rawToolCalls is Map<String, dynamic>
        ? rawToolCalls
        : const <String, dynamic>{};
    final function = toolCalls['function'] as Map<String, dynamic>? ?? const {};
    final usage = delta['usage'] as Map<String, dynamic>?;
    return CohereChatStreamEvent(
      type: json['type'] as String? ?? '',
      id: json['id'] as String?,
      index: json['index'] as int?,
      textDelta: content['text'] as String?,
      toolPlanDelta: message['tool_plan'] as String?,
      toolCallId: toolCalls['id'] as String?,
      toolCallName: function['name'] as String?,
      toolCallArgumentsDelta: function['arguments'] as String?,
      finishReason: delta['finish_reason'] as String?,
      usage: usage != null ? CohereUsage.fromJson(usage) : null,
    );
  }

  /// The type of the event (e.g. `content-delta`).
  final String type;

  /// The id of the message (only present in `message-start` events).
  final String? id;

  /// The index of the content block or tool call this event belongs to.
  ///
  /// Cohere's streaming protocol emits this on `content-*` and `tool-call-*`
  /// events. It is used as the merge identity when concatenating streamed
  /// chunks into ordered content blocks (deltas share the index of the block
  /// they extend).
  final int? index;

  /// The text delta (only present in `content-delta` events).
  final String? textDelta;

  /// The tool plan delta (only present in `tool-plan-delta` events).
  final String? toolPlanDelta;

  /// The id of the tool call (only present in `tool-call-start` events).
  final String? toolCallId;

  /// The name of the called tool (only present in `tool-call-start` events).
  final String? toolCallName;

  /// The delta of the JSON-encoded tool call arguments
  /// (present in `tool-call-start` and `tool-call-delta` events).
  final String? toolCallArgumentsDelta;

  /// The reason the model stopped generating tokens
  /// (only present in `message-end` events).
  final String? finishReason;

  /// Token usage information (only present in `message-end` events).
  final CohereUsage? usage;
}

/// The type of input passed to the Cohere v2 Embed API, used by the model to
/// optimize the embeddings for their intended use case.
enum CohereEmbeddingInputType {
  /// Used to generate embeddings for documents stored in a vector database.
  searchDocument('search_document'),

  /// Used to generate embeddings for queries run against a vector database.
  searchQuery('search_query'),

  /// Used for embeddings passed through a text classifier.
  classification('classification'),

  /// Used for embeddings run through a clustering algorithm.
  clustering('clustering');

  const CohereEmbeddingInputType(this.value);

  /// The value sent to the API.
  final String value;
}

/// {@template cohere_embed_request}
/// Request for the Cohere v2 Embed API (`POST /v2/embed`).
/// {@endtemplate}
@immutable
class CohereEmbedRequest {
  /// {@macro cohere_embed_request}
  const CohereEmbedRequest({
    required this.model,
    required this.texts,
    required this.inputType,
    this.outputDimension,
    this.truncate,
  });

  /// The name of the model to use (e.g. `embed-v4.0`).
  final String model;

  /// The texts to embed.
  final List<String> texts;

  /// The type of input, used by the model to optimize the embeddings.
  final CohereEmbeddingInputType inputType;

  /// The number of dimensions of the output embedding
  /// (only supported by certain models, e.g. `embed-v4.0`).
  final int? outputDimension;

  /// How to handle inputs longer than the maximum token length
  /// (`NONE`, `START` or `END`).
  final String? truncate;

  /// Converts the request to a JSON-serializable map.
  Map<String, dynamic> toJson() => {
    'model': model,
    'texts': texts,
    'input_type': inputType.value,
    'embedding_types': const ['float'],
    if (outputDimension != null) 'output_dimension': outputDimension,
    if (truncate != null) 'truncate': truncate,
  };
}

/// {@template cohere_embed_response}
/// Response from the Cohere v2 Embed API (`POST /v2/embed`).
/// {@endtemplate}
@immutable
class CohereEmbedResponse {
  /// {@macro cohere_embed_response}
  const CohereEmbedResponse({required this.id, required this.embeddings});

  /// Creates a [CohereEmbedResponse] from a JSON map.
  factory CohereEmbedResponse.fromJson(final Map<String, dynamic> json) {
    final embeddings = json['embeddings'] as Map<String, dynamic>? ?? const {};
    final floats = embeddings['float'] as List<dynamic>? ?? const [];
    return CohereEmbedResponse(
      id: json['id'] as String? ?? '',
      embeddings: floats
          .whereType<List<dynamic>>()
          .map(
            (final e) => e
                .map((final v) => (v as num).toDouble())
                .toList(growable: false),
          )
          .toList(growable: false),
    );
  }

  /// The id of the response.
  final String id;

  /// The generated embeddings (one per input text, in the same order).
  final List<List<double>> embeddings;
}
