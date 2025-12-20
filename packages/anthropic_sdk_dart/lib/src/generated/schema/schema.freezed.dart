// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateMessageRequest {

/// The model that will complete your prompt.
///
/// See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
/// details and options.
@_ModelConverter() Model get model;/// Input messages.
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
 List<Message> get messages;/// The maximum number of tokens to generate before stopping.
///
/// Note that our models may stop _before_ reaching this maximum. This parameter
/// only specifies the absolute maximum number of tokens to generate.
///
/// Different models have different maximum values for this parameter. See
/// [models](https://docs.anthropic.com/en/docs/models-overview) for details.
@JsonKey(name: 'max_tokens') int get maxTokens;/// An object describing metadata about the request.
@JsonKey(includeIfNull: false) CreateMessageRequestMetadata? get metadata;/// Custom text sequences that will cause the model to stop generating.
///
/// Our models will normally stop when they have naturally completed their turn,
/// which will result in a response `stop_reason` of `"end_turn"`.
///
/// If you want the model to stop generating when it encounters custom strings of
/// text, you can use the `stop_sequences` parameter. If the model encounters one of
/// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
/// and the response `stop_sequence` value will contain the matched stop sequence.
@JsonKey(name: 'stop_sequences', includeIfNull: false) List<String>? get stopSequences;/// System prompt.
///
/// A system prompt is a way of providing context and instructions to Claude, such
/// as specifying a particular goal or role. See our
/// [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
@_CreateMessageRequestSystemConverter()@JsonKey(includeIfNull: false) CreateMessageRequestSystem? get system;/// Amount of randomness injected into the response.
///
/// Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
/// for analytical / multiple choice, and closer to `1.0` for creative and
/// generative tasks.
///
/// Note that even with `temperature` of `0.0`, the results will not be fully
/// deterministic.
@JsonKey(includeIfNull: false) double? get temperature;/// How the model should use the provided tools. The model can use a specific tool,
/// any available tool, or decide by itself.
///
/// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
/// - `any`: tells Claude that it must use one of the provided tools, but doesn’t force a particular tool.
/// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
@JsonKey(name: 'tool_choice', includeIfNull: false) ToolChoice? get toolChoice;/// Definitions of tools that the model may use.
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
@JsonKey(includeIfNull: false) List<Tool>? get tools;/// Only sample from the top K options for each subsequent token.
///
/// Used to remove "long tail" low probability responses.
/// [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
///
/// Recommended for advanced use cases only. You usually only need to use
/// `temperature`.
@JsonKey(name: 'top_k', includeIfNull: false) int? get topK;/// Use nucleus sampling.
///
/// In nucleus sampling, we compute the cumulative distribution over all the options
/// for each subsequent token in decreasing probability order and cut it off once it
/// reaches a particular probability specified by `top_p`. You should either alter
/// `temperature` or `top_p`, but not both.
///
/// Recommended for advanced use cases only. You usually only need to use
/// `temperature`.
@JsonKey(name: 'top_p', includeIfNull: false) double? get topP;/// Whether to incrementally stream the response using server-sent events.
///
/// See [streaming](https://docs.anthropic.com/en/api/messages-streaming) for
/// details.
 bool get stream;/// Configuration for enabling Claude's extended thinking. When enabled, responses
/// include `thinking` content blocks showing Claude's thinking process before the
/// final answer. Requires a minimum budget of 1,024 tokens and counts towards your
/// `max_tokens` limit.
/// Any of: [ThinkingConfigEnabled], [ThinkingConfigDisabled]
@JsonKey(includeIfNull: false) ThinkingConfig? get thinking;
/// Create a copy of CreateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateMessageRequestCopyWith<CreateMessageRequest> get copyWith => _$CreateMessageRequestCopyWithImpl<CreateMessageRequest>(this as CreateMessageRequest, _$identity);

  /// Serializes this CreateMessageRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateMessageRequest&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.maxTokens, maxTokens) || other.maxTokens == maxTokens)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.stopSequences, stopSequences)&&(identical(other.system, system) || other.system == system)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.toolChoice, toolChoice) || other.toolChoice == toolChoice)&&const DeepCollectionEquality().equals(other.tools, tools)&&(identical(other.topK, topK) || other.topK == topK)&&(identical(other.topP, topP) || other.topP == topP)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.thinking, thinking) || other.thinking == thinking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,const DeepCollectionEquality().hash(messages),maxTokens,metadata,const DeepCollectionEquality().hash(stopSequences),system,temperature,toolChoice,const DeepCollectionEquality().hash(tools),topK,topP,stream,thinking);

@override
String toString() {
  return 'CreateMessageRequest(model: $model, messages: $messages, maxTokens: $maxTokens, metadata: $metadata, stopSequences: $stopSequences, system: $system, temperature: $temperature, toolChoice: $toolChoice, tools: $tools, topK: $topK, topP: $topP, stream: $stream, thinking: $thinking)';
}


}

/// @nodoc
abstract mixin class $CreateMessageRequestCopyWith<$Res>  {
  factory $CreateMessageRequestCopyWith(CreateMessageRequest value, $Res Function(CreateMessageRequest) _then) = _$CreateMessageRequestCopyWithImpl;
@useResult
$Res call({
@_ModelConverter() Model model, List<Message> messages,@JsonKey(name: 'max_tokens') int maxTokens,@JsonKey(includeIfNull: false) CreateMessageRequestMetadata? metadata,@JsonKey(name: 'stop_sequences', includeIfNull: false) List<String>? stopSequences,@_CreateMessageRequestSystemConverter()@JsonKey(includeIfNull: false) CreateMessageRequestSystem? system,@JsonKey(includeIfNull: false) double? temperature,@JsonKey(name: 'tool_choice', includeIfNull: false) ToolChoice? toolChoice,@JsonKey(includeIfNull: false) List<Tool>? tools,@JsonKey(name: 'top_k', includeIfNull: false) int? topK,@JsonKey(name: 'top_p', includeIfNull: false) double? topP, bool stream,@JsonKey(includeIfNull: false) ThinkingConfig? thinking
});


$ModelCopyWith<$Res> get model;$CreateMessageRequestMetadataCopyWith<$Res>? get metadata;$CreateMessageRequestSystemCopyWith<$Res>? get system;$ToolChoiceCopyWith<$Res>? get toolChoice;$ThinkingConfigCopyWith<$Res>? get thinking;

}
/// @nodoc
class _$CreateMessageRequestCopyWithImpl<$Res>
    implements $CreateMessageRequestCopyWith<$Res> {
  _$CreateMessageRequestCopyWithImpl(this._self, this._then);

  final CreateMessageRequest _self;
  final $Res Function(CreateMessageRequest) _then;

/// Create a copy of CreateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? messages = null,Object? maxTokens = null,Object? metadata = freezed,Object? stopSequences = freezed,Object? system = freezed,Object? temperature = freezed,Object? toolChoice = freezed,Object? tools = freezed,Object? topK = freezed,Object? topP = freezed,Object? stream = null,Object? thinking = freezed,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as Model,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,maxTokens: null == maxTokens ? _self.maxTokens : maxTokens // ignore: cast_nullable_to_non_nullable
as int,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as CreateMessageRequestMetadata?,stopSequences: freezed == stopSequences ? _self.stopSequences : stopSequences // ignore: cast_nullable_to_non_nullable
as List<String>?,system: freezed == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as CreateMessageRequestSystem?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,toolChoice: freezed == toolChoice ? _self.toolChoice : toolChoice // ignore: cast_nullable_to_non_nullable
as ToolChoice?,tools: freezed == tools ? _self.tools : tools // ignore: cast_nullable_to_non_nullable
as List<Tool>?,topK: freezed == topK ? _self.topK : topK // ignore: cast_nullable_to_non_nullable
as int?,topP: freezed == topP ? _self.topP : topP // ignore: cast_nullable_to_non_nullable
as double?,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,thinking: freezed == thinking ? _self.thinking : thinking // ignore: cast_nullable_to_non_nullable
as ThinkingConfig?,
  ));
}
/// Create a copy of CreateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelCopyWith<$Res> get model {
  
  return $ModelCopyWith<$Res>(_self.model, (value) {
    return _then(_self.copyWith(model: value));
  });
}/// Create a copy of CreateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateMessageRequestMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $CreateMessageRequestMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of CreateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateMessageRequestSystemCopyWith<$Res>? get system {
    if (_self.system == null) {
    return null;
  }

  return $CreateMessageRequestSystemCopyWith<$Res>(_self.system!, (value) {
    return _then(_self.copyWith(system: value));
  });
}/// Create a copy of CreateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolChoiceCopyWith<$Res>? get toolChoice {
    if (_self.toolChoice == null) {
    return null;
  }

  return $ToolChoiceCopyWith<$Res>(_self.toolChoice!, (value) {
    return _then(_self.copyWith(toolChoice: value));
  });
}/// Create a copy of CreateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThinkingConfigCopyWith<$Res>? get thinking {
    if (_self.thinking == null) {
    return null;
  }

  return $ThinkingConfigCopyWith<$Res>(_self.thinking!, (value) {
    return _then(_self.copyWith(thinking: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateMessageRequest].
extension CreateMessageRequestPatterns on CreateMessageRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateMessageRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateMessageRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateMessageRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateMessageRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateMessageRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateMessageRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@_ModelConverter()  Model model,  List<Message> messages, @JsonKey(name: 'max_tokens')  int maxTokens, @JsonKey(includeIfNull: false)  CreateMessageRequestMetadata? metadata, @JsonKey(name: 'stop_sequences', includeIfNull: false)  List<String>? stopSequences, @_CreateMessageRequestSystemConverter()@JsonKey(includeIfNull: false)  CreateMessageRequestSystem? system, @JsonKey(includeIfNull: false)  double? temperature, @JsonKey(name: 'tool_choice', includeIfNull: false)  ToolChoice? toolChoice, @JsonKey(includeIfNull: false)  List<Tool>? tools, @JsonKey(name: 'top_k', includeIfNull: false)  int? topK, @JsonKey(name: 'top_p', includeIfNull: false)  double? topP,  bool stream, @JsonKey(includeIfNull: false)  ThinkingConfig? thinking)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateMessageRequest() when $default != null:
return $default(_that.model,_that.messages,_that.maxTokens,_that.metadata,_that.stopSequences,_that.system,_that.temperature,_that.toolChoice,_that.tools,_that.topK,_that.topP,_that.stream,_that.thinking);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@_ModelConverter()  Model model,  List<Message> messages, @JsonKey(name: 'max_tokens')  int maxTokens, @JsonKey(includeIfNull: false)  CreateMessageRequestMetadata? metadata, @JsonKey(name: 'stop_sequences', includeIfNull: false)  List<String>? stopSequences, @_CreateMessageRequestSystemConverter()@JsonKey(includeIfNull: false)  CreateMessageRequestSystem? system, @JsonKey(includeIfNull: false)  double? temperature, @JsonKey(name: 'tool_choice', includeIfNull: false)  ToolChoice? toolChoice, @JsonKey(includeIfNull: false)  List<Tool>? tools, @JsonKey(name: 'top_k', includeIfNull: false)  int? topK, @JsonKey(name: 'top_p', includeIfNull: false)  double? topP,  bool stream, @JsonKey(includeIfNull: false)  ThinkingConfig? thinking)  $default,) {final _that = this;
switch (_that) {
case _CreateMessageRequest():
return $default(_that.model,_that.messages,_that.maxTokens,_that.metadata,_that.stopSequences,_that.system,_that.temperature,_that.toolChoice,_that.tools,_that.topK,_that.topP,_that.stream,_that.thinking);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@_ModelConverter()  Model model,  List<Message> messages, @JsonKey(name: 'max_tokens')  int maxTokens, @JsonKey(includeIfNull: false)  CreateMessageRequestMetadata? metadata, @JsonKey(name: 'stop_sequences', includeIfNull: false)  List<String>? stopSequences, @_CreateMessageRequestSystemConverter()@JsonKey(includeIfNull: false)  CreateMessageRequestSystem? system, @JsonKey(includeIfNull: false)  double? temperature, @JsonKey(name: 'tool_choice', includeIfNull: false)  ToolChoice? toolChoice, @JsonKey(includeIfNull: false)  List<Tool>? tools, @JsonKey(name: 'top_k', includeIfNull: false)  int? topK, @JsonKey(name: 'top_p', includeIfNull: false)  double? topP,  bool stream, @JsonKey(includeIfNull: false)  ThinkingConfig? thinking)?  $default,) {final _that = this;
switch (_that) {
case _CreateMessageRequest() when $default != null:
return $default(_that.model,_that.messages,_that.maxTokens,_that.metadata,_that.stopSequences,_that.system,_that.temperature,_that.toolChoice,_that.tools,_that.topK,_that.topP,_that.stream,_that.thinking);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateMessageRequest extends CreateMessageRequest {
  const _CreateMessageRequest({@_ModelConverter() required this.model, required final  List<Message> messages, @JsonKey(name: 'max_tokens') required this.maxTokens, @JsonKey(includeIfNull: false) this.metadata, @JsonKey(name: 'stop_sequences', includeIfNull: false) final  List<String>? stopSequences, @_CreateMessageRequestSystemConverter()@JsonKey(includeIfNull: false) this.system, @JsonKey(includeIfNull: false) this.temperature, @JsonKey(name: 'tool_choice', includeIfNull: false) this.toolChoice, @JsonKey(includeIfNull: false) final  List<Tool>? tools, @JsonKey(name: 'top_k', includeIfNull: false) this.topK, @JsonKey(name: 'top_p', includeIfNull: false) this.topP, this.stream = false, @JsonKey(includeIfNull: false) this.thinking}): _messages = messages,_stopSequences = stopSequences,_tools = tools,super._();
  factory _CreateMessageRequest.fromJson(Map<String, dynamic> json) => _$CreateMessageRequestFromJson(json);

/// The model that will complete your prompt.
///
/// See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
/// details and options.
@override@_ModelConverter() final  Model model;
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
 final  List<Message> _messages;
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
@override List<Message> get messages {
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
@override@JsonKey(name: 'max_tokens') final  int maxTokens;
/// An object describing metadata about the request.
@override@JsonKey(includeIfNull: false) final  CreateMessageRequestMetadata? metadata;
/// Custom text sequences that will cause the model to stop generating.
///
/// Our models will normally stop when they have naturally completed their turn,
/// which will result in a response `stop_reason` of `"end_turn"`.
///
/// If you want the model to stop generating when it encounters custom strings of
/// text, you can use the `stop_sequences` parameter. If the model encounters one of
/// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
/// and the response `stop_sequence` value will contain the matched stop sequence.
 final  List<String>? _stopSequences;
/// Custom text sequences that will cause the model to stop generating.
///
/// Our models will normally stop when they have naturally completed their turn,
/// which will result in a response `stop_reason` of `"end_turn"`.
///
/// If you want the model to stop generating when it encounters custom strings of
/// text, you can use the `stop_sequences` parameter. If the model encounters one of
/// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
/// and the response `stop_sequence` value will contain the matched stop sequence.
@override@JsonKey(name: 'stop_sequences', includeIfNull: false) List<String>? get stopSequences {
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
@override@_CreateMessageRequestSystemConverter()@JsonKey(includeIfNull: false) final  CreateMessageRequestSystem? system;
/// Amount of randomness injected into the response.
///
/// Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
/// for analytical / multiple choice, and closer to `1.0` for creative and
/// generative tasks.
///
/// Note that even with `temperature` of `0.0`, the results will not be fully
/// deterministic.
@override@JsonKey(includeIfNull: false) final  double? temperature;
/// How the model should use the provided tools. The model can use a specific tool,
/// any available tool, or decide by itself.
///
/// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
/// - `any`: tells Claude that it must use one of the provided tools, but doesn’t force a particular tool.
/// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
@override@JsonKey(name: 'tool_choice', includeIfNull: false) final  ToolChoice? toolChoice;
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
 final  List<Tool>? _tools;
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
@override@JsonKey(includeIfNull: false) List<Tool>? get tools {
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
@override@JsonKey(name: 'top_k', includeIfNull: false) final  int? topK;
/// Use nucleus sampling.
///
/// In nucleus sampling, we compute the cumulative distribution over all the options
/// for each subsequent token in decreasing probability order and cut it off once it
/// reaches a particular probability specified by `top_p`. You should either alter
/// `temperature` or `top_p`, but not both.
///
/// Recommended for advanced use cases only. You usually only need to use
/// `temperature`.
@override@JsonKey(name: 'top_p', includeIfNull: false) final  double? topP;
/// Whether to incrementally stream the response using server-sent events.
///
/// See [streaming](https://docs.anthropic.com/en/api/messages-streaming) for
/// details.
@override@JsonKey() final  bool stream;
/// Configuration for enabling Claude's extended thinking. When enabled, responses
/// include `thinking` content blocks showing Claude's thinking process before the
/// final answer. Requires a minimum budget of 1,024 tokens and counts towards your
/// `max_tokens` limit.
/// Any of: [ThinkingConfigEnabled], [ThinkingConfigDisabled]
@override@JsonKey(includeIfNull: false) final  ThinkingConfig? thinking;

/// Create a copy of CreateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateMessageRequestCopyWith<_CreateMessageRequest> get copyWith => __$CreateMessageRequestCopyWithImpl<_CreateMessageRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateMessageRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateMessageRequest&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.maxTokens, maxTokens) || other.maxTokens == maxTokens)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other._stopSequences, _stopSequences)&&(identical(other.system, system) || other.system == system)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.toolChoice, toolChoice) || other.toolChoice == toolChoice)&&const DeepCollectionEquality().equals(other._tools, _tools)&&(identical(other.topK, topK) || other.topK == topK)&&(identical(other.topP, topP) || other.topP == topP)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.thinking, thinking) || other.thinking == thinking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,const DeepCollectionEquality().hash(_messages),maxTokens,metadata,const DeepCollectionEquality().hash(_stopSequences),system,temperature,toolChoice,const DeepCollectionEquality().hash(_tools),topK,topP,stream,thinking);

@override
String toString() {
  return 'CreateMessageRequest(model: $model, messages: $messages, maxTokens: $maxTokens, metadata: $metadata, stopSequences: $stopSequences, system: $system, temperature: $temperature, toolChoice: $toolChoice, tools: $tools, topK: $topK, topP: $topP, stream: $stream, thinking: $thinking)';
}


}

/// @nodoc
abstract mixin class _$CreateMessageRequestCopyWith<$Res> implements $CreateMessageRequestCopyWith<$Res> {
  factory _$CreateMessageRequestCopyWith(_CreateMessageRequest value, $Res Function(_CreateMessageRequest) _then) = __$CreateMessageRequestCopyWithImpl;
@override @useResult
$Res call({
@_ModelConverter() Model model, List<Message> messages,@JsonKey(name: 'max_tokens') int maxTokens,@JsonKey(includeIfNull: false) CreateMessageRequestMetadata? metadata,@JsonKey(name: 'stop_sequences', includeIfNull: false) List<String>? stopSequences,@_CreateMessageRequestSystemConverter()@JsonKey(includeIfNull: false) CreateMessageRequestSystem? system,@JsonKey(includeIfNull: false) double? temperature,@JsonKey(name: 'tool_choice', includeIfNull: false) ToolChoice? toolChoice,@JsonKey(includeIfNull: false) List<Tool>? tools,@JsonKey(name: 'top_k', includeIfNull: false) int? topK,@JsonKey(name: 'top_p', includeIfNull: false) double? topP, bool stream,@JsonKey(includeIfNull: false) ThinkingConfig? thinking
});


@override $ModelCopyWith<$Res> get model;@override $CreateMessageRequestMetadataCopyWith<$Res>? get metadata;@override $CreateMessageRequestSystemCopyWith<$Res>? get system;@override $ToolChoiceCopyWith<$Res>? get toolChoice;@override $ThinkingConfigCopyWith<$Res>? get thinking;

}
/// @nodoc
class __$CreateMessageRequestCopyWithImpl<$Res>
    implements _$CreateMessageRequestCopyWith<$Res> {
  __$CreateMessageRequestCopyWithImpl(this._self, this._then);

  final _CreateMessageRequest _self;
  final $Res Function(_CreateMessageRequest) _then;

/// Create a copy of CreateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? messages = null,Object? maxTokens = null,Object? metadata = freezed,Object? stopSequences = freezed,Object? system = freezed,Object? temperature = freezed,Object? toolChoice = freezed,Object? tools = freezed,Object? topK = freezed,Object? topP = freezed,Object? stream = null,Object? thinking = freezed,}) {
  return _then(_CreateMessageRequest(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as Model,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,maxTokens: null == maxTokens ? _self.maxTokens : maxTokens // ignore: cast_nullable_to_non_nullable
as int,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as CreateMessageRequestMetadata?,stopSequences: freezed == stopSequences ? _self._stopSequences : stopSequences // ignore: cast_nullable_to_non_nullable
as List<String>?,system: freezed == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as CreateMessageRequestSystem?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,toolChoice: freezed == toolChoice ? _self.toolChoice : toolChoice // ignore: cast_nullable_to_non_nullable
as ToolChoice?,tools: freezed == tools ? _self._tools : tools // ignore: cast_nullable_to_non_nullable
as List<Tool>?,topK: freezed == topK ? _self.topK : topK // ignore: cast_nullable_to_non_nullable
as int?,topP: freezed == topP ? _self.topP : topP // ignore: cast_nullable_to_non_nullable
as double?,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,thinking: freezed == thinking ? _self.thinking : thinking // ignore: cast_nullable_to_non_nullable
as ThinkingConfig?,
  ));
}

/// Create a copy of CreateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelCopyWith<$Res> get model {
  
  return $ModelCopyWith<$Res>(_self.model, (value) {
    return _then(_self.copyWith(model: value));
  });
}/// Create a copy of CreateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateMessageRequestMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $CreateMessageRequestMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of CreateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateMessageRequestSystemCopyWith<$Res>? get system {
    if (_self.system == null) {
    return null;
  }

  return $CreateMessageRequestSystemCopyWith<$Res>(_self.system!, (value) {
    return _then(_self.copyWith(system: value));
  });
}/// Create a copy of CreateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolChoiceCopyWith<$Res>? get toolChoice {
    if (_self.toolChoice == null) {
    return null;
  }

  return $ToolChoiceCopyWith<$Res>(_self.toolChoice!, (value) {
    return _then(_self.copyWith(toolChoice: value));
  });
}/// Create a copy of CreateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThinkingConfigCopyWith<$Res>? get thinking {
    if (_self.thinking == null) {
    return null;
  }

  return $ThinkingConfigCopyWith<$Res>(_self.thinking!, (value) {
    return _then(_self.copyWith(thinking: value));
  });
}
}

Model _$ModelFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'model':
          return ModelCatalog.fromJson(
            json
          );
                case 'modelId':
          return ModelId.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'Model',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$Model {

 Object get value;

  /// Serializes this Model to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Model&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'Model(value: $value)';
}


}

/// @nodoc
class $ModelCopyWith<$Res>  {
$ModelCopyWith(Model _, $Res Function(Model) __);
}


/// Adds pattern-matching-related methods to [Model].
extension ModelPatterns on Model {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ModelCatalog value)?  model,TResult Function( ModelId value)?  modelId,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ModelCatalog() when model != null:
return model(_that);case ModelId() when modelId != null:
return modelId(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ModelCatalog value)  model,required TResult Function( ModelId value)  modelId,}){
final _that = this;
switch (_that) {
case ModelCatalog():
return model(_that);case ModelId():
return modelId(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ModelCatalog value)?  model,TResult? Function( ModelId value)?  modelId,}){
final _that = this;
switch (_that) {
case ModelCatalog() when model != null:
return model(_that);case ModelId() when modelId != null:
return modelId(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Models value)?  model,TResult Function( String value)?  modelId,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ModelCatalog() when model != null:
return model(_that.value);case ModelId() when modelId != null:
return modelId(_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Models value)  model,required TResult Function( String value)  modelId,}) {final _that = this;
switch (_that) {
case ModelCatalog():
return model(_that.value);case ModelId():
return modelId(_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Models value)?  model,TResult? Function( String value)?  modelId,}) {final _that = this;
switch (_that) {
case ModelCatalog() when model != null:
return model(_that.value);case ModelId() when modelId != null:
return modelId(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ModelCatalog extends Model {
  const ModelCatalog(this.value, {final  String? $type}): $type = $type ?? 'model',super._();
  factory ModelCatalog.fromJson(Map<String, dynamic> json) => _$ModelCatalogFromJson(json);

@override final  Models value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelCatalogCopyWith<ModelCatalog> get copyWith => _$ModelCatalogCopyWithImpl<ModelCatalog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModelCatalogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelCatalog&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'Model.model(value: $value)';
}


}

/// @nodoc
abstract mixin class $ModelCatalogCopyWith<$Res> implements $ModelCopyWith<$Res> {
  factory $ModelCatalogCopyWith(ModelCatalog value, $Res Function(ModelCatalog) _then) = _$ModelCatalogCopyWithImpl;
@useResult
$Res call({
 Models value
});




}
/// @nodoc
class _$ModelCatalogCopyWithImpl<$Res>
    implements $ModelCatalogCopyWith<$Res> {
  _$ModelCatalogCopyWithImpl(this._self, this._then);

  final ModelCatalog _self;
  final $Res Function(ModelCatalog) _then;

/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ModelCatalog(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as Models,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ModelId extends Model {
  const ModelId(this.value, {final  String? $type}): $type = $type ?? 'modelId',super._();
  factory ModelId.fromJson(Map<String, dynamic> json) => _$ModelIdFromJson(json);

@override final  String value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelIdCopyWith<ModelId> get copyWith => _$ModelIdCopyWithImpl<ModelId>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModelIdToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelId&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'Model.modelId(value: $value)';
}


}

/// @nodoc
abstract mixin class $ModelIdCopyWith<$Res> implements $ModelCopyWith<$Res> {
  factory $ModelIdCopyWith(ModelId value, $Res Function(ModelId) _then) = _$ModelIdCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$ModelIdCopyWithImpl<$Res>
    implements $ModelIdCopyWith<$Res> {
  _$ModelIdCopyWithImpl(this._self, this._then);

  final ModelId _self;
  final $Res Function(ModelId) _then;

/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ModelId(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

CreateMessageRequestSystem _$CreateMessageRequestSystemFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'blocks':
          return SystemMessageContentBlocks.fromJson(
            json
          );
                case 'text':
          return SystemMessageContentText.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'CreateMessageRequestSystem',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$CreateMessageRequestSystem {

 Object get value;

  /// Serializes this CreateMessageRequestSystem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateMessageRequestSystem&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'CreateMessageRequestSystem(value: $value)';
}


}

/// @nodoc
class $CreateMessageRequestSystemCopyWith<$Res>  {
$CreateMessageRequestSystemCopyWith(CreateMessageRequestSystem _, $Res Function(CreateMessageRequestSystem) __);
}


/// Adds pattern-matching-related methods to [CreateMessageRequestSystem].
extension CreateMessageRequestSystemPatterns on CreateMessageRequestSystem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SystemMessageContentBlocks value)?  blocks,TResult Function( SystemMessageContentText value)?  text,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SystemMessageContentBlocks() when blocks != null:
return blocks(_that);case SystemMessageContentText() when text != null:
return text(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SystemMessageContentBlocks value)  blocks,required TResult Function( SystemMessageContentText value)  text,}){
final _that = this;
switch (_that) {
case SystemMessageContentBlocks():
return blocks(_that);case SystemMessageContentText():
return text(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SystemMessageContentBlocks value)?  blocks,TResult? Function( SystemMessageContentText value)?  text,}){
final _that = this;
switch (_that) {
case SystemMessageContentBlocks() when blocks != null:
return blocks(_that);case SystemMessageContentText() when text != null:
return text(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Block> value)?  blocks,TResult Function( String value)?  text,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SystemMessageContentBlocks() when blocks != null:
return blocks(_that.value);case SystemMessageContentText() when text != null:
return text(_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Block> value)  blocks,required TResult Function( String value)  text,}) {final _that = this;
switch (_that) {
case SystemMessageContentBlocks():
return blocks(_that.value);case SystemMessageContentText():
return text(_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Block> value)?  blocks,TResult? Function( String value)?  text,}) {final _that = this;
switch (_that) {
case SystemMessageContentBlocks() when blocks != null:
return blocks(_that.value);case SystemMessageContentText() when text != null:
return text(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class SystemMessageContentBlocks extends CreateMessageRequestSystem {
  const SystemMessageContentBlocks(final  List<Block> value, {final  String? $type}): _value = value,$type = $type ?? 'blocks',super._();
  factory SystemMessageContentBlocks.fromJson(Map<String, dynamic> json) => _$SystemMessageContentBlocksFromJson(json);

 final  List<Block> _value;
@override List<Block> get value {
  if (_value is EqualUnmodifiableListView) return _value;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_value);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CreateMessageRequestSystem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SystemMessageContentBlocksCopyWith<SystemMessageContentBlocks> get copyWith => _$SystemMessageContentBlocksCopyWithImpl<SystemMessageContentBlocks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SystemMessageContentBlocksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SystemMessageContentBlocks&&const DeepCollectionEquality().equals(other._value, _value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_value));

@override
String toString() {
  return 'CreateMessageRequestSystem.blocks(value: $value)';
}


}

/// @nodoc
abstract mixin class $SystemMessageContentBlocksCopyWith<$Res> implements $CreateMessageRequestSystemCopyWith<$Res> {
  factory $SystemMessageContentBlocksCopyWith(SystemMessageContentBlocks value, $Res Function(SystemMessageContentBlocks) _then) = _$SystemMessageContentBlocksCopyWithImpl;
@useResult
$Res call({
 List<Block> value
});




}
/// @nodoc
class _$SystemMessageContentBlocksCopyWithImpl<$Res>
    implements $SystemMessageContentBlocksCopyWith<$Res> {
  _$SystemMessageContentBlocksCopyWithImpl(this._self, this._then);

  final SystemMessageContentBlocks _self;
  final $Res Function(SystemMessageContentBlocks) _then;

/// Create a copy of CreateMessageRequestSystem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(SystemMessageContentBlocks(
null == value ? _self._value : value // ignore: cast_nullable_to_non_nullable
as List<Block>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SystemMessageContentText extends CreateMessageRequestSystem {
  const SystemMessageContentText(this.value, {final  String? $type}): $type = $type ?? 'text',super._();
  factory SystemMessageContentText.fromJson(Map<String, dynamic> json) => _$SystemMessageContentTextFromJson(json);

@override final  String value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CreateMessageRequestSystem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SystemMessageContentTextCopyWith<SystemMessageContentText> get copyWith => _$SystemMessageContentTextCopyWithImpl<SystemMessageContentText>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SystemMessageContentTextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SystemMessageContentText&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'CreateMessageRequestSystem.text(value: $value)';
}


}

/// @nodoc
abstract mixin class $SystemMessageContentTextCopyWith<$Res> implements $CreateMessageRequestSystemCopyWith<$Res> {
  factory $SystemMessageContentTextCopyWith(SystemMessageContentText value, $Res Function(SystemMessageContentText) _then) = _$SystemMessageContentTextCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$SystemMessageContentTextCopyWithImpl<$Res>
    implements $SystemMessageContentTextCopyWith<$Res> {
  _$SystemMessageContentTextCopyWithImpl(this._self, this._then);

  final SystemMessageContentText _self;
  final $Res Function(SystemMessageContentText) _then;

/// Create a copy of CreateMessageRequestSystem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(SystemMessageContentText(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CountMessageTokensRequest {

/// The model that will complete your prompt.
///
/// See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
/// details and options.
@_CountMessageTokensRequestModelConverter() CountMessageTokensRequestModel get model;/// Input messages.
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
 List<Message> get messages;/// System prompt.
///
/// A system prompt is a way of providing context and instructions to Claude, such
/// as specifying a particular goal or role. See our
/// [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
@_CountMessageTokensRequestSystemConverter()@JsonKey(includeIfNull: false) CountMessageTokensRequestSystem? get system;/// How the model should use the provided tools. The model can use a specific tool,
/// any available tool, or decide by itself.
///
/// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
/// - `any`: tells Claude that it must use one of the provided tools, but doesn’t force a particular tool.
/// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
@JsonKey(name: 'tool_choice', includeIfNull: false) ToolChoice? get toolChoice;/// Definitions of tools that the model may use.
///
/// If you include `tools` in your API request, the model may return `tool_use`
/// content blocks that represent the model's use of those tools. You can then run
/// those tools using the tool input generated by the model and then optionally
/// return results back to the model using `tool_result` content blocks.
@JsonKey(includeIfNull: false) List<Tool>? get tools;/// Configuration for enabling Claude's extended thinking. When enabled, responses
/// include `thinking` content blocks showing Claude's thinking process before the
/// final answer. Requires a minimum budget of 1,024 tokens and counts towards your
/// `max_tokens` limit.
/// Any of: [ThinkingConfigEnabled], [ThinkingConfigDisabled]
@JsonKey(includeIfNull: false) ThinkingConfig? get thinking;
/// Create a copy of CountMessageTokensRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountMessageTokensRequestCopyWith<CountMessageTokensRequest> get copyWith => _$CountMessageTokensRequestCopyWithImpl<CountMessageTokensRequest>(this as CountMessageTokensRequest, _$identity);

  /// Serializes this CountMessageTokensRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountMessageTokensRequest&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.system, system) || other.system == system)&&(identical(other.toolChoice, toolChoice) || other.toolChoice == toolChoice)&&const DeepCollectionEquality().equals(other.tools, tools)&&(identical(other.thinking, thinking) || other.thinking == thinking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,const DeepCollectionEquality().hash(messages),system,toolChoice,const DeepCollectionEquality().hash(tools),thinking);

@override
String toString() {
  return 'CountMessageTokensRequest(model: $model, messages: $messages, system: $system, toolChoice: $toolChoice, tools: $tools, thinking: $thinking)';
}


}

/// @nodoc
abstract mixin class $CountMessageTokensRequestCopyWith<$Res>  {
  factory $CountMessageTokensRequestCopyWith(CountMessageTokensRequest value, $Res Function(CountMessageTokensRequest) _then) = _$CountMessageTokensRequestCopyWithImpl;
@useResult
$Res call({
@_CountMessageTokensRequestModelConverter() CountMessageTokensRequestModel model, List<Message> messages,@_CountMessageTokensRequestSystemConverter()@JsonKey(includeIfNull: false) CountMessageTokensRequestSystem? system,@JsonKey(name: 'tool_choice', includeIfNull: false) ToolChoice? toolChoice,@JsonKey(includeIfNull: false) List<Tool>? tools,@JsonKey(includeIfNull: false) ThinkingConfig? thinking
});


$CountMessageTokensRequestModelCopyWith<$Res> get model;$CountMessageTokensRequestSystemCopyWith<$Res>? get system;$ToolChoiceCopyWith<$Res>? get toolChoice;$ThinkingConfigCopyWith<$Res>? get thinking;

}
/// @nodoc
class _$CountMessageTokensRequestCopyWithImpl<$Res>
    implements $CountMessageTokensRequestCopyWith<$Res> {
  _$CountMessageTokensRequestCopyWithImpl(this._self, this._then);

  final CountMessageTokensRequest _self;
  final $Res Function(CountMessageTokensRequest) _then;

/// Create a copy of CountMessageTokensRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? messages = null,Object? system = freezed,Object? toolChoice = freezed,Object? tools = freezed,Object? thinking = freezed,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as CountMessageTokensRequestModel,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,system: freezed == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as CountMessageTokensRequestSystem?,toolChoice: freezed == toolChoice ? _self.toolChoice : toolChoice // ignore: cast_nullable_to_non_nullable
as ToolChoice?,tools: freezed == tools ? _self.tools : tools // ignore: cast_nullable_to_non_nullable
as List<Tool>?,thinking: freezed == thinking ? _self.thinking : thinking // ignore: cast_nullable_to_non_nullable
as ThinkingConfig?,
  ));
}
/// Create a copy of CountMessageTokensRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountMessageTokensRequestModelCopyWith<$Res> get model {
  
  return $CountMessageTokensRequestModelCopyWith<$Res>(_self.model, (value) {
    return _then(_self.copyWith(model: value));
  });
}/// Create a copy of CountMessageTokensRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountMessageTokensRequestSystemCopyWith<$Res>? get system {
    if (_self.system == null) {
    return null;
  }

  return $CountMessageTokensRequestSystemCopyWith<$Res>(_self.system!, (value) {
    return _then(_self.copyWith(system: value));
  });
}/// Create a copy of CountMessageTokensRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolChoiceCopyWith<$Res>? get toolChoice {
    if (_self.toolChoice == null) {
    return null;
  }

  return $ToolChoiceCopyWith<$Res>(_self.toolChoice!, (value) {
    return _then(_self.copyWith(toolChoice: value));
  });
}/// Create a copy of CountMessageTokensRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThinkingConfigCopyWith<$Res>? get thinking {
    if (_self.thinking == null) {
    return null;
  }

  return $ThinkingConfigCopyWith<$Res>(_self.thinking!, (value) {
    return _then(_self.copyWith(thinking: value));
  });
}
}


/// Adds pattern-matching-related methods to [CountMessageTokensRequest].
extension CountMessageTokensRequestPatterns on CountMessageTokensRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountMessageTokensRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountMessageTokensRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountMessageTokensRequest value)  $default,){
final _that = this;
switch (_that) {
case _CountMessageTokensRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountMessageTokensRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CountMessageTokensRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@_CountMessageTokensRequestModelConverter()  CountMessageTokensRequestModel model,  List<Message> messages, @_CountMessageTokensRequestSystemConverter()@JsonKey(includeIfNull: false)  CountMessageTokensRequestSystem? system, @JsonKey(name: 'tool_choice', includeIfNull: false)  ToolChoice? toolChoice, @JsonKey(includeIfNull: false)  List<Tool>? tools, @JsonKey(includeIfNull: false)  ThinkingConfig? thinking)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountMessageTokensRequest() when $default != null:
return $default(_that.model,_that.messages,_that.system,_that.toolChoice,_that.tools,_that.thinking);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@_CountMessageTokensRequestModelConverter()  CountMessageTokensRequestModel model,  List<Message> messages, @_CountMessageTokensRequestSystemConverter()@JsonKey(includeIfNull: false)  CountMessageTokensRequestSystem? system, @JsonKey(name: 'tool_choice', includeIfNull: false)  ToolChoice? toolChoice, @JsonKey(includeIfNull: false)  List<Tool>? tools, @JsonKey(includeIfNull: false)  ThinkingConfig? thinking)  $default,) {final _that = this;
switch (_that) {
case _CountMessageTokensRequest():
return $default(_that.model,_that.messages,_that.system,_that.toolChoice,_that.tools,_that.thinking);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@_CountMessageTokensRequestModelConverter()  CountMessageTokensRequestModel model,  List<Message> messages, @_CountMessageTokensRequestSystemConverter()@JsonKey(includeIfNull: false)  CountMessageTokensRequestSystem? system, @JsonKey(name: 'tool_choice', includeIfNull: false)  ToolChoice? toolChoice, @JsonKey(includeIfNull: false)  List<Tool>? tools, @JsonKey(includeIfNull: false)  ThinkingConfig? thinking)?  $default,) {final _that = this;
switch (_that) {
case _CountMessageTokensRequest() when $default != null:
return $default(_that.model,_that.messages,_that.system,_that.toolChoice,_that.tools,_that.thinking);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CountMessageTokensRequest extends CountMessageTokensRequest {
  const _CountMessageTokensRequest({@_CountMessageTokensRequestModelConverter() required this.model, required final  List<Message> messages, @_CountMessageTokensRequestSystemConverter()@JsonKey(includeIfNull: false) this.system, @JsonKey(name: 'tool_choice', includeIfNull: false) this.toolChoice, @JsonKey(includeIfNull: false) final  List<Tool>? tools, @JsonKey(includeIfNull: false) this.thinking}): _messages = messages,_tools = tools,super._();
  factory _CountMessageTokensRequest.fromJson(Map<String, dynamic> json) => _$CountMessageTokensRequestFromJson(json);

/// The model that will complete your prompt.
///
/// See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
/// details and options.
@override@_CountMessageTokensRequestModelConverter() final  CountMessageTokensRequestModel model;
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
 final  List<Message> _messages;
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
@override List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

/// System prompt.
///
/// A system prompt is a way of providing context and instructions to Claude, such
/// as specifying a particular goal or role. See our
/// [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
@override@_CountMessageTokensRequestSystemConverter()@JsonKey(includeIfNull: false) final  CountMessageTokensRequestSystem? system;
/// How the model should use the provided tools. The model can use a specific tool,
/// any available tool, or decide by itself.
///
/// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
/// - `any`: tells Claude that it must use one of the provided tools, but doesn’t force a particular tool.
/// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
@override@JsonKey(name: 'tool_choice', includeIfNull: false) final  ToolChoice? toolChoice;
/// Definitions of tools that the model may use.
///
/// If you include `tools` in your API request, the model may return `tool_use`
/// content blocks that represent the model's use of those tools. You can then run
/// those tools using the tool input generated by the model and then optionally
/// return results back to the model using `tool_result` content blocks.
 final  List<Tool>? _tools;
/// Definitions of tools that the model may use.
///
/// If you include `tools` in your API request, the model may return `tool_use`
/// content blocks that represent the model's use of those tools. You can then run
/// those tools using the tool input generated by the model and then optionally
/// return results back to the model using `tool_result` content blocks.
@override@JsonKey(includeIfNull: false) List<Tool>? get tools {
  final value = _tools;
  if (value == null) return null;
  if (_tools is EqualUnmodifiableListView) return _tools;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Configuration for enabling Claude's extended thinking. When enabled, responses
/// include `thinking` content blocks showing Claude's thinking process before the
/// final answer. Requires a minimum budget of 1,024 tokens and counts towards your
/// `max_tokens` limit.
/// Any of: [ThinkingConfigEnabled], [ThinkingConfigDisabled]
@override@JsonKey(includeIfNull: false) final  ThinkingConfig? thinking;

/// Create a copy of CountMessageTokensRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountMessageTokensRequestCopyWith<_CountMessageTokensRequest> get copyWith => __$CountMessageTokensRequestCopyWithImpl<_CountMessageTokensRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountMessageTokensRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountMessageTokensRequest&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.system, system) || other.system == system)&&(identical(other.toolChoice, toolChoice) || other.toolChoice == toolChoice)&&const DeepCollectionEquality().equals(other._tools, _tools)&&(identical(other.thinking, thinking) || other.thinking == thinking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,const DeepCollectionEquality().hash(_messages),system,toolChoice,const DeepCollectionEquality().hash(_tools),thinking);

@override
String toString() {
  return 'CountMessageTokensRequest(model: $model, messages: $messages, system: $system, toolChoice: $toolChoice, tools: $tools, thinking: $thinking)';
}


}

/// @nodoc
abstract mixin class _$CountMessageTokensRequestCopyWith<$Res> implements $CountMessageTokensRequestCopyWith<$Res> {
  factory _$CountMessageTokensRequestCopyWith(_CountMessageTokensRequest value, $Res Function(_CountMessageTokensRequest) _then) = __$CountMessageTokensRequestCopyWithImpl;
@override @useResult
$Res call({
@_CountMessageTokensRequestModelConverter() CountMessageTokensRequestModel model, List<Message> messages,@_CountMessageTokensRequestSystemConverter()@JsonKey(includeIfNull: false) CountMessageTokensRequestSystem? system,@JsonKey(name: 'tool_choice', includeIfNull: false) ToolChoice? toolChoice,@JsonKey(includeIfNull: false) List<Tool>? tools,@JsonKey(includeIfNull: false) ThinkingConfig? thinking
});


@override $CountMessageTokensRequestModelCopyWith<$Res> get model;@override $CountMessageTokensRequestSystemCopyWith<$Res>? get system;@override $ToolChoiceCopyWith<$Res>? get toolChoice;@override $ThinkingConfigCopyWith<$Res>? get thinking;

}
/// @nodoc
class __$CountMessageTokensRequestCopyWithImpl<$Res>
    implements _$CountMessageTokensRequestCopyWith<$Res> {
  __$CountMessageTokensRequestCopyWithImpl(this._self, this._then);

  final _CountMessageTokensRequest _self;
  final $Res Function(_CountMessageTokensRequest) _then;

/// Create a copy of CountMessageTokensRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? messages = null,Object? system = freezed,Object? toolChoice = freezed,Object? tools = freezed,Object? thinking = freezed,}) {
  return _then(_CountMessageTokensRequest(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as CountMessageTokensRequestModel,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,system: freezed == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as CountMessageTokensRequestSystem?,toolChoice: freezed == toolChoice ? _self.toolChoice : toolChoice // ignore: cast_nullable_to_non_nullable
as ToolChoice?,tools: freezed == tools ? _self._tools : tools // ignore: cast_nullable_to_non_nullable
as List<Tool>?,thinking: freezed == thinking ? _self.thinking : thinking // ignore: cast_nullable_to_non_nullable
as ThinkingConfig?,
  ));
}

/// Create a copy of CountMessageTokensRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountMessageTokensRequestModelCopyWith<$Res> get model {
  
  return $CountMessageTokensRequestModelCopyWith<$Res>(_self.model, (value) {
    return _then(_self.copyWith(model: value));
  });
}/// Create a copy of CountMessageTokensRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountMessageTokensRequestSystemCopyWith<$Res>? get system {
    if (_self.system == null) {
    return null;
  }

  return $CountMessageTokensRequestSystemCopyWith<$Res>(_self.system!, (value) {
    return _then(_self.copyWith(system: value));
  });
}/// Create a copy of CountMessageTokensRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolChoiceCopyWith<$Res>? get toolChoice {
    if (_self.toolChoice == null) {
    return null;
  }

  return $ToolChoiceCopyWith<$Res>(_self.toolChoice!, (value) {
    return _then(_self.copyWith(toolChoice: value));
  });
}/// Create a copy of CountMessageTokensRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThinkingConfigCopyWith<$Res>? get thinking {
    if (_self.thinking == null) {
    return null;
  }

  return $ThinkingConfigCopyWith<$Res>(_self.thinking!, (value) {
    return _then(_self.copyWith(thinking: value));
  });
}
}

CountMessageTokensRequestModel _$CountMessageTokensRequestModelFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'enumeration':
          return CountMessageTokensRequestModelEnumeration.fromJson(
            json
          );
                case 'string':
          return CountMessageTokensRequestModelString.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'CountMessageTokensRequestModel',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$CountMessageTokensRequestModel {

 Object get value;

  /// Serializes this CountMessageTokensRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountMessageTokensRequestModel&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'CountMessageTokensRequestModel(value: $value)';
}


}

/// @nodoc
class $CountMessageTokensRequestModelCopyWith<$Res>  {
$CountMessageTokensRequestModelCopyWith(CountMessageTokensRequestModel _, $Res Function(CountMessageTokensRequestModel) __);
}


/// Adds pattern-matching-related methods to [CountMessageTokensRequestModel].
extension CountMessageTokensRequestModelPatterns on CountMessageTokensRequestModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CountMessageTokensRequestModelEnumeration value)?  enumeration,TResult Function( CountMessageTokensRequestModelString value)?  string,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CountMessageTokensRequestModelEnumeration() when enumeration != null:
return enumeration(_that);case CountMessageTokensRequestModelString() when string != null:
return string(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CountMessageTokensRequestModelEnumeration value)  enumeration,required TResult Function( CountMessageTokensRequestModelString value)  string,}){
final _that = this;
switch (_that) {
case CountMessageTokensRequestModelEnumeration():
return enumeration(_that);case CountMessageTokensRequestModelString():
return string(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CountMessageTokensRequestModelEnumeration value)?  enumeration,TResult? Function( CountMessageTokensRequestModelString value)?  string,}){
final _that = this;
switch (_that) {
case CountMessageTokensRequestModelEnumeration() when enumeration != null:
return enumeration(_that);case CountMessageTokensRequestModelString() when string != null:
return string(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Models value)?  enumeration,TResult Function( String value)?  string,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CountMessageTokensRequestModelEnumeration() when enumeration != null:
return enumeration(_that.value);case CountMessageTokensRequestModelString() when string != null:
return string(_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Models value)  enumeration,required TResult Function( String value)  string,}) {final _that = this;
switch (_that) {
case CountMessageTokensRequestModelEnumeration():
return enumeration(_that.value);case CountMessageTokensRequestModelString():
return string(_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Models value)?  enumeration,TResult? Function( String value)?  string,}) {final _that = this;
switch (_that) {
case CountMessageTokensRequestModelEnumeration() when enumeration != null:
return enumeration(_that.value);case CountMessageTokensRequestModelString() when string != null:
return string(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class CountMessageTokensRequestModelEnumeration extends CountMessageTokensRequestModel {
  const CountMessageTokensRequestModelEnumeration(this.value, {final  String? $type}): $type = $type ?? 'enumeration',super._();
  factory CountMessageTokensRequestModelEnumeration.fromJson(Map<String, dynamic> json) => _$CountMessageTokensRequestModelEnumerationFromJson(json);

@override final  Models value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CountMessageTokensRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountMessageTokensRequestModelEnumerationCopyWith<CountMessageTokensRequestModelEnumeration> get copyWith => _$CountMessageTokensRequestModelEnumerationCopyWithImpl<CountMessageTokensRequestModelEnumeration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountMessageTokensRequestModelEnumerationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountMessageTokensRequestModelEnumeration&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'CountMessageTokensRequestModel.enumeration(value: $value)';
}


}

/// @nodoc
abstract mixin class $CountMessageTokensRequestModelEnumerationCopyWith<$Res> implements $CountMessageTokensRequestModelCopyWith<$Res> {
  factory $CountMessageTokensRequestModelEnumerationCopyWith(CountMessageTokensRequestModelEnumeration value, $Res Function(CountMessageTokensRequestModelEnumeration) _then) = _$CountMessageTokensRequestModelEnumerationCopyWithImpl;
@useResult
$Res call({
 Models value
});




}
/// @nodoc
class _$CountMessageTokensRequestModelEnumerationCopyWithImpl<$Res>
    implements $CountMessageTokensRequestModelEnumerationCopyWith<$Res> {
  _$CountMessageTokensRequestModelEnumerationCopyWithImpl(this._self, this._then);

  final CountMessageTokensRequestModelEnumeration _self;
  final $Res Function(CountMessageTokensRequestModelEnumeration) _then;

/// Create a copy of CountMessageTokensRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(CountMessageTokensRequestModelEnumeration(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as Models,
  ));
}


}

/// @nodoc
@JsonSerializable()

class CountMessageTokensRequestModelString extends CountMessageTokensRequestModel {
  const CountMessageTokensRequestModelString(this.value, {final  String? $type}): $type = $type ?? 'string',super._();
  factory CountMessageTokensRequestModelString.fromJson(Map<String, dynamic> json) => _$CountMessageTokensRequestModelStringFromJson(json);

@override final  String value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CountMessageTokensRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountMessageTokensRequestModelStringCopyWith<CountMessageTokensRequestModelString> get copyWith => _$CountMessageTokensRequestModelStringCopyWithImpl<CountMessageTokensRequestModelString>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountMessageTokensRequestModelStringToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountMessageTokensRequestModelString&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'CountMessageTokensRequestModel.string(value: $value)';
}


}

/// @nodoc
abstract mixin class $CountMessageTokensRequestModelStringCopyWith<$Res> implements $CountMessageTokensRequestModelCopyWith<$Res> {
  factory $CountMessageTokensRequestModelStringCopyWith(CountMessageTokensRequestModelString value, $Res Function(CountMessageTokensRequestModelString) _then) = _$CountMessageTokensRequestModelStringCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$CountMessageTokensRequestModelStringCopyWithImpl<$Res>
    implements $CountMessageTokensRequestModelStringCopyWith<$Res> {
  _$CountMessageTokensRequestModelStringCopyWithImpl(this._self, this._then);

  final CountMessageTokensRequestModelString _self;
  final $Res Function(CountMessageTokensRequestModelString) _then;

/// Create a copy of CountMessageTokensRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(CountMessageTokensRequestModelString(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

CountMessageTokensRequestSystem _$CountMessageTokensRequestSystemFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'listBlock':
          return CountMessageTokensRequestSystemListBlock.fromJson(
            json
          );
                case 'string':
          return CountMessageTokensRequestSystemString.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'CountMessageTokensRequestSystem',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$CountMessageTokensRequestSystem {

 Object get value;

  /// Serializes this CountMessageTokensRequestSystem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountMessageTokensRequestSystem&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'CountMessageTokensRequestSystem(value: $value)';
}


}

/// @nodoc
class $CountMessageTokensRequestSystemCopyWith<$Res>  {
$CountMessageTokensRequestSystemCopyWith(CountMessageTokensRequestSystem _, $Res Function(CountMessageTokensRequestSystem) __);
}


/// Adds pattern-matching-related methods to [CountMessageTokensRequestSystem].
extension CountMessageTokensRequestSystemPatterns on CountMessageTokensRequestSystem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CountMessageTokensRequestSystemListBlock value)?  listBlock,TResult Function( CountMessageTokensRequestSystemString value)?  string,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CountMessageTokensRequestSystemListBlock() when listBlock != null:
return listBlock(_that);case CountMessageTokensRequestSystemString() when string != null:
return string(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CountMessageTokensRequestSystemListBlock value)  listBlock,required TResult Function( CountMessageTokensRequestSystemString value)  string,}){
final _that = this;
switch (_that) {
case CountMessageTokensRequestSystemListBlock():
return listBlock(_that);case CountMessageTokensRequestSystemString():
return string(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CountMessageTokensRequestSystemListBlock value)?  listBlock,TResult? Function( CountMessageTokensRequestSystemString value)?  string,}){
final _that = this;
switch (_that) {
case CountMessageTokensRequestSystemListBlock() when listBlock != null:
return listBlock(_that);case CountMessageTokensRequestSystemString() when string != null:
return string(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Block> value)?  listBlock,TResult Function( String value)?  string,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CountMessageTokensRequestSystemListBlock() when listBlock != null:
return listBlock(_that.value);case CountMessageTokensRequestSystemString() when string != null:
return string(_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Block> value)  listBlock,required TResult Function( String value)  string,}) {final _that = this;
switch (_that) {
case CountMessageTokensRequestSystemListBlock():
return listBlock(_that.value);case CountMessageTokensRequestSystemString():
return string(_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Block> value)?  listBlock,TResult? Function( String value)?  string,}) {final _that = this;
switch (_that) {
case CountMessageTokensRequestSystemListBlock() when listBlock != null:
return listBlock(_that.value);case CountMessageTokensRequestSystemString() when string != null:
return string(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class CountMessageTokensRequestSystemListBlock extends CountMessageTokensRequestSystem {
  const CountMessageTokensRequestSystemListBlock(final  List<Block> value, {final  String? $type}): _value = value,$type = $type ?? 'listBlock',super._();
  factory CountMessageTokensRequestSystemListBlock.fromJson(Map<String, dynamic> json) => _$CountMessageTokensRequestSystemListBlockFromJson(json);

 final  List<Block> _value;
@override List<Block> get value {
  if (_value is EqualUnmodifiableListView) return _value;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_value);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CountMessageTokensRequestSystem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountMessageTokensRequestSystemListBlockCopyWith<CountMessageTokensRequestSystemListBlock> get copyWith => _$CountMessageTokensRequestSystemListBlockCopyWithImpl<CountMessageTokensRequestSystemListBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountMessageTokensRequestSystemListBlockToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountMessageTokensRequestSystemListBlock&&const DeepCollectionEquality().equals(other._value, _value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_value));

@override
String toString() {
  return 'CountMessageTokensRequestSystem.listBlock(value: $value)';
}


}

/// @nodoc
abstract mixin class $CountMessageTokensRequestSystemListBlockCopyWith<$Res> implements $CountMessageTokensRequestSystemCopyWith<$Res> {
  factory $CountMessageTokensRequestSystemListBlockCopyWith(CountMessageTokensRequestSystemListBlock value, $Res Function(CountMessageTokensRequestSystemListBlock) _then) = _$CountMessageTokensRequestSystemListBlockCopyWithImpl;
@useResult
$Res call({
 List<Block> value
});




}
/// @nodoc
class _$CountMessageTokensRequestSystemListBlockCopyWithImpl<$Res>
    implements $CountMessageTokensRequestSystemListBlockCopyWith<$Res> {
  _$CountMessageTokensRequestSystemListBlockCopyWithImpl(this._self, this._then);

  final CountMessageTokensRequestSystemListBlock _self;
  final $Res Function(CountMessageTokensRequestSystemListBlock) _then;

/// Create a copy of CountMessageTokensRequestSystem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(CountMessageTokensRequestSystemListBlock(
null == value ? _self._value : value // ignore: cast_nullable_to_non_nullable
as List<Block>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class CountMessageTokensRequestSystemString extends CountMessageTokensRequestSystem {
  const CountMessageTokensRequestSystemString(this.value, {final  String? $type}): $type = $type ?? 'string',super._();
  factory CountMessageTokensRequestSystemString.fromJson(Map<String, dynamic> json) => _$CountMessageTokensRequestSystemStringFromJson(json);

@override final  String value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CountMessageTokensRequestSystem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountMessageTokensRequestSystemStringCopyWith<CountMessageTokensRequestSystemString> get copyWith => _$CountMessageTokensRequestSystemStringCopyWithImpl<CountMessageTokensRequestSystemString>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountMessageTokensRequestSystemStringToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountMessageTokensRequestSystemString&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'CountMessageTokensRequestSystem.string(value: $value)';
}


}

/// @nodoc
abstract mixin class $CountMessageTokensRequestSystemStringCopyWith<$Res> implements $CountMessageTokensRequestSystemCopyWith<$Res> {
  factory $CountMessageTokensRequestSystemStringCopyWith(CountMessageTokensRequestSystemString value, $Res Function(CountMessageTokensRequestSystemString) _then) = _$CountMessageTokensRequestSystemStringCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$CountMessageTokensRequestSystemStringCopyWithImpl<$Res>
    implements $CountMessageTokensRequestSystemStringCopyWith<$Res> {
  _$CountMessageTokensRequestSystemStringCopyWithImpl(this._self, this._then);

  final CountMessageTokensRequestSystemString _self;
  final $Res Function(CountMessageTokensRequestSystemString) _then;

/// Create a copy of CountMessageTokensRequestSystem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(CountMessageTokensRequestSystemString(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CountMessageTokensResponse {

/// The total number of tokens across the provided list of messages, system prompt,
/// and tools.
@JsonKey(name: 'input_tokens') int get inputTokens;
/// Create a copy of CountMessageTokensResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountMessageTokensResponseCopyWith<CountMessageTokensResponse> get copyWith => _$CountMessageTokensResponseCopyWithImpl<CountMessageTokensResponse>(this as CountMessageTokensResponse, _$identity);

  /// Serializes this CountMessageTokensResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountMessageTokensResponse&&(identical(other.inputTokens, inputTokens) || other.inputTokens == inputTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputTokens);

@override
String toString() {
  return 'CountMessageTokensResponse(inputTokens: $inputTokens)';
}


}

/// @nodoc
abstract mixin class $CountMessageTokensResponseCopyWith<$Res>  {
  factory $CountMessageTokensResponseCopyWith(CountMessageTokensResponse value, $Res Function(CountMessageTokensResponse) _then) = _$CountMessageTokensResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'input_tokens') int inputTokens
});




}
/// @nodoc
class _$CountMessageTokensResponseCopyWithImpl<$Res>
    implements $CountMessageTokensResponseCopyWith<$Res> {
  _$CountMessageTokensResponseCopyWithImpl(this._self, this._then);

  final CountMessageTokensResponse _self;
  final $Res Function(CountMessageTokensResponse) _then;

/// Create a copy of CountMessageTokensResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inputTokens = null,}) {
  return _then(_self.copyWith(
inputTokens: null == inputTokens ? _self.inputTokens : inputTokens // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CountMessageTokensResponse].
extension CountMessageTokensResponsePatterns on CountMessageTokensResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountMessageTokensResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountMessageTokensResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountMessageTokensResponse value)  $default,){
final _that = this;
switch (_that) {
case _CountMessageTokensResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountMessageTokensResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CountMessageTokensResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'input_tokens')  int inputTokens)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountMessageTokensResponse() when $default != null:
return $default(_that.inputTokens);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'input_tokens')  int inputTokens)  $default,) {final _that = this;
switch (_that) {
case _CountMessageTokensResponse():
return $default(_that.inputTokens);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'input_tokens')  int inputTokens)?  $default,) {final _that = this;
switch (_that) {
case _CountMessageTokensResponse() when $default != null:
return $default(_that.inputTokens);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CountMessageTokensResponse extends CountMessageTokensResponse {
  const _CountMessageTokensResponse({@JsonKey(name: 'input_tokens') required this.inputTokens}): super._();
  factory _CountMessageTokensResponse.fromJson(Map<String, dynamic> json) => _$CountMessageTokensResponseFromJson(json);

/// The total number of tokens across the provided list of messages, system prompt,
/// and tools.
@override@JsonKey(name: 'input_tokens') final  int inputTokens;

/// Create a copy of CountMessageTokensResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountMessageTokensResponseCopyWith<_CountMessageTokensResponse> get copyWith => __$CountMessageTokensResponseCopyWithImpl<_CountMessageTokensResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountMessageTokensResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountMessageTokensResponse&&(identical(other.inputTokens, inputTokens) || other.inputTokens == inputTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputTokens);

@override
String toString() {
  return 'CountMessageTokensResponse(inputTokens: $inputTokens)';
}


}

/// @nodoc
abstract mixin class _$CountMessageTokensResponseCopyWith<$Res> implements $CountMessageTokensResponseCopyWith<$Res> {
  factory _$CountMessageTokensResponseCopyWith(_CountMessageTokensResponse value, $Res Function(_CountMessageTokensResponse) _then) = __$CountMessageTokensResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'input_tokens') int inputTokens
});




}
/// @nodoc
class __$CountMessageTokensResponseCopyWithImpl<$Res>
    implements _$CountMessageTokensResponseCopyWith<$Res> {
  __$CountMessageTokensResponseCopyWithImpl(this._self, this._then);

  final _CountMessageTokensResponse _self;
  final $Res Function(_CountMessageTokensResponse) _then;

/// Create a copy of CountMessageTokensResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inputTokens = null,}) {
  return _then(_CountMessageTokensResponse(
inputTokens: null == inputTokens ? _self.inputTokens : inputTokens // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CreateMessageRequestMetadata {

/// An external identifier for the user who is associated with the request.
///
/// This should be a uuid, hash value, or other opaque identifier. Anthropic may use
/// this id to help detect abuse. Do not include any identifying information such as
/// name, email address, or phone number.
@JsonKey(name: 'user_id', includeIfNull: false) String? get userId;
/// Create a copy of CreateMessageRequestMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateMessageRequestMetadataCopyWith<CreateMessageRequestMetadata> get copyWith => _$CreateMessageRequestMetadataCopyWithImpl<CreateMessageRequestMetadata>(this as CreateMessageRequestMetadata, _$identity);

  /// Serializes this CreateMessageRequestMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateMessageRequestMetadata&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'CreateMessageRequestMetadata(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $CreateMessageRequestMetadataCopyWith<$Res>  {
  factory $CreateMessageRequestMetadataCopyWith(CreateMessageRequestMetadata value, $Res Function(CreateMessageRequestMetadata) _then) = _$CreateMessageRequestMetadataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id', includeIfNull: false) String? userId
});




}
/// @nodoc
class _$CreateMessageRequestMetadataCopyWithImpl<$Res>
    implements $CreateMessageRequestMetadataCopyWith<$Res> {
  _$CreateMessageRequestMetadataCopyWithImpl(this._self, this._then);

  final CreateMessageRequestMetadata _self;
  final $Res Function(CreateMessageRequestMetadata) _then;

/// Create a copy of CreateMessageRequestMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,}) {
  return _then(_self.copyWith(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateMessageRequestMetadata].
extension CreateMessageRequestMetadataPatterns on CreateMessageRequestMetadata {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateMessageRequestMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateMessageRequestMetadata() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateMessageRequestMetadata value)  $default,){
final _that = this;
switch (_that) {
case _CreateMessageRequestMetadata():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateMessageRequestMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _CreateMessageRequestMetadata() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id', includeIfNull: false)  String? userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateMessageRequestMetadata() when $default != null:
return $default(_that.userId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id', includeIfNull: false)  String? userId)  $default,) {final _that = this;
switch (_that) {
case _CreateMessageRequestMetadata():
return $default(_that.userId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id', includeIfNull: false)  String? userId)?  $default,) {final _that = this;
switch (_that) {
case _CreateMessageRequestMetadata() when $default != null:
return $default(_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateMessageRequestMetadata extends CreateMessageRequestMetadata {
  const _CreateMessageRequestMetadata({@JsonKey(name: 'user_id', includeIfNull: false) this.userId}): super._();
  factory _CreateMessageRequestMetadata.fromJson(Map<String, dynamic> json) => _$CreateMessageRequestMetadataFromJson(json);

/// An external identifier for the user who is associated with the request.
///
/// This should be a uuid, hash value, or other opaque identifier. Anthropic may use
/// this id to help detect abuse. Do not include any identifying information such as
/// name, email address, or phone number.
@override@JsonKey(name: 'user_id', includeIfNull: false) final  String? userId;

/// Create a copy of CreateMessageRequestMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateMessageRequestMetadataCopyWith<_CreateMessageRequestMetadata> get copyWith => __$CreateMessageRequestMetadataCopyWithImpl<_CreateMessageRequestMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateMessageRequestMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateMessageRequestMetadata&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'CreateMessageRequestMetadata(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$CreateMessageRequestMetadataCopyWith<$Res> implements $CreateMessageRequestMetadataCopyWith<$Res> {
  factory _$CreateMessageRequestMetadataCopyWith(_CreateMessageRequestMetadata value, $Res Function(_CreateMessageRequestMetadata) _then) = __$CreateMessageRequestMetadataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id', includeIfNull: false) String? userId
});




}
/// @nodoc
class __$CreateMessageRequestMetadataCopyWithImpl<$Res>
    implements _$CreateMessageRequestMetadataCopyWith<$Res> {
  __$CreateMessageRequestMetadataCopyWithImpl(this._self, this._then);

  final _CreateMessageRequestMetadata _self;
  final $Res Function(_CreateMessageRequestMetadata) _then;

/// Create a copy of CreateMessageRequestMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,}) {
  return _then(_CreateMessageRequestMetadata(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ToolChoice {

/// How the model should use the provided tools. The model can use a specific tool,
/// any available tool, or decide by itself.
///
/// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
/// - `any`: tells Claude that it must use one of the provided tools, but doesn't force a particular tool.
/// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
 ToolChoiceType get type;/// The name of the tool to use.
@JsonKey(includeIfNull: false) String? get name;/// Whether to disable parallel tool use.
@JsonKey(name: 'disable_parallel_tool_use', includeIfNull: false) bool? get disableParallelToolUse;
/// Create a copy of ToolChoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolChoiceCopyWith<ToolChoice> get copyWith => _$ToolChoiceCopyWithImpl<ToolChoice>(this as ToolChoice, _$identity);

  /// Serializes this ToolChoice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolChoice&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.disableParallelToolUse, disableParallelToolUse) || other.disableParallelToolUse == disableParallelToolUse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,name,disableParallelToolUse);

@override
String toString() {
  return 'ToolChoice(type: $type, name: $name, disableParallelToolUse: $disableParallelToolUse)';
}


}

/// @nodoc
abstract mixin class $ToolChoiceCopyWith<$Res>  {
  factory $ToolChoiceCopyWith(ToolChoice value, $Res Function(ToolChoice) _then) = _$ToolChoiceCopyWithImpl;
@useResult
$Res call({
 ToolChoiceType type,@JsonKey(includeIfNull: false) String? name,@JsonKey(name: 'disable_parallel_tool_use', includeIfNull: false) bool? disableParallelToolUse
});




}
/// @nodoc
class _$ToolChoiceCopyWithImpl<$Res>
    implements $ToolChoiceCopyWith<$Res> {
  _$ToolChoiceCopyWithImpl(this._self, this._then);

  final ToolChoice _self;
  final $Res Function(ToolChoice) _then;

/// Create a copy of ToolChoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? name = freezed,Object? disableParallelToolUse = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ToolChoiceType,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,disableParallelToolUse: freezed == disableParallelToolUse ? _self.disableParallelToolUse : disableParallelToolUse // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolChoice].
extension ToolChoicePatterns on ToolChoice {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolChoice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolChoice() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolChoice value)  $default,){
final _that = this;
switch (_that) {
case _ToolChoice():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolChoice value)?  $default,){
final _that = this;
switch (_that) {
case _ToolChoice() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ToolChoiceType type, @JsonKey(includeIfNull: false)  String? name, @JsonKey(name: 'disable_parallel_tool_use', includeIfNull: false)  bool? disableParallelToolUse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolChoice() when $default != null:
return $default(_that.type,_that.name,_that.disableParallelToolUse);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ToolChoiceType type, @JsonKey(includeIfNull: false)  String? name, @JsonKey(name: 'disable_parallel_tool_use', includeIfNull: false)  bool? disableParallelToolUse)  $default,) {final _that = this;
switch (_that) {
case _ToolChoice():
return $default(_that.type,_that.name,_that.disableParallelToolUse);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ToolChoiceType type, @JsonKey(includeIfNull: false)  String? name, @JsonKey(name: 'disable_parallel_tool_use', includeIfNull: false)  bool? disableParallelToolUse)?  $default,) {final _that = this;
switch (_that) {
case _ToolChoice() when $default != null:
return $default(_that.type,_that.name,_that.disableParallelToolUse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolChoice extends ToolChoice {
  const _ToolChoice({required this.type, @JsonKey(includeIfNull: false) this.name, @JsonKey(name: 'disable_parallel_tool_use', includeIfNull: false) this.disableParallelToolUse}): super._();
  factory _ToolChoice.fromJson(Map<String, dynamic> json) => _$ToolChoiceFromJson(json);

/// How the model should use the provided tools. The model can use a specific tool,
/// any available tool, or decide by itself.
///
/// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
/// - `any`: tells Claude that it must use one of the provided tools, but doesn't force a particular tool.
/// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
@override final  ToolChoiceType type;
/// The name of the tool to use.
@override@JsonKey(includeIfNull: false) final  String? name;
/// Whether to disable parallel tool use.
@override@JsonKey(name: 'disable_parallel_tool_use', includeIfNull: false) final  bool? disableParallelToolUse;

/// Create a copy of ToolChoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolChoiceCopyWith<_ToolChoice> get copyWith => __$ToolChoiceCopyWithImpl<_ToolChoice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolChoiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolChoice&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.disableParallelToolUse, disableParallelToolUse) || other.disableParallelToolUse == disableParallelToolUse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,name,disableParallelToolUse);

@override
String toString() {
  return 'ToolChoice(type: $type, name: $name, disableParallelToolUse: $disableParallelToolUse)';
}


}

/// @nodoc
abstract mixin class _$ToolChoiceCopyWith<$Res> implements $ToolChoiceCopyWith<$Res> {
  factory _$ToolChoiceCopyWith(_ToolChoice value, $Res Function(_ToolChoice) _then) = __$ToolChoiceCopyWithImpl;
@override @useResult
$Res call({
 ToolChoiceType type,@JsonKey(includeIfNull: false) String? name,@JsonKey(name: 'disable_parallel_tool_use', includeIfNull: false) bool? disableParallelToolUse
});




}
/// @nodoc
class __$ToolChoiceCopyWithImpl<$Res>
    implements _$ToolChoiceCopyWith<$Res> {
  __$ToolChoiceCopyWithImpl(this._self, this._then);

  final _ToolChoice _self;
  final $Res Function(_ToolChoice) _then;

/// Create a copy of ToolChoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? name = freezed,Object? disableParallelToolUse = freezed,}) {
  return _then(_ToolChoice(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ToolChoiceType,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,disableParallelToolUse: freezed == disableParallelToolUse ? _self.disableParallelToolUse : disableParallelToolUse // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Message {

/// Unique object identifier.
///
/// The format and length of IDs may change over time.
@JsonKey(includeIfNull: false) String? get id;/// The content of the message.
@_MessageContentConverter() MessageContent get content;/// The role of the messages author.
 MessageRole get role;/// The model that handled the request.
@JsonKey(includeIfNull: false) String? get model;/// The reason that we stopped.
///
/// This may be one the following values:
///
/// - `"end_turn"`: the model reached a natural stopping point
/// - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
/// - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
/// - `"tool_use"`: the model invoked one or more tools
///
/// In non-streaming mode this value is always non-null. In streaming mode, it is
/// null in the `message_start` event and non-null otherwise.
@JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) StopReason? get stopReason;/// Which custom stop sequence was generated, if any.
///
/// This value will be a non-null string if one of your custom stop sequences was
/// generated.
@JsonKey(name: 'stop_sequence', includeIfNull: false) String? get stopSequence;/// Object type.
///
/// For Messages, this is always `"message"`.
@JsonKey(includeIfNull: false) String? get type;/// Billing and rate-limit usage.
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
@JsonKey(includeIfNull: false) Usage? get usage;
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCopyWith<Message> get copyWith => _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Message&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.role, role) || other.role == role)&&(identical(other.model, model) || other.model == model)&&(identical(other.stopReason, stopReason) || other.stopReason == stopReason)&&(identical(other.stopSequence, stopSequence) || other.stopSequence == stopSequence)&&(identical(other.type, type) || other.type == type)&&(identical(other.usage, usage) || other.usage == usage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,role,model,stopReason,stopSequence,type,usage);

@override
String toString() {
  return 'Message(id: $id, content: $content, role: $role, model: $model, stopReason: $stopReason, stopSequence: $stopSequence, type: $type, usage: $usage)';
}


}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res>  {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) = _$MessageCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? id,@_MessageContentConverter() MessageContent content, MessageRole role,@JsonKey(includeIfNull: false) String? model,@JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) StopReason? stopReason,@JsonKey(name: 'stop_sequence', includeIfNull: false) String? stopSequence,@JsonKey(includeIfNull: false) String? type,@JsonKey(includeIfNull: false) Usage? usage
});


$MessageContentCopyWith<$Res> get content;$UsageCopyWith<$Res>? get usage;

}
/// @nodoc
class _$MessageCopyWithImpl<$Res>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? content = null,Object? role = null,Object? model = freezed,Object? stopReason = freezed,Object? stopSequence = freezed,Object? type = freezed,Object? usage = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as MessageContent,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MessageRole,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,stopReason: freezed == stopReason ? _self.stopReason : stopReason // ignore: cast_nullable_to_non_nullable
as StopReason?,stopSequence: freezed == stopSequence ? _self.stopSequence : stopSequence // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,usage: freezed == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as Usage?,
  ));
}
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageContentCopyWith<$Res> get content {
  
  return $MessageContentCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UsageCopyWith<$Res>? get usage {
    if (_self.usage == null) {
    return null;
  }

  return $UsageCopyWith<$Res>(_self.usage!, (value) {
    return _then(_self.copyWith(usage: value));
  });
}
}


/// Adds pattern-matching-related methods to [Message].
extension MessagePatterns on Message {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Message value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Message value)  $default,){
final _that = this;
switch (_that) {
case _Message():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Message value)?  $default,){
final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id, @_MessageContentConverter()  MessageContent content,  MessageRole role, @JsonKey(includeIfNull: false)  String? model, @JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  StopReason? stopReason, @JsonKey(name: 'stop_sequence', includeIfNull: false)  String? stopSequence, @JsonKey(includeIfNull: false)  String? type, @JsonKey(includeIfNull: false)  Usage? usage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.content,_that.role,_that.model,_that.stopReason,_that.stopSequence,_that.type,_that.usage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id, @_MessageContentConverter()  MessageContent content,  MessageRole role, @JsonKey(includeIfNull: false)  String? model, @JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  StopReason? stopReason, @JsonKey(name: 'stop_sequence', includeIfNull: false)  String? stopSequence, @JsonKey(includeIfNull: false)  String? type, @JsonKey(includeIfNull: false)  Usage? usage)  $default,) {final _that = this;
switch (_that) {
case _Message():
return $default(_that.id,_that.content,_that.role,_that.model,_that.stopReason,_that.stopSequence,_that.type,_that.usage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? id, @_MessageContentConverter()  MessageContent content,  MessageRole role, @JsonKey(includeIfNull: false)  String? model, @JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  StopReason? stopReason, @JsonKey(name: 'stop_sequence', includeIfNull: false)  String? stopSequence, @JsonKey(includeIfNull: false)  String? type, @JsonKey(includeIfNull: false)  Usage? usage)?  $default,) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.content,_that.role,_that.model,_that.stopReason,_that.stopSequence,_that.type,_that.usage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Message extends Message {
  const _Message({@JsonKey(includeIfNull: false) this.id, @_MessageContentConverter() required this.content, required this.role, @JsonKey(includeIfNull: false) this.model, @JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.stopReason, @JsonKey(name: 'stop_sequence', includeIfNull: false) this.stopSequence, @JsonKey(includeIfNull: false) this.type, @JsonKey(includeIfNull: false) this.usage}): super._();
  factory _Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

/// Unique object identifier.
///
/// The format and length of IDs may change over time.
@override@JsonKey(includeIfNull: false) final  String? id;
/// The content of the message.
@override@_MessageContentConverter() final  MessageContent content;
/// The role of the messages author.
@override final  MessageRole role;
/// The model that handled the request.
@override@JsonKey(includeIfNull: false) final  String? model;
/// The reason that we stopped.
///
/// This may be one the following values:
///
/// - `"end_turn"`: the model reached a natural stopping point
/// - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
/// - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
/// - `"tool_use"`: the model invoked one or more tools
///
/// In non-streaming mode this value is always non-null. In streaming mode, it is
/// null in the `message_start` event and non-null otherwise.
@override@JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  StopReason? stopReason;
/// Which custom stop sequence was generated, if any.
///
/// This value will be a non-null string if one of your custom stop sequences was
/// generated.
@override@JsonKey(name: 'stop_sequence', includeIfNull: false) final  String? stopSequence;
/// Object type.
///
/// For Messages, this is always `"message"`.
@override@JsonKey(includeIfNull: false) final  String? type;
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
@override@JsonKey(includeIfNull: false) final  Usage? usage;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageCopyWith<_Message> get copyWith => __$MessageCopyWithImpl<_Message>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Message&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.role, role) || other.role == role)&&(identical(other.model, model) || other.model == model)&&(identical(other.stopReason, stopReason) || other.stopReason == stopReason)&&(identical(other.stopSequence, stopSequence) || other.stopSequence == stopSequence)&&(identical(other.type, type) || other.type == type)&&(identical(other.usage, usage) || other.usage == usage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,role,model,stopReason,stopSequence,type,usage);

@override
String toString() {
  return 'Message(id: $id, content: $content, role: $role, model: $model, stopReason: $stopReason, stopSequence: $stopSequence, type: $type, usage: $usage)';
}


}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) = __$MessageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? id,@_MessageContentConverter() MessageContent content, MessageRole role,@JsonKey(includeIfNull: false) String? model,@JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) StopReason? stopReason,@JsonKey(name: 'stop_sequence', includeIfNull: false) String? stopSequence,@JsonKey(includeIfNull: false) String? type,@JsonKey(includeIfNull: false) Usage? usage
});


@override $MessageContentCopyWith<$Res> get content;@override $UsageCopyWith<$Res>? get usage;

}
/// @nodoc
class __$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? content = null,Object? role = null,Object? model = freezed,Object? stopReason = freezed,Object? stopSequence = freezed,Object? type = freezed,Object? usage = freezed,}) {
  return _then(_Message(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as MessageContent,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MessageRole,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,stopReason: freezed == stopReason ? _self.stopReason : stopReason // ignore: cast_nullable_to_non_nullable
as StopReason?,stopSequence: freezed == stopSequence ? _self.stopSequence : stopSequence // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,usage: freezed == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as Usage?,
  ));
}

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageContentCopyWith<$Res> get content {
  
  return $MessageContentCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UsageCopyWith<$Res>? get usage {
    if (_self.usage == null) {
    return null;
  }

  return $UsageCopyWith<$Res>(_self.usage!, (value) {
    return _then(_self.copyWith(usage: value));
  });
}
}

MessageContent _$MessageContentFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'blocks':
          return MessageContentBlocks.fromJson(
            json
          );
                case 'text':
          return MessageContentText.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'MessageContent',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$MessageContent {

 Object get value;

  /// Serializes this MessageContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageContent&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'MessageContent(value: $value)';
}


}

/// @nodoc
class $MessageContentCopyWith<$Res>  {
$MessageContentCopyWith(MessageContent _, $Res Function(MessageContent) __);
}


/// Adds pattern-matching-related methods to [MessageContent].
extension MessageContentPatterns on MessageContent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MessageContentBlocks value)?  blocks,TResult Function( MessageContentText value)?  text,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MessageContentBlocks() when blocks != null:
return blocks(_that);case MessageContentText() when text != null:
return text(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MessageContentBlocks value)  blocks,required TResult Function( MessageContentText value)  text,}){
final _that = this;
switch (_that) {
case MessageContentBlocks():
return blocks(_that);case MessageContentText():
return text(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MessageContentBlocks value)?  blocks,TResult? Function( MessageContentText value)?  text,}){
final _that = this;
switch (_that) {
case MessageContentBlocks() when blocks != null:
return blocks(_that);case MessageContentText() when text != null:
return text(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Block> value)?  blocks,TResult Function( String value)?  text,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MessageContentBlocks() when blocks != null:
return blocks(_that.value);case MessageContentText() when text != null:
return text(_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Block> value)  blocks,required TResult Function( String value)  text,}) {final _that = this;
switch (_that) {
case MessageContentBlocks():
return blocks(_that.value);case MessageContentText():
return text(_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Block> value)?  blocks,TResult? Function( String value)?  text,}) {final _that = this;
switch (_that) {
case MessageContentBlocks() when blocks != null:
return blocks(_that.value);case MessageContentText() when text != null:
return text(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class MessageContentBlocks extends MessageContent {
  const MessageContentBlocks(final  List<Block> value, {final  String? $type}): _value = value,$type = $type ?? 'blocks',super._();
  factory MessageContentBlocks.fromJson(Map<String, dynamic> json) => _$MessageContentBlocksFromJson(json);

 final  List<Block> _value;
@override List<Block> get value {
  if (_value is EqualUnmodifiableListView) return _value;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_value);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MessageContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageContentBlocksCopyWith<MessageContentBlocks> get copyWith => _$MessageContentBlocksCopyWithImpl<MessageContentBlocks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageContentBlocksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageContentBlocks&&const DeepCollectionEquality().equals(other._value, _value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_value));

@override
String toString() {
  return 'MessageContent.blocks(value: $value)';
}


}

/// @nodoc
abstract mixin class $MessageContentBlocksCopyWith<$Res> implements $MessageContentCopyWith<$Res> {
  factory $MessageContentBlocksCopyWith(MessageContentBlocks value, $Res Function(MessageContentBlocks) _then) = _$MessageContentBlocksCopyWithImpl;
@useResult
$Res call({
 List<Block> value
});




}
/// @nodoc
class _$MessageContentBlocksCopyWithImpl<$Res>
    implements $MessageContentBlocksCopyWith<$Res> {
  _$MessageContentBlocksCopyWithImpl(this._self, this._then);

  final MessageContentBlocks _self;
  final $Res Function(MessageContentBlocks) _then;

/// Create a copy of MessageContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(MessageContentBlocks(
null == value ? _self._value : value // ignore: cast_nullable_to_non_nullable
as List<Block>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MessageContentText extends MessageContent {
  const MessageContentText(this.value, {final  String? $type}): $type = $type ?? 'text',super._();
  factory MessageContentText.fromJson(Map<String, dynamic> json) => _$MessageContentTextFromJson(json);

@override final  String value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MessageContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageContentTextCopyWith<MessageContentText> get copyWith => _$MessageContentTextCopyWithImpl<MessageContentText>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageContentTextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageContentText&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'MessageContent.text(value: $value)';
}


}

/// @nodoc
abstract mixin class $MessageContentTextCopyWith<$Res> implements $MessageContentCopyWith<$Res> {
  factory $MessageContentTextCopyWith(MessageContentText value, $Res Function(MessageContentText) _then) = _$MessageContentTextCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$MessageContentTextCopyWithImpl<$Res>
    implements $MessageContentTextCopyWith<$Res> {
  _$MessageContentTextCopyWithImpl(this._self, this._then);

  final MessageContentText _self;
  final $Res Function(MessageContentText) _then;

/// Create a copy of MessageContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(MessageContentText(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ImageBlockSource {

/// The base64-encoded image data.
 String get data;/// The media type of the image.
@JsonKey(name: 'media_type') ImageBlockSourceMediaType get mediaType;/// The type of image source.
 ImageBlockSourceType get type;
/// Create a copy of ImageBlockSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageBlockSourceCopyWith<ImageBlockSource> get copyWith => _$ImageBlockSourceCopyWithImpl<ImageBlockSource>(this as ImageBlockSource, _$identity);

  /// Serializes this ImageBlockSource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageBlockSource&&(identical(other.data, data) || other.data == data)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,mediaType,type);

@override
String toString() {
  return 'ImageBlockSource(data: $data, mediaType: $mediaType, type: $type)';
}


}

/// @nodoc
abstract mixin class $ImageBlockSourceCopyWith<$Res>  {
  factory $ImageBlockSourceCopyWith(ImageBlockSource value, $Res Function(ImageBlockSource) _then) = _$ImageBlockSourceCopyWithImpl;
@useResult
$Res call({
 String data,@JsonKey(name: 'media_type') ImageBlockSourceMediaType mediaType, ImageBlockSourceType type
});




}
/// @nodoc
class _$ImageBlockSourceCopyWithImpl<$Res>
    implements $ImageBlockSourceCopyWith<$Res> {
  _$ImageBlockSourceCopyWithImpl(this._self, this._then);

  final ImageBlockSource _self;
  final $Res Function(ImageBlockSource) _then;

/// Create a copy of ImageBlockSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? mediaType = null,Object? type = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as ImageBlockSourceMediaType,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ImageBlockSourceType,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageBlockSource].
extension ImageBlockSourcePatterns on ImageBlockSource {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageBlockSource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageBlockSource() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageBlockSource value)  $default,){
final _that = this;
switch (_that) {
case _ImageBlockSource():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageBlockSource value)?  $default,){
final _that = this;
switch (_that) {
case _ImageBlockSource() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String data, @JsonKey(name: 'media_type')  ImageBlockSourceMediaType mediaType,  ImageBlockSourceType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageBlockSource() when $default != null:
return $default(_that.data,_that.mediaType,_that.type);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String data, @JsonKey(name: 'media_type')  ImageBlockSourceMediaType mediaType,  ImageBlockSourceType type)  $default,) {final _that = this;
switch (_that) {
case _ImageBlockSource():
return $default(_that.data,_that.mediaType,_that.type);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String data, @JsonKey(name: 'media_type')  ImageBlockSourceMediaType mediaType,  ImageBlockSourceType type)?  $default,) {final _that = this;
switch (_that) {
case _ImageBlockSource() when $default != null:
return $default(_that.data,_that.mediaType,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImageBlockSource extends ImageBlockSource {
  const _ImageBlockSource({required this.data, @JsonKey(name: 'media_type') required this.mediaType, required this.type}): super._();
  factory _ImageBlockSource.fromJson(Map<String, dynamic> json) => _$ImageBlockSourceFromJson(json);

/// The base64-encoded image data.
@override final  String data;
/// The media type of the image.
@override@JsonKey(name: 'media_type') final  ImageBlockSourceMediaType mediaType;
/// The type of image source.
@override final  ImageBlockSourceType type;

/// Create a copy of ImageBlockSource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageBlockSourceCopyWith<_ImageBlockSource> get copyWith => __$ImageBlockSourceCopyWithImpl<_ImageBlockSource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageBlockSourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageBlockSource&&(identical(other.data, data) || other.data == data)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,mediaType,type);

@override
String toString() {
  return 'ImageBlockSource(data: $data, mediaType: $mediaType, type: $type)';
}


}

/// @nodoc
abstract mixin class _$ImageBlockSourceCopyWith<$Res> implements $ImageBlockSourceCopyWith<$Res> {
  factory _$ImageBlockSourceCopyWith(_ImageBlockSource value, $Res Function(_ImageBlockSource) _then) = __$ImageBlockSourceCopyWithImpl;
@override @useResult
$Res call({
 String data,@JsonKey(name: 'media_type') ImageBlockSourceMediaType mediaType, ImageBlockSourceType type
});




}
/// @nodoc
class __$ImageBlockSourceCopyWithImpl<$Res>
    implements _$ImageBlockSourceCopyWith<$Res> {
  __$ImageBlockSourceCopyWithImpl(this._self, this._then);

  final _ImageBlockSource _self;
  final $Res Function(_ImageBlockSource) _then;

/// Create a copy of ImageBlockSource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? mediaType = null,Object? type = null,}) {
  return _then(_ImageBlockSource(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as ImageBlockSourceMediaType,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ImageBlockSourceType,
  ));
}


}


/// @nodoc
mixin _$CacheControlEphemeral {

///
 CacheControlEphemeralType get type;
/// Create a copy of CacheControlEphemeral
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CacheControlEphemeralCopyWith<CacheControlEphemeral> get copyWith => _$CacheControlEphemeralCopyWithImpl<CacheControlEphemeral>(this as CacheControlEphemeral, _$identity);

  /// Serializes this CacheControlEphemeral to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheControlEphemeral&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'CacheControlEphemeral(type: $type)';
}


}

/// @nodoc
abstract mixin class $CacheControlEphemeralCopyWith<$Res>  {
  factory $CacheControlEphemeralCopyWith(CacheControlEphemeral value, $Res Function(CacheControlEphemeral) _then) = _$CacheControlEphemeralCopyWithImpl;
@useResult
$Res call({
 CacheControlEphemeralType type
});




}
/// @nodoc
class _$CacheControlEphemeralCopyWithImpl<$Res>
    implements $CacheControlEphemeralCopyWith<$Res> {
  _$CacheControlEphemeralCopyWithImpl(this._self, this._then);

  final CacheControlEphemeral _self;
  final $Res Function(CacheControlEphemeral) _then;

/// Create a copy of CacheControlEphemeral
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CacheControlEphemeralType,
  ));
}

}


/// Adds pattern-matching-related methods to [CacheControlEphemeral].
extension CacheControlEphemeralPatterns on CacheControlEphemeral {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CacheControlEphemeral value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CacheControlEphemeral() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CacheControlEphemeral value)  $default,){
final _that = this;
switch (_that) {
case _CacheControlEphemeral():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CacheControlEphemeral value)?  $default,){
final _that = this;
switch (_that) {
case _CacheControlEphemeral() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CacheControlEphemeralType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CacheControlEphemeral() when $default != null:
return $default(_that.type);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CacheControlEphemeralType type)  $default,) {final _that = this;
switch (_that) {
case _CacheControlEphemeral():
return $default(_that.type);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CacheControlEphemeralType type)?  $default,) {final _that = this;
switch (_that) {
case _CacheControlEphemeral() when $default != null:
return $default(_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CacheControlEphemeral extends CacheControlEphemeral {
  const _CacheControlEphemeral({this.type = CacheControlEphemeralType.ephemeral}): super._();
  factory _CacheControlEphemeral.fromJson(Map<String, dynamic> json) => _$CacheControlEphemeralFromJson(json);

///
@override@JsonKey() final  CacheControlEphemeralType type;

/// Create a copy of CacheControlEphemeral
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CacheControlEphemeralCopyWith<_CacheControlEphemeral> get copyWith => __$CacheControlEphemeralCopyWithImpl<_CacheControlEphemeral>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CacheControlEphemeralToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CacheControlEphemeral&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'CacheControlEphemeral(type: $type)';
}


}

/// @nodoc
abstract mixin class _$CacheControlEphemeralCopyWith<$Res> implements $CacheControlEphemeralCopyWith<$Res> {
  factory _$CacheControlEphemeralCopyWith(_CacheControlEphemeral value, $Res Function(_CacheControlEphemeral) _then) = __$CacheControlEphemeralCopyWithImpl;
@override @useResult
$Res call({
 CacheControlEphemeralType type
});




}
/// @nodoc
class __$CacheControlEphemeralCopyWithImpl<$Res>
    implements _$CacheControlEphemeralCopyWith<$Res> {
  __$CacheControlEphemeralCopyWithImpl(this._self, this._then);

  final _CacheControlEphemeral _self;
  final $Res Function(_CacheControlEphemeral) _then;

/// Create a copy of CacheControlEphemeral
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(_CacheControlEphemeral(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CacheControlEphemeralType,
  ));
}


}


/// @nodoc
mixin _$Usage {

/// The number of input tokens which were used.
@JsonKey(name: 'input_tokens') int get inputTokens;/// The number of output tokens which were used.
@JsonKey(name: 'output_tokens') int get outputTokens;/// The number of input tokens read from the cache.
@JsonKey(name: 'cache_creation_input_tokens', includeIfNull: false) int? get cacheCreationInputTokens;/// The number of input tokens used to create the cache entry.
@JsonKey(name: 'cache_read_input_tokens', includeIfNull: false) int? get cacheReadInputTokens;
/// Create a copy of Usage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsageCopyWith<Usage> get copyWith => _$UsageCopyWithImpl<Usage>(this as Usage, _$identity);

  /// Serializes this Usage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Usage&&(identical(other.inputTokens, inputTokens) || other.inputTokens == inputTokens)&&(identical(other.outputTokens, outputTokens) || other.outputTokens == outputTokens)&&(identical(other.cacheCreationInputTokens, cacheCreationInputTokens) || other.cacheCreationInputTokens == cacheCreationInputTokens)&&(identical(other.cacheReadInputTokens, cacheReadInputTokens) || other.cacheReadInputTokens == cacheReadInputTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputTokens,outputTokens,cacheCreationInputTokens,cacheReadInputTokens);

@override
String toString() {
  return 'Usage(inputTokens: $inputTokens, outputTokens: $outputTokens, cacheCreationInputTokens: $cacheCreationInputTokens, cacheReadInputTokens: $cacheReadInputTokens)';
}


}

/// @nodoc
abstract mixin class $UsageCopyWith<$Res>  {
  factory $UsageCopyWith(Usage value, $Res Function(Usage) _then) = _$UsageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'input_tokens') int inputTokens,@JsonKey(name: 'output_tokens') int outputTokens,@JsonKey(name: 'cache_creation_input_tokens', includeIfNull: false) int? cacheCreationInputTokens,@JsonKey(name: 'cache_read_input_tokens', includeIfNull: false) int? cacheReadInputTokens
});




}
/// @nodoc
class _$UsageCopyWithImpl<$Res>
    implements $UsageCopyWith<$Res> {
  _$UsageCopyWithImpl(this._self, this._then);

  final Usage _self;
  final $Res Function(Usage) _then;

/// Create a copy of Usage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inputTokens = null,Object? outputTokens = null,Object? cacheCreationInputTokens = freezed,Object? cacheReadInputTokens = freezed,}) {
  return _then(_self.copyWith(
inputTokens: null == inputTokens ? _self.inputTokens : inputTokens // ignore: cast_nullable_to_non_nullable
as int,outputTokens: null == outputTokens ? _self.outputTokens : outputTokens // ignore: cast_nullable_to_non_nullable
as int,cacheCreationInputTokens: freezed == cacheCreationInputTokens ? _self.cacheCreationInputTokens : cacheCreationInputTokens // ignore: cast_nullable_to_non_nullable
as int?,cacheReadInputTokens: freezed == cacheReadInputTokens ? _self.cacheReadInputTokens : cacheReadInputTokens // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Usage].
extension UsagePatterns on Usage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Usage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Usage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Usage value)  $default,){
final _that = this;
switch (_that) {
case _Usage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Usage value)?  $default,){
final _that = this;
switch (_that) {
case _Usage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'input_tokens')  int inputTokens, @JsonKey(name: 'output_tokens')  int outputTokens, @JsonKey(name: 'cache_creation_input_tokens', includeIfNull: false)  int? cacheCreationInputTokens, @JsonKey(name: 'cache_read_input_tokens', includeIfNull: false)  int? cacheReadInputTokens)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Usage() when $default != null:
return $default(_that.inputTokens,_that.outputTokens,_that.cacheCreationInputTokens,_that.cacheReadInputTokens);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'input_tokens')  int inputTokens, @JsonKey(name: 'output_tokens')  int outputTokens, @JsonKey(name: 'cache_creation_input_tokens', includeIfNull: false)  int? cacheCreationInputTokens, @JsonKey(name: 'cache_read_input_tokens', includeIfNull: false)  int? cacheReadInputTokens)  $default,) {final _that = this;
switch (_that) {
case _Usage():
return $default(_that.inputTokens,_that.outputTokens,_that.cacheCreationInputTokens,_that.cacheReadInputTokens);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'input_tokens')  int inputTokens, @JsonKey(name: 'output_tokens')  int outputTokens, @JsonKey(name: 'cache_creation_input_tokens', includeIfNull: false)  int? cacheCreationInputTokens, @JsonKey(name: 'cache_read_input_tokens', includeIfNull: false)  int? cacheReadInputTokens)?  $default,) {final _that = this;
switch (_that) {
case _Usage() when $default != null:
return $default(_that.inputTokens,_that.outputTokens,_that.cacheCreationInputTokens,_that.cacheReadInputTokens);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Usage extends Usage {
  const _Usage({@JsonKey(name: 'input_tokens') required this.inputTokens, @JsonKey(name: 'output_tokens') required this.outputTokens, @JsonKey(name: 'cache_creation_input_tokens', includeIfNull: false) this.cacheCreationInputTokens, @JsonKey(name: 'cache_read_input_tokens', includeIfNull: false) this.cacheReadInputTokens}): super._();
  factory _Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

/// The number of input tokens which were used.
@override@JsonKey(name: 'input_tokens') final  int inputTokens;
/// The number of output tokens which were used.
@override@JsonKey(name: 'output_tokens') final  int outputTokens;
/// The number of input tokens read from the cache.
@override@JsonKey(name: 'cache_creation_input_tokens', includeIfNull: false) final  int? cacheCreationInputTokens;
/// The number of input tokens used to create the cache entry.
@override@JsonKey(name: 'cache_read_input_tokens', includeIfNull: false) final  int? cacheReadInputTokens;

/// Create a copy of Usage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsageCopyWith<_Usage> get copyWith => __$UsageCopyWithImpl<_Usage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Usage&&(identical(other.inputTokens, inputTokens) || other.inputTokens == inputTokens)&&(identical(other.outputTokens, outputTokens) || other.outputTokens == outputTokens)&&(identical(other.cacheCreationInputTokens, cacheCreationInputTokens) || other.cacheCreationInputTokens == cacheCreationInputTokens)&&(identical(other.cacheReadInputTokens, cacheReadInputTokens) || other.cacheReadInputTokens == cacheReadInputTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputTokens,outputTokens,cacheCreationInputTokens,cacheReadInputTokens);

@override
String toString() {
  return 'Usage(inputTokens: $inputTokens, outputTokens: $outputTokens, cacheCreationInputTokens: $cacheCreationInputTokens, cacheReadInputTokens: $cacheReadInputTokens)';
}


}

/// @nodoc
abstract mixin class _$UsageCopyWith<$Res> implements $UsageCopyWith<$Res> {
  factory _$UsageCopyWith(_Usage value, $Res Function(_Usage) _then) = __$UsageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'input_tokens') int inputTokens,@JsonKey(name: 'output_tokens') int outputTokens,@JsonKey(name: 'cache_creation_input_tokens', includeIfNull: false) int? cacheCreationInputTokens,@JsonKey(name: 'cache_read_input_tokens', includeIfNull: false) int? cacheReadInputTokens
});




}
/// @nodoc
class __$UsageCopyWithImpl<$Res>
    implements _$UsageCopyWith<$Res> {
  __$UsageCopyWithImpl(this._self, this._then);

  final _Usage _self;
  final $Res Function(_Usage) _then;

/// Create a copy of Usage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inputTokens = null,Object? outputTokens = null,Object? cacheCreationInputTokens = freezed,Object? cacheReadInputTokens = freezed,}) {
  return _then(_Usage(
inputTokens: null == inputTokens ? _self.inputTokens : inputTokens // ignore: cast_nullable_to_non_nullable
as int,outputTokens: null == outputTokens ? _self.outputTokens : outputTokens // ignore: cast_nullable_to_non_nullable
as int,cacheCreationInputTokens: freezed == cacheCreationInputTokens ? _self.cacheCreationInputTokens : cacheCreationInputTokens // ignore: cast_nullable_to_non_nullable
as int?,cacheReadInputTokens: freezed == cacheReadInputTokens ? _self.cacheReadInputTokens : cacheReadInputTokens // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$CreateMessageBatchRequest {

/// List of requests for prompt completion. Each is an individual request to create a Message.
 List<BatchMessageRequest> get requests;
/// Create a copy of CreateMessageBatchRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateMessageBatchRequestCopyWith<CreateMessageBatchRequest> get copyWith => _$CreateMessageBatchRequestCopyWithImpl<CreateMessageBatchRequest>(this as CreateMessageBatchRequest, _$identity);

  /// Serializes this CreateMessageBatchRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateMessageBatchRequest&&const DeepCollectionEquality().equals(other.requests, requests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(requests));

@override
String toString() {
  return 'CreateMessageBatchRequest(requests: $requests)';
}


}

/// @nodoc
abstract mixin class $CreateMessageBatchRequestCopyWith<$Res>  {
  factory $CreateMessageBatchRequestCopyWith(CreateMessageBatchRequest value, $Res Function(CreateMessageBatchRequest) _then) = _$CreateMessageBatchRequestCopyWithImpl;
@useResult
$Res call({
 List<BatchMessageRequest> requests
});




}
/// @nodoc
class _$CreateMessageBatchRequestCopyWithImpl<$Res>
    implements $CreateMessageBatchRequestCopyWith<$Res> {
  _$CreateMessageBatchRequestCopyWithImpl(this._self, this._then);

  final CreateMessageBatchRequest _self;
  final $Res Function(CreateMessageBatchRequest) _then;

/// Create a copy of CreateMessageBatchRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requests = null,}) {
  return _then(_self.copyWith(
requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as List<BatchMessageRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateMessageBatchRequest].
extension CreateMessageBatchRequestPatterns on CreateMessageBatchRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateMessageBatchRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateMessageBatchRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateMessageBatchRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateMessageBatchRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateMessageBatchRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateMessageBatchRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BatchMessageRequest> requests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateMessageBatchRequest() when $default != null:
return $default(_that.requests);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BatchMessageRequest> requests)  $default,) {final _that = this;
switch (_that) {
case _CreateMessageBatchRequest():
return $default(_that.requests);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BatchMessageRequest> requests)?  $default,) {final _that = this;
switch (_that) {
case _CreateMessageBatchRequest() when $default != null:
return $default(_that.requests);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateMessageBatchRequest extends CreateMessageBatchRequest {
  const _CreateMessageBatchRequest({required final  List<BatchMessageRequest> requests}): _requests = requests,super._();
  factory _CreateMessageBatchRequest.fromJson(Map<String, dynamic> json) => _$CreateMessageBatchRequestFromJson(json);

/// List of requests for prompt completion. Each is an individual request to create a Message.
 final  List<BatchMessageRequest> _requests;
/// List of requests for prompt completion. Each is an individual request to create a Message.
@override List<BatchMessageRequest> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}


/// Create a copy of CreateMessageBatchRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateMessageBatchRequestCopyWith<_CreateMessageBatchRequest> get copyWith => __$CreateMessageBatchRequestCopyWithImpl<_CreateMessageBatchRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateMessageBatchRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateMessageBatchRequest&&const DeepCollectionEquality().equals(other._requests, _requests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_requests));

@override
String toString() {
  return 'CreateMessageBatchRequest(requests: $requests)';
}


}

/// @nodoc
abstract mixin class _$CreateMessageBatchRequestCopyWith<$Res> implements $CreateMessageBatchRequestCopyWith<$Res> {
  factory _$CreateMessageBatchRequestCopyWith(_CreateMessageBatchRequest value, $Res Function(_CreateMessageBatchRequest) _then) = __$CreateMessageBatchRequestCopyWithImpl;
@override @useResult
$Res call({
 List<BatchMessageRequest> requests
});




}
/// @nodoc
class __$CreateMessageBatchRequestCopyWithImpl<$Res>
    implements _$CreateMessageBatchRequestCopyWith<$Res> {
  __$CreateMessageBatchRequestCopyWithImpl(this._self, this._then);

  final _CreateMessageBatchRequest _self;
  final $Res Function(_CreateMessageBatchRequest) _then;

/// Create a copy of CreateMessageBatchRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requests = null,}) {
  return _then(_CreateMessageBatchRequest(
requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<BatchMessageRequest>,
  ));
}


}


/// @nodoc
mixin _$BatchMessageRequest {

/// Developer-provided ID created for each request in a Message Batch. Useful for
/// matching results to requests, as results may be given out of request order.
///
/// Must be unique for each request within the Message Batch.
@JsonKey(name: 'custom_id') String get customId;/// The request parameters for creating a message.
 CreateMessageRequest get params;
/// Create a copy of BatchMessageRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatchMessageRequestCopyWith<BatchMessageRequest> get copyWith => _$BatchMessageRequestCopyWithImpl<BatchMessageRequest>(this as BatchMessageRequest, _$identity);

  /// Serializes this BatchMessageRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatchMessageRequest&&(identical(other.customId, customId) || other.customId == customId)&&(identical(other.params, params) || other.params == params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customId,params);

@override
String toString() {
  return 'BatchMessageRequest(customId: $customId, params: $params)';
}


}

/// @nodoc
abstract mixin class $BatchMessageRequestCopyWith<$Res>  {
  factory $BatchMessageRequestCopyWith(BatchMessageRequest value, $Res Function(BatchMessageRequest) _then) = _$BatchMessageRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'custom_id') String customId, CreateMessageRequest params
});


$CreateMessageRequestCopyWith<$Res> get params;

}
/// @nodoc
class _$BatchMessageRequestCopyWithImpl<$Res>
    implements $BatchMessageRequestCopyWith<$Res> {
  _$BatchMessageRequestCopyWithImpl(this._self, this._then);

  final BatchMessageRequest _self;
  final $Res Function(BatchMessageRequest) _then;

/// Create a copy of BatchMessageRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customId = null,Object? params = null,}) {
  return _then(_self.copyWith(
customId: null == customId ? _self.customId : customId // ignore: cast_nullable_to_non_nullable
as String,params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as CreateMessageRequest,
  ));
}
/// Create a copy of BatchMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateMessageRequestCopyWith<$Res> get params {
  
  return $CreateMessageRequestCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}


/// Adds pattern-matching-related methods to [BatchMessageRequest].
extension BatchMessageRequestPatterns on BatchMessageRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatchMessageRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatchMessageRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatchMessageRequest value)  $default,){
final _that = this;
switch (_that) {
case _BatchMessageRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatchMessageRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BatchMessageRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'custom_id')  String customId,  CreateMessageRequest params)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatchMessageRequest() when $default != null:
return $default(_that.customId,_that.params);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'custom_id')  String customId,  CreateMessageRequest params)  $default,) {final _that = this;
switch (_that) {
case _BatchMessageRequest():
return $default(_that.customId,_that.params);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'custom_id')  String customId,  CreateMessageRequest params)?  $default,) {final _that = this;
switch (_that) {
case _BatchMessageRequest() when $default != null:
return $default(_that.customId,_that.params);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BatchMessageRequest extends BatchMessageRequest {
  const _BatchMessageRequest({@JsonKey(name: 'custom_id') required this.customId, required this.params}): super._();
  factory _BatchMessageRequest.fromJson(Map<String, dynamic> json) => _$BatchMessageRequestFromJson(json);

/// Developer-provided ID created for each request in a Message Batch. Useful for
/// matching results to requests, as results may be given out of request order.
///
/// Must be unique for each request within the Message Batch.
@override@JsonKey(name: 'custom_id') final  String customId;
/// The request parameters for creating a message.
@override final  CreateMessageRequest params;

/// Create a copy of BatchMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatchMessageRequestCopyWith<_BatchMessageRequest> get copyWith => __$BatchMessageRequestCopyWithImpl<_BatchMessageRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BatchMessageRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatchMessageRequest&&(identical(other.customId, customId) || other.customId == customId)&&(identical(other.params, params) || other.params == params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customId,params);

@override
String toString() {
  return 'BatchMessageRequest(customId: $customId, params: $params)';
}


}

/// @nodoc
abstract mixin class _$BatchMessageRequestCopyWith<$Res> implements $BatchMessageRequestCopyWith<$Res> {
  factory _$BatchMessageRequestCopyWith(_BatchMessageRequest value, $Res Function(_BatchMessageRequest) _then) = __$BatchMessageRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'custom_id') String customId, CreateMessageRequest params
});


@override $CreateMessageRequestCopyWith<$Res> get params;

}
/// @nodoc
class __$BatchMessageRequestCopyWithImpl<$Res>
    implements _$BatchMessageRequestCopyWith<$Res> {
  __$BatchMessageRequestCopyWithImpl(this._self, this._then);

  final _BatchMessageRequest _self;
  final $Res Function(_BatchMessageRequest) _then;

/// Create a copy of BatchMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customId = null,Object? params = null,}) {
  return _then(_BatchMessageRequest(
customId: null == customId ? _self.customId : customId // ignore: cast_nullable_to_non_nullable
as String,params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as CreateMessageRequest,
  ));
}

/// Create a copy of BatchMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateMessageRequestCopyWith<$Res> get params {
  
  return $CreateMessageRequestCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}


/// @nodoc
mixin _$MessageBatch {

/// Unique object identifier for the message batch.
 String get id;/// RFC 3339 datetime string representing the time at which the Message Batch was created.
@JsonKey(name: 'created_at') String get createdAt;/// RFC 3339 datetime string representing the time at which the Message Batch will expire and end processing, which is 24 hours after creation.
@JsonKey(name: 'expires_at') String get expiresAt;/// Processing status of the Message Batch.
@JsonKey(name: 'processing_status') MessageBatchProcessingStatus get processingStatus;/// Tallies requests within the Message Batch, categorized by their status.
@JsonKey(name: 'request_counts') MessageBatchRequestCounts get requestCounts;/// URL to a `.jsonl` file containing the results of the Message Batch requests. Specified only once processing ends.
@JsonKey(name: 'results_url', includeIfNull: false) String? get resultsUrl;/// Object type. For Message Batches, this is always `"message_batch"`.
 MessageBatchType get type;
/// Create a copy of MessageBatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageBatchCopyWith<MessageBatch> get copyWith => _$MessageBatchCopyWithImpl<MessageBatch>(this as MessageBatch, _$identity);

  /// Serializes this MessageBatch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageBatch&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.processingStatus, processingStatus) || other.processingStatus == processingStatus)&&(identical(other.requestCounts, requestCounts) || other.requestCounts == requestCounts)&&(identical(other.resultsUrl, resultsUrl) || other.resultsUrl == resultsUrl)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,expiresAt,processingStatus,requestCounts,resultsUrl,type);

@override
String toString() {
  return 'MessageBatch(id: $id, createdAt: $createdAt, expiresAt: $expiresAt, processingStatus: $processingStatus, requestCounts: $requestCounts, resultsUrl: $resultsUrl, type: $type)';
}


}

/// @nodoc
abstract mixin class $MessageBatchCopyWith<$Res>  {
  factory $MessageBatchCopyWith(MessageBatch value, $Res Function(MessageBatch) _then) = _$MessageBatchCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'expires_at') String expiresAt,@JsonKey(name: 'processing_status') MessageBatchProcessingStatus processingStatus,@JsonKey(name: 'request_counts') MessageBatchRequestCounts requestCounts,@JsonKey(name: 'results_url', includeIfNull: false) String? resultsUrl, MessageBatchType type
});


$MessageBatchRequestCountsCopyWith<$Res> get requestCounts;

}
/// @nodoc
class _$MessageBatchCopyWithImpl<$Res>
    implements $MessageBatchCopyWith<$Res> {
  _$MessageBatchCopyWithImpl(this._self, this._then);

  final MessageBatch _self;
  final $Res Function(MessageBatch) _then;

/// Create a copy of MessageBatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? expiresAt = null,Object? processingStatus = null,Object? requestCounts = null,Object? resultsUrl = freezed,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,processingStatus: null == processingStatus ? _self.processingStatus : processingStatus // ignore: cast_nullable_to_non_nullable
as MessageBatchProcessingStatus,requestCounts: null == requestCounts ? _self.requestCounts : requestCounts // ignore: cast_nullable_to_non_nullable
as MessageBatchRequestCounts,resultsUrl: freezed == resultsUrl ? _self.resultsUrl : resultsUrl // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageBatchType,
  ));
}
/// Create a copy of MessageBatch
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageBatchRequestCountsCopyWith<$Res> get requestCounts {
  
  return $MessageBatchRequestCountsCopyWith<$Res>(_self.requestCounts, (value) {
    return _then(_self.copyWith(requestCounts: value));
  });
}
}


/// Adds pattern-matching-related methods to [MessageBatch].
extension MessageBatchPatterns on MessageBatch {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageBatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageBatch() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageBatch value)  $default,){
final _that = this;
switch (_that) {
case _MessageBatch():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageBatch value)?  $default,){
final _that = this;
switch (_that) {
case _MessageBatch() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'expires_at')  String expiresAt, @JsonKey(name: 'processing_status')  MessageBatchProcessingStatus processingStatus, @JsonKey(name: 'request_counts')  MessageBatchRequestCounts requestCounts, @JsonKey(name: 'results_url', includeIfNull: false)  String? resultsUrl,  MessageBatchType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageBatch() when $default != null:
return $default(_that.id,_that.createdAt,_that.expiresAt,_that.processingStatus,_that.requestCounts,_that.resultsUrl,_that.type);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'expires_at')  String expiresAt, @JsonKey(name: 'processing_status')  MessageBatchProcessingStatus processingStatus, @JsonKey(name: 'request_counts')  MessageBatchRequestCounts requestCounts, @JsonKey(name: 'results_url', includeIfNull: false)  String? resultsUrl,  MessageBatchType type)  $default,) {final _that = this;
switch (_that) {
case _MessageBatch():
return $default(_that.id,_that.createdAt,_that.expiresAt,_that.processingStatus,_that.requestCounts,_that.resultsUrl,_that.type);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'expires_at')  String expiresAt, @JsonKey(name: 'processing_status')  MessageBatchProcessingStatus processingStatus, @JsonKey(name: 'request_counts')  MessageBatchRequestCounts requestCounts, @JsonKey(name: 'results_url', includeIfNull: false)  String? resultsUrl,  MessageBatchType type)?  $default,) {final _that = this;
switch (_that) {
case _MessageBatch() when $default != null:
return $default(_that.id,_that.createdAt,_that.expiresAt,_that.processingStatus,_that.requestCounts,_that.resultsUrl,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageBatch extends MessageBatch {
  const _MessageBatch({required this.id, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'expires_at') required this.expiresAt, @JsonKey(name: 'processing_status') required this.processingStatus, @JsonKey(name: 'request_counts') required this.requestCounts, @JsonKey(name: 'results_url', includeIfNull: false) this.resultsUrl, required this.type}): super._();
  factory _MessageBatch.fromJson(Map<String, dynamic> json) => _$MessageBatchFromJson(json);

/// Unique object identifier for the message batch.
@override final  String id;
/// RFC 3339 datetime string representing the time at which the Message Batch was created.
@override@JsonKey(name: 'created_at') final  String createdAt;
/// RFC 3339 datetime string representing the time at which the Message Batch will expire and end processing, which is 24 hours after creation.
@override@JsonKey(name: 'expires_at') final  String expiresAt;
/// Processing status of the Message Batch.
@override@JsonKey(name: 'processing_status') final  MessageBatchProcessingStatus processingStatus;
/// Tallies requests within the Message Batch, categorized by their status.
@override@JsonKey(name: 'request_counts') final  MessageBatchRequestCounts requestCounts;
/// URL to a `.jsonl` file containing the results of the Message Batch requests. Specified only once processing ends.
@override@JsonKey(name: 'results_url', includeIfNull: false) final  String? resultsUrl;
/// Object type. For Message Batches, this is always `"message_batch"`.
@override final  MessageBatchType type;

/// Create a copy of MessageBatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageBatchCopyWith<_MessageBatch> get copyWith => __$MessageBatchCopyWithImpl<_MessageBatch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageBatchToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageBatch&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.processingStatus, processingStatus) || other.processingStatus == processingStatus)&&(identical(other.requestCounts, requestCounts) || other.requestCounts == requestCounts)&&(identical(other.resultsUrl, resultsUrl) || other.resultsUrl == resultsUrl)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,expiresAt,processingStatus,requestCounts,resultsUrl,type);

@override
String toString() {
  return 'MessageBatch(id: $id, createdAt: $createdAt, expiresAt: $expiresAt, processingStatus: $processingStatus, requestCounts: $requestCounts, resultsUrl: $resultsUrl, type: $type)';
}


}

/// @nodoc
abstract mixin class _$MessageBatchCopyWith<$Res> implements $MessageBatchCopyWith<$Res> {
  factory _$MessageBatchCopyWith(_MessageBatch value, $Res Function(_MessageBatch) _then) = __$MessageBatchCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'expires_at') String expiresAt,@JsonKey(name: 'processing_status') MessageBatchProcessingStatus processingStatus,@JsonKey(name: 'request_counts') MessageBatchRequestCounts requestCounts,@JsonKey(name: 'results_url', includeIfNull: false) String? resultsUrl, MessageBatchType type
});


@override $MessageBatchRequestCountsCopyWith<$Res> get requestCounts;

}
/// @nodoc
class __$MessageBatchCopyWithImpl<$Res>
    implements _$MessageBatchCopyWith<$Res> {
  __$MessageBatchCopyWithImpl(this._self, this._then);

  final _MessageBatch _self;
  final $Res Function(_MessageBatch) _then;

/// Create a copy of MessageBatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? expiresAt = null,Object? processingStatus = null,Object? requestCounts = null,Object? resultsUrl = freezed,Object? type = null,}) {
  return _then(_MessageBatch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,processingStatus: null == processingStatus ? _self.processingStatus : processingStatus // ignore: cast_nullable_to_non_nullable
as MessageBatchProcessingStatus,requestCounts: null == requestCounts ? _self.requestCounts : requestCounts // ignore: cast_nullable_to_non_nullable
as MessageBatchRequestCounts,resultsUrl: freezed == resultsUrl ? _self.resultsUrl : resultsUrl // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageBatchType,
  ));
}

/// Create a copy of MessageBatch
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageBatchRequestCountsCopyWith<$Res> get requestCounts {
  
  return $MessageBatchRequestCountsCopyWith<$Res>(_self.requestCounts, (value) {
    return _then(_self.copyWith(requestCounts: value));
  });
}
}


/// @nodoc
mixin _$DeleteMessageBatchResponse {

/// ID of the deleted Message Batch.
 String get id;/// Deleted object type. Always `"message_batch_deleted"`.
 DeleteMessageBatchResponseType get type;
/// Create a copy of DeleteMessageBatchResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteMessageBatchResponseCopyWith<DeleteMessageBatchResponse> get copyWith => _$DeleteMessageBatchResponseCopyWithImpl<DeleteMessageBatchResponse>(this as DeleteMessageBatchResponse, _$identity);

  /// Serializes this DeleteMessageBatchResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteMessageBatchResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type);

@override
String toString() {
  return 'DeleteMessageBatchResponse(id: $id, type: $type)';
}


}

/// @nodoc
abstract mixin class $DeleteMessageBatchResponseCopyWith<$Res>  {
  factory $DeleteMessageBatchResponseCopyWith(DeleteMessageBatchResponse value, $Res Function(DeleteMessageBatchResponse) _then) = _$DeleteMessageBatchResponseCopyWithImpl;
@useResult
$Res call({
 String id, DeleteMessageBatchResponseType type
});




}
/// @nodoc
class _$DeleteMessageBatchResponseCopyWithImpl<$Res>
    implements $DeleteMessageBatchResponseCopyWith<$Res> {
  _$DeleteMessageBatchResponseCopyWithImpl(this._self, this._then);

  final DeleteMessageBatchResponse _self;
  final $Res Function(DeleteMessageBatchResponse) _then;

/// Create a copy of DeleteMessageBatchResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeleteMessageBatchResponseType,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteMessageBatchResponse].
extension DeleteMessageBatchResponsePatterns on DeleteMessageBatchResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteMessageBatchResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteMessageBatchResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteMessageBatchResponse value)  $default,){
final _that = this;
switch (_that) {
case _DeleteMessageBatchResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteMessageBatchResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteMessageBatchResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DeleteMessageBatchResponseType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteMessageBatchResponse() when $default != null:
return $default(_that.id,_that.type);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DeleteMessageBatchResponseType type)  $default,) {final _that = this;
switch (_that) {
case _DeleteMessageBatchResponse():
return $default(_that.id,_that.type);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DeleteMessageBatchResponseType type)?  $default,) {final _that = this;
switch (_that) {
case _DeleteMessageBatchResponse() when $default != null:
return $default(_that.id,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeleteMessageBatchResponse extends DeleteMessageBatchResponse {
  const _DeleteMessageBatchResponse({required this.id, required this.type}): super._();
  factory _DeleteMessageBatchResponse.fromJson(Map<String, dynamic> json) => _$DeleteMessageBatchResponseFromJson(json);

/// ID of the deleted Message Batch.
@override final  String id;
/// Deleted object type. Always `"message_batch_deleted"`.
@override final  DeleteMessageBatchResponseType type;

/// Create a copy of DeleteMessageBatchResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteMessageBatchResponseCopyWith<_DeleteMessageBatchResponse> get copyWith => __$DeleteMessageBatchResponseCopyWithImpl<_DeleteMessageBatchResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteMessageBatchResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteMessageBatchResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type);

@override
String toString() {
  return 'DeleteMessageBatchResponse(id: $id, type: $type)';
}


}

/// @nodoc
abstract mixin class _$DeleteMessageBatchResponseCopyWith<$Res> implements $DeleteMessageBatchResponseCopyWith<$Res> {
  factory _$DeleteMessageBatchResponseCopyWith(_DeleteMessageBatchResponse value, $Res Function(_DeleteMessageBatchResponse) _then) = __$DeleteMessageBatchResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, DeleteMessageBatchResponseType type
});




}
/// @nodoc
class __$DeleteMessageBatchResponseCopyWithImpl<$Res>
    implements _$DeleteMessageBatchResponseCopyWith<$Res> {
  __$DeleteMessageBatchResponseCopyWithImpl(this._self, this._then);

  final _DeleteMessageBatchResponse _self;
  final $Res Function(_DeleteMessageBatchResponse) _then;

/// Create a copy of DeleteMessageBatchResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,}) {
  return _then(_DeleteMessageBatchResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeleteMessageBatchResponseType,
  ));
}


}


/// @nodoc
mixin _$ListMessageBatchesResponse {

/// List of MessageBatch objects.
 List<MessageBatch> get data;/// Indicates if there are more results in the requested page direction.
@JsonKey(name: 'has_more') bool get hasMore;/// First ID in the `data` list. Can be used as the `before_id` for the previous page.
@JsonKey(name: 'first_id', includeIfNull: false) String? get firstId;/// Last ID in the `data` list. Can be used as the `after_id` for the next page.
@JsonKey(name: 'last_id', includeIfNull: false) String? get lastId;
/// Create a copy of ListMessageBatchesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListMessageBatchesResponseCopyWith<ListMessageBatchesResponse> get copyWith => _$ListMessageBatchesResponseCopyWithImpl<ListMessageBatchesResponse>(this as ListMessageBatchesResponse, _$identity);

  /// Serializes this ListMessageBatchesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListMessageBatchesResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.firstId, firstId) || other.firstId == firstId)&&(identical(other.lastId, lastId) || other.lastId == lastId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),hasMore,firstId,lastId);

@override
String toString() {
  return 'ListMessageBatchesResponse(data: $data, hasMore: $hasMore, firstId: $firstId, lastId: $lastId)';
}


}

/// @nodoc
abstract mixin class $ListMessageBatchesResponseCopyWith<$Res>  {
  factory $ListMessageBatchesResponseCopyWith(ListMessageBatchesResponse value, $Res Function(ListMessageBatchesResponse) _then) = _$ListMessageBatchesResponseCopyWithImpl;
@useResult
$Res call({
 List<MessageBatch> data,@JsonKey(name: 'has_more') bool hasMore,@JsonKey(name: 'first_id', includeIfNull: false) String? firstId,@JsonKey(name: 'last_id', includeIfNull: false) String? lastId
});




}
/// @nodoc
class _$ListMessageBatchesResponseCopyWithImpl<$Res>
    implements $ListMessageBatchesResponseCopyWith<$Res> {
  _$ListMessageBatchesResponseCopyWithImpl(this._self, this._then);

  final ListMessageBatchesResponse _self;
  final $Res Function(ListMessageBatchesResponse) _then;

/// Create a copy of ListMessageBatchesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? hasMore = null,Object? firstId = freezed,Object? lastId = freezed,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<MessageBatch>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,firstId: freezed == firstId ? _self.firstId : firstId // ignore: cast_nullable_to_non_nullable
as String?,lastId: freezed == lastId ? _self.lastId : lastId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListMessageBatchesResponse].
extension ListMessageBatchesResponsePatterns on ListMessageBatchesResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListMessageBatchesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListMessageBatchesResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListMessageBatchesResponse value)  $default,){
final _that = this;
switch (_that) {
case _ListMessageBatchesResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListMessageBatchesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ListMessageBatchesResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MessageBatch> data, @JsonKey(name: 'has_more')  bool hasMore, @JsonKey(name: 'first_id', includeIfNull: false)  String? firstId, @JsonKey(name: 'last_id', includeIfNull: false)  String? lastId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListMessageBatchesResponse() when $default != null:
return $default(_that.data,_that.hasMore,_that.firstId,_that.lastId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MessageBatch> data, @JsonKey(name: 'has_more')  bool hasMore, @JsonKey(name: 'first_id', includeIfNull: false)  String? firstId, @JsonKey(name: 'last_id', includeIfNull: false)  String? lastId)  $default,) {final _that = this;
switch (_that) {
case _ListMessageBatchesResponse():
return $default(_that.data,_that.hasMore,_that.firstId,_that.lastId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MessageBatch> data, @JsonKey(name: 'has_more')  bool hasMore, @JsonKey(name: 'first_id', includeIfNull: false)  String? firstId, @JsonKey(name: 'last_id', includeIfNull: false)  String? lastId)?  $default,) {final _that = this;
switch (_that) {
case _ListMessageBatchesResponse() when $default != null:
return $default(_that.data,_that.hasMore,_that.firstId,_that.lastId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListMessageBatchesResponse extends ListMessageBatchesResponse {
  const _ListMessageBatchesResponse({required final  List<MessageBatch> data, @JsonKey(name: 'has_more') required this.hasMore, @JsonKey(name: 'first_id', includeIfNull: false) this.firstId, @JsonKey(name: 'last_id', includeIfNull: false) this.lastId}): _data = data,super._();
  factory _ListMessageBatchesResponse.fromJson(Map<String, dynamic> json) => _$ListMessageBatchesResponseFromJson(json);

/// List of MessageBatch objects.
 final  List<MessageBatch> _data;
/// List of MessageBatch objects.
@override List<MessageBatch> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

/// Indicates if there are more results in the requested page direction.
@override@JsonKey(name: 'has_more') final  bool hasMore;
/// First ID in the `data` list. Can be used as the `before_id` for the previous page.
@override@JsonKey(name: 'first_id', includeIfNull: false) final  String? firstId;
/// Last ID in the `data` list. Can be used as the `after_id` for the next page.
@override@JsonKey(name: 'last_id', includeIfNull: false) final  String? lastId;

/// Create a copy of ListMessageBatchesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListMessageBatchesResponseCopyWith<_ListMessageBatchesResponse> get copyWith => __$ListMessageBatchesResponseCopyWithImpl<_ListMessageBatchesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListMessageBatchesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListMessageBatchesResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.firstId, firstId) || other.firstId == firstId)&&(identical(other.lastId, lastId) || other.lastId == lastId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),hasMore,firstId,lastId);

@override
String toString() {
  return 'ListMessageBatchesResponse(data: $data, hasMore: $hasMore, firstId: $firstId, lastId: $lastId)';
}


}

/// @nodoc
abstract mixin class _$ListMessageBatchesResponseCopyWith<$Res> implements $ListMessageBatchesResponseCopyWith<$Res> {
  factory _$ListMessageBatchesResponseCopyWith(_ListMessageBatchesResponse value, $Res Function(_ListMessageBatchesResponse) _then) = __$ListMessageBatchesResponseCopyWithImpl;
@override @useResult
$Res call({
 List<MessageBatch> data,@JsonKey(name: 'has_more') bool hasMore,@JsonKey(name: 'first_id', includeIfNull: false) String? firstId,@JsonKey(name: 'last_id', includeIfNull: false) String? lastId
});




}
/// @nodoc
class __$ListMessageBatchesResponseCopyWithImpl<$Res>
    implements _$ListMessageBatchesResponseCopyWith<$Res> {
  __$ListMessageBatchesResponseCopyWithImpl(this._self, this._then);

  final _ListMessageBatchesResponse _self;
  final $Res Function(_ListMessageBatchesResponse) _then;

/// Create a copy of ListMessageBatchesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? hasMore = null,Object? firstId = freezed,Object? lastId = freezed,}) {
  return _then(_ListMessageBatchesResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<MessageBatch>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,firstId: freezed == firstId ? _self.firstId : firstId // ignore: cast_nullable_to_non_nullable
as String?,lastId: freezed == lastId ? _self.lastId : lastId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MessageBatchRequestCounts {

/// Number of requests in the Message Batch that are processing.
 int get processing;/// Number of requests in the Message Batch that have completed successfully.
 int get succeeded;/// Number of requests in the Message Batch that encountered an error.
 int get errored;/// Number of requests in the Message Batch that have been canceled.
 int get canceled;/// Number of requests in the Message Batch that have expired.
 int get expired;
/// Create a copy of MessageBatchRequestCounts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageBatchRequestCountsCopyWith<MessageBatchRequestCounts> get copyWith => _$MessageBatchRequestCountsCopyWithImpl<MessageBatchRequestCounts>(this as MessageBatchRequestCounts, _$identity);

  /// Serializes this MessageBatchRequestCounts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageBatchRequestCounts&&(identical(other.processing, processing) || other.processing == processing)&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.errored, errored) || other.errored == errored)&&(identical(other.canceled, canceled) || other.canceled == canceled)&&(identical(other.expired, expired) || other.expired == expired));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,processing,succeeded,errored,canceled,expired);

@override
String toString() {
  return 'MessageBatchRequestCounts(processing: $processing, succeeded: $succeeded, errored: $errored, canceled: $canceled, expired: $expired)';
}


}

/// @nodoc
abstract mixin class $MessageBatchRequestCountsCopyWith<$Res>  {
  factory $MessageBatchRequestCountsCopyWith(MessageBatchRequestCounts value, $Res Function(MessageBatchRequestCounts) _then) = _$MessageBatchRequestCountsCopyWithImpl;
@useResult
$Res call({
 int processing, int succeeded, int errored, int canceled, int expired
});




}
/// @nodoc
class _$MessageBatchRequestCountsCopyWithImpl<$Res>
    implements $MessageBatchRequestCountsCopyWith<$Res> {
  _$MessageBatchRequestCountsCopyWithImpl(this._self, this._then);

  final MessageBatchRequestCounts _self;
  final $Res Function(MessageBatchRequestCounts) _then;

/// Create a copy of MessageBatchRequestCounts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? processing = null,Object? succeeded = null,Object? errored = null,Object? canceled = null,Object? expired = null,}) {
  return _then(_self.copyWith(
processing: null == processing ? _self.processing : processing // ignore: cast_nullable_to_non_nullable
as int,succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as int,errored: null == errored ? _self.errored : errored // ignore: cast_nullable_to_non_nullable
as int,canceled: null == canceled ? _self.canceled : canceled // ignore: cast_nullable_to_non_nullable
as int,expired: null == expired ? _self.expired : expired // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageBatchRequestCounts].
extension MessageBatchRequestCountsPatterns on MessageBatchRequestCounts {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageBatchRequestCounts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageBatchRequestCounts() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageBatchRequestCounts value)  $default,){
final _that = this;
switch (_that) {
case _MessageBatchRequestCounts():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageBatchRequestCounts value)?  $default,){
final _that = this;
switch (_that) {
case _MessageBatchRequestCounts() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int processing,  int succeeded,  int errored,  int canceled,  int expired)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageBatchRequestCounts() when $default != null:
return $default(_that.processing,_that.succeeded,_that.errored,_that.canceled,_that.expired);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int processing,  int succeeded,  int errored,  int canceled,  int expired)  $default,) {final _that = this;
switch (_that) {
case _MessageBatchRequestCounts():
return $default(_that.processing,_that.succeeded,_that.errored,_that.canceled,_that.expired);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int processing,  int succeeded,  int errored,  int canceled,  int expired)?  $default,) {final _that = this;
switch (_that) {
case _MessageBatchRequestCounts() when $default != null:
return $default(_that.processing,_that.succeeded,_that.errored,_that.canceled,_that.expired);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageBatchRequestCounts extends MessageBatchRequestCounts {
  const _MessageBatchRequestCounts({required this.processing, required this.succeeded, required this.errored, required this.canceled, required this.expired}): super._();
  factory _MessageBatchRequestCounts.fromJson(Map<String, dynamic> json) => _$MessageBatchRequestCountsFromJson(json);

/// Number of requests in the Message Batch that are processing.
@override final  int processing;
/// Number of requests in the Message Batch that have completed successfully.
@override final  int succeeded;
/// Number of requests in the Message Batch that encountered an error.
@override final  int errored;
/// Number of requests in the Message Batch that have been canceled.
@override final  int canceled;
/// Number of requests in the Message Batch that have expired.
@override final  int expired;

/// Create a copy of MessageBatchRequestCounts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageBatchRequestCountsCopyWith<_MessageBatchRequestCounts> get copyWith => __$MessageBatchRequestCountsCopyWithImpl<_MessageBatchRequestCounts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageBatchRequestCountsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageBatchRequestCounts&&(identical(other.processing, processing) || other.processing == processing)&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.errored, errored) || other.errored == errored)&&(identical(other.canceled, canceled) || other.canceled == canceled)&&(identical(other.expired, expired) || other.expired == expired));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,processing,succeeded,errored,canceled,expired);

@override
String toString() {
  return 'MessageBatchRequestCounts(processing: $processing, succeeded: $succeeded, errored: $errored, canceled: $canceled, expired: $expired)';
}


}

/// @nodoc
abstract mixin class _$MessageBatchRequestCountsCopyWith<$Res> implements $MessageBatchRequestCountsCopyWith<$Res> {
  factory _$MessageBatchRequestCountsCopyWith(_MessageBatchRequestCounts value, $Res Function(_MessageBatchRequestCounts) _then) = __$MessageBatchRequestCountsCopyWithImpl;
@override @useResult
$Res call({
 int processing, int succeeded, int errored, int canceled, int expired
});




}
/// @nodoc
class __$MessageBatchRequestCountsCopyWithImpl<$Res>
    implements _$MessageBatchRequestCountsCopyWith<$Res> {
  __$MessageBatchRequestCountsCopyWithImpl(this._self, this._then);

  final _MessageBatchRequestCounts _self;
  final $Res Function(_MessageBatchRequestCounts) _then;

/// Create a copy of MessageBatchRequestCounts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? processing = null,Object? succeeded = null,Object? errored = null,Object? canceled = null,Object? expired = null,}) {
  return _then(_MessageBatchRequestCounts(
processing: null == processing ? _self.processing : processing // ignore: cast_nullable_to_non_nullable
as int,succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as int,errored: null == errored ? _self.errored : errored // ignore: cast_nullable_to_non_nullable
as int,canceled: null == canceled ? _self.canceled : canceled // ignore: cast_nullable_to_non_nullable
as int,expired: null == expired ? _self.expired : expired // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


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
/// - `"tool_use"`: the model invoked one or more tools
///
/// In non-streaming mode this value is always non-null. In streaming mode, it is
/// null in the `message_start` event and non-null otherwise.
@JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) StopReason? get stopReason;/// Which custom stop sequence was generated, if any.
///
/// This value will be a non-null string if one of your custom stop sequences was
/// generated.
@JsonKey(name: 'stop_sequence', includeIfNull: false) String? get stopSequence;
/// Create a copy of MessageDelta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageDeltaCopyWith<MessageDelta> get copyWith => _$MessageDeltaCopyWithImpl<MessageDelta>(this as MessageDelta, _$identity);

  /// Serializes this MessageDelta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageDelta&&(identical(other.stopReason, stopReason) || other.stopReason == stopReason)&&(identical(other.stopSequence, stopSequence) || other.stopSequence == stopSequence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stopReason,stopSequence);

@override
String toString() {
  return 'MessageDelta(stopReason: $stopReason, stopSequence: $stopSequence)';
}


}

/// @nodoc
abstract mixin class $MessageDeltaCopyWith<$Res>  {
  factory $MessageDeltaCopyWith(MessageDelta value, $Res Function(MessageDelta) _then) = _$MessageDeltaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) StopReason? stopReason,@JsonKey(name: 'stop_sequence', includeIfNull: false) String? stopSequence
});




}
/// @nodoc
class _$MessageDeltaCopyWithImpl<$Res>
    implements $MessageDeltaCopyWith<$Res> {
  _$MessageDeltaCopyWithImpl(this._self, this._then);

  final MessageDelta _self;
  final $Res Function(MessageDelta) _then;

/// Create a copy of MessageDelta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stopReason = freezed,Object? stopSequence = freezed,}) {
  return _then(_self.copyWith(
stopReason: freezed == stopReason ? _self.stopReason : stopReason // ignore: cast_nullable_to_non_nullable
as StopReason?,stopSequence: freezed == stopSequence ? _self.stopSequence : stopSequence // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageDelta].
extension MessageDeltaPatterns on MessageDelta {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageDelta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageDelta() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageDelta value)  $default,){
final _that = this;
switch (_that) {
case _MessageDelta():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageDelta value)?  $default,){
final _that = this;
switch (_that) {
case _MessageDelta() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  StopReason? stopReason, @JsonKey(name: 'stop_sequence', includeIfNull: false)  String? stopSequence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageDelta() when $default != null:
return $default(_that.stopReason,_that.stopSequence);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  StopReason? stopReason, @JsonKey(name: 'stop_sequence', includeIfNull: false)  String? stopSequence)  $default,) {final _that = this;
switch (_that) {
case _MessageDelta():
return $default(_that.stopReason,_that.stopSequence);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  StopReason? stopReason, @JsonKey(name: 'stop_sequence', includeIfNull: false)  String? stopSequence)?  $default,) {final _that = this;
switch (_that) {
case _MessageDelta() when $default != null:
return $default(_that.stopReason,_that.stopSequence);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageDelta extends MessageDelta {
  const _MessageDelta({@JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.stopReason, @JsonKey(name: 'stop_sequence', includeIfNull: false) this.stopSequence}): super._();
  factory _MessageDelta.fromJson(Map<String, dynamic> json) => _$MessageDeltaFromJson(json);

/// The reason that we stopped.
///
/// This may be one the following values:
///
/// - `"end_turn"`: the model reached a natural stopping point
/// - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
/// - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
/// - `"tool_use"`: the model invoked one or more tools
///
/// In non-streaming mode this value is always non-null. In streaming mode, it is
/// null in the `message_start` event and non-null otherwise.
@override@JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  StopReason? stopReason;
/// Which custom stop sequence was generated, if any.
///
/// This value will be a non-null string if one of your custom stop sequences was
/// generated.
@override@JsonKey(name: 'stop_sequence', includeIfNull: false) final  String? stopSequence;

/// Create a copy of MessageDelta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageDeltaCopyWith<_MessageDelta> get copyWith => __$MessageDeltaCopyWithImpl<_MessageDelta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageDeltaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageDelta&&(identical(other.stopReason, stopReason) || other.stopReason == stopReason)&&(identical(other.stopSequence, stopSequence) || other.stopSequence == stopSequence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stopReason,stopSequence);

@override
String toString() {
  return 'MessageDelta(stopReason: $stopReason, stopSequence: $stopSequence)';
}


}

/// @nodoc
abstract mixin class _$MessageDeltaCopyWith<$Res> implements $MessageDeltaCopyWith<$Res> {
  factory _$MessageDeltaCopyWith(_MessageDelta value, $Res Function(_MessageDelta) _then) = __$MessageDeltaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'stop_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) StopReason? stopReason,@JsonKey(name: 'stop_sequence', includeIfNull: false) String? stopSequence
});




}
/// @nodoc
class __$MessageDeltaCopyWithImpl<$Res>
    implements _$MessageDeltaCopyWith<$Res> {
  __$MessageDeltaCopyWithImpl(this._self, this._then);

  final _MessageDelta _self;
  final $Res Function(_MessageDelta) _then;

/// Create a copy of MessageDelta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stopReason = freezed,Object? stopSequence = freezed,}) {
  return _then(_MessageDelta(
stopReason: freezed == stopReason ? _self.stopReason : stopReason // ignore: cast_nullable_to_non_nullable
as StopReason?,stopSequence: freezed == stopSequence ? _self.stopSequence : stopSequence // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MessageDeltaUsage {

/// The cumulative number of output tokens which were used.
@JsonKey(name: 'output_tokens') int get outputTokens;
/// Create a copy of MessageDeltaUsage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageDeltaUsageCopyWith<MessageDeltaUsage> get copyWith => _$MessageDeltaUsageCopyWithImpl<MessageDeltaUsage>(this as MessageDeltaUsage, _$identity);

  /// Serializes this MessageDeltaUsage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageDeltaUsage&&(identical(other.outputTokens, outputTokens) || other.outputTokens == outputTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,outputTokens);

@override
String toString() {
  return 'MessageDeltaUsage(outputTokens: $outputTokens)';
}


}

/// @nodoc
abstract mixin class $MessageDeltaUsageCopyWith<$Res>  {
  factory $MessageDeltaUsageCopyWith(MessageDeltaUsage value, $Res Function(MessageDeltaUsage) _then) = _$MessageDeltaUsageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'output_tokens') int outputTokens
});




}
/// @nodoc
class _$MessageDeltaUsageCopyWithImpl<$Res>
    implements $MessageDeltaUsageCopyWith<$Res> {
  _$MessageDeltaUsageCopyWithImpl(this._self, this._then);

  final MessageDeltaUsage _self;
  final $Res Function(MessageDeltaUsage) _then;

/// Create a copy of MessageDeltaUsage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? outputTokens = null,}) {
  return _then(_self.copyWith(
outputTokens: null == outputTokens ? _self.outputTokens : outputTokens // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageDeltaUsage].
extension MessageDeltaUsagePatterns on MessageDeltaUsage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageDeltaUsage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageDeltaUsage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageDeltaUsage value)  $default,){
final _that = this;
switch (_that) {
case _MessageDeltaUsage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageDeltaUsage value)?  $default,){
final _that = this;
switch (_that) {
case _MessageDeltaUsage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'output_tokens')  int outputTokens)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageDeltaUsage() when $default != null:
return $default(_that.outputTokens);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'output_tokens')  int outputTokens)  $default,) {final _that = this;
switch (_that) {
case _MessageDeltaUsage():
return $default(_that.outputTokens);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'output_tokens')  int outputTokens)?  $default,) {final _that = this;
switch (_that) {
case _MessageDeltaUsage() when $default != null:
return $default(_that.outputTokens);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageDeltaUsage extends MessageDeltaUsage {
  const _MessageDeltaUsage({@JsonKey(name: 'output_tokens') required this.outputTokens}): super._();
  factory _MessageDeltaUsage.fromJson(Map<String, dynamic> json) => _$MessageDeltaUsageFromJson(json);

/// The cumulative number of output tokens which were used.
@override@JsonKey(name: 'output_tokens') final  int outputTokens;

/// Create a copy of MessageDeltaUsage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageDeltaUsageCopyWith<_MessageDeltaUsage> get copyWith => __$MessageDeltaUsageCopyWithImpl<_MessageDeltaUsage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageDeltaUsageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageDeltaUsage&&(identical(other.outputTokens, outputTokens) || other.outputTokens == outputTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,outputTokens);

@override
String toString() {
  return 'MessageDeltaUsage(outputTokens: $outputTokens)';
}


}

/// @nodoc
abstract mixin class _$MessageDeltaUsageCopyWith<$Res> implements $MessageDeltaUsageCopyWith<$Res> {
  factory _$MessageDeltaUsageCopyWith(_MessageDeltaUsage value, $Res Function(_MessageDeltaUsage) _then) = __$MessageDeltaUsageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'output_tokens') int outputTokens
});




}
/// @nodoc
class __$MessageDeltaUsageCopyWithImpl<$Res>
    implements _$MessageDeltaUsageCopyWith<$Res> {
  __$MessageDeltaUsageCopyWithImpl(this._self, this._then);

  final _MessageDeltaUsage _self;
  final $Res Function(_MessageDeltaUsage) _then;

/// Create a copy of MessageDeltaUsage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? outputTokens = null,}) {
  return _then(_MessageDeltaUsage(
outputTokens: null == outputTokens ? _self.outputTokens : outputTokens // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Error {

/// The type of error.
 String get type;/// A human-readable error message.
 String get message;
/// Create a copy of Error
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this as Error, _$identity);

  /// Serializes this Error to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.type, type) || other.type == type)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,message);

@override
String toString() {
  return 'Error(type: $type, message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res>  {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String type, String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of Error
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? message = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Error].
extension ErrorPatterns on Error {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Error value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Error() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Error value)  $default,){
final _that = this;
switch (_that) {
case _Error():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Error value)?  $default,){
final _that = this;
switch (_that) {
case _Error() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Error() when $default != null:
return $default(_that.type,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String message)  $default,) {final _that = this;
switch (_that) {
case _Error():
return $default(_that.type,_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String message)?  $default,) {final _that = this;
switch (_that) {
case _Error() when $default != null:
return $default(_that.type,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Error extends Error {
  const _Error({required this.type, required this.message}): super._();
  factory _Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

/// The type of error.
@override final  String type;
/// A human-readable error message.
@override final  String message;

/// Create a copy of Error
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.type, type) || other.type == type)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,message);

@override
String toString() {
  return 'Error(type: $type, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 String type, String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of Error
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? message = null,}) {
  return _then(_Error(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

ThinkingConfig _$ThinkingConfigFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'enabled':
          return ThinkingConfigEnabled.fromJson(
            json
          );
                case 'disabled':
          return ThinkingConfigDisabled.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'ThinkingConfig',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$ThinkingConfig {

/// The type of thinking configuration.
 Enum get type;

  /// Serializes this ThinkingConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThinkingConfig&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'ThinkingConfig(type: $type)';
}


}

/// @nodoc
class $ThinkingConfigCopyWith<$Res>  {
$ThinkingConfigCopyWith(ThinkingConfig _, $Res Function(ThinkingConfig) __);
}


/// Adds pattern-matching-related methods to [ThinkingConfig].
extension ThinkingConfigPatterns on ThinkingConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ThinkingConfigEnabled value)?  enabled,TResult Function( ThinkingConfigDisabled value)?  disabled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ThinkingConfigEnabled() when enabled != null:
return enabled(_that);case ThinkingConfigDisabled() when disabled != null:
return disabled(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ThinkingConfigEnabled value)  enabled,required TResult Function( ThinkingConfigDisabled value)  disabled,}){
final _that = this;
switch (_that) {
case ThinkingConfigEnabled():
return enabled(_that);case ThinkingConfigDisabled():
return disabled(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ThinkingConfigEnabled value)?  enabled,TResult? Function( ThinkingConfigDisabled value)?  disabled,}){
final _that = this;
switch (_that) {
case ThinkingConfigEnabled() when enabled != null:
return enabled(_that);case ThinkingConfigDisabled() when disabled != null:
return disabled(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ThinkingConfigEnabledType type, @JsonKey(name: 'budget_tokens')  int budgetTokens)?  enabled,TResult Function( ThinkingConfigDisabledType type)?  disabled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ThinkingConfigEnabled() when enabled != null:
return enabled(_that.type,_that.budgetTokens);case ThinkingConfigDisabled() when disabled != null:
return disabled(_that.type);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ThinkingConfigEnabledType type, @JsonKey(name: 'budget_tokens')  int budgetTokens)  enabled,required TResult Function( ThinkingConfigDisabledType type)  disabled,}) {final _that = this;
switch (_that) {
case ThinkingConfigEnabled():
return enabled(_that.type,_that.budgetTokens);case ThinkingConfigDisabled():
return disabled(_that.type);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ThinkingConfigEnabledType type, @JsonKey(name: 'budget_tokens')  int budgetTokens)?  enabled,TResult? Function( ThinkingConfigDisabledType type)?  disabled,}) {final _that = this;
switch (_that) {
case ThinkingConfigEnabled() when enabled != null:
return enabled(_that.type,_that.budgetTokens);case ThinkingConfigDisabled() when disabled != null:
return disabled(_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ThinkingConfigEnabled extends ThinkingConfig {
  const ThinkingConfigEnabled({required this.type, @JsonKey(name: 'budget_tokens') required this.budgetTokens}): super._();
  factory ThinkingConfigEnabled.fromJson(Map<String, dynamic> json) => _$ThinkingConfigEnabledFromJson(json);

/// The type of thinking configuration.
@override final  ThinkingConfigEnabledType type;
/// The maximum number of tokens Claude can use for internal reasoning.
/// Must be at least 1,024 and less than `max_tokens`. Larger budgets
/// enable more comprehensive reasoning.
@JsonKey(name: 'budget_tokens') final  int budgetTokens;

/// Create a copy of ThinkingConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThinkingConfigEnabledCopyWith<ThinkingConfigEnabled> get copyWith => _$ThinkingConfigEnabledCopyWithImpl<ThinkingConfigEnabled>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThinkingConfigEnabledToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThinkingConfigEnabled&&(identical(other.type, type) || other.type == type)&&(identical(other.budgetTokens, budgetTokens) || other.budgetTokens == budgetTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,budgetTokens);

@override
String toString() {
  return 'ThinkingConfig.enabled(type: $type, budgetTokens: $budgetTokens)';
}


}

/// @nodoc
abstract mixin class $ThinkingConfigEnabledCopyWith<$Res> implements $ThinkingConfigCopyWith<$Res> {
  factory $ThinkingConfigEnabledCopyWith(ThinkingConfigEnabled value, $Res Function(ThinkingConfigEnabled) _then) = _$ThinkingConfigEnabledCopyWithImpl;
@useResult
$Res call({
 ThinkingConfigEnabledType type,@JsonKey(name: 'budget_tokens') int budgetTokens
});




}
/// @nodoc
class _$ThinkingConfigEnabledCopyWithImpl<$Res>
    implements $ThinkingConfigEnabledCopyWith<$Res> {
  _$ThinkingConfigEnabledCopyWithImpl(this._self, this._then);

  final ThinkingConfigEnabled _self;
  final $Res Function(ThinkingConfigEnabled) _then;

/// Create a copy of ThinkingConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,Object? budgetTokens = null,}) {
  return _then(ThinkingConfigEnabled(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ThinkingConfigEnabledType,budgetTokens: null == budgetTokens ? _self.budgetTokens : budgetTokens // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ThinkingConfigDisabled extends ThinkingConfig {
  const ThinkingConfigDisabled({required this.type}): super._();
  factory ThinkingConfigDisabled.fromJson(Map<String, dynamic> json) => _$ThinkingConfigDisabledFromJson(json);

/// The type of thinking configuration.
@override final  ThinkingConfigDisabledType type;

/// Create a copy of ThinkingConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThinkingConfigDisabledCopyWith<ThinkingConfigDisabled> get copyWith => _$ThinkingConfigDisabledCopyWithImpl<ThinkingConfigDisabled>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThinkingConfigDisabledToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThinkingConfigDisabled&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'ThinkingConfig.disabled(type: $type)';
}


}

/// @nodoc
abstract mixin class $ThinkingConfigDisabledCopyWith<$Res> implements $ThinkingConfigCopyWith<$Res> {
  factory $ThinkingConfigDisabledCopyWith(ThinkingConfigDisabled value, $Res Function(ThinkingConfigDisabled) _then) = _$ThinkingConfigDisabledCopyWithImpl;
@useResult
$Res call({
 ThinkingConfigDisabledType type
});




}
/// @nodoc
class _$ThinkingConfigDisabledCopyWithImpl<$Res>
    implements $ThinkingConfigDisabledCopyWith<$Res> {
  _$ThinkingConfigDisabledCopyWithImpl(this._self, this._then);

  final ThinkingConfigDisabled _self;
  final $Res Function(ThinkingConfigDisabled) _then;

/// Create a copy of ThinkingConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(ThinkingConfigDisabled(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ThinkingConfigDisabledType,
  ));
}


}

Tool _$ToolFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'custom':
          return ToolCustom.fromJson(
            json
          );
                case 'computer_20241022':
          return ToolComputerUse.fromJson(
            json
          );
                case 'text_editor_20241022':
          return ToolTextEditor.fromJson(
            json
          );
                case 'bash_20241022':
          return ToolBash.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'Tool',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$Tool {

/// The type of tool.
@JsonKey(includeIfNull: false) String? get type;/// The name of the tool. Must match the regex `^[a-zA-Z0-9_-]{1,64}$`.
 String get name;
/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolCopyWith<Tool> get copyWith => _$ToolCopyWithImpl<Tool>(this as Tool, _$identity);

  /// Serializes this Tool to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tool&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,name);

@override
String toString() {
  return 'Tool(type: $type, name: $name)';
}


}

/// @nodoc
abstract mixin class $ToolCopyWith<$Res>  {
  factory $ToolCopyWith(Tool value, $Res Function(Tool) _then) = _$ToolCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String type, String name
});




}
/// @nodoc
class _$ToolCopyWithImpl<$Res>
    implements $ToolCopyWith<$Res> {
  _$ToolCopyWithImpl(this._self, this._then);

  final Tool _self;
  final $Res Function(Tool) _then;

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? name = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type! : type // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Tool].
extension ToolPatterns on Tool {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ToolCustom value)?  custom,TResult Function( ToolComputerUse value)?  computerUse,TResult Function( ToolTextEditor value)?  textEditor,TResult Function( ToolBash value)?  bash,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ToolCustom() when custom != null:
return custom(_that);case ToolComputerUse() when computerUse != null:
return computerUse(_that);case ToolTextEditor() when textEditor != null:
return textEditor(_that);case ToolBash() when bash != null:
return bash(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ToolCustom value)  custom,required TResult Function( ToolComputerUse value)  computerUse,required TResult Function( ToolTextEditor value)  textEditor,required TResult Function( ToolBash value)  bash,}){
final _that = this;
switch (_that) {
case ToolCustom():
return custom(_that);case ToolComputerUse():
return computerUse(_that);case ToolTextEditor():
return textEditor(_that);case ToolBash():
return bash(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ToolCustom value)?  custom,TResult? Function( ToolComputerUse value)?  computerUse,TResult? Function( ToolTextEditor value)?  textEditor,TResult? Function( ToolBash value)?  bash,}){
final _that = this;
switch (_that) {
case ToolCustom() when custom != null:
return custom(_that);case ToolComputerUse() when computerUse != null:
return computerUse(_that);case ToolTextEditor() when textEditor != null:
return textEditor(_that);case ToolBash() when bash != null:
return bash(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@JsonKey(includeIfNull: false)  String? type,  String name, @JsonKey(includeIfNull: false)  String? description, @JsonKey(name: 'input_schema')  Map<String, dynamic> inputSchema)?  custom,TResult Function( String type,  String name, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl, @JsonKey(name: 'display_width_px')  int displayWidthPx, @JsonKey(name: 'display_height_px')  int displayHeightPx, @JsonKey(name: 'display_number', includeIfNull: false)  int? displayNumber)?  computerUse,TResult Function( String type,  String name, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)?  textEditor,TResult Function( String type,  String name, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)?  bash,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ToolCustom() when custom != null:
return custom(_that.type,_that.name,_that.description,_that.inputSchema);case ToolComputerUse() when computerUse != null:
return computerUse(_that.type,_that.name,_that.cacheControl,_that.displayWidthPx,_that.displayHeightPx,_that.displayNumber);case ToolTextEditor() when textEditor != null:
return textEditor(_that.type,_that.name,_that.cacheControl);case ToolBash() when bash != null:
return bash(_that.type,_that.name,_that.cacheControl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@JsonKey(includeIfNull: false)  String? type,  String name, @JsonKey(includeIfNull: false)  String? description, @JsonKey(name: 'input_schema')  Map<String, dynamic> inputSchema)  custom,required TResult Function( String type,  String name, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl, @JsonKey(name: 'display_width_px')  int displayWidthPx, @JsonKey(name: 'display_height_px')  int displayHeightPx, @JsonKey(name: 'display_number', includeIfNull: false)  int? displayNumber)  computerUse,required TResult Function( String type,  String name, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)  textEditor,required TResult Function( String type,  String name, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)  bash,}) {final _that = this;
switch (_that) {
case ToolCustom():
return custom(_that.type,_that.name,_that.description,_that.inputSchema);case ToolComputerUse():
return computerUse(_that.type,_that.name,_that.cacheControl,_that.displayWidthPx,_that.displayHeightPx,_that.displayNumber);case ToolTextEditor():
return textEditor(_that.type,_that.name,_that.cacheControl);case ToolBash():
return bash(_that.type,_that.name,_that.cacheControl);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@JsonKey(includeIfNull: false)  String? type,  String name, @JsonKey(includeIfNull: false)  String? description, @JsonKey(name: 'input_schema')  Map<String, dynamic> inputSchema)?  custom,TResult? Function( String type,  String name, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl, @JsonKey(name: 'display_width_px')  int displayWidthPx, @JsonKey(name: 'display_height_px')  int displayHeightPx, @JsonKey(name: 'display_number', includeIfNull: false)  int? displayNumber)?  computerUse,TResult? Function( String type,  String name, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)?  textEditor,TResult? Function( String type,  String name, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)?  bash,}) {final _that = this;
switch (_that) {
case ToolCustom() when custom != null:
return custom(_that.type,_that.name,_that.description,_that.inputSchema);case ToolComputerUse() when computerUse != null:
return computerUse(_that.type,_that.name,_that.cacheControl,_that.displayWidthPx,_that.displayHeightPx,_that.displayNumber);case ToolTextEditor() when textEditor != null:
return textEditor(_that.type,_that.name,_that.cacheControl);case ToolBash() when bash != null:
return bash(_that.type,_that.name,_that.cacheControl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ToolCustom extends Tool {
  const ToolCustom({@JsonKey(includeIfNull: false) this.type, required this.name, @JsonKey(includeIfNull: false) this.description, @JsonKey(name: 'input_schema') required final  Map<String, dynamic> inputSchema}): _inputSchema = inputSchema,super._();
  factory ToolCustom.fromJson(Map<String, dynamic> json) => _$ToolCustomFromJson(json);

/// The type of tool.
@override@JsonKey(includeIfNull: false) final  String? type;
/// The name of the tool. Must match the regex `^[a-zA-Z0-9_-]{1,64}$`.
@override final  String name;
/// Description of what this tool does.
///
/// Tool descriptions should be as detailed as possible. The more information that
/// the model has about what the tool is and how to use it, the better it will
/// perform. You can use natural language descriptions to reinforce important
/// aspects of the tool input JSON schema.
@JsonKey(includeIfNull: false) final  String? description;
/// [JSON schema](https://json-schema.org/) for this tool's input.
///
/// This defines the shape of the `input` that your tool accepts and that the model
/// will produce.
 final  Map<String, dynamic> _inputSchema;
/// [JSON schema](https://json-schema.org/) for this tool's input.
///
/// This defines the shape of the `input` that your tool accepts and that the model
/// will produce.
@JsonKey(name: 'input_schema') Map<String, dynamic> get inputSchema {
  if (_inputSchema is EqualUnmodifiableMapView) return _inputSchema;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_inputSchema);
}


/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolCustomCopyWith<ToolCustom> get copyWith => _$ToolCustomCopyWithImpl<ToolCustom>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolCustomToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolCustom&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._inputSchema, _inputSchema));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,name,description,const DeepCollectionEquality().hash(_inputSchema));

@override
String toString() {
  return 'Tool.custom(type: $type, name: $name, description: $description, inputSchema: $inputSchema)';
}


}

/// @nodoc
abstract mixin class $ToolCustomCopyWith<$Res> implements $ToolCopyWith<$Res> {
  factory $ToolCustomCopyWith(ToolCustom value, $Res Function(ToolCustom) _then) = _$ToolCustomCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? type, String name,@JsonKey(includeIfNull: false) String? description,@JsonKey(name: 'input_schema') Map<String, dynamic> inputSchema
});




}
/// @nodoc
class _$ToolCustomCopyWithImpl<$Res>
    implements $ToolCustomCopyWith<$Res> {
  _$ToolCustomCopyWithImpl(this._self, this._then);

  final ToolCustom _self;
  final $Res Function(ToolCustom) _then;

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? name = null,Object? description = freezed,Object? inputSchema = null,}) {
  return _then(ToolCustom(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,inputSchema: null == inputSchema ? _self._inputSchema : inputSchema // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ToolComputerUse extends Tool {
  const ToolComputerUse({this.type = 'computer_20241022', this.name = 'computer', @JsonKey(name: 'cache_control', includeIfNull: false) this.cacheControl, @JsonKey(name: 'display_width_px') required this.displayWidthPx, @JsonKey(name: 'display_height_px') required this.displayHeightPx, @JsonKey(name: 'display_number', includeIfNull: false) this.displayNumber}): super._();
  factory ToolComputerUse.fromJson(Map<String, dynamic> json) => _$ToolComputerUseFromJson(json);

/// The type of tool.
@override@JsonKey() final  String type;
/// The name of the tool.
@override@JsonKey() final  String name;
/// The cache control settings.
@JsonKey(name: 'cache_control', includeIfNull: false) final  CacheControlEphemeral? cacheControl;
/// The width of the display in pixels.
@JsonKey(name: 'display_width_px') final  int displayWidthPx;
/// The height of the display in pixels.
@JsonKey(name: 'display_height_px') final  int displayHeightPx;
/// The number of the display to use.
@JsonKey(name: 'display_number', includeIfNull: false) final  int? displayNumber;

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolComputerUseCopyWith<ToolComputerUse> get copyWith => _$ToolComputerUseCopyWithImpl<ToolComputerUse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolComputerUseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolComputerUse&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.cacheControl, cacheControl) || other.cacheControl == cacheControl)&&(identical(other.displayWidthPx, displayWidthPx) || other.displayWidthPx == displayWidthPx)&&(identical(other.displayHeightPx, displayHeightPx) || other.displayHeightPx == displayHeightPx)&&(identical(other.displayNumber, displayNumber) || other.displayNumber == displayNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,name,cacheControl,displayWidthPx,displayHeightPx,displayNumber);

@override
String toString() {
  return 'Tool.computerUse(type: $type, name: $name, cacheControl: $cacheControl, displayWidthPx: $displayWidthPx, displayHeightPx: $displayHeightPx, displayNumber: $displayNumber)';
}


}

/// @nodoc
abstract mixin class $ToolComputerUseCopyWith<$Res> implements $ToolCopyWith<$Res> {
  factory $ToolComputerUseCopyWith(ToolComputerUse value, $Res Function(ToolComputerUse) _then) = _$ToolComputerUseCopyWithImpl;
@override @useResult
$Res call({
 String type, String name,@JsonKey(name: 'cache_control', includeIfNull: false) CacheControlEphemeral? cacheControl,@JsonKey(name: 'display_width_px') int displayWidthPx,@JsonKey(name: 'display_height_px') int displayHeightPx,@JsonKey(name: 'display_number', includeIfNull: false) int? displayNumber
});


$CacheControlEphemeralCopyWith<$Res>? get cacheControl;

}
/// @nodoc
class _$ToolComputerUseCopyWithImpl<$Res>
    implements $ToolComputerUseCopyWith<$Res> {
  _$ToolComputerUseCopyWithImpl(this._self, this._then);

  final ToolComputerUse _self;
  final $Res Function(ToolComputerUse) _then;

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? name = null,Object? cacheControl = freezed,Object? displayWidthPx = null,Object? displayHeightPx = null,Object? displayNumber = freezed,}) {
  return _then(ToolComputerUse(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cacheControl: freezed == cacheControl ? _self.cacheControl : cacheControl // ignore: cast_nullable_to_non_nullable
as CacheControlEphemeral?,displayWidthPx: null == displayWidthPx ? _self.displayWidthPx : displayWidthPx // ignore: cast_nullable_to_non_nullable
as int,displayHeightPx: null == displayHeightPx ? _self.displayHeightPx : displayHeightPx // ignore: cast_nullable_to_non_nullable
as int,displayNumber: freezed == displayNumber ? _self.displayNumber : displayNumber // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CacheControlEphemeralCopyWith<$Res>? get cacheControl {
    if (_self.cacheControl == null) {
    return null;
  }

  return $CacheControlEphemeralCopyWith<$Res>(_self.cacheControl!, (value) {
    return _then(_self.copyWith(cacheControl: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ToolTextEditor extends Tool {
  const ToolTextEditor({this.type = 'text_editor_20241022', this.name = 'str_replace_editor', @JsonKey(name: 'cache_control', includeIfNull: false) this.cacheControl}): super._();
  factory ToolTextEditor.fromJson(Map<String, dynamic> json) => _$ToolTextEditorFromJson(json);

/// The type of tool.
@override@JsonKey() final  String type;
/// The name of the tool.
@override@JsonKey() final  String name;
/// The cache control settings.
@JsonKey(name: 'cache_control', includeIfNull: false) final  CacheControlEphemeral? cacheControl;

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolTextEditorCopyWith<ToolTextEditor> get copyWith => _$ToolTextEditorCopyWithImpl<ToolTextEditor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolTextEditorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolTextEditor&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.cacheControl, cacheControl) || other.cacheControl == cacheControl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,name,cacheControl);

@override
String toString() {
  return 'Tool.textEditor(type: $type, name: $name, cacheControl: $cacheControl)';
}


}

/// @nodoc
abstract mixin class $ToolTextEditorCopyWith<$Res> implements $ToolCopyWith<$Res> {
  factory $ToolTextEditorCopyWith(ToolTextEditor value, $Res Function(ToolTextEditor) _then) = _$ToolTextEditorCopyWithImpl;
@override @useResult
$Res call({
 String type, String name,@JsonKey(name: 'cache_control', includeIfNull: false) CacheControlEphemeral? cacheControl
});


$CacheControlEphemeralCopyWith<$Res>? get cacheControl;

}
/// @nodoc
class _$ToolTextEditorCopyWithImpl<$Res>
    implements $ToolTextEditorCopyWith<$Res> {
  _$ToolTextEditorCopyWithImpl(this._self, this._then);

  final ToolTextEditor _self;
  final $Res Function(ToolTextEditor) _then;

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? name = null,Object? cacheControl = freezed,}) {
  return _then(ToolTextEditor(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cacheControl: freezed == cacheControl ? _self.cacheControl : cacheControl // ignore: cast_nullable_to_non_nullable
as CacheControlEphemeral?,
  ));
}

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CacheControlEphemeralCopyWith<$Res>? get cacheControl {
    if (_self.cacheControl == null) {
    return null;
  }

  return $CacheControlEphemeralCopyWith<$Res>(_self.cacheControl!, (value) {
    return _then(_self.copyWith(cacheControl: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ToolBash extends Tool {
  const ToolBash({this.type = 'bash_20241022', this.name = 'bash', @JsonKey(name: 'cache_control', includeIfNull: false) this.cacheControl}): super._();
  factory ToolBash.fromJson(Map<String, dynamic> json) => _$ToolBashFromJson(json);

/// The type of tool.
@override@JsonKey() final  String type;
/// The name of the tool.
@override@JsonKey() final  String name;
/// The cache control settings.
@JsonKey(name: 'cache_control', includeIfNull: false) final  CacheControlEphemeral? cacheControl;

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolBashCopyWith<ToolBash> get copyWith => _$ToolBashCopyWithImpl<ToolBash>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolBashToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolBash&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.cacheControl, cacheControl) || other.cacheControl == cacheControl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,name,cacheControl);

@override
String toString() {
  return 'Tool.bash(type: $type, name: $name, cacheControl: $cacheControl)';
}


}

/// @nodoc
abstract mixin class $ToolBashCopyWith<$Res> implements $ToolCopyWith<$Res> {
  factory $ToolBashCopyWith(ToolBash value, $Res Function(ToolBash) _then) = _$ToolBashCopyWithImpl;
@override @useResult
$Res call({
 String type, String name,@JsonKey(name: 'cache_control', includeIfNull: false) CacheControlEphemeral? cacheControl
});


$CacheControlEphemeralCopyWith<$Res>? get cacheControl;

}
/// @nodoc
class _$ToolBashCopyWithImpl<$Res>
    implements $ToolBashCopyWith<$Res> {
  _$ToolBashCopyWithImpl(this._self, this._then);

  final ToolBash _self;
  final $Res Function(ToolBash) _then;

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? name = null,Object? cacheControl = freezed,}) {
  return _then(ToolBash(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cacheControl: freezed == cacheControl ? _self.cacheControl : cacheControl // ignore: cast_nullable_to_non_nullable
as CacheControlEphemeral?,
  ));
}

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CacheControlEphemeralCopyWith<$Res>? get cacheControl {
    if (_self.cacheControl == null) {
    return null;
  }

  return $CacheControlEphemeralCopyWith<$Res>(_self.cacheControl!, (value) {
    return _then(_self.copyWith(cacheControl: value));
  });
}
}

Block _$BlockFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'text':
          return TextBlock.fromJson(
            json
          );
                case 'image':
          return ImageBlock.fromJson(
            json
          );
                case 'tool_use':
          return ToolUseBlock.fromJson(
            json
          );
                case 'tool_result':
          return ToolResultBlock.fromJson(
            json
          );
                case 'thinking':
          return ThinkingBlock.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'Block',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$Block {

/// The type of content block.
 Object get type;/// The cache control settings.
@JsonKey(name: 'cache_control', includeIfNull: false) CacheControlEphemeral? get cacheControl;
/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockCopyWith<Block> get copyWith => _$BlockCopyWithImpl<Block>(this as Block, _$identity);

  /// Serializes this Block to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Block&&const DeepCollectionEquality().equals(other.type, type)&&(identical(other.cacheControl, cacheControl) || other.cacheControl == cacheControl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(type),cacheControl);

@override
String toString() {
  return 'Block(type: $type, cacheControl: $cacheControl)';
}


}

/// @nodoc
abstract mixin class $BlockCopyWith<$Res>  {
  factory $BlockCopyWith(Block value, $Res Function(Block) _then) = _$BlockCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'cache_control', includeIfNull: false) CacheControlEphemeral? cacheControl
});


$CacheControlEphemeralCopyWith<$Res>? get cacheControl;

}
/// @nodoc
class _$BlockCopyWithImpl<$Res>
    implements $BlockCopyWith<$Res> {
  _$BlockCopyWithImpl(this._self, this._then);

  final Block _self;
  final $Res Function(Block) _then;

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cacheControl = freezed,}) {
  return _then(_self.copyWith(
cacheControl: freezed == cacheControl ? _self.cacheControl : cacheControl // ignore: cast_nullable_to_non_nullable
as CacheControlEphemeral?,
  ));
}
/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CacheControlEphemeralCopyWith<$Res>? get cacheControl {
    if (_self.cacheControl == null) {
    return null;
  }

  return $CacheControlEphemeralCopyWith<$Res>(_self.cacheControl!, (value) {
    return _then(_self.copyWith(cacheControl: value));
  });
}
}


/// Adds pattern-matching-related methods to [Block].
extension BlockPatterns on Block {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TextBlock value)?  text,TResult Function( ImageBlock value)?  image,TResult Function( ToolUseBlock value)?  toolUse,TResult Function( ToolResultBlock value)?  toolResult,TResult Function( ThinkingBlock value)?  thinking,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TextBlock() when text != null:
return text(_that);case ImageBlock() when image != null:
return image(_that);case ToolUseBlock() when toolUse != null:
return toolUse(_that);case ToolResultBlock() when toolResult != null:
return toolResult(_that);case ThinkingBlock() when thinking != null:
return thinking(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TextBlock value)  text,required TResult Function( ImageBlock value)  image,required TResult Function( ToolUseBlock value)  toolUse,required TResult Function( ToolResultBlock value)  toolResult,required TResult Function( ThinkingBlock value)  thinking,}){
final _that = this;
switch (_that) {
case TextBlock():
return text(_that);case ImageBlock():
return image(_that);case ToolUseBlock():
return toolUse(_that);case ToolResultBlock():
return toolResult(_that);case ThinkingBlock():
return thinking(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TextBlock value)?  text,TResult? Function( ImageBlock value)?  image,TResult? Function( ToolUseBlock value)?  toolUse,TResult? Function( ToolResultBlock value)?  toolResult,TResult? Function( ThinkingBlock value)?  thinking,}){
final _that = this;
switch (_that) {
case TextBlock() when text != null:
return text(_that);case ImageBlock() when image != null:
return image(_that);case ToolUseBlock() when toolUse != null:
return toolUse(_that);case ToolResultBlock() when toolResult != null:
return toolResult(_that);case ThinkingBlock() when thinking != null:
return thinking(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text,  String type, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)?  text,TResult Function( ImageBlockSource source,  String type, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)?  image,TResult Function( String id,  String name,  Map<String, dynamic> input,  String type, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)?  toolUse,TResult Function(@JsonKey(name: 'tool_use_id')  String toolUseId, @_ToolResultBlockContentConverter()  ToolResultBlockContent content, @JsonKey(name: 'is_error', includeIfNull: false)  bool? isError,  String type, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)?  toolResult,TResult Function( ThinkingBlockType type,  String thinking, @JsonKey(includeIfNull: false)  String? signature, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)?  thinking,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TextBlock() when text != null:
return text(_that.text,_that.type,_that.cacheControl);case ImageBlock() when image != null:
return image(_that.source,_that.type,_that.cacheControl);case ToolUseBlock() when toolUse != null:
return toolUse(_that.id,_that.name,_that.input,_that.type,_that.cacheControl);case ToolResultBlock() when toolResult != null:
return toolResult(_that.toolUseId,_that.content,_that.isError,_that.type,_that.cacheControl);case ThinkingBlock() when thinking != null:
return thinking(_that.type,_that.thinking,_that.signature,_that.cacheControl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text,  String type, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)  text,required TResult Function( ImageBlockSource source,  String type, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)  image,required TResult Function( String id,  String name,  Map<String, dynamic> input,  String type, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)  toolUse,required TResult Function(@JsonKey(name: 'tool_use_id')  String toolUseId, @_ToolResultBlockContentConverter()  ToolResultBlockContent content, @JsonKey(name: 'is_error', includeIfNull: false)  bool? isError,  String type, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)  toolResult,required TResult Function( ThinkingBlockType type,  String thinking, @JsonKey(includeIfNull: false)  String? signature, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)  thinking,}) {final _that = this;
switch (_that) {
case TextBlock():
return text(_that.text,_that.type,_that.cacheControl);case ImageBlock():
return image(_that.source,_that.type,_that.cacheControl);case ToolUseBlock():
return toolUse(_that.id,_that.name,_that.input,_that.type,_that.cacheControl);case ToolResultBlock():
return toolResult(_that.toolUseId,_that.content,_that.isError,_that.type,_that.cacheControl);case ThinkingBlock():
return thinking(_that.type,_that.thinking,_that.signature,_that.cacheControl);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text,  String type, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)?  text,TResult? Function( ImageBlockSource source,  String type, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)?  image,TResult? Function( String id,  String name,  Map<String, dynamic> input,  String type, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)?  toolUse,TResult? Function(@JsonKey(name: 'tool_use_id')  String toolUseId, @_ToolResultBlockContentConverter()  ToolResultBlockContent content, @JsonKey(name: 'is_error', includeIfNull: false)  bool? isError,  String type, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)?  toolResult,TResult? Function( ThinkingBlockType type,  String thinking, @JsonKey(includeIfNull: false)  String? signature, @JsonKey(name: 'cache_control', includeIfNull: false)  CacheControlEphemeral? cacheControl)?  thinking,}) {final _that = this;
switch (_that) {
case TextBlock() when text != null:
return text(_that.text,_that.type,_that.cacheControl);case ImageBlock() when image != null:
return image(_that.source,_that.type,_that.cacheControl);case ToolUseBlock() when toolUse != null:
return toolUse(_that.id,_that.name,_that.input,_that.type,_that.cacheControl);case ToolResultBlock() when toolResult != null:
return toolResult(_that.toolUseId,_that.content,_that.isError,_that.type,_that.cacheControl);case ThinkingBlock() when thinking != null:
return thinking(_that.type,_that.thinking,_that.signature,_that.cacheControl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class TextBlock extends Block {
  const TextBlock({required this.text, this.type = 'text', @JsonKey(name: 'cache_control', includeIfNull: false) this.cacheControl}): super._();
  factory TextBlock.fromJson(Map<String, dynamic> json) => _$TextBlockFromJson(json);

/// The text content.
 final  String text;
/// The type of content block.
@override@JsonKey() final  String type;
/// The cache control settings.
@override@JsonKey(name: 'cache_control', includeIfNull: false) final  CacheControlEphemeral? cacheControl;

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextBlockCopyWith<TextBlock> get copyWith => _$TextBlockCopyWithImpl<TextBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextBlockToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextBlock&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.cacheControl, cacheControl) || other.cacheControl == cacheControl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,type,cacheControl);

@override
String toString() {
  return 'Block.text(text: $text, type: $type, cacheControl: $cacheControl)';
}


}

/// @nodoc
abstract mixin class $TextBlockCopyWith<$Res> implements $BlockCopyWith<$Res> {
  factory $TextBlockCopyWith(TextBlock value, $Res Function(TextBlock) _then) = _$TextBlockCopyWithImpl;
@override @useResult
$Res call({
 String text, String type,@JsonKey(name: 'cache_control', includeIfNull: false) CacheControlEphemeral? cacheControl
});


@override $CacheControlEphemeralCopyWith<$Res>? get cacheControl;

}
/// @nodoc
class _$TextBlockCopyWithImpl<$Res>
    implements $TextBlockCopyWith<$Res> {
  _$TextBlockCopyWithImpl(this._self, this._then);

  final TextBlock _self;
  final $Res Function(TextBlock) _then;

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? type = null,Object? cacheControl = freezed,}) {
  return _then(TextBlock(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,cacheControl: freezed == cacheControl ? _self.cacheControl : cacheControl // ignore: cast_nullable_to_non_nullable
as CacheControlEphemeral?,
  ));
}

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CacheControlEphemeralCopyWith<$Res>? get cacheControl {
    if (_self.cacheControl == null) {
    return null;
  }

  return $CacheControlEphemeralCopyWith<$Res>(_self.cacheControl!, (value) {
    return _then(_self.copyWith(cacheControl: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ImageBlock extends Block {
  const ImageBlock({required this.source, this.type = 'image', @JsonKey(name: 'cache_control', includeIfNull: false) this.cacheControl}): super._();
  factory ImageBlock.fromJson(Map<String, dynamic> json) => _$ImageBlockFromJson(json);

/// The source of an image block.
 final  ImageBlockSource source;
/// The type of content block.
@override@JsonKey() final  String type;
/// The cache control settings.
@override@JsonKey(name: 'cache_control', includeIfNull: false) final  CacheControlEphemeral? cacheControl;

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageBlockCopyWith<ImageBlock> get copyWith => _$ImageBlockCopyWithImpl<ImageBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageBlockToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageBlock&&(identical(other.source, source) || other.source == source)&&(identical(other.type, type) || other.type == type)&&(identical(other.cacheControl, cacheControl) || other.cacheControl == cacheControl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,type,cacheControl);

@override
String toString() {
  return 'Block.image(source: $source, type: $type, cacheControl: $cacheControl)';
}


}

/// @nodoc
abstract mixin class $ImageBlockCopyWith<$Res> implements $BlockCopyWith<$Res> {
  factory $ImageBlockCopyWith(ImageBlock value, $Res Function(ImageBlock) _then) = _$ImageBlockCopyWithImpl;
@override @useResult
$Res call({
 ImageBlockSource source, String type,@JsonKey(name: 'cache_control', includeIfNull: false) CacheControlEphemeral? cacheControl
});


$ImageBlockSourceCopyWith<$Res> get source;@override $CacheControlEphemeralCopyWith<$Res>? get cacheControl;

}
/// @nodoc
class _$ImageBlockCopyWithImpl<$Res>
    implements $ImageBlockCopyWith<$Res> {
  _$ImageBlockCopyWithImpl(this._self, this._then);

  final ImageBlock _self;
  final $Res Function(ImageBlock) _then;

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = null,Object? type = null,Object? cacheControl = freezed,}) {
  return _then(ImageBlock(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ImageBlockSource,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,cacheControl: freezed == cacheControl ? _self.cacheControl : cacheControl // ignore: cast_nullable_to_non_nullable
as CacheControlEphemeral?,
  ));
}

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageBlockSourceCopyWith<$Res> get source {
  
  return $ImageBlockSourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CacheControlEphemeralCopyWith<$Res>? get cacheControl {
    if (_self.cacheControl == null) {
    return null;
  }

  return $CacheControlEphemeralCopyWith<$Res>(_self.cacheControl!, (value) {
    return _then(_self.copyWith(cacheControl: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ToolUseBlock extends Block {
  const ToolUseBlock({required this.id, required this.name, required final  Map<String, dynamic> input, this.type = 'tool_use', @JsonKey(name: 'cache_control', includeIfNull: false) this.cacheControl}): _input = input,super._();
  factory ToolUseBlock.fromJson(Map<String, dynamic> json) => _$ToolUseBlockFromJson(json);

/// A unique identifier for this particular tool use block.
/// This will be used to match up the tool results later.
 final  String id;
/// The name of the tool being used.
 final  String name;
/// An object containing the input being passed to the tool, conforming to the tool's `input_schema`.
 final  Map<String, dynamic> _input;
/// An object containing the input being passed to the tool, conforming to the tool's `input_schema`.
 Map<String, dynamic> get input {
  if (_input is EqualUnmodifiableMapView) return _input;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_input);
}

/// The type of content block.
@override@JsonKey() final  String type;
/// The cache control settings.
@override@JsonKey(name: 'cache_control', includeIfNull: false) final  CacheControlEphemeral? cacheControl;

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolUseBlockCopyWith<ToolUseBlock> get copyWith => _$ToolUseBlockCopyWithImpl<ToolUseBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolUseBlockToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolUseBlock&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._input, _input)&&(identical(other.type, type) || other.type == type)&&(identical(other.cacheControl, cacheControl) || other.cacheControl == cacheControl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_input),type,cacheControl);

@override
String toString() {
  return 'Block.toolUse(id: $id, name: $name, input: $input, type: $type, cacheControl: $cacheControl)';
}


}

/// @nodoc
abstract mixin class $ToolUseBlockCopyWith<$Res> implements $BlockCopyWith<$Res> {
  factory $ToolUseBlockCopyWith(ToolUseBlock value, $Res Function(ToolUseBlock) _then) = _$ToolUseBlockCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, Map<String, dynamic> input, String type,@JsonKey(name: 'cache_control', includeIfNull: false) CacheControlEphemeral? cacheControl
});


@override $CacheControlEphemeralCopyWith<$Res>? get cacheControl;

}
/// @nodoc
class _$ToolUseBlockCopyWithImpl<$Res>
    implements $ToolUseBlockCopyWith<$Res> {
  _$ToolUseBlockCopyWithImpl(this._self, this._then);

  final ToolUseBlock _self;
  final $Res Function(ToolUseBlock) _then;

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? input = null,Object? type = null,Object? cacheControl = freezed,}) {
  return _then(ToolUseBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,input: null == input ? _self._input : input // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,cacheControl: freezed == cacheControl ? _self.cacheControl : cacheControl // ignore: cast_nullable_to_non_nullable
as CacheControlEphemeral?,
  ));
}

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CacheControlEphemeralCopyWith<$Res>? get cacheControl {
    if (_self.cacheControl == null) {
    return null;
  }

  return $CacheControlEphemeralCopyWith<$Res>(_self.cacheControl!, (value) {
    return _then(_self.copyWith(cacheControl: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ToolResultBlock extends Block {
  const ToolResultBlock({@JsonKey(name: 'tool_use_id') required this.toolUseId, @_ToolResultBlockContentConverter() required this.content, @JsonKey(name: 'is_error', includeIfNull: false) this.isError, this.type = 'tool_result', @JsonKey(name: 'cache_control', includeIfNull: false) this.cacheControl}): super._();
  factory ToolResultBlock.fromJson(Map<String, dynamic> json) => _$ToolResultBlockFromJson(json);

/// The `id` of the tool use request this is a result for.
@JsonKey(name: 'tool_use_id') final  String toolUseId;
/// The result of the tool, as a string (e.g. `"content": "15 degrees"`)
/// or list of nested content blocks (e.g. `"content": [{"type": "text", "text": "15 degrees"}]`).
/// These content blocks can use the text or image types.
@_ToolResultBlockContentConverter() final  ToolResultBlockContent content;
/// Set to `true` if the tool execution resulted in an error.
@JsonKey(name: 'is_error', includeIfNull: false) final  bool? isError;
/// The type of content block.
@override@JsonKey() final  String type;
/// The cache control settings.
@override@JsonKey(name: 'cache_control', includeIfNull: false) final  CacheControlEphemeral? cacheControl;

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolResultBlockCopyWith<ToolResultBlock> get copyWith => _$ToolResultBlockCopyWithImpl<ToolResultBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolResultBlockToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolResultBlock&&(identical(other.toolUseId, toolUseId) || other.toolUseId == toolUseId)&&(identical(other.content, content) || other.content == content)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.type, type) || other.type == type)&&(identical(other.cacheControl, cacheControl) || other.cacheControl == cacheControl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,toolUseId,content,isError,type,cacheControl);

@override
String toString() {
  return 'Block.toolResult(toolUseId: $toolUseId, content: $content, isError: $isError, type: $type, cacheControl: $cacheControl)';
}


}

/// @nodoc
abstract mixin class $ToolResultBlockCopyWith<$Res> implements $BlockCopyWith<$Res> {
  factory $ToolResultBlockCopyWith(ToolResultBlock value, $Res Function(ToolResultBlock) _then) = _$ToolResultBlockCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'tool_use_id') String toolUseId,@_ToolResultBlockContentConverter() ToolResultBlockContent content,@JsonKey(name: 'is_error', includeIfNull: false) bool? isError, String type,@JsonKey(name: 'cache_control', includeIfNull: false) CacheControlEphemeral? cacheControl
});


$ToolResultBlockContentCopyWith<$Res> get content;@override $CacheControlEphemeralCopyWith<$Res>? get cacheControl;

}
/// @nodoc
class _$ToolResultBlockCopyWithImpl<$Res>
    implements $ToolResultBlockCopyWith<$Res> {
  _$ToolResultBlockCopyWithImpl(this._self, this._then);

  final ToolResultBlock _self;
  final $Res Function(ToolResultBlock) _then;

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? toolUseId = null,Object? content = null,Object? isError = freezed,Object? type = null,Object? cacheControl = freezed,}) {
  return _then(ToolResultBlock(
toolUseId: null == toolUseId ? _self.toolUseId : toolUseId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as ToolResultBlockContent,isError: freezed == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,cacheControl: freezed == cacheControl ? _self.cacheControl : cacheControl // ignore: cast_nullable_to_non_nullable
as CacheControlEphemeral?,
  ));
}

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolResultBlockContentCopyWith<$Res> get content {
  
  return $ToolResultBlockContentCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CacheControlEphemeralCopyWith<$Res>? get cacheControl {
    if (_self.cacheControl == null) {
    return null;
  }

  return $CacheControlEphemeralCopyWith<$Res>(_self.cacheControl!, (value) {
    return _then(_self.copyWith(cacheControl: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ThinkingBlock extends Block {
  const ThinkingBlock({required this.type, required this.thinking, @JsonKey(includeIfNull: false) this.signature, @JsonKey(name: 'cache_control', includeIfNull: false) this.cacheControl}): super._();
  factory ThinkingBlock.fromJson(Map<String, dynamic> json) => _$ThinkingBlockFromJson(json);

/// The type of content block.
@override final  ThinkingBlockType type;
/// The text of Claude's internal reasoning and thinking process. This shows
/// how Claude approached and analyzed the problem before providing a final answer.
 final  String thinking;
/// Optional cryptographic signature for the thinking block to verify its
/// authenticity and integrity.
@JsonKey(includeIfNull: false) final  String? signature;
/// The cache control settings.
@override@JsonKey(name: 'cache_control', includeIfNull: false) final  CacheControlEphemeral? cacheControl;

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThinkingBlockCopyWith<ThinkingBlock> get copyWith => _$ThinkingBlockCopyWithImpl<ThinkingBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThinkingBlockToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThinkingBlock&&(identical(other.type, type) || other.type == type)&&(identical(other.thinking, thinking) || other.thinking == thinking)&&(identical(other.signature, signature) || other.signature == signature)&&(identical(other.cacheControl, cacheControl) || other.cacheControl == cacheControl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,thinking,signature,cacheControl);

@override
String toString() {
  return 'Block.thinking(type: $type, thinking: $thinking, signature: $signature, cacheControl: $cacheControl)';
}


}

/// @nodoc
abstract mixin class $ThinkingBlockCopyWith<$Res> implements $BlockCopyWith<$Res> {
  factory $ThinkingBlockCopyWith(ThinkingBlock value, $Res Function(ThinkingBlock) _then) = _$ThinkingBlockCopyWithImpl;
@override @useResult
$Res call({
 ThinkingBlockType type, String thinking,@JsonKey(includeIfNull: false) String? signature,@JsonKey(name: 'cache_control', includeIfNull: false) CacheControlEphemeral? cacheControl
});


@override $CacheControlEphemeralCopyWith<$Res>? get cacheControl;

}
/// @nodoc
class _$ThinkingBlockCopyWithImpl<$Res>
    implements $ThinkingBlockCopyWith<$Res> {
  _$ThinkingBlockCopyWithImpl(this._self, this._then);

  final ThinkingBlock _self;
  final $Res Function(ThinkingBlock) _then;

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? thinking = null,Object? signature = freezed,Object? cacheControl = freezed,}) {
  return _then(ThinkingBlock(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ThinkingBlockType,thinking: null == thinking ? _self.thinking : thinking // ignore: cast_nullable_to_non_nullable
as String,signature: freezed == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String?,cacheControl: freezed == cacheControl ? _self.cacheControl : cacheControl // ignore: cast_nullable_to_non_nullable
as CacheControlEphemeral?,
  ));
}

/// Create a copy of Block
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CacheControlEphemeralCopyWith<$Res>? get cacheControl {
    if (_self.cacheControl == null) {
    return null;
  }

  return $CacheControlEphemeralCopyWith<$Res>(_self.cacheControl!, (value) {
    return _then(_self.copyWith(cacheControl: value));
  });
}
}

ToolResultBlockContent _$ToolResultBlockContentFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'blocks':
          return ToolResultBlockContentBlocks.fromJson(
            json
          );
                case 'text':
          return ToolResultBlockContentText.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'ToolResultBlockContent',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$ToolResultBlockContent {

 Object get value;

  /// Serializes this ToolResultBlockContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolResultBlockContent&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'ToolResultBlockContent(value: $value)';
}


}

/// @nodoc
class $ToolResultBlockContentCopyWith<$Res>  {
$ToolResultBlockContentCopyWith(ToolResultBlockContent _, $Res Function(ToolResultBlockContent) __);
}


/// Adds pattern-matching-related methods to [ToolResultBlockContent].
extension ToolResultBlockContentPatterns on ToolResultBlockContent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ToolResultBlockContentBlocks value)?  blocks,TResult Function( ToolResultBlockContentText value)?  text,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ToolResultBlockContentBlocks() when blocks != null:
return blocks(_that);case ToolResultBlockContentText() when text != null:
return text(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ToolResultBlockContentBlocks value)  blocks,required TResult Function( ToolResultBlockContentText value)  text,}){
final _that = this;
switch (_that) {
case ToolResultBlockContentBlocks():
return blocks(_that);case ToolResultBlockContentText():
return text(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ToolResultBlockContentBlocks value)?  blocks,TResult? Function( ToolResultBlockContentText value)?  text,}){
final _that = this;
switch (_that) {
case ToolResultBlockContentBlocks() when blocks != null:
return blocks(_that);case ToolResultBlockContentText() when text != null:
return text(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Block> value)?  blocks,TResult Function( String value)?  text,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ToolResultBlockContentBlocks() when blocks != null:
return blocks(_that.value);case ToolResultBlockContentText() when text != null:
return text(_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Block> value)  blocks,required TResult Function( String value)  text,}) {final _that = this;
switch (_that) {
case ToolResultBlockContentBlocks():
return blocks(_that.value);case ToolResultBlockContentText():
return text(_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Block> value)?  blocks,TResult? Function( String value)?  text,}) {final _that = this;
switch (_that) {
case ToolResultBlockContentBlocks() when blocks != null:
return blocks(_that.value);case ToolResultBlockContentText() when text != null:
return text(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ToolResultBlockContentBlocks extends ToolResultBlockContent {
  const ToolResultBlockContentBlocks(final  List<Block> value, {final  String? $type}): _value = value,$type = $type ?? 'blocks',super._();
  factory ToolResultBlockContentBlocks.fromJson(Map<String, dynamic> json) => _$ToolResultBlockContentBlocksFromJson(json);

 final  List<Block> _value;
@override List<Block> get value {
  if (_value is EqualUnmodifiableListView) return _value;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_value);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ToolResultBlockContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolResultBlockContentBlocksCopyWith<ToolResultBlockContentBlocks> get copyWith => _$ToolResultBlockContentBlocksCopyWithImpl<ToolResultBlockContentBlocks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolResultBlockContentBlocksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolResultBlockContentBlocks&&const DeepCollectionEquality().equals(other._value, _value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_value));

@override
String toString() {
  return 'ToolResultBlockContent.blocks(value: $value)';
}


}

/// @nodoc
abstract mixin class $ToolResultBlockContentBlocksCopyWith<$Res> implements $ToolResultBlockContentCopyWith<$Res> {
  factory $ToolResultBlockContentBlocksCopyWith(ToolResultBlockContentBlocks value, $Res Function(ToolResultBlockContentBlocks) _then) = _$ToolResultBlockContentBlocksCopyWithImpl;
@useResult
$Res call({
 List<Block> value
});




}
/// @nodoc
class _$ToolResultBlockContentBlocksCopyWithImpl<$Res>
    implements $ToolResultBlockContentBlocksCopyWith<$Res> {
  _$ToolResultBlockContentBlocksCopyWithImpl(this._self, this._then);

  final ToolResultBlockContentBlocks _self;
  final $Res Function(ToolResultBlockContentBlocks) _then;

/// Create a copy of ToolResultBlockContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ToolResultBlockContentBlocks(
null == value ? _self._value : value // ignore: cast_nullable_to_non_nullable
as List<Block>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ToolResultBlockContentText extends ToolResultBlockContent {
  const ToolResultBlockContentText(this.value, {final  String? $type}): $type = $type ?? 'text',super._();
  factory ToolResultBlockContentText.fromJson(Map<String, dynamic> json) => _$ToolResultBlockContentTextFromJson(json);

@override final  String value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ToolResultBlockContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolResultBlockContentTextCopyWith<ToolResultBlockContentText> get copyWith => _$ToolResultBlockContentTextCopyWithImpl<ToolResultBlockContentText>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolResultBlockContentTextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolResultBlockContentText&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ToolResultBlockContent.text(value: $value)';
}


}

/// @nodoc
abstract mixin class $ToolResultBlockContentTextCopyWith<$Res> implements $ToolResultBlockContentCopyWith<$Res> {
  factory $ToolResultBlockContentTextCopyWith(ToolResultBlockContentText value, $Res Function(ToolResultBlockContentText) _then) = _$ToolResultBlockContentTextCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$ToolResultBlockContentTextCopyWithImpl<$Res>
    implements $ToolResultBlockContentTextCopyWith<$Res> {
  _$ToolResultBlockContentTextCopyWithImpl(this._self, this._then);

  final ToolResultBlockContentText _self;
  final $Res Function(ToolResultBlockContentText) _then;

/// Create a copy of ToolResultBlockContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ToolResultBlockContentText(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

MessageStreamEvent _$MessageStreamEventFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'message_start':
          return MessageStartEvent.fromJson(
            json
          );
                case 'message_delta':
          return MessageDeltaEvent.fromJson(
            json
          );
                case 'message_stop':
          return MessageStopEvent.fromJson(
            json
          );
                case 'content_block_start':
          return ContentBlockStartEvent.fromJson(
            json
          );
                case 'content_block_delta':
          return ContentBlockDeltaEvent.fromJson(
            json
          );
                case 'content_block_stop':
          return ContentBlockStopEvent.fromJson(
            json
          );
                case 'ping':
          return PingEvent.fromJson(
            json
          );
                case 'error':
          return ErrorEvent.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'MessageStreamEvent',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$MessageStreamEvent {

/// The type of a streaming event.
 MessageStreamEventType get type;
/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageStreamEventCopyWith<MessageStreamEvent> get copyWith => _$MessageStreamEventCopyWithImpl<MessageStreamEvent>(this as MessageStreamEvent, _$identity);

  /// Serializes this MessageStreamEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageStreamEvent&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'MessageStreamEvent(type: $type)';
}


}

/// @nodoc
abstract mixin class $MessageStreamEventCopyWith<$Res>  {
  factory $MessageStreamEventCopyWith(MessageStreamEvent value, $Res Function(MessageStreamEvent) _then) = _$MessageStreamEventCopyWithImpl;
@useResult
$Res call({
 MessageStreamEventType type
});




}
/// @nodoc
class _$MessageStreamEventCopyWithImpl<$Res>
    implements $MessageStreamEventCopyWith<$Res> {
  _$MessageStreamEventCopyWithImpl(this._self, this._then);

  final MessageStreamEvent _self;
  final $Res Function(MessageStreamEvent) _then;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageStreamEventType,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageStreamEvent].
extension MessageStreamEventPatterns on MessageStreamEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MessageStartEvent value)?  messageStart,TResult Function( MessageDeltaEvent value)?  messageDelta,TResult Function( MessageStopEvent value)?  messageStop,TResult Function( ContentBlockStartEvent value)?  contentBlockStart,TResult Function( ContentBlockDeltaEvent value)?  contentBlockDelta,TResult Function( ContentBlockStopEvent value)?  contentBlockStop,TResult Function( PingEvent value)?  ping,TResult Function( ErrorEvent value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MessageStartEvent() when messageStart != null:
return messageStart(_that);case MessageDeltaEvent() when messageDelta != null:
return messageDelta(_that);case MessageStopEvent() when messageStop != null:
return messageStop(_that);case ContentBlockStartEvent() when contentBlockStart != null:
return contentBlockStart(_that);case ContentBlockDeltaEvent() when contentBlockDelta != null:
return contentBlockDelta(_that);case ContentBlockStopEvent() when contentBlockStop != null:
return contentBlockStop(_that);case PingEvent() when ping != null:
return ping(_that);case ErrorEvent() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MessageStartEvent value)  messageStart,required TResult Function( MessageDeltaEvent value)  messageDelta,required TResult Function( MessageStopEvent value)  messageStop,required TResult Function( ContentBlockStartEvent value)  contentBlockStart,required TResult Function( ContentBlockDeltaEvent value)  contentBlockDelta,required TResult Function( ContentBlockStopEvent value)  contentBlockStop,required TResult Function( PingEvent value)  ping,required TResult Function( ErrorEvent value)  error,}){
final _that = this;
switch (_that) {
case MessageStartEvent():
return messageStart(_that);case MessageDeltaEvent():
return messageDelta(_that);case MessageStopEvent():
return messageStop(_that);case ContentBlockStartEvent():
return contentBlockStart(_that);case ContentBlockDeltaEvent():
return contentBlockDelta(_that);case ContentBlockStopEvent():
return contentBlockStop(_that);case PingEvent():
return ping(_that);case ErrorEvent():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MessageStartEvent value)?  messageStart,TResult? Function( MessageDeltaEvent value)?  messageDelta,TResult? Function( MessageStopEvent value)?  messageStop,TResult? Function( ContentBlockStartEvent value)?  contentBlockStart,TResult? Function( ContentBlockDeltaEvent value)?  contentBlockDelta,TResult? Function( ContentBlockStopEvent value)?  contentBlockStop,TResult? Function( PingEvent value)?  ping,TResult? Function( ErrorEvent value)?  error,}){
final _that = this;
switch (_that) {
case MessageStartEvent() when messageStart != null:
return messageStart(_that);case MessageDeltaEvent() when messageDelta != null:
return messageDelta(_that);case MessageStopEvent() when messageStop != null:
return messageStop(_that);case ContentBlockStartEvent() when contentBlockStart != null:
return contentBlockStart(_that);case ContentBlockDeltaEvent() when contentBlockDelta != null:
return contentBlockDelta(_that);case ContentBlockStopEvent() when contentBlockStop != null:
return contentBlockStop(_that);case PingEvent() when ping != null:
return ping(_that);case ErrorEvent() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Message message,  MessageStreamEventType type)?  messageStart,TResult Function( MessageDelta delta,  MessageStreamEventType type,  MessageDeltaUsage usage)?  messageDelta,TResult Function( MessageStreamEventType type)?  messageStop,TResult Function(@JsonKey(name: 'content_block')  Block contentBlock,  int index,  MessageStreamEventType type)?  contentBlockStart,TResult Function( BlockDelta delta,  int index,  MessageStreamEventType type)?  contentBlockDelta,TResult Function( int index,  MessageStreamEventType type)?  contentBlockStop,TResult Function( MessageStreamEventType type)?  ping,TResult Function( MessageStreamEventType type,  Error error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MessageStartEvent() when messageStart != null:
return messageStart(_that.message,_that.type);case MessageDeltaEvent() when messageDelta != null:
return messageDelta(_that.delta,_that.type,_that.usage);case MessageStopEvent() when messageStop != null:
return messageStop(_that.type);case ContentBlockStartEvent() when contentBlockStart != null:
return contentBlockStart(_that.contentBlock,_that.index,_that.type);case ContentBlockDeltaEvent() when contentBlockDelta != null:
return contentBlockDelta(_that.delta,_that.index,_that.type);case ContentBlockStopEvent() when contentBlockStop != null:
return contentBlockStop(_that.index,_that.type);case PingEvent() when ping != null:
return ping(_that.type);case ErrorEvent() when error != null:
return error(_that.type,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Message message,  MessageStreamEventType type)  messageStart,required TResult Function( MessageDelta delta,  MessageStreamEventType type,  MessageDeltaUsage usage)  messageDelta,required TResult Function( MessageStreamEventType type)  messageStop,required TResult Function(@JsonKey(name: 'content_block')  Block contentBlock,  int index,  MessageStreamEventType type)  contentBlockStart,required TResult Function( BlockDelta delta,  int index,  MessageStreamEventType type)  contentBlockDelta,required TResult Function( int index,  MessageStreamEventType type)  contentBlockStop,required TResult Function( MessageStreamEventType type)  ping,required TResult Function( MessageStreamEventType type,  Error error)  error,}) {final _that = this;
switch (_that) {
case MessageStartEvent():
return messageStart(_that.message,_that.type);case MessageDeltaEvent():
return messageDelta(_that.delta,_that.type,_that.usage);case MessageStopEvent():
return messageStop(_that.type);case ContentBlockStartEvent():
return contentBlockStart(_that.contentBlock,_that.index,_that.type);case ContentBlockDeltaEvent():
return contentBlockDelta(_that.delta,_that.index,_that.type);case ContentBlockStopEvent():
return contentBlockStop(_that.index,_that.type);case PingEvent():
return ping(_that.type);case ErrorEvent():
return error(_that.type,_that.error);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Message message,  MessageStreamEventType type)?  messageStart,TResult? Function( MessageDelta delta,  MessageStreamEventType type,  MessageDeltaUsage usage)?  messageDelta,TResult? Function( MessageStreamEventType type)?  messageStop,TResult? Function(@JsonKey(name: 'content_block')  Block contentBlock,  int index,  MessageStreamEventType type)?  contentBlockStart,TResult? Function( BlockDelta delta,  int index,  MessageStreamEventType type)?  contentBlockDelta,TResult? Function( int index,  MessageStreamEventType type)?  contentBlockStop,TResult? Function( MessageStreamEventType type)?  ping,TResult? Function( MessageStreamEventType type,  Error error)?  error,}) {final _that = this;
switch (_that) {
case MessageStartEvent() when messageStart != null:
return messageStart(_that.message,_that.type);case MessageDeltaEvent() when messageDelta != null:
return messageDelta(_that.delta,_that.type,_that.usage);case MessageStopEvent() when messageStop != null:
return messageStop(_that.type);case ContentBlockStartEvent() when contentBlockStart != null:
return contentBlockStart(_that.contentBlock,_that.index,_that.type);case ContentBlockDeltaEvent() when contentBlockDelta != null:
return contentBlockDelta(_that.delta,_that.index,_that.type);case ContentBlockStopEvent() when contentBlockStop != null:
return contentBlockStop(_that.index,_that.type);case PingEvent() when ping != null:
return ping(_that.type);case ErrorEvent() when error != null:
return error(_that.type,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class MessageStartEvent extends MessageStreamEvent {
  const MessageStartEvent({required this.message, required this.type}): super._();
  factory MessageStartEvent.fromJson(Map<String, dynamic> json) => _$MessageStartEventFromJson(json);

/// A message in a chat conversation.
 final  Message message;
/// The type of a streaming event.
@override final  MessageStreamEventType type;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageStartEventCopyWith<MessageStartEvent> get copyWith => _$MessageStartEventCopyWithImpl<MessageStartEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageStartEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageStartEvent&&(identical(other.message, message) || other.message == message)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,type);

@override
String toString() {
  return 'MessageStreamEvent.messageStart(message: $message, type: $type)';
}


}

/// @nodoc
abstract mixin class $MessageStartEventCopyWith<$Res> implements $MessageStreamEventCopyWith<$Res> {
  factory $MessageStartEventCopyWith(MessageStartEvent value, $Res Function(MessageStartEvent) _then) = _$MessageStartEventCopyWithImpl;
@override @useResult
$Res call({
 Message message, MessageStreamEventType type
});


$MessageCopyWith<$Res> get message;

}
/// @nodoc
class _$MessageStartEventCopyWithImpl<$Res>
    implements $MessageStartEventCopyWith<$Res> {
  _$MessageStartEventCopyWithImpl(this._self, this._then);

  final MessageStartEvent _self;
  final $Res Function(MessageStartEvent) _then;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? type = null,}) {
  return _then(MessageStartEvent(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageStreamEventType,
  ));
}

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get message {
  
  return $MessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class MessageDeltaEvent extends MessageStreamEvent {
  const MessageDeltaEvent({required this.delta, required this.type, required this.usage}): super._();
  factory MessageDeltaEvent.fromJson(Map<String, dynamic> json) => _$MessageDeltaEventFromJson(json);

/// A delta in a streaming message.
 final  MessageDelta delta;
/// The type of a streaming event.
@override final  MessageStreamEventType type;
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
 final  MessageDeltaUsage usage;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageDeltaEventCopyWith<MessageDeltaEvent> get copyWith => _$MessageDeltaEventCopyWithImpl<MessageDeltaEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageDeltaEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageDeltaEvent&&(identical(other.delta, delta) || other.delta == delta)&&(identical(other.type, type) || other.type == type)&&(identical(other.usage, usage) || other.usage == usage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,delta,type,usage);

@override
String toString() {
  return 'MessageStreamEvent.messageDelta(delta: $delta, type: $type, usage: $usage)';
}


}

/// @nodoc
abstract mixin class $MessageDeltaEventCopyWith<$Res> implements $MessageStreamEventCopyWith<$Res> {
  factory $MessageDeltaEventCopyWith(MessageDeltaEvent value, $Res Function(MessageDeltaEvent) _then) = _$MessageDeltaEventCopyWithImpl;
@override @useResult
$Res call({
 MessageDelta delta, MessageStreamEventType type, MessageDeltaUsage usage
});


$MessageDeltaCopyWith<$Res> get delta;$MessageDeltaUsageCopyWith<$Res> get usage;

}
/// @nodoc
class _$MessageDeltaEventCopyWithImpl<$Res>
    implements $MessageDeltaEventCopyWith<$Res> {
  _$MessageDeltaEventCopyWithImpl(this._self, this._then);

  final MessageDeltaEvent _self;
  final $Res Function(MessageDeltaEvent) _then;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? delta = null,Object? type = null,Object? usage = null,}) {
  return _then(MessageDeltaEvent(
delta: null == delta ? _self.delta : delta // ignore: cast_nullable_to_non_nullable
as MessageDelta,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageStreamEventType,usage: null == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as MessageDeltaUsage,
  ));
}

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageDeltaCopyWith<$Res> get delta {
  
  return $MessageDeltaCopyWith<$Res>(_self.delta, (value) {
    return _then(_self.copyWith(delta: value));
  });
}/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageDeltaUsageCopyWith<$Res> get usage {
  
  return $MessageDeltaUsageCopyWith<$Res>(_self.usage, (value) {
    return _then(_self.copyWith(usage: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class MessageStopEvent extends MessageStreamEvent {
  const MessageStopEvent({required this.type}): super._();
  factory MessageStopEvent.fromJson(Map<String, dynamic> json) => _$MessageStopEventFromJson(json);

/// The type of a streaming event.
@override final  MessageStreamEventType type;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageStopEventCopyWith<MessageStopEvent> get copyWith => _$MessageStopEventCopyWithImpl<MessageStopEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageStopEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageStopEvent&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'MessageStreamEvent.messageStop(type: $type)';
}


}

/// @nodoc
abstract mixin class $MessageStopEventCopyWith<$Res> implements $MessageStreamEventCopyWith<$Res> {
  factory $MessageStopEventCopyWith(MessageStopEvent value, $Res Function(MessageStopEvent) _then) = _$MessageStopEventCopyWithImpl;
@override @useResult
$Res call({
 MessageStreamEventType type
});




}
/// @nodoc
class _$MessageStopEventCopyWithImpl<$Res>
    implements $MessageStopEventCopyWith<$Res> {
  _$MessageStopEventCopyWithImpl(this._self, this._then);

  final MessageStopEvent _self;
  final $Res Function(MessageStopEvent) _then;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(MessageStopEvent(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageStreamEventType,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ContentBlockStartEvent extends MessageStreamEvent {
  const ContentBlockStartEvent({@JsonKey(name: 'content_block') required this.contentBlock, required this.index, required this.type}): super._();
  factory ContentBlockStartEvent.fromJson(Map<String, dynamic> json) => _$ContentBlockStartEventFromJson(json);

/// A block of content in a message.
/// Any of: [TextBlock], [ImageBlock], [ToolUseBlock], [ToolResultBlock], [ThinkingBlock]
@JsonKey(name: 'content_block') final  Block contentBlock;
/// The index of the content block.
 final  int index;
/// The type of a streaming event.
@override final  MessageStreamEventType type;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentBlockStartEventCopyWith<ContentBlockStartEvent> get copyWith => _$ContentBlockStartEventCopyWithImpl<ContentBlockStartEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentBlockStartEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentBlockStartEvent&&(identical(other.contentBlock, contentBlock) || other.contentBlock == contentBlock)&&(identical(other.index, index) || other.index == index)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contentBlock,index,type);

@override
String toString() {
  return 'MessageStreamEvent.contentBlockStart(contentBlock: $contentBlock, index: $index, type: $type)';
}


}

/// @nodoc
abstract mixin class $ContentBlockStartEventCopyWith<$Res> implements $MessageStreamEventCopyWith<$Res> {
  factory $ContentBlockStartEventCopyWith(ContentBlockStartEvent value, $Res Function(ContentBlockStartEvent) _then) = _$ContentBlockStartEventCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'content_block') Block contentBlock, int index, MessageStreamEventType type
});


$BlockCopyWith<$Res> get contentBlock;

}
/// @nodoc
class _$ContentBlockStartEventCopyWithImpl<$Res>
    implements $ContentBlockStartEventCopyWith<$Res> {
  _$ContentBlockStartEventCopyWithImpl(this._self, this._then);

  final ContentBlockStartEvent _self;
  final $Res Function(ContentBlockStartEvent) _then;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contentBlock = null,Object? index = null,Object? type = null,}) {
  return _then(ContentBlockStartEvent(
contentBlock: null == contentBlock ? _self.contentBlock : contentBlock // ignore: cast_nullable_to_non_nullable
as Block,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageStreamEventType,
  ));
}

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlockCopyWith<$Res> get contentBlock {
  
  return $BlockCopyWith<$Res>(_self.contentBlock, (value) {
    return _then(_self.copyWith(contentBlock: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ContentBlockDeltaEvent extends MessageStreamEvent {
  const ContentBlockDeltaEvent({required this.delta, required this.index, required this.type}): super._();
  factory ContentBlockDeltaEvent.fromJson(Map<String, dynamic> json) => _$ContentBlockDeltaEventFromJson(json);

/// A delta in a streaming message.
/// Any of: [TextBlockDelta], [InputJsonBlockDelta], [ThinkingBlockDelta]
 final  BlockDelta delta;
/// The index of the content block.
 final  int index;
/// The type of a streaming event.
@override final  MessageStreamEventType type;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentBlockDeltaEventCopyWith<ContentBlockDeltaEvent> get copyWith => _$ContentBlockDeltaEventCopyWithImpl<ContentBlockDeltaEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentBlockDeltaEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentBlockDeltaEvent&&(identical(other.delta, delta) || other.delta == delta)&&(identical(other.index, index) || other.index == index)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,delta,index,type);

@override
String toString() {
  return 'MessageStreamEvent.contentBlockDelta(delta: $delta, index: $index, type: $type)';
}


}

/// @nodoc
abstract mixin class $ContentBlockDeltaEventCopyWith<$Res> implements $MessageStreamEventCopyWith<$Res> {
  factory $ContentBlockDeltaEventCopyWith(ContentBlockDeltaEvent value, $Res Function(ContentBlockDeltaEvent) _then) = _$ContentBlockDeltaEventCopyWithImpl;
@override @useResult
$Res call({
 BlockDelta delta, int index, MessageStreamEventType type
});


$BlockDeltaCopyWith<$Res> get delta;

}
/// @nodoc
class _$ContentBlockDeltaEventCopyWithImpl<$Res>
    implements $ContentBlockDeltaEventCopyWith<$Res> {
  _$ContentBlockDeltaEventCopyWithImpl(this._self, this._then);

  final ContentBlockDeltaEvent _self;
  final $Res Function(ContentBlockDeltaEvent) _then;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? delta = null,Object? index = null,Object? type = null,}) {
  return _then(ContentBlockDeltaEvent(
delta: null == delta ? _self.delta : delta // ignore: cast_nullable_to_non_nullable
as BlockDelta,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageStreamEventType,
  ));
}

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlockDeltaCopyWith<$Res> get delta {
  
  return $BlockDeltaCopyWith<$Res>(_self.delta, (value) {
    return _then(_self.copyWith(delta: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ContentBlockStopEvent extends MessageStreamEvent {
  const ContentBlockStopEvent({required this.index, required this.type}): super._();
  factory ContentBlockStopEvent.fromJson(Map<String, dynamic> json) => _$ContentBlockStopEventFromJson(json);

/// The index of the content block.
 final  int index;
/// The type of a streaming event.
@override final  MessageStreamEventType type;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentBlockStopEventCopyWith<ContentBlockStopEvent> get copyWith => _$ContentBlockStopEventCopyWithImpl<ContentBlockStopEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentBlockStopEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentBlockStopEvent&&(identical(other.index, index) || other.index == index)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,type);

@override
String toString() {
  return 'MessageStreamEvent.contentBlockStop(index: $index, type: $type)';
}


}

/// @nodoc
abstract mixin class $ContentBlockStopEventCopyWith<$Res> implements $MessageStreamEventCopyWith<$Res> {
  factory $ContentBlockStopEventCopyWith(ContentBlockStopEvent value, $Res Function(ContentBlockStopEvent) _then) = _$ContentBlockStopEventCopyWithImpl;
@override @useResult
$Res call({
 int index, MessageStreamEventType type
});




}
/// @nodoc
class _$ContentBlockStopEventCopyWithImpl<$Res>
    implements $ContentBlockStopEventCopyWith<$Res> {
  _$ContentBlockStopEventCopyWithImpl(this._self, this._then);

  final ContentBlockStopEvent _self;
  final $Res Function(ContentBlockStopEvent) _then;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? type = null,}) {
  return _then(ContentBlockStopEvent(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageStreamEventType,
  ));
}


}

/// @nodoc
@JsonSerializable()

class PingEvent extends MessageStreamEvent {
  const PingEvent({required this.type}): super._();
  factory PingEvent.fromJson(Map<String, dynamic> json) => _$PingEventFromJson(json);

/// The type of a streaming event.
@override final  MessageStreamEventType type;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PingEventCopyWith<PingEvent> get copyWith => _$PingEventCopyWithImpl<PingEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PingEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PingEvent&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'MessageStreamEvent.ping(type: $type)';
}


}

/// @nodoc
abstract mixin class $PingEventCopyWith<$Res> implements $MessageStreamEventCopyWith<$Res> {
  factory $PingEventCopyWith(PingEvent value, $Res Function(PingEvent) _then) = _$PingEventCopyWithImpl;
@override @useResult
$Res call({
 MessageStreamEventType type
});




}
/// @nodoc
class _$PingEventCopyWithImpl<$Res>
    implements $PingEventCopyWith<$Res> {
  _$PingEventCopyWithImpl(this._self, this._then);

  final PingEvent _self;
  final $Res Function(PingEvent) _then;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(PingEvent(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageStreamEventType,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ErrorEvent extends MessageStreamEvent {
  const ErrorEvent({required this.type, required this.error}): super._();
  factory ErrorEvent.fromJson(Map<String, dynamic> json) => _$ErrorEventFromJson(json);

/// The type of a streaming event.
@override final  MessageStreamEventType type;
/// An error object.
 final  Error error;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorEventCopyWith<ErrorEvent> get copyWith => _$ErrorEventCopyWithImpl<ErrorEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ErrorEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorEvent&&(identical(other.type, type) || other.type == type)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,error);

@override
String toString() {
  return 'MessageStreamEvent.error(type: $type, error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorEventCopyWith<$Res> implements $MessageStreamEventCopyWith<$Res> {
  factory $ErrorEventCopyWith(ErrorEvent value, $Res Function(ErrorEvent) _then) = _$ErrorEventCopyWithImpl;
@override @useResult
$Res call({
 MessageStreamEventType type, Error error
});


$ErrorCopyWith<$Res> get error;

}
/// @nodoc
class _$ErrorEventCopyWithImpl<$Res>
    implements $ErrorEventCopyWith<$Res> {
  _$ErrorEventCopyWithImpl(this._self, this._then);

  final ErrorEvent _self;
  final $Res Function(ErrorEvent) _then;

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? error = null,}) {
  return _then(ErrorEvent(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageStreamEventType,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Error,
  ));
}

/// Create a copy of MessageStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorCopyWith<$Res> get error {
  
  return $ErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

BlockDelta _$BlockDeltaFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'text_delta':
          return TextBlockDelta.fromJson(
            json
          );
                case 'input_json_delta':
          return InputJsonBlockDelta.fromJson(
            json
          );
                case 'thinking_delta':
          return ThinkingBlockDelta.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'BlockDelta',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$BlockDelta {

/// The type of content block.
 Object get type;

  /// Serializes this BlockDelta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockDelta&&const DeepCollectionEquality().equals(other.type, type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(type));

@override
String toString() {
  return 'BlockDelta(type: $type)';
}


}

/// @nodoc
class $BlockDeltaCopyWith<$Res>  {
$BlockDeltaCopyWith(BlockDelta _, $Res Function(BlockDelta) __);
}


/// Adds pattern-matching-related methods to [BlockDelta].
extension BlockDeltaPatterns on BlockDelta {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TextBlockDelta value)?  textDelta,TResult Function( InputJsonBlockDelta value)?  inputJsonDelta,TResult Function( ThinkingBlockDelta value)?  thinking,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TextBlockDelta() when textDelta != null:
return textDelta(_that);case InputJsonBlockDelta() when inputJsonDelta != null:
return inputJsonDelta(_that);case ThinkingBlockDelta() when thinking != null:
return thinking(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TextBlockDelta value)  textDelta,required TResult Function( InputJsonBlockDelta value)  inputJsonDelta,required TResult Function( ThinkingBlockDelta value)  thinking,}){
final _that = this;
switch (_that) {
case TextBlockDelta():
return textDelta(_that);case InputJsonBlockDelta():
return inputJsonDelta(_that);case ThinkingBlockDelta():
return thinking(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TextBlockDelta value)?  textDelta,TResult? Function( InputJsonBlockDelta value)?  inputJsonDelta,TResult? Function( ThinkingBlockDelta value)?  thinking,}){
final _that = this;
switch (_that) {
case TextBlockDelta() when textDelta != null:
return textDelta(_that);case InputJsonBlockDelta() when inputJsonDelta != null:
return inputJsonDelta(_that);case ThinkingBlockDelta() when thinking != null:
return thinking(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text,  String type)?  textDelta,TResult Function(@JsonKey(name: 'partial_json', includeIfNull: false)  String? partialJson,  String type)?  inputJsonDelta,TResult Function( String thinking,  ThinkingBlockDeltaType type)?  thinking,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TextBlockDelta() when textDelta != null:
return textDelta(_that.text,_that.type);case InputJsonBlockDelta() when inputJsonDelta != null:
return inputJsonDelta(_that.partialJson,_that.type);case ThinkingBlockDelta() when thinking != null:
return thinking(_that.thinking,_that.type);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text,  String type)  textDelta,required TResult Function(@JsonKey(name: 'partial_json', includeIfNull: false)  String? partialJson,  String type)  inputJsonDelta,required TResult Function( String thinking,  ThinkingBlockDeltaType type)  thinking,}) {final _that = this;
switch (_that) {
case TextBlockDelta():
return textDelta(_that.text,_that.type);case InputJsonBlockDelta():
return inputJsonDelta(_that.partialJson,_that.type);case ThinkingBlockDelta():
return thinking(_that.thinking,_that.type);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text,  String type)?  textDelta,TResult? Function(@JsonKey(name: 'partial_json', includeIfNull: false)  String? partialJson,  String type)?  inputJsonDelta,TResult? Function( String thinking,  ThinkingBlockDeltaType type)?  thinking,}) {final _that = this;
switch (_that) {
case TextBlockDelta() when textDelta != null:
return textDelta(_that.text,_that.type);case InputJsonBlockDelta() when inputJsonDelta != null:
return inputJsonDelta(_that.partialJson,_that.type);case ThinkingBlockDelta() when thinking != null:
return thinking(_that.thinking,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class TextBlockDelta extends BlockDelta {
  const TextBlockDelta({required this.text, required this.type}): super._();
  factory TextBlockDelta.fromJson(Map<String, dynamic> json) => _$TextBlockDeltaFromJson(json);

/// The text delta.
 final  String text;
/// The type of content block.
@override final  String type;

/// Create a copy of BlockDelta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextBlockDeltaCopyWith<TextBlockDelta> get copyWith => _$TextBlockDeltaCopyWithImpl<TextBlockDelta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextBlockDeltaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextBlockDelta&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,type);

@override
String toString() {
  return 'BlockDelta.textDelta(text: $text, type: $type)';
}


}

/// @nodoc
abstract mixin class $TextBlockDeltaCopyWith<$Res> implements $BlockDeltaCopyWith<$Res> {
  factory $TextBlockDeltaCopyWith(TextBlockDelta value, $Res Function(TextBlockDelta) _then) = _$TextBlockDeltaCopyWithImpl;
@useResult
$Res call({
 String text, String type
});




}
/// @nodoc
class _$TextBlockDeltaCopyWithImpl<$Res>
    implements $TextBlockDeltaCopyWith<$Res> {
  _$TextBlockDeltaCopyWithImpl(this._self, this._then);

  final TextBlockDelta _self;
  final $Res Function(TextBlockDelta) _then;

/// Create a copy of BlockDelta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,Object? type = null,}) {
  return _then(TextBlockDelta(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class InputJsonBlockDelta extends BlockDelta {
  const InputJsonBlockDelta({@JsonKey(name: 'partial_json', includeIfNull: false) this.partialJson, required this.type}): super._();
  factory InputJsonBlockDelta.fromJson(Map<String, dynamic> json) => _$InputJsonBlockDeltaFromJson(json);

/// The partial JSON delta.
@JsonKey(name: 'partial_json', includeIfNull: false) final  String? partialJson;
/// The type of content block.
@override final  String type;

/// Create a copy of BlockDelta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InputJsonBlockDeltaCopyWith<InputJsonBlockDelta> get copyWith => _$InputJsonBlockDeltaCopyWithImpl<InputJsonBlockDelta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InputJsonBlockDeltaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InputJsonBlockDelta&&(identical(other.partialJson, partialJson) || other.partialJson == partialJson)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partialJson,type);

@override
String toString() {
  return 'BlockDelta.inputJsonDelta(partialJson: $partialJson, type: $type)';
}


}

/// @nodoc
abstract mixin class $InputJsonBlockDeltaCopyWith<$Res> implements $BlockDeltaCopyWith<$Res> {
  factory $InputJsonBlockDeltaCopyWith(InputJsonBlockDelta value, $Res Function(InputJsonBlockDelta) _then) = _$InputJsonBlockDeltaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'partial_json', includeIfNull: false) String? partialJson, String type
});




}
/// @nodoc
class _$InputJsonBlockDeltaCopyWithImpl<$Res>
    implements $InputJsonBlockDeltaCopyWith<$Res> {
  _$InputJsonBlockDeltaCopyWithImpl(this._self, this._then);

  final InputJsonBlockDelta _self;
  final $Res Function(InputJsonBlockDelta) _then;

/// Create a copy of BlockDelta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? partialJson = freezed,Object? type = null,}) {
  return _then(InputJsonBlockDelta(
partialJson: freezed == partialJson ? _self.partialJson : partialJson // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ThinkingBlockDelta extends BlockDelta {
  const ThinkingBlockDelta({required this.thinking, required this.type}): super._();
  factory ThinkingBlockDelta.fromJson(Map<String, dynamic> json) => _$ThinkingBlockDeltaFromJson(json);

/// The thinking text delta.
 final  String thinking;
/// The type of content block delta.
@override final  ThinkingBlockDeltaType type;

/// Create a copy of BlockDelta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThinkingBlockDeltaCopyWith<ThinkingBlockDelta> get copyWith => _$ThinkingBlockDeltaCopyWithImpl<ThinkingBlockDelta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThinkingBlockDeltaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThinkingBlockDelta&&(identical(other.thinking, thinking) || other.thinking == thinking)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thinking,type);

@override
String toString() {
  return 'BlockDelta.thinking(thinking: $thinking, type: $type)';
}


}

/// @nodoc
abstract mixin class $ThinkingBlockDeltaCopyWith<$Res> implements $BlockDeltaCopyWith<$Res> {
  factory $ThinkingBlockDeltaCopyWith(ThinkingBlockDelta value, $Res Function(ThinkingBlockDelta) _then) = _$ThinkingBlockDeltaCopyWithImpl;
@useResult
$Res call({
 String thinking, ThinkingBlockDeltaType type
});




}
/// @nodoc
class _$ThinkingBlockDeltaCopyWithImpl<$Res>
    implements $ThinkingBlockDeltaCopyWith<$Res> {
  _$ThinkingBlockDeltaCopyWithImpl(this._self, this._then);

  final ThinkingBlockDelta _self;
  final $Res Function(ThinkingBlockDelta) _then;

/// Create a copy of BlockDelta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? thinking = null,Object? type = null,}) {
  return _then(ThinkingBlockDelta(
thinking: null == thinking ? _self.thinking : thinking // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ThinkingBlockDeltaType,
  ));
}


}

// dart format on
