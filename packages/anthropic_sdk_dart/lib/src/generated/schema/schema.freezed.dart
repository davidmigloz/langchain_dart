// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateMessageRequest _$CreateMessageRequestFromJson(Map<String, dynamic> json) {
  return _CreateMessageRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateMessageRequest {
  /// The model that will complete your prompt.
  ///
  /// See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
  /// details and options.
  @_ModelConverter()
  Model get model => throw _privateConstructorUsedError;

  /// Input messages.
  ///
  /// Our models are trained to operate on alternating `user` and `assistant`
  /// conversational turns. When creating a new `Message`, you specify the prior
  /// conversational turns with the `messages` parameter, and the model then generates
  /// the next `Message` in the conversation.
  ///
  /// Each input message must be an object with a `role` and `content`. You can
  /// specify a single `user`-role message, or you can include multiple `user` and
  /// `assistant` messages. The first message must always use the `user` role.
  ///
  /// If the final message uses the `assistant` role, the response content will
  /// continue immediately from the content in that message. This can be used to
  /// constrain part of the model's response.
  ///
  /// See [message content](https://docs.anthropic.com/en/api/messages-content) for
  /// details on how to construct valid message objects.
  ///
  /// Example with a single `user` message:
  ///
  /// ```json
  /// [{ "role": "user", "content": "Hello, Claude" }]
  /// ```
  ///
  /// Example with multiple conversational turns:
  ///
  /// ```json
  /// [
  ///   { "role": "user", "content": "Hello there." },
  ///   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
  ///   { "role": "user", "content": "Can you explain LLMs in plain English?" }
  /// ]
  /// ```
  ///
  /// Example with a partially-filled response from Claude:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Each input message `content` may be either a single `string` or an array of
  /// content blocks, where each block has a specific `type`. Using a `string` for
  /// `content` is shorthand for an array of one content block of type `"text"`. The
  /// following input messages are equivalent:
  ///
  /// ```json
  /// { "role": "user", "content": "Hello, Claude" }
  /// ```
  ///
  /// ```json
  /// { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
  /// ```
  ///
  /// Starting with Claude 3 models, you can also send image content blocks:
  ///
  /// ```json
  /// {
  ///   "role": "user",
  ///   "content": [
  ///     {
  ///       "type": "image",
  ///       "source": {
  ///         "type": "base64",
  ///         "media_type": "image/jpeg",
  ///         "data": "/9j/4AAQSkZJRg..."
  ///       }
  ///     },
  ///     { "type": "text", "text": "What is in this image?" }
  ///   ]
  /// }
  /// ```
  ///
  /// We currently support the `base64` source type for images, and the `image/jpeg`,
  /// `image/png`, `image/gif`, and `image/webp` media types.
  ///
  /// See [examples](https://docs.anthropic.com/en/api/messages-examples) for more
  /// input examples.
  ///
  /// Note that if you want to include a
  /// [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
  /// the top-level `system` parameter — there is no `"system"` role for input
  /// messages in the Messages API.
  List<Message> get messages => throw _privateConstructorUsedError;

  /// The maximum number of tokens to generate before stopping.
  ///
  /// Note that our models may stop _before_ reaching this maximum. This parameter
  /// only specifies the absolute maximum number of tokens to generate.
  ///
  /// Different models have different maximum values for this parameter. See
  /// [models](https://docs.anthropic.com/en/docs/models-overview) for details.
  @JsonKey(name: 'max_tokens')
  int get maxTokens => throw _privateConstructorUsedError;

  /// An object describing metadata about the request.
  @JsonKey(includeIfNull: false)
  CreateMessageRequestMetadata? get metadata =>
      throw _privateConstructorUsedError;

  /// Custom text sequences that will cause the model to stop generating.
  ///
  /// Our models will normally stop when they have naturally completed their turn,
  /// which will result in a response `stop_reason` of `"end_turn"`.
  ///
  /// If you want the model to stop generating when it encounters custom strings of
  /// text, you can use the `stop_sequences` parameter. If the model encounters one of
  /// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
  /// and the response `stop_sequence` value will contain the matched stop sequence.
  @JsonKey(name: 'stop_sequences', includeIfNull: false)
  List<String>? get stopSequences => throw _privateConstructorUsedError;

  /// System prompt.
  ///
  /// A system prompt is a way of providing context and instructions to Claude, such
  /// as specifying a particular goal or role. See our
  /// [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
  @JsonKey(includeIfNull: false)
  String? get system => throw _privateConstructorUsedError;

  /// Amount of randomness injected into the response.
  ///
  /// Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
  /// for analytical / multiple choice, and closer to `1.0` for creative and
  /// generative tasks.
  ///
  /// Note that even with `temperature` of `0.0`, the results will not be fully
  /// deterministic.
  @JsonKey(includeIfNull: false)
  double? get temperature => throw _privateConstructorUsedError;

  /// How the model should use the provided tools. The model can use a specific tool,
  /// any available tool, or decide by itself.
  ///
  /// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
  /// - `any`: tells Claude that it must use one of the provided tools, but doesn’t force a particular tool.
  /// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
  @JsonKey(name: 'tool_choice', includeIfNull: false)
  ToolChoice? get toolChoice => throw _privateConstructorUsedError;

  /// Definitions of tools that the model may use.
  ///
  /// If you include `tools` in your API request, the model may return `tool_use`
  /// content blocks that represent the model's use of those tools. You can then run
  /// those tools using the tool input generated by the model and then optionally
  /// return results back to the model using `tool_result` content blocks.
  ///
  /// Each tool definition includes:
  ///
  /// - `name`: Name of the tool.
  /// - `description`: Optional, but strongly-recommended description of the tool.
  /// - `input_schema`: [JSON schema](https://json-schema.org/) for the tool `input`
  ///   shape that the model will produce in `tool_use` output content blocks.
  ///
  /// For example, if you defined `tools` as:
  ///
  /// ```json
  /// [
  ///   {
  ///     "name": "get_stock_price",
  ///     "description": "Get the current stock price for a given ticker symbol.",
  ///     "input_schema": {
  ///       "type": "object",
  ///       "properties": {
  ///         "ticker": {
  ///           "type": "string",
  ///           "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
  ///         }
  ///       },
  ///       "required": ["ticker"]
  ///     }
  ///   }
  /// ]
  /// ```
  ///
  /// And then asked the model "What's the S&P 500 at today?", the model might produce
  /// `tool_use` content blocks in the response like this:
  ///
  /// ```json
  /// [
  ///   {
  ///     "type": "tool_use",
  ///     "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
  ///     "name": "get_stock_price",
  ///     "input": { "ticker": "^GSPC" }
  ///   }
  /// ]
  /// ```
  ///
  /// You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
  /// input, and return the following back to the model in a subsequent `user`
  /// message:
  ///
  /// ```json
  /// [
  ///   {
  ///     "type": "tool_result",
  ///     "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
  ///     "content": "259.75 USD"
  ///   }
  /// ]
  /// ```
  ///
  /// Tools can be used for workflows that include running client-side tools and
  /// functions, or more generally whenever you want the model to produce a particular
  /// JSON structure of output.
  ///
  /// See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
  @JsonKey(includeIfNull: false)
  List<Tool>? get tools => throw _privateConstructorUsedError;

  /// Only sample from the top K options for each subsequent token.
  ///
  /// Used to remove "long tail" low probability responses.
  /// [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @JsonKey(name: 'top_k', includeIfNull: false)
  int? get topK => throw _privateConstructorUsedError;

  /// Use nucleus sampling.
  ///
  /// In nucleus sampling, we compute the cumulative distribution over all the options
  /// for each subsequent token in decreasing probability order and cut it off once it
  /// reaches a particular probability specified by `top_p`. You should either alter
  /// `temperature` or `top_p`, but not both.
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @JsonKey(name: 'top_p', includeIfNull: false)
  double? get topP => throw _privateConstructorUsedError;

  /// Whether to incrementally stream the response using server-sent events.
  ///
  /// See [streaming](https://docs.anthropic.com/en/api/messages-streaming) for
  /// details.
  bool get stream => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateMessageRequestCopyWith<CreateMessageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateMessageRequestCopyWith<$Res> {
  factory $CreateMessageRequestCopyWith(CreateMessageRequest value,
          $Res Function(CreateMessageRequest) then) =
      _$CreateMessageRequestCopyWithImpl<$Res, CreateMessageRequest>;
  @useResult
  $Res call(
      {@_ModelConverter() Model model,
      List<Message> messages,
      @JsonKey(name: 'max_tokens') int maxTokens,
      @JsonKey(includeIfNull: false) CreateMessageRequestMetadata? metadata,
      @JsonKey(name: 'stop_sequences', includeIfNull: false)
      List<String>? stopSequences,
      @JsonKey(includeIfNull: false) String? system,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(name: 'tool_choice', includeIfNull: false)
      ToolChoice? toolChoice,
      @JsonKey(includeIfNull: false) List<Tool>? tools,
      @JsonKey(name: 'top_k', includeIfNull: false) int? topK,
      @JsonKey(name: 'top_p', includeIfNull: false) double? topP,
      bool stream});

  $ModelCopyWith<$Res> get model;
  $CreateMessageRequestMetadataCopyWith<$Res>? get metadata;
  $ToolChoiceCopyWith<$Res>? get toolChoice;
}

/// @nodoc
class _$CreateMessageRequestCopyWithImpl<$Res,
        $Val extends CreateMessageRequest>
    implements $CreateMessageRequestCopyWith<$Res> {
  _$CreateMessageRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? maxTokens = null,
    Object? metadata = freezed,
    Object? stopSequences = freezed,
    Object? system = freezed,
    Object? temperature = freezed,
    Object? toolChoice = freezed,
    Object? tools = freezed,
    Object? topK = freezed,
    Object? topP = freezed,
    Object? stream = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as Model,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      maxTokens: null == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as CreateMessageRequestMetadata?,
      stopSequences: freezed == stopSequences
          ? _value.stopSequences
          : stopSequences // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      toolChoice: freezed == toolChoice
          ? _value.toolChoice
          : toolChoice // ignore: cast_nullable_to_non_nullable
              as ToolChoice?,
      tools: freezed == tools
          ? _value.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<Tool>?,
      topK: freezed == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ModelCopyWith<$Res> get model {
    return $ModelCopyWith<$Res>(_value.model, (value) {
      return _then(_value.copyWith(model: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreateMessageRequestMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $CreateMessageRequestMetadataCopyWith<$Res>(_value.metadata!,
        (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ToolChoiceCopyWith<$Res>? get toolChoice {
    if (_value.toolChoice == null) {
      return null;
    }

    return $ToolChoiceCopyWith<$Res>(_value.toolChoice!, (value) {
      return _then(_value.copyWith(toolChoice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateMessageRequestImplCopyWith<$Res>
    implements $CreateMessageRequestCopyWith<$Res> {
  factory _$$CreateMessageRequestImplCopyWith(_$CreateMessageRequestImpl value,
          $Res Function(_$CreateMessageRequestImpl) then) =
      __$$CreateMessageRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@_ModelConverter() Model model,
      List<Message> messages,
      @JsonKey(name: 'max_tokens') int maxTokens,
      @JsonKey(includeIfNull: false) CreateMessageRequestMetadata? metadata,
      @JsonKey(name: 'stop_sequences', includeIfNull: false)
      List<String>? stopSequences,
      @JsonKey(includeIfNull: false) String? system,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(name: 'tool_choice', includeIfNull: false)
      ToolChoice? toolChoice,
      @JsonKey(includeIfNull: false) List<Tool>? tools,
      @JsonKey(name: 'top_k', includeIfNull: false) int? topK,
      @JsonKey(name: 'top_p', includeIfNull: false) double? topP,
      bool stream});

  @override
  $ModelCopyWith<$Res> get model;
  @override
  $CreateMessageRequestMetadataCopyWith<$Res>? get metadata;
  @override
  $ToolChoiceCopyWith<$Res>? get toolChoice;
}

/// @nodoc
class __$$CreateMessageRequestImplCopyWithImpl<$Res>
    extends _$CreateMessageRequestCopyWithImpl<$Res, _$CreateMessageRequestImpl>
    implements _$$CreateMessageRequestImplCopyWith<$Res> {
  __$$CreateMessageRequestImplCopyWithImpl(_$CreateMessageRequestImpl _value,
      $Res Function(_$CreateMessageRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? maxTokens = null,
    Object? metadata = freezed,
    Object? stopSequences = freezed,
    Object? system = freezed,
    Object? temperature = freezed,
    Object? toolChoice = freezed,
    Object? tools = freezed,
    Object? topK = freezed,
    Object? topP = freezed,
    Object? stream = null,
  }) {
    return _then(_$CreateMessageRequestImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as Model,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      maxTokens: null == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as CreateMessageRequestMetadata?,
      stopSequences: freezed == stopSequences
          ? _value._stopSequences
          : stopSequences // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      toolChoice: freezed == toolChoice
          ? _value.toolChoice
          : toolChoice // ignore: cast_nullable_to_non_nullable
              as ToolChoice?,
      tools: freezed == tools
          ? _value._tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<Tool>?,
      topK: freezed == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateMessageRequestImpl extends _CreateMessageRequest {
  const _$CreateMessageRequestImpl(
      {@_ModelConverter() required this.model,
      required final List<Message> messages,
      @JsonKey(name: 'max_tokens') required this.maxTokens,
      @JsonKey(includeIfNull: false) this.metadata,
      @JsonKey(name: 'stop_sequences', includeIfNull: false)
      final List<String>? stopSequences,
      @JsonKey(includeIfNull: false) this.system,
      @JsonKey(includeIfNull: false) this.temperature,
      @JsonKey(name: 'tool_choice', includeIfNull: false) this.toolChoice,
      @JsonKey(includeIfNull: false) final List<Tool>? tools,
      @JsonKey(name: 'top_k', includeIfNull: false) this.topK,
      @JsonKey(name: 'top_p', includeIfNull: false) this.topP,
      this.stream = false})
      : _messages = messages,
        _stopSequences = stopSequences,
        _tools = tools,
        super._();

  factory _$CreateMessageRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateMessageRequestImplFromJson(json);

  /// The model that will complete your prompt.
  ///
  /// See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
  /// details and options.
  @override
  @_ModelConverter()
  final Model model;

  /// Input messages.
  ///
  /// Our models are trained to operate on alternating `user` and `assistant`
  /// conversational turns. When creating a new `Message`, you specify the prior
  /// conversational turns with the `messages` parameter, and the model then generates
  /// the next `Message` in the conversation.
  ///
  /// Each input message must be an object with a `role` and `content`. You can
  /// specify a single `user`-role message, or you can include multiple `user` and
  /// `assistant` messages. The first message must always use the `user` role.
  ///
  /// If the final message uses the `assistant` role, the response content will
  /// continue immediately from the content in that message. This can be used to
  /// constrain part of the model's response.
  ///
  /// See [message content](https://docs.anthropic.com/en/api/messages-content) for
  /// details on how to construct valid message objects.
  ///
  /// Example with a single `user` message:
  ///
  /// ```json
  /// [{ "role": "user", "content": "Hello, Claude" }]
  /// ```
  ///
  /// Example with multiple conversational turns:
  ///
  /// ```json
  /// [
  ///   { "role": "user", "content": "Hello there." },
  ///   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
  ///   { "role": "user", "content": "Can you explain LLMs in plain English?" }
  /// ]
  /// ```
  ///
  /// Example with a partially-filled response from Claude:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Each input message `content` may be either a single `string` or an array of
  /// content blocks, where each block has a specific `type`. Using a `string` for
  /// `content` is shorthand for an array of one content block of type `"text"`. The
  /// following input messages are equivalent:
  ///
  /// ```json
  /// { "role": "user", "content": "Hello, Claude" }
  /// ```
  ///
  /// ```json
  /// { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
  /// ```
  ///
  /// Starting with Claude 3 models, you can also send image content blocks:
  ///
  /// ```json
  /// {
  ///   "role": "user",
  ///   "content": [
  ///     {
  ///       "type": "image",
  ///       "source": {
  ///         "type": "base64",
  ///         "media_type": "image/jpeg",
  ///         "data": "/9j/4AAQSkZJRg..."
  ///       }
  ///     },
  ///     { "type": "text", "text": "What is in this image?" }
  ///   ]
  /// }
  /// ```
  ///
  /// We currently support the `base64` source type for images, and the `image/jpeg`,
  /// `image/png`, `image/gif`, and `image/webp` media types.
  ///
  /// See [examples](https://docs.anthropic.com/en/api/messages-examples) for more
  /// input examples.
  ///
  /// Note that if you want to include a
  /// [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
  /// the top-level `system` parameter — there is no `"system"` role for input
  /// messages in the Messages API.
  final List<Message> _messages;

  /// Input messages.
  ///
  /// Our models are trained to operate on alternating `user` and `assistant`
  /// conversational turns. When creating a new `Message`, you specify the prior
  /// conversational turns with the `messages` parameter, and the model then generates
  /// the next `Message` in the conversation.
  ///
  /// Each input message must be an object with a `role` and `content`. You can
  /// specify a single `user`-role message, or you can include multiple `user` and
  /// `assistant` messages. The first message must always use the `user` role.
  ///
  /// If the final message uses the `assistant` role, the response content will
  /// continue immediately from the content in that message. This can be used to
  /// constrain part of the model's response.
  ///
  /// See [message content](https://docs.anthropic.com/en/api/messages-content) for
  /// details on how to construct valid message objects.
  ///
  /// Example with a single `user` message:
  ///
  /// ```json
  /// [{ "role": "user", "content": "Hello, Claude" }]
  /// ```
  ///
  /// Example with multiple conversational turns:
  ///
  /// ```json
  /// [
  ///   { "role": "user", "content": "Hello there." },
  ///   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
  ///   { "role": "user", "content": "Can you explain LLMs in plain English?" }
  /// ]
  /// ```
  ///
  /// Example with a partially-filled response from Claude:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Each input message `content` may be either a single `string` or an array of
  /// content blocks, where each block has a specific `type`. Using a `string` for
  /// `content` is shorthand for an array of one content block of type `"text"`. The
  /// following input messages are equivalent:
  ///
  /// ```json
  /// { "role": "user", "content": "Hello, Claude" }
  /// ```
  ///
  /// ```json
  /// { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
  /// ```
  ///
  /// Starting with Claude 3 models, you can also send image content blocks:
  ///
  /// ```json
  /// {
  ///   "role": "user",
  ///   "content": [
  ///     {
  ///       "type": "image",
  ///       "source": {
  ///         "type": "base64",
  ///         "media_type": "image/jpeg",
  ///         "data": "/9j/4AAQSkZJRg..."
  ///       }
  ///     },
  ///     { "type": "text", "text": "What is in this image?" }
  ///   ]
  /// }
  /// ```
  ///
  /// We currently support the `base64` source type for images, and the `image/jpeg`,
  /// `image/png`, `image/gif`, and `image/webp` media types.
  ///
  /// See [examples](https://docs.anthropic.com/en/api/messages-examples) for more
  /// input examples.
  ///
  /// Note that if you want to include a
  /// [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
  /// the top-level `system` parameter — there is no `"system"` role for input
  /// messages in the Messages API.
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  /// The maximum number of tokens to generate before stopping.
  ///
  /// Note that our models may stop _before_ reaching this maximum. This parameter
  /// only specifies the absolute maximum number of tokens to generate.
  ///
  /// Different models have different maximum values for this parameter. See
  /// [models](https://docs.anthropic.com/en/docs/models-overview) for details.
  @override
  @JsonKey(name: 'max_tokens')
  final int maxTokens;

  /// An object describing metadata about the request.
  @override
  @JsonKey(includeIfNull: false)
  final CreateMessageRequestMetadata? metadata;

  /// Custom text sequences that will cause the model to stop generating.
  ///
  /// Our models will normally stop when they have naturally completed their turn,
  /// which will result in a response `stop_reason` of `"end_turn"`.
  ///
  /// If you want the model to stop generating when it encounters custom strings of
  /// text, you can use the `stop_sequences` parameter. If the model encounters one of
  /// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
  /// and the response `stop_sequence` value will contain the matched stop sequence.
  final List<String>? _stopSequences;

  /// Custom text sequences that will cause the model to stop generating.
  ///
  /// Our models will normally stop when they have naturally completed their turn,
  /// which will result in a response `stop_reason` of `"end_turn"`.
  ///
  /// If you want the model to stop generating when it encounters custom strings of
  /// text, you can use the `stop_sequences` parameter. If the model encounters one of
  /// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
  /// and the response `stop_sequence` value will contain the matched stop sequence.
  @override
  @JsonKey(name: 'stop_sequences', includeIfNull: false)
  List<String>? get stopSequences {
    final value = _stopSequences;
    if (value == null) return null;
    if (_stopSequences is EqualUnmodifiableListView) return _stopSequences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// System prompt.
  ///
  /// A system prompt is a way of providing context and instructions to Claude, such
  /// as specifying a particular goal or role. See our
  /// [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
  @override
  @JsonKey(includeIfNull: false)
  final String? system;

  /// Amount of randomness injected into the response.
  ///
  /// Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
  /// for analytical / multiple choice, and closer to `1.0` for creative and
  /// generative tasks.
  ///
  /// Note that even with `temperature` of `0.0`, the results will not be fully
  /// deterministic.
  @override
  @JsonKey(includeIfNull: false)
  final double? temperature;

  /// How the model should use the provided tools. The model can use a specific tool,
  /// any available tool, or decide by itself.
  ///
  /// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
  /// - `any`: tells Claude that it must use one of the provided tools, but doesn’t force a particular tool.
  /// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
  @override
  @JsonKey(name: 'tool_choice', includeIfNull: false)
  final ToolChoice? toolChoice;

  /// Definitions of tools that the model may use.
  ///
  /// If you include `tools` in your API request, the model may return `tool_use`
  /// content blocks that represent the model's use of those tools. You can then run
  /// those tools using the tool input generated by the model and then optionally
  /// return results back to the model using `tool_result` content blocks.
  ///
  /// Each tool definition includes:
  ///
  /// - `name`: Name of the tool.
  /// - `description`: Optional, but strongly-recommended description of the tool.
  /// - `input_schema`: [JSON schema](https://json-schema.org/) for the tool `input`
  ///   shape that the model will produce in `tool_use` output content blocks.
  ///
  /// For example, if you defined `tools` as:
  ///
  /// ```json
  /// [
  ///   {
  ///     "name": "get_stock_price",
  ///     "description": "Get the current stock price for a given ticker symbol.",
  ///     "input_schema": {
  ///       "type": "object",
  ///       "properties": {
  ///         "ticker": {
  ///           "type": "string",
  ///           "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
  ///         }
  ///       },
  ///       "required": ["ticker"]
  ///     }
  ///   }
  /// ]
  /// ```
  ///
  /// And then asked the model "What's the S&P 500 at today?", the model might produce
  /// `tool_use` content blocks in the response like this:
  ///
  /// ```json
  /// [
  ///   {
  ///     "type": "tool_use",
  ///     "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
  ///     "name": "get_stock_price",
  ///     "input": { "ticker": "^GSPC" }
  ///   }
  /// ]
  /// ```
  ///
  /// You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
  /// input, and return the following back to the model in a subsequent `user`
  /// message:
  ///
  /// ```json
  /// [
  ///   {
  ///     "type": "tool_result",
  ///     "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
  ///     "content": "259.75 USD"
  ///   }
  /// ]
  /// ```
  ///
  /// Tools can be used for workflows that include running client-side tools and
  /// functions, or more generally whenever you want the model to produce a particular
  /// JSON structure of output.
  ///
  /// See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
  final List<Tool>? _tools;

  /// Definitions of tools that the model may use.
  ///
  /// If you include `tools` in your API request, the model may return `tool_use`
  /// content blocks that represent the model's use of those tools. You can then run
  /// those tools using the tool input generated by the model and then optionally
  /// return results back to the model using `tool_result` content blocks.
  ///
  /// Each tool definition includes:
  ///
  /// - `name`: Name of the tool.
  /// - `description`: Optional, but strongly-recommended description of the tool.
  /// - `input_schema`: [JSON schema](https://json-schema.org/) for the tool `input`
  ///   shape that the model will produce in `tool_use` output content blocks.
  ///
  /// For example, if you defined `tools` as:
  ///
  /// ```json
  /// [
  ///   {
  ///     "name": "get_stock_price",
  ///     "description": "Get the current stock price for a given ticker symbol.",
  ///     "input_schema": {
  ///       "type": "object",
  ///       "properties": {
  ///         "ticker": {
  ///           "type": "string",
  ///           "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
  ///         }
  ///       },
  ///       "required": ["ticker"]
  ///     }
  ///   }
  /// ]
  /// ```
  ///
  /// And then asked the model "What's the S&P 500 at today?", the model might produce
  /// `tool_use` content blocks in the response like this:
  ///
  /// ```json
  /// [
  ///   {
  ///     "type": "tool_use",
  ///     "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
  ///     "name": "get_stock_price",
  ///     "input": { "ticker": "^GSPC" }
  ///   }
  /// ]
  /// ```
  ///
  /// You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
  /// input, and return the following back to the model in a subsequent `user`
  /// message:
  ///
  /// ```json
  /// [
  ///   {
  ///     "type": "tool_result",
  ///     "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
  ///     "content": "259.75 USD"
  ///   }
  /// ]
  /// ```
  ///
  /// Tools can be used for workflows that include running client-side tools and
  /// functions, or more generally whenever you want the model to produce a particular
  /// JSON structure of output.
  ///
  /// See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
  @override
  @JsonKey(includeIfNull: false)
  List<Tool>? get tools {
    final value = _tools;
    if (value == null) return null;
    if (_tools is EqualUnmodifiableListView) return _tools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Only sample from the top K options for each subsequent token.
  ///
  /// Used to remove "long tail" low probability responses.
  /// [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @override
  @JsonKey(name: 'top_k', includeIfNull: false)
  final int? topK;

  /// Use nucleus sampling.
  ///
  /// In nucleus sampling, we compute the cumulative distribution over all the options
  /// for each subsequent token in decreasing probability order and cut it off once it
  /// reaches a particular probability specified by `top_p`. You should either alter
  /// `temperature` or `top_p`, but not both.
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @override
  @JsonKey(name: 'top_p', includeIfNull: false)
  final double? topP;

  /// Whether to incrementally stream the response using server-sent events.
  ///
  /// See [streaming](https://docs.anthropic.com/en/api/messages-streaming) for
  /// details.
  @override
  @JsonKey()
  final bool stream;

  @override
  String toString() {
    return 'CreateMessageRequest(model: $model, messages: $messages, maxTokens: $maxTokens, metadata: $metadata, stopSequences: $stopSequences, system: $system, temperature: $temperature, toolChoice: $toolChoice, tools: $tools, topK: $topK, topP: $topP, stream: $stream)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateMessageRequestImpl &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.maxTokens, maxTokens) ||
                other.maxTokens == maxTokens) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality()
                .equals(other._stopSequences, _stopSequences) &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.toolChoice, toolChoice) ||
                other.toolChoice == toolChoice) &&
            const DeepCollectionEquality().equals(other._tools, _tools) &&
            (identical(other.topK, topK) || other.topK == topK) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.stream, stream) || other.stream == stream));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      model,
      const DeepCollectionEquality().hash(_messages),
      maxTokens,
      metadata,
      const DeepCollectionEquality().hash(_stopSequences),
      system,
      temperature,
      toolChoice,
      const DeepCollectionEquality().hash(_tools),
      topK,
      topP,
      stream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateMessageRequestImplCopyWith<_$CreateMessageRequestImpl>
      get copyWith =>
          __$$CreateMessageRequestImplCopyWithImpl<_$CreateMessageRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateMessageRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateMessageRequest extends CreateMessageRequest {
  const factory _CreateMessageRequest(
      {@_ModelConverter() required final Model model,
      required final List<Message> messages,
      @JsonKey(name: 'max_tokens') required final int maxTokens,
      @JsonKey(includeIfNull: false)
      final CreateMessageRequestMetadata? metadata,
      @JsonKey(name: 'stop_sequences', includeIfNull: false)
      final List<String>? stopSequences,
      @JsonKey(includeIfNull: false) final String? system,
      @JsonKey(includeIfNull: false) final double? temperature,
      @JsonKey(name: 'tool_choice', includeIfNull: false)
      final ToolChoice? toolChoice,
      @JsonKey(includeIfNull: false) final List<Tool>? tools,
      @JsonKey(name: 'top_k', includeIfNull: false) final int? topK,
      @JsonKey(name: 'top_p', includeIfNull: false) final double? topP,
      final bool stream}) = _$CreateMessageRequestImpl;
  const _CreateMessageRequest._() : super._();

  factory _CreateMessageRequest.fromJson(Map<String, dynamic> json) =
      _$CreateMessageRequestImpl.fromJson;

  @override

  /// The model that will complete your prompt.
  ///
  /// See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
  /// details and options.
  @_ModelConverter()
  Model get model;
  @override

  /// Input messages.
  ///
  /// Our models are trained to operate on alternating `user` and `assistant`
  /// conversational turns. When creating a new `Message`, you specify the prior
  /// conversational turns with the `messages` parameter, and the model then generates
  /// the next `Message` in the conversation.
  ///
  /// Each input message must be an object with a `role` and `content`. You can
  /// specify a single `user`-role message, or you can include multiple `user` and
  /// `assistant` messages. The first message must always use the `user` role.
  ///
  /// If the final message uses the `assistant` role, the response content will
  /// continue immediately from the content in that message. This can be used to
  /// constrain part of the model's response.
  ///
  /// See [message content](https://docs.anthropic.com/en/api/messages-content) for
  /// details on how to construct valid message objects.
  ///
  /// Example with a single `user` message:
  ///
  /// ```json
  /// [{ "role": "user", "content": "Hello, Claude" }]
  /// ```
  ///
  /// Example with multiple conversational turns:
  ///
  /// ```json
  /// [
  ///   { "role": "user", "content": "Hello there." },
  ///   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
  ///   { "role": "user", "content": "Can you explain LLMs in plain English?" }
  /// ]
  /// ```
  ///
  /// Example with a partially-filled response from Claude:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Each input message `content` may be either a single `string` or an array of
  /// content blocks, where each block has a specific `type`. Using a `string` for
  /// `content` is shorthand for an array of one content block of type `"text"`. The
  /// following input messages are equivalent:
  ///
  /// ```json
  /// { "role": "user", "content": "Hello, Claude" }
  /// ```
  ///
  /// ```json
  /// { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
  /// ```
  ///
  /// Starting with Claude 3 models, you can also send image content blocks:
  ///
  /// ```json
  /// {
  ///   "role": "user",
  ///   "content": [
  ///     {
  ///       "type": "image",
  ///       "source": {
  ///         "type": "base64",
  ///         "media_type": "image/jpeg",
  ///         "data": "/9j/4AAQSkZJRg..."
  ///       }
  ///     },
  ///     { "type": "text", "text": "What is in this image?" }
  ///   ]
  /// }
  /// ```
  ///
  /// We currently support the `base64` source type for images, and the `image/jpeg`,
  /// `image/png`, `image/gif`, and `image/webp` media types.
  ///
  /// See [examples](https://docs.anthropic.com/en/api/messages-examples) for more
  /// input examples.
  ///
  /// Note that if you want to include a
  /// [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
  /// the top-level `system` parameter — there is no `"system"` role for input
  /// messages in the Messages API.
  List<Message> get messages;
  @override

  /// The maximum number of tokens to generate before stopping.
  ///
  /// Note that our models may stop _before_ reaching this maximum. This parameter
  /// only specifies the absolute maximum number of tokens to generate.
  ///
  /// Different models have different maximum values for this parameter. See
  /// [models](https://docs.anthropic.com/en/docs/models-overview) for details.
  @JsonKey(name: 'max_tokens')
  int get maxTokens;
  @override

  /// An object describing metadata about the request.
  @JsonKey(includeIfNull: false)
  CreateMessageRequestMetadata? get metadata;
  @override

  /// Custom text sequences that will cause the model to stop generating.
  ///
  /// Our models will normally stop when they have naturally completed their turn,
  /// which will result in a response `stop_reason` of `"end_turn"`.
  ///
  /// If you want the model to stop generating when it encounters custom strings of
  /// text, you can use the `stop_sequences` parameter. If the model encounters one of
  /// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
  /// and the response `stop_sequence` value will contain the matched stop sequence.
  @JsonKey(name: 'stop_sequences', includeIfNull: false)
  List<String>? get stopSequences;
  @override

  /// System prompt.
  ///
  /// A system prompt is a way of providing context and instructions to Claude, such
  /// as specifying a particular goal or role. See our
  /// [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
  @JsonKey(includeIfNull: false)
  String? get system;
  @override

  /// Amount of randomness injected into the response.
  ///
  /// Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
  /// for analytical / multiple choice, and closer to `1.0` for creative and
  /// generative tasks.
  ///
  /// Note that even with `temperature` of `0.0`, the results will not be fully
  /// deterministic.
  @JsonKey(includeIfNull: false)
  double? get temperature;
  @override

  /// How the model should use the provided tools. The model can use a specific tool,
  /// any available tool, or decide by itself.
  ///
  /// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
  /// - `any`: tells Claude that it must use one of the provided tools, but doesn’t force a particular tool.
  /// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
  @JsonKey(name: 'tool_choice', includeIfNull: false)
  ToolChoice? get toolChoice;
  @override

  /// Definitions of tools that the model may use.
  ///
  /// If you include `tools` in your API request, the model may return `tool_use`
  /// content blocks that represent the model's use of those tools. You can then run
  /// those tools using the tool input generated by the model and then optionally
  /// return results back to the model using `tool_result` content blocks.
  ///
  /// Each tool definition includes:
  ///
  /// - `name`: Name of the tool.
  /// - `description`: Optional, but strongly-recommended description of the tool.
  /// - `input_schema`: [JSON schema](https://json-schema.org/) for the tool `input`
  ///   shape that the model will produce in `tool_use` output content blocks.
  ///
  /// For example, if you defined `tools` as:
  ///
  /// ```json
  /// [
  ///   {
  ///     "name": "get_stock_price",
  ///     "description": "Get the current stock price for a given ticker symbol.",
  ///     "input_schema": {
  ///       "type": "object",
  ///       "properties": {
  ///         "ticker": {
  ///           "type": "string",
  ///           "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
  ///         }
  ///       },
  ///       "required": ["ticker"]
  ///     }
  ///   }
  /// ]
  /// ```
  ///
  /// And then asked the model "What's the S&P 500 at today?", the model might produce
  /// `tool_use` content blocks in the response like this:
  ///
  /// ```json
  /// [
  ///   {
  ///     "type": "tool_use",
  ///     "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
  ///     "name": "get_stock_price",
  ///     "input": { "ticker": "^GSPC" }
  ///   }
  /// ]
  /// ```
  ///
  /// You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
  /// input, and return the following back to the model in a subsequent `user`
  /// message:
  ///
  /// ```json
  /// [
  ///   {
  ///     "type": "tool_result",
  ///     "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
  ///     "content": "259.75 USD"
  ///   }
  /// ]
  /// ```
  ///
  /// Tools can be used for workflows that include running client-side tools and
  /// functions, or more generally whenever you want the model to produce a particular
  /// JSON structure of output.
  ///
  /// See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
  @JsonKey(includeIfNull: false)
  List<Tool>? get tools;
  @override

  /// Only sample from the top K options for each subsequent token.
  ///
  /// Used to remove "long tail" low probability responses.
  /// [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @JsonKey(name: 'top_k', includeIfNull: false)
  int? get topK;
  @override

  /// Use nucleus sampling.
  ///
  /// In nucleus sampling, we compute the cumulative distribution over all the options
  /// for each subsequent token in decreasing probability order and cut it off once it
  /// reaches a particular probability specified by `top_p`. You should either alter
  /// `temperature` or `top_p`, but not both.
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @JsonKey(name: 'top_p', includeIfNull: false)
  double? get topP;
  @override

  /// Whether to incrementally stream the response using server-sent events.
  ///
  /// See [streaming](https://docs.anthropic.com/en/api/messages-streaming) for
  /// details.
  bool get stream;
  @override
  @JsonKey(ignore: true)
  _$$CreateMessageRequestImplCopyWith<_$CreateMessageRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Model _$ModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'model':
      return ModelEnumeration.fromJson(json);
    case 'modelId':
      return ModelString.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Model',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Model {
  Object get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Models value) model,
    required TResult Function(String value) modelId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Models value)? model,
    TResult? Function(String value)? modelId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Models value)? model,
    TResult Function(String value)? modelId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ModelEnumeration value) model,
    required TResult Function(ModelString value) modelId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModelEnumeration value)? model,
    TResult? Function(ModelString value)? modelId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModelEnumeration value)? model,
    TResult Function(ModelString value)? modelId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelCopyWith<$Res> {
  factory $ModelCopyWith(Model value, $Res Function(Model) then) =
      _$ModelCopyWithImpl<$Res, Model>;
}

/// @nodoc
class _$ModelCopyWithImpl<$Res, $Val extends Model>
    implements $ModelCopyWith<$Res> {
  _$ModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ModelEnumerationImplCopyWith<$Res> {
  factory _$$ModelEnumerationImplCopyWith(_$ModelEnumerationImpl value,
          $Res Function(_$ModelEnumerationImpl) then) =
      __$$ModelEnumerationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Models value});
}

/// @nodoc
class __$$ModelEnumerationImplCopyWithImpl<$Res>
    extends _$ModelCopyWithImpl<$Res, _$ModelEnumerationImpl>
    implements _$$ModelEnumerationImplCopyWith<$Res> {
  __$$ModelEnumerationImplCopyWithImpl(_$ModelEnumerationImpl _value,
      $Res Function(_$ModelEnumerationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ModelEnumerationImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Models,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModelEnumerationImpl extends ModelEnumeration {
  const _$ModelEnumerationImpl(this.value, {final String? $type})
      : $type = $type ?? 'model',
        super._();

  factory _$ModelEnumerationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelEnumerationImplFromJson(json);

  @override
  final Models value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Model.model(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelEnumerationImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelEnumerationImplCopyWith<_$ModelEnumerationImpl> get copyWith =>
      __$$ModelEnumerationImplCopyWithImpl<_$ModelEnumerationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Models value) model,
    required TResult Function(String value) modelId,
  }) {
    return model(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Models value)? model,
    TResult? Function(String value)? modelId,
  }) {
    return model?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Models value)? model,
    TResult Function(String value)? modelId,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ModelEnumeration value) model,
    required TResult Function(ModelString value) modelId,
  }) {
    return model(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModelEnumeration value)? model,
    TResult? Function(ModelString value)? modelId,
  }) {
    return model?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModelEnumeration value)? model,
    TResult Function(ModelString value)? modelId,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelEnumerationImplToJson(
      this,
    );
  }
}

abstract class ModelEnumeration extends Model {
  const factory ModelEnumeration(final Models value) = _$ModelEnumerationImpl;
  const ModelEnumeration._() : super._();

  factory ModelEnumeration.fromJson(Map<String, dynamic> json) =
      _$ModelEnumerationImpl.fromJson;

  @override
  Models get value;
  @JsonKey(ignore: true)
  _$$ModelEnumerationImplCopyWith<_$ModelEnumerationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ModelStringImplCopyWith<$Res> {
  factory _$$ModelStringImplCopyWith(
          _$ModelStringImpl value, $Res Function(_$ModelStringImpl) then) =
      __$$ModelStringImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$ModelStringImplCopyWithImpl<$Res>
    extends _$ModelCopyWithImpl<$Res, _$ModelStringImpl>
    implements _$$ModelStringImplCopyWith<$Res> {
  __$$ModelStringImplCopyWithImpl(
      _$ModelStringImpl _value, $Res Function(_$ModelStringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ModelStringImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModelStringImpl extends ModelString {
  const _$ModelStringImpl(this.value, {final String? $type})
      : $type = $type ?? 'modelId',
        super._();

  factory _$ModelStringImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelStringImplFromJson(json);

  @override
  final String value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Model.modelId(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelStringImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelStringImplCopyWith<_$ModelStringImpl> get copyWith =>
      __$$ModelStringImplCopyWithImpl<_$ModelStringImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Models value) model,
    required TResult Function(String value) modelId,
  }) {
    return modelId(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Models value)? model,
    TResult? Function(String value)? modelId,
  }) {
    return modelId?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Models value)? model,
    TResult Function(String value)? modelId,
    required TResult orElse(),
  }) {
    if (modelId != null) {
      return modelId(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ModelEnumeration value) model,
    required TResult Function(ModelString value) modelId,
  }) {
    return modelId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModelEnumeration value)? model,
    TResult? Function(ModelString value)? modelId,
  }) {
    return modelId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModelEnumeration value)? model,
    TResult Function(ModelString value)? modelId,
    required TResult orElse(),
  }) {
    if (modelId != null) {
      return modelId(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelStringImplToJson(
      this,
    );
  }
}

abstract class ModelString extends Model {
  const factory ModelString(final String value) = _$ModelStringImpl;
  const ModelString._() : super._();

  factory ModelString.fromJson(Map<String, dynamic> json) =
      _$ModelStringImpl.fromJson;

  @override
  String get value;
  @JsonKey(ignore: true)
  _$$ModelStringImplCopyWith<_$ModelStringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateMessageRequestMetadata _$CreateMessageRequestMetadataFromJson(
    Map<String, dynamic> json) {
  return _CreateMessageRequestMetadata.fromJson(json);
}

/// @nodoc
mixin _$CreateMessageRequestMetadata {
  /// An external identifier for the user who is associated with the request.
  ///
  /// This should be a uuid, hash value, or other opaque identifier. Anthropic may use
  /// this id to help detect abuse. Do not include any identifying information such as
  /// name, email address, or phone number.
  @JsonKey(name: 'user_id', includeIfNull: false)
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateMessageRequestMetadataCopyWith<CreateMessageRequestMetadata>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateMessageRequestMetadataCopyWith<$Res> {
  factory $CreateMessageRequestMetadataCopyWith(
          CreateMessageRequestMetadata value,
          $Res Function(CreateMessageRequestMetadata) then) =
      _$CreateMessageRequestMetadataCopyWithImpl<$Res,
          CreateMessageRequestMetadata>;
  @useResult
  $Res call({@JsonKey(name: 'user_id', includeIfNull: false) String? userId});
}

/// @nodoc
class _$CreateMessageRequestMetadataCopyWithImpl<$Res,
        $Val extends CreateMessageRequestMetadata>
    implements $CreateMessageRequestMetadataCopyWith<$Res> {
  _$CreateMessageRequestMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateMessageRequestMetadataImplCopyWith<$Res>
    implements $CreateMessageRequestMetadataCopyWith<$Res> {
  factory _$$CreateMessageRequestMetadataImplCopyWith(
          _$CreateMessageRequestMetadataImpl value,
          $Res Function(_$CreateMessageRequestMetadataImpl) then) =
      __$$CreateMessageRequestMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'user_id', includeIfNull: false) String? userId});
}

/// @nodoc
class __$$CreateMessageRequestMetadataImplCopyWithImpl<$Res>
    extends _$CreateMessageRequestMetadataCopyWithImpl<$Res,
        _$CreateMessageRequestMetadataImpl>
    implements _$$CreateMessageRequestMetadataImplCopyWith<$Res> {
  __$$CreateMessageRequestMetadataImplCopyWithImpl(
      _$CreateMessageRequestMetadataImpl _value,
      $Res Function(_$CreateMessageRequestMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_$CreateMessageRequestMetadataImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateMessageRequestMetadataImpl extends _CreateMessageRequestMetadata {
  const _$CreateMessageRequestMetadataImpl(
      {@JsonKey(name: 'user_id', includeIfNull: false) this.userId})
      : super._();

  factory _$CreateMessageRequestMetadataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateMessageRequestMetadataImplFromJson(json);

  /// An external identifier for the user who is associated with the request.
  ///
  /// This should be a uuid, hash value, or other opaque identifier. Anthropic may use
  /// this id to help detect abuse. Do not include any identifying information such as
  /// name, email address, or phone number.
  @override
  @JsonKey(name: 'user_id', includeIfNull: false)
  final String? userId;

  @override
  String toString() {
    return 'CreateMessageRequestMetadata(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateMessageRequestMetadataImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateMessageRequestMetadataImplCopyWith<
          _$CreateMessageRequestMetadataImpl>
      get copyWith => __$$CreateMessageRequestMetadataImplCopyWithImpl<
          _$CreateMessageRequestMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateMessageRequestMetadataImplToJson(
      this,
    );
  }
}

abstract class _CreateMessageRequestMetadata
    extends CreateMessageRequestMetadata {
  const factory _CreateMessageRequestMetadata(
      {@JsonKey(name: 'user_id', includeIfNull: false)
      final String? userId}) = _$CreateMessageRequestMetadataImpl;
  const _CreateMessageRequestMetadata._() : super._();

  factory _CreateMessageRequestMetadata.fromJson(Map<String, dynamic> json) =
      _$CreateMessageRequestMetadataImpl.fromJson;

  @override

  /// An external identifier for the user who is associated with the request.
  ///
  /// This should be a uuid, hash value, or other opaque identifier. Anthropic may use
  /// this id to help detect abuse. Do not include any identifying information such as
  /// name, email address, or phone number.
  @JsonKey(name: 'user_id', includeIfNull: false)
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$CreateMessageRequestMetadataImplCopyWith<
          _$CreateMessageRequestMetadataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ToolChoice _$ToolChoiceFromJson(Map<String, dynamic> json) {
  return _ToolChoice.fromJson(json);
}

/// @nodoc
mixin _$ToolChoice {
  /// How the model should use the provided tools. The model can use a specific tool,
  /// any available tool, or decide by itself.
  ///
  /// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
  /// - `any`: tells Claude that it must use one of the provided tools, but doesn’t force a particular tool.
  /// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
  ToolChoiceType get type => throw _privateConstructorUsedError;

  /// The name of the tool to use.
  @JsonKey(includeIfNull: false)
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToolChoiceCopyWith<ToolChoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolChoiceCopyWith<$Res> {
  factory $ToolChoiceCopyWith(
          ToolChoice value, $Res Function(ToolChoice) then) =
      _$ToolChoiceCopyWithImpl<$Res, ToolChoice>;
  @useResult
  $Res call({ToolChoiceType type, @JsonKey(includeIfNull: false) String? name});
}

/// @nodoc
class _$ToolChoiceCopyWithImpl<$Res, $Val extends ToolChoice>
    implements $ToolChoiceCopyWith<$Res> {
  _$ToolChoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ToolChoiceType,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToolChoiceImplCopyWith<$Res>
    implements $ToolChoiceCopyWith<$Res> {
  factory _$$ToolChoiceImplCopyWith(
          _$ToolChoiceImpl value, $Res Function(_$ToolChoiceImpl) then) =
      __$$ToolChoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ToolChoiceType type, @JsonKey(includeIfNull: false) String? name});
}

/// @nodoc
class __$$ToolChoiceImplCopyWithImpl<$Res>
    extends _$ToolChoiceCopyWithImpl<$Res, _$ToolChoiceImpl>
    implements _$$ToolChoiceImplCopyWith<$Res> {
  __$$ToolChoiceImplCopyWithImpl(
      _$ToolChoiceImpl _value, $Res Function(_$ToolChoiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = freezed,
  }) {
    return _then(_$ToolChoiceImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ToolChoiceType,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolChoiceImpl extends _ToolChoice {
  const _$ToolChoiceImpl(
      {required this.type, @JsonKey(includeIfNull: false) this.name})
      : super._();

  factory _$ToolChoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToolChoiceImplFromJson(json);

  /// How the model should use the provided tools. The model can use a specific tool,
  /// any available tool, or decide by itself.
  ///
  /// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
  /// - `any`: tells Claude that it must use one of the provided tools, but doesn’t force a particular tool.
  /// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
  @override
  final ToolChoiceType type;

  /// The name of the tool to use.
  @override
  @JsonKey(includeIfNull: false)
  final String? name;

  @override
  String toString() {
    return 'ToolChoice(type: $type, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolChoiceImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolChoiceImplCopyWith<_$ToolChoiceImpl> get copyWith =>
      __$$ToolChoiceImplCopyWithImpl<_$ToolChoiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToolChoiceImplToJson(
      this,
    );
  }
}

abstract class _ToolChoice extends ToolChoice {
  const factory _ToolChoice(
      {required final ToolChoiceType type,
      @JsonKey(includeIfNull: false) final String? name}) = _$ToolChoiceImpl;
  const _ToolChoice._() : super._();

  factory _ToolChoice.fromJson(Map<String, dynamic> json) =
      _$ToolChoiceImpl.fromJson;

  @override

  /// How the model should use the provided tools. The model can use a specific tool,
  /// any available tool, or decide by itself.
  ///
  /// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
  /// - `any`: tells Claude that it must use one of the provided tools, but doesn’t force a particular tool.
  /// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
  ToolChoiceType get type;
  @override

  /// The name of the tool to use.
  @JsonKey(includeIfNull: false)
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$ToolChoiceImplCopyWith<_$ToolChoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  /// Unique object identifier.
  ///
  /// The format and length of IDs may change over time.
  @JsonKey(includeIfNull: false)
  String? get id => throw _privateConstructorUsedError;

  /// The content of the message.
  @_MessageContentConverter()
  MessageContent get content => throw _privateConstructorUsedError;

  /// The role of the messages author.
  MessageRole get role => throw _privateConstructorUsedError;

  /// The model that handled the request.
  @JsonKey(includeIfNull: false)
  String? get model => throw _privateConstructorUsedError;

  /// The reason that we stopped.
  ///
  /// This may be one the following values:
  ///
  /// - `"end_turn"`: the model reached a natural stopping point
  /// - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
  /// - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
  ///
  /// In non-streaming mode this value is always non-null. In streaming mode, it is
  /// null in the `message_start` event and non-null otherwise.
  @JsonKey(
      name: 'stop_reason',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  StopReason? get stopReason => throw _privateConstructorUsedError;

  /// Which custom stop sequence was generated, if any.
  ///
  /// This value will be a non-null string if one of your custom stop sequences was
  /// generated.
  @JsonKey(name: 'stop_sequence', includeIfNull: false)
  String? get stopSequence => throw _privateConstructorUsedError;

  /// Object type.
  ///
  /// For Messages, this is always `"message"`.
  @JsonKey(includeIfNull: false)
  String? get type => throw _privateConstructorUsedError;

  /// Billing and rate-limit usage.
  ///
  /// Anthropic's API bills and rate-limits by token counts, as tokens represent the
  /// underlying cost to our systems.
  ///
  /// Under the hood, the API transforms requests into a format suitable for the
  /// model. The model's output then goes through a parsing stage before becoming an
  /// API response. As a result, the token counts in `usage` will not match one-to-one
  /// with the exact visible content of an API request or response.
  ///
  /// For example, `output_tokens` will be non-zero, even for an empty string response
  /// from Claude.
  @JsonKey(includeIfNull: false)
  Usage? get usage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? id,
      @_MessageContentConverter() MessageContent content,
      MessageRole role,
      @JsonKey(includeIfNull: false) String? model,
      @JsonKey(
          name: 'stop_reason',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      StopReason? stopReason,
      @JsonKey(name: 'stop_sequence', includeIfNull: false)
      String? stopSequence,
      @JsonKey(includeIfNull: false) String? type,
      @JsonKey(includeIfNull: false) Usage? usage});

  $MessageContentCopyWith<$Res> get content;
  $UsageCopyWith<$Res>? get usage;
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = null,
    Object? role = null,
    Object? model = freezed,
    Object? stopReason = freezed,
    Object? stopSequence = freezed,
    Object? type = freezed,
    Object? usage = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as MessageContent,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as MessageRole,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      stopReason: freezed == stopReason
          ? _value.stopReason
          : stopReason // ignore: cast_nullable_to_non_nullable
              as StopReason?,
      stopSequence: freezed == stopSequence
          ? _value.stopSequence
          : stopSequence // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      usage: freezed == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageContentCopyWith<$Res> get content {
    return $MessageContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UsageCopyWith<$Res>? get usage {
    if (_value.usage == null) {
      return null;
    }

    return $UsageCopyWith<$Res>(_value.usage!, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? id,
      @_MessageContentConverter() MessageContent content,
      MessageRole role,
      @JsonKey(includeIfNull: false) String? model,
      @JsonKey(
          name: 'stop_reason',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      StopReason? stopReason,
      @JsonKey(name: 'stop_sequence', includeIfNull: false)
      String? stopSequence,
      @JsonKey(includeIfNull: false) String? type,
      @JsonKey(includeIfNull: false) Usage? usage});

  @override
  $MessageContentCopyWith<$Res> get content;
  @override
  $UsageCopyWith<$Res>? get usage;
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = null,
    Object? role = null,
    Object? model = freezed,
    Object? stopReason = freezed,
    Object? stopSequence = freezed,
    Object? type = freezed,
    Object? usage = freezed,
  }) {
    return _then(_$MessageImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as MessageContent,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as MessageRole,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      stopReason: freezed == stopReason
          ? _value.stopReason
          : stopReason // ignore: cast_nullable_to_non_nullable
              as StopReason?,
      stopSequence: freezed == stopSequence
          ? _value.stopSequence
          : stopSequence // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      usage: freezed == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl extends _Message {
  const _$MessageImpl(
      {@JsonKey(includeIfNull: false) this.id,
      @_MessageContentConverter() required this.content,
      required this.role,
      @JsonKey(includeIfNull: false) this.model,
      @JsonKey(
          name: 'stop_reason',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.stopReason,
      @JsonKey(name: 'stop_sequence', includeIfNull: false) this.stopSequence,
      @JsonKey(includeIfNull: false) this.type,
      @JsonKey(includeIfNull: false) this.usage})
      : super._();

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  /// Unique object identifier.
  ///
  /// The format and length of IDs may change over time.
  @override
  @JsonKey(includeIfNull: false)
  final String? id;

  /// The content of the message.
  @override
  @_MessageContentConverter()
  final MessageContent content;

  /// The role of the messages author.
  @override
  final MessageRole role;

  /// The model that handled the request.
  @override
  @JsonKey(includeIfNull: false)
  final String? model;

  /// The reason that we stopped.
  ///
  /// This may be one the following values:
  ///
  /// - `"end_turn"`: the model reached a natural stopping point
  /// - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
  /// - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
  ///
  /// In non-streaming mode this value is always non-null. In streaming mode, it is
  /// null in the `message_start` event and non-null otherwise.
  @override
  @JsonKey(
      name: 'stop_reason',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final StopReason? stopReason;

  /// Which custom stop sequence was generated, if any.
  ///
  /// This value will be a non-null string if one of your custom stop sequences was
  /// generated.
  @override
  @JsonKey(name: 'stop_sequence', includeIfNull: false)
  final String? stopSequence;

  /// Object type.
  ///
  /// For Messages, this is always `"message"`.
  @override
  @JsonKey(includeIfNull: false)
  final String? type;

  /// Billing and rate-limit usage.
  ///
  /// Anthropic's API bills and rate-limits by token counts, as tokens represent the
  /// underlying cost to our systems.
  ///
  /// Under the hood, the API transforms requests into a format suitable for the
  /// model. The model's output then goes through a parsing stage before becoming an
  /// API response. As a result, the token counts in `usage` will not match one-to-one
  /// with the exact visible content of an API request or response.
  ///
  /// For example, `output_tokens` will be non-zero, even for an empty string response
  /// from Claude.
  @override
  @JsonKey(includeIfNull: false)
  final Usage? usage;

  @override
  String toString() {
    return 'Message(id: $id, content: $content, role: $role, model: $model, stopReason: $stopReason, stopSequence: $stopSequence, type: $type, usage: $usage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.stopReason, stopReason) ||
                other.stopReason == stopReason) &&
            (identical(other.stopSequence, stopSequence) ||
                other.stopSequence == stopSequence) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, role, model,
      stopReason, stopSequence, type, usage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message extends Message {
  const factory _Message(
      {@JsonKey(includeIfNull: false) final String? id,
      @_MessageContentConverter() required final MessageContent content,
      required final MessageRole role,
      @JsonKey(includeIfNull: false) final String? model,
      @JsonKey(
          name: 'stop_reason',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      final StopReason? stopReason,
      @JsonKey(name: 'stop_sequence', includeIfNull: false)
      final String? stopSequence,
      @JsonKey(includeIfNull: false) final String? type,
      @JsonKey(includeIfNull: false) final Usage? usage}) = _$MessageImpl;
  const _Message._() : super._();

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override

  /// Unique object identifier.
  ///
  /// The format and length of IDs may change over time.
  @JsonKey(includeIfNull: false)
  String? get id;
  @override

  /// The content of the message.
  @_MessageContentConverter()
  MessageContent get content;
  @override

  /// The role of the messages author.
  MessageRole get role;
  @override

  /// The model that handled the request.
  @JsonKey(includeIfNull: false)
  String? get model;
  @override

  /// The reason that we stopped.
  ///
  /// This may be one the following values:
  ///
  /// - `"end_turn"`: the model reached a natural stopping point
  /// - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
  /// - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
  ///
  /// In non-streaming mode this value is always non-null. In streaming mode, it is
  /// null in the `message_start` event and non-null otherwise.
  @JsonKey(
      name: 'stop_reason',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  StopReason? get stopReason;
  @override

  /// Which custom stop sequence was generated, if any.
  ///
  /// This value will be a non-null string if one of your custom stop sequences was
  /// generated.
  @JsonKey(name: 'stop_sequence', includeIfNull: false)
  String? get stopSequence;
  @override

  /// Object type.
  ///
  /// For Messages, this is always `"message"`.
  @JsonKey(includeIfNull: false)
  String? get type;
  @override

  /// Billing and rate-limit usage.
  ///
  /// Anthropic's API bills and rate-limits by token counts, as tokens represent the
  /// underlying cost to our systems.
  ///
  /// Under the hood, the API transforms requests into a format suitable for the
  /// model. The model's output then goes through a parsing stage before becoming an
  /// API response. As a result, the token counts in `usage` will not match one-to-one
  /// with the exact visible content of an API request or response.
  ///
  /// For example, `output_tokens` will be non-zero, even for an empty string response
  /// from Claude.
  @JsonKey(includeIfNull: false)
  Usage? get usage;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageContent _$MessageContentFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'blocks':
      return MessageContentListBlock.fromJson(json);
    case 'text':
      return MessageContentString.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'MessageContent',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$MessageContent {
  Object get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Block> value) blocks,
    required TResult Function(String value) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Block> value)? blocks,
    TResult? Function(String value)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Block> value)? blocks,
    TResult Function(String value)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageContentListBlock value) blocks,
    required TResult Function(MessageContentString value) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageContentListBlock value)? blocks,
    TResult? Function(MessageContentString value)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageContentListBlock value)? blocks,
    TResult Function(MessageContentString value)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageContentCopyWith<$Res> {
  factory $MessageContentCopyWith(
          MessageContent value, $Res Function(MessageContent) then) =
      _$MessageContentCopyWithImpl<$Res, MessageContent>;
}

/// @nodoc
class _$MessageContentCopyWithImpl<$Res, $Val extends MessageContent>
    implements $MessageContentCopyWith<$Res> {
  _$MessageContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MessageContentListBlockImplCopyWith<$Res> {
  factory _$$MessageContentListBlockImplCopyWith(
          _$MessageContentListBlockImpl value,
          $Res Function(_$MessageContentListBlockImpl) then) =
      __$$MessageContentListBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Block> value});
}

/// @nodoc
class __$$MessageContentListBlockImplCopyWithImpl<$Res>
    extends _$MessageContentCopyWithImpl<$Res, _$MessageContentListBlockImpl>
    implements _$$MessageContentListBlockImplCopyWith<$Res> {
  __$$MessageContentListBlockImplCopyWithImpl(
      _$MessageContentListBlockImpl _value,
      $Res Function(_$MessageContentListBlockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$MessageContentListBlockImpl(
      null == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Block>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageContentListBlockImpl extends MessageContentListBlock {
  const _$MessageContentListBlockImpl(final List<Block> value,
      {final String? $type})
      : _value = value,
        $type = $type ?? 'blocks',
        super._();

  factory _$MessageContentListBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageContentListBlockImplFromJson(json);

  final List<Block> _value;
  @override
  List<Block> get value {
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MessageContent.blocks(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageContentListBlockImpl &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageContentListBlockImplCopyWith<_$MessageContentListBlockImpl>
      get copyWith => __$$MessageContentListBlockImplCopyWithImpl<
          _$MessageContentListBlockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Block> value) blocks,
    required TResult Function(String value) text,
  }) {
    return blocks(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Block> value)? blocks,
    TResult? Function(String value)? text,
  }) {
    return blocks?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Block> value)? blocks,
    TResult Function(String value)? text,
    required TResult orElse(),
  }) {
    if (blocks != null) {
      return blocks(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageContentListBlock value) blocks,
    required TResult Function(MessageContentString value) text,
  }) {
    return blocks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageContentListBlock value)? blocks,
    TResult? Function(MessageContentString value)? text,
  }) {
    return blocks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageContentListBlock value)? blocks,
    TResult Function(MessageContentString value)? text,
    required TResult orElse(),
  }) {
    if (blocks != null) {
      return blocks(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageContentListBlockImplToJson(
      this,
    );
  }
}

abstract class MessageContentListBlock extends MessageContent {
  const factory MessageContentListBlock(final List<Block> value) =
      _$MessageContentListBlockImpl;
  const MessageContentListBlock._() : super._();

  factory MessageContentListBlock.fromJson(Map<String, dynamic> json) =
      _$MessageContentListBlockImpl.fromJson;

  @override
  List<Block> get value;
  @JsonKey(ignore: true)
  _$$MessageContentListBlockImplCopyWith<_$MessageContentListBlockImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageContentStringImplCopyWith<$Res> {
  factory _$$MessageContentStringImplCopyWith(_$MessageContentStringImpl value,
          $Res Function(_$MessageContentStringImpl) then) =
      __$$MessageContentStringImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$MessageContentStringImplCopyWithImpl<$Res>
    extends _$MessageContentCopyWithImpl<$Res, _$MessageContentStringImpl>
    implements _$$MessageContentStringImplCopyWith<$Res> {
  __$$MessageContentStringImplCopyWithImpl(_$MessageContentStringImpl _value,
      $Res Function(_$MessageContentStringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$MessageContentStringImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageContentStringImpl extends MessageContentString {
  const _$MessageContentStringImpl(this.value, {final String? $type})
      : $type = $type ?? 'text',
        super._();

  factory _$MessageContentStringImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageContentStringImplFromJson(json);

  @override
  final String value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MessageContent.text(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageContentStringImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageContentStringImplCopyWith<_$MessageContentStringImpl>
      get copyWith =>
          __$$MessageContentStringImplCopyWithImpl<_$MessageContentStringImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Block> value) blocks,
    required TResult Function(String value) text,
  }) {
    return text(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Block> value)? blocks,
    TResult? Function(String value)? text,
  }) {
    return text?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Block> value)? blocks,
    TResult Function(String value)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageContentListBlock value) blocks,
    required TResult Function(MessageContentString value) text,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageContentListBlock value)? blocks,
    TResult? Function(MessageContentString value)? text,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageContentListBlock value)? blocks,
    TResult Function(MessageContentString value)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageContentStringImplToJson(
      this,
    );
  }
}

abstract class MessageContentString extends MessageContent {
  const factory MessageContentString(final String value) =
      _$MessageContentStringImpl;
  const MessageContentString._() : super._();

  factory MessageContentString.fromJson(Map<String, dynamic> json) =
      _$MessageContentStringImpl.fromJson;

  @override
  String get value;
  @JsonKey(ignore: true)
  _$$MessageContentStringImplCopyWith<_$MessageContentStringImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Tool _$ToolFromJson(Map<String, dynamic> json) {
  return _Tool.fromJson(json);
}

/// @nodoc
mixin _$Tool {
  /// The name of the tool. Must match the regex `^[a-zA-Z0-9_-]{1,64}$`.
  String get name => throw _privateConstructorUsedError;

  /// Description of what this tool does.
  ///
  /// Tool descriptions should be as detailed as possible. The more information that
  /// the model has about what the tool is and how to use it, the better it will
  /// perform. You can use natural language descriptions to reinforce important
  /// aspects of the tool input JSON schema.
  @JsonKey(includeIfNull: false)
  String? get description => throw _privateConstructorUsedError;

  /// [JSON schema](https://json-schema.org/) for this tool's input.
  ///
  /// This defines the shape of the `input` that your tool accepts and that the model
  /// will produce.
  @JsonKey(name: 'input_schema')
  Map<String, dynamic> get inputSchema => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToolCopyWith<Tool> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolCopyWith<$Res> {
  factory $ToolCopyWith(Tool value, $Res Function(Tool) then) =
      _$ToolCopyWithImpl<$Res, Tool>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(includeIfNull: false) String? description,
      @JsonKey(name: 'input_schema') Map<String, dynamic> inputSchema});
}

/// @nodoc
class _$ToolCopyWithImpl<$Res, $Val extends Tool>
    implements $ToolCopyWith<$Res> {
  _$ToolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? inputSchema = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      inputSchema: null == inputSchema
          ? _value.inputSchema
          : inputSchema // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToolImplCopyWith<$Res> implements $ToolCopyWith<$Res> {
  factory _$$ToolImplCopyWith(
          _$ToolImpl value, $Res Function(_$ToolImpl) then) =
      __$$ToolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(includeIfNull: false) String? description,
      @JsonKey(name: 'input_schema') Map<String, dynamic> inputSchema});
}

/// @nodoc
class __$$ToolImplCopyWithImpl<$Res>
    extends _$ToolCopyWithImpl<$Res, _$ToolImpl>
    implements _$$ToolImplCopyWith<$Res> {
  __$$ToolImplCopyWithImpl(_$ToolImpl _value, $Res Function(_$ToolImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? inputSchema = null,
  }) {
    return _then(_$ToolImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      inputSchema: null == inputSchema
          ? _value._inputSchema
          : inputSchema // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolImpl extends _Tool {
  const _$ToolImpl(
      {required this.name,
      @JsonKey(includeIfNull: false) this.description,
      @JsonKey(name: 'input_schema')
      required final Map<String, dynamic> inputSchema})
      : _inputSchema = inputSchema,
        super._();

  factory _$ToolImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToolImplFromJson(json);

  /// The name of the tool. Must match the regex `^[a-zA-Z0-9_-]{1,64}$`.
  @override
  final String name;

  /// Description of what this tool does.
  ///
  /// Tool descriptions should be as detailed as possible. The more information that
  /// the model has about what the tool is and how to use it, the better it will
  /// perform. You can use natural language descriptions to reinforce important
  /// aspects of the tool input JSON schema.
  @override
  @JsonKey(includeIfNull: false)
  final String? description;

  /// [JSON schema](https://json-schema.org/) for this tool's input.
  ///
  /// This defines the shape of the `input` that your tool accepts and that the model
  /// will produce.
  final Map<String, dynamic> _inputSchema;

  /// [JSON schema](https://json-schema.org/) for this tool's input.
  ///
  /// This defines the shape of the `input` that your tool accepts and that the model
  /// will produce.
  @override
  @JsonKey(name: 'input_schema')
  Map<String, dynamic> get inputSchema {
    if (_inputSchema is EqualUnmodifiableMapView) return _inputSchema;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_inputSchema);
  }

  @override
  String toString() {
    return 'Tool(name: $name, description: $description, inputSchema: $inputSchema)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._inputSchema, _inputSchema));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description,
      const DeepCollectionEquality().hash(_inputSchema));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolImplCopyWith<_$ToolImpl> get copyWith =>
      __$$ToolImplCopyWithImpl<_$ToolImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToolImplToJson(
      this,
    );
  }
}

abstract class _Tool extends Tool {
  const factory _Tool(
      {required final String name,
      @JsonKey(includeIfNull: false) final String? description,
      @JsonKey(name: 'input_schema')
      required final Map<String, dynamic> inputSchema}) = _$ToolImpl;
  const _Tool._() : super._();

  factory _Tool.fromJson(Map<String, dynamic> json) = _$ToolImpl.fromJson;

  @override

  /// The name of the tool. Must match the regex `^[a-zA-Z0-9_-]{1,64}$`.
  String get name;
  @override

  /// Description of what this tool does.
  ///
  /// Tool descriptions should be as detailed as possible. The more information that
  /// the model has about what the tool is and how to use it, the better it will
  /// perform. You can use natural language descriptions to reinforce important
  /// aspects of the tool input JSON schema.
  @JsonKey(includeIfNull: false)
  String? get description;
  @override

  /// [JSON schema](https://json-schema.org/) for this tool's input.
  ///
  /// This defines the shape of the `input` that your tool accepts and that the model
  /// will produce.
  @JsonKey(name: 'input_schema')
  Map<String, dynamic> get inputSchema;
  @override
  @JsonKey(ignore: true)
  _$$ToolImplCopyWith<_$ToolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageBlockSource _$ImageBlockSourceFromJson(Map<String, dynamic> json) {
  return _ImageBlockSource.fromJson(json);
}

/// @nodoc
mixin _$ImageBlockSource {
  /// The base64-encoded image data.
  String get data => throw _privateConstructorUsedError;

  /// The media type of the image.
  @JsonKey(name: 'media_type')
  ImageBlockSourceMediaType get mediaType => throw _privateConstructorUsedError;

  /// The type of image source.
  ImageBlockSourceType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageBlockSourceCopyWith<ImageBlockSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageBlockSourceCopyWith<$Res> {
  factory $ImageBlockSourceCopyWith(
          ImageBlockSource value, $Res Function(ImageBlockSource) then) =
      _$ImageBlockSourceCopyWithImpl<$Res, ImageBlockSource>;
  @useResult
  $Res call(
      {String data,
      @JsonKey(name: 'media_type') ImageBlockSourceMediaType mediaType,
      ImageBlockSourceType type});
}

/// @nodoc
class _$ImageBlockSourceCopyWithImpl<$Res, $Val extends ImageBlockSource>
    implements $ImageBlockSourceCopyWith<$Res> {
  _$ImageBlockSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? mediaType = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as ImageBlockSourceMediaType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImageBlockSourceType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageBlockSourceImplCopyWith<$Res>
    implements $ImageBlockSourceCopyWith<$Res> {
  factory _$$ImageBlockSourceImplCopyWith(_$ImageBlockSourceImpl value,
          $Res Function(_$ImageBlockSourceImpl) then) =
      __$$ImageBlockSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String data,
      @JsonKey(name: 'media_type') ImageBlockSourceMediaType mediaType,
      ImageBlockSourceType type});
}

/// @nodoc
class __$$ImageBlockSourceImplCopyWithImpl<$Res>
    extends _$ImageBlockSourceCopyWithImpl<$Res, _$ImageBlockSourceImpl>
    implements _$$ImageBlockSourceImplCopyWith<$Res> {
  __$$ImageBlockSourceImplCopyWithImpl(_$ImageBlockSourceImpl _value,
      $Res Function(_$ImageBlockSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? mediaType = null,
    Object? type = null,
  }) {
    return _then(_$ImageBlockSourceImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as ImageBlockSourceMediaType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImageBlockSourceType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageBlockSourceImpl extends _ImageBlockSource {
  const _$ImageBlockSourceImpl(
      {required this.data,
      @JsonKey(name: 'media_type') required this.mediaType,
      required this.type})
      : super._();

  factory _$ImageBlockSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageBlockSourceImplFromJson(json);

  /// The base64-encoded image data.
  @override
  final String data;

  /// The media type of the image.
  @override
  @JsonKey(name: 'media_type')
  final ImageBlockSourceMediaType mediaType;

  /// The type of image source.
  @override
  final ImageBlockSourceType type;

  @override
  String toString() {
    return 'ImageBlockSource(data: $data, mediaType: $mediaType, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageBlockSourceImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, mediaType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageBlockSourceImplCopyWith<_$ImageBlockSourceImpl> get copyWith =>
      __$$ImageBlockSourceImplCopyWithImpl<_$ImageBlockSourceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageBlockSourceImplToJson(
      this,
    );
  }
}

abstract class _ImageBlockSource extends ImageBlockSource {
  const factory _ImageBlockSource(
      {required final String data,
      @JsonKey(name: 'media_type')
      required final ImageBlockSourceMediaType mediaType,
      required final ImageBlockSourceType type}) = _$ImageBlockSourceImpl;
  const _ImageBlockSource._() : super._();

  factory _ImageBlockSource.fromJson(Map<String, dynamic> json) =
      _$ImageBlockSourceImpl.fromJson;

  @override

  /// The base64-encoded image data.
  String get data;
  @override

  /// The media type of the image.
  @JsonKey(name: 'media_type')
  ImageBlockSourceMediaType get mediaType;
  @override

  /// The type of image source.
  ImageBlockSourceType get type;
  @override
  @JsonKey(ignore: true)
  _$$ImageBlockSourceImplCopyWith<_$ImageBlockSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Usage _$UsageFromJson(Map<String, dynamic> json) {
  return _Usage.fromJson(json);
}

/// @nodoc
mixin _$Usage {
  /// The number of input tokens which were used.
  @JsonKey(name: 'input_tokens')
  int get inputTokens => throw _privateConstructorUsedError;

  /// The number of output tokens which were used.
  @JsonKey(name: 'output_tokens')
  int get outputTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsageCopyWith<Usage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageCopyWith<$Res> {
  factory $UsageCopyWith(Usage value, $Res Function(Usage) then) =
      _$UsageCopyWithImpl<$Res, Usage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'input_tokens') int inputTokens,
      @JsonKey(name: 'output_tokens') int outputTokens});
}

/// @nodoc
class _$UsageCopyWithImpl<$Res, $Val extends Usage>
    implements $UsageCopyWith<$Res> {
  _$UsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputTokens = null,
    Object? outputTokens = null,
  }) {
    return _then(_value.copyWith(
      inputTokens: null == inputTokens
          ? _value.inputTokens
          : inputTokens // ignore: cast_nullable_to_non_nullable
              as int,
      outputTokens: null == outputTokens
          ? _value.outputTokens
          : outputTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsageImplCopyWith<$Res> implements $UsageCopyWith<$Res> {
  factory _$$UsageImplCopyWith(
          _$UsageImpl value, $Res Function(_$UsageImpl) then) =
      __$$UsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'input_tokens') int inputTokens,
      @JsonKey(name: 'output_tokens') int outputTokens});
}

/// @nodoc
class __$$UsageImplCopyWithImpl<$Res>
    extends _$UsageCopyWithImpl<$Res, _$UsageImpl>
    implements _$$UsageImplCopyWith<$Res> {
  __$$UsageImplCopyWithImpl(
      _$UsageImpl _value, $Res Function(_$UsageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputTokens = null,
    Object? outputTokens = null,
  }) {
    return _then(_$UsageImpl(
      inputTokens: null == inputTokens
          ? _value.inputTokens
          : inputTokens // ignore: cast_nullable_to_non_nullable
              as int,
      outputTokens: null == outputTokens
          ? _value.outputTokens
          : outputTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsageImpl extends _Usage {
  const _$UsageImpl(
      {@JsonKey(name: 'input_tokens') required this.inputTokens,
      @JsonKey(name: 'output_tokens') required this.outputTokens})
      : super._();

  factory _$UsageImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsageImplFromJson(json);

  /// The number of input tokens which were used.
  @override
  @JsonKey(name: 'input_tokens')
  final int inputTokens;

  /// The number of output tokens which were used.
  @override
  @JsonKey(name: 'output_tokens')
  final int outputTokens;

  @override
  String toString() {
    return 'Usage(inputTokens: $inputTokens, outputTokens: $outputTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsageImpl &&
            (identical(other.inputTokens, inputTokens) ||
                other.inputTokens == inputTokens) &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, inputTokens, outputTokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsageImplCopyWith<_$UsageImpl> get copyWith =>
      __$$UsageImplCopyWithImpl<_$UsageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsageImplToJson(
      this,
    );
  }
}

abstract class _Usage extends Usage {
  const factory _Usage(
          {@JsonKey(name: 'input_tokens') required final int inputTokens,
          @JsonKey(name: 'output_tokens') required final int outputTokens}) =
      _$UsageImpl;
  const _Usage._() : super._();

  factory _Usage.fromJson(Map<String, dynamic> json) = _$UsageImpl.fromJson;

  @override

  /// The number of input tokens which were used.
  @JsonKey(name: 'input_tokens')
  int get inputTokens;
  @override

  /// The number of output tokens which were used.
  @JsonKey(name: 'output_tokens')
  int get outputTokens;
  @override
  @JsonKey(ignore: true)
  _$$UsageImplCopyWith<_$UsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageDelta _$MessageDeltaFromJson(Map<String, dynamic> json) {
  return _MessageDelta.fromJson(json);
}

/// @nodoc
mixin _$MessageDelta {
  /// The reason that we stopped.
  ///
  /// This may be one the following values:
  ///
  /// - `"end_turn"`: the model reached a natural stopping point
  /// - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
  /// - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
  ///
  /// In non-streaming mode this value is always non-null. In streaming mode, it is
  /// null in the `message_start` event and non-null otherwise.
  @JsonKey(
      name: 'stop_reason',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  StopReason? get stopReason => throw _privateConstructorUsedError;

  /// Which custom stop sequence was generated, if any.
  ///
  /// This value will be a non-null string if one of your custom stop sequences was
  /// generated.
  @JsonKey(name: 'stop_sequence', includeIfNull: false)
  String? get stopSequence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageDeltaCopyWith<MessageDelta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageDeltaCopyWith<$Res> {
  factory $MessageDeltaCopyWith(
          MessageDelta value, $Res Function(MessageDelta) then) =
      _$MessageDeltaCopyWithImpl<$Res, MessageDelta>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'stop_reason',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      StopReason? stopReason,
      @JsonKey(name: 'stop_sequence', includeIfNull: false)
      String? stopSequence});
}

/// @nodoc
class _$MessageDeltaCopyWithImpl<$Res, $Val extends MessageDelta>
    implements $MessageDeltaCopyWith<$Res> {
  _$MessageDeltaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopReason = freezed,
    Object? stopSequence = freezed,
  }) {
    return _then(_value.copyWith(
      stopReason: freezed == stopReason
          ? _value.stopReason
          : stopReason // ignore: cast_nullable_to_non_nullable
              as StopReason?,
      stopSequence: freezed == stopSequence
          ? _value.stopSequence
          : stopSequence // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageDeltaImplCopyWith<$Res>
    implements $MessageDeltaCopyWith<$Res> {
  factory _$$MessageDeltaImplCopyWith(
          _$MessageDeltaImpl value, $Res Function(_$MessageDeltaImpl) then) =
      __$$MessageDeltaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'stop_reason',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      StopReason? stopReason,
      @JsonKey(name: 'stop_sequence', includeIfNull: false)
      String? stopSequence});
}

/// @nodoc
class __$$MessageDeltaImplCopyWithImpl<$Res>
    extends _$MessageDeltaCopyWithImpl<$Res, _$MessageDeltaImpl>
    implements _$$MessageDeltaImplCopyWith<$Res> {
  __$$MessageDeltaImplCopyWithImpl(
      _$MessageDeltaImpl _value, $Res Function(_$MessageDeltaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopReason = freezed,
    Object? stopSequence = freezed,
  }) {
    return _then(_$MessageDeltaImpl(
      stopReason: freezed == stopReason
          ? _value.stopReason
          : stopReason // ignore: cast_nullable_to_non_nullable
              as StopReason?,
      stopSequence: freezed == stopSequence
          ? _value.stopSequence
          : stopSequence // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageDeltaImpl extends _MessageDelta {
  const _$MessageDeltaImpl(
      {@JsonKey(
          name: 'stop_reason',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.stopReason,
      @JsonKey(name: 'stop_sequence', includeIfNull: false) this.stopSequence})
      : super._();

  factory _$MessageDeltaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageDeltaImplFromJson(json);

  /// The reason that we stopped.
  ///
  /// This may be one the following values:
  ///
  /// - `"end_turn"`: the model reached a natural stopping point
  /// - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
  /// - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
  ///
  /// In non-streaming mode this value is always non-null. In streaming mode, it is
  /// null in the `message_start` event and non-null otherwise.
  @override
  @JsonKey(
      name: 'stop_reason',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final StopReason? stopReason;

  /// Which custom stop sequence was generated, if any.
  ///
  /// This value will be a non-null string if one of your custom stop sequences was
  /// generated.
  @override
  @JsonKey(name: 'stop_sequence', includeIfNull: false)
  final String? stopSequence;

  @override
  String toString() {
    return 'MessageDelta(stopReason: $stopReason, stopSequence: $stopSequence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageDeltaImpl &&
            (identical(other.stopReason, stopReason) ||
                other.stopReason == stopReason) &&
            (identical(other.stopSequence, stopSequence) ||
                other.stopSequence == stopSequence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stopReason, stopSequence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageDeltaImplCopyWith<_$MessageDeltaImpl> get copyWith =>
      __$$MessageDeltaImplCopyWithImpl<_$MessageDeltaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageDeltaImplToJson(
      this,
    );
  }
}

abstract class _MessageDelta extends MessageDelta {
  const factory _MessageDelta(
      {@JsonKey(
          name: 'stop_reason',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      final StopReason? stopReason,
      @JsonKey(name: 'stop_sequence', includeIfNull: false)
      final String? stopSequence}) = _$MessageDeltaImpl;
  const _MessageDelta._() : super._();

  factory _MessageDelta.fromJson(Map<String, dynamic> json) =
      _$MessageDeltaImpl.fromJson;

  @override

  /// The reason that we stopped.
  ///
  /// This may be one the following values:
  ///
  /// - `"end_turn"`: the model reached a natural stopping point
  /// - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
  /// - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
  ///
  /// In non-streaming mode this value is always non-null. In streaming mode, it is
  /// null in the `message_start` event and non-null otherwise.
  @JsonKey(
      name: 'stop_reason',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  StopReason? get stopReason;
  @override

  /// Which custom stop sequence was generated, if any.
  ///
  /// This value will be a non-null string if one of your custom stop sequences was
  /// generated.
  @JsonKey(name: 'stop_sequence', includeIfNull: false)
  String? get stopSequence;
  @override
  @JsonKey(ignore: true)
  _$$MessageDeltaImplCopyWith<_$MessageDeltaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageDeltaUsage _$MessageDeltaUsageFromJson(Map<String, dynamic> json) {
  return _MessageDeltaUsage.fromJson(json);
}

/// @nodoc
mixin _$MessageDeltaUsage {
  /// The cumulative number of output tokens which were used.
  @JsonKey(name: 'output_tokens')
  int get outputTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageDeltaUsageCopyWith<MessageDeltaUsage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageDeltaUsageCopyWith<$Res> {
  factory $MessageDeltaUsageCopyWith(
          MessageDeltaUsage value, $Res Function(MessageDeltaUsage) then) =
      _$MessageDeltaUsageCopyWithImpl<$Res, MessageDeltaUsage>;
  @useResult
  $Res call({@JsonKey(name: 'output_tokens') int outputTokens});
}

/// @nodoc
class _$MessageDeltaUsageCopyWithImpl<$Res, $Val extends MessageDeltaUsage>
    implements $MessageDeltaUsageCopyWith<$Res> {
  _$MessageDeltaUsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outputTokens = null,
  }) {
    return _then(_value.copyWith(
      outputTokens: null == outputTokens
          ? _value.outputTokens
          : outputTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageDeltaUsageImplCopyWith<$Res>
    implements $MessageDeltaUsageCopyWith<$Res> {
  factory _$$MessageDeltaUsageImplCopyWith(_$MessageDeltaUsageImpl value,
          $Res Function(_$MessageDeltaUsageImpl) then) =
      __$$MessageDeltaUsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'output_tokens') int outputTokens});
}

/// @nodoc
class __$$MessageDeltaUsageImplCopyWithImpl<$Res>
    extends _$MessageDeltaUsageCopyWithImpl<$Res, _$MessageDeltaUsageImpl>
    implements _$$MessageDeltaUsageImplCopyWith<$Res> {
  __$$MessageDeltaUsageImplCopyWithImpl(_$MessageDeltaUsageImpl _value,
      $Res Function(_$MessageDeltaUsageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outputTokens = null,
  }) {
    return _then(_$MessageDeltaUsageImpl(
      outputTokens: null == outputTokens
          ? _value.outputTokens
          : outputTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageDeltaUsageImpl extends _MessageDeltaUsage {
  const _$MessageDeltaUsageImpl(
      {@JsonKey(name: 'output_tokens') required this.outputTokens})
      : super._();

  factory _$MessageDeltaUsageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageDeltaUsageImplFromJson(json);

  /// The cumulative number of output tokens which were used.
  @override
  @JsonKey(name: 'output_tokens')
  final int outputTokens;

  @override
  String toString() {
    return 'MessageDeltaUsage(outputTokens: $outputTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageDeltaUsageImpl &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, outputTokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageDeltaUsageImplCopyWith<_$MessageDeltaUsageImpl> get copyWith =>
      __$$MessageDeltaUsageImplCopyWithImpl<_$MessageDeltaUsageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageDeltaUsageImplToJson(
      this,
    );
  }
}

abstract class _MessageDeltaUsage extends MessageDeltaUsage {
  const factory _MessageDeltaUsage(
          {@JsonKey(name: 'output_tokens') required final int outputTokens}) =
      _$MessageDeltaUsageImpl;
  const _MessageDeltaUsage._() : super._();

  factory _MessageDeltaUsage.fromJson(Map<String, dynamic> json) =
      _$MessageDeltaUsageImpl.fromJson;

  @override

  /// The cumulative number of output tokens which were used.
  @JsonKey(name: 'output_tokens')
  int get outputTokens;
  @override
  @JsonKey(ignore: true)
  _$$MessageDeltaUsageImplCopyWith<_$MessageDeltaUsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Block _$BlockFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'text':
      return TextBlock.fromJson(json);
    case 'image':
      return ImageBlock.fromJson(json);
    case 'tool_use':
      return ToolUseBlock.fromJson(json);
    case 'tool_result':
      return ToolResultBlock.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'Block', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$Block {
  /// The type of content block.
  String get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text, String type) text,
    required TResult Function(ImageBlockSource source, String type) image,
    required TResult Function(
            String id, String name, Map<String, dynamic> input, String type)
        toolUse,
    required TResult Function(
            @JsonKey(name: 'tool_use_id') String toolUseId,
            @_ToolResultBlockContentConverter() ToolResultBlockContent content,
            @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
            String type)
        toolResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text, String type)? text,
    TResult? Function(ImageBlockSource source, String type)? image,
    TResult? Function(
            String id, String name, Map<String, dynamic> input, String type)?
        toolUse,
    TResult? Function(
            @JsonKey(name: 'tool_use_id') String toolUseId,
            @_ToolResultBlockContentConverter() ToolResultBlockContent content,
            @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
            String type)?
        toolResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text, String type)? text,
    TResult Function(ImageBlockSource source, String type)? image,
    TResult Function(
            String id, String name, Map<String, dynamic> input, String type)?
        toolUse,
    TResult Function(
            @JsonKey(name: 'tool_use_id') String toolUseId,
            @_ToolResultBlockContentConverter() ToolResultBlockContent content,
            @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
            String type)?
        toolResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextBlock value) text,
    required TResult Function(ImageBlock value) image,
    required TResult Function(ToolUseBlock value) toolUse,
    required TResult Function(ToolResultBlock value) toolResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextBlock value)? text,
    TResult? Function(ImageBlock value)? image,
    TResult? Function(ToolUseBlock value)? toolUse,
    TResult? Function(ToolResultBlock value)? toolResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextBlock value)? text,
    TResult Function(ImageBlock value)? image,
    TResult Function(ToolUseBlock value)? toolUse,
    TResult Function(ToolResultBlock value)? toolResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockCopyWith<Block> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockCopyWith<$Res> {
  factory $BlockCopyWith(Block value, $Res Function(Block) then) =
      _$BlockCopyWithImpl<$Res, Block>;
  @useResult
  $Res call({String type});
}

/// @nodoc
class _$BlockCopyWithImpl<$Res, $Val extends Block>
    implements $BlockCopyWith<$Res> {
  _$BlockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextBlockImplCopyWith<$Res> implements $BlockCopyWith<$Res> {
  factory _$$TextBlockImplCopyWith(
          _$TextBlockImpl value, $Res Function(_$TextBlockImpl) then) =
      __$$TextBlockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String type});
}

/// @nodoc
class __$$TextBlockImplCopyWithImpl<$Res>
    extends _$BlockCopyWithImpl<$Res, _$TextBlockImpl>
    implements _$$TextBlockImplCopyWith<$Res> {
  __$$TextBlockImplCopyWithImpl(
      _$TextBlockImpl _value, $Res Function(_$TextBlockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
  }) {
    return _then(_$TextBlockImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextBlockImpl extends TextBlock {
  const _$TextBlockImpl({required this.text, this.type = 'text'}) : super._();

  factory _$TextBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextBlockImplFromJson(json);

  /// The text content.
  @override
  final String text;

  /// The type of content block.
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'Block.text(text: $text, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextBlockImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextBlockImplCopyWith<_$TextBlockImpl> get copyWith =>
      __$$TextBlockImplCopyWithImpl<_$TextBlockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text, String type) text,
    required TResult Function(ImageBlockSource source, String type) image,
    required TResult Function(
            String id, String name, Map<String, dynamic> input, String type)
        toolUse,
    required TResult Function(
            @JsonKey(name: 'tool_use_id') String toolUseId,
            @_ToolResultBlockContentConverter() ToolResultBlockContent content,
            @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
            String type)
        toolResult,
  }) {
    return text(this.text, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text, String type)? text,
    TResult? Function(ImageBlockSource source, String type)? image,
    TResult? Function(
            String id, String name, Map<String, dynamic> input, String type)?
        toolUse,
    TResult? Function(
            @JsonKey(name: 'tool_use_id') String toolUseId,
            @_ToolResultBlockContentConverter() ToolResultBlockContent content,
            @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
            String type)?
        toolResult,
  }) {
    return text?.call(this.text, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text, String type)? text,
    TResult Function(ImageBlockSource source, String type)? image,
    TResult Function(
            String id, String name, Map<String, dynamic> input, String type)?
        toolUse,
    TResult Function(
            @JsonKey(name: 'tool_use_id') String toolUseId,
            @_ToolResultBlockContentConverter() ToolResultBlockContent content,
            @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
            String type)?
        toolResult,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this.text, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextBlock value) text,
    required TResult Function(ImageBlock value) image,
    required TResult Function(ToolUseBlock value) toolUse,
    required TResult Function(ToolResultBlock value) toolResult,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextBlock value)? text,
    TResult? Function(ImageBlock value)? image,
    TResult? Function(ToolUseBlock value)? toolUse,
    TResult? Function(ToolResultBlock value)? toolResult,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextBlock value)? text,
    TResult Function(ImageBlock value)? image,
    TResult Function(ToolUseBlock value)? toolUse,
    TResult Function(ToolResultBlock value)? toolResult,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TextBlockImplToJson(
      this,
    );
  }
}

abstract class TextBlock extends Block {
  const factory TextBlock({required final String text, final String type}) =
      _$TextBlockImpl;
  const TextBlock._() : super._();

  factory TextBlock.fromJson(Map<String, dynamic> json) =
      _$TextBlockImpl.fromJson;

  /// The text content.
  String get text;
  @override

  /// The type of content block.
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$TextBlockImplCopyWith<_$TextBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageBlockImplCopyWith<$Res> implements $BlockCopyWith<$Res> {
  factory _$$ImageBlockImplCopyWith(
          _$ImageBlockImpl value, $Res Function(_$ImageBlockImpl) then) =
      __$$ImageBlockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageBlockSource source, String type});

  $ImageBlockSourceCopyWith<$Res> get source;
}

/// @nodoc
class __$$ImageBlockImplCopyWithImpl<$Res>
    extends _$BlockCopyWithImpl<$Res, _$ImageBlockImpl>
    implements _$$ImageBlockImplCopyWith<$Res> {
  __$$ImageBlockImplCopyWithImpl(
      _$ImageBlockImpl _value, $Res Function(_$ImageBlockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? type = null,
  }) {
    return _then(_$ImageBlockImpl(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ImageBlockSource,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageBlockSourceCopyWith<$Res> get source {
    return $ImageBlockSourceCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageBlockImpl extends ImageBlock {
  const _$ImageBlockImpl({required this.source, this.type = 'image'})
      : super._();

  factory _$ImageBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageBlockImplFromJson(json);

  /// The source of an image block.
  @override
  final ImageBlockSource source;

  /// The type of content block.
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'Block.image(source: $source, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageBlockImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, source, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageBlockImplCopyWith<_$ImageBlockImpl> get copyWith =>
      __$$ImageBlockImplCopyWithImpl<_$ImageBlockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text, String type) text,
    required TResult Function(ImageBlockSource source, String type) image,
    required TResult Function(
            String id, String name, Map<String, dynamic> input, String type)
        toolUse,
    required TResult Function(
            @JsonKey(name: 'tool_use_id') String toolUseId,
            @_ToolResultBlockContentConverter() ToolResultBlockContent content,
            @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
            String type)
        toolResult,
  }) {
    return image(source, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text, String type)? text,
    TResult? Function(ImageBlockSource source, String type)? image,
    TResult? Function(
            String id, String name, Map<String, dynamic> input, String type)?
        toolUse,
    TResult? Function(
            @JsonKey(name: 'tool_use_id') String toolUseId,
            @_ToolResultBlockContentConverter() ToolResultBlockContent content,
            @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
            String type)?
        toolResult,
  }) {
    return image?.call(source, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text, String type)? text,
    TResult Function(ImageBlockSource source, String type)? image,
    TResult Function(
            String id, String name, Map<String, dynamic> input, String type)?
        toolUse,
    TResult Function(
            @JsonKey(name: 'tool_use_id') String toolUseId,
            @_ToolResultBlockContentConverter() ToolResultBlockContent content,
            @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
            String type)?
        toolResult,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(source, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextBlock value) text,
    required TResult Function(ImageBlock value) image,
    required TResult Function(ToolUseBlock value) toolUse,
    required TResult Function(ToolResultBlock value) toolResult,
  }) {
    return image(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextBlock value)? text,
    TResult? Function(ImageBlock value)? image,
    TResult? Function(ToolUseBlock value)? toolUse,
    TResult? Function(ToolResultBlock value)? toolResult,
  }) {
    return image?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextBlock value)? text,
    TResult Function(ImageBlock value)? image,
    TResult Function(ToolUseBlock value)? toolUse,
    TResult Function(ToolResultBlock value)? toolResult,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageBlockImplToJson(
      this,
    );
  }
}

abstract class ImageBlock extends Block {
  const factory ImageBlock(
      {required final ImageBlockSource source,
      final String type}) = _$ImageBlockImpl;
  const ImageBlock._() : super._();

  factory ImageBlock.fromJson(Map<String, dynamic> json) =
      _$ImageBlockImpl.fromJson;

  /// The source of an image block.
  ImageBlockSource get source;
  @override

  /// The type of content block.
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$ImageBlockImplCopyWith<_$ImageBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToolUseBlockImplCopyWith<$Res>
    implements $BlockCopyWith<$Res> {
  factory _$$ToolUseBlockImplCopyWith(
          _$ToolUseBlockImpl value, $Res Function(_$ToolUseBlockImpl) then) =
      __$$ToolUseBlockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, Map<String, dynamic> input, String type});
}

/// @nodoc
class __$$ToolUseBlockImplCopyWithImpl<$Res>
    extends _$BlockCopyWithImpl<$Res, _$ToolUseBlockImpl>
    implements _$$ToolUseBlockImplCopyWith<$Res> {
  __$$ToolUseBlockImplCopyWithImpl(
      _$ToolUseBlockImpl _value, $Res Function(_$ToolUseBlockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? input = null,
    Object? type = null,
  }) {
    return _then(_$ToolUseBlockImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      input: null == input
          ? _value._input
          : input // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolUseBlockImpl extends ToolUseBlock {
  const _$ToolUseBlockImpl(
      {required this.id,
      required this.name,
      required final Map<String, dynamic> input,
      this.type = 'tool_use'})
      : _input = input,
        super._();

  factory _$ToolUseBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToolUseBlockImplFromJson(json);

  /// A unique identifier for this particular tool use block.
  /// This will be used to match up the tool results later.
  @override
  final String id;

  /// The name of the tool being used.
  @override
  final String name;

  /// An object containing the input being passed to the tool, conforming to the tool’s `input_schema`.
  final Map<String, dynamic> _input;

  /// An object containing the input being passed to the tool, conforming to the tool’s `input_schema`.
  @override
  Map<String, dynamic> get input {
    if (_input is EqualUnmodifiableMapView) return _input;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_input);
  }

  /// The type of content block.
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'Block.toolUse(id: $id, name: $name, input: $input, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolUseBlockImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._input, _input) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_input), type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolUseBlockImplCopyWith<_$ToolUseBlockImpl> get copyWith =>
      __$$ToolUseBlockImplCopyWithImpl<_$ToolUseBlockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text, String type) text,
    required TResult Function(ImageBlockSource source, String type) image,
    required TResult Function(
            String id, String name, Map<String, dynamic> input, String type)
        toolUse,
    required TResult Function(
            @JsonKey(name: 'tool_use_id') String toolUseId,
            @_ToolResultBlockContentConverter() ToolResultBlockContent content,
            @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
            String type)
        toolResult,
  }) {
    return toolUse(id, name, input, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text, String type)? text,
    TResult? Function(ImageBlockSource source, String type)? image,
    TResult? Function(
            String id, String name, Map<String, dynamic> input, String type)?
        toolUse,
    TResult? Function(
            @JsonKey(name: 'tool_use_id') String toolUseId,
            @_ToolResultBlockContentConverter() ToolResultBlockContent content,
            @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
            String type)?
        toolResult,
  }) {
    return toolUse?.call(id, name, input, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text, String type)? text,
    TResult Function(ImageBlockSource source, String type)? image,
    TResult Function(
            String id, String name, Map<String, dynamic> input, String type)?
        toolUse,
    TResult Function(
            @JsonKey(name: 'tool_use_id') String toolUseId,
            @_ToolResultBlockContentConverter() ToolResultBlockContent content,
            @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
            String type)?
        toolResult,
    required TResult orElse(),
  }) {
    if (toolUse != null) {
      return toolUse(id, name, input, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextBlock value) text,
    required TResult Function(ImageBlock value) image,
    required TResult Function(ToolUseBlock value) toolUse,
    required TResult Function(ToolResultBlock value) toolResult,
  }) {
    return toolUse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextBlock value)? text,
    TResult? Function(ImageBlock value)? image,
    TResult? Function(ToolUseBlock value)? toolUse,
    TResult? Function(ToolResultBlock value)? toolResult,
  }) {
    return toolUse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextBlock value)? text,
    TResult Function(ImageBlock value)? image,
    TResult Function(ToolUseBlock value)? toolUse,
    TResult Function(ToolResultBlock value)? toolResult,
    required TResult orElse(),
  }) {
    if (toolUse != null) {
      return toolUse(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ToolUseBlockImplToJson(
      this,
    );
  }
}

abstract class ToolUseBlock extends Block {
  const factory ToolUseBlock(
      {required final String id,
      required final String name,
      required final Map<String, dynamic> input,
      final String type}) = _$ToolUseBlockImpl;
  const ToolUseBlock._() : super._();

  factory ToolUseBlock.fromJson(Map<String, dynamic> json) =
      _$ToolUseBlockImpl.fromJson;

  /// A unique identifier for this particular tool use block.
  /// This will be used to match up the tool results later.
  String get id;

  /// The name of the tool being used.
  String get name;

  /// An object containing the input being passed to the tool, conforming to the tool’s `input_schema`.
  Map<String, dynamic> get input;
  @override

  /// The type of content block.
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$ToolUseBlockImplCopyWith<_$ToolUseBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToolResultBlockImplCopyWith<$Res>
    implements $BlockCopyWith<$Res> {
  factory _$$ToolResultBlockImplCopyWith(_$ToolResultBlockImpl value,
          $Res Function(_$ToolResultBlockImpl) then) =
      __$$ToolResultBlockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'tool_use_id') String toolUseId,
      @_ToolResultBlockContentConverter() ToolResultBlockContent content,
      @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
      String type});

  $ToolResultBlockContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$ToolResultBlockImplCopyWithImpl<$Res>
    extends _$BlockCopyWithImpl<$Res, _$ToolResultBlockImpl>
    implements _$$ToolResultBlockImplCopyWith<$Res> {
  __$$ToolResultBlockImplCopyWithImpl(
      _$ToolResultBlockImpl _value, $Res Function(_$ToolResultBlockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toolUseId = null,
    Object? content = null,
    Object? isError = freezed,
    Object? type = null,
  }) {
    return _then(_$ToolResultBlockImpl(
      toolUseId: null == toolUseId
          ? _value.toolUseId
          : toolUseId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ToolResultBlockContent,
      isError: freezed == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ToolResultBlockContentCopyWith<$Res> get content {
    return $ToolResultBlockContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolResultBlockImpl extends ToolResultBlock {
  const _$ToolResultBlockImpl(
      {@JsonKey(name: 'tool_use_id') required this.toolUseId,
      @_ToolResultBlockContentConverter() required this.content,
      @JsonKey(name: 'is_error', includeIfNull: false) this.isError,
      this.type = 'tool_result'})
      : super._();

  factory _$ToolResultBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToolResultBlockImplFromJson(json);

  /// The `id` of the tool use request this is a result for.
  @override
  @JsonKey(name: 'tool_use_id')
  final String toolUseId;

  /// The result of the tool, as a string (e.g. `"content": "15 degrees"`)
  /// or list of nested content blocks (e.g. `"content": [{"type": "text", "text": "15 degrees"}]`).
  /// These content blocks can use the text or image types.
  @override
  @_ToolResultBlockContentConverter()
  final ToolResultBlockContent content;

  /// Set to `true` if the tool execution resulted in an error.
  @override
  @JsonKey(name: 'is_error', includeIfNull: false)
  final bool? isError;

  /// The type of content block.
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'Block.toolResult(toolUseId: $toolUseId, content: $content, isError: $isError, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolResultBlockImpl &&
            (identical(other.toolUseId, toolUseId) ||
                other.toolUseId == toolUseId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, toolUseId, content, isError, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolResultBlockImplCopyWith<_$ToolResultBlockImpl> get copyWith =>
      __$$ToolResultBlockImplCopyWithImpl<_$ToolResultBlockImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text, String type) text,
    required TResult Function(ImageBlockSource source, String type) image,
    required TResult Function(
            String id, String name, Map<String, dynamic> input, String type)
        toolUse,
    required TResult Function(
            @JsonKey(name: 'tool_use_id') String toolUseId,
            @_ToolResultBlockContentConverter() ToolResultBlockContent content,
            @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
            String type)
        toolResult,
  }) {
    return toolResult(toolUseId, content, isError, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text, String type)? text,
    TResult? Function(ImageBlockSource source, String type)? image,
    TResult? Function(
            String id, String name, Map<String, dynamic> input, String type)?
        toolUse,
    TResult? Function(
            @JsonKey(name: 'tool_use_id') String toolUseId,
            @_ToolResultBlockContentConverter() ToolResultBlockContent content,
            @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
            String type)?
        toolResult,
  }) {
    return toolResult?.call(toolUseId, content, isError, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text, String type)? text,
    TResult Function(ImageBlockSource source, String type)? image,
    TResult Function(
            String id, String name, Map<String, dynamic> input, String type)?
        toolUse,
    TResult Function(
            @JsonKey(name: 'tool_use_id') String toolUseId,
            @_ToolResultBlockContentConverter() ToolResultBlockContent content,
            @JsonKey(name: 'is_error', includeIfNull: false) bool? isError,
            String type)?
        toolResult,
    required TResult orElse(),
  }) {
    if (toolResult != null) {
      return toolResult(toolUseId, content, isError, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextBlock value) text,
    required TResult Function(ImageBlock value) image,
    required TResult Function(ToolUseBlock value) toolUse,
    required TResult Function(ToolResultBlock value) toolResult,
  }) {
    return toolResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextBlock value)? text,
    TResult? Function(ImageBlock value)? image,
    TResult? Function(ToolUseBlock value)? toolUse,
    TResult? Function(ToolResultBlock value)? toolResult,
  }) {
    return toolResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextBlock value)? text,
    TResult Function(ImageBlock value)? image,
    TResult Function(ToolUseBlock value)? toolUse,
    TResult Function(ToolResultBlock value)? toolResult,
    required TResult orElse(),
  }) {
    if (toolResult != null) {
      return toolResult(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ToolResultBlockImplToJson(
      this,
    );
  }
}

abstract class ToolResultBlock extends Block {
  const factory ToolResultBlock(
      {@JsonKey(name: 'tool_use_id') required final String toolUseId,
      @_ToolResultBlockContentConverter()
      required final ToolResultBlockContent content,
      @JsonKey(name: 'is_error', includeIfNull: false) final bool? isError,
      final String type}) = _$ToolResultBlockImpl;
  const ToolResultBlock._() : super._();

  factory ToolResultBlock.fromJson(Map<String, dynamic> json) =
      _$ToolResultBlockImpl.fromJson;

  /// The `id` of the tool use request this is a result for.
  @JsonKey(name: 'tool_use_id')
  String get toolUseId;

  /// The result of the tool, as a string (e.g. `"content": "15 degrees"`)
  /// or list of nested content blocks (e.g. `"content": [{"type": "text", "text": "15 degrees"}]`).
  /// These content blocks can use the text or image types.
  @_ToolResultBlockContentConverter()
  ToolResultBlockContent get content;

  /// Set to `true` if the tool execution resulted in an error.
  @JsonKey(name: 'is_error', includeIfNull: false)
  bool? get isError;
  @override

  /// The type of content block.
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$ToolResultBlockImplCopyWith<_$ToolResultBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ToolResultBlockContent _$ToolResultBlockContentFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'blocks':
      return ToolResultBlockContentListBlock.fromJson(json);
    case 'text':
      return ToolResultBlockContentString.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'ToolResultBlockContent',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ToolResultBlockContent {
  Object get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Block> value) blocks,
    required TResult Function(String value) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Block> value)? blocks,
    TResult? Function(String value)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Block> value)? blocks,
    TResult Function(String value)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToolResultBlockContentListBlock value) blocks,
    required TResult Function(ToolResultBlockContentString value) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToolResultBlockContentListBlock value)? blocks,
    TResult? Function(ToolResultBlockContentString value)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToolResultBlockContentListBlock value)? blocks,
    TResult Function(ToolResultBlockContentString value)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolResultBlockContentCopyWith<$Res> {
  factory $ToolResultBlockContentCopyWith(ToolResultBlockContent value,
          $Res Function(ToolResultBlockContent) then) =
      _$ToolResultBlockContentCopyWithImpl<$Res, ToolResultBlockContent>;
}

/// @nodoc
class _$ToolResultBlockContentCopyWithImpl<$Res,
        $Val extends ToolResultBlockContent>
    implements $ToolResultBlockContentCopyWith<$Res> {
  _$ToolResultBlockContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ToolResultBlockContentListBlockImplCopyWith<$Res> {
  factory _$$ToolResultBlockContentListBlockImplCopyWith(
          _$ToolResultBlockContentListBlockImpl value,
          $Res Function(_$ToolResultBlockContentListBlockImpl) then) =
      __$$ToolResultBlockContentListBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Block> value});
}

/// @nodoc
class __$$ToolResultBlockContentListBlockImplCopyWithImpl<$Res>
    extends _$ToolResultBlockContentCopyWithImpl<$Res,
        _$ToolResultBlockContentListBlockImpl>
    implements _$$ToolResultBlockContentListBlockImplCopyWith<$Res> {
  __$$ToolResultBlockContentListBlockImplCopyWithImpl(
      _$ToolResultBlockContentListBlockImpl _value,
      $Res Function(_$ToolResultBlockContentListBlockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ToolResultBlockContentListBlockImpl(
      null == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Block>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolResultBlockContentListBlockImpl
    extends ToolResultBlockContentListBlock {
  const _$ToolResultBlockContentListBlockImpl(final List<Block> value,
      {final String? $type})
      : _value = value,
        $type = $type ?? 'blocks',
        super._();

  factory _$ToolResultBlockContentListBlockImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ToolResultBlockContentListBlockImplFromJson(json);

  final List<Block> _value;
  @override
  List<Block> get value {
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ToolResultBlockContent.blocks(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolResultBlockContentListBlockImpl &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolResultBlockContentListBlockImplCopyWith<
          _$ToolResultBlockContentListBlockImpl>
      get copyWith => __$$ToolResultBlockContentListBlockImplCopyWithImpl<
          _$ToolResultBlockContentListBlockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Block> value) blocks,
    required TResult Function(String value) text,
  }) {
    return blocks(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Block> value)? blocks,
    TResult? Function(String value)? text,
  }) {
    return blocks?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Block> value)? blocks,
    TResult Function(String value)? text,
    required TResult orElse(),
  }) {
    if (blocks != null) {
      return blocks(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToolResultBlockContentListBlock value) blocks,
    required TResult Function(ToolResultBlockContentString value) text,
  }) {
    return blocks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToolResultBlockContentListBlock value)? blocks,
    TResult? Function(ToolResultBlockContentString value)? text,
  }) {
    return blocks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToolResultBlockContentListBlock value)? blocks,
    TResult Function(ToolResultBlockContentString value)? text,
    required TResult orElse(),
  }) {
    if (blocks != null) {
      return blocks(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ToolResultBlockContentListBlockImplToJson(
      this,
    );
  }
}

abstract class ToolResultBlockContentListBlock extends ToolResultBlockContent {
  const factory ToolResultBlockContentListBlock(final List<Block> value) =
      _$ToolResultBlockContentListBlockImpl;
  const ToolResultBlockContentListBlock._() : super._();

  factory ToolResultBlockContentListBlock.fromJson(Map<String, dynamic> json) =
      _$ToolResultBlockContentListBlockImpl.fromJson;

  @override
  List<Block> get value;
  @JsonKey(ignore: true)
  _$$ToolResultBlockContentListBlockImplCopyWith<
          _$ToolResultBlockContentListBlockImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToolResultBlockContentStringImplCopyWith<$Res> {
  factory _$$ToolResultBlockContentStringImplCopyWith(
          _$ToolResultBlockContentStringImpl value,
          $Res Function(_$ToolResultBlockContentStringImpl) then) =
      __$$ToolResultBlockContentStringImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$ToolResultBlockContentStringImplCopyWithImpl<$Res>
    extends _$ToolResultBlockContentCopyWithImpl<$Res,
        _$ToolResultBlockContentStringImpl>
    implements _$$ToolResultBlockContentStringImplCopyWith<$Res> {
  __$$ToolResultBlockContentStringImplCopyWithImpl(
      _$ToolResultBlockContentStringImpl _value,
      $Res Function(_$ToolResultBlockContentStringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ToolResultBlockContentStringImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolResultBlockContentStringImpl extends ToolResultBlockContentString {
  const _$ToolResultBlockContentStringImpl(this.value, {final String? $type})
      : $type = $type ?? 'text',
        super._();

  factory _$ToolResultBlockContentStringImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ToolResultBlockContentStringImplFromJson(json);

  @override
  final String value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ToolResultBlockContent.text(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolResultBlockContentStringImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolResultBlockContentStringImplCopyWith<
          _$ToolResultBlockContentStringImpl>
      get copyWith => __$$ToolResultBlockContentStringImplCopyWithImpl<
          _$ToolResultBlockContentStringImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Block> value) blocks,
    required TResult Function(String value) text,
  }) {
    return text(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Block> value)? blocks,
    TResult? Function(String value)? text,
  }) {
    return text?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Block> value)? blocks,
    TResult Function(String value)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToolResultBlockContentListBlock value) blocks,
    required TResult Function(ToolResultBlockContentString value) text,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToolResultBlockContentListBlock value)? blocks,
    TResult? Function(ToolResultBlockContentString value)? text,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToolResultBlockContentListBlock value)? blocks,
    TResult Function(ToolResultBlockContentString value)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ToolResultBlockContentStringImplToJson(
      this,
    );
  }
}

abstract class ToolResultBlockContentString extends ToolResultBlockContent {
  const factory ToolResultBlockContentString(final String value) =
      _$ToolResultBlockContentStringImpl;
  const ToolResultBlockContentString._() : super._();

  factory ToolResultBlockContentString.fromJson(Map<String, dynamic> json) =
      _$ToolResultBlockContentStringImpl.fromJson;

  @override
  String get value;
  @JsonKey(ignore: true)
  _$$ToolResultBlockContentStringImplCopyWith<
          _$ToolResultBlockContentStringImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MessageStreamEvent _$MessageStreamEventFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'message_start':
      return MessageStartEvent.fromJson(json);
    case 'message_delta':
      return MessageDeltaEvent.fromJson(json);
    case 'message_stop':
      return MessageStopEvent.fromJson(json);
    case 'content_block_start':
      return ContentBlockStartEvent.fromJson(json);
    case 'content_block_delta':
      return ContentBlockDeltaEvent.fromJson(json);
    case 'content_block_stop':
      return ContentBlockStopEvent.fromJson(json);
    case 'ping':
      return PingEvent.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'MessageStreamEvent',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$MessageStreamEvent {
  /// The type of a streaming event.
  MessageStreamEventType get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message, MessageStreamEventType type)
        messageStart,
    required TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)
        messageDelta,
    required TResult Function(MessageStreamEventType type) messageStop,
    required TResult Function(
            @JsonKey(name: 'content_block') Block contentBlock,
            int index,
            MessageStreamEventType type)
        contentBlockStart,
    required TResult Function(
            BlockDelta delta, int index, MessageStreamEventType type)
        contentBlockDelta,
    required TResult Function(int index, MessageStreamEventType type)
        contentBlockStop,
    required TResult Function(MessageStreamEventType type) ping,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult? Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult? Function(MessageStreamEventType type)? messageStop,
    TResult? Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult? Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult? Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult? Function(MessageStreamEventType type)? ping,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult Function(MessageStreamEventType type)? messageStop,
    TResult Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult Function(MessageStreamEventType type)? ping,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStartEvent value) messageStart,
    required TResult Function(MessageDeltaEvent value) messageDelta,
    required TResult Function(MessageStopEvent value) messageStop,
    required TResult Function(ContentBlockStartEvent value) contentBlockStart,
    required TResult Function(ContentBlockDeltaEvent value) contentBlockDelta,
    required TResult Function(ContentBlockStopEvent value) contentBlockStop,
    required TResult Function(PingEvent value) ping,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageStartEvent value)? messageStart,
    TResult? Function(MessageDeltaEvent value)? messageDelta,
    TResult? Function(MessageStopEvent value)? messageStop,
    TResult? Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult? Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult? Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult? Function(PingEvent value)? ping,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStartEvent value)? messageStart,
    TResult Function(MessageDeltaEvent value)? messageDelta,
    TResult Function(MessageStopEvent value)? messageStop,
    TResult Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult Function(PingEvent value)? ping,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageStreamEventCopyWith<MessageStreamEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStreamEventCopyWith<$Res> {
  factory $MessageStreamEventCopyWith(
          MessageStreamEvent value, $Res Function(MessageStreamEvent) then) =
      _$MessageStreamEventCopyWithImpl<$Res, MessageStreamEvent>;
  @useResult
  $Res call({MessageStreamEventType type});
}

/// @nodoc
class _$MessageStreamEventCopyWithImpl<$Res, $Val extends MessageStreamEvent>
    implements $MessageStreamEventCopyWith<$Res> {
  _$MessageStreamEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageStreamEventType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageStartEventImplCopyWith<$Res>
    implements $MessageStreamEventCopyWith<$Res> {
  factory _$$MessageStartEventImplCopyWith(_$MessageStartEventImpl value,
          $Res Function(_$MessageStartEventImpl) then) =
      __$$MessageStartEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Message message, MessageStreamEventType type});

  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$MessageStartEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$MessageStartEventImpl>
    implements _$$MessageStartEventImplCopyWith<$Res> {
  __$$MessageStartEventImplCopyWithImpl(_$MessageStartEventImpl _value,
      $Res Function(_$MessageStartEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
  }) {
    return _then(_$MessageStartEventImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageStreamEventType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res> get message {
    return $MessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageStartEventImpl extends MessageStartEvent {
  const _$MessageStartEventImpl({required this.message, required this.type})
      : super._();

  factory _$MessageStartEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageStartEventImplFromJson(json);

  /// A message in a chat conversation.
  @override
  final Message message;

  /// The type of a streaming event.
  @override
  final MessageStreamEventType type;

  @override
  String toString() {
    return 'MessageStreamEvent.messageStart(message: $message, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageStartEventImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageStartEventImplCopyWith<_$MessageStartEventImpl> get copyWith =>
      __$$MessageStartEventImplCopyWithImpl<_$MessageStartEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message, MessageStreamEventType type)
        messageStart,
    required TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)
        messageDelta,
    required TResult Function(MessageStreamEventType type) messageStop,
    required TResult Function(
            @JsonKey(name: 'content_block') Block contentBlock,
            int index,
            MessageStreamEventType type)
        contentBlockStart,
    required TResult Function(
            BlockDelta delta, int index, MessageStreamEventType type)
        contentBlockDelta,
    required TResult Function(int index, MessageStreamEventType type)
        contentBlockStop,
    required TResult Function(MessageStreamEventType type) ping,
  }) {
    return messageStart(message, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult? Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult? Function(MessageStreamEventType type)? messageStop,
    TResult? Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult? Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult? Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult? Function(MessageStreamEventType type)? ping,
  }) {
    return messageStart?.call(message, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult Function(MessageStreamEventType type)? messageStop,
    TResult Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult Function(MessageStreamEventType type)? ping,
    required TResult orElse(),
  }) {
    if (messageStart != null) {
      return messageStart(message, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStartEvent value) messageStart,
    required TResult Function(MessageDeltaEvent value) messageDelta,
    required TResult Function(MessageStopEvent value) messageStop,
    required TResult Function(ContentBlockStartEvent value) contentBlockStart,
    required TResult Function(ContentBlockDeltaEvent value) contentBlockDelta,
    required TResult Function(ContentBlockStopEvent value) contentBlockStop,
    required TResult Function(PingEvent value) ping,
  }) {
    return messageStart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageStartEvent value)? messageStart,
    TResult? Function(MessageDeltaEvent value)? messageDelta,
    TResult? Function(MessageStopEvent value)? messageStop,
    TResult? Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult? Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult? Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult? Function(PingEvent value)? ping,
  }) {
    return messageStart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStartEvent value)? messageStart,
    TResult Function(MessageDeltaEvent value)? messageDelta,
    TResult Function(MessageStopEvent value)? messageStop,
    TResult Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult Function(PingEvent value)? ping,
    required TResult orElse(),
  }) {
    if (messageStart != null) {
      return messageStart(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageStartEventImplToJson(
      this,
    );
  }
}

abstract class MessageStartEvent extends MessageStreamEvent {
  const factory MessageStartEvent(
      {required final Message message,
      required final MessageStreamEventType type}) = _$MessageStartEventImpl;
  const MessageStartEvent._() : super._();

  factory MessageStartEvent.fromJson(Map<String, dynamic> json) =
      _$MessageStartEventImpl.fromJson;

  /// A message in a chat conversation.
  Message get message;
  @override

  /// The type of a streaming event.
  MessageStreamEventType get type;
  @override
  @JsonKey(ignore: true)
  _$$MessageStartEventImplCopyWith<_$MessageStartEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageDeltaEventImplCopyWith<$Res>
    implements $MessageStreamEventCopyWith<$Res> {
  factory _$$MessageDeltaEventImplCopyWith(_$MessageDeltaEventImpl value,
          $Res Function(_$MessageDeltaEventImpl) then) =
      __$$MessageDeltaEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MessageDelta delta,
      MessageStreamEventType type,
      MessageDeltaUsage usage});

  $MessageDeltaCopyWith<$Res> get delta;
  $MessageDeltaUsageCopyWith<$Res> get usage;
}

/// @nodoc
class __$$MessageDeltaEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$MessageDeltaEventImpl>
    implements _$$MessageDeltaEventImplCopyWith<$Res> {
  __$$MessageDeltaEventImplCopyWithImpl(_$MessageDeltaEventImpl _value,
      $Res Function(_$MessageDeltaEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delta = null,
    Object? type = null,
    Object? usage = null,
  }) {
    return _then(_$MessageDeltaEventImpl(
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as MessageDelta,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageStreamEventType,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as MessageDeltaUsage,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageDeltaCopyWith<$Res> get delta {
    return $MessageDeltaCopyWith<$Res>(_value.delta, (value) {
      return _then(_value.copyWith(delta: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageDeltaUsageCopyWith<$Res> get usage {
    return $MessageDeltaUsageCopyWith<$Res>(_value.usage, (value) {
      return _then(_value.copyWith(usage: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageDeltaEventImpl extends MessageDeltaEvent {
  const _$MessageDeltaEventImpl(
      {required this.delta, required this.type, required this.usage})
      : super._();

  factory _$MessageDeltaEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageDeltaEventImplFromJson(json);

  /// A delta in a streaming message.
  @override
  final MessageDelta delta;

  /// The type of a streaming event.
  @override
  final MessageStreamEventType type;

  /// Billing and rate-limit usage.
  ///
  /// Anthropic's API bills and rate-limits by token counts, as tokens represent the
  /// underlying cost to our systems.
  ///
  /// Under the hood, the API transforms requests into a format suitable for the
  /// model. The model's output then goes through a parsing stage before becoming an
  /// API response. As a result, the token counts in `usage` will not match one-to-one
  /// with the exact visible content of an API request or response.
  ///
  /// For example, `output_tokens` will be non-zero, even for an empty string response
  /// from Claude.
  @override
  final MessageDeltaUsage usage;

  @override
  String toString() {
    return 'MessageStreamEvent.messageDelta(delta: $delta, type: $type, usage: $usage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageDeltaEventImpl &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, delta, type, usage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageDeltaEventImplCopyWith<_$MessageDeltaEventImpl> get copyWith =>
      __$$MessageDeltaEventImplCopyWithImpl<_$MessageDeltaEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message, MessageStreamEventType type)
        messageStart,
    required TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)
        messageDelta,
    required TResult Function(MessageStreamEventType type) messageStop,
    required TResult Function(
            @JsonKey(name: 'content_block') Block contentBlock,
            int index,
            MessageStreamEventType type)
        contentBlockStart,
    required TResult Function(
            BlockDelta delta, int index, MessageStreamEventType type)
        contentBlockDelta,
    required TResult Function(int index, MessageStreamEventType type)
        contentBlockStop,
    required TResult Function(MessageStreamEventType type) ping,
  }) {
    return messageDelta(delta, type, usage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult? Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult? Function(MessageStreamEventType type)? messageStop,
    TResult? Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult? Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult? Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult? Function(MessageStreamEventType type)? ping,
  }) {
    return messageDelta?.call(delta, type, usage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult Function(MessageStreamEventType type)? messageStop,
    TResult Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult Function(MessageStreamEventType type)? ping,
    required TResult orElse(),
  }) {
    if (messageDelta != null) {
      return messageDelta(delta, type, usage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStartEvent value) messageStart,
    required TResult Function(MessageDeltaEvent value) messageDelta,
    required TResult Function(MessageStopEvent value) messageStop,
    required TResult Function(ContentBlockStartEvent value) contentBlockStart,
    required TResult Function(ContentBlockDeltaEvent value) contentBlockDelta,
    required TResult Function(ContentBlockStopEvent value) contentBlockStop,
    required TResult Function(PingEvent value) ping,
  }) {
    return messageDelta(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageStartEvent value)? messageStart,
    TResult? Function(MessageDeltaEvent value)? messageDelta,
    TResult? Function(MessageStopEvent value)? messageStop,
    TResult? Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult? Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult? Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult? Function(PingEvent value)? ping,
  }) {
    return messageDelta?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStartEvent value)? messageStart,
    TResult Function(MessageDeltaEvent value)? messageDelta,
    TResult Function(MessageStopEvent value)? messageStop,
    TResult Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult Function(PingEvent value)? ping,
    required TResult orElse(),
  }) {
    if (messageDelta != null) {
      return messageDelta(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageDeltaEventImplToJson(
      this,
    );
  }
}

abstract class MessageDeltaEvent extends MessageStreamEvent {
  const factory MessageDeltaEvent(
      {required final MessageDelta delta,
      required final MessageStreamEventType type,
      required final MessageDeltaUsage usage}) = _$MessageDeltaEventImpl;
  const MessageDeltaEvent._() : super._();

  factory MessageDeltaEvent.fromJson(Map<String, dynamic> json) =
      _$MessageDeltaEventImpl.fromJson;

  /// A delta in a streaming message.
  MessageDelta get delta;
  @override

  /// The type of a streaming event.
  MessageStreamEventType get type;

  /// Billing and rate-limit usage.
  ///
  /// Anthropic's API bills and rate-limits by token counts, as tokens represent the
  /// underlying cost to our systems.
  ///
  /// Under the hood, the API transforms requests into a format suitable for the
  /// model. The model's output then goes through a parsing stage before becoming an
  /// API response. As a result, the token counts in `usage` will not match one-to-one
  /// with the exact visible content of an API request or response.
  ///
  /// For example, `output_tokens` will be non-zero, even for an empty string response
  /// from Claude.
  MessageDeltaUsage get usage;
  @override
  @JsonKey(ignore: true)
  _$$MessageDeltaEventImplCopyWith<_$MessageDeltaEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageStopEventImplCopyWith<$Res>
    implements $MessageStreamEventCopyWith<$Res> {
  factory _$$MessageStopEventImplCopyWith(_$MessageStopEventImpl value,
          $Res Function(_$MessageStopEventImpl) then) =
      __$$MessageStopEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MessageStreamEventType type});
}

/// @nodoc
class __$$MessageStopEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$MessageStopEventImpl>
    implements _$$MessageStopEventImplCopyWith<$Res> {
  __$$MessageStopEventImplCopyWithImpl(_$MessageStopEventImpl _value,
      $Res Function(_$MessageStopEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$MessageStopEventImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageStreamEventType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageStopEventImpl extends MessageStopEvent {
  const _$MessageStopEventImpl({required this.type}) : super._();

  factory _$MessageStopEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageStopEventImplFromJson(json);

  /// The type of a streaming event.
  @override
  final MessageStreamEventType type;

  @override
  String toString() {
    return 'MessageStreamEvent.messageStop(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageStopEventImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageStopEventImplCopyWith<_$MessageStopEventImpl> get copyWith =>
      __$$MessageStopEventImplCopyWithImpl<_$MessageStopEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message, MessageStreamEventType type)
        messageStart,
    required TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)
        messageDelta,
    required TResult Function(MessageStreamEventType type) messageStop,
    required TResult Function(
            @JsonKey(name: 'content_block') Block contentBlock,
            int index,
            MessageStreamEventType type)
        contentBlockStart,
    required TResult Function(
            BlockDelta delta, int index, MessageStreamEventType type)
        contentBlockDelta,
    required TResult Function(int index, MessageStreamEventType type)
        contentBlockStop,
    required TResult Function(MessageStreamEventType type) ping,
  }) {
    return messageStop(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult? Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult? Function(MessageStreamEventType type)? messageStop,
    TResult? Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult? Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult? Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult? Function(MessageStreamEventType type)? ping,
  }) {
    return messageStop?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult Function(MessageStreamEventType type)? messageStop,
    TResult Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult Function(MessageStreamEventType type)? ping,
    required TResult orElse(),
  }) {
    if (messageStop != null) {
      return messageStop(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStartEvent value) messageStart,
    required TResult Function(MessageDeltaEvent value) messageDelta,
    required TResult Function(MessageStopEvent value) messageStop,
    required TResult Function(ContentBlockStartEvent value) contentBlockStart,
    required TResult Function(ContentBlockDeltaEvent value) contentBlockDelta,
    required TResult Function(ContentBlockStopEvent value) contentBlockStop,
    required TResult Function(PingEvent value) ping,
  }) {
    return messageStop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageStartEvent value)? messageStart,
    TResult? Function(MessageDeltaEvent value)? messageDelta,
    TResult? Function(MessageStopEvent value)? messageStop,
    TResult? Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult? Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult? Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult? Function(PingEvent value)? ping,
  }) {
    return messageStop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStartEvent value)? messageStart,
    TResult Function(MessageDeltaEvent value)? messageDelta,
    TResult Function(MessageStopEvent value)? messageStop,
    TResult Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult Function(PingEvent value)? ping,
    required TResult orElse(),
  }) {
    if (messageStop != null) {
      return messageStop(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageStopEventImplToJson(
      this,
    );
  }
}

abstract class MessageStopEvent extends MessageStreamEvent {
  const factory MessageStopEvent({required final MessageStreamEventType type}) =
      _$MessageStopEventImpl;
  const MessageStopEvent._() : super._();

  factory MessageStopEvent.fromJson(Map<String, dynamic> json) =
      _$MessageStopEventImpl.fromJson;

  @override

  /// The type of a streaming event.
  MessageStreamEventType get type;
  @override
  @JsonKey(ignore: true)
  _$$MessageStopEventImplCopyWith<_$MessageStopEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContentBlockStartEventImplCopyWith<$Res>
    implements $MessageStreamEventCopyWith<$Res> {
  factory _$$ContentBlockStartEventImplCopyWith(
          _$ContentBlockStartEventImpl value,
          $Res Function(_$ContentBlockStartEventImpl) then) =
      __$$ContentBlockStartEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'content_block') Block contentBlock,
      int index,
      MessageStreamEventType type});

  $BlockCopyWith<$Res> get contentBlock;
}

/// @nodoc
class __$$ContentBlockStartEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$ContentBlockStartEventImpl>
    implements _$$ContentBlockStartEventImplCopyWith<$Res> {
  __$$ContentBlockStartEventImplCopyWithImpl(
      _$ContentBlockStartEventImpl _value,
      $Res Function(_$ContentBlockStartEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentBlock = null,
    Object? index = null,
    Object? type = null,
  }) {
    return _then(_$ContentBlockStartEventImpl(
      contentBlock: null == contentBlock
          ? _value.contentBlock
          : contentBlock // ignore: cast_nullable_to_non_nullable
              as Block,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageStreamEventType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BlockCopyWith<$Res> get contentBlock {
    return $BlockCopyWith<$Res>(_value.contentBlock, (value) {
      return _then(_value.copyWith(contentBlock: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentBlockStartEventImpl extends ContentBlockStartEvent {
  const _$ContentBlockStartEventImpl(
      {@JsonKey(name: 'content_block') required this.contentBlock,
      required this.index,
      required this.type})
      : super._();

  factory _$ContentBlockStartEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentBlockStartEventImplFromJson(json);

  /// A block of content in a message.
  /// Any of: [TextBlock], [ImageBlock], [ToolUseBlock], [ToolResultBlock]
  @override
  @JsonKey(name: 'content_block')
  final Block contentBlock;

  /// The index of the content block.
  @override
  final int index;

  /// The type of a streaming event.
  @override
  final MessageStreamEventType type;

  @override
  String toString() {
    return 'MessageStreamEvent.contentBlockStart(contentBlock: $contentBlock, index: $index, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentBlockStartEventImpl &&
            (identical(other.contentBlock, contentBlock) ||
                other.contentBlock == contentBlock) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contentBlock, index, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentBlockStartEventImplCopyWith<_$ContentBlockStartEventImpl>
      get copyWith => __$$ContentBlockStartEventImplCopyWithImpl<
          _$ContentBlockStartEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message, MessageStreamEventType type)
        messageStart,
    required TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)
        messageDelta,
    required TResult Function(MessageStreamEventType type) messageStop,
    required TResult Function(
            @JsonKey(name: 'content_block') Block contentBlock,
            int index,
            MessageStreamEventType type)
        contentBlockStart,
    required TResult Function(
            BlockDelta delta, int index, MessageStreamEventType type)
        contentBlockDelta,
    required TResult Function(int index, MessageStreamEventType type)
        contentBlockStop,
    required TResult Function(MessageStreamEventType type) ping,
  }) {
    return contentBlockStart(contentBlock, index, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult? Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult? Function(MessageStreamEventType type)? messageStop,
    TResult? Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult? Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult? Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult? Function(MessageStreamEventType type)? ping,
  }) {
    return contentBlockStart?.call(contentBlock, index, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult Function(MessageStreamEventType type)? messageStop,
    TResult Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult Function(MessageStreamEventType type)? ping,
    required TResult orElse(),
  }) {
    if (contentBlockStart != null) {
      return contentBlockStart(contentBlock, index, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStartEvent value) messageStart,
    required TResult Function(MessageDeltaEvent value) messageDelta,
    required TResult Function(MessageStopEvent value) messageStop,
    required TResult Function(ContentBlockStartEvent value) contentBlockStart,
    required TResult Function(ContentBlockDeltaEvent value) contentBlockDelta,
    required TResult Function(ContentBlockStopEvent value) contentBlockStop,
    required TResult Function(PingEvent value) ping,
  }) {
    return contentBlockStart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageStartEvent value)? messageStart,
    TResult? Function(MessageDeltaEvent value)? messageDelta,
    TResult? Function(MessageStopEvent value)? messageStop,
    TResult? Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult? Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult? Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult? Function(PingEvent value)? ping,
  }) {
    return contentBlockStart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStartEvent value)? messageStart,
    TResult Function(MessageDeltaEvent value)? messageDelta,
    TResult Function(MessageStopEvent value)? messageStop,
    TResult Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult Function(PingEvent value)? ping,
    required TResult orElse(),
  }) {
    if (contentBlockStart != null) {
      return contentBlockStart(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentBlockStartEventImplToJson(
      this,
    );
  }
}

abstract class ContentBlockStartEvent extends MessageStreamEvent {
  const factory ContentBlockStartEvent(
          {@JsonKey(name: 'content_block') required final Block contentBlock,
          required final int index,
          required final MessageStreamEventType type}) =
      _$ContentBlockStartEventImpl;
  const ContentBlockStartEvent._() : super._();

  factory ContentBlockStartEvent.fromJson(Map<String, dynamic> json) =
      _$ContentBlockStartEventImpl.fromJson;

  /// A block of content in a message.
  /// Any of: [TextBlock], [ImageBlock], [ToolUseBlock], [ToolResultBlock]
  @JsonKey(name: 'content_block')
  Block get contentBlock;

  /// The index of the content block.
  int get index;
  @override

  /// The type of a streaming event.
  MessageStreamEventType get type;
  @override
  @JsonKey(ignore: true)
  _$$ContentBlockStartEventImplCopyWith<_$ContentBlockStartEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContentBlockDeltaEventImplCopyWith<$Res>
    implements $MessageStreamEventCopyWith<$Res> {
  factory _$$ContentBlockDeltaEventImplCopyWith(
          _$ContentBlockDeltaEventImpl value,
          $Res Function(_$ContentBlockDeltaEventImpl) then) =
      __$$ContentBlockDeltaEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BlockDelta delta, int index, MessageStreamEventType type});

  $BlockDeltaCopyWith<$Res> get delta;
}

/// @nodoc
class __$$ContentBlockDeltaEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$ContentBlockDeltaEventImpl>
    implements _$$ContentBlockDeltaEventImplCopyWith<$Res> {
  __$$ContentBlockDeltaEventImplCopyWithImpl(
      _$ContentBlockDeltaEventImpl _value,
      $Res Function(_$ContentBlockDeltaEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delta = null,
    Object? index = null,
    Object? type = null,
  }) {
    return _then(_$ContentBlockDeltaEventImpl(
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as BlockDelta,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageStreamEventType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BlockDeltaCopyWith<$Res> get delta {
    return $BlockDeltaCopyWith<$Res>(_value.delta, (value) {
      return _then(_value.copyWith(delta: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentBlockDeltaEventImpl extends ContentBlockDeltaEvent {
  const _$ContentBlockDeltaEventImpl(
      {required this.delta, required this.index, required this.type})
      : super._();

  factory _$ContentBlockDeltaEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentBlockDeltaEventImplFromJson(json);

  /// A delta in a streaming message.
  /// Any of: [TextBlockDelta], [InputJsonBlockDelta]
  @override
  final BlockDelta delta;

  /// The index of the content block.
  @override
  final int index;

  /// The type of a streaming event.
  @override
  final MessageStreamEventType type;

  @override
  String toString() {
    return 'MessageStreamEvent.contentBlockDelta(delta: $delta, index: $index, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentBlockDeltaEventImpl &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, delta, index, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentBlockDeltaEventImplCopyWith<_$ContentBlockDeltaEventImpl>
      get copyWith => __$$ContentBlockDeltaEventImplCopyWithImpl<
          _$ContentBlockDeltaEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message, MessageStreamEventType type)
        messageStart,
    required TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)
        messageDelta,
    required TResult Function(MessageStreamEventType type) messageStop,
    required TResult Function(
            @JsonKey(name: 'content_block') Block contentBlock,
            int index,
            MessageStreamEventType type)
        contentBlockStart,
    required TResult Function(
            BlockDelta delta, int index, MessageStreamEventType type)
        contentBlockDelta,
    required TResult Function(int index, MessageStreamEventType type)
        contentBlockStop,
    required TResult Function(MessageStreamEventType type) ping,
  }) {
    return contentBlockDelta(delta, index, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult? Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult? Function(MessageStreamEventType type)? messageStop,
    TResult? Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult? Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult? Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult? Function(MessageStreamEventType type)? ping,
  }) {
    return contentBlockDelta?.call(delta, index, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult Function(MessageStreamEventType type)? messageStop,
    TResult Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult Function(MessageStreamEventType type)? ping,
    required TResult orElse(),
  }) {
    if (contentBlockDelta != null) {
      return contentBlockDelta(delta, index, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStartEvent value) messageStart,
    required TResult Function(MessageDeltaEvent value) messageDelta,
    required TResult Function(MessageStopEvent value) messageStop,
    required TResult Function(ContentBlockStartEvent value) contentBlockStart,
    required TResult Function(ContentBlockDeltaEvent value) contentBlockDelta,
    required TResult Function(ContentBlockStopEvent value) contentBlockStop,
    required TResult Function(PingEvent value) ping,
  }) {
    return contentBlockDelta(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageStartEvent value)? messageStart,
    TResult? Function(MessageDeltaEvent value)? messageDelta,
    TResult? Function(MessageStopEvent value)? messageStop,
    TResult? Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult? Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult? Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult? Function(PingEvent value)? ping,
  }) {
    return contentBlockDelta?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStartEvent value)? messageStart,
    TResult Function(MessageDeltaEvent value)? messageDelta,
    TResult Function(MessageStopEvent value)? messageStop,
    TResult Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult Function(PingEvent value)? ping,
    required TResult orElse(),
  }) {
    if (contentBlockDelta != null) {
      return contentBlockDelta(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentBlockDeltaEventImplToJson(
      this,
    );
  }
}

abstract class ContentBlockDeltaEvent extends MessageStreamEvent {
  const factory ContentBlockDeltaEvent(
          {required final BlockDelta delta,
          required final int index,
          required final MessageStreamEventType type}) =
      _$ContentBlockDeltaEventImpl;
  const ContentBlockDeltaEvent._() : super._();

  factory ContentBlockDeltaEvent.fromJson(Map<String, dynamic> json) =
      _$ContentBlockDeltaEventImpl.fromJson;

  /// A delta in a streaming message.
  /// Any of: [TextBlockDelta], [InputJsonBlockDelta]
  BlockDelta get delta;

  /// The index of the content block.
  int get index;
  @override

  /// The type of a streaming event.
  MessageStreamEventType get type;
  @override
  @JsonKey(ignore: true)
  _$$ContentBlockDeltaEventImplCopyWith<_$ContentBlockDeltaEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContentBlockStopEventImplCopyWith<$Res>
    implements $MessageStreamEventCopyWith<$Res> {
  factory _$$ContentBlockStopEventImplCopyWith(
          _$ContentBlockStopEventImpl value,
          $Res Function(_$ContentBlockStopEventImpl) then) =
      __$$ContentBlockStopEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, MessageStreamEventType type});
}

/// @nodoc
class __$$ContentBlockStopEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$ContentBlockStopEventImpl>
    implements _$$ContentBlockStopEventImplCopyWith<$Res> {
  __$$ContentBlockStopEventImplCopyWithImpl(_$ContentBlockStopEventImpl _value,
      $Res Function(_$ContentBlockStopEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? type = null,
  }) {
    return _then(_$ContentBlockStopEventImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageStreamEventType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentBlockStopEventImpl extends ContentBlockStopEvent {
  const _$ContentBlockStopEventImpl({required this.index, required this.type})
      : super._();

  factory _$ContentBlockStopEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentBlockStopEventImplFromJson(json);

  /// The index of the content block.
  @override
  final int index;

  /// The type of a streaming event.
  @override
  final MessageStreamEventType type;

  @override
  String toString() {
    return 'MessageStreamEvent.contentBlockStop(index: $index, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentBlockStopEventImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentBlockStopEventImplCopyWith<_$ContentBlockStopEventImpl>
      get copyWith => __$$ContentBlockStopEventImplCopyWithImpl<
          _$ContentBlockStopEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message, MessageStreamEventType type)
        messageStart,
    required TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)
        messageDelta,
    required TResult Function(MessageStreamEventType type) messageStop,
    required TResult Function(
            @JsonKey(name: 'content_block') Block contentBlock,
            int index,
            MessageStreamEventType type)
        contentBlockStart,
    required TResult Function(
            BlockDelta delta, int index, MessageStreamEventType type)
        contentBlockDelta,
    required TResult Function(int index, MessageStreamEventType type)
        contentBlockStop,
    required TResult Function(MessageStreamEventType type) ping,
  }) {
    return contentBlockStop(index, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult? Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult? Function(MessageStreamEventType type)? messageStop,
    TResult? Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult? Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult? Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult? Function(MessageStreamEventType type)? ping,
  }) {
    return contentBlockStop?.call(index, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult Function(MessageStreamEventType type)? messageStop,
    TResult Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult Function(MessageStreamEventType type)? ping,
    required TResult orElse(),
  }) {
    if (contentBlockStop != null) {
      return contentBlockStop(index, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStartEvent value) messageStart,
    required TResult Function(MessageDeltaEvent value) messageDelta,
    required TResult Function(MessageStopEvent value) messageStop,
    required TResult Function(ContentBlockStartEvent value) contentBlockStart,
    required TResult Function(ContentBlockDeltaEvent value) contentBlockDelta,
    required TResult Function(ContentBlockStopEvent value) contentBlockStop,
    required TResult Function(PingEvent value) ping,
  }) {
    return contentBlockStop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageStartEvent value)? messageStart,
    TResult? Function(MessageDeltaEvent value)? messageDelta,
    TResult? Function(MessageStopEvent value)? messageStop,
    TResult? Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult? Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult? Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult? Function(PingEvent value)? ping,
  }) {
    return contentBlockStop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStartEvent value)? messageStart,
    TResult Function(MessageDeltaEvent value)? messageDelta,
    TResult Function(MessageStopEvent value)? messageStop,
    TResult Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult Function(PingEvent value)? ping,
    required TResult orElse(),
  }) {
    if (contentBlockStop != null) {
      return contentBlockStop(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentBlockStopEventImplToJson(
      this,
    );
  }
}

abstract class ContentBlockStopEvent extends MessageStreamEvent {
  const factory ContentBlockStopEvent(
          {required final int index,
          required final MessageStreamEventType type}) =
      _$ContentBlockStopEventImpl;
  const ContentBlockStopEvent._() : super._();

  factory ContentBlockStopEvent.fromJson(Map<String, dynamic> json) =
      _$ContentBlockStopEventImpl.fromJson;

  /// The index of the content block.
  int get index;
  @override

  /// The type of a streaming event.
  MessageStreamEventType get type;
  @override
  @JsonKey(ignore: true)
  _$$ContentBlockStopEventImplCopyWith<_$ContentBlockStopEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PingEventImplCopyWith<$Res>
    implements $MessageStreamEventCopyWith<$Res> {
  factory _$$PingEventImplCopyWith(
          _$PingEventImpl value, $Res Function(_$PingEventImpl) then) =
      __$$PingEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MessageStreamEventType type});
}

/// @nodoc
class __$$PingEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$PingEventImpl>
    implements _$$PingEventImplCopyWith<$Res> {
  __$$PingEventImplCopyWithImpl(
      _$PingEventImpl _value, $Res Function(_$PingEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$PingEventImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageStreamEventType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PingEventImpl extends PingEvent {
  const _$PingEventImpl({required this.type}) : super._();

  factory _$PingEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$PingEventImplFromJson(json);

  /// The type of a streaming event.
  @override
  final MessageStreamEventType type;

  @override
  String toString() {
    return 'MessageStreamEvent.ping(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PingEventImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PingEventImplCopyWith<_$PingEventImpl> get copyWith =>
      __$$PingEventImplCopyWithImpl<_$PingEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message, MessageStreamEventType type)
        messageStart,
    required TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)
        messageDelta,
    required TResult Function(MessageStreamEventType type) messageStop,
    required TResult Function(
            @JsonKey(name: 'content_block') Block contentBlock,
            int index,
            MessageStreamEventType type)
        contentBlockStart,
    required TResult Function(
            BlockDelta delta, int index, MessageStreamEventType type)
        contentBlockDelta,
    required TResult Function(int index, MessageStreamEventType type)
        contentBlockStop,
    required TResult Function(MessageStreamEventType type) ping,
  }) {
    return ping(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult? Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult? Function(MessageStreamEventType type)? messageStop,
    TResult? Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult? Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult? Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult? Function(MessageStreamEventType type)? ping,
  }) {
    return ping?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message, MessageStreamEventType type)?
        messageStart,
    TResult Function(MessageDelta delta, MessageStreamEventType type,
            MessageDeltaUsage usage)?
        messageDelta,
    TResult Function(MessageStreamEventType type)? messageStop,
    TResult Function(@JsonKey(name: 'content_block') Block contentBlock,
            int index, MessageStreamEventType type)?
        contentBlockStart,
    TResult Function(BlockDelta delta, int index, MessageStreamEventType type)?
        contentBlockDelta,
    TResult Function(int index, MessageStreamEventType type)? contentBlockStop,
    TResult Function(MessageStreamEventType type)? ping,
    required TResult orElse(),
  }) {
    if (ping != null) {
      return ping(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStartEvent value) messageStart,
    required TResult Function(MessageDeltaEvent value) messageDelta,
    required TResult Function(MessageStopEvent value) messageStop,
    required TResult Function(ContentBlockStartEvent value) contentBlockStart,
    required TResult Function(ContentBlockDeltaEvent value) contentBlockDelta,
    required TResult Function(ContentBlockStopEvent value) contentBlockStop,
    required TResult Function(PingEvent value) ping,
  }) {
    return ping(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageStartEvent value)? messageStart,
    TResult? Function(MessageDeltaEvent value)? messageDelta,
    TResult? Function(MessageStopEvent value)? messageStop,
    TResult? Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult? Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult? Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult? Function(PingEvent value)? ping,
  }) {
    return ping?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStartEvent value)? messageStart,
    TResult Function(MessageDeltaEvent value)? messageDelta,
    TResult Function(MessageStopEvent value)? messageStop,
    TResult Function(ContentBlockStartEvent value)? contentBlockStart,
    TResult Function(ContentBlockDeltaEvent value)? contentBlockDelta,
    TResult Function(ContentBlockStopEvent value)? contentBlockStop,
    TResult Function(PingEvent value)? ping,
    required TResult orElse(),
  }) {
    if (ping != null) {
      return ping(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PingEventImplToJson(
      this,
    );
  }
}

abstract class PingEvent extends MessageStreamEvent {
  const factory PingEvent({required final MessageStreamEventType type}) =
      _$PingEventImpl;
  const PingEvent._() : super._();

  factory PingEvent.fromJson(Map<String, dynamic> json) =
      _$PingEventImpl.fromJson;

  @override

  /// The type of a streaming event.
  MessageStreamEventType get type;
  @override
  @JsonKey(ignore: true)
  _$$PingEventImplCopyWith<_$PingEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BlockDelta _$BlockDeltaFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'text_delta':
      return TextBlockDelta.fromJson(json);
    case 'input_json_delta':
      return InputJsonBlockDelta.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'BlockDelta', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$BlockDelta {
  /// The type of content block.
  String get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text, String type) textDelta,
    required TResult Function(
            @JsonKey(name: 'partial_json', includeIfNull: false)
            String? partialJson,
            String type)
        inputJsonDelta,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text, String type)? textDelta,
    TResult? Function(
            @JsonKey(name: 'partial_json', includeIfNull: false)
            String? partialJson,
            String type)?
        inputJsonDelta,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text, String type)? textDelta,
    TResult Function(
            @JsonKey(name: 'partial_json', includeIfNull: false)
            String? partialJson,
            String type)?
        inputJsonDelta,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextBlockDelta value) textDelta,
    required TResult Function(InputJsonBlockDelta value) inputJsonDelta,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextBlockDelta value)? textDelta,
    TResult? Function(InputJsonBlockDelta value)? inputJsonDelta,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextBlockDelta value)? textDelta,
    TResult Function(InputJsonBlockDelta value)? inputJsonDelta,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockDeltaCopyWith<BlockDelta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockDeltaCopyWith<$Res> {
  factory $BlockDeltaCopyWith(
          BlockDelta value, $Res Function(BlockDelta) then) =
      _$BlockDeltaCopyWithImpl<$Res, BlockDelta>;
  @useResult
  $Res call({String type});
}

/// @nodoc
class _$BlockDeltaCopyWithImpl<$Res, $Val extends BlockDelta>
    implements $BlockDeltaCopyWith<$Res> {
  _$BlockDeltaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextBlockDeltaImplCopyWith<$Res>
    implements $BlockDeltaCopyWith<$Res> {
  factory _$$TextBlockDeltaImplCopyWith(_$TextBlockDeltaImpl value,
          $Res Function(_$TextBlockDeltaImpl) then) =
      __$$TextBlockDeltaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String type});
}

/// @nodoc
class __$$TextBlockDeltaImplCopyWithImpl<$Res>
    extends _$BlockDeltaCopyWithImpl<$Res, _$TextBlockDeltaImpl>
    implements _$$TextBlockDeltaImplCopyWith<$Res> {
  __$$TextBlockDeltaImplCopyWithImpl(
      _$TextBlockDeltaImpl _value, $Res Function(_$TextBlockDeltaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
  }) {
    return _then(_$TextBlockDeltaImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextBlockDeltaImpl extends TextBlockDelta {
  const _$TextBlockDeltaImpl({required this.text, required this.type})
      : super._();

  factory _$TextBlockDeltaImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextBlockDeltaImplFromJson(json);

  /// The text delta.
  @override
  final String text;

  /// The type of content block.
  @override
  final String type;

  @override
  String toString() {
    return 'BlockDelta.textDelta(text: $text, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextBlockDeltaImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextBlockDeltaImplCopyWith<_$TextBlockDeltaImpl> get copyWith =>
      __$$TextBlockDeltaImplCopyWithImpl<_$TextBlockDeltaImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text, String type) textDelta,
    required TResult Function(
            @JsonKey(name: 'partial_json', includeIfNull: false)
            String? partialJson,
            String type)
        inputJsonDelta,
  }) {
    return textDelta(text, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text, String type)? textDelta,
    TResult? Function(
            @JsonKey(name: 'partial_json', includeIfNull: false)
            String? partialJson,
            String type)?
        inputJsonDelta,
  }) {
    return textDelta?.call(text, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text, String type)? textDelta,
    TResult Function(
            @JsonKey(name: 'partial_json', includeIfNull: false)
            String? partialJson,
            String type)?
        inputJsonDelta,
    required TResult orElse(),
  }) {
    if (textDelta != null) {
      return textDelta(text, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextBlockDelta value) textDelta,
    required TResult Function(InputJsonBlockDelta value) inputJsonDelta,
  }) {
    return textDelta(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextBlockDelta value)? textDelta,
    TResult? Function(InputJsonBlockDelta value)? inputJsonDelta,
  }) {
    return textDelta?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextBlockDelta value)? textDelta,
    TResult Function(InputJsonBlockDelta value)? inputJsonDelta,
    required TResult orElse(),
  }) {
    if (textDelta != null) {
      return textDelta(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TextBlockDeltaImplToJson(
      this,
    );
  }
}

abstract class TextBlockDelta extends BlockDelta {
  const factory TextBlockDelta(
      {required final String text,
      required final String type}) = _$TextBlockDeltaImpl;
  const TextBlockDelta._() : super._();

  factory TextBlockDelta.fromJson(Map<String, dynamic> json) =
      _$TextBlockDeltaImpl.fromJson;

  /// The text delta.
  String get text;
  @override

  /// The type of content block.
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$TextBlockDeltaImplCopyWith<_$TextBlockDeltaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InputJsonBlockDeltaImplCopyWith<$Res>
    implements $BlockDeltaCopyWith<$Res> {
  factory _$$InputJsonBlockDeltaImplCopyWith(_$InputJsonBlockDeltaImpl value,
          $Res Function(_$InputJsonBlockDeltaImpl) then) =
      __$$InputJsonBlockDeltaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'partial_json', includeIfNull: false) String? partialJson,
      String type});
}

/// @nodoc
class __$$InputJsonBlockDeltaImplCopyWithImpl<$Res>
    extends _$BlockDeltaCopyWithImpl<$Res, _$InputJsonBlockDeltaImpl>
    implements _$$InputJsonBlockDeltaImplCopyWith<$Res> {
  __$$InputJsonBlockDeltaImplCopyWithImpl(_$InputJsonBlockDeltaImpl _value,
      $Res Function(_$InputJsonBlockDeltaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partialJson = freezed,
    Object? type = null,
  }) {
    return _then(_$InputJsonBlockDeltaImpl(
      partialJson: freezed == partialJson
          ? _value.partialJson
          : partialJson // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InputJsonBlockDeltaImpl extends InputJsonBlockDelta {
  const _$InputJsonBlockDeltaImpl(
      {@JsonKey(name: 'partial_json', includeIfNull: false) this.partialJson,
      required this.type})
      : super._();

  factory _$InputJsonBlockDeltaImpl.fromJson(Map<String, dynamic> json) =>
      _$$InputJsonBlockDeltaImplFromJson(json);

  /// The partial JSON delta.
  @override
  @JsonKey(name: 'partial_json', includeIfNull: false)
  final String? partialJson;

  /// The type of content block.
  @override
  final String type;

  @override
  String toString() {
    return 'BlockDelta.inputJsonDelta(partialJson: $partialJson, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputJsonBlockDeltaImpl &&
            (identical(other.partialJson, partialJson) ||
                other.partialJson == partialJson) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, partialJson, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InputJsonBlockDeltaImplCopyWith<_$InputJsonBlockDeltaImpl> get copyWith =>
      __$$InputJsonBlockDeltaImplCopyWithImpl<_$InputJsonBlockDeltaImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text, String type) textDelta,
    required TResult Function(
            @JsonKey(name: 'partial_json', includeIfNull: false)
            String? partialJson,
            String type)
        inputJsonDelta,
  }) {
    return inputJsonDelta(partialJson, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text, String type)? textDelta,
    TResult? Function(
            @JsonKey(name: 'partial_json', includeIfNull: false)
            String? partialJson,
            String type)?
        inputJsonDelta,
  }) {
    return inputJsonDelta?.call(partialJson, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text, String type)? textDelta,
    TResult Function(
            @JsonKey(name: 'partial_json', includeIfNull: false)
            String? partialJson,
            String type)?
        inputJsonDelta,
    required TResult orElse(),
  }) {
    if (inputJsonDelta != null) {
      return inputJsonDelta(partialJson, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextBlockDelta value) textDelta,
    required TResult Function(InputJsonBlockDelta value) inputJsonDelta,
  }) {
    return inputJsonDelta(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextBlockDelta value)? textDelta,
    TResult? Function(InputJsonBlockDelta value)? inputJsonDelta,
  }) {
    return inputJsonDelta?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextBlockDelta value)? textDelta,
    TResult Function(InputJsonBlockDelta value)? inputJsonDelta,
    required TResult orElse(),
  }) {
    if (inputJsonDelta != null) {
      return inputJsonDelta(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InputJsonBlockDeltaImplToJson(
      this,
    );
  }
}

abstract class InputJsonBlockDelta extends BlockDelta {
  const factory InputJsonBlockDelta(
      {@JsonKey(name: 'partial_json', includeIfNull: false)
      final String? partialJson,
      required final String type}) = _$InputJsonBlockDeltaImpl;
  const InputJsonBlockDelta._() : super._();

  factory InputJsonBlockDelta.fromJson(Map<String, dynamic> json) =
      _$InputJsonBlockDeltaImpl.fromJson;

  /// The partial JSON delta.
  @JsonKey(name: 'partial_json', includeIfNull: false)
  String? get partialJson;
  @override

  /// The type of content block.
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$InputJsonBlockDeltaImplCopyWith<_$InputJsonBlockDeltaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
