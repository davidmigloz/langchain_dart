// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToolDefinition {
  /// The type of the tool, i.e. `function`.
  ToolType get type;

  /// The name of the function.
  String get name;

  /// The description of the function, including guidance on when and how
  /// to call it, and guidance about what to tell the user when calling
  /// (if anything).
  @JsonKey(includeIfNull: false)
  String? get description;

  /// Parameters of the function in JSON Schema.
  @JsonKey(includeIfNull: false)
  dynamic get parameters;

  /// Create a copy of ToolDefinition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToolDefinitionCopyWith<ToolDefinition> get copyWith =>
      _$ToolDefinitionCopyWithImpl<ToolDefinition>(
          this as ToolDefinition, _$identity);

  /// Serializes this ToolDefinition to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToolDefinition &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.parameters, parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, name, description,
      const DeepCollectionEquality().hash(parameters));

  @override
  String toString() {
    return 'ToolDefinition(type: $type, name: $name, description: $description, parameters: $parameters)';
  }
}

/// @nodoc
abstract mixin class $ToolDefinitionCopyWith<$Res> {
  factory $ToolDefinitionCopyWith(
          ToolDefinition value, $Res Function(ToolDefinition) _then) =
      _$ToolDefinitionCopyWithImpl;
  @useResult
  $Res call(
      {ToolType type,
      String name,
      @JsonKey(includeIfNull: false) String? description,
      @JsonKey(includeIfNull: false) dynamic parameters});
}

/// @nodoc
class _$ToolDefinitionCopyWithImpl<$Res>
    implements $ToolDefinitionCopyWith<$Res> {
  _$ToolDefinitionCopyWithImpl(this._self, this._then);

  final ToolDefinition _self;
  final $Res Function(ToolDefinition) _then;

  /// Create a copy of ToolDefinition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? description = freezed,
    Object? parameters = freezed,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ToolType,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      parameters: freezed == parameters
          ? _self.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ToolDefinition extends ToolDefinition {
  const _ToolDefinition(
      {this.type = ToolType.function,
      required this.name,
      @JsonKey(includeIfNull: false) this.description,
      @JsonKey(includeIfNull: false) this.parameters})
      : super._();
  factory _ToolDefinition.fromJson(Map<String, dynamic> json) =>
      _$ToolDefinitionFromJson(json);

  /// The type of the tool, i.e. `function`.
  @override
  @JsonKey()
  final ToolType type;

  /// The name of the function.
  @override
  final String name;

  /// The description of the function, including guidance on when and how
  /// to call it, and guidance about what to tell the user when calling
  /// (if anything).
  @override
  @JsonKey(includeIfNull: false)
  final String? description;

  /// Parameters of the function in JSON Schema.
  @override
  @JsonKey(includeIfNull: false)
  final dynamic parameters;

  /// Create a copy of ToolDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ToolDefinitionCopyWith<_ToolDefinition> get copyWith =>
      __$ToolDefinitionCopyWithImpl<_ToolDefinition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ToolDefinitionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ToolDefinition &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.parameters, parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, name, description,
      const DeepCollectionEquality().hash(parameters));

  @override
  String toString() {
    return 'ToolDefinition(type: $type, name: $name, description: $description, parameters: $parameters)';
  }
}

/// @nodoc
abstract mixin class _$ToolDefinitionCopyWith<$Res>
    implements $ToolDefinitionCopyWith<$Res> {
  factory _$ToolDefinitionCopyWith(
          _ToolDefinition value, $Res Function(_ToolDefinition) _then) =
      __$ToolDefinitionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ToolType type,
      String name,
      @JsonKey(includeIfNull: false) String? description,
      @JsonKey(includeIfNull: false) dynamic parameters});
}

/// @nodoc
class __$ToolDefinitionCopyWithImpl<$Res>
    implements _$ToolDefinitionCopyWith<$Res> {
  __$ToolDefinitionCopyWithImpl(this._self, this._then);

  final _ToolDefinition _self;
  final $Res Function(_ToolDefinition) _then;

  /// Create a copy of ToolDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? description = freezed,
    Object? parameters = freezed,
  }) {
    return _then(_ToolDefinition(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ToolType,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      parameters: freezed == parameters
          ? _self.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
mixin _$ToolChoiceForced {
  /// The type of the tool. Currently, only `function` is supported.
  ToolType get type;

  /// The name of the function to call.
  String get name;

  /// Create a copy of ToolChoiceForced
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToolChoiceForcedCopyWith<ToolChoiceForced> get copyWith =>
      _$ToolChoiceForcedCopyWithImpl<ToolChoiceForced>(
          this as ToolChoiceForced, _$identity);

  /// Serializes this ToolChoiceForced to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToolChoiceForced &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, name);

  @override
  String toString() {
    return 'ToolChoiceForced(type: $type, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ToolChoiceForcedCopyWith<$Res> {
  factory $ToolChoiceForcedCopyWith(
          ToolChoiceForced value, $Res Function(ToolChoiceForced) _then) =
      _$ToolChoiceForcedCopyWithImpl;
  @useResult
  $Res call({ToolType type, String name});
}

/// @nodoc
class _$ToolChoiceForcedCopyWithImpl<$Res>
    implements $ToolChoiceForcedCopyWith<$Res> {
  _$ToolChoiceForcedCopyWithImpl(this._self, this._then);

  final ToolChoiceForced _self;
  final $Res Function(ToolChoiceForced) _then;

  /// Create a copy of ToolChoiceForced
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ToolType,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ToolChoiceForced extends ToolChoiceForced {
  const _ToolChoiceForced({this.type = ToolType.function, required this.name})
      : super._();
  factory _ToolChoiceForced.fromJson(Map<String, dynamic> json) =>
      _$ToolChoiceForcedFromJson(json);

  /// The type of the tool. Currently, only `function` is supported.
  @override
  @JsonKey()
  final ToolType type;

  /// The name of the function to call.
  @override
  final String name;

  /// Create a copy of ToolChoiceForced
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ToolChoiceForcedCopyWith<_ToolChoiceForced> get copyWith =>
      __$ToolChoiceForcedCopyWithImpl<_ToolChoiceForced>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ToolChoiceForcedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ToolChoiceForced &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, name);

  @override
  String toString() {
    return 'ToolChoiceForced(type: $type, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ToolChoiceForcedCopyWith<$Res>
    implements $ToolChoiceForcedCopyWith<$Res> {
  factory _$ToolChoiceForcedCopyWith(
          _ToolChoiceForced value, $Res Function(_ToolChoiceForced) _then) =
      __$ToolChoiceForcedCopyWithImpl;
  @override
  @useResult
  $Res call({ToolType type, String name});
}

/// @nodoc
class __$ToolChoiceForcedCopyWithImpl<$Res>
    implements _$ToolChoiceForcedCopyWith<$Res> {
  __$ToolChoiceForcedCopyWithImpl(this._self, this._then);

  final _ToolChoiceForced _self;
  final $Res Function(_ToolChoiceForced) _then;

  /// Create a copy of ToolChoiceForced
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? name = null,
  }) {
    return _then(_ToolChoiceForced(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ToolType,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ContentPartItemReference {
  /// The content type.
  ContentType get type;

  /// ID of a previous conversation item to reference (for `item_reference`
  /// content types in `response.create` events). These can reference both
  /// client and server created items.
  @JsonKey(includeIfNull: false)
  String? get id;

  /// Create a copy of ContentPartItemReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentPartItemReferenceCopyWith<ContentPartItemReference> get copyWith =>
      _$ContentPartItemReferenceCopyWithImpl<ContentPartItemReference>(
          this as ContentPartItemReference, _$identity);

  /// Serializes this ContentPartItemReference to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentPartItemReference &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, id);

  @override
  String toString() {
    return 'ContentPartItemReference(type: $type, id: $id)';
  }
}

/// @nodoc
abstract mixin class $ContentPartItemReferenceCopyWith<$Res> {
  factory $ContentPartItemReferenceCopyWith(ContentPartItemReference value,
          $Res Function(ContentPartItemReference) _then) =
      _$ContentPartItemReferenceCopyWithImpl;
  @useResult
  $Res call({ContentType type, @JsonKey(includeIfNull: false) String? id});
}

/// @nodoc
class _$ContentPartItemReferenceCopyWithImpl<$Res>
    implements $ContentPartItemReferenceCopyWith<$Res> {
  _$ContentPartItemReferenceCopyWithImpl(this._self, this._then);

  final ContentPartItemReference _self;
  final $Res Function(ContentPartItemReference) _then;

  /// Create a copy of ContentPartItemReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = freezed,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentType,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ContentPartItemReference extends ContentPartItemReference {
  const _ContentPartItemReference(
      {this.type = ContentType.itemReference,
      @JsonKey(includeIfNull: false) this.id})
      : super._();
  factory _ContentPartItemReference.fromJson(Map<String, dynamic> json) =>
      _$ContentPartItemReferenceFromJson(json);

  /// The content type.
  @override
  @JsonKey()
  final ContentType type;

  /// ID of a previous conversation item to reference (for `item_reference`
  /// content types in `response.create` events). These can reference both
  /// client and server created items.
  @override
  @JsonKey(includeIfNull: false)
  final String? id;

  /// Create a copy of ContentPartItemReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContentPartItemReferenceCopyWith<_ContentPartItemReference> get copyWith =>
      __$ContentPartItemReferenceCopyWithImpl<_ContentPartItemReference>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContentPartItemReferenceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentPartItemReference &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, id);

  @override
  String toString() {
    return 'ContentPartItemReference(type: $type, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$ContentPartItemReferenceCopyWith<$Res>
    implements $ContentPartItemReferenceCopyWith<$Res> {
  factory _$ContentPartItemReferenceCopyWith(_ContentPartItemReference value,
          $Res Function(_ContentPartItemReference) _then) =
      __$ContentPartItemReferenceCopyWithImpl;
  @override
  @useResult
  $Res call({ContentType type, @JsonKey(includeIfNull: false) String? id});
}

/// @nodoc
class __$ContentPartItemReferenceCopyWithImpl<$Res>
    implements _$ContentPartItemReferenceCopyWith<$Res> {
  __$ContentPartItemReferenceCopyWithImpl(this._self, this._then);

  final _ContentPartItemReference _self;
  final $Res Function(_ContentPartItemReference) _then;

  /// Create a copy of ContentPartItemReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? id = freezed,
  }) {
    return _then(_ContentPartItemReference(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentType,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$InputAudioTranscriptionConfig {
  /// The model to use for transcription, current options are `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, and `whisper-1`.
  @JsonKey(includeIfNull: false)
  String? get model;

  /// The language of the input audio. Supplying the input language in
  /// [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
  /// will improve accuracy and latency.
  @JsonKey(includeIfNull: false)
  String? get language;

  /// An optional text to guide the model's style or continue a previous audio
  /// segment.
  /// For `whisper-1`, the [prompt is a list of keywords](https://platform.openai.com/docs/guides/speech-to-text#prompting).
  /// For `gpt-4o-transcribe` models, the prompt is a free text string, for example "expect words related to technology".
  @JsonKey(includeIfNull: false)
  String? get prompt;

  /// Create a copy of InputAudioTranscriptionConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InputAudioTranscriptionConfigCopyWith<InputAudioTranscriptionConfig>
      get copyWith => _$InputAudioTranscriptionConfigCopyWithImpl<
              InputAudioTranscriptionConfig>(
          this as InputAudioTranscriptionConfig, _$identity);

  /// Serializes this InputAudioTranscriptionConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InputAudioTranscriptionConfig &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.prompt, prompt) || other.prompt == prompt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, model, language, prompt);

  @override
  String toString() {
    return 'InputAudioTranscriptionConfig(model: $model, language: $language, prompt: $prompt)';
  }
}

/// @nodoc
abstract mixin class $InputAudioTranscriptionConfigCopyWith<$Res> {
  factory $InputAudioTranscriptionConfigCopyWith(
          InputAudioTranscriptionConfig value,
          $Res Function(InputAudioTranscriptionConfig) _then) =
      _$InputAudioTranscriptionConfigCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? model,
      @JsonKey(includeIfNull: false) String? language,
      @JsonKey(includeIfNull: false) String? prompt});
}

/// @nodoc
class _$InputAudioTranscriptionConfigCopyWithImpl<$Res>
    implements $InputAudioTranscriptionConfigCopyWith<$Res> {
  _$InputAudioTranscriptionConfigCopyWithImpl(this._self, this._then);

  final InputAudioTranscriptionConfig _self;
  final $Res Function(InputAudioTranscriptionConfig) _then;

  /// Create a copy of InputAudioTranscriptionConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? language = freezed,
    Object? prompt = freezed,
  }) {
    return _then(_self.copyWith(
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      prompt: freezed == prompt
          ? _self.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _InputAudioTranscriptionConfig extends InputAudioTranscriptionConfig {
  const _InputAudioTranscriptionConfig(
      {@JsonKey(includeIfNull: false) this.model,
      @JsonKey(includeIfNull: false) this.language,
      @JsonKey(includeIfNull: false) this.prompt})
      : super._();
  factory _InputAudioTranscriptionConfig.fromJson(Map<String, dynamic> json) =>
      _$InputAudioTranscriptionConfigFromJson(json);

  /// The model to use for transcription, current options are `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, and `whisper-1`.
  @override
  @JsonKey(includeIfNull: false)
  final String? model;

  /// The language of the input audio. Supplying the input language in
  /// [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
  /// will improve accuracy and latency.
  @override
  @JsonKey(includeIfNull: false)
  final String? language;

  /// An optional text to guide the model's style or continue a previous audio
  /// segment.
  /// For `whisper-1`, the [prompt is a list of keywords](https://platform.openai.com/docs/guides/speech-to-text#prompting).
  /// For `gpt-4o-transcribe` models, the prompt is a free text string, for example "expect words related to technology".
  @override
  @JsonKey(includeIfNull: false)
  final String? prompt;

  /// Create a copy of InputAudioTranscriptionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InputAudioTranscriptionConfigCopyWith<_InputAudioTranscriptionConfig>
      get copyWith => __$InputAudioTranscriptionConfigCopyWithImpl<
          _InputAudioTranscriptionConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InputAudioTranscriptionConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InputAudioTranscriptionConfig &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.prompt, prompt) || other.prompt == prompt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, model, language, prompt);

  @override
  String toString() {
    return 'InputAudioTranscriptionConfig(model: $model, language: $language, prompt: $prompt)';
  }
}

/// @nodoc
abstract mixin class _$InputAudioTranscriptionConfigCopyWith<$Res>
    implements $InputAudioTranscriptionConfigCopyWith<$Res> {
  factory _$InputAudioTranscriptionConfigCopyWith(
          _InputAudioTranscriptionConfig value,
          $Res Function(_InputAudioTranscriptionConfig) _then) =
      __$InputAudioTranscriptionConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? model,
      @JsonKey(includeIfNull: false) String? language,
      @JsonKey(includeIfNull: false) String? prompt});
}

/// @nodoc
class __$InputAudioTranscriptionConfigCopyWithImpl<$Res>
    implements _$InputAudioTranscriptionConfigCopyWith<$Res> {
  __$InputAudioTranscriptionConfigCopyWithImpl(this._self, this._then);

  final _InputAudioTranscriptionConfig _self;
  final $Res Function(_InputAudioTranscriptionConfig) _then;

  /// Create a copy of InputAudioTranscriptionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? model = freezed,
    Object? language = freezed,
    Object? prompt = freezed,
  }) {
    return _then(_InputAudioTranscriptionConfig(
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      prompt: freezed == prompt
          ? _self.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$TurnDetection {
  /// Type of turn detection, only `server_vad` is currently supported.
  TurnDetectionType get type;

  /// Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
  /// higher threshold will require louder audio to activate the model, and
  /// thus might perform better in noisy environments.
  @JsonKey(includeIfNull: false)
  double? get threshold;

  /// Amount of audio to include before the VAD detected speech (in
  /// milliseconds). Defaults to 300ms.
  @JsonKey(name: 'prefix_padding_ms', includeIfNull: false)
  int? get prefixPaddingMs;

  /// Duration of silence to detect speech stop (in milliseconds). Defaults
  /// to 500ms. With shorter values the model will respond more quickly,
  /// but may jump in on short pauses from the user.
  @JsonKey(name: 'silence_duration_ms', includeIfNull: false)
  int? get silenceDurationMs;

  /// Whether or not to automatically generate a response when VAD is
  /// enabled. `true` by default.
  @JsonKey(name: 'create_response')
  bool get createResponse;

  /// Create a copy of TurnDetection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TurnDetectionCopyWith<TurnDetection> get copyWith =>
      _$TurnDetectionCopyWithImpl<TurnDetection>(
          this as TurnDetection, _$identity);

  /// Serializes this TurnDetection to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TurnDetection &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            (identical(other.prefixPaddingMs, prefixPaddingMs) ||
                other.prefixPaddingMs == prefixPaddingMs) &&
            (identical(other.silenceDurationMs, silenceDurationMs) ||
                other.silenceDurationMs == silenceDurationMs) &&
            (identical(other.createResponse, createResponse) ||
                other.createResponse == createResponse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, threshold, prefixPaddingMs,
      silenceDurationMs, createResponse);

  @override
  String toString() {
    return 'TurnDetection(type: $type, threshold: $threshold, prefixPaddingMs: $prefixPaddingMs, silenceDurationMs: $silenceDurationMs, createResponse: $createResponse)';
  }
}

/// @nodoc
abstract mixin class $TurnDetectionCopyWith<$Res> {
  factory $TurnDetectionCopyWith(
          TurnDetection value, $Res Function(TurnDetection) _then) =
      _$TurnDetectionCopyWithImpl;
  @useResult
  $Res call(
      {TurnDetectionType type,
      @JsonKey(includeIfNull: false) double? threshold,
      @JsonKey(name: 'prefix_padding_ms', includeIfNull: false)
      int? prefixPaddingMs,
      @JsonKey(name: 'silence_duration_ms', includeIfNull: false)
      int? silenceDurationMs,
      @JsonKey(name: 'create_response') bool createResponse});
}

/// @nodoc
class _$TurnDetectionCopyWithImpl<$Res>
    implements $TurnDetectionCopyWith<$Res> {
  _$TurnDetectionCopyWithImpl(this._self, this._then);

  final TurnDetection _self;
  final $Res Function(TurnDetection) _then;

  /// Create a copy of TurnDetection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? threshold = freezed,
    Object? prefixPaddingMs = freezed,
    Object? silenceDurationMs = freezed,
    Object? createResponse = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as TurnDetectionType,
      threshold: freezed == threshold
          ? _self.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as double?,
      prefixPaddingMs: freezed == prefixPaddingMs
          ? _self.prefixPaddingMs
          : prefixPaddingMs // ignore: cast_nullable_to_non_nullable
              as int?,
      silenceDurationMs: freezed == silenceDurationMs
          ? _self.silenceDurationMs
          : silenceDurationMs // ignore: cast_nullable_to_non_nullable
              as int?,
      createResponse: null == createResponse
          ? _self.createResponse
          : createResponse // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TurnDetection extends TurnDetection {
  const _TurnDetection(
      {required this.type,
      @JsonKey(includeIfNull: false) this.threshold,
      @JsonKey(name: 'prefix_padding_ms', includeIfNull: false)
      this.prefixPaddingMs,
      @JsonKey(name: 'silence_duration_ms', includeIfNull: false)
      this.silenceDurationMs,
      @JsonKey(name: 'create_response') this.createResponse = true})
      : super._();
  factory _TurnDetection.fromJson(Map<String, dynamic> json) =>
      _$TurnDetectionFromJson(json);

  /// Type of turn detection, only `server_vad` is currently supported.
  @override
  final TurnDetectionType type;

  /// Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
  /// higher threshold will require louder audio to activate the model, and
  /// thus might perform better in noisy environments.
  @override
  @JsonKey(includeIfNull: false)
  final double? threshold;

  /// Amount of audio to include before the VAD detected speech (in
  /// milliseconds). Defaults to 300ms.
  @override
  @JsonKey(name: 'prefix_padding_ms', includeIfNull: false)
  final int? prefixPaddingMs;

  /// Duration of silence to detect speech stop (in milliseconds). Defaults
  /// to 500ms. With shorter values the model will respond more quickly,
  /// but may jump in on short pauses from the user.
  @override
  @JsonKey(name: 'silence_duration_ms', includeIfNull: false)
  final int? silenceDurationMs;

  /// Whether or not to automatically generate a response when VAD is
  /// enabled. `true` by default.
  @override
  @JsonKey(name: 'create_response')
  final bool createResponse;

  /// Create a copy of TurnDetection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TurnDetectionCopyWith<_TurnDetection> get copyWith =>
      __$TurnDetectionCopyWithImpl<_TurnDetection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TurnDetectionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TurnDetection &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            (identical(other.prefixPaddingMs, prefixPaddingMs) ||
                other.prefixPaddingMs == prefixPaddingMs) &&
            (identical(other.silenceDurationMs, silenceDurationMs) ||
                other.silenceDurationMs == silenceDurationMs) &&
            (identical(other.createResponse, createResponse) ||
                other.createResponse == createResponse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, threshold, prefixPaddingMs,
      silenceDurationMs, createResponse);

  @override
  String toString() {
    return 'TurnDetection(type: $type, threshold: $threshold, prefixPaddingMs: $prefixPaddingMs, silenceDurationMs: $silenceDurationMs, createResponse: $createResponse)';
  }
}

/// @nodoc
abstract mixin class _$TurnDetectionCopyWith<$Res>
    implements $TurnDetectionCopyWith<$Res> {
  factory _$TurnDetectionCopyWith(
          _TurnDetection value, $Res Function(_TurnDetection) _then) =
      __$TurnDetectionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {TurnDetectionType type,
      @JsonKey(includeIfNull: false) double? threshold,
      @JsonKey(name: 'prefix_padding_ms', includeIfNull: false)
      int? prefixPaddingMs,
      @JsonKey(name: 'silence_duration_ms', includeIfNull: false)
      int? silenceDurationMs,
      @JsonKey(name: 'create_response') bool createResponse});
}

/// @nodoc
class __$TurnDetectionCopyWithImpl<$Res>
    implements _$TurnDetectionCopyWith<$Res> {
  __$TurnDetectionCopyWithImpl(this._self, this._then);

  final _TurnDetection _self;
  final $Res Function(_TurnDetection) _then;

  /// Create a copy of TurnDetection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? threshold = freezed,
    Object? prefixPaddingMs = freezed,
    Object? silenceDurationMs = freezed,
    Object? createResponse = null,
  }) {
    return _then(_TurnDetection(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as TurnDetectionType,
      threshold: freezed == threshold
          ? _self.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as double?,
      prefixPaddingMs: freezed == prefixPaddingMs
          ? _self.prefixPaddingMs
          : prefixPaddingMs // ignore: cast_nullable_to_non_nullable
              as int?,
      silenceDurationMs: freezed == silenceDurationMs
          ? _self.silenceDurationMs
          : silenceDurationMs // ignore: cast_nullable_to_non_nullable
              as int?,
      createResponse: null == createResponse
          ? _self.createResponse
          : createResponse // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$RateLimit {
  /// The name of the rate limit (`requests`, `tokens`).
  RateLimitName get name;

  /// The maximum allowed value for the rate limit.
  int get limit;

  /// The remaining value before the limit is reached.
  int get remaining;

  /// Seconds until the rate limit resets.
  @JsonKey(name: 'reset_seconds')
  double get resetSeconds;

  /// Create a copy of RateLimit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RateLimitCopyWith<RateLimit> get copyWith =>
      _$RateLimitCopyWithImpl<RateLimit>(this as RateLimit, _$identity);

  /// Serializes this RateLimit to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RateLimit &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.resetSeconds, resetSeconds) ||
                other.resetSeconds == resetSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, limit, remaining, resetSeconds);

  @override
  String toString() {
    return 'RateLimit(name: $name, limit: $limit, remaining: $remaining, resetSeconds: $resetSeconds)';
  }
}

/// @nodoc
abstract mixin class $RateLimitCopyWith<$Res> {
  factory $RateLimitCopyWith(RateLimit value, $Res Function(RateLimit) _then) =
      _$RateLimitCopyWithImpl;
  @useResult
  $Res call(
      {RateLimitName name,
      int limit,
      int remaining,
      @JsonKey(name: 'reset_seconds') double resetSeconds});
}

/// @nodoc
class _$RateLimitCopyWithImpl<$Res> implements $RateLimitCopyWith<$Res> {
  _$RateLimitCopyWithImpl(this._self, this._then);

  final RateLimit _self;
  final $Res Function(RateLimit) _then;

  /// Create a copy of RateLimit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? limit = null,
    Object? remaining = null,
    Object? resetSeconds = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as RateLimitName,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      remaining: null == remaining
          ? _self.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
      resetSeconds: null == resetSeconds
          ? _self.resetSeconds
          : resetSeconds // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _RateLimit extends RateLimit {
  const _RateLimit(
      {required this.name,
      required this.limit,
      required this.remaining,
      @JsonKey(name: 'reset_seconds') required this.resetSeconds})
      : super._();
  factory _RateLimit.fromJson(Map<String, dynamic> json) =>
      _$RateLimitFromJson(json);

  /// The name of the rate limit (`requests`, `tokens`).
  @override
  final RateLimitName name;

  /// The maximum allowed value for the rate limit.
  @override
  final int limit;

  /// The remaining value before the limit is reached.
  @override
  final int remaining;

  /// Seconds until the rate limit resets.
  @override
  @JsonKey(name: 'reset_seconds')
  final double resetSeconds;

  /// Create a copy of RateLimit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RateLimitCopyWith<_RateLimit> get copyWith =>
      __$RateLimitCopyWithImpl<_RateLimit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RateLimitToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RateLimit &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.resetSeconds, resetSeconds) ||
                other.resetSeconds == resetSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, limit, remaining, resetSeconds);

  @override
  String toString() {
    return 'RateLimit(name: $name, limit: $limit, remaining: $remaining, resetSeconds: $resetSeconds)';
  }
}

/// @nodoc
abstract mixin class _$RateLimitCopyWith<$Res>
    implements $RateLimitCopyWith<$Res> {
  factory _$RateLimitCopyWith(
          _RateLimit value, $Res Function(_RateLimit) _then) =
      __$RateLimitCopyWithImpl;
  @override
  @useResult
  $Res call(
      {RateLimitName name,
      int limit,
      int remaining,
      @JsonKey(name: 'reset_seconds') double resetSeconds});
}

/// @nodoc
class __$RateLimitCopyWithImpl<$Res> implements _$RateLimitCopyWith<$Res> {
  __$RateLimitCopyWithImpl(this._self, this._then);

  final _RateLimit _self;
  final $Res Function(_RateLimit) _then;

  /// Create a copy of RateLimit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? limit = null,
    Object? remaining = null,
    Object? resetSeconds = null,
  }) {
    return _then(_RateLimit(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as RateLimitName,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      remaining: null == remaining
          ? _self.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
      resetSeconds: null == resetSeconds
          ? _self.resetSeconds
          : resetSeconds // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$Response {
  /// The unique ID of the response.
  String get id;

  /// The object type, must be "realtime.response".
  ObjectType get object;

  /// The status of the response.
  ResponseStatus get status;

  /// Additional details about the status.
  /// Any of: [ResponseStatusDetailsCompleted], [ResponseStatusDetailsCancelled], [ResponseStatusDetailsIncomplete], [ResponseStatusDetailsFailed]
  @JsonKey(name: 'status_details', includeIfNull: false)
  ResponseStatusDetails? get statusDetails;

  /// The list of output items generated by the response.
  List<Item> get output;

  /// Developer-provided string key-value pairs associated with this response.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata;

  /// Usage statistics for the Response, this will correspond to billing. A Realtime API session will
  /// maintain a conversation context and append new Items to the Conversation, thus output from
  /// previous turns (text and audio tokens) will become the input for later turns.
  @JsonKey(includeIfNull: false)
  Usage? get usage;

  /// Create a copy of Response
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseCopyWith<Response> get copyWith =>
      _$ResponseCopyWithImpl<Response>(this as Response, _$identity);

  /// Serializes this Response to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Response &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusDetails, statusDetails) ||
                other.statusDetails == statusDetails) &&
            const DeepCollectionEquality().equals(other.output, output) &&
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      object,
      status,
      statusDetails,
      const DeepCollectionEquality().hash(output),
      const DeepCollectionEquality().hash(metadata),
      usage);

  @override
  String toString() {
    return 'Response(id: $id, object: $object, status: $status, statusDetails: $statusDetails, output: $output, metadata: $metadata, usage: $usage)';
  }
}

/// @nodoc
abstract mixin class $ResponseCopyWith<$Res> {
  factory $ResponseCopyWith(Response value, $Res Function(Response) _then) =
      _$ResponseCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      ObjectType object,
      ResponseStatus status,
      @JsonKey(name: 'status_details', includeIfNull: false)
      ResponseStatusDetails? statusDetails,
      List<Item> output,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
      @JsonKey(includeIfNull: false) Usage? usage});

  $ResponseStatusDetailsCopyWith<$Res>? get statusDetails;
  $UsageCopyWith<$Res>? get usage;
}

/// @nodoc
class _$ResponseCopyWithImpl<$Res> implements $ResponseCopyWith<$Res> {
  _$ResponseCopyWithImpl(this._self, this._then);

  final Response _self;
  final $Res Function(Response) _then;

  /// Create a copy of Response
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? status = null,
    Object? statusDetails = freezed,
    Object? output = null,
    Object? metadata = freezed,
    Object? usage = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _self.object
          : object // ignore: cast_nullable_to_non_nullable
              as ObjectType,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ResponseStatus,
      statusDetails: freezed == statusDetails
          ? _self.statusDetails
          : statusDetails // ignore: cast_nullable_to_non_nullable
              as ResponseStatusDetails?,
      output: null == output
          ? _self.output
          : output // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      usage: freezed == usage
          ? _self.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage?,
    ));
  }

  /// Create a copy of Response
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseStatusDetailsCopyWith<$Res>? get statusDetails {
    if (_self.statusDetails == null) {
      return null;
    }

    return $ResponseStatusDetailsCopyWith<$Res>(_self.statusDetails!, (value) {
      return _then(_self.copyWith(statusDetails: value));
    });
  }

  /// Create a copy of Response
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

/// @nodoc
@JsonSerializable()
class _Response extends Response {
  const _Response(
      {required this.id,
      this.object = ObjectType.realtimeResponse,
      required this.status,
      @JsonKey(name: 'status_details', includeIfNull: false) this.statusDetails,
      required final List<Item> output,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? metadata,
      @JsonKey(includeIfNull: false) this.usage})
      : _output = output,
        _metadata = metadata,
        super._();
  factory _Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  /// The unique ID of the response.
  @override
  final String id;

  /// The object type, must be "realtime.response".
  @override
  @JsonKey()
  final ObjectType object;

  /// The status of the response.
  @override
  final ResponseStatus status;

  /// Additional details about the status.
  /// Any of: [ResponseStatusDetailsCompleted], [ResponseStatusDetailsCancelled], [ResponseStatusDetailsIncomplete], [ResponseStatusDetailsFailed]
  @override
  @JsonKey(name: 'status_details', includeIfNull: false)
  final ResponseStatusDetails? statusDetails;

  /// The list of output items generated by the response.
  final List<Item> _output;

  /// The list of output items generated by the response.
  @override
  List<Item> get output {
    if (_output is EqualUnmodifiableListView) return _output;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_output);
  }

  /// Developer-provided string key-value pairs associated with this response.
  final Map<String, dynamic>? _metadata;

  /// Developer-provided string key-value pairs associated with this response.
  @override
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Usage statistics for the Response, this will correspond to billing. A Realtime API session will
  /// maintain a conversation context and append new Items to the Conversation, thus output from
  /// previous turns (text and audio tokens) will become the input for later turns.
  @override
  @JsonKey(includeIfNull: false)
  final Usage? usage;

  /// Create a copy of Response
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResponseCopyWith<_Response> get copyWith =>
      __$ResponseCopyWithImpl<_Response>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Response &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusDetails, statusDetails) ||
                other.statusDetails == statusDetails) &&
            const DeepCollectionEquality().equals(other._output, _output) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      object,
      status,
      statusDetails,
      const DeepCollectionEquality().hash(_output),
      const DeepCollectionEquality().hash(_metadata),
      usage);

  @override
  String toString() {
    return 'Response(id: $id, object: $object, status: $status, statusDetails: $statusDetails, output: $output, metadata: $metadata, usage: $usage)';
  }
}

/// @nodoc
abstract mixin class _$ResponseCopyWith<$Res>
    implements $ResponseCopyWith<$Res> {
  factory _$ResponseCopyWith(_Response value, $Res Function(_Response) _then) =
      __$ResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      ObjectType object,
      ResponseStatus status,
      @JsonKey(name: 'status_details', includeIfNull: false)
      ResponseStatusDetails? statusDetails,
      List<Item> output,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
      @JsonKey(includeIfNull: false) Usage? usage});

  @override
  $ResponseStatusDetailsCopyWith<$Res>? get statusDetails;
  @override
  $UsageCopyWith<$Res>? get usage;
}

/// @nodoc
class __$ResponseCopyWithImpl<$Res> implements _$ResponseCopyWith<$Res> {
  __$ResponseCopyWithImpl(this._self, this._then);

  final _Response _self;
  final $Res Function(_Response) _then;

  /// Create a copy of Response
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? status = null,
    Object? statusDetails = freezed,
    Object? output = null,
    Object? metadata = freezed,
    Object? usage = freezed,
  }) {
    return _then(_Response(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _self.object
          : object // ignore: cast_nullable_to_non_nullable
              as ObjectType,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ResponseStatus,
      statusDetails: freezed == statusDetails
          ? _self.statusDetails
          : statusDetails // ignore: cast_nullable_to_non_nullable
              as ResponseStatusDetails?,
      output: null == output
          ? _self._output
          : output // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      usage: freezed == usage
          ? _self.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage?,
    ));
  }

  /// Create a copy of Response
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseStatusDetailsCopyWith<$Res>? get statusDetails {
    if (_self.statusDetails == null) {
      return null;
    }

    return $ResponseStatusDetailsCopyWith<$Res>(_self.statusDetails!, (value) {
      return _then(_self.copyWith(statusDetails: value));
    });
  }

  /// Create a copy of Response
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

/// @nodoc
mixin _$ResponseConfig {
  /// The modalities for the response.
  @JsonKey(includeIfNull: false)
  List<Modality>? get modalities;

  /// Instructions for the model.
  @JsonKey(includeIfNull: false)
  String? get instructions;

  /// The voice the model uses to respond - one of `alloy`, `echo`, or `shimmer`.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  Voice? get voice;

  /// The format of output audio.
  @JsonKey(
      name: 'output_audio_format',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  AudioFormat? get outputAudioFormat;

  /// Tools (functions) available to the model.
  @JsonKey(includeIfNull: false)
  List<ToolDefinition>? get tools;

  /// How the model chooses tools.
  @_ResponseConfigToolChoiceConverter()
  @JsonKey(name: 'tool_choice', includeIfNull: false)
  ResponseConfigToolChoice? get toolChoice;

  /// Sampling temperature.
  @JsonKey(includeIfNull: false)
  double? get temperature;

  /// Maximum number of output tokens for a single assistant response, inclusive of tool calls. Defaults to "inf".
  @_ResponseConfigMaxResponseOutputTokensConverter()
  @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
  ResponseConfigMaxResponseOutputTokens? get maxResponseOutputTokens;

  /// Controls which conversation the response is added to. Currently supports
  /// `auto` and `none`, with `auto` as the default value. The `auto` value
  /// means that the contents of the response will be added to the default
  /// conversation. Set this to `none` to create an out-of-band response which
  /// will not add items to default conversation.
  @_ResponseConfigConversationConverter()
  @JsonKey(includeIfNull: false)
  ResponseConfigConversation? get conversation;

  /// Set of 16 key-value pairs that can be attached to an object. This can be
  /// useful for storing additional information about the object in a structured
  /// format. Keys can be a maximum of 64 characters long and values can be a
  /// maximum of 512 characters long.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata;

  /// Input items to include in the prompt for the model. Creates a new context
  /// for this response, without including the default conversation. Can include
  /// references to items from the default conversation.
  @JsonKey(includeIfNull: false)
  List<Item>? get input;

  /// Create a copy of ResponseConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseConfigCopyWith<ResponseConfig> get copyWith =>
      _$ResponseConfigCopyWithImpl<ResponseConfig>(
          this as ResponseConfig, _$identity);

  /// Serializes this ResponseConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseConfig &&
            const DeepCollectionEquality()
                .equals(other.modalities, modalities) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.voice, voice) || other.voice == voice) &&
            (identical(other.outputAudioFormat, outputAudioFormat) ||
                other.outputAudioFormat == outputAudioFormat) &&
            const DeepCollectionEquality().equals(other.tools, tools) &&
            (identical(other.toolChoice, toolChoice) ||
                other.toolChoice == toolChoice) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(
                    other.maxResponseOutputTokens, maxResponseOutputTokens) ||
                other.maxResponseOutputTokens == maxResponseOutputTokens) &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation) &&
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
            const DeepCollectionEquality().equals(other.input, input));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(modalities),
      instructions,
      voice,
      outputAudioFormat,
      const DeepCollectionEquality().hash(tools),
      toolChoice,
      temperature,
      maxResponseOutputTokens,
      conversation,
      const DeepCollectionEquality().hash(metadata),
      const DeepCollectionEquality().hash(input));

  @override
  String toString() {
    return 'ResponseConfig(modalities: $modalities, instructions: $instructions, voice: $voice, outputAudioFormat: $outputAudioFormat, tools: $tools, toolChoice: $toolChoice, temperature: $temperature, maxResponseOutputTokens: $maxResponseOutputTokens, conversation: $conversation, metadata: $metadata, input: $input)';
  }
}

/// @nodoc
abstract mixin class $ResponseConfigCopyWith<$Res> {
  factory $ResponseConfigCopyWith(
          ResponseConfig value, $Res Function(ResponseConfig) _then) =
      _$ResponseConfigCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<Modality>? modalities,
      @JsonKey(includeIfNull: false) String? instructions,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      Voice? voice,
      @JsonKey(
          name: 'output_audio_format',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      AudioFormat? outputAudioFormat,
      @JsonKey(includeIfNull: false) List<ToolDefinition>? tools,
      @_ResponseConfigToolChoiceConverter()
      @JsonKey(name: 'tool_choice', includeIfNull: false)
      ResponseConfigToolChoice? toolChoice,
      @JsonKey(includeIfNull: false) double? temperature,
      @_ResponseConfigMaxResponseOutputTokensConverter()
      @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
      ResponseConfigMaxResponseOutputTokens? maxResponseOutputTokens,
      @_ResponseConfigConversationConverter()
      @JsonKey(includeIfNull: false)
      ResponseConfigConversation? conversation,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
      @JsonKey(includeIfNull: false) List<Item>? input});

  $ResponseConfigToolChoiceCopyWith<$Res>? get toolChoice;
  $ResponseConfigMaxResponseOutputTokensCopyWith<$Res>?
      get maxResponseOutputTokens;
  $ResponseConfigConversationCopyWith<$Res>? get conversation;
}

/// @nodoc
class _$ResponseConfigCopyWithImpl<$Res>
    implements $ResponseConfigCopyWith<$Res> {
  _$ResponseConfigCopyWithImpl(this._self, this._then);

  final ResponseConfig _self;
  final $Res Function(ResponseConfig) _then;

  /// Create a copy of ResponseConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modalities = freezed,
    Object? instructions = freezed,
    Object? voice = freezed,
    Object? outputAudioFormat = freezed,
    Object? tools = freezed,
    Object? toolChoice = freezed,
    Object? temperature = freezed,
    Object? maxResponseOutputTokens = freezed,
    Object? conversation = freezed,
    Object? metadata = freezed,
    Object? input = freezed,
  }) {
    return _then(_self.copyWith(
      modalities: freezed == modalities
          ? _self.modalities
          : modalities // ignore: cast_nullable_to_non_nullable
              as List<Modality>?,
      instructions: freezed == instructions
          ? _self.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      voice: freezed == voice
          ? _self.voice
          : voice // ignore: cast_nullable_to_non_nullable
              as Voice?,
      outputAudioFormat: freezed == outputAudioFormat
          ? _self.outputAudioFormat
          : outputAudioFormat // ignore: cast_nullable_to_non_nullable
              as AudioFormat?,
      tools: freezed == tools
          ? _self.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<ToolDefinition>?,
      toolChoice: freezed == toolChoice
          ? _self.toolChoice
          : toolChoice // ignore: cast_nullable_to_non_nullable
              as ResponseConfigToolChoice?,
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      maxResponseOutputTokens: freezed == maxResponseOutputTokens
          ? _self.maxResponseOutputTokens
          : maxResponseOutputTokens // ignore: cast_nullable_to_non_nullable
              as ResponseConfigMaxResponseOutputTokens?,
      conversation: freezed == conversation
          ? _self.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as ResponseConfigConversation?,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      input: freezed == input
          ? _self.input
          : input // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
    ));
  }

  /// Create a copy of ResponseConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseConfigToolChoiceCopyWith<$Res>? get toolChoice {
    if (_self.toolChoice == null) {
      return null;
    }

    return $ResponseConfigToolChoiceCopyWith<$Res>(_self.toolChoice!, (value) {
      return _then(_self.copyWith(toolChoice: value));
    });
  }

  /// Create a copy of ResponseConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseConfigMaxResponseOutputTokensCopyWith<$Res>?
      get maxResponseOutputTokens {
    if (_self.maxResponseOutputTokens == null) {
      return null;
    }

    return $ResponseConfigMaxResponseOutputTokensCopyWith<$Res>(
        _self.maxResponseOutputTokens!, (value) {
      return _then(_self.copyWith(maxResponseOutputTokens: value));
    });
  }

  /// Create a copy of ResponseConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseConfigConversationCopyWith<$Res>? get conversation {
    if (_self.conversation == null) {
      return null;
    }

    return $ResponseConfigConversationCopyWith<$Res>(_self.conversation!,
        (value) {
      return _then(_self.copyWith(conversation: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ResponseConfig extends ResponseConfig {
  const _ResponseConfig(
      {@JsonKey(includeIfNull: false) final List<Modality>? modalities,
      @JsonKey(includeIfNull: false) this.instructions,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.voice,
      @JsonKey(
          name: 'output_audio_format',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.outputAudioFormat,
      @JsonKey(includeIfNull: false) final List<ToolDefinition>? tools,
      @_ResponseConfigToolChoiceConverter()
      @JsonKey(name: 'tool_choice', includeIfNull: false)
      this.toolChoice,
      @JsonKey(includeIfNull: false) this.temperature,
      @_ResponseConfigMaxResponseOutputTokensConverter()
      @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
      this.maxResponseOutputTokens,
      @_ResponseConfigConversationConverter()
      @JsonKey(includeIfNull: false)
      this.conversation,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? metadata,
      @JsonKey(includeIfNull: false) final List<Item>? input})
      : _modalities = modalities,
        _tools = tools,
        _metadata = metadata,
        _input = input,
        super._();
  factory _ResponseConfig.fromJson(Map<String, dynamic> json) =>
      _$ResponseConfigFromJson(json);

  /// The modalities for the response.
  final List<Modality>? _modalities;

  /// The modalities for the response.
  @override
  @JsonKey(includeIfNull: false)
  List<Modality>? get modalities {
    final value = _modalities;
    if (value == null) return null;
    if (_modalities is EqualUnmodifiableListView) return _modalities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Instructions for the model.
  @override
  @JsonKey(includeIfNull: false)
  final String? instructions;

  /// The voice the model uses to respond - one of `alloy`, `echo`, or `shimmer`.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final Voice? voice;

  /// The format of output audio.
  @override
  @JsonKey(
      name: 'output_audio_format',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final AudioFormat? outputAudioFormat;

  /// Tools (functions) available to the model.
  final List<ToolDefinition>? _tools;

  /// Tools (functions) available to the model.
  @override
  @JsonKey(includeIfNull: false)
  List<ToolDefinition>? get tools {
    final value = _tools;
    if (value == null) return null;
    if (_tools is EqualUnmodifiableListView) return _tools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// How the model chooses tools.
  @override
  @_ResponseConfigToolChoiceConverter()
  @JsonKey(name: 'tool_choice', includeIfNull: false)
  final ResponseConfigToolChoice? toolChoice;

  /// Sampling temperature.
  @override
  @JsonKey(includeIfNull: false)
  final double? temperature;

  /// Maximum number of output tokens for a single assistant response, inclusive of tool calls. Defaults to "inf".
  @override
  @_ResponseConfigMaxResponseOutputTokensConverter()
  @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
  final ResponseConfigMaxResponseOutputTokens? maxResponseOutputTokens;

  /// Controls which conversation the response is added to. Currently supports
  /// `auto` and `none`, with `auto` as the default value. The `auto` value
  /// means that the contents of the response will be added to the default
  /// conversation. Set this to `none` to create an out-of-band response which
  /// will not add items to default conversation.
  @override
  @_ResponseConfigConversationConverter()
  @JsonKey(includeIfNull: false)
  final ResponseConfigConversation? conversation;

  /// Set of 16 key-value pairs that can be attached to an object. This can be
  /// useful for storing additional information about the object in a structured
  /// format. Keys can be a maximum of 64 characters long and values can be a
  /// maximum of 512 characters long.
  final Map<String, dynamic>? _metadata;

  /// Set of 16 key-value pairs that can be attached to an object. This can be
  /// useful for storing additional information about the object in a structured
  /// format. Keys can be a maximum of 64 characters long and values can be a
  /// maximum of 512 characters long.
  @override
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Input items to include in the prompt for the model. Creates a new context
  /// for this response, without including the default conversation. Can include
  /// references to items from the default conversation.
  final List<Item>? _input;

  /// Input items to include in the prompt for the model. Creates a new context
  /// for this response, without including the default conversation. Can include
  /// references to items from the default conversation.
  @override
  @JsonKey(includeIfNull: false)
  List<Item>? get input {
    final value = _input;
    if (value == null) return null;
    if (_input is EqualUnmodifiableListView) return _input;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of ResponseConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResponseConfigCopyWith<_ResponseConfig> get copyWith =>
      __$ResponseConfigCopyWithImpl<_ResponseConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponseConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResponseConfig &&
            const DeepCollectionEquality()
                .equals(other._modalities, _modalities) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.voice, voice) || other.voice == voice) &&
            (identical(other.outputAudioFormat, outputAudioFormat) ||
                other.outputAudioFormat == outputAudioFormat) &&
            const DeepCollectionEquality().equals(other._tools, _tools) &&
            (identical(other.toolChoice, toolChoice) ||
                other.toolChoice == toolChoice) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(
                    other.maxResponseOutputTokens, maxResponseOutputTokens) ||
                other.maxResponseOutputTokens == maxResponseOutputTokens) &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            const DeepCollectionEquality().equals(other._input, _input));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_modalities),
      instructions,
      voice,
      outputAudioFormat,
      const DeepCollectionEquality().hash(_tools),
      toolChoice,
      temperature,
      maxResponseOutputTokens,
      conversation,
      const DeepCollectionEquality().hash(_metadata),
      const DeepCollectionEquality().hash(_input));

  @override
  String toString() {
    return 'ResponseConfig(modalities: $modalities, instructions: $instructions, voice: $voice, outputAudioFormat: $outputAudioFormat, tools: $tools, toolChoice: $toolChoice, temperature: $temperature, maxResponseOutputTokens: $maxResponseOutputTokens, conversation: $conversation, metadata: $metadata, input: $input)';
  }
}

/// @nodoc
abstract mixin class _$ResponseConfigCopyWith<$Res>
    implements $ResponseConfigCopyWith<$Res> {
  factory _$ResponseConfigCopyWith(
          _ResponseConfig value, $Res Function(_ResponseConfig) _then) =
      __$ResponseConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<Modality>? modalities,
      @JsonKey(includeIfNull: false) String? instructions,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      Voice? voice,
      @JsonKey(
          name: 'output_audio_format',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      AudioFormat? outputAudioFormat,
      @JsonKey(includeIfNull: false) List<ToolDefinition>? tools,
      @_ResponseConfigToolChoiceConverter()
      @JsonKey(name: 'tool_choice', includeIfNull: false)
      ResponseConfigToolChoice? toolChoice,
      @JsonKey(includeIfNull: false) double? temperature,
      @_ResponseConfigMaxResponseOutputTokensConverter()
      @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
      ResponseConfigMaxResponseOutputTokens? maxResponseOutputTokens,
      @_ResponseConfigConversationConverter()
      @JsonKey(includeIfNull: false)
      ResponseConfigConversation? conversation,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
      @JsonKey(includeIfNull: false) List<Item>? input});

  @override
  $ResponseConfigToolChoiceCopyWith<$Res>? get toolChoice;
  @override
  $ResponseConfigMaxResponseOutputTokensCopyWith<$Res>?
      get maxResponseOutputTokens;
  @override
  $ResponseConfigConversationCopyWith<$Res>? get conversation;
}

/// @nodoc
class __$ResponseConfigCopyWithImpl<$Res>
    implements _$ResponseConfigCopyWith<$Res> {
  __$ResponseConfigCopyWithImpl(this._self, this._then);

  final _ResponseConfig _self;
  final $Res Function(_ResponseConfig) _then;

  /// Create a copy of ResponseConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? modalities = freezed,
    Object? instructions = freezed,
    Object? voice = freezed,
    Object? outputAudioFormat = freezed,
    Object? tools = freezed,
    Object? toolChoice = freezed,
    Object? temperature = freezed,
    Object? maxResponseOutputTokens = freezed,
    Object? conversation = freezed,
    Object? metadata = freezed,
    Object? input = freezed,
  }) {
    return _then(_ResponseConfig(
      modalities: freezed == modalities
          ? _self._modalities
          : modalities // ignore: cast_nullable_to_non_nullable
              as List<Modality>?,
      instructions: freezed == instructions
          ? _self.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      voice: freezed == voice
          ? _self.voice
          : voice // ignore: cast_nullable_to_non_nullable
              as Voice?,
      outputAudioFormat: freezed == outputAudioFormat
          ? _self.outputAudioFormat
          : outputAudioFormat // ignore: cast_nullable_to_non_nullable
              as AudioFormat?,
      tools: freezed == tools
          ? _self._tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<ToolDefinition>?,
      toolChoice: freezed == toolChoice
          ? _self.toolChoice
          : toolChoice // ignore: cast_nullable_to_non_nullable
              as ResponseConfigToolChoice?,
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      maxResponseOutputTokens: freezed == maxResponseOutputTokens
          ? _self.maxResponseOutputTokens
          : maxResponseOutputTokens // ignore: cast_nullable_to_non_nullable
              as ResponseConfigMaxResponseOutputTokens?,
      conversation: freezed == conversation
          ? _self.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as ResponseConfigConversation?,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      input: freezed == input
          ? _self._input
          : input // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
    ));
  }

  /// Create a copy of ResponseConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseConfigToolChoiceCopyWith<$Res>? get toolChoice {
    if (_self.toolChoice == null) {
      return null;
    }

    return $ResponseConfigToolChoiceCopyWith<$Res>(_self.toolChoice!, (value) {
      return _then(_self.copyWith(toolChoice: value));
    });
  }

  /// Create a copy of ResponseConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseConfigMaxResponseOutputTokensCopyWith<$Res>?
      get maxResponseOutputTokens {
    if (_self.maxResponseOutputTokens == null) {
      return null;
    }

    return $ResponseConfigMaxResponseOutputTokensCopyWith<$Res>(
        _self.maxResponseOutputTokens!, (value) {
      return _then(_self.copyWith(maxResponseOutputTokens: value));
    });
  }

  /// Create a copy of ResponseConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseConfigConversationCopyWith<$Res>? get conversation {
    if (_self.conversation == null) {
      return null;
    }

    return $ResponseConfigConversationCopyWith<$Res>(_self.conversation!,
        (value) {
      return _then(_self.copyWith(conversation: value));
    });
  }
}

ResponseConfigToolChoice _$ResponseConfigToolChoiceFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'mode':
      return ResponseConfigToolChoiceEnumeration.fromJson(json);
    case 'toolChoiceForced':
      return ResponseConfigToolChoiceToolChoiceForced.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'ResponseConfigToolChoice',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ResponseConfigToolChoice {
  Object get value;

  /// Serializes this ResponseConfigToolChoice to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseConfigToolChoice &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'ResponseConfigToolChoice(value: $value)';
  }
}

/// @nodoc
class $ResponseConfigToolChoiceCopyWith<$Res> {
  $ResponseConfigToolChoiceCopyWith(
      ResponseConfigToolChoice _, $Res Function(ResponseConfigToolChoice) __);
}

/// @nodoc
@JsonSerializable()
class ResponseConfigToolChoiceEnumeration extends ResponseConfigToolChoice {
  const ResponseConfigToolChoiceEnumeration(this.value, {final String? $type})
      : $type = $type ?? 'mode',
        super._();
  factory ResponseConfigToolChoiceEnumeration.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseConfigToolChoiceEnumerationFromJson(json);

  @override
  final ResponseConfigToolChoiceMode value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ResponseConfigToolChoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseConfigToolChoiceEnumerationCopyWith<
          ResponseConfigToolChoiceEnumeration>
      get copyWith => _$ResponseConfigToolChoiceEnumerationCopyWithImpl<
          ResponseConfigToolChoiceEnumeration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponseConfigToolChoiceEnumerationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseConfigToolChoiceEnumeration &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ResponseConfigToolChoice.mode(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ResponseConfigToolChoiceEnumerationCopyWith<$Res>
    implements $ResponseConfigToolChoiceCopyWith<$Res> {
  factory $ResponseConfigToolChoiceEnumerationCopyWith(
          ResponseConfigToolChoiceEnumeration value,
          $Res Function(ResponseConfigToolChoiceEnumeration) _then) =
      _$ResponseConfigToolChoiceEnumerationCopyWithImpl;
  @useResult
  $Res call({ResponseConfigToolChoiceMode value});
}

/// @nodoc
class _$ResponseConfigToolChoiceEnumerationCopyWithImpl<$Res>
    implements $ResponseConfigToolChoiceEnumerationCopyWith<$Res> {
  _$ResponseConfigToolChoiceEnumerationCopyWithImpl(this._self, this._then);

  final ResponseConfigToolChoiceEnumeration _self;
  final $Res Function(ResponseConfigToolChoiceEnumeration) _then;

  /// Create a copy of ResponseConfigToolChoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ResponseConfigToolChoiceEnumeration(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as ResponseConfigToolChoiceMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ResponseConfigToolChoiceToolChoiceForced
    extends ResponseConfigToolChoice {
  const ResponseConfigToolChoiceToolChoiceForced(this.value,
      {final String? $type})
      : $type = $type ?? 'toolChoiceForced',
        super._();
  factory ResponseConfigToolChoiceToolChoiceForced.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseConfigToolChoiceToolChoiceForcedFromJson(json);

  @override
  final ToolChoiceForced value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ResponseConfigToolChoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseConfigToolChoiceToolChoiceForcedCopyWith<
          ResponseConfigToolChoiceToolChoiceForced>
      get copyWith => _$ResponseConfigToolChoiceToolChoiceForcedCopyWithImpl<
          ResponseConfigToolChoiceToolChoiceForced>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponseConfigToolChoiceToolChoiceForcedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseConfigToolChoiceToolChoiceForced &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ResponseConfigToolChoice.toolChoiceForced(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ResponseConfigToolChoiceToolChoiceForcedCopyWith<$Res>
    implements $ResponseConfigToolChoiceCopyWith<$Res> {
  factory $ResponseConfigToolChoiceToolChoiceForcedCopyWith(
          ResponseConfigToolChoiceToolChoiceForced value,
          $Res Function(ResponseConfigToolChoiceToolChoiceForced) _then) =
      _$ResponseConfigToolChoiceToolChoiceForcedCopyWithImpl;
  @useResult
  $Res call({ToolChoiceForced value});

  $ToolChoiceForcedCopyWith<$Res> get value;
}

/// @nodoc
class _$ResponseConfigToolChoiceToolChoiceForcedCopyWithImpl<$Res>
    implements $ResponseConfigToolChoiceToolChoiceForcedCopyWith<$Res> {
  _$ResponseConfigToolChoiceToolChoiceForcedCopyWithImpl(
      this._self, this._then);

  final ResponseConfigToolChoiceToolChoiceForced _self;
  final $Res Function(ResponseConfigToolChoiceToolChoiceForced) _then;

  /// Create a copy of ResponseConfigToolChoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ResponseConfigToolChoiceToolChoiceForced(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as ToolChoiceForced,
    ));
  }

  /// Create a copy of ResponseConfigToolChoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ToolChoiceForcedCopyWith<$Res> get value {
    return $ToolChoiceForcedCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

ResponseConfigMaxResponseOutputTokens
    _$ResponseConfigMaxResponseOutputTokensFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'int':
      return ResponseConfigMaxResponseOutputTokensInt.fromJson(json);
    case 'string':
      return ResponseConfigMaxResponseOutputTokensString.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'ResponseConfigMaxResponseOutputTokens',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ResponseConfigMaxResponseOutputTokens {
  Object get value;

  /// Serializes this ResponseConfigMaxResponseOutputTokens to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseConfigMaxResponseOutputTokens &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'ResponseConfigMaxResponseOutputTokens(value: $value)';
  }
}

/// @nodoc
class $ResponseConfigMaxResponseOutputTokensCopyWith<$Res> {
  $ResponseConfigMaxResponseOutputTokensCopyWith(
      ResponseConfigMaxResponseOutputTokens _,
      $Res Function(ResponseConfigMaxResponseOutputTokens) __);
}

/// @nodoc
@JsonSerializable()
class ResponseConfigMaxResponseOutputTokensInt
    extends ResponseConfigMaxResponseOutputTokens {
  const ResponseConfigMaxResponseOutputTokensInt(this.value,
      {final String? $type})
      : $type = $type ?? 'int',
        super._();
  factory ResponseConfigMaxResponseOutputTokensInt.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseConfigMaxResponseOutputTokensIntFromJson(json);

  @override
  final int value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ResponseConfigMaxResponseOutputTokens
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseConfigMaxResponseOutputTokensIntCopyWith<
          ResponseConfigMaxResponseOutputTokensInt>
      get copyWith => _$ResponseConfigMaxResponseOutputTokensIntCopyWithImpl<
          ResponseConfigMaxResponseOutputTokensInt>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponseConfigMaxResponseOutputTokensIntToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseConfigMaxResponseOutputTokensInt &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ResponseConfigMaxResponseOutputTokens.int(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ResponseConfigMaxResponseOutputTokensIntCopyWith<$Res>
    implements $ResponseConfigMaxResponseOutputTokensCopyWith<$Res> {
  factory $ResponseConfigMaxResponseOutputTokensIntCopyWith(
          ResponseConfigMaxResponseOutputTokensInt value,
          $Res Function(ResponseConfigMaxResponseOutputTokensInt) _then) =
      _$ResponseConfigMaxResponseOutputTokensIntCopyWithImpl;
  @useResult
  $Res call({int value});
}

/// @nodoc
class _$ResponseConfigMaxResponseOutputTokensIntCopyWithImpl<$Res>
    implements $ResponseConfigMaxResponseOutputTokensIntCopyWith<$Res> {
  _$ResponseConfigMaxResponseOutputTokensIntCopyWithImpl(
      this._self, this._then);

  final ResponseConfigMaxResponseOutputTokensInt _self;
  final $Res Function(ResponseConfigMaxResponseOutputTokensInt) _then;

  /// Create a copy of ResponseConfigMaxResponseOutputTokens
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ResponseConfigMaxResponseOutputTokensInt(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ResponseConfigMaxResponseOutputTokensString
    extends ResponseConfigMaxResponseOutputTokens {
  const ResponseConfigMaxResponseOutputTokensString(this.value,
      {final String? $type})
      : $type = $type ?? 'string',
        super._();
  factory ResponseConfigMaxResponseOutputTokensString.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseConfigMaxResponseOutputTokensStringFromJson(json);

  @override
  final String value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ResponseConfigMaxResponseOutputTokens
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseConfigMaxResponseOutputTokensStringCopyWith<
          ResponseConfigMaxResponseOutputTokensString>
      get copyWith => _$ResponseConfigMaxResponseOutputTokensStringCopyWithImpl<
          ResponseConfigMaxResponseOutputTokensString>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponseConfigMaxResponseOutputTokensStringToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseConfigMaxResponseOutputTokensString &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ResponseConfigMaxResponseOutputTokens.string(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ResponseConfigMaxResponseOutputTokensStringCopyWith<$Res>
    implements $ResponseConfigMaxResponseOutputTokensCopyWith<$Res> {
  factory $ResponseConfigMaxResponseOutputTokensStringCopyWith(
          ResponseConfigMaxResponseOutputTokensString value,
          $Res Function(ResponseConfigMaxResponseOutputTokensString) _then) =
      _$ResponseConfigMaxResponseOutputTokensStringCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$ResponseConfigMaxResponseOutputTokensStringCopyWithImpl<$Res>
    implements $ResponseConfigMaxResponseOutputTokensStringCopyWith<$Res> {
  _$ResponseConfigMaxResponseOutputTokensStringCopyWithImpl(
      this._self, this._then);

  final ResponseConfigMaxResponseOutputTokensString _self;
  final $Res Function(ResponseConfigMaxResponseOutputTokensString) _then;

  /// Create a copy of ResponseConfigMaxResponseOutputTokens
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ResponseConfigMaxResponseOutputTokensString(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

ResponseConfigConversation _$ResponseConfigConversationFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'enumeration':
      return ResponseConfigConversationEnumeration.fromJson(json);
    case 'string':
      return ResponseConfigConversationString.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'ResponseConfigConversation',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ResponseConfigConversation {
  Object get value;

  /// Serializes this ResponseConfigConversation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseConfigConversation &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'ResponseConfigConversation(value: $value)';
  }
}

/// @nodoc
class $ResponseConfigConversationCopyWith<$Res> {
  $ResponseConfigConversationCopyWith(ResponseConfigConversation _,
      $Res Function(ResponseConfigConversation) __);
}

/// @nodoc
@JsonSerializable()
class ResponseConfigConversationEnumeration extends ResponseConfigConversation {
  const ResponseConfigConversationEnumeration(this.value, {final String? $type})
      : $type = $type ?? 'enumeration',
        super._();
  factory ResponseConfigConversationEnumeration.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseConfigConversationEnumerationFromJson(json);

  @override
  final ResponseConfigConversationEnum value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ResponseConfigConversation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseConfigConversationEnumerationCopyWith<
          ResponseConfigConversationEnumeration>
      get copyWith => _$ResponseConfigConversationEnumerationCopyWithImpl<
          ResponseConfigConversationEnumeration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponseConfigConversationEnumerationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseConfigConversationEnumeration &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ResponseConfigConversation.enumeration(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ResponseConfigConversationEnumerationCopyWith<$Res>
    implements $ResponseConfigConversationCopyWith<$Res> {
  factory $ResponseConfigConversationEnumerationCopyWith(
          ResponseConfigConversationEnumeration value,
          $Res Function(ResponseConfigConversationEnumeration) _then) =
      _$ResponseConfigConversationEnumerationCopyWithImpl;
  @useResult
  $Res call({ResponseConfigConversationEnum value});
}

/// @nodoc
class _$ResponseConfigConversationEnumerationCopyWithImpl<$Res>
    implements $ResponseConfigConversationEnumerationCopyWith<$Res> {
  _$ResponseConfigConversationEnumerationCopyWithImpl(this._self, this._then);

  final ResponseConfigConversationEnumeration _self;
  final $Res Function(ResponseConfigConversationEnumeration) _then;

  /// Create a copy of ResponseConfigConversation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ResponseConfigConversationEnumeration(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as ResponseConfigConversationEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ResponseConfigConversationString extends ResponseConfigConversation {
  const ResponseConfigConversationString(this.value, {final String? $type})
      : $type = $type ?? 'string',
        super._();
  factory ResponseConfigConversationString.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseConfigConversationStringFromJson(json);

  @override
  final String value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ResponseConfigConversation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseConfigConversationStringCopyWith<ResponseConfigConversationString>
      get copyWith => _$ResponseConfigConversationStringCopyWithImpl<
          ResponseConfigConversationString>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponseConfigConversationStringToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseConfigConversationString &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'ResponseConfigConversation.string(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ResponseConfigConversationStringCopyWith<$Res>
    implements $ResponseConfigConversationCopyWith<$Res> {
  factory $ResponseConfigConversationStringCopyWith(
          ResponseConfigConversationString value,
          $Res Function(ResponseConfigConversationString) _then) =
      _$ResponseConfigConversationStringCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$ResponseConfigConversationStringCopyWithImpl<$Res>
    implements $ResponseConfigConversationStringCopyWith<$Res> {
  _$ResponseConfigConversationStringCopyWithImpl(this._self, this._then);

  final ResponseConfigConversationString _self;
  final $Res Function(ResponseConfigConversationString) _then;

  /// Create a copy of ResponseConfigConversation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ResponseConfigConversationString(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Usage {
  /// The total number of tokens in the Response including input and output text and audio tokens.
  @JsonKey(name: 'total_tokens', includeIfNull: false)
  int? get totalTokens;

  /// The number of input tokens used in the Response, including text and audio tokens.
  @JsonKey(name: 'input_tokens', includeIfNull: false)
  int? get inputTokens;

  /// The number of output tokens sent in the Response, including text and audio tokens.
  @JsonKey(name: 'output_tokens', includeIfNull: false)
  int? get outputTokens;

  /// Details about the input tokens used in the Response.
  @JsonKey(name: 'input_token_details', includeIfNull: false)
  UsageInputTokenDetails? get inputTokenDetails;

  /// Details about the output tokens used in the Response.
  @JsonKey(name: 'output_token_details', includeIfNull: false)
  UsageOutputTokenDetails? get outputTokenDetails;

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsageCopyWith<Usage> get copyWith =>
      _$UsageCopyWithImpl<Usage>(this as Usage, _$identity);

  /// Serializes this Usage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Usage &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.inputTokens, inputTokens) ||
                other.inputTokens == inputTokens) &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens) &&
            (identical(other.inputTokenDetails, inputTokenDetails) ||
                other.inputTokenDetails == inputTokenDetails) &&
            (identical(other.outputTokenDetails, outputTokenDetails) ||
                other.outputTokenDetails == outputTokenDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalTokens, inputTokens,
      outputTokens, inputTokenDetails, outputTokenDetails);

  @override
  String toString() {
    return 'Usage(totalTokens: $totalTokens, inputTokens: $inputTokens, outputTokens: $outputTokens, inputTokenDetails: $inputTokenDetails, outputTokenDetails: $outputTokenDetails)';
  }
}

/// @nodoc
abstract mixin class $UsageCopyWith<$Res> {
  factory $UsageCopyWith(Usage value, $Res Function(Usage) _then) =
      _$UsageCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_tokens', includeIfNull: false) int? totalTokens,
      @JsonKey(name: 'input_tokens', includeIfNull: false) int? inputTokens,
      @JsonKey(name: 'output_tokens', includeIfNull: false) int? outputTokens,
      @JsonKey(name: 'input_token_details', includeIfNull: false)
      UsageInputTokenDetails? inputTokenDetails,
      @JsonKey(name: 'output_token_details', includeIfNull: false)
      UsageOutputTokenDetails? outputTokenDetails});

  $UsageInputTokenDetailsCopyWith<$Res>? get inputTokenDetails;
  $UsageOutputTokenDetailsCopyWith<$Res>? get outputTokenDetails;
}

/// @nodoc
class _$UsageCopyWithImpl<$Res> implements $UsageCopyWith<$Res> {
  _$UsageCopyWithImpl(this._self, this._then);

  final Usage _self;
  final $Res Function(Usage) _then;

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTokens = freezed,
    Object? inputTokens = freezed,
    Object? outputTokens = freezed,
    Object? inputTokenDetails = freezed,
    Object? outputTokenDetails = freezed,
  }) {
    return _then(_self.copyWith(
      totalTokens: freezed == totalTokens
          ? _self.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      inputTokens: freezed == inputTokens
          ? _self.inputTokens
          : inputTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      outputTokens: freezed == outputTokens
          ? _self.outputTokens
          : outputTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      inputTokenDetails: freezed == inputTokenDetails
          ? _self.inputTokenDetails
          : inputTokenDetails // ignore: cast_nullable_to_non_nullable
              as UsageInputTokenDetails?,
      outputTokenDetails: freezed == outputTokenDetails
          ? _self.outputTokenDetails
          : outputTokenDetails // ignore: cast_nullable_to_non_nullable
              as UsageOutputTokenDetails?,
    ));
  }

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UsageInputTokenDetailsCopyWith<$Res>? get inputTokenDetails {
    if (_self.inputTokenDetails == null) {
      return null;
    }

    return $UsageInputTokenDetailsCopyWith<$Res>(_self.inputTokenDetails!,
        (value) {
      return _then(_self.copyWith(inputTokenDetails: value));
    });
  }

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UsageOutputTokenDetailsCopyWith<$Res>? get outputTokenDetails {
    if (_self.outputTokenDetails == null) {
      return null;
    }

    return $UsageOutputTokenDetailsCopyWith<$Res>(_self.outputTokenDetails!,
        (value) {
      return _then(_self.copyWith(outputTokenDetails: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Usage extends Usage {
  const _Usage(
      {@JsonKey(name: 'total_tokens', includeIfNull: false) this.totalTokens,
      @JsonKey(name: 'input_tokens', includeIfNull: false) this.inputTokens,
      @JsonKey(name: 'output_tokens', includeIfNull: false) this.outputTokens,
      @JsonKey(name: 'input_token_details', includeIfNull: false)
      this.inputTokenDetails,
      @JsonKey(name: 'output_token_details', includeIfNull: false)
      this.outputTokenDetails})
      : super._();
  factory _Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

  /// The total number of tokens in the Response including input and output text and audio tokens.
  @override
  @JsonKey(name: 'total_tokens', includeIfNull: false)
  final int? totalTokens;

  /// The number of input tokens used in the Response, including text and audio tokens.
  @override
  @JsonKey(name: 'input_tokens', includeIfNull: false)
  final int? inputTokens;

  /// The number of output tokens sent in the Response, including text and audio tokens.
  @override
  @JsonKey(name: 'output_tokens', includeIfNull: false)
  final int? outputTokens;

  /// Details about the input tokens used in the Response.
  @override
  @JsonKey(name: 'input_token_details', includeIfNull: false)
  final UsageInputTokenDetails? inputTokenDetails;

  /// Details about the output tokens used in the Response.
  @override
  @JsonKey(name: 'output_token_details', includeIfNull: false)
  final UsageOutputTokenDetails? outputTokenDetails;

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UsageCopyWith<_Usage> get copyWith =>
      __$UsageCopyWithImpl<_Usage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UsageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Usage &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.inputTokens, inputTokens) ||
                other.inputTokens == inputTokens) &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens) &&
            (identical(other.inputTokenDetails, inputTokenDetails) ||
                other.inputTokenDetails == inputTokenDetails) &&
            (identical(other.outputTokenDetails, outputTokenDetails) ||
                other.outputTokenDetails == outputTokenDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalTokens, inputTokens,
      outputTokens, inputTokenDetails, outputTokenDetails);

  @override
  String toString() {
    return 'Usage(totalTokens: $totalTokens, inputTokens: $inputTokens, outputTokens: $outputTokens, inputTokenDetails: $inputTokenDetails, outputTokenDetails: $outputTokenDetails)';
  }
}

/// @nodoc
abstract mixin class _$UsageCopyWith<$Res> implements $UsageCopyWith<$Res> {
  factory _$UsageCopyWith(_Usage value, $Res Function(_Usage) _then) =
      __$UsageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_tokens', includeIfNull: false) int? totalTokens,
      @JsonKey(name: 'input_tokens', includeIfNull: false) int? inputTokens,
      @JsonKey(name: 'output_tokens', includeIfNull: false) int? outputTokens,
      @JsonKey(name: 'input_token_details', includeIfNull: false)
      UsageInputTokenDetails? inputTokenDetails,
      @JsonKey(name: 'output_token_details', includeIfNull: false)
      UsageOutputTokenDetails? outputTokenDetails});

  @override
  $UsageInputTokenDetailsCopyWith<$Res>? get inputTokenDetails;
  @override
  $UsageOutputTokenDetailsCopyWith<$Res>? get outputTokenDetails;
}

/// @nodoc
class __$UsageCopyWithImpl<$Res> implements _$UsageCopyWith<$Res> {
  __$UsageCopyWithImpl(this._self, this._then);

  final _Usage _self;
  final $Res Function(_Usage) _then;

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalTokens = freezed,
    Object? inputTokens = freezed,
    Object? outputTokens = freezed,
    Object? inputTokenDetails = freezed,
    Object? outputTokenDetails = freezed,
  }) {
    return _then(_Usage(
      totalTokens: freezed == totalTokens
          ? _self.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      inputTokens: freezed == inputTokens
          ? _self.inputTokens
          : inputTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      outputTokens: freezed == outputTokens
          ? _self.outputTokens
          : outputTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      inputTokenDetails: freezed == inputTokenDetails
          ? _self.inputTokenDetails
          : inputTokenDetails // ignore: cast_nullable_to_non_nullable
              as UsageInputTokenDetails?,
      outputTokenDetails: freezed == outputTokenDetails
          ? _self.outputTokenDetails
          : outputTokenDetails // ignore: cast_nullable_to_non_nullable
              as UsageOutputTokenDetails?,
    ));
  }

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UsageInputTokenDetailsCopyWith<$Res>? get inputTokenDetails {
    if (_self.inputTokenDetails == null) {
      return null;
    }

    return $UsageInputTokenDetailsCopyWith<$Res>(_self.inputTokenDetails!,
        (value) {
      return _then(_self.copyWith(inputTokenDetails: value));
    });
  }

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UsageOutputTokenDetailsCopyWith<$Res>? get outputTokenDetails {
    if (_self.outputTokenDetails == null) {
      return null;
    }

    return $UsageOutputTokenDetailsCopyWith<$Res>(_self.outputTokenDetails!,
        (value) {
      return _then(_self.copyWith(outputTokenDetails: value));
    });
  }
}

/// @nodoc
mixin _$UsageInputTokenDetails {
  /// The number of cached tokens used in the Response.
  @JsonKey(name: 'cached_tokens', includeIfNull: false)
  int? get cachedTokens;

  /// The number of text tokens used in the Response.
  @JsonKey(name: 'text_tokens', includeIfNull: false)
  int? get textTokens;

  /// The number of audio tokens used in the Response.
  @JsonKey(name: 'audio_tokens', includeIfNull: false)
  int? get audioTokens;

  /// Create a copy of UsageInputTokenDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsageInputTokenDetailsCopyWith<UsageInputTokenDetails> get copyWith =>
      _$UsageInputTokenDetailsCopyWithImpl<UsageInputTokenDetails>(
          this as UsageInputTokenDetails, _$identity);

  /// Serializes this UsageInputTokenDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsageInputTokenDetails &&
            (identical(other.cachedTokens, cachedTokens) ||
                other.cachedTokens == cachedTokens) &&
            (identical(other.textTokens, textTokens) ||
                other.textTokens == textTokens) &&
            (identical(other.audioTokens, audioTokens) ||
                other.audioTokens == audioTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cachedTokens, textTokens, audioTokens);

  @override
  String toString() {
    return 'UsageInputTokenDetails(cachedTokens: $cachedTokens, textTokens: $textTokens, audioTokens: $audioTokens)';
  }
}

/// @nodoc
abstract mixin class $UsageInputTokenDetailsCopyWith<$Res> {
  factory $UsageInputTokenDetailsCopyWith(UsageInputTokenDetails value,
          $Res Function(UsageInputTokenDetails) _then) =
      _$UsageInputTokenDetailsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'cached_tokens', includeIfNull: false) int? cachedTokens,
      @JsonKey(name: 'text_tokens', includeIfNull: false) int? textTokens,
      @JsonKey(name: 'audio_tokens', includeIfNull: false) int? audioTokens});
}

/// @nodoc
class _$UsageInputTokenDetailsCopyWithImpl<$Res>
    implements $UsageInputTokenDetailsCopyWith<$Res> {
  _$UsageInputTokenDetailsCopyWithImpl(this._self, this._then);

  final UsageInputTokenDetails _self;
  final $Res Function(UsageInputTokenDetails) _then;

  /// Create a copy of UsageInputTokenDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cachedTokens = freezed,
    Object? textTokens = freezed,
    Object? audioTokens = freezed,
  }) {
    return _then(_self.copyWith(
      cachedTokens: freezed == cachedTokens
          ? _self.cachedTokens
          : cachedTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      textTokens: freezed == textTokens
          ? _self.textTokens
          : textTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      audioTokens: freezed == audioTokens
          ? _self.audioTokens
          : audioTokens // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UsageInputTokenDetails extends UsageInputTokenDetails {
  const _UsageInputTokenDetails(
      {@JsonKey(name: 'cached_tokens', includeIfNull: false) this.cachedTokens,
      @JsonKey(name: 'text_tokens', includeIfNull: false) this.textTokens,
      @JsonKey(name: 'audio_tokens', includeIfNull: false) this.audioTokens})
      : super._();
  factory _UsageInputTokenDetails.fromJson(Map<String, dynamic> json) =>
      _$UsageInputTokenDetailsFromJson(json);

  /// The number of cached tokens used in the Response.
  @override
  @JsonKey(name: 'cached_tokens', includeIfNull: false)
  final int? cachedTokens;

  /// The number of text tokens used in the Response.
  @override
  @JsonKey(name: 'text_tokens', includeIfNull: false)
  final int? textTokens;

  /// The number of audio tokens used in the Response.
  @override
  @JsonKey(name: 'audio_tokens', includeIfNull: false)
  final int? audioTokens;

  /// Create a copy of UsageInputTokenDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UsageInputTokenDetailsCopyWith<_UsageInputTokenDetails> get copyWith =>
      __$UsageInputTokenDetailsCopyWithImpl<_UsageInputTokenDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UsageInputTokenDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsageInputTokenDetails &&
            (identical(other.cachedTokens, cachedTokens) ||
                other.cachedTokens == cachedTokens) &&
            (identical(other.textTokens, textTokens) ||
                other.textTokens == textTokens) &&
            (identical(other.audioTokens, audioTokens) ||
                other.audioTokens == audioTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cachedTokens, textTokens, audioTokens);

  @override
  String toString() {
    return 'UsageInputTokenDetails(cachedTokens: $cachedTokens, textTokens: $textTokens, audioTokens: $audioTokens)';
  }
}

/// @nodoc
abstract mixin class _$UsageInputTokenDetailsCopyWith<$Res>
    implements $UsageInputTokenDetailsCopyWith<$Res> {
  factory _$UsageInputTokenDetailsCopyWith(_UsageInputTokenDetails value,
          $Res Function(_UsageInputTokenDetails) _then) =
      __$UsageInputTokenDetailsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cached_tokens', includeIfNull: false) int? cachedTokens,
      @JsonKey(name: 'text_tokens', includeIfNull: false) int? textTokens,
      @JsonKey(name: 'audio_tokens', includeIfNull: false) int? audioTokens});
}

/// @nodoc
class __$UsageInputTokenDetailsCopyWithImpl<$Res>
    implements _$UsageInputTokenDetailsCopyWith<$Res> {
  __$UsageInputTokenDetailsCopyWithImpl(this._self, this._then);

  final _UsageInputTokenDetails _self;
  final $Res Function(_UsageInputTokenDetails) _then;

  /// Create a copy of UsageInputTokenDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cachedTokens = freezed,
    Object? textTokens = freezed,
    Object? audioTokens = freezed,
  }) {
    return _then(_UsageInputTokenDetails(
      cachedTokens: freezed == cachedTokens
          ? _self.cachedTokens
          : cachedTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      textTokens: freezed == textTokens
          ? _self.textTokens
          : textTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      audioTokens: freezed == audioTokens
          ? _self.audioTokens
          : audioTokens // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$UsageOutputTokenDetails {
  /// The number of text tokens used in the Response.
  @JsonKey(name: 'text_tokens', includeIfNull: false)
  int? get textTokens;

  /// The number of audio tokens used in the Response.
  @JsonKey(name: 'audio_tokens', includeIfNull: false)
  int? get audioTokens;

  /// Create a copy of UsageOutputTokenDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsageOutputTokenDetailsCopyWith<UsageOutputTokenDetails> get copyWith =>
      _$UsageOutputTokenDetailsCopyWithImpl<UsageOutputTokenDetails>(
          this as UsageOutputTokenDetails, _$identity);

  /// Serializes this UsageOutputTokenDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsageOutputTokenDetails &&
            (identical(other.textTokens, textTokens) ||
                other.textTokens == textTokens) &&
            (identical(other.audioTokens, audioTokens) ||
                other.audioTokens == audioTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, textTokens, audioTokens);

  @override
  String toString() {
    return 'UsageOutputTokenDetails(textTokens: $textTokens, audioTokens: $audioTokens)';
  }
}

/// @nodoc
abstract mixin class $UsageOutputTokenDetailsCopyWith<$Res> {
  factory $UsageOutputTokenDetailsCopyWith(UsageOutputTokenDetails value,
          $Res Function(UsageOutputTokenDetails) _then) =
      _$UsageOutputTokenDetailsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'text_tokens', includeIfNull: false) int? textTokens,
      @JsonKey(name: 'audio_tokens', includeIfNull: false) int? audioTokens});
}

/// @nodoc
class _$UsageOutputTokenDetailsCopyWithImpl<$Res>
    implements $UsageOutputTokenDetailsCopyWith<$Res> {
  _$UsageOutputTokenDetailsCopyWithImpl(this._self, this._then);

  final UsageOutputTokenDetails _self;
  final $Res Function(UsageOutputTokenDetails) _then;

  /// Create a copy of UsageOutputTokenDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textTokens = freezed,
    Object? audioTokens = freezed,
  }) {
    return _then(_self.copyWith(
      textTokens: freezed == textTokens
          ? _self.textTokens
          : textTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      audioTokens: freezed == audioTokens
          ? _self.audioTokens
          : audioTokens // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UsageOutputTokenDetails extends UsageOutputTokenDetails {
  const _UsageOutputTokenDetails(
      {@JsonKey(name: 'text_tokens', includeIfNull: false) this.textTokens,
      @JsonKey(name: 'audio_tokens', includeIfNull: false) this.audioTokens})
      : super._();
  factory _UsageOutputTokenDetails.fromJson(Map<String, dynamic> json) =>
      _$UsageOutputTokenDetailsFromJson(json);

  /// The number of text tokens used in the Response.
  @override
  @JsonKey(name: 'text_tokens', includeIfNull: false)
  final int? textTokens;

  /// The number of audio tokens used in the Response.
  @override
  @JsonKey(name: 'audio_tokens', includeIfNull: false)
  final int? audioTokens;

  /// Create a copy of UsageOutputTokenDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UsageOutputTokenDetailsCopyWith<_UsageOutputTokenDetails> get copyWith =>
      __$UsageOutputTokenDetailsCopyWithImpl<_UsageOutputTokenDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UsageOutputTokenDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsageOutputTokenDetails &&
            (identical(other.textTokens, textTokens) ||
                other.textTokens == textTokens) &&
            (identical(other.audioTokens, audioTokens) ||
                other.audioTokens == audioTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, textTokens, audioTokens);

  @override
  String toString() {
    return 'UsageOutputTokenDetails(textTokens: $textTokens, audioTokens: $audioTokens)';
  }
}

/// @nodoc
abstract mixin class _$UsageOutputTokenDetailsCopyWith<$Res>
    implements $UsageOutputTokenDetailsCopyWith<$Res> {
  factory _$UsageOutputTokenDetailsCopyWith(_UsageOutputTokenDetails value,
          $Res Function(_UsageOutputTokenDetails) _then) =
      __$UsageOutputTokenDetailsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'text_tokens', includeIfNull: false) int? textTokens,
      @JsonKey(name: 'audio_tokens', includeIfNull: false) int? audioTokens});
}

/// @nodoc
class __$UsageOutputTokenDetailsCopyWithImpl<$Res>
    implements _$UsageOutputTokenDetailsCopyWith<$Res> {
  __$UsageOutputTokenDetailsCopyWithImpl(this._self, this._then);

  final _UsageOutputTokenDetails _self;
  final $Res Function(_UsageOutputTokenDetails) _then;

  /// Create a copy of UsageOutputTokenDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? textTokens = freezed,
    Object? audioTokens = freezed,
  }) {
    return _then(_UsageOutputTokenDetails(
      textTokens: freezed == textTokens
          ? _self.textTokens
          : textTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      audioTokens: freezed == audioTokens
          ? _self.audioTokens
          : audioTokens // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$Session {
  /// The unique ID of the session.
  @JsonKey(includeIfNull: false)
  String? get id;

  /// The object type, must be "realtime.session".
  ObjectType get object;

  /// The default model used for this session.
  @JsonKey(includeIfNull: false)
  String? get model;

  /// The time at which the session expires.
  @JsonKey(name: 'expires_at', includeIfNull: false)
  int? get expiresAt;

  /// The set of modalities the model can respond with.
  @JsonKey(includeIfNull: false)
  List<Modality>? get modalities;

  /// The default system instructions.
  @JsonKey(includeIfNull: false)
  String? get instructions;

  /// The voice the model uses to respond. Voice cannot be changed during the
  /// session once the model has responded with audio at least once. Current
  /// voice options are `alloy`, `ash`, `ballad`, `coral`, `echo` `sage`,
  /// `shimmer` and `verse`.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  Voice? get voice;

  /// The format of input audio.
  @JsonKey(
      name: 'input_audio_format',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  AudioFormat? get inputAudioFormat;

  /// The format of output audio.
  @JsonKey(
      name: 'output_audio_format',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  AudioFormat? get outputAudioFormat;

  /// Configuration for input audio transcription, defaults to off and can be  set to `null` to turn off
  /// once on. Input audio transcription is not native to the model, since the model consumes audio
  /// directly. Transcription runs  asynchronously through [the /audio/transcriptions
  /// endpoint](https://platform.openai.com/docs/api-reference/audio/createTranscription) and should be
  /// treated as guidance of input audio content rather than precisely what the model heard. The client
  /// can optionally set the language and prompt for transcription, these offer additional guidance to
  /// the transcription service.
  @JsonKey(name: 'input_audio_transcription', includeIfNull: false)
  InputAudioTranscriptionConfig? get inputAudioTranscription;

  /// Configuration for turn detection. Can be set to `null` to turn off. Server
  /// VAD means that the model will detect the start and end of speech based on
  /// audio volume and respond at the end of user speech.
  @JsonKey(name: 'turn_detection', includeIfNull: false)
  TurnDetection? get turnDetection;

  /// Tools (functions) available to the model.
  @JsonKey(includeIfNull: false)
  List<ToolDefinition>? get tools;

  /// How the model chooses tools.
  @_SessionToolChoiceConverter()
  @JsonKey(name: 'tool_choice', includeIfNull: false)
  SessionToolChoice? get toolChoice;

  /// Sampling temperature.
  @JsonKey(includeIfNull: false)
  double? get temperature;

  /// Maximum number of output tokens for a single assistant response,
  /// inclusive of tool calls. Provide an integer between 1 and 4096 to
  /// limit output tokens, or `inf` for the maximum available tokens for a
  /// given model. Defaults to `inf`.
  @_SessionMaxResponseOutputTokensConverter()
  @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
  SessionMaxResponseOutputTokens? get maxResponseOutputTokens;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionCopyWith<Session> get copyWith =>
      _$SessionCopyWithImpl<Session>(this as Session, _$identity);

  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Session &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            const DeepCollectionEquality()
                .equals(other.modalities, modalities) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.voice, voice) || other.voice == voice) &&
            (identical(other.inputAudioFormat, inputAudioFormat) ||
                other.inputAudioFormat == inputAudioFormat) &&
            (identical(other.outputAudioFormat, outputAudioFormat) ||
                other.outputAudioFormat == outputAudioFormat) &&
            (identical(
                    other.inputAudioTranscription, inputAudioTranscription) ||
                other.inputAudioTranscription == inputAudioTranscription) &&
            (identical(other.turnDetection, turnDetection) ||
                other.turnDetection == turnDetection) &&
            const DeepCollectionEquality().equals(other.tools, tools) &&
            (identical(other.toolChoice, toolChoice) ||
                other.toolChoice == toolChoice) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(
                    other.maxResponseOutputTokens, maxResponseOutputTokens) ||
                other.maxResponseOutputTokens == maxResponseOutputTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      object,
      model,
      expiresAt,
      const DeepCollectionEquality().hash(modalities),
      instructions,
      voice,
      inputAudioFormat,
      outputAudioFormat,
      inputAudioTranscription,
      turnDetection,
      const DeepCollectionEquality().hash(tools),
      toolChoice,
      temperature,
      maxResponseOutputTokens);

  @override
  String toString() {
    return 'Session(id: $id, object: $object, model: $model, expiresAt: $expiresAt, modalities: $modalities, instructions: $instructions, voice: $voice, inputAudioFormat: $inputAudioFormat, outputAudioFormat: $outputAudioFormat, inputAudioTranscription: $inputAudioTranscription, turnDetection: $turnDetection, tools: $tools, toolChoice: $toolChoice, temperature: $temperature, maxResponseOutputTokens: $maxResponseOutputTokens)';
  }
}

/// @nodoc
abstract mixin class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) _then) =
      _$SessionCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? id,
      ObjectType object,
      @JsonKey(includeIfNull: false) String? model,
      @JsonKey(name: 'expires_at', includeIfNull: false) int? expiresAt,
      @JsonKey(includeIfNull: false) List<Modality>? modalities,
      @JsonKey(includeIfNull: false) String? instructions,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      Voice? voice,
      @JsonKey(
          name: 'input_audio_format',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      AudioFormat? inputAudioFormat,
      @JsonKey(
          name: 'output_audio_format',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      AudioFormat? outputAudioFormat,
      @JsonKey(name: 'input_audio_transcription', includeIfNull: false)
      InputAudioTranscriptionConfig? inputAudioTranscription,
      @JsonKey(name: 'turn_detection', includeIfNull: false)
      TurnDetection? turnDetection,
      @JsonKey(includeIfNull: false) List<ToolDefinition>? tools,
      @_SessionToolChoiceConverter()
      @JsonKey(name: 'tool_choice', includeIfNull: false)
      SessionToolChoice? toolChoice,
      @JsonKey(includeIfNull: false) double? temperature,
      @_SessionMaxResponseOutputTokensConverter()
      @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
      SessionMaxResponseOutputTokens? maxResponseOutputTokens});

  $InputAudioTranscriptionConfigCopyWith<$Res>? get inputAudioTranscription;
  $TurnDetectionCopyWith<$Res>? get turnDetection;
  $SessionToolChoiceCopyWith<$Res>? get toolChoice;
  $SessionMaxResponseOutputTokensCopyWith<$Res>? get maxResponseOutputTokens;
}

/// @nodoc
class _$SessionCopyWithImpl<$Res> implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._self, this._then);

  final Session _self;
  final $Res Function(Session) _then;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? object = null,
    Object? model = freezed,
    Object? expiresAt = freezed,
    Object? modalities = freezed,
    Object? instructions = freezed,
    Object? voice = freezed,
    Object? inputAudioFormat = freezed,
    Object? outputAudioFormat = freezed,
    Object? inputAudioTranscription = freezed,
    Object? turnDetection = freezed,
    Object? tools = freezed,
    Object? toolChoice = freezed,
    Object? temperature = freezed,
    Object? maxResponseOutputTokens = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      object: null == object
          ? _self.object
          : object // ignore: cast_nullable_to_non_nullable
              as ObjectType,
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
      modalities: freezed == modalities
          ? _self.modalities
          : modalities // ignore: cast_nullable_to_non_nullable
              as List<Modality>?,
      instructions: freezed == instructions
          ? _self.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      voice: freezed == voice
          ? _self.voice
          : voice // ignore: cast_nullable_to_non_nullable
              as Voice?,
      inputAudioFormat: freezed == inputAudioFormat
          ? _self.inputAudioFormat
          : inputAudioFormat // ignore: cast_nullable_to_non_nullable
              as AudioFormat?,
      outputAudioFormat: freezed == outputAudioFormat
          ? _self.outputAudioFormat
          : outputAudioFormat // ignore: cast_nullable_to_non_nullable
              as AudioFormat?,
      inputAudioTranscription: freezed == inputAudioTranscription
          ? _self.inputAudioTranscription
          : inputAudioTranscription // ignore: cast_nullable_to_non_nullable
              as InputAudioTranscriptionConfig?,
      turnDetection: freezed == turnDetection
          ? _self.turnDetection
          : turnDetection // ignore: cast_nullable_to_non_nullable
              as TurnDetection?,
      tools: freezed == tools
          ? _self.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<ToolDefinition>?,
      toolChoice: freezed == toolChoice
          ? _self.toolChoice
          : toolChoice // ignore: cast_nullable_to_non_nullable
              as SessionToolChoice?,
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      maxResponseOutputTokens: freezed == maxResponseOutputTokens
          ? _self.maxResponseOutputTokens
          : maxResponseOutputTokens // ignore: cast_nullable_to_non_nullable
              as SessionMaxResponseOutputTokens?,
    ));
  }

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputAudioTranscriptionConfigCopyWith<$Res>? get inputAudioTranscription {
    if (_self.inputAudioTranscription == null) {
      return null;
    }

    return $InputAudioTranscriptionConfigCopyWith<$Res>(
        _self.inputAudioTranscription!, (value) {
      return _then(_self.copyWith(inputAudioTranscription: value));
    });
  }

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TurnDetectionCopyWith<$Res>? get turnDetection {
    if (_self.turnDetection == null) {
      return null;
    }

    return $TurnDetectionCopyWith<$Res>(_self.turnDetection!, (value) {
      return _then(_self.copyWith(turnDetection: value));
    });
  }

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionToolChoiceCopyWith<$Res>? get toolChoice {
    if (_self.toolChoice == null) {
      return null;
    }

    return $SessionToolChoiceCopyWith<$Res>(_self.toolChoice!, (value) {
      return _then(_self.copyWith(toolChoice: value));
    });
  }

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionMaxResponseOutputTokensCopyWith<$Res>? get maxResponseOutputTokens {
    if (_self.maxResponseOutputTokens == null) {
      return null;
    }

    return $SessionMaxResponseOutputTokensCopyWith<$Res>(
        _self.maxResponseOutputTokens!, (value) {
      return _then(_self.copyWith(maxResponseOutputTokens: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Session extends Session {
  const _Session(
      {@JsonKey(includeIfNull: false) this.id,
      this.object = ObjectType.realtimeSession,
      @JsonKey(includeIfNull: false) this.model,
      @JsonKey(name: 'expires_at', includeIfNull: false) this.expiresAt,
      @JsonKey(includeIfNull: false) final List<Modality>? modalities,
      @JsonKey(includeIfNull: false) this.instructions,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.voice,
      @JsonKey(
          name: 'input_audio_format',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.inputAudioFormat,
      @JsonKey(
          name: 'output_audio_format',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.outputAudioFormat,
      @JsonKey(name: 'input_audio_transcription', includeIfNull: false)
      this.inputAudioTranscription,
      @JsonKey(name: 'turn_detection', includeIfNull: false) this.turnDetection,
      @JsonKey(includeIfNull: false) final List<ToolDefinition>? tools,
      @_SessionToolChoiceConverter()
      @JsonKey(name: 'tool_choice', includeIfNull: false)
      this.toolChoice,
      @JsonKey(includeIfNull: false) this.temperature,
      @_SessionMaxResponseOutputTokensConverter()
      @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
      this.maxResponseOutputTokens})
      : _modalities = modalities,
        _tools = tools,
        super._();
  factory _Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  /// The unique ID of the session.
  @override
  @JsonKey(includeIfNull: false)
  final String? id;

  /// The object type, must be "realtime.session".
  @override
  @JsonKey()
  final ObjectType object;

  /// The default model used for this session.
  @override
  @JsonKey(includeIfNull: false)
  final String? model;

  /// The time at which the session expires.
  @override
  @JsonKey(name: 'expires_at', includeIfNull: false)
  final int? expiresAt;

  /// The set of modalities the model can respond with.
  final List<Modality>? _modalities;

  /// The set of modalities the model can respond with.
  @override
  @JsonKey(includeIfNull: false)
  List<Modality>? get modalities {
    final value = _modalities;
    if (value == null) return null;
    if (_modalities is EqualUnmodifiableListView) return _modalities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// The default system instructions.
  @override
  @JsonKey(includeIfNull: false)
  final String? instructions;

  /// The voice the model uses to respond. Voice cannot be changed during the
  /// session once the model has responded with audio at least once. Current
  /// voice options are `alloy`, `ash`, `ballad`, `coral`, `echo` `sage`,
  /// `shimmer` and `verse`.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final Voice? voice;

  /// The format of input audio.
  @override
  @JsonKey(
      name: 'input_audio_format',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final AudioFormat? inputAudioFormat;

  /// The format of output audio.
  @override
  @JsonKey(
      name: 'output_audio_format',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final AudioFormat? outputAudioFormat;

  /// Configuration for input audio transcription, defaults to off and can be  set to `null` to turn off
  /// once on. Input audio transcription is not native to the model, since the model consumes audio
  /// directly. Transcription runs  asynchronously through [the /audio/transcriptions
  /// endpoint](https://platform.openai.com/docs/api-reference/audio/createTranscription) and should be
  /// treated as guidance of input audio content rather than precisely what the model heard. The client
  /// can optionally set the language and prompt for transcription, these offer additional guidance to
  /// the transcription service.
  @override
  @JsonKey(name: 'input_audio_transcription', includeIfNull: false)
  final InputAudioTranscriptionConfig? inputAudioTranscription;

  /// Configuration for turn detection. Can be set to `null` to turn off. Server
  /// VAD means that the model will detect the start and end of speech based on
  /// audio volume and respond at the end of user speech.
  @override
  @JsonKey(name: 'turn_detection', includeIfNull: false)
  final TurnDetection? turnDetection;

  /// Tools (functions) available to the model.
  final List<ToolDefinition>? _tools;

  /// Tools (functions) available to the model.
  @override
  @JsonKey(includeIfNull: false)
  List<ToolDefinition>? get tools {
    final value = _tools;
    if (value == null) return null;
    if (_tools is EqualUnmodifiableListView) return _tools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// How the model chooses tools.
  @override
  @_SessionToolChoiceConverter()
  @JsonKey(name: 'tool_choice', includeIfNull: false)
  final SessionToolChoice? toolChoice;

  /// Sampling temperature.
  @override
  @JsonKey(includeIfNull: false)
  final double? temperature;

  /// Maximum number of output tokens for a single assistant response,
  /// inclusive of tool calls. Provide an integer between 1 and 4096 to
  /// limit output tokens, or `inf` for the maximum available tokens for a
  /// given model. Defaults to `inf`.
  @override
  @_SessionMaxResponseOutputTokensConverter()
  @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
  final SessionMaxResponseOutputTokens? maxResponseOutputTokens;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionCopyWith<_Session> get copyWith =>
      __$SessionCopyWithImpl<_Session>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Session &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            const DeepCollectionEquality()
                .equals(other._modalities, _modalities) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.voice, voice) || other.voice == voice) &&
            (identical(other.inputAudioFormat, inputAudioFormat) ||
                other.inputAudioFormat == inputAudioFormat) &&
            (identical(other.outputAudioFormat, outputAudioFormat) ||
                other.outputAudioFormat == outputAudioFormat) &&
            (identical(
                    other.inputAudioTranscription, inputAudioTranscription) ||
                other.inputAudioTranscription == inputAudioTranscription) &&
            (identical(other.turnDetection, turnDetection) ||
                other.turnDetection == turnDetection) &&
            const DeepCollectionEquality().equals(other._tools, _tools) &&
            (identical(other.toolChoice, toolChoice) ||
                other.toolChoice == toolChoice) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(
                    other.maxResponseOutputTokens, maxResponseOutputTokens) ||
                other.maxResponseOutputTokens == maxResponseOutputTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      object,
      model,
      expiresAt,
      const DeepCollectionEquality().hash(_modalities),
      instructions,
      voice,
      inputAudioFormat,
      outputAudioFormat,
      inputAudioTranscription,
      turnDetection,
      const DeepCollectionEquality().hash(_tools),
      toolChoice,
      temperature,
      maxResponseOutputTokens);

  @override
  String toString() {
    return 'Session(id: $id, object: $object, model: $model, expiresAt: $expiresAt, modalities: $modalities, instructions: $instructions, voice: $voice, inputAudioFormat: $inputAudioFormat, outputAudioFormat: $outputAudioFormat, inputAudioTranscription: $inputAudioTranscription, turnDetection: $turnDetection, tools: $tools, toolChoice: $toolChoice, temperature: $temperature, maxResponseOutputTokens: $maxResponseOutputTokens)';
  }
}

/// @nodoc
abstract mixin class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) _then) =
      __$SessionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? id,
      ObjectType object,
      @JsonKey(includeIfNull: false) String? model,
      @JsonKey(name: 'expires_at', includeIfNull: false) int? expiresAt,
      @JsonKey(includeIfNull: false) List<Modality>? modalities,
      @JsonKey(includeIfNull: false) String? instructions,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      Voice? voice,
      @JsonKey(
          name: 'input_audio_format',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      AudioFormat? inputAudioFormat,
      @JsonKey(
          name: 'output_audio_format',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      AudioFormat? outputAudioFormat,
      @JsonKey(name: 'input_audio_transcription', includeIfNull: false)
      InputAudioTranscriptionConfig? inputAudioTranscription,
      @JsonKey(name: 'turn_detection', includeIfNull: false)
      TurnDetection? turnDetection,
      @JsonKey(includeIfNull: false) List<ToolDefinition>? tools,
      @_SessionToolChoiceConverter()
      @JsonKey(name: 'tool_choice', includeIfNull: false)
      SessionToolChoice? toolChoice,
      @JsonKey(includeIfNull: false) double? temperature,
      @_SessionMaxResponseOutputTokensConverter()
      @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
      SessionMaxResponseOutputTokens? maxResponseOutputTokens});

  @override
  $InputAudioTranscriptionConfigCopyWith<$Res>? get inputAudioTranscription;
  @override
  $TurnDetectionCopyWith<$Res>? get turnDetection;
  @override
  $SessionToolChoiceCopyWith<$Res>? get toolChoice;
  @override
  $SessionMaxResponseOutputTokensCopyWith<$Res>? get maxResponseOutputTokens;
}

/// @nodoc
class __$SessionCopyWithImpl<$Res> implements _$SessionCopyWith<$Res> {
  __$SessionCopyWithImpl(this._self, this._then);

  final _Session _self;
  final $Res Function(_Session) _then;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? object = null,
    Object? model = freezed,
    Object? expiresAt = freezed,
    Object? modalities = freezed,
    Object? instructions = freezed,
    Object? voice = freezed,
    Object? inputAudioFormat = freezed,
    Object? outputAudioFormat = freezed,
    Object? inputAudioTranscription = freezed,
    Object? turnDetection = freezed,
    Object? tools = freezed,
    Object? toolChoice = freezed,
    Object? temperature = freezed,
    Object? maxResponseOutputTokens = freezed,
  }) {
    return _then(_Session(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      object: null == object
          ? _self.object
          : object // ignore: cast_nullable_to_non_nullable
              as ObjectType,
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
      modalities: freezed == modalities
          ? _self._modalities
          : modalities // ignore: cast_nullable_to_non_nullable
              as List<Modality>?,
      instructions: freezed == instructions
          ? _self.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      voice: freezed == voice
          ? _self.voice
          : voice // ignore: cast_nullable_to_non_nullable
              as Voice?,
      inputAudioFormat: freezed == inputAudioFormat
          ? _self.inputAudioFormat
          : inputAudioFormat // ignore: cast_nullable_to_non_nullable
              as AudioFormat?,
      outputAudioFormat: freezed == outputAudioFormat
          ? _self.outputAudioFormat
          : outputAudioFormat // ignore: cast_nullable_to_non_nullable
              as AudioFormat?,
      inputAudioTranscription: freezed == inputAudioTranscription
          ? _self.inputAudioTranscription
          : inputAudioTranscription // ignore: cast_nullable_to_non_nullable
              as InputAudioTranscriptionConfig?,
      turnDetection: freezed == turnDetection
          ? _self.turnDetection
          : turnDetection // ignore: cast_nullable_to_non_nullable
              as TurnDetection?,
      tools: freezed == tools
          ? _self._tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<ToolDefinition>?,
      toolChoice: freezed == toolChoice
          ? _self.toolChoice
          : toolChoice // ignore: cast_nullable_to_non_nullable
              as SessionToolChoice?,
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      maxResponseOutputTokens: freezed == maxResponseOutputTokens
          ? _self.maxResponseOutputTokens
          : maxResponseOutputTokens // ignore: cast_nullable_to_non_nullable
              as SessionMaxResponseOutputTokens?,
    ));
  }

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputAudioTranscriptionConfigCopyWith<$Res>? get inputAudioTranscription {
    if (_self.inputAudioTranscription == null) {
      return null;
    }

    return $InputAudioTranscriptionConfigCopyWith<$Res>(
        _self.inputAudioTranscription!, (value) {
      return _then(_self.copyWith(inputAudioTranscription: value));
    });
  }

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TurnDetectionCopyWith<$Res>? get turnDetection {
    if (_self.turnDetection == null) {
      return null;
    }

    return $TurnDetectionCopyWith<$Res>(_self.turnDetection!, (value) {
      return _then(_self.copyWith(turnDetection: value));
    });
  }

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionToolChoiceCopyWith<$Res>? get toolChoice {
    if (_self.toolChoice == null) {
      return null;
    }

    return $SessionToolChoiceCopyWith<$Res>(_self.toolChoice!, (value) {
      return _then(_self.copyWith(toolChoice: value));
    });
  }

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionMaxResponseOutputTokensCopyWith<$Res>? get maxResponseOutputTokens {
    if (_self.maxResponseOutputTokens == null) {
      return null;
    }

    return $SessionMaxResponseOutputTokensCopyWith<$Res>(
        _self.maxResponseOutputTokens!, (value) {
      return _then(_self.copyWith(maxResponseOutputTokens: value));
    });
  }
}

SessionToolChoice _$SessionToolChoiceFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'mode':
      return SessionToolChoiceEnumeration.fromJson(json);
    case 'toolChoiceForced':
      return SessionToolChoiceToolChoiceForced.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SessionToolChoice',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SessionToolChoice {
  Object get value;

  /// Serializes this SessionToolChoice to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionToolChoice &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'SessionToolChoice(value: $value)';
  }
}

/// @nodoc
class $SessionToolChoiceCopyWith<$Res> {
  $SessionToolChoiceCopyWith(
      SessionToolChoice _, $Res Function(SessionToolChoice) __);
}

/// @nodoc
@JsonSerializable()
class SessionToolChoiceEnumeration extends SessionToolChoice {
  const SessionToolChoiceEnumeration(this.value, {final String? $type})
      : $type = $type ?? 'mode',
        super._();
  factory SessionToolChoiceEnumeration.fromJson(Map<String, dynamic> json) =>
      _$SessionToolChoiceEnumerationFromJson(json);

  @override
  final SessionToolChoiceMode value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SessionToolChoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionToolChoiceEnumerationCopyWith<SessionToolChoiceEnumeration>
      get copyWith => _$SessionToolChoiceEnumerationCopyWithImpl<
          SessionToolChoiceEnumeration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionToolChoiceEnumerationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionToolChoiceEnumeration &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'SessionToolChoice.mode(value: $value)';
  }
}

/// @nodoc
abstract mixin class $SessionToolChoiceEnumerationCopyWith<$Res>
    implements $SessionToolChoiceCopyWith<$Res> {
  factory $SessionToolChoiceEnumerationCopyWith(
          SessionToolChoiceEnumeration value,
          $Res Function(SessionToolChoiceEnumeration) _then) =
      _$SessionToolChoiceEnumerationCopyWithImpl;
  @useResult
  $Res call({SessionToolChoiceMode value});
}

/// @nodoc
class _$SessionToolChoiceEnumerationCopyWithImpl<$Res>
    implements $SessionToolChoiceEnumerationCopyWith<$Res> {
  _$SessionToolChoiceEnumerationCopyWithImpl(this._self, this._then);

  final SessionToolChoiceEnumeration _self;
  final $Res Function(SessionToolChoiceEnumeration) _then;

  /// Create a copy of SessionToolChoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(SessionToolChoiceEnumeration(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as SessionToolChoiceMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class SessionToolChoiceToolChoiceForced extends SessionToolChoice {
  const SessionToolChoiceToolChoiceForced(this.value, {final String? $type})
      : $type = $type ?? 'toolChoiceForced',
        super._();
  factory SessionToolChoiceToolChoiceForced.fromJson(
          Map<String, dynamic> json) =>
      _$SessionToolChoiceToolChoiceForcedFromJson(json);

  @override
  final ToolChoiceForced value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SessionToolChoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionToolChoiceToolChoiceForcedCopyWith<SessionToolChoiceToolChoiceForced>
      get copyWith => _$SessionToolChoiceToolChoiceForcedCopyWithImpl<
          SessionToolChoiceToolChoiceForced>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionToolChoiceToolChoiceForcedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionToolChoiceToolChoiceForced &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'SessionToolChoice.toolChoiceForced(value: $value)';
  }
}

/// @nodoc
abstract mixin class $SessionToolChoiceToolChoiceForcedCopyWith<$Res>
    implements $SessionToolChoiceCopyWith<$Res> {
  factory $SessionToolChoiceToolChoiceForcedCopyWith(
          SessionToolChoiceToolChoiceForced value,
          $Res Function(SessionToolChoiceToolChoiceForced) _then) =
      _$SessionToolChoiceToolChoiceForcedCopyWithImpl;
  @useResult
  $Res call({ToolChoiceForced value});

  $ToolChoiceForcedCopyWith<$Res> get value;
}

/// @nodoc
class _$SessionToolChoiceToolChoiceForcedCopyWithImpl<$Res>
    implements $SessionToolChoiceToolChoiceForcedCopyWith<$Res> {
  _$SessionToolChoiceToolChoiceForcedCopyWithImpl(this._self, this._then);

  final SessionToolChoiceToolChoiceForced _self;
  final $Res Function(SessionToolChoiceToolChoiceForced) _then;

  /// Create a copy of SessionToolChoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(SessionToolChoiceToolChoiceForced(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as ToolChoiceForced,
    ));
  }

  /// Create a copy of SessionToolChoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ToolChoiceForcedCopyWith<$Res> get value {
    return $ToolChoiceForcedCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

SessionMaxResponseOutputTokens _$SessionMaxResponseOutputTokensFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'int':
      return SessionMaxResponseOutputTokensInt.fromJson(json);
    case 'string':
      return SessionMaxResponseOutputTokensString.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'SessionMaxResponseOutputTokens',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SessionMaxResponseOutputTokens {
  Object get value;

  /// Serializes this SessionMaxResponseOutputTokens to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionMaxResponseOutputTokens &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'SessionMaxResponseOutputTokens(value: $value)';
  }
}

/// @nodoc
class $SessionMaxResponseOutputTokensCopyWith<$Res> {
  $SessionMaxResponseOutputTokensCopyWith(SessionMaxResponseOutputTokens _,
      $Res Function(SessionMaxResponseOutputTokens) __);
}

/// @nodoc
@JsonSerializable()
class SessionMaxResponseOutputTokensInt extends SessionMaxResponseOutputTokens {
  const SessionMaxResponseOutputTokensInt(this.value, {final String? $type})
      : $type = $type ?? 'int',
        super._();
  factory SessionMaxResponseOutputTokensInt.fromJson(
          Map<String, dynamic> json) =>
      _$SessionMaxResponseOutputTokensIntFromJson(json);

  @override
  final int value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SessionMaxResponseOutputTokens
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionMaxResponseOutputTokensIntCopyWith<SessionMaxResponseOutputTokensInt>
      get copyWith => _$SessionMaxResponseOutputTokensIntCopyWithImpl<
          SessionMaxResponseOutputTokensInt>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionMaxResponseOutputTokensIntToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionMaxResponseOutputTokensInt &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'SessionMaxResponseOutputTokens.int(value: $value)';
  }
}

/// @nodoc
abstract mixin class $SessionMaxResponseOutputTokensIntCopyWith<$Res>
    implements $SessionMaxResponseOutputTokensCopyWith<$Res> {
  factory $SessionMaxResponseOutputTokensIntCopyWith(
          SessionMaxResponseOutputTokensInt value,
          $Res Function(SessionMaxResponseOutputTokensInt) _then) =
      _$SessionMaxResponseOutputTokensIntCopyWithImpl;
  @useResult
  $Res call({int value});
}

/// @nodoc
class _$SessionMaxResponseOutputTokensIntCopyWithImpl<$Res>
    implements $SessionMaxResponseOutputTokensIntCopyWith<$Res> {
  _$SessionMaxResponseOutputTokensIntCopyWithImpl(this._self, this._then);

  final SessionMaxResponseOutputTokensInt _self;
  final $Res Function(SessionMaxResponseOutputTokensInt) _then;

  /// Create a copy of SessionMaxResponseOutputTokens
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(SessionMaxResponseOutputTokensInt(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class SessionMaxResponseOutputTokensString
    extends SessionMaxResponseOutputTokens {
  const SessionMaxResponseOutputTokensString(this.value, {final String? $type})
      : $type = $type ?? 'string',
        super._();
  factory SessionMaxResponseOutputTokensString.fromJson(
          Map<String, dynamic> json) =>
      _$SessionMaxResponseOutputTokensStringFromJson(json);

  @override
  final String value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SessionMaxResponseOutputTokens
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionMaxResponseOutputTokensStringCopyWith<
          SessionMaxResponseOutputTokensString>
      get copyWith => _$SessionMaxResponseOutputTokensStringCopyWithImpl<
          SessionMaxResponseOutputTokensString>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionMaxResponseOutputTokensStringToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionMaxResponseOutputTokensString &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'SessionMaxResponseOutputTokens.string(value: $value)';
  }
}

/// @nodoc
abstract mixin class $SessionMaxResponseOutputTokensStringCopyWith<$Res>
    implements $SessionMaxResponseOutputTokensCopyWith<$Res> {
  factory $SessionMaxResponseOutputTokensStringCopyWith(
          SessionMaxResponseOutputTokensString value,
          $Res Function(SessionMaxResponseOutputTokensString) _then) =
      _$SessionMaxResponseOutputTokensStringCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$SessionMaxResponseOutputTokensStringCopyWithImpl<$Res>
    implements $SessionMaxResponseOutputTokensStringCopyWith<$Res> {
  _$SessionMaxResponseOutputTokensStringCopyWithImpl(this._self, this._then);

  final SessionMaxResponseOutputTokensString _self;
  final $Res Function(SessionMaxResponseOutputTokensString) _then;

  /// Create a copy of SessionMaxResponseOutputTokens
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(SessionMaxResponseOutputTokensString(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$SessionConfig {
  /// Ephemeral key returned by the API.
  @JsonKey(name: 'client_secret', includeIfNull: false)
  SessionConfigClientSecret? get clientSecret;

  /// The set of modalities the model can respond with. To disable audio, set this to ["text"].
  @JsonKey(includeIfNull: false)
  List<Modality>? get modalities;

  /// The default system instructions (i.e. system message) prepended to model
  /// calls. This field allows the client to guide the model on desired
  /// responses. The model can be instructed on response content and format,
  /// (e.g. "be extremely succinct", "act friendly", "here are examples of good
  /// responses") and on audio behavior (e.g. "talk quickly", "inject emotion
  /// into your voice", "laugh frequently"). The instructions are not guaranteed
  /// to be followed by the model, but they provide guidance to the model on the
  /// desired behavior.
  ///
  /// Note that the server sets default instructions which will be used if this
  /// field is not set and are visible in the `session.created` event at the
  /// start of the session.
  @JsonKey(includeIfNull: false)
  String? get instructions;

  /// The voice the model uses to respond. Voice cannot be changed during the
  /// session once the model has responded with audio at least once. Current
  /// voice options are `alloy`, `ash`, `ballad`, `coral`, `echo` `sage`,
  /// `shimmer` and `verse`.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  Voice? get voice;

  /// The format of input audio. Options are `pcm16`, `g711_ulaw`, or `g711_alaw`.
  @JsonKey(
      name: 'input_audio_format',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  AudioFormat? get inputAudioFormat;

  /// The format of output audio. Options are `pcm16`, `g711_ulaw`, or `g711_alaw`.
  @JsonKey(
      name: 'output_audio_format',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  AudioFormat? get outputAudioFormat;

  /// Configuration for input audio transcription, defaults to off and can be  set to `null` to turn off
  /// once on. Input audio transcription is not native to the model, since the model consumes audio
  /// directly. Transcription runs  asynchronously through [the /audio/transcriptions
  /// endpoint](https://platform.openai.com/docs/api-reference/audio/createTranscription) and should be
  /// treated as guidance of input audio content rather than precisely what the model heard. The client
  /// can optionally set the language and prompt for transcription, these offer additional guidance to
  /// the transcription service.
  @JsonKey(name: 'input_audio_transcription', includeIfNull: false)
  InputAudioTranscriptionConfig? get inputAudioTranscription;

  /// Configuration for turn detection. Can be set to `null` to turn off. Server
  /// VAD means that the model will detect the start and end of speech based on
  /// audio volume and respond at the end of user speech.
  @JsonKey(name: 'turn_detection')
  TurnDetection? get turnDetection;

  /// Tools (functions) available to the model.
  @JsonKey(includeIfNull: false)
  List<ToolDefinition>? get tools;

  /// How the model chooses tools. Options are `auto`, `none`, `required`, or
  /// specify a function.
  @_SessionConfigToolChoiceConverter()
  @JsonKey(name: 'tool_choice', includeIfNull: false)
  SessionConfigToolChoice? get toolChoice;

  /// Sampling temperature for the model, limited to [0.6, 1.2]. Defaults to 0.8.
  @JsonKey(includeIfNull: false)
  double? get temperature;

  /// Maximum number of output tokens for a single assistant response,
  /// inclusive of tool calls. Provide an integer between 1 and 4096 to
  /// limit output tokens, or `inf` for the maximum available tokens for a
  /// given model. Defaults to `inf`.
  @_SessionConfigMaxResponseOutputTokensConverter()
  @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
  SessionConfigMaxResponseOutputTokens? get maxResponseOutputTokens;

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionConfigCopyWith<SessionConfig> get copyWith =>
      _$SessionConfigCopyWithImpl<SessionConfig>(
          this as SessionConfig, _$identity);

  /// Serializes this SessionConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionConfig &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret) &&
            const DeepCollectionEquality()
                .equals(other.modalities, modalities) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.voice, voice) || other.voice == voice) &&
            (identical(other.inputAudioFormat, inputAudioFormat) ||
                other.inputAudioFormat == inputAudioFormat) &&
            (identical(other.outputAudioFormat, outputAudioFormat) ||
                other.outputAudioFormat == outputAudioFormat) &&
            (identical(
                    other.inputAudioTranscription, inputAudioTranscription) ||
                other.inputAudioTranscription == inputAudioTranscription) &&
            (identical(other.turnDetection, turnDetection) ||
                other.turnDetection == turnDetection) &&
            const DeepCollectionEquality().equals(other.tools, tools) &&
            (identical(other.toolChoice, toolChoice) ||
                other.toolChoice == toolChoice) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(
                    other.maxResponseOutputTokens, maxResponseOutputTokens) ||
                other.maxResponseOutputTokens == maxResponseOutputTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientSecret,
      const DeepCollectionEquality().hash(modalities),
      instructions,
      voice,
      inputAudioFormat,
      outputAudioFormat,
      inputAudioTranscription,
      turnDetection,
      const DeepCollectionEquality().hash(tools),
      toolChoice,
      temperature,
      maxResponseOutputTokens);

  @override
  String toString() {
    return 'SessionConfig(clientSecret: $clientSecret, modalities: $modalities, instructions: $instructions, voice: $voice, inputAudioFormat: $inputAudioFormat, outputAudioFormat: $outputAudioFormat, inputAudioTranscription: $inputAudioTranscription, turnDetection: $turnDetection, tools: $tools, toolChoice: $toolChoice, temperature: $temperature, maxResponseOutputTokens: $maxResponseOutputTokens)';
  }
}

/// @nodoc
abstract mixin class $SessionConfigCopyWith<$Res> {
  factory $SessionConfigCopyWith(
          SessionConfig value, $Res Function(SessionConfig) _then) =
      _$SessionConfigCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'client_secret', includeIfNull: false)
      SessionConfigClientSecret? clientSecret,
      @JsonKey(includeIfNull: false) List<Modality>? modalities,
      @JsonKey(includeIfNull: false) String? instructions,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      Voice? voice,
      @JsonKey(
          name: 'input_audio_format',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      AudioFormat? inputAudioFormat,
      @JsonKey(
          name: 'output_audio_format',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      AudioFormat? outputAudioFormat,
      @JsonKey(name: 'input_audio_transcription', includeIfNull: false)
      InputAudioTranscriptionConfig? inputAudioTranscription,
      @JsonKey(name: 'turn_detection') TurnDetection? turnDetection,
      @JsonKey(includeIfNull: false) List<ToolDefinition>? tools,
      @_SessionConfigToolChoiceConverter()
      @JsonKey(name: 'tool_choice', includeIfNull: false)
      SessionConfigToolChoice? toolChoice,
      @JsonKey(includeIfNull: false) double? temperature,
      @_SessionConfigMaxResponseOutputTokensConverter()
      @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
      SessionConfigMaxResponseOutputTokens? maxResponseOutputTokens});

  $SessionConfigClientSecretCopyWith<$Res>? get clientSecret;
  $InputAudioTranscriptionConfigCopyWith<$Res>? get inputAudioTranscription;
  $TurnDetectionCopyWith<$Res>? get turnDetection;
  $SessionConfigToolChoiceCopyWith<$Res>? get toolChoice;
  $SessionConfigMaxResponseOutputTokensCopyWith<$Res>?
      get maxResponseOutputTokens;
}

/// @nodoc
class _$SessionConfigCopyWithImpl<$Res>
    implements $SessionConfigCopyWith<$Res> {
  _$SessionConfigCopyWithImpl(this._self, this._then);

  final SessionConfig _self;
  final $Res Function(SessionConfig) _then;

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientSecret = freezed,
    Object? modalities = freezed,
    Object? instructions = freezed,
    Object? voice = freezed,
    Object? inputAudioFormat = freezed,
    Object? outputAudioFormat = freezed,
    Object? inputAudioTranscription = freezed,
    Object? turnDetection = freezed,
    Object? tools = freezed,
    Object? toolChoice = freezed,
    Object? temperature = freezed,
    Object? maxResponseOutputTokens = freezed,
  }) {
    return _then(_self.copyWith(
      clientSecret: freezed == clientSecret
          ? _self.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as SessionConfigClientSecret?,
      modalities: freezed == modalities
          ? _self.modalities
          : modalities // ignore: cast_nullable_to_non_nullable
              as List<Modality>?,
      instructions: freezed == instructions
          ? _self.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      voice: freezed == voice
          ? _self.voice
          : voice // ignore: cast_nullable_to_non_nullable
              as Voice?,
      inputAudioFormat: freezed == inputAudioFormat
          ? _self.inputAudioFormat
          : inputAudioFormat // ignore: cast_nullable_to_non_nullable
              as AudioFormat?,
      outputAudioFormat: freezed == outputAudioFormat
          ? _self.outputAudioFormat
          : outputAudioFormat // ignore: cast_nullable_to_non_nullable
              as AudioFormat?,
      inputAudioTranscription: freezed == inputAudioTranscription
          ? _self.inputAudioTranscription
          : inputAudioTranscription // ignore: cast_nullable_to_non_nullable
              as InputAudioTranscriptionConfig?,
      turnDetection: freezed == turnDetection
          ? _self.turnDetection
          : turnDetection // ignore: cast_nullable_to_non_nullable
              as TurnDetection?,
      tools: freezed == tools
          ? _self.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<ToolDefinition>?,
      toolChoice: freezed == toolChoice
          ? _self.toolChoice
          : toolChoice // ignore: cast_nullable_to_non_nullable
              as SessionConfigToolChoice?,
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      maxResponseOutputTokens: freezed == maxResponseOutputTokens
          ? _self.maxResponseOutputTokens
          : maxResponseOutputTokens // ignore: cast_nullable_to_non_nullable
              as SessionConfigMaxResponseOutputTokens?,
    ));
  }

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionConfigClientSecretCopyWith<$Res>? get clientSecret {
    if (_self.clientSecret == null) {
      return null;
    }

    return $SessionConfigClientSecretCopyWith<$Res>(_self.clientSecret!,
        (value) {
      return _then(_self.copyWith(clientSecret: value));
    });
  }

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputAudioTranscriptionConfigCopyWith<$Res>? get inputAudioTranscription {
    if (_self.inputAudioTranscription == null) {
      return null;
    }

    return $InputAudioTranscriptionConfigCopyWith<$Res>(
        _self.inputAudioTranscription!, (value) {
      return _then(_self.copyWith(inputAudioTranscription: value));
    });
  }

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TurnDetectionCopyWith<$Res>? get turnDetection {
    if (_self.turnDetection == null) {
      return null;
    }

    return $TurnDetectionCopyWith<$Res>(_self.turnDetection!, (value) {
      return _then(_self.copyWith(turnDetection: value));
    });
  }

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionConfigToolChoiceCopyWith<$Res>? get toolChoice {
    if (_self.toolChoice == null) {
      return null;
    }

    return $SessionConfigToolChoiceCopyWith<$Res>(_self.toolChoice!, (value) {
      return _then(_self.copyWith(toolChoice: value));
    });
  }

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionConfigMaxResponseOutputTokensCopyWith<$Res>?
      get maxResponseOutputTokens {
    if (_self.maxResponseOutputTokens == null) {
      return null;
    }

    return $SessionConfigMaxResponseOutputTokensCopyWith<$Res>(
        _self.maxResponseOutputTokens!, (value) {
      return _then(_self.copyWith(maxResponseOutputTokens: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _SessionConfig extends SessionConfig {
  const _SessionConfig(
      {@JsonKey(name: 'client_secret', includeIfNull: false) this.clientSecret,
      @JsonKey(includeIfNull: false) final List<Modality>? modalities,
      @JsonKey(includeIfNull: false) this.instructions,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.voice,
      @JsonKey(
          name: 'input_audio_format',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.inputAudioFormat,
      @JsonKey(
          name: 'output_audio_format',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.outputAudioFormat,
      @JsonKey(name: 'input_audio_transcription', includeIfNull: false)
      this.inputAudioTranscription,
      @JsonKey(name: 'turn_detection') required this.turnDetection,
      @JsonKey(includeIfNull: false) final List<ToolDefinition>? tools,
      @_SessionConfigToolChoiceConverter()
      @JsonKey(name: 'tool_choice', includeIfNull: false)
      this.toolChoice,
      @JsonKey(includeIfNull: false) this.temperature,
      @_SessionConfigMaxResponseOutputTokensConverter()
      @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
      this.maxResponseOutputTokens})
      : _modalities = modalities,
        _tools = tools,
        super._();
  factory _SessionConfig.fromJson(Map<String, dynamic> json) =>
      _$SessionConfigFromJson(json);

  /// Ephemeral key returned by the API.
  @override
  @JsonKey(name: 'client_secret', includeIfNull: false)
  final SessionConfigClientSecret? clientSecret;

  /// The set of modalities the model can respond with. To disable audio, set this to ["text"].
  final List<Modality>? _modalities;

  /// The set of modalities the model can respond with. To disable audio, set this to ["text"].
  @override
  @JsonKey(includeIfNull: false)
  List<Modality>? get modalities {
    final value = _modalities;
    if (value == null) return null;
    if (_modalities is EqualUnmodifiableListView) return _modalities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// The default system instructions (i.e. system message) prepended to model
  /// calls. This field allows the client to guide the model on desired
  /// responses. The model can be instructed on response content and format,
  /// (e.g. "be extremely succinct", "act friendly", "here are examples of good
  /// responses") and on audio behavior (e.g. "talk quickly", "inject emotion
  /// into your voice", "laugh frequently"). The instructions are not guaranteed
  /// to be followed by the model, but they provide guidance to the model on the
  /// desired behavior.
  ///
  /// Note that the server sets default instructions which will be used if this
  /// field is not set and are visible in the `session.created` event at the
  /// start of the session.
  @override
  @JsonKey(includeIfNull: false)
  final String? instructions;

  /// The voice the model uses to respond. Voice cannot be changed during the
  /// session once the model has responded with audio at least once. Current
  /// voice options are `alloy`, `ash`, `ballad`, `coral`, `echo` `sage`,
  /// `shimmer` and `verse`.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final Voice? voice;

  /// The format of input audio. Options are `pcm16`, `g711_ulaw`, or `g711_alaw`.
  @override
  @JsonKey(
      name: 'input_audio_format',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final AudioFormat? inputAudioFormat;

  /// The format of output audio. Options are `pcm16`, `g711_ulaw`, or `g711_alaw`.
  @override
  @JsonKey(
      name: 'output_audio_format',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final AudioFormat? outputAudioFormat;

  /// Configuration for input audio transcription, defaults to off and can be  set to `null` to turn off
  /// once on. Input audio transcription is not native to the model, since the model consumes audio
  /// directly. Transcription runs  asynchronously through [the /audio/transcriptions
  /// endpoint](https://platform.openai.com/docs/api-reference/audio/createTranscription) and should be
  /// treated as guidance of input audio content rather than precisely what the model heard. The client
  /// can optionally set the language and prompt for transcription, these offer additional guidance to
  /// the transcription service.
  @override
  @JsonKey(name: 'input_audio_transcription', includeIfNull: false)
  final InputAudioTranscriptionConfig? inputAudioTranscription;

  /// Configuration for turn detection. Can be set to `null` to turn off. Server
  /// VAD means that the model will detect the start and end of speech based on
  /// audio volume and respond at the end of user speech.
  @override
  @JsonKey(name: 'turn_detection')
  final TurnDetection? turnDetection;

  /// Tools (functions) available to the model.
  final List<ToolDefinition>? _tools;

  /// Tools (functions) available to the model.
  @override
  @JsonKey(includeIfNull: false)
  List<ToolDefinition>? get tools {
    final value = _tools;
    if (value == null) return null;
    if (_tools is EqualUnmodifiableListView) return _tools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// How the model chooses tools. Options are `auto`, `none`, `required`, or
  /// specify a function.
  @override
  @_SessionConfigToolChoiceConverter()
  @JsonKey(name: 'tool_choice', includeIfNull: false)
  final SessionConfigToolChoice? toolChoice;

  /// Sampling temperature for the model, limited to [0.6, 1.2]. Defaults to 0.8.
  @override
  @JsonKey(includeIfNull: false)
  final double? temperature;

  /// Maximum number of output tokens for a single assistant response,
  /// inclusive of tool calls. Provide an integer between 1 and 4096 to
  /// limit output tokens, or `inf` for the maximum available tokens for a
  /// given model. Defaults to `inf`.
  @override
  @_SessionConfigMaxResponseOutputTokensConverter()
  @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
  final SessionConfigMaxResponseOutputTokens? maxResponseOutputTokens;

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionConfigCopyWith<_SessionConfig> get copyWith =>
      __$SessionConfigCopyWithImpl<_SessionConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SessionConfig &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret) &&
            const DeepCollectionEquality()
                .equals(other._modalities, _modalities) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.voice, voice) || other.voice == voice) &&
            (identical(other.inputAudioFormat, inputAudioFormat) ||
                other.inputAudioFormat == inputAudioFormat) &&
            (identical(other.outputAudioFormat, outputAudioFormat) ||
                other.outputAudioFormat == outputAudioFormat) &&
            (identical(
                    other.inputAudioTranscription, inputAudioTranscription) ||
                other.inputAudioTranscription == inputAudioTranscription) &&
            (identical(other.turnDetection, turnDetection) ||
                other.turnDetection == turnDetection) &&
            const DeepCollectionEquality().equals(other._tools, _tools) &&
            (identical(other.toolChoice, toolChoice) ||
                other.toolChoice == toolChoice) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(
                    other.maxResponseOutputTokens, maxResponseOutputTokens) ||
                other.maxResponseOutputTokens == maxResponseOutputTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientSecret,
      const DeepCollectionEquality().hash(_modalities),
      instructions,
      voice,
      inputAudioFormat,
      outputAudioFormat,
      inputAudioTranscription,
      turnDetection,
      const DeepCollectionEquality().hash(_tools),
      toolChoice,
      temperature,
      maxResponseOutputTokens);

  @override
  String toString() {
    return 'SessionConfig(clientSecret: $clientSecret, modalities: $modalities, instructions: $instructions, voice: $voice, inputAudioFormat: $inputAudioFormat, outputAudioFormat: $outputAudioFormat, inputAudioTranscription: $inputAudioTranscription, turnDetection: $turnDetection, tools: $tools, toolChoice: $toolChoice, temperature: $temperature, maxResponseOutputTokens: $maxResponseOutputTokens)';
  }
}

/// @nodoc
abstract mixin class _$SessionConfigCopyWith<$Res>
    implements $SessionConfigCopyWith<$Res> {
  factory _$SessionConfigCopyWith(
          _SessionConfig value, $Res Function(_SessionConfig) _then) =
      __$SessionConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'client_secret', includeIfNull: false)
      SessionConfigClientSecret? clientSecret,
      @JsonKey(includeIfNull: false) List<Modality>? modalities,
      @JsonKey(includeIfNull: false) String? instructions,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      Voice? voice,
      @JsonKey(
          name: 'input_audio_format',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      AudioFormat? inputAudioFormat,
      @JsonKey(
          name: 'output_audio_format',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      AudioFormat? outputAudioFormat,
      @JsonKey(name: 'input_audio_transcription', includeIfNull: false)
      InputAudioTranscriptionConfig? inputAudioTranscription,
      @JsonKey(name: 'turn_detection') TurnDetection? turnDetection,
      @JsonKey(includeIfNull: false) List<ToolDefinition>? tools,
      @_SessionConfigToolChoiceConverter()
      @JsonKey(name: 'tool_choice', includeIfNull: false)
      SessionConfigToolChoice? toolChoice,
      @JsonKey(includeIfNull: false) double? temperature,
      @_SessionConfigMaxResponseOutputTokensConverter()
      @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
      SessionConfigMaxResponseOutputTokens? maxResponseOutputTokens});

  @override
  $SessionConfigClientSecretCopyWith<$Res>? get clientSecret;
  @override
  $InputAudioTranscriptionConfigCopyWith<$Res>? get inputAudioTranscription;
  @override
  $TurnDetectionCopyWith<$Res>? get turnDetection;
  @override
  $SessionConfigToolChoiceCopyWith<$Res>? get toolChoice;
  @override
  $SessionConfigMaxResponseOutputTokensCopyWith<$Res>?
      get maxResponseOutputTokens;
}

/// @nodoc
class __$SessionConfigCopyWithImpl<$Res>
    implements _$SessionConfigCopyWith<$Res> {
  __$SessionConfigCopyWithImpl(this._self, this._then);

  final _SessionConfig _self;
  final $Res Function(_SessionConfig) _then;

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? clientSecret = freezed,
    Object? modalities = freezed,
    Object? instructions = freezed,
    Object? voice = freezed,
    Object? inputAudioFormat = freezed,
    Object? outputAudioFormat = freezed,
    Object? inputAudioTranscription = freezed,
    Object? turnDetection = freezed,
    Object? tools = freezed,
    Object? toolChoice = freezed,
    Object? temperature = freezed,
    Object? maxResponseOutputTokens = freezed,
  }) {
    return _then(_SessionConfig(
      clientSecret: freezed == clientSecret
          ? _self.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as SessionConfigClientSecret?,
      modalities: freezed == modalities
          ? _self._modalities
          : modalities // ignore: cast_nullable_to_non_nullable
              as List<Modality>?,
      instructions: freezed == instructions
          ? _self.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      voice: freezed == voice
          ? _self.voice
          : voice // ignore: cast_nullable_to_non_nullable
              as Voice?,
      inputAudioFormat: freezed == inputAudioFormat
          ? _self.inputAudioFormat
          : inputAudioFormat // ignore: cast_nullable_to_non_nullable
              as AudioFormat?,
      outputAudioFormat: freezed == outputAudioFormat
          ? _self.outputAudioFormat
          : outputAudioFormat // ignore: cast_nullable_to_non_nullable
              as AudioFormat?,
      inputAudioTranscription: freezed == inputAudioTranscription
          ? _self.inputAudioTranscription
          : inputAudioTranscription // ignore: cast_nullable_to_non_nullable
              as InputAudioTranscriptionConfig?,
      turnDetection: freezed == turnDetection
          ? _self.turnDetection
          : turnDetection // ignore: cast_nullable_to_non_nullable
              as TurnDetection?,
      tools: freezed == tools
          ? _self._tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<ToolDefinition>?,
      toolChoice: freezed == toolChoice
          ? _self.toolChoice
          : toolChoice // ignore: cast_nullable_to_non_nullable
              as SessionConfigToolChoice?,
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      maxResponseOutputTokens: freezed == maxResponseOutputTokens
          ? _self.maxResponseOutputTokens
          : maxResponseOutputTokens // ignore: cast_nullable_to_non_nullable
              as SessionConfigMaxResponseOutputTokens?,
    ));
  }

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionConfigClientSecretCopyWith<$Res>? get clientSecret {
    if (_self.clientSecret == null) {
      return null;
    }

    return $SessionConfigClientSecretCopyWith<$Res>(_self.clientSecret!,
        (value) {
      return _then(_self.copyWith(clientSecret: value));
    });
  }

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputAudioTranscriptionConfigCopyWith<$Res>? get inputAudioTranscription {
    if (_self.inputAudioTranscription == null) {
      return null;
    }

    return $InputAudioTranscriptionConfigCopyWith<$Res>(
        _self.inputAudioTranscription!, (value) {
      return _then(_self.copyWith(inputAudioTranscription: value));
    });
  }

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TurnDetectionCopyWith<$Res>? get turnDetection {
    if (_self.turnDetection == null) {
      return null;
    }

    return $TurnDetectionCopyWith<$Res>(_self.turnDetection!, (value) {
      return _then(_self.copyWith(turnDetection: value));
    });
  }

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionConfigToolChoiceCopyWith<$Res>? get toolChoice {
    if (_self.toolChoice == null) {
      return null;
    }

    return $SessionConfigToolChoiceCopyWith<$Res>(_self.toolChoice!, (value) {
      return _then(_self.copyWith(toolChoice: value));
    });
  }

  /// Create a copy of SessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionConfigMaxResponseOutputTokensCopyWith<$Res>?
      get maxResponseOutputTokens {
    if (_self.maxResponseOutputTokens == null) {
      return null;
    }

    return $SessionConfigMaxResponseOutputTokensCopyWith<$Res>(
        _self.maxResponseOutputTokens!, (value) {
      return _then(_self.copyWith(maxResponseOutputTokens: value));
    });
  }
}

/// @nodoc
mixin _$SessionConfigClientSecret {
  /// Ephemeral key usable in client environments to authenticate connections
  /// to the Realtime API. Use this in client-side environments rather than
  /// a standard API token, which should only be used server-side.
  @JsonKey(includeIfNull: false)
  String? get value;

  /// Timestamp for when the token expires. Currently, all tokens expire
  /// after one minute.
  @JsonKey(name: 'expires_at', includeIfNull: false)
  int? get expiresAt;

  /// Create a copy of SessionConfigClientSecret
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionConfigClientSecretCopyWith<SessionConfigClientSecret> get copyWith =>
      _$SessionConfigClientSecretCopyWithImpl<SessionConfigClientSecret>(
          this as SessionConfigClientSecret, _$identity);

  /// Serializes this SessionConfigClientSecret to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionConfigClientSecret &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, expiresAt);

  @override
  String toString() {
    return 'SessionConfigClientSecret(value: $value, expiresAt: $expiresAt)';
  }
}

/// @nodoc
abstract mixin class $SessionConfigClientSecretCopyWith<$Res> {
  factory $SessionConfigClientSecretCopyWith(SessionConfigClientSecret value,
          $Res Function(SessionConfigClientSecret) _then) =
      _$SessionConfigClientSecretCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? value,
      @JsonKey(name: 'expires_at', includeIfNull: false) int? expiresAt});
}

/// @nodoc
class _$SessionConfigClientSecretCopyWithImpl<$Res>
    implements $SessionConfigClientSecretCopyWith<$Res> {
  _$SessionConfigClientSecretCopyWithImpl(this._self, this._then);

  final SessionConfigClientSecret _self;
  final $Res Function(SessionConfigClientSecret) _then;

  /// Create a copy of SessionConfigClientSecret
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_self.copyWith(
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SessionConfigClientSecret extends SessionConfigClientSecret {
  const _SessionConfigClientSecret(
      {@JsonKey(includeIfNull: false) this.value,
      @JsonKey(name: 'expires_at', includeIfNull: false) this.expiresAt})
      : super._();
  factory _SessionConfigClientSecret.fromJson(Map<String, dynamic> json) =>
      _$SessionConfigClientSecretFromJson(json);

  /// Ephemeral key usable in client environments to authenticate connections
  /// to the Realtime API. Use this in client-side environments rather than
  /// a standard API token, which should only be used server-side.
  @override
  @JsonKey(includeIfNull: false)
  final String? value;

  /// Timestamp for when the token expires. Currently, all tokens expire
  /// after one minute.
  @override
  @JsonKey(name: 'expires_at', includeIfNull: false)
  final int? expiresAt;

  /// Create a copy of SessionConfigClientSecret
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionConfigClientSecretCopyWith<_SessionConfigClientSecret>
      get copyWith =>
          __$SessionConfigClientSecretCopyWithImpl<_SessionConfigClientSecret>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionConfigClientSecretToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SessionConfigClientSecret &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, expiresAt);

  @override
  String toString() {
    return 'SessionConfigClientSecret(value: $value, expiresAt: $expiresAt)';
  }
}

/// @nodoc
abstract mixin class _$SessionConfigClientSecretCopyWith<$Res>
    implements $SessionConfigClientSecretCopyWith<$Res> {
  factory _$SessionConfigClientSecretCopyWith(_SessionConfigClientSecret value,
          $Res Function(_SessionConfigClientSecret) _then) =
      __$SessionConfigClientSecretCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? value,
      @JsonKey(name: 'expires_at', includeIfNull: false) int? expiresAt});
}

/// @nodoc
class __$SessionConfigClientSecretCopyWithImpl<$Res>
    implements _$SessionConfigClientSecretCopyWith<$Res> {
  __$SessionConfigClientSecretCopyWithImpl(this._self, this._then);

  final _SessionConfigClientSecret _self;
  final $Res Function(_SessionConfigClientSecret) _then;

  /// Create a copy of SessionConfigClientSecret
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_SessionConfigClientSecret(
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

SessionConfigToolChoice _$SessionConfigToolChoiceFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'mode':
      return SessionConfigToolChoiceEnumeration.fromJson(json);
    case 'toolChoiceForced':
      return SessionConfigToolChoiceToolChoiceForced.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'SessionConfigToolChoice',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SessionConfigToolChoice {
  Object get value;

  /// Serializes this SessionConfigToolChoice to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionConfigToolChoice &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'SessionConfigToolChoice(value: $value)';
  }
}

/// @nodoc
class $SessionConfigToolChoiceCopyWith<$Res> {
  $SessionConfigToolChoiceCopyWith(
      SessionConfigToolChoice _, $Res Function(SessionConfigToolChoice) __);
}

/// @nodoc
@JsonSerializable()
class SessionConfigToolChoiceEnumeration extends SessionConfigToolChoice {
  const SessionConfigToolChoiceEnumeration(this.value, {final String? $type})
      : $type = $type ?? 'mode',
        super._();
  factory SessionConfigToolChoiceEnumeration.fromJson(
          Map<String, dynamic> json) =>
      _$SessionConfigToolChoiceEnumerationFromJson(json);

  @override
  final SessionConfigToolChoiceMode value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SessionConfigToolChoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionConfigToolChoiceEnumerationCopyWith<
          SessionConfigToolChoiceEnumeration>
      get copyWith => _$SessionConfigToolChoiceEnumerationCopyWithImpl<
          SessionConfigToolChoiceEnumeration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionConfigToolChoiceEnumerationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionConfigToolChoiceEnumeration &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'SessionConfigToolChoice.mode(value: $value)';
  }
}

/// @nodoc
abstract mixin class $SessionConfigToolChoiceEnumerationCopyWith<$Res>
    implements $SessionConfigToolChoiceCopyWith<$Res> {
  factory $SessionConfigToolChoiceEnumerationCopyWith(
          SessionConfigToolChoiceEnumeration value,
          $Res Function(SessionConfigToolChoiceEnumeration) _then) =
      _$SessionConfigToolChoiceEnumerationCopyWithImpl;
  @useResult
  $Res call({SessionConfigToolChoiceMode value});
}

/// @nodoc
class _$SessionConfigToolChoiceEnumerationCopyWithImpl<$Res>
    implements $SessionConfigToolChoiceEnumerationCopyWith<$Res> {
  _$SessionConfigToolChoiceEnumerationCopyWithImpl(this._self, this._then);

  final SessionConfigToolChoiceEnumeration _self;
  final $Res Function(SessionConfigToolChoiceEnumeration) _then;

  /// Create a copy of SessionConfigToolChoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(SessionConfigToolChoiceEnumeration(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as SessionConfigToolChoiceMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class SessionConfigToolChoiceToolChoiceForced extends SessionConfigToolChoice {
  const SessionConfigToolChoiceToolChoiceForced(this.value,
      {final String? $type})
      : $type = $type ?? 'toolChoiceForced',
        super._();
  factory SessionConfigToolChoiceToolChoiceForced.fromJson(
          Map<String, dynamic> json) =>
      _$SessionConfigToolChoiceToolChoiceForcedFromJson(json);

  @override
  final ToolChoiceForced value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SessionConfigToolChoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionConfigToolChoiceToolChoiceForcedCopyWith<
          SessionConfigToolChoiceToolChoiceForced>
      get copyWith => _$SessionConfigToolChoiceToolChoiceForcedCopyWithImpl<
          SessionConfigToolChoiceToolChoiceForced>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionConfigToolChoiceToolChoiceForcedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionConfigToolChoiceToolChoiceForced &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'SessionConfigToolChoice.toolChoiceForced(value: $value)';
  }
}

/// @nodoc
abstract mixin class $SessionConfigToolChoiceToolChoiceForcedCopyWith<$Res>
    implements $SessionConfigToolChoiceCopyWith<$Res> {
  factory $SessionConfigToolChoiceToolChoiceForcedCopyWith(
          SessionConfigToolChoiceToolChoiceForced value,
          $Res Function(SessionConfigToolChoiceToolChoiceForced) _then) =
      _$SessionConfigToolChoiceToolChoiceForcedCopyWithImpl;
  @useResult
  $Res call({ToolChoiceForced value});

  $ToolChoiceForcedCopyWith<$Res> get value;
}

/// @nodoc
class _$SessionConfigToolChoiceToolChoiceForcedCopyWithImpl<$Res>
    implements $SessionConfigToolChoiceToolChoiceForcedCopyWith<$Res> {
  _$SessionConfigToolChoiceToolChoiceForcedCopyWithImpl(this._self, this._then);

  final SessionConfigToolChoiceToolChoiceForced _self;
  final $Res Function(SessionConfigToolChoiceToolChoiceForced) _then;

  /// Create a copy of SessionConfigToolChoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(SessionConfigToolChoiceToolChoiceForced(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as ToolChoiceForced,
    ));
  }

  /// Create a copy of SessionConfigToolChoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ToolChoiceForcedCopyWith<$Res> get value {
    return $ToolChoiceForcedCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }
}

SessionConfigMaxResponseOutputTokens
    _$SessionConfigMaxResponseOutputTokensFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'int':
      return SessionConfigMaxResponseOutputTokensInt.fromJson(json);
    case 'string':
      return SessionConfigMaxResponseOutputTokensString.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'SessionConfigMaxResponseOutputTokens',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SessionConfigMaxResponseOutputTokens {
  Object get value;

  /// Serializes this SessionConfigMaxResponseOutputTokens to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionConfigMaxResponseOutputTokens &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'SessionConfigMaxResponseOutputTokens(value: $value)';
  }
}

/// @nodoc
class $SessionConfigMaxResponseOutputTokensCopyWith<$Res> {
  $SessionConfigMaxResponseOutputTokensCopyWith(
      SessionConfigMaxResponseOutputTokens _,
      $Res Function(SessionConfigMaxResponseOutputTokens) __);
}

/// @nodoc
@JsonSerializable()
class SessionConfigMaxResponseOutputTokensInt
    extends SessionConfigMaxResponseOutputTokens {
  const SessionConfigMaxResponseOutputTokensInt(this.value,
      {final String? $type})
      : $type = $type ?? 'int',
        super._();
  factory SessionConfigMaxResponseOutputTokensInt.fromJson(
          Map<String, dynamic> json) =>
      _$SessionConfigMaxResponseOutputTokensIntFromJson(json);

  @override
  final int value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SessionConfigMaxResponseOutputTokens
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionConfigMaxResponseOutputTokensIntCopyWith<
          SessionConfigMaxResponseOutputTokensInt>
      get copyWith => _$SessionConfigMaxResponseOutputTokensIntCopyWithImpl<
          SessionConfigMaxResponseOutputTokensInt>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionConfigMaxResponseOutputTokensIntToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionConfigMaxResponseOutputTokensInt &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'SessionConfigMaxResponseOutputTokens.int(value: $value)';
  }
}

/// @nodoc
abstract mixin class $SessionConfigMaxResponseOutputTokensIntCopyWith<$Res>
    implements $SessionConfigMaxResponseOutputTokensCopyWith<$Res> {
  factory $SessionConfigMaxResponseOutputTokensIntCopyWith(
          SessionConfigMaxResponseOutputTokensInt value,
          $Res Function(SessionConfigMaxResponseOutputTokensInt) _then) =
      _$SessionConfigMaxResponseOutputTokensIntCopyWithImpl;
  @useResult
  $Res call({int value});
}

/// @nodoc
class _$SessionConfigMaxResponseOutputTokensIntCopyWithImpl<$Res>
    implements $SessionConfigMaxResponseOutputTokensIntCopyWith<$Res> {
  _$SessionConfigMaxResponseOutputTokensIntCopyWithImpl(this._self, this._then);

  final SessionConfigMaxResponseOutputTokensInt _self;
  final $Res Function(SessionConfigMaxResponseOutputTokensInt) _then;

  /// Create a copy of SessionConfigMaxResponseOutputTokens
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(SessionConfigMaxResponseOutputTokensInt(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class SessionConfigMaxResponseOutputTokensString
    extends SessionConfigMaxResponseOutputTokens {
  const SessionConfigMaxResponseOutputTokensString(this.value,
      {final String? $type})
      : $type = $type ?? 'string',
        super._();
  factory SessionConfigMaxResponseOutputTokensString.fromJson(
          Map<String, dynamic> json) =>
      _$SessionConfigMaxResponseOutputTokensStringFromJson(json);

  @override
  final String value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SessionConfigMaxResponseOutputTokens
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionConfigMaxResponseOutputTokensStringCopyWith<
          SessionConfigMaxResponseOutputTokensString>
      get copyWith => _$SessionConfigMaxResponseOutputTokensStringCopyWithImpl<
          SessionConfigMaxResponseOutputTokensString>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionConfigMaxResponseOutputTokensStringToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionConfigMaxResponseOutputTokensString &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'SessionConfigMaxResponseOutputTokens.string(value: $value)';
  }
}

/// @nodoc
abstract mixin class $SessionConfigMaxResponseOutputTokensStringCopyWith<$Res>
    implements $SessionConfigMaxResponseOutputTokensCopyWith<$Res> {
  factory $SessionConfigMaxResponseOutputTokensStringCopyWith(
          SessionConfigMaxResponseOutputTokensString value,
          $Res Function(SessionConfigMaxResponseOutputTokensString) _then) =
      _$SessionConfigMaxResponseOutputTokensStringCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$SessionConfigMaxResponseOutputTokensStringCopyWithImpl<$Res>
    implements $SessionConfigMaxResponseOutputTokensStringCopyWith<$Res> {
  _$SessionConfigMaxResponseOutputTokensStringCopyWithImpl(
      this._self, this._then);

  final SessionConfigMaxResponseOutputTokensString _self;
  final $Res Function(SessionConfigMaxResponseOutputTokensString) _then;

  /// Create a copy of SessionConfigMaxResponseOutputTokens
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(SessionConfigMaxResponseOutputTokensString(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Conversation {
  /// The unique ID of the conversation.
  String get id;

  /// The object type, must be "realtime.conversation".
  ObjectType get object;

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConversationCopyWith<Conversation> get copyWith =>
      _$ConversationCopyWithImpl<Conversation>(
          this as Conversation, _$identity);

  /// Serializes this Conversation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Conversation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, object);

  @override
  String toString() {
    return 'Conversation(id: $id, object: $object)';
  }
}

/// @nodoc
abstract mixin class $ConversationCopyWith<$Res> {
  factory $ConversationCopyWith(
          Conversation value, $Res Function(Conversation) _then) =
      _$ConversationCopyWithImpl;
  @useResult
  $Res call({String id, ObjectType object});
}

/// @nodoc
class _$ConversationCopyWithImpl<$Res> implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._self, this._then);

  final Conversation _self;
  final $Res Function(Conversation) _then;

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _self.object
          : object // ignore: cast_nullable_to_non_nullable
              as ObjectType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Conversation extends Conversation {
  const _Conversation(
      {required this.id, this.object = ObjectType.realtimeConversation})
      : super._();
  factory _Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  /// The unique ID of the conversation.
  @override
  final String id;

  /// The object type, must be "realtime.conversation".
  @override
  @JsonKey()
  final ObjectType object;

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConversationCopyWith<_Conversation> get copyWith =>
      __$ConversationCopyWithImpl<_Conversation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ConversationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Conversation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, object);

  @override
  String toString() {
    return 'Conversation(id: $id, object: $object)';
  }
}

/// @nodoc
abstract mixin class _$ConversationCopyWith<$Res>
    implements $ConversationCopyWith<$Res> {
  factory _$ConversationCopyWith(
          _Conversation value, $Res Function(_Conversation) _then) =
      __$ConversationCopyWithImpl;
  @override
  @useResult
  $Res call({String id, ObjectType object});
}

/// @nodoc
class __$ConversationCopyWithImpl<$Res>
    implements _$ConversationCopyWith<$Res> {
  __$ConversationCopyWithImpl(this._self, this._then);

  final _Conversation _self;
  final $Res Function(_Conversation) _then;

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? object = null,
  }) {
    return _then(_Conversation(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _self.object
          : object // ignore: cast_nullable_to_non_nullable
              as ObjectType,
    ));
  }
}

/// @nodoc
mixin _$Delta {
  /// The transcript of the audio.
  @JsonKey(includeIfNull: false)
  String? get transcript;

  /// The audio bytes.
  @Uint8ListConverter()
  @JsonKey(includeIfNull: false)
  Uint8List? get audio;

  /// The text.
  @JsonKey(includeIfNull: false)
  String? get text;

  /// The arguments.
  @JsonKey(includeIfNull: false)
  String? get arguments;

  /// Create a copy of Delta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeltaCopyWith<Delta> get copyWith =>
      _$DeltaCopyWithImpl<Delta>(this as Delta, _$identity);

  /// Serializes this Delta to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Delta &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript) &&
            const DeepCollectionEquality().equals(other.audio, audio) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.arguments, arguments) ||
                other.arguments == arguments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transcript,
      const DeepCollectionEquality().hash(audio), text, arguments);

  @override
  String toString() {
    return 'Delta(transcript: $transcript, audio: $audio, text: $text, arguments: $arguments)';
  }
}

/// @nodoc
abstract mixin class $DeltaCopyWith<$Res> {
  factory $DeltaCopyWith(Delta value, $Res Function(Delta) _then) =
      _$DeltaCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? transcript,
      @Uint8ListConverter() @JsonKey(includeIfNull: false) Uint8List? audio,
      @JsonKey(includeIfNull: false) String? text,
      @JsonKey(includeIfNull: false) String? arguments});
}

/// @nodoc
class _$DeltaCopyWithImpl<$Res> implements $DeltaCopyWith<$Res> {
  _$DeltaCopyWithImpl(this._self, this._then);

  final Delta _self;
  final $Res Function(Delta) _then;

  /// Create a copy of Delta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transcript = freezed,
    Object? audio = freezed,
    Object? text = freezed,
    Object? arguments = freezed,
  }) {
    return _then(_self.copyWith(
      transcript: freezed == transcript
          ? _self.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      arguments: freezed == arguments
          ? _self.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Delta extends Delta {
  const _Delta(
      {@JsonKey(includeIfNull: false) this.transcript,
      @Uint8ListConverter() @JsonKey(includeIfNull: false) this.audio,
      @JsonKey(includeIfNull: false) this.text,
      @JsonKey(includeIfNull: false) this.arguments})
      : super._();
  factory _Delta.fromJson(Map<String, dynamic> json) => _$DeltaFromJson(json);

  /// The transcript of the audio.
  @override
  @JsonKey(includeIfNull: false)
  final String? transcript;

  /// The audio bytes.
  @override
  @Uint8ListConverter()
  @JsonKey(includeIfNull: false)
  final Uint8List? audio;

  /// The text.
  @override
  @JsonKey(includeIfNull: false)
  final String? text;

  /// The arguments.
  @override
  @JsonKey(includeIfNull: false)
  final String? arguments;

  /// Create a copy of Delta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeltaCopyWith<_Delta> get copyWith =>
      __$DeltaCopyWithImpl<_Delta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeltaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Delta &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript) &&
            const DeepCollectionEquality().equals(other.audio, audio) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.arguments, arguments) ||
                other.arguments == arguments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transcript,
      const DeepCollectionEquality().hash(audio), text, arguments);

  @override
  String toString() {
    return 'Delta(transcript: $transcript, audio: $audio, text: $text, arguments: $arguments)';
  }
}

/// @nodoc
abstract mixin class _$DeltaCopyWith<$Res> implements $DeltaCopyWith<$Res> {
  factory _$DeltaCopyWith(_Delta value, $Res Function(_Delta) _then) =
      __$DeltaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? transcript,
      @Uint8ListConverter() @JsonKey(includeIfNull: false) Uint8List? audio,
      @JsonKey(includeIfNull: false) String? text,
      @JsonKey(includeIfNull: false) String? arguments});
}

/// @nodoc
class __$DeltaCopyWithImpl<$Res> implements _$DeltaCopyWith<$Res> {
  __$DeltaCopyWithImpl(this._self, this._then);

  final _Delta _self;
  final $Res Function(_Delta) _then;

  /// Create a copy of Delta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? transcript = freezed,
    Object? audio = freezed,
    Object? text = freezed,
    Object? arguments = freezed,
  }) {
    return _then(_Delta(
      transcript: freezed == transcript
          ? _self.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      arguments: freezed == arguments
          ? _self.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$FormattedTool {
  /// The type of the tool. Currently, only `function` is supported.
  ToolType get type;

  /// The name of the function.
  String get name;

  /// The call id.
  @JsonKey(name: 'call_id')
  String get callId;

  /// The arguments.
  String get arguments;

  /// Create a copy of FormattedTool
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormattedToolCopyWith<FormattedTool> get copyWith =>
      _$FormattedToolCopyWithImpl<FormattedTool>(
          this as FormattedTool, _$identity);

  /// Serializes this FormattedTool to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormattedTool &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.arguments, arguments) ||
                other.arguments == arguments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, name, callId, arguments);

  @override
  String toString() {
    return 'FormattedTool(type: $type, name: $name, callId: $callId, arguments: $arguments)';
  }
}

/// @nodoc
abstract mixin class $FormattedToolCopyWith<$Res> {
  factory $FormattedToolCopyWith(
          FormattedTool value, $Res Function(FormattedTool) _then) =
      _$FormattedToolCopyWithImpl;
  @useResult
  $Res call(
      {ToolType type,
      String name,
      @JsonKey(name: 'call_id') String callId,
      String arguments});
}

/// @nodoc
class _$FormattedToolCopyWithImpl<$Res>
    implements $FormattedToolCopyWith<$Res> {
  _$FormattedToolCopyWithImpl(this._self, this._then);

  final FormattedTool _self;
  final $Res Function(FormattedTool) _then;

  /// Create a copy of FormattedTool
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? callId = null,
    Object? arguments = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ToolType,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      callId: null == callId
          ? _self.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String,
      arguments: null == arguments
          ? _self.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FormattedTool extends FormattedTool {
  const _FormattedTool(
      {this.type = ToolType.function,
      required this.name,
      @JsonKey(name: 'call_id') required this.callId,
      required this.arguments})
      : super._();
  factory _FormattedTool.fromJson(Map<String, dynamic> json) =>
      _$FormattedToolFromJson(json);

  /// The type of the tool. Currently, only `function` is supported.
  @override
  @JsonKey()
  final ToolType type;

  /// The name of the function.
  @override
  final String name;

  /// The call id.
  @override
  @JsonKey(name: 'call_id')
  final String callId;

  /// The arguments.
  @override
  final String arguments;

  /// Create a copy of FormattedTool
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FormattedToolCopyWith<_FormattedTool> get copyWith =>
      __$FormattedToolCopyWithImpl<_FormattedTool>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FormattedToolToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FormattedTool &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.arguments, arguments) ||
                other.arguments == arguments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, name, callId, arguments);

  @override
  String toString() {
    return 'FormattedTool(type: $type, name: $name, callId: $callId, arguments: $arguments)';
  }
}

/// @nodoc
abstract mixin class _$FormattedToolCopyWith<$Res>
    implements $FormattedToolCopyWith<$Res> {
  factory _$FormattedToolCopyWith(
          _FormattedTool value, $Res Function(_FormattedTool) _then) =
      __$FormattedToolCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ToolType type,
      String name,
      @JsonKey(name: 'call_id') String callId,
      String arguments});
}

/// @nodoc
class __$FormattedToolCopyWithImpl<$Res>
    implements _$FormattedToolCopyWith<$Res> {
  __$FormattedToolCopyWithImpl(this._self, this._then);

  final _FormattedTool _self;
  final $Res Function(_FormattedTool) _then;

  /// Create a copy of FormattedTool
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? callId = null,
    Object? arguments = null,
  }) {
    return _then(_FormattedTool(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ToolType,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      callId: null == callId
          ? _self.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String,
      arguments: null == arguments
          ? _self.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$FormattedProperty {
  /// The audio bytes.
  @Uint8ListConverter()
  Uint8List get audio;

  /// The text.
  String get text;

  /// The transcript.
  String get transcript;

  /// A formatted tool.
  @JsonKey(includeIfNull: false)
  FormattedTool? get tool;

  /// The output.
  @JsonKey(includeIfNull: false)
  String? get output;

  /// Create a copy of FormattedProperty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormattedPropertyCopyWith<FormattedProperty> get copyWith =>
      _$FormattedPropertyCopyWithImpl<FormattedProperty>(
          this as FormattedProperty, _$identity);

  /// Serializes this FormattedProperty to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormattedProperty &&
            const DeepCollectionEquality().equals(other.audio, audio) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript) &&
            (identical(other.tool, tool) || other.tool == tool) &&
            (identical(other.output, output) || other.output == output));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(audio),
      text,
      transcript,
      tool,
      output);

  @override
  String toString() {
    return 'FormattedProperty(audio: $audio, text: $text, transcript: $transcript, tool: $tool, output: $output)';
  }
}

/// @nodoc
abstract mixin class $FormattedPropertyCopyWith<$Res> {
  factory $FormattedPropertyCopyWith(
          FormattedProperty value, $Res Function(FormattedProperty) _then) =
      _$FormattedPropertyCopyWithImpl;
  @useResult
  $Res call(
      {@Uint8ListConverter() Uint8List audio,
      String text,
      String transcript,
      @JsonKey(includeIfNull: false) FormattedTool? tool,
      @JsonKey(includeIfNull: false) String? output});

  $FormattedToolCopyWith<$Res>? get tool;
}

/// @nodoc
class _$FormattedPropertyCopyWithImpl<$Res>
    implements $FormattedPropertyCopyWith<$Res> {
  _$FormattedPropertyCopyWithImpl(this._self, this._then);

  final FormattedProperty _self;
  final $Res Function(FormattedProperty) _then;

  /// Create a copy of FormattedProperty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audio = null,
    Object? text = null,
    Object? transcript = null,
    Object? tool = freezed,
    Object? output = freezed,
  }) {
    return _then(_self.copyWith(
      audio: null == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      transcript: null == transcript
          ? _self.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String,
      tool: freezed == tool
          ? _self.tool
          : tool // ignore: cast_nullable_to_non_nullable
              as FormattedTool?,
      output: freezed == output
          ? _self.output
          : output // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of FormattedProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormattedToolCopyWith<$Res>? get tool {
    if (_self.tool == null) {
      return null;
    }

    return $FormattedToolCopyWith<$Res>(_self.tool!, (value) {
      return _then(_self.copyWith(tool: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _FormattedProperty extends FormattedProperty {
  const _FormattedProperty(
      {@Uint8ListConverter() required this.audio,
      required this.text,
      required this.transcript,
      @JsonKey(includeIfNull: false) this.tool,
      @JsonKey(includeIfNull: false) this.output})
      : super._();
  factory _FormattedProperty.fromJson(Map<String, dynamic> json) =>
      _$FormattedPropertyFromJson(json);

  /// The audio bytes.
  @override
  @Uint8ListConverter()
  final Uint8List audio;

  /// The text.
  @override
  final String text;

  /// The transcript.
  @override
  final String transcript;

  /// A formatted tool.
  @override
  @JsonKey(includeIfNull: false)
  final FormattedTool? tool;

  /// The output.
  @override
  @JsonKey(includeIfNull: false)
  final String? output;

  /// Create a copy of FormattedProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FormattedPropertyCopyWith<_FormattedProperty> get copyWith =>
      __$FormattedPropertyCopyWithImpl<_FormattedProperty>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FormattedPropertyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FormattedProperty &&
            const DeepCollectionEquality().equals(other.audio, audio) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript) &&
            (identical(other.tool, tool) || other.tool == tool) &&
            (identical(other.output, output) || other.output == output));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(audio),
      text,
      transcript,
      tool,
      output);

  @override
  String toString() {
    return 'FormattedProperty(audio: $audio, text: $text, transcript: $transcript, tool: $tool, output: $output)';
  }
}

/// @nodoc
abstract mixin class _$FormattedPropertyCopyWith<$Res>
    implements $FormattedPropertyCopyWith<$Res> {
  factory _$FormattedPropertyCopyWith(
          _FormattedProperty value, $Res Function(_FormattedProperty) _then) =
      __$FormattedPropertyCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@Uint8ListConverter() Uint8List audio,
      String text,
      String transcript,
      @JsonKey(includeIfNull: false) FormattedTool? tool,
      @JsonKey(includeIfNull: false) String? output});

  @override
  $FormattedToolCopyWith<$Res>? get tool;
}

/// @nodoc
class __$FormattedPropertyCopyWithImpl<$Res>
    implements _$FormattedPropertyCopyWith<$Res> {
  __$FormattedPropertyCopyWithImpl(this._self, this._then);

  final _FormattedProperty _self;
  final $Res Function(_FormattedProperty) _then;

  /// Create a copy of FormattedProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? audio = null,
    Object? text = null,
    Object? transcript = null,
    Object? tool = freezed,
    Object? output = freezed,
  }) {
    return _then(_FormattedProperty(
      audio: null == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      transcript: null == transcript
          ? _self.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String,
      tool: freezed == tool
          ? _self.tool
          : tool // ignore: cast_nullable_to_non_nullable
              as FormattedTool?,
      output: freezed == output
          ? _self.output
          : output // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of FormattedProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormattedToolCopyWith<$Res>? get tool {
    if (_self.tool == null) {
      return null;
    }

    return $FormattedToolCopyWith<$Res>(_self.tool!, (value) {
      return _then(_self.copyWith(tool: value));
    });
  }
}

/// @nodoc
mixin _$FormattedItem {
  /// The item to add to the conversation.
  /// Any of: [ItemMessage], [ItemFunctionCall], [ItemFunctionCallOutput]
  Item get item;

  /// A formatted property.
  FormattedProperty? get formatted;

  /// Create a copy of FormattedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormattedItemCopyWith<FormattedItem> get copyWith =>
      _$FormattedItemCopyWithImpl<FormattedItem>(
          this as FormattedItem, _$identity);

  /// Serializes this FormattedItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormattedItem &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.formatted, formatted) ||
                other.formatted == formatted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item, formatted);

  @override
  String toString() {
    return 'FormattedItem(item: $item, formatted: $formatted)';
  }
}

/// @nodoc
abstract mixin class $FormattedItemCopyWith<$Res> {
  factory $FormattedItemCopyWith(
          FormattedItem value, $Res Function(FormattedItem) _then) =
      _$FormattedItemCopyWithImpl;
  @useResult
  $Res call({Item item, FormattedProperty? formatted});

  $ItemCopyWith<$Res> get item;
  $FormattedPropertyCopyWith<$Res>? get formatted;
}

/// @nodoc
class _$FormattedItemCopyWithImpl<$Res>
    implements $FormattedItemCopyWith<$Res> {
  _$FormattedItemCopyWithImpl(this._self, this._then);

  final FormattedItem _self;
  final $Res Function(FormattedItem) _then;

  /// Create a copy of FormattedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? formatted = freezed,
  }) {
    return _then(_self.copyWith(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
      formatted: freezed == formatted
          ? _self.formatted
          : formatted // ignore: cast_nullable_to_non_nullable
              as FormattedProperty?,
    ));
  }

  /// Create a copy of FormattedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res> get item {
    return $ItemCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }

  /// Create a copy of FormattedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormattedPropertyCopyWith<$Res>? get formatted {
    if (_self.formatted == null) {
      return null;
    }

    return $FormattedPropertyCopyWith<$Res>(_self.formatted!, (value) {
      return _then(_self.copyWith(formatted: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _FormattedItem extends FormattedItem {
  const _FormattedItem({required this.item, required this.formatted})
      : super._();
  factory _FormattedItem.fromJson(Map<String, dynamic> json) =>
      _$FormattedItemFromJson(json);

  /// The item to add to the conversation.
  /// Any of: [ItemMessage], [ItemFunctionCall], [ItemFunctionCallOutput]
  @override
  final Item item;

  /// A formatted property.
  @override
  final FormattedProperty? formatted;

  /// Create a copy of FormattedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FormattedItemCopyWith<_FormattedItem> get copyWith =>
      __$FormattedItemCopyWithImpl<_FormattedItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FormattedItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FormattedItem &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.formatted, formatted) ||
                other.formatted == formatted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item, formatted);

  @override
  String toString() {
    return 'FormattedItem(item: $item, formatted: $formatted)';
  }
}

/// @nodoc
abstract mixin class _$FormattedItemCopyWith<$Res>
    implements $FormattedItemCopyWith<$Res> {
  factory _$FormattedItemCopyWith(
          _FormattedItem value, $Res Function(_FormattedItem) _then) =
      __$FormattedItemCopyWithImpl;
  @override
  @useResult
  $Res call({Item item, FormattedProperty? formatted});

  @override
  $ItemCopyWith<$Res> get item;
  @override
  $FormattedPropertyCopyWith<$Res>? get formatted;
}

/// @nodoc
class __$FormattedItemCopyWithImpl<$Res>
    implements _$FormattedItemCopyWith<$Res> {
  __$FormattedItemCopyWithImpl(this._self, this._then);

  final _FormattedItem _self;
  final $Res Function(_FormattedItem) _then;

  /// Create a copy of FormattedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
    Object? formatted = freezed,
  }) {
    return _then(_FormattedItem(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
      formatted: freezed == formatted
          ? _self.formatted
          : formatted // ignore: cast_nullable_to_non_nullable
              as FormattedProperty?,
    ));
  }

  /// Create a copy of FormattedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res> get item {
    return $ItemCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }

  /// Create a copy of FormattedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormattedPropertyCopyWith<$Res>? get formatted {
    if (_self.formatted == null) {
      return null;
    }

    return $FormattedPropertyCopyWith<$Res>(_self.formatted!, (value) {
      return _then(_self.copyWith(formatted: value));
    });
  }
}

/// @nodoc
mixin _$ItemSpeech {
  /// The start time of the audio in milliseconds.
  int get audioStartMs;

  /// The end time of the audio in milliseconds.
  @JsonKey(includeIfNull: false)
  int? get audioEndMs;

  /// The audio bytes.
  @Uint8ListConverter()
  @JsonKey(includeIfNull: false)
  Uint8List? get audio;

  /// Create a copy of ItemSpeech
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItemSpeechCopyWith<ItemSpeech> get copyWith =>
      _$ItemSpeechCopyWithImpl<ItemSpeech>(this as ItemSpeech, _$identity);

  /// Serializes this ItemSpeech to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItemSpeech &&
            (identical(other.audioStartMs, audioStartMs) ||
                other.audioStartMs == audioStartMs) &&
            (identical(other.audioEndMs, audioEndMs) ||
                other.audioEndMs == audioEndMs) &&
            const DeepCollectionEquality().equals(other.audio, audio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, audioStartMs, audioEndMs,
      const DeepCollectionEquality().hash(audio));

  @override
  String toString() {
    return 'ItemSpeech(audioStartMs: $audioStartMs, audioEndMs: $audioEndMs, audio: $audio)';
  }
}

/// @nodoc
abstract mixin class $ItemSpeechCopyWith<$Res> {
  factory $ItemSpeechCopyWith(
          ItemSpeech value, $Res Function(ItemSpeech) _then) =
      _$ItemSpeechCopyWithImpl;
  @useResult
  $Res call(
      {int audioStartMs,
      @JsonKey(includeIfNull: false) int? audioEndMs,
      @Uint8ListConverter() @JsonKey(includeIfNull: false) Uint8List? audio});
}

/// @nodoc
class _$ItemSpeechCopyWithImpl<$Res> implements $ItemSpeechCopyWith<$Res> {
  _$ItemSpeechCopyWithImpl(this._self, this._then);

  final ItemSpeech _self;
  final $Res Function(ItemSpeech) _then;

  /// Create a copy of ItemSpeech
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioStartMs = null,
    Object? audioEndMs = freezed,
    Object? audio = freezed,
  }) {
    return _then(_self.copyWith(
      audioStartMs: null == audioStartMs
          ? _self.audioStartMs
          : audioStartMs // ignore: cast_nullable_to_non_nullable
              as int,
      audioEndMs: freezed == audioEndMs
          ? _self.audioEndMs
          : audioEndMs // ignore: cast_nullable_to_non_nullable
              as int?,
      audio: freezed == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ItemSpeech extends ItemSpeech {
  const _ItemSpeech(
      {required this.audioStartMs,
      @JsonKey(includeIfNull: false) this.audioEndMs,
      @Uint8ListConverter() @JsonKey(includeIfNull: false) this.audio})
      : super._();
  factory _ItemSpeech.fromJson(Map<String, dynamic> json) =>
      _$ItemSpeechFromJson(json);

  /// The start time of the audio in milliseconds.
  @override
  final int audioStartMs;

  /// The end time of the audio in milliseconds.
  @override
  @JsonKey(includeIfNull: false)
  final int? audioEndMs;

  /// The audio bytes.
  @override
  @Uint8ListConverter()
  @JsonKey(includeIfNull: false)
  final Uint8List? audio;

  /// Create a copy of ItemSpeech
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ItemSpeechCopyWith<_ItemSpeech> get copyWith =>
      __$ItemSpeechCopyWithImpl<_ItemSpeech>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ItemSpeechToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemSpeech &&
            (identical(other.audioStartMs, audioStartMs) ||
                other.audioStartMs == audioStartMs) &&
            (identical(other.audioEndMs, audioEndMs) ||
                other.audioEndMs == audioEndMs) &&
            const DeepCollectionEquality().equals(other.audio, audio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, audioStartMs, audioEndMs,
      const DeepCollectionEquality().hash(audio));

  @override
  String toString() {
    return 'ItemSpeech(audioStartMs: $audioStartMs, audioEndMs: $audioEndMs, audio: $audio)';
  }
}

/// @nodoc
abstract mixin class _$ItemSpeechCopyWith<$Res>
    implements $ItemSpeechCopyWith<$Res> {
  factory _$ItemSpeechCopyWith(
          _ItemSpeech value, $Res Function(_ItemSpeech) _then) =
      __$ItemSpeechCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int audioStartMs,
      @JsonKey(includeIfNull: false) int? audioEndMs,
      @Uint8ListConverter() @JsonKey(includeIfNull: false) Uint8List? audio});
}

/// @nodoc
class __$ItemSpeechCopyWithImpl<$Res> implements _$ItemSpeechCopyWith<$Res> {
  __$ItemSpeechCopyWithImpl(this._self, this._then);

  final _ItemSpeech _self;
  final $Res Function(_ItemSpeech) _then;

  /// Create a copy of ItemSpeech
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? audioStartMs = null,
    Object? audioEndMs = freezed,
    Object? audio = freezed,
  }) {
    return _then(_ItemSpeech(
      audioStartMs: null == audioStartMs
          ? _self.audioStartMs
          : audioStartMs // ignore: cast_nullable_to_non_nullable
              as int,
      audioEndMs: freezed == audioEndMs
          ? _self.audioEndMs
          : audioEndMs // ignore: cast_nullable_to_non_nullable
              as int?,
      audio: freezed == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
mixin _$ItemTranscript {
  /// The transcript.
  String get transcript;

  /// Create a copy of ItemTranscript
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItemTranscriptCopyWith<ItemTranscript> get copyWith =>
      _$ItemTranscriptCopyWithImpl<ItemTranscript>(
          this as ItemTranscript, _$identity);

  /// Serializes this ItemTranscript to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItemTranscript &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transcript);

  @override
  String toString() {
    return 'ItemTranscript(transcript: $transcript)';
  }
}

/// @nodoc
abstract mixin class $ItemTranscriptCopyWith<$Res> {
  factory $ItemTranscriptCopyWith(
          ItemTranscript value, $Res Function(ItemTranscript) _then) =
      _$ItemTranscriptCopyWithImpl;
  @useResult
  $Res call({String transcript});
}

/// @nodoc
class _$ItemTranscriptCopyWithImpl<$Res>
    implements $ItemTranscriptCopyWith<$Res> {
  _$ItemTranscriptCopyWithImpl(this._self, this._then);

  final ItemTranscript _self;
  final $Res Function(ItemTranscript) _then;

  /// Create a copy of ItemTranscript
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transcript = null,
  }) {
    return _then(_self.copyWith(
      transcript: null == transcript
          ? _self.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ItemTranscript extends ItemTranscript {
  const _ItemTranscript({required this.transcript}) : super._();
  factory _ItemTranscript.fromJson(Map<String, dynamic> json) =>
      _$ItemTranscriptFromJson(json);

  /// The transcript.
  @override
  final String transcript;

  /// Create a copy of ItemTranscript
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ItemTranscriptCopyWith<_ItemTranscript> get copyWith =>
      __$ItemTranscriptCopyWithImpl<_ItemTranscript>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ItemTranscriptToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemTranscript &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transcript);

  @override
  String toString() {
    return 'ItemTranscript(transcript: $transcript)';
  }
}

/// @nodoc
abstract mixin class _$ItemTranscriptCopyWith<$Res>
    implements $ItemTranscriptCopyWith<$Res> {
  factory _$ItemTranscriptCopyWith(
          _ItemTranscript value, $Res Function(_ItemTranscript) _then) =
      __$ItemTranscriptCopyWithImpl;
  @override
  @useResult
  $Res call({String transcript});
}

/// @nodoc
class __$ItemTranscriptCopyWithImpl<$Res>
    implements _$ItemTranscriptCopyWith<$Res> {
  __$ItemTranscriptCopyWithImpl(this._self, this._then);

  final _ItemTranscript _self;
  final $Res Function(_ItemTranscript) _then;

  /// Create a copy of ItemTranscript
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? transcript = null,
  }) {
    return _then(_ItemTranscript(
      transcript: null == transcript
          ? _self.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$EventHandlerResult {
  /// A formatted item.
  @JsonKey(includeIfNull: false)
  FormattedItem? get item;

  /// Delta object.
  @JsonKey(includeIfNull: false)
  Delta? get delta;

  /// The response resource.
  @JsonKey(includeIfNull: false)
  Response? get response;

  /// Create a copy of EventHandlerResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EventHandlerResultCopyWith<EventHandlerResult> get copyWith =>
      _$EventHandlerResultCopyWithImpl<EventHandlerResult>(
          this as EventHandlerResult, _$identity);

  /// Serializes this EventHandlerResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventHandlerResult &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item, delta, response);

  @override
  String toString() {
    return 'EventHandlerResult(item: $item, delta: $delta, response: $response)';
  }
}

/// @nodoc
abstract mixin class $EventHandlerResultCopyWith<$Res> {
  factory $EventHandlerResultCopyWith(
          EventHandlerResult value, $Res Function(EventHandlerResult) _then) =
      _$EventHandlerResultCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) FormattedItem? item,
      @JsonKey(includeIfNull: false) Delta? delta,
      @JsonKey(includeIfNull: false) Response? response});

  $FormattedItemCopyWith<$Res>? get item;
  $DeltaCopyWith<$Res>? get delta;
  $ResponseCopyWith<$Res>? get response;
}

/// @nodoc
class _$EventHandlerResultCopyWithImpl<$Res>
    implements $EventHandlerResultCopyWith<$Res> {
  _$EventHandlerResultCopyWithImpl(this._self, this._then);

  final EventHandlerResult _self;
  final $Res Function(EventHandlerResult) _then;

  /// Create a copy of EventHandlerResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = freezed,
    Object? delta = freezed,
    Object? response = freezed,
  }) {
    return _then(_self.copyWith(
      item: freezed == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as FormattedItem?,
      delta: freezed == delta
          ? _self.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Delta?,
      response: freezed == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as Response?,
    ));
  }

  /// Create a copy of EventHandlerResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormattedItemCopyWith<$Res>? get item {
    if (_self.item == null) {
      return null;
    }

    return $FormattedItemCopyWith<$Res>(_self.item!, (value) {
      return _then(_self.copyWith(item: value));
    });
  }

  /// Create a copy of EventHandlerResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeltaCopyWith<$Res>? get delta {
    if (_self.delta == null) {
      return null;
    }

    return $DeltaCopyWith<$Res>(_self.delta!, (value) {
      return _then(_self.copyWith(delta: value));
    });
  }

  /// Create a copy of EventHandlerResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseCopyWith<$Res>? get response {
    if (_self.response == null) {
      return null;
    }

    return $ResponseCopyWith<$Res>(_self.response!, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _EventHandlerResult extends EventHandlerResult {
  const _EventHandlerResult(
      {@JsonKey(includeIfNull: false) this.item,
      @JsonKey(includeIfNull: false) this.delta,
      @JsonKey(includeIfNull: false) this.response})
      : super._();
  factory _EventHandlerResult.fromJson(Map<String, dynamic> json) =>
      _$EventHandlerResultFromJson(json);

  /// A formatted item.
  @override
  @JsonKey(includeIfNull: false)
  final FormattedItem? item;

  /// Delta object.
  @override
  @JsonKey(includeIfNull: false)
  final Delta? delta;

  /// The response resource.
  @override
  @JsonKey(includeIfNull: false)
  final Response? response;

  /// Create a copy of EventHandlerResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventHandlerResultCopyWith<_EventHandlerResult> get copyWith =>
      __$EventHandlerResultCopyWithImpl<_EventHandlerResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EventHandlerResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventHandlerResult &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item, delta, response);

  @override
  String toString() {
    return 'EventHandlerResult(item: $item, delta: $delta, response: $response)';
  }
}

/// @nodoc
abstract mixin class _$EventHandlerResultCopyWith<$Res>
    implements $EventHandlerResultCopyWith<$Res> {
  factory _$EventHandlerResultCopyWith(
          _EventHandlerResult value, $Res Function(_EventHandlerResult) _then) =
      __$EventHandlerResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) FormattedItem? item,
      @JsonKey(includeIfNull: false) Delta? delta,
      @JsonKey(includeIfNull: false) Response? response});

  @override
  $FormattedItemCopyWith<$Res>? get item;
  @override
  $DeltaCopyWith<$Res>? get delta;
  @override
  $ResponseCopyWith<$Res>? get response;
}

/// @nodoc
class __$EventHandlerResultCopyWithImpl<$Res>
    implements _$EventHandlerResultCopyWith<$Res> {
  __$EventHandlerResultCopyWithImpl(this._self, this._then);

  final _EventHandlerResult _self;
  final $Res Function(_EventHandlerResult) _then;

  /// Create a copy of EventHandlerResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = freezed,
    Object? delta = freezed,
    Object? response = freezed,
  }) {
    return _then(_EventHandlerResult(
      item: freezed == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as FormattedItem?,
      delta: freezed == delta
          ? _self.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Delta?,
      response: freezed == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as Response?,
    ));
  }

  /// Create a copy of EventHandlerResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormattedItemCopyWith<$Res>? get item {
    if (_self.item == null) {
      return null;
    }

    return $FormattedItemCopyWith<$Res>(_self.item!, (value) {
      return _then(_self.copyWith(item: value));
    });
  }

  /// Create a copy of EventHandlerResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeltaCopyWith<$Res>? get delta {
    if (_self.delta == null) {
      return null;
    }

    return $DeltaCopyWith<$Res>(_self.delta!, (value) {
      return _then(_self.copyWith(delta: value));
    });
  }

  /// Create a copy of EventHandlerResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseCopyWith<$Res>? get response {
    if (_self.response == null) {
      return null;
    }

    return $ResponseCopyWith<$Res>(_self.response!, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

/// @nodoc
mixin _$TranscriptionError {
  /// The type of the error.
  @JsonKey(includeIfNull: false)
  String? get type;

  /// Error code, if any.
  @JsonKey(includeIfNull: false)
  String? get code;

  /// A human-readable error message.
  @JsonKey(includeIfNull: false)
  String? get message;

  /// Parameter related to the error, if any.
  @JsonKey(includeIfNull: false)
  String? get param;

  /// Create a copy of TranscriptionError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TranscriptionErrorCopyWith<TranscriptionError> get copyWith =>
      _$TranscriptionErrorCopyWithImpl<TranscriptionError>(
          this as TranscriptionError, _$identity);

  /// Serializes this TranscriptionError to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TranscriptionError &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.param, param) || other.param == param));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, code, message, param);

  @override
  String toString() {
    return 'TranscriptionError(type: $type, code: $code, message: $message, param: $param)';
  }
}

/// @nodoc
abstract mixin class $TranscriptionErrorCopyWith<$Res> {
  factory $TranscriptionErrorCopyWith(
          TranscriptionError value, $Res Function(TranscriptionError) _then) =
      _$TranscriptionErrorCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? type,
      @JsonKey(includeIfNull: false) String? code,
      @JsonKey(includeIfNull: false) String? message,
      @JsonKey(includeIfNull: false) String? param});
}

/// @nodoc
class _$TranscriptionErrorCopyWithImpl<$Res>
    implements $TranscriptionErrorCopyWith<$Res> {
  _$TranscriptionErrorCopyWithImpl(this._self, this._then);

  final TranscriptionError _self;
  final $Res Function(TranscriptionError) _then;

  /// Create a copy of TranscriptionError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? param = freezed,
  }) {
    return _then(_self.copyWith(
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      param: freezed == param
          ? _self.param
          : param // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TranscriptionError extends TranscriptionError {
  const _TranscriptionError(
      {@JsonKey(includeIfNull: false) this.type,
      @JsonKey(includeIfNull: false) this.code,
      @JsonKey(includeIfNull: false) this.message,
      @JsonKey(includeIfNull: false) this.param})
      : super._();
  factory _TranscriptionError.fromJson(Map<String, dynamic> json) =>
      _$TranscriptionErrorFromJson(json);

  /// The type of the error.
  @override
  @JsonKey(includeIfNull: false)
  final String? type;

  /// Error code, if any.
  @override
  @JsonKey(includeIfNull: false)
  final String? code;

  /// A human-readable error message.
  @override
  @JsonKey(includeIfNull: false)
  final String? message;

  /// Parameter related to the error, if any.
  @override
  @JsonKey(includeIfNull: false)
  final String? param;

  /// Create a copy of TranscriptionError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TranscriptionErrorCopyWith<_TranscriptionError> get copyWith =>
      __$TranscriptionErrorCopyWithImpl<_TranscriptionError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TranscriptionErrorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TranscriptionError &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.param, param) || other.param == param));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, code, message, param);

  @override
  String toString() {
    return 'TranscriptionError(type: $type, code: $code, message: $message, param: $param)';
  }
}

/// @nodoc
abstract mixin class _$TranscriptionErrorCopyWith<$Res>
    implements $TranscriptionErrorCopyWith<$Res> {
  factory _$TranscriptionErrorCopyWith(
          _TranscriptionError value, $Res Function(_TranscriptionError) _then) =
      __$TranscriptionErrorCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? type,
      @JsonKey(includeIfNull: false) String? code,
      @JsonKey(includeIfNull: false) String? message,
      @JsonKey(includeIfNull: false) String? param});
}

/// @nodoc
class __$TranscriptionErrorCopyWithImpl<$Res>
    implements _$TranscriptionErrorCopyWith<$Res> {
  __$TranscriptionErrorCopyWithImpl(this._self, this._then);

  final _TranscriptionError _self;
  final $Res Function(_TranscriptionError) _then;

  /// Create a copy of TranscriptionError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? param = freezed,
  }) {
    return _then(_TranscriptionError(
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      param: freezed == param
          ? _self.param
          : param // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$APIError {
  /// The type of error (e.g., "invalid_request_error", "server_error").
  @JsonKey(includeIfNull: false)
  String? get type;

  /// Error code, if any.
  @JsonKey(includeIfNull: false)
  String? get code;

  /// A human-readable error message.
  @JsonKey(includeIfNull: false)
  String? get message;

  /// Parameter related to the error, if any.
  @JsonKey(includeIfNull: false)
  String? get param;

  /// The event_id of the client event that caused the error, if applicable.
  @JsonKey(name: 'event_id', includeIfNull: false)
  String? get eventId;

  /// Create a copy of APIError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $APIErrorCopyWith<APIError> get copyWith =>
      _$APIErrorCopyWithImpl<APIError>(this as APIError, _$identity);

  /// Serializes this APIError to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is APIError &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.param, param) || other.param == param) &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, code, message, param, eventId);

  @override
  String toString() {
    return 'APIError(type: $type, code: $code, message: $message, param: $param, eventId: $eventId)';
  }
}

/// @nodoc
abstract mixin class $APIErrorCopyWith<$Res> {
  factory $APIErrorCopyWith(APIError value, $Res Function(APIError) _then) =
      _$APIErrorCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? type,
      @JsonKey(includeIfNull: false) String? code,
      @JsonKey(includeIfNull: false) String? message,
      @JsonKey(includeIfNull: false) String? param,
      @JsonKey(name: 'event_id', includeIfNull: false) String? eventId});
}

/// @nodoc
class _$APIErrorCopyWithImpl<$Res> implements $APIErrorCopyWith<$Res> {
  _$APIErrorCopyWithImpl(this._self, this._then);

  final APIError _self;
  final $Res Function(APIError) _then;

  /// Create a copy of APIError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? param = freezed,
    Object? eventId = freezed,
  }) {
    return _then(_self.copyWith(
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      param: freezed == param
          ? _self.param
          : param // ignore: cast_nullable_to_non_nullable
              as String?,
      eventId: freezed == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _APIError extends APIError {
  const _APIError(
      {@JsonKey(includeIfNull: false) this.type,
      @JsonKey(includeIfNull: false) this.code,
      @JsonKey(includeIfNull: false) this.message,
      @JsonKey(includeIfNull: false) this.param,
      @JsonKey(name: 'event_id', includeIfNull: false) this.eventId})
      : super._();
  factory _APIError.fromJson(Map<String, dynamic> json) =>
      _$APIErrorFromJson(json);

  /// The type of error (e.g., "invalid_request_error", "server_error").
  @override
  @JsonKey(includeIfNull: false)
  final String? type;

  /// Error code, if any.
  @override
  @JsonKey(includeIfNull: false)
  final String? code;

  /// A human-readable error message.
  @override
  @JsonKey(includeIfNull: false)
  final String? message;

  /// Parameter related to the error, if any.
  @override
  @JsonKey(includeIfNull: false)
  final String? param;

  /// The event_id of the client event that caused the error, if applicable.
  @override
  @JsonKey(name: 'event_id', includeIfNull: false)
  final String? eventId;

  /// Create a copy of APIError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$APIErrorCopyWith<_APIError> get copyWith =>
      __$APIErrorCopyWithImpl<_APIError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$APIErrorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _APIError &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.param, param) || other.param == param) &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, code, message, param, eventId);

  @override
  String toString() {
    return 'APIError(type: $type, code: $code, message: $message, param: $param, eventId: $eventId)';
  }
}

/// @nodoc
abstract mixin class _$APIErrorCopyWith<$Res>
    implements $APIErrorCopyWith<$Res> {
  factory _$APIErrorCopyWith(_APIError value, $Res Function(_APIError) _then) =
      __$APIErrorCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? type,
      @JsonKey(includeIfNull: false) String? code,
      @JsonKey(includeIfNull: false) String? message,
      @JsonKey(includeIfNull: false) String? param,
      @JsonKey(name: 'event_id', includeIfNull: false) String? eventId});
}

/// @nodoc
class __$APIErrorCopyWithImpl<$Res> implements _$APIErrorCopyWith<$Res> {
  __$APIErrorCopyWithImpl(this._self, this._then);

  final _APIError _self;
  final $Res Function(_APIError) _then;

  /// Create a copy of APIError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? param = freezed,
    Object? eventId = freezed,
  }) {
    return _then(_APIError(
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      param: freezed == param
          ? _self.param
          : param // ignore: cast_nullable_to_non_nullable
              as String?,
      eventId: freezed == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

ContentPart _$ContentPartFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'input_text':
      return ContentPartInputText.fromJson(json);
    case 'input_audio':
      return ContentPartInputAudio.fromJson(json);
    case 'text':
      return ContentPartText.fromJson(json);
    case 'audio':
      return ContentPartAudio.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'ContentPart', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ContentPart {
  /// The content type.
  ContentType get type;

  /// Create a copy of ContentPart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentPartCopyWith<ContentPart> get copyWith =>
      _$ContentPartCopyWithImpl<ContentPart>(this as ContentPart, _$identity);

  /// Serializes this ContentPart to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentPart &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  @override
  String toString() {
    return 'ContentPart(type: $type)';
  }
}

/// @nodoc
abstract mixin class $ContentPartCopyWith<$Res> {
  factory $ContentPartCopyWith(
          ContentPart value, $Res Function(ContentPart) _then) =
      _$ContentPartCopyWithImpl;
  @useResult
  $Res call({ContentType type});
}

/// @nodoc
class _$ContentPartCopyWithImpl<$Res> implements $ContentPartCopyWith<$Res> {
  _$ContentPartCopyWithImpl(this._self, this._then);

  final ContentPart _self;
  final $Res Function(ContentPart) _then;

  /// Create a copy of ContentPart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ContentPartInputText extends ContentPart {
  const ContentPartInputText(
      {this.type = ContentType.inputText, required this.text})
      : super._();
  factory ContentPartInputText.fromJson(Map<String, dynamic> json) =>
      _$ContentPartInputTextFromJson(json);

  /// The content type.
  @override
  @JsonKey()
  final ContentType type;

  /// The text content.
  final String text;

  /// Create a copy of ContentPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentPartInputTextCopyWith<ContentPartInputText> get copyWith =>
      _$ContentPartInputTextCopyWithImpl<ContentPartInputText>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContentPartInputTextToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentPartInputText &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, text);

  @override
  String toString() {
    return 'ContentPart.inputText(type: $type, text: $text)';
  }
}

/// @nodoc
abstract mixin class $ContentPartInputTextCopyWith<$Res>
    implements $ContentPartCopyWith<$Res> {
  factory $ContentPartInputTextCopyWith(ContentPartInputText value,
          $Res Function(ContentPartInputText) _then) =
      _$ContentPartInputTextCopyWithImpl;
  @override
  @useResult
  $Res call({ContentType type, String text});
}

/// @nodoc
class _$ContentPartInputTextCopyWithImpl<$Res>
    implements $ContentPartInputTextCopyWith<$Res> {
  _$ContentPartInputTextCopyWithImpl(this._self, this._then);

  final ContentPartInputText _self;
  final $Res Function(ContentPartInputText) _then;

  /// Create a copy of ContentPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? text = null,
  }) {
    return _then(ContentPartInputText(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentType,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ContentPartInputAudio extends ContentPart {
  const ContentPartInputAudio(
      {this.type = ContentType.inputAudio,
      @JsonKey(includeIfNull: false) this.audio,
      @JsonKey(includeIfNull: false) this.transcript})
      : super._();
  factory ContentPartInputAudio.fromJson(Map<String, dynamic> json) =>
      _$ContentPartInputAudioFromJson(json);

  /// The content type.
  @override
  @JsonKey()
  final ContentType type;

  /// Base64-encoded audio bytes.
  @JsonKey(includeIfNull: false)
  final String? audio;

  /// The transcript of the audio.
  @JsonKey(includeIfNull: false)
  final String? transcript;

  /// Create a copy of ContentPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentPartInputAudioCopyWith<ContentPartInputAudio> get copyWith =>
      _$ContentPartInputAudioCopyWithImpl<ContentPartInputAudio>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContentPartInputAudioToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentPartInputAudio &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, audio, transcript);

  @override
  String toString() {
    return 'ContentPart.inputAudio(type: $type, audio: $audio, transcript: $transcript)';
  }
}

/// @nodoc
abstract mixin class $ContentPartInputAudioCopyWith<$Res>
    implements $ContentPartCopyWith<$Res> {
  factory $ContentPartInputAudioCopyWith(ContentPartInputAudio value,
          $Res Function(ContentPartInputAudio) _then) =
      _$ContentPartInputAudioCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ContentType type,
      @JsonKey(includeIfNull: false) String? audio,
      @JsonKey(includeIfNull: false) String? transcript});
}

/// @nodoc
class _$ContentPartInputAudioCopyWithImpl<$Res>
    implements $ContentPartInputAudioCopyWith<$Res> {
  _$ContentPartInputAudioCopyWithImpl(this._self, this._then);

  final ContentPartInputAudio _self;
  final $Res Function(ContentPartInputAudio) _then;

  /// Create a copy of ContentPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? audio = freezed,
    Object? transcript = freezed,
  }) {
    return _then(ContentPartInputAudio(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentType,
      audio: freezed == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
      transcript: freezed == transcript
          ? _self.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ContentPartText extends ContentPart {
  const ContentPartText({this.type = ContentType.text, required this.text})
      : super._();
  factory ContentPartText.fromJson(Map<String, dynamic> json) =>
      _$ContentPartTextFromJson(json);

  /// The content type.
  @override
  @JsonKey()
  final ContentType type;

  /// The text content.
  final String text;

  /// Create a copy of ContentPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentPartTextCopyWith<ContentPartText> get copyWith =>
      _$ContentPartTextCopyWithImpl<ContentPartText>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContentPartTextToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentPartText &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, text);

  @override
  String toString() {
    return 'ContentPart.text(type: $type, text: $text)';
  }
}

/// @nodoc
abstract mixin class $ContentPartTextCopyWith<$Res>
    implements $ContentPartCopyWith<$Res> {
  factory $ContentPartTextCopyWith(
          ContentPartText value, $Res Function(ContentPartText) _then) =
      _$ContentPartTextCopyWithImpl;
  @override
  @useResult
  $Res call({ContentType type, String text});
}

/// @nodoc
class _$ContentPartTextCopyWithImpl<$Res>
    implements $ContentPartTextCopyWith<$Res> {
  _$ContentPartTextCopyWithImpl(this._self, this._then);

  final ContentPartText _self;
  final $Res Function(ContentPartText) _then;

  /// Create a copy of ContentPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? text = null,
  }) {
    return _then(ContentPartText(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentType,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ContentPartAudio extends ContentPart {
  const ContentPartAudio(
      {this.type = ContentType.audio,
      @JsonKey(includeIfNull: false) this.audio,
      @JsonKey(includeIfNull: false) this.transcript})
      : super._();
  factory ContentPartAudio.fromJson(Map<String, dynamic> json) =>
      _$ContentPartAudioFromJson(json);

  /// The content type.
  @override
  @JsonKey()
  final ContentType type;

  /// Base64-encoded audio bytes.
  @JsonKey(includeIfNull: false)
  final String? audio;

  /// The transcript of the audio.
  @JsonKey(includeIfNull: false)
  final String? transcript;

  /// Create a copy of ContentPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentPartAudioCopyWith<ContentPartAudio> get copyWith =>
      _$ContentPartAudioCopyWithImpl<ContentPartAudio>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContentPartAudioToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentPartAudio &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, audio, transcript);

  @override
  String toString() {
    return 'ContentPart.audio(type: $type, audio: $audio, transcript: $transcript)';
  }
}

/// @nodoc
abstract mixin class $ContentPartAudioCopyWith<$Res>
    implements $ContentPartCopyWith<$Res> {
  factory $ContentPartAudioCopyWith(
          ContentPartAudio value, $Res Function(ContentPartAudio) _then) =
      _$ContentPartAudioCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ContentType type,
      @JsonKey(includeIfNull: false) String? audio,
      @JsonKey(includeIfNull: false) String? transcript});
}

/// @nodoc
class _$ContentPartAudioCopyWithImpl<$Res>
    implements $ContentPartAudioCopyWith<$Res> {
  _$ContentPartAudioCopyWithImpl(this._self, this._then);

  final ContentPartAudio _self;
  final $Res Function(ContentPartAudio) _then;

  /// Create a copy of ContentPart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? audio = freezed,
    Object? transcript = freezed,
  }) {
    return _then(ContentPartAudio(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentType,
      audio: freezed == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
      transcript: freezed == transcript
          ? _self.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'message':
      return ItemMessage.fromJson(json);
    case 'function_call':
      return ItemFunctionCall.fromJson(json);
    case 'function_call_output':
      return ItemFunctionCallOutput.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'Item', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$Item {
  /// The unique ID of the item, this can be generated by the client to help manage server-side context,
  /// but is not required because the server will generate one if not provided.
  String get id;

  /// The object type, must be "realtime.item".
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  ObjectType? get object;

  /// The type of the item.
  ItemType get type;

  /// The status of the item. These have no effect on the conversation, but are accepted for consistency
  /// with the `conversation.item.created` event.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  ItemStatus? get status;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItemCopyWith<Item> get copyWith =>
      _$ItemCopyWithImpl<Item>(this as Item, _$identity);

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Item &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, object, type, status);

  @override
  String toString() {
    return 'Item(id: $id, object: $object, type: $type, status: $status)';
  }
}

/// @nodoc
abstract mixin class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) _then) =
      _$ItemCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ObjectType object,
      ItemType type,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ItemStatus? status});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._self, this._then);

  final Item _self;
  final $Res Function(Item) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? type = null,
    Object? status = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _self.object!
          : object // ignore: cast_nullable_to_non_nullable
              as ObjectType,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ItemType,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ItemStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ItemMessage extends Item {
  const ItemMessage(
      {required this.id,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.object,
      this.type = ItemType.message,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.status,
      required this.role,
      required final List<ContentPart> content})
      : _content = content,
        super._();
  factory ItemMessage.fromJson(Map<String, dynamic> json) =>
      _$ItemMessageFromJson(json);

  /// The unique ID of the item, this can be generated by the client to help manage server-side context,
  /// but is not required because the server will generate one if not provided.
  @override
  final String id;

  /// The object type, must be "realtime.item".
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final ObjectType? object;

  /// The type of the item.
  @override
  @JsonKey()
  final ItemType type;

  /// The status of the item. These have no effect on the conversation, but are accepted for consistency
  /// with the `conversation.item.created` event.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final ItemStatus? status;

  /// The role of the message sender.
  final ItemRole role;

  /// The content of the message. Message items with a role of `system` support only `input_text` content,
  /// message items of role `user` support `input_text` and `input_audio` content, and message items of role
  /// `assistant` support `text` content.
  final List<ContentPart> _content;

  /// The content of the message. Message items with a role of `system` support only `input_text` content,
  /// message items of role `user` support `input_text` and `input_audio` content, and message items of role
  /// `assistant` support `text` content.
  List<ContentPart> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItemMessageCopyWith<ItemMessage> get copyWith =>
      _$ItemMessageCopyWithImpl<ItemMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ItemMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItemMessage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other._content, _content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, object, type, status, role,
      const DeepCollectionEquality().hash(_content));

  @override
  String toString() {
    return 'Item.message(id: $id, object: $object, type: $type, status: $status, role: $role, content: $content)';
  }
}

/// @nodoc
abstract mixin class $ItemMessageCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory $ItemMessageCopyWith(
          ItemMessage value, $Res Function(ItemMessage) _then) =
      _$ItemMessageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ObjectType? object,
      ItemType type,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ItemStatus? status,
      ItemRole role,
      List<ContentPart> content});
}

/// @nodoc
class _$ItemMessageCopyWithImpl<$Res> implements $ItemMessageCopyWith<$Res> {
  _$ItemMessageCopyWithImpl(this._self, this._then);

  final ItemMessage _self;
  final $Res Function(ItemMessage) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? object = freezed,
    Object? type = null,
    Object? status = freezed,
    Object? role = null,
    Object? content = null,
  }) {
    return _then(ItemMessage(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: freezed == object
          ? _self.object
          : object // ignore: cast_nullable_to_non_nullable
              as ObjectType?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ItemType,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ItemStatus?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as ItemRole,
      content: null == content
          ? _self._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<ContentPart>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ItemFunctionCall extends Item {
  const ItemFunctionCall(
      {required this.id,
      this.object = ObjectType.realtimeItem,
      this.type = ItemType.functionCall,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.status,
      @JsonKey(name: 'call_id') required this.callId,
      required this.name,
      required this.arguments})
      : super._();
  factory ItemFunctionCall.fromJson(Map<String, dynamic> json) =>
      _$ItemFunctionCallFromJson(json);

  /// The unique ID of the item, this can be generated by the client to help manage server-side context,
  /// but is not required because the server will generate one if not provided.
  @override
  final String id;

  /// The object type.
  @override
  @JsonKey()
  final ObjectType object;

  /// The type of the item.
  @override
  @JsonKey()
  final ItemType type;

  /// The status of the item. These have no effect on the conversation, but are accepted for consistency
  /// with the `conversation.item.created` event.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final ItemStatus? status;

  /// The ID of the function call (for `function_call` and `function_call_output` items). If passed on a
  /// `function_call_output` item, the server will check that a `function_call` item with the same ID
  /// exists in the conversation history.
  @JsonKey(name: 'call_id')
  final String callId;

  /// The name of the function being called.
  final String name;

  /// The arguments of the function call.
  final String arguments;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItemFunctionCallCopyWith<ItemFunctionCall> get copyWith =>
      _$ItemFunctionCallCopyWithImpl<ItemFunctionCall>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ItemFunctionCallToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItemFunctionCall &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.arguments, arguments) ||
                other.arguments == arguments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, object, type, status, callId, name, arguments);

  @override
  String toString() {
    return 'Item.functionCall(id: $id, object: $object, type: $type, status: $status, callId: $callId, name: $name, arguments: $arguments)';
  }
}

/// @nodoc
abstract mixin class $ItemFunctionCallCopyWith<$Res>
    implements $ItemCopyWith<$Res> {
  factory $ItemFunctionCallCopyWith(
          ItemFunctionCall value, $Res Function(ItemFunctionCall) _then) =
      _$ItemFunctionCallCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      ObjectType object,
      ItemType type,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ItemStatus? status,
      @JsonKey(name: 'call_id') String callId,
      String name,
      String arguments});
}

/// @nodoc
class _$ItemFunctionCallCopyWithImpl<$Res>
    implements $ItemFunctionCallCopyWith<$Res> {
  _$ItemFunctionCallCopyWithImpl(this._self, this._then);

  final ItemFunctionCall _self;
  final $Res Function(ItemFunctionCall) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? type = null,
    Object? status = freezed,
    Object? callId = null,
    Object? name = null,
    Object? arguments = null,
  }) {
    return _then(ItemFunctionCall(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _self.object
          : object // ignore: cast_nullable_to_non_nullable
              as ObjectType,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ItemType,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ItemStatus?,
      callId: null == callId
          ? _self.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      arguments: null == arguments
          ? _self.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ItemFunctionCallOutput extends Item {
  const ItemFunctionCallOutput(
      {required this.id,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.object,
      this.type = ItemType.functionCallOutput,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.status,
      @JsonKey(name: 'call_id') required this.callId,
      required this.output})
      : super._();
  factory ItemFunctionCallOutput.fromJson(Map<String, dynamic> json) =>
      _$ItemFunctionCallOutputFromJson(json);

  /// The unique ID of the item, this can be generated by the client to help manage server-side context,
  /// but is not required because the server will generate one if not provided.
  @override
  final String id;

  /// The object type. Always "realtime.item".
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final ObjectType? object;

  /// The type of the item.
  @override
  @JsonKey()
  final ItemType type;

  /// The status of the item. These have no effect on the conversation, but are accepted for consistency
  /// with the `conversation.item.created` event.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final ItemStatus? status;

  /// The ID of the function call.
  @JsonKey(name: 'call_id')
  final String callId;

  /// The output of the function call.
  final String output;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItemFunctionCallOutputCopyWith<ItemFunctionCallOutput> get copyWith =>
      _$ItemFunctionCallOutputCopyWithImpl<ItemFunctionCallOutput>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ItemFunctionCallOutputToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItemFunctionCallOutput &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.output, output) || other.output == output));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, object, type, status, callId, output);

  @override
  String toString() {
    return 'Item.functionCallOutput(id: $id, object: $object, type: $type, status: $status, callId: $callId, output: $output)';
  }
}

/// @nodoc
abstract mixin class $ItemFunctionCallOutputCopyWith<$Res>
    implements $ItemCopyWith<$Res> {
  factory $ItemFunctionCallOutputCopyWith(ItemFunctionCallOutput value,
          $Res Function(ItemFunctionCallOutput) _then) =
      _$ItemFunctionCallOutputCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ObjectType? object,
      ItemType type,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ItemStatus? status,
      @JsonKey(name: 'call_id') String callId,
      String output});
}

/// @nodoc
class _$ItemFunctionCallOutputCopyWithImpl<$Res>
    implements $ItemFunctionCallOutputCopyWith<$Res> {
  _$ItemFunctionCallOutputCopyWithImpl(this._self, this._then);

  final ItemFunctionCallOutput _self;
  final $Res Function(ItemFunctionCallOutput) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? object = freezed,
    Object? type = null,
    Object? status = freezed,
    Object? callId = null,
    Object? output = null,
  }) {
    return _then(ItemFunctionCallOutput(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: freezed == object
          ? _self.object
          : object // ignore: cast_nullable_to_non_nullable
              as ObjectType?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ItemType,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ItemStatus?,
      callId: null == callId
          ? _self.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String,
      output: null == output
          ? _self.output
          : output // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

ResponseStatusDetails _$ResponseStatusDetailsFromJson(
    Map<String, dynamic> json) {
  switch (json['type']) {
    case 'completed':
      return ResponseStatusDetailsCompleted.fromJson(json);
    case 'cancelled':
      return ResponseStatusDetailsCancelled.fromJson(json);
    case 'incomplete':
      return ResponseStatusDetailsIncomplete.fromJson(json);
    case 'failed':
      return ResponseStatusDetailsFailed.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'ResponseStatusDetails',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ResponseStatusDetails {
  /// The type of error that caused the response to fail.
  ResponseStatusType get type;

  /// Create a copy of ResponseStatusDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseStatusDetailsCopyWith<ResponseStatusDetails> get copyWith =>
      _$ResponseStatusDetailsCopyWithImpl<ResponseStatusDetails>(
          this as ResponseStatusDetails, _$identity);

  /// Serializes this ResponseStatusDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseStatusDetails &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  @override
  String toString() {
    return 'ResponseStatusDetails(type: $type)';
  }
}

/// @nodoc
abstract mixin class $ResponseStatusDetailsCopyWith<$Res> {
  factory $ResponseStatusDetailsCopyWith(ResponseStatusDetails value,
          $Res Function(ResponseStatusDetails) _then) =
      _$ResponseStatusDetailsCopyWithImpl;
  @useResult
  $Res call({ResponseStatusType type});
}

/// @nodoc
class _$ResponseStatusDetailsCopyWithImpl<$Res>
    implements $ResponseStatusDetailsCopyWith<$Res> {
  _$ResponseStatusDetailsCopyWithImpl(this._self, this._then);

  final ResponseStatusDetails _self;
  final $Res Function(ResponseStatusDetails) _then;

  /// Create a copy of ResponseStatusDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ResponseStatusType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ResponseStatusDetailsCompleted extends ResponseStatusDetails {
  const ResponseStatusDetailsCompleted(
      {this.type = ResponseStatusType.completed,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.reason})
      : super._();
  factory ResponseStatusDetailsCompleted.fromJson(Map<String, dynamic> json) =>
      _$ResponseStatusDetailsCompletedFromJson(json);

  /// The type of error that caused the response to fail.
  @override
  @JsonKey()
  final ResponseStatusType type;

  /// The reason the Response did not complete. For a `cancelled` Response, one of `turn_detected`
  /// (the server VAD detected a new start of speech) or `client_cancelled` (the client sent a
  /// cancel event). For an `incomplete` Response, one of `max_output_tokens` or `content_filter`
  /// (the server-side safety filter activated and cut off the response).
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final ResponseStatusReason? reason;

  /// Create a copy of ResponseStatusDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseStatusDetailsCompletedCopyWith<ResponseStatusDetailsCompleted>
      get copyWith => _$ResponseStatusDetailsCompletedCopyWithImpl<
          ResponseStatusDetailsCompleted>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponseStatusDetailsCompletedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseStatusDetailsCompleted &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, reason);

  @override
  String toString() {
    return 'ResponseStatusDetails.completed(type: $type, reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $ResponseStatusDetailsCompletedCopyWith<$Res>
    implements $ResponseStatusDetailsCopyWith<$Res> {
  factory $ResponseStatusDetailsCompletedCopyWith(
          ResponseStatusDetailsCompleted value,
          $Res Function(ResponseStatusDetailsCompleted) _then) =
      _$ResponseStatusDetailsCompletedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ResponseStatusType type,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ResponseStatusReason? reason});
}

/// @nodoc
class _$ResponseStatusDetailsCompletedCopyWithImpl<$Res>
    implements $ResponseStatusDetailsCompletedCopyWith<$Res> {
  _$ResponseStatusDetailsCompletedCopyWithImpl(this._self, this._then);

  final ResponseStatusDetailsCompleted _self;
  final $Res Function(ResponseStatusDetailsCompleted) _then;

  /// Create a copy of ResponseStatusDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? reason = freezed,
  }) {
    return _then(ResponseStatusDetailsCompleted(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ResponseStatusType,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as ResponseStatusReason?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ResponseStatusDetailsCancelled extends ResponseStatusDetails {
  const ResponseStatusDetailsCancelled(
      {this.type = ResponseStatusType.cancelled,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.reason})
      : super._();
  factory ResponseStatusDetailsCancelled.fromJson(Map<String, dynamic> json) =>
      _$ResponseStatusDetailsCancelledFromJson(json);

  /// The type of error that caused the response to fail.
  @override
  @JsonKey()
  final ResponseStatusType type;

  /// The reason the Response did not complete. For a `cancelled` Response, one of `turn_detected`
  /// (the server VAD detected a new start of speech) or `client_cancelled` (the client sent a
  /// cancel event). For an `incomplete` Response, one of `max_output_tokens` or `content_filter`
  /// (the server-side safety filter activated and cut off the response).
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final ResponseStatusReason? reason;

  /// Create a copy of ResponseStatusDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseStatusDetailsCancelledCopyWith<ResponseStatusDetailsCancelled>
      get copyWith => _$ResponseStatusDetailsCancelledCopyWithImpl<
          ResponseStatusDetailsCancelled>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponseStatusDetailsCancelledToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseStatusDetailsCancelled &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, reason);

  @override
  String toString() {
    return 'ResponseStatusDetails.cancelled(type: $type, reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $ResponseStatusDetailsCancelledCopyWith<$Res>
    implements $ResponseStatusDetailsCopyWith<$Res> {
  factory $ResponseStatusDetailsCancelledCopyWith(
          ResponseStatusDetailsCancelled value,
          $Res Function(ResponseStatusDetailsCancelled) _then) =
      _$ResponseStatusDetailsCancelledCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ResponseStatusType type,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ResponseStatusReason? reason});
}

/// @nodoc
class _$ResponseStatusDetailsCancelledCopyWithImpl<$Res>
    implements $ResponseStatusDetailsCancelledCopyWith<$Res> {
  _$ResponseStatusDetailsCancelledCopyWithImpl(this._self, this._then);

  final ResponseStatusDetailsCancelled _self;
  final $Res Function(ResponseStatusDetailsCancelled) _then;

  /// Create a copy of ResponseStatusDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? reason = freezed,
  }) {
    return _then(ResponseStatusDetailsCancelled(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ResponseStatusType,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as ResponseStatusReason?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ResponseStatusDetailsIncomplete extends ResponseStatusDetails {
  const ResponseStatusDetailsIncomplete(
      {this.type = ResponseStatusType.incomplete,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.reason})
      : super._();
  factory ResponseStatusDetailsIncomplete.fromJson(Map<String, dynamic> json) =>
      _$ResponseStatusDetailsIncompleteFromJson(json);

  /// The type of error that caused the response to fail.
  @override
  @JsonKey()
  final ResponseStatusType type;

  /// The reason the Response did not complete. For a `cancelled` Response, one of `turn_detected`
  /// (the server VAD detected a new start of speech) or `client_cancelled` (the client sent a
  /// cancel event). For an `incomplete` Response, one of `max_output_tokens` or `content_filter`
  /// (the server-side safety filter activated and cut off the response).
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final ResponseStatusReason? reason;

  /// Create a copy of ResponseStatusDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseStatusDetailsIncompleteCopyWith<ResponseStatusDetailsIncomplete>
      get copyWith => _$ResponseStatusDetailsIncompleteCopyWithImpl<
          ResponseStatusDetailsIncomplete>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponseStatusDetailsIncompleteToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseStatusDetailsIncomplete &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, reason);

  @override
  String toString() {
    return 'ResponseStatusDetails.incomplete(type: $type, reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $ResponseStatusDetailsIncompleteCopyWith<$Res>
    implements $ResponseStatusDetailsCopyWith<$Res> {
  factory $ResponseStatusDetailsIncompleteCopyWith(
          ResponseStatusDetailsIncomplete value,
          $Res Function(ResponseStatusDetailsIncomplete) _then) =
      _$ResponseStatusDetailsIncompleteCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ResponseStatusType type,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ResponseStatusReason? reason});
}

/// @nodoc
class _$ResponseStatusDetailsIncompleteCopyWithImpl<$Res>
    implements $ResponseStatusDetailsIncompleteCopyWith<$Res> {
  _$ResponseStatusDetailsIncompleteCopyWithImpl(this._self, this._then);

  final ResponseStatusDetailsIncomplete _self;
  final $Res Function(ResponseStatusDetailsIncomplete) _then;

  /// Create a copy of ResponseStatusDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? reason = freezed,
  }) {
    return _then(ResponseStatusDetailsIncomplete(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ResponseStatusType,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as ResponseStatusReason?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ResponseStatusDetailsFailed extends ResponseStatusDetails {
  const ResponseStatusDetailsFailed(
      {this.type = ResponseStatusType.failed,
      @JsonKey(includeIfNull: false) this.error})
      : super._();
  factory ResponseStatusDetailsFailed.fromJson(Map<String, dynamic> json) =>
      _$ResponseStatusDetailsFailedFromJson(json);

  /// The type of error that caused the response to fail.
  @override
  @JsonKey()
  final ResponseStatusType type;

  /// Details of the API error.
  @JsonKey(includeIfNull: false)
  final APIError? error;

  /// Create a copy of ResponseStatusDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseStatusDetailsFailedCopyWith<ResponseStatusDetailsFailed>
      get copyWith => _$ResponseStatusDetailsFailedCopyWithImpl<
          ResponseStatusDetailsFailed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponseStatusDetailsFailedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseStatusDetailsFailed &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, error);

  @override
  String toString() {
    return 'ResponseStatusDetails.failed(type: $type, error: $error)';
  }
}

/// @nodoc
abstract mixin class $ResponseStatusDetailsFailedCopyWith<$Res>
    implements $ResponseStatusDetailsCopyWith<$Res> {
  factory $ResponseStatusDetailsFailedCopyWith(
          ResponseStatusDetailsFailed value,
          $Res Function(ResponseStatusDetailsFailed) _then) =
      _$ResponseStatusDetailsFailedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ResponseStatusType type,
      @JsonKey(includeIfNull: false) APIError? error});

  $APIErrorCopyWith<$Res>? get error;
}

/// @nodoc
class _$ResponseStatusDetailsFailedCopyWithImpl<$Res>
    implements $ResponseStatusDetailsFailedCopyWith<$Res> {
  _$ResponseStatusDetailsFailedCopyWithImpl(this._self, this._then);

  final ResponseStatusDetailsFailed _self;
  final $Res Function(ResponseStatusDetailsFailed) _then;

  /// Create a copy of ResponseStatusDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? error = freezed,
  }) {
    return _then(ResponseStatusDetailsFailed(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ResponseStatusType,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as APIError?,
    ));
  }

  /// Create a copy of ResponseStatusDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $APIErrorCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $APIErrorCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

RealtimeEvent _$RealtimeEventFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'conversation.item.create':
      return RealtimeEventConversationItemCreate.fromJson(json);
    case 'conversation.item.delete':
      return RealtimeEventConversationItemDelete.fromJson(json);
    case 'conversation.item.truncate':
      return RealtimeEventConversationItemTruncate.fromJson(json);
    case 'input_audio_buffer.append':
      return RealtimeEventInputAudioBufferAppend.fromJson(json);
    case 'input_audio_buffer.clear':
      return RealtimeEventInputAudioBufferClear.fromJson(json);
    case 'input_audio_buffer.commit':
      return RealtimeEventInputAudioBufferCommit.fromJson(json);
    case 'response.cancel':
      return RealtimeEventResponseCancel.fromJson(json);
    case 'response.create':
      return RealtimeEventResponseCreate.fromJson(json);
    case 'session.update':
      return RealtimeEventSessionUpdate.fromJson(json);
    case 'conversation.created':
      return RealtimeEventConversationCreated.fromJson(json);
    case 'conversation.item.created':
      return RealtimeEventConversationItemCreated.fromJson(json);
    case 'conversation.item.deleted':
      return RealtimeEventConversationItemDeleted.fromJson(json);
    case 'conversation.item.input_audio_transcription.completed':
      return RealtimeEventConversationItemInputAudioTranscriptionCompleted
          .fromJson(json);
    case 'conversation.item.input_audio_transcription.failed':
      return RealtimeEventConversationItemInputAudioTranscriptionFailed
          .fromJson(json);
    case 'conversation.item.input_audio_transcription.delta':
      return RealtimeEventConversationItemInputAudioTranscriptionDelta.fromJson(
          json);
    case 'conversation.item.truncated':
      return RealtimeEventConversationItemTruncated.fromJson(json);
    case 'error':
      return RealtimeEventError.fromJson(json);
    case 'input_audio_buffer.cleared':
      return RealtimeEventInputAudioBufferCleared.fromJson(json);
    case 'input_audio_buffer.committed':
      return RealtimeEventInputAudioBufferCommitted.fromJson(json);
    case 'input_audio_buffer.speech_started':
      return RealtimeEventInputAudioBufferSpeechStarted.fromJson(json);
    case 'input_audio_buffer.speech_stopped':
      return RealtimeEventInputAudioBufferSpeechStopped.fromJson(json);
    case 'rate_limits.updated':
      return RealtimeEventRateLimitsUpdated.fromJson(json);
    case 'response.audio.delta':
      return RealtimeEventResponseAudioDelta.fromJson(json);
    case 'response.audio.done':
      return RealtimeEventResponseAudioDone.fromJson(json);
    case 'response.audio_transcript.delta':
      return RealtimeEventResponseAudioTranscriptDelta.fromJson(json);
    case 'response.audio_transcript.done':
      return RealtimeEventResponseAudioTranscriptDone.fromJson(json);
    case 'response.content_part.added':
      return RealtimeEventResponseContentPartAdded.fromJson(json);
    case 'response.content_part.done':
      return RealtimeEventResponseContentPartDone.fromJson(json);
    case 'response.created':
      return RealtimeEventResponseCreated.fromJson(json);
    case 'response.done':
      return RealtimeEventResponseDone.fromJson(json);
    case 'response.function_call_arguments.delta':
      return RealtimeEventResponseFunctionCallArgumentsDelta.fromJson(json);
    case 'response.function_call_arguments.done':
      return RealtimeEventResponseFunctionCallArgumentsDone.fromJson(json);
    case 'response.output_item.added':
      return RealtimeEventResponseOutputItemAdded.fromJson(json);
    case 'response.output_item.done':
      return RealtimeEventResponseOutputItemDone.fromJson(json);
    case 'response.text.delta':
      return RealtimeEventResponseTextDelta.fromJson(json);
    case 'response.text.done':
      return RealtimeEventResponseTextDone.fromJson(json);
    case 'session.created':
      return RealtimeEventSessionCreated.fromJson(json);
    case 'session.updated':
      return RealtimeEventSessionUpdated.fromJson(json);
    case 'close':
      return RealtimeEventClose.fromJson(json);
    case 'conversation.interrupted':
      return RealtimeEventConversationInterrupted.fromJson(json);
    case 'conversation.updated':
      return RealtimeEventConversationUpdated.fromJson(json);
    case 'conversation.item.appended':
      return RealtimeEventConversationItemAppended.fromJson(json);
    case 'conversation.item.completed':
      return RealtimeEventConversationItemCompleted.fromJson(json);
    case 'realtime.event':
      return RealtimeEventGeneric.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'RealtimeEvent',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$RealtimeEvent {
  /// Optional client-generated ID used to identify this event.
  @JsonKey(name: 'event_id')
  @JsonKey(name: 'event_id', includeIfNull: false)
  String? get eventId;

  /// The type of the event.
  RealtimeEventType get type;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventCopyWith<RealtimeEvent> get copyWith =>
      _$RealtimeEventCopyWithImpl<RealtimeEvent>(
          this as RealtimeEvent, _$identity);

  /// Serializes this RealtimeEvent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEvent &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type);

  @override
  String toString() {
    return 'RealtimeEvent(eventId: $eventId, type: $type)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventCopyWith(
          RealtimeEvent value, $Res Function(RealtimeEvent) _then) =
      _$RealtimeEventCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId, RealtimeEventType type});
}

/// @nodoc
class _$RealtimeEventCopyWithImpl<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  _$RealtimeEventCopyWithImpl(this._self, this._then);

  final RealtimeEvent _self;
  final $Res Function(RealtimeEvent) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      eventId: null == eventId
          ? _self.eventId!
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventConversationItemCreate extends RealtimeEvent {
  const RealtimeEventConversationItemCreate(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.conversationItemCreate,
      @JsonKey(name: 'previous_item_id', includeIfNull: false)
      this.previousItemId,
      required this.item})
      : super._();
  factory RealtimeEventConversationItemCreate.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventConversationItemCreateFromJson(json);

  /// Optional client-generated ID used to identify this event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the preceding item after which the new item will be inserted. If not set, the new item
  /// will be appended to the end of the conversation. If set, it allows an item to be inserted
  /// mid-conversation. If the ID cannot be found, an error will be returned and the item will not be
  /// added.
  @JsonKey(name: 'previous_item_id', includeIfNull: false)
  final String? previousItemId;

  /// The item to add to the conversation.
  /// Any of: [ItemMessage], [ItemFunctionCall], [ItemFunctionCallOutput]
  final Item item;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventConversationItemCreateCopyWith<
          RealtimeEventConversationItemCreate>
      get copyWith => _$RealtimeEventConversationItemCreateCopyWithImpl<
          RealtimeEventConversationItemCreate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventConversationItemCreateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventConversationItemCreate &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.previousItemId, previousItemId) ||
                other.previousItemId == previousItemId) &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, type, previousItemId, item);

  @override
  String toString() {
    return 'RealtimeEvent.conversationItemCreate(eventId: $eventId, type: $type, previousItemId: $previousItemId, item: $item)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventConversationItemCreateCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventConversationItemCreateCopyWith(
          RealtimeEventConversationItemCreate value,
          $Res Function(RealtimeEventConversationItemCreate) _then) =
      _$RealtimeEventConversationItemCreateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'previous_item_id', includeIfNull: false)
      String? previousItemId,
      Item item});

  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class _$RealtimeEventConversationItemCreateCopyWithImpl<$Res>
    implements $RealtimeEventConversationItemCreateCopyWith<$Res> {
  _$RealtimeEventConversationItemCreateCopyWithImpl(this._self, this._then);

  final RealtimeEventConversationItemCreate _self;
  final $Res Function(RealtimeEventConversationItemCreate) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? previousItemId = freezed,
    Object? item = null,
  }) {
    return _then(RealtimeEventConversationItemCreate(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      previousItemId: freezed == previousItemId
          ? _self.previousItemId
          : previousItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res> get item {
    return $ItemCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventConversationItemDelete extends RealtimeEvent {
  const RealtimeEventConversationItemDelete(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.conversationItemDelete,
      @JsonKey(name: 'item_id') required this.itemId})
      : super._();
  factory RealtimeEventConversationItemDelete.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventConversationItemDeleteFromJson(json);

  /// Optional client-generated ID used to identify this event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the item to delete.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventConversationItemDeleteCopyWith<
          RealtimeEventConversationItemDelete>
      get copyWith => _$RealtimeEventConversationItemDeleteCopyWithImpl<
          RealtimeEventConversationItemDelete>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventConversationItemDeleteToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventConversationItemDelete &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, itemId);

  @override
  String toString() {
    return 'RealtimeEvent.conversationItemDelete(eventId: $eventId, type: $type, itemId: $itemId)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventConversationItemDeleteCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventConversationItemDeleteCopyWith(
          RealtimeEventConversationItemDelete value,
          $Res Function(RealtimeEventConversationItemDelete) _then) =
      _$RealtimeEventConversationItemDeleteCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'item_id') String itemId});
}

/// @nodoc
class _$RealtimeEventConversationItemDeleteCopyWithImpl<$Res>
    implements $RealtimeEventConversationItemDeleteCopyWith<$Res> {
  _$RealtimeEventConversationItemDeleteCopyWithImpl(this._self, this._then);

  final RealtimeEventConversationItemDelete _self;
  final $Res Function(RealtimeEventConversationItemDelete) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? itemId = null,
  }) {
    return _then(RealtimeEventConversationItemDelete(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventConversationItemTruncate extends RealtimeEvent {
  const RealtimeEventConversationItemTruncate(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.conversationItemTruncate,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'content_index') required this.contentIndex,
      @JsonKey(name: 'audio_end_ms') required this.audioEndMs})
      : super._();
  factory RealtimeEventConversationItemTruncate.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventConversationItemTruncateFromJson(json);

  /// Optional client-generated ID used to identify this event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the assistant message item to truncate. Only assistant message items can be truncated.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// The index of the content part to truncate. Set this to 0.
  @JsonKey(name: 'content_index')
  final int contentIndex;

  /// Inclusive duration up to which audio is truncated, in milliseconds. If the audio_end_ms is greater
  /// than the actual audio duration, the server will respond with an error.
  @JsonKey(name: 'audio_end_ms')
  final int audioEndMs;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventConversationItemTruncateCopyWith<
          RealtimeEventConversationItemTruncate>
      get copyWith => _$RealtimeEventConversationItemTruncateCopyWithImpl<
          RealtimeEventConversationItemTruncate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventConversationItemTruncateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventConversationItemTruncate &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.contentIndex, contentIndex) ||
                other.contentIndex == contentIndex) &&
            (identical(other.audioEndMs, audioEndMs) ||
                other.audioEndMs == audioEndMs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, type, itemId, contentIndex, audioEndMs);

  @override
  String toString() {
    return 'RealtimeEvent.conversationItemTruncate(eventId: $eventId, type: $type, itemId: $itemId, contentIndex: $contentIndex, audioEndMs: $audioEndMs)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventConversationItemTruncateCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventConversationItemTruncateCopyWith(
          RealtimeEventConversationItemTruncate value,
          $Res Function(RealtimeEventConversationItemTruncate) _then) =
      _$RealtimeEventConversationItemTruncateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'content_index') int contentIndex,
      @JsonKey(name: 'audio_end_ms') int audioEndMs});
}

/// @nodoc
class _$RealtimeEventConversationItemTruncateCopyWithImpl<$Res>
    implements $RealtimeEventConversationItemTruncateCopyWith<$Res> {
  _$RealtimeEventConversationItemTruncateCopyWithImpl(this._self, this._then);

  final RealtimeEventConversationItemTruncate _self;
  final $Res Function(RealtimeEventConversationItemTruncate) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? itemId = null,
    Object? contentIndex = null,
    Object? audioEndMs = null,
  }) {
    return _then(RealtimeEventConversationItemTruncate(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      contentIndex: null == contentIndex
          ? _self.contentIndex
          : contentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      audioEndMs: null == audioEndMs
          ? _self.audioEndMs
          : audioEndMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventInputAudioBufferAppend extends RealtimeEvent {
  const RealtimeEventInputAudioBufferAppend(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.inputAudioBufferAppend,
      required this.audio})
      : super._();
  factory RealtimeEventInputAudioBufferAppend.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventInputAudioBufferAppendFromJson(json);

  /// Optional client-generated ID used to identify this event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// Base64-encoded audio bytes. This must be in the format specified by the `input_audio_format` field
  /// in the session configuration.
  final String audio;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventInputAudioBufferAppendCopyWith<
          RealtimeEventInputAudioBufferAppend>
      get copyWith => _$RealtimeEventInputAudioBufferAppendCopyWithImpl<
          RealtimeEventInputAudioBufferAppend>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventInputAudioBufferAppendToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventInputAudioBufferAppend &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, audio);

  @override
  String toString() {
    return 'RealtimeEvent.inputAudioBufferAppend(eventId: $eventId, type: $type, audio: $audio)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventInputAudioBufferAppendCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventInputAudioBufferAppendCopyWith(
          RealtimeEventInputAudioBufferAppend value,
          $Res Function(RealtimeEventInputAudioBufferAppend) _then) =
      _$RealtimeEventInputAudioBufferAppendCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      String audio});
}

/// @nodoc
class _$RealtimeEventInputAudioBufferAppendCopyWithImpl<$Res>
    implements $RealtimeEventInputAudioBufferAppendCopyWith<$Res> {
  _$RealtimeEventInputAudioBufferAppendCopyWithImpl(this._self, this._then);

  final RealtimeEventInputAudioBufferAppend _self;
  final $Res Function(RealtimeEventInputAudioBufferAppend) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? audio = null,
  }) {
    return _then(RealtimeEventInputAudioBufferAppend(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      audio: null == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventInputAudioBufferClear extends RealtimeEvent {
  const RealtimeEventInputAudioBufferClear(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.inputAudioBufferClear})
      : super._();
  factory RealtimeEventInputAudioBufferClear.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventInputAudioBufferClearFromJson(json);

  /// Optional client-generated ID used to identify this event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventInputAudioBufferClearCopyWith<
          RealtimeEventInputAudioBufferClear>
      get copyWith => _$RealtimeEventInputAudioBufferClearCopyWithImpl<
          RealtimeEventInputAudioBufferClear>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventInputAudioBufferClearToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventInputAudioBufferClear &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type);

  @override
  String toString() {
    return 'RealtimeEvent.inputAudioBufferClear(eventId: $eventId, type: $type)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventInputAudioBufferClearCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventInputAudioBufferClearCopyWith(
          RealtimeEventInputAudioBufferClear value,
          $Res Function(RealtimeEventInputAudioBufferClear) _then) =
      _$RealtimeEventInputAudioBufferClearCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId, RealtimeEventType type});
}

/// @nodoc
class _$RealtimeEventInputAudioBufferClearCopyWithImpl<$Res>
    implements $RealtimeEventInputAudioBufferClearCopyWith<$Res> {
  _$RealtimeEventInputAudioBufferClearCopyWithImpl(this._self, this._then);

  final RealtimeEventInputAudioBufferClear _self;
  final $Res Function(RealtimeEventInputAudioBufferClear) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
  }) {
    return _then(RealtimeEventInputAudioBufferClear(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventInputAudioBufferCommit extends RealtimeEvent {
  const RealtimeEventInputAudioBufferCommit(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.inputAudioBufferCommit})
      : super._();
  factory RealtimeEventInputAudioBufferCommit.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventInputAudioBufferCommitFromJson(json);

  /// Optional client-generated ID used to identify this event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventInputAudioBufferCommitCopyWith<
          RealtimeEventInputAudioBufferCommit>
      get copyWith => _$RealtimeEventInputAudioBufferCommitCopyWithImpl<
          RealtimeEventInputAudioBufferCommit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventInputAudioBufferCommitToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventInputAudioBufferCommit &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type);

  @override
  String toString() {
    return 'RealtimeEvent.inputAudioBufferCommit(eventId: $eventId, type: $type)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventInputAudioBufferCommitCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventInputAudioBufferCommitCopyWith(
          RealtimeEventInputAudioBufferCommit value,
          $Res Function(RealtimeEventInputAudioBufferCommit) _then) =
      _$RealtimeEventInputAudioBufferCommitCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId, RealtimeEventType type});
}

/// @nodoc
class _$RealtimeEventInputAudioBufferCommitCopyWithImpl<$Res>
    implements $RealtimeEventInputAudioBufferCommitCopyWith<$Res> {
  _$RealtimeEventInputAudioBufferCommitCopyWithImpl(this._self, this._then);

  final RealtimeEventInputAudioBufferCommit _self;
  final $Res Function(RealtimeEventInputAudioBufferCommit) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
  }) {
    return _then(RealtimeEventInputAudioBufferCommit(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseCancel extends RealtimeEvent {
  const RealtimeEventResponseCancel(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseCancel,
      @JsonKey(name: 'response_id', includeIfNull: false) this.responseId})
      : super._();
  factory RealtimeEventResponseCancel.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventResponseCancelFromJson(json);

  /// Optional client-generated ID used to identify this event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// A specific response ID to cancel - if not provided, will cancel an
  /// in-progress response in the default conversation.
  @JsonKey(name: 'response_id', includeIfNull: false)
  final String? responseId;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseCancelCopyWith<RealtimeEventResponseCancel>
      get copyWith => _$RealtimeEventResponseCancelCopyWithImpl<
          RealtimeEventResponseCancel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseCancelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseCancel &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, responseId);

  @override
  String toString() {
    return 'RealtimeEvent.responseCancel(eventId: $eventId, type: $type, responseId: $responseId)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseCancelCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseCancelCopyWith(
          RealtimeEventResponseCancel value,
          $Res Function(RealtimeEventResponseCancel) _then) =
      _$RealtimeEventResponseCancelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'response_id', includeIfNull: false) String? responseId});
}

/// @nodoc
class _$RealtimeEventResponseCancelCopyWithImpl<$Res>
    implements $RealtimeEventResponseCancelCopyWith<$Res> {
  _$RealtimeEventResponseCancelCopyWithImpl(this._self, this._then);

  final RealtimeEventResponseCancel _self;
  final $Res Function(RealtimeEventResponseCancel) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? responseId = freezed,
  }) {
    return _then(RealtimeEventResponseCancel(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      responseId: freezed == responseId
          ? _self.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseCreate extends RealtimeEvent {
  const RealtimeEventResponseCreate(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseCreate,
      @JsonKey(includeIfNull: false) this.response})
      : super._();
  factory RealtimeEventResponseCreate.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventResponseCreateFromJson(json);

  /// Optional client-generated ID used to identify this event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// Configuration for the response.
  @JsonKey(includeIfNull: false)
  final ResponseConfig? response;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseCreateCopyWith<RealtimeEventResponseCreate>
      get copyWith => _$RealtimeEventResponseCreateCopyWithImpl<
          RealtimeEventResponseCreate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseCreateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseCreate &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, response);

  @override
  String toString() {
    return 'RealtimeEvent.responseCreate(eventId: $eventId, type: $type, response: $response)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseCreateCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseCreateCopyWith(
          RealtimeEventResponseCreate value,
          $Res Function(RealtimeEventResponseCreate) _then) =
      _$RealtimeEventResponseCreateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(includeIfNull: false) ResponseConfig? response});

  $ResponseConfigCopyWith<$Res>? get response;
}

/// @nodoc
class _$RealtimeEventResponseCreateCopyWithImpl<$Res>
    implements $RealtimeEventResponseCreateCopyWith<$Res> {
  _$RealtimeEventResponseCreateCopyWithImpl(this._self, this._then);

  final RealtimeEventResponseCreate _self;
  final $Res Function(RealtimeEventResponseCreate) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? response = freezed,
  }) {
    return _then(RealtimeEventResponseCreate(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      response: freezed == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as ResponseConfig?,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseConfigCopyWith<$Res>? get response {
    if (_self.response == null) {
      return null;
    }

    return $ResponseConfigCopyWith<$Res>(_self.response!, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventSessionUpdate extends RealtimeEvent {
  const RealtimeEventSessionUpdate(
      {@JsonKey(name: 'event_id', includeIfNull: false) this.eventId,
      this.type = RealtimeEventType.sessionUpdate,
      required this.session})
      : super._();
  factory RealtimeEventSessionUpdate.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventSessionUpdateFromJson(json);

  /// Optional client-generated ID used to identify this event.
  @override
  @JsonKey(name: 'event_id', includeIfNull: false)
  final String? eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// Session configuration to update.
  final SessionConfig session;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventSessionUpdateCopyWith<RealtimeEventSessionUpdate>
      get copyWith =>
          _$RealtimeEventSessionUpdateCopyWithImpl<RealtimeEventSessionUpdate>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventSessionUpdateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventSessionUpdate &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.session, session) || other.session == session));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, session);

  @override
  String toString() {
    return 'RealtimeEvent.sessionUpdate(eventId: $eventId, type: $type, session: $session)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventSessionUpdateCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventSessionUpdateCopyWith(RealtimeEventSessionUpdate value,
          $Res Function(RealtimeEventSessionUpdate) _then) =
      _$RealtimeEventSessionUpdateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id', includeIfNull: false) String? eventId,
      RealtimeEventType type,
      SessionConfig session});

  $SessionConfigCopyWith<$Res> get session;
}

/// @nodoc
class _$RealtimeEventSessionUpdateCopyWithImpl<$Res>
    implements $RealtimeEventSessionUpdateCopyWith<$Res> {
  _$RealtimeEventSessionUpdateCopyWithImpl(this._self, this._then);

  final RealtimeEventSessionUpdate _self;
  final $Res Function(RealtimeEventSessionUpdate) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = freezed,
    Object? type = null,
    Object? session = null,
  }) {
    return _then(RealtimeEventSessionUpdate(
      eventId: freezed == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      session: null == session
          ? _self.session
          : session // ignore: cast_nullable_to_non_nullable
              as SessionConfig,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionConfigCopyWith<$Res> get session {
    return $SessionConfigCopyWith<$Res>(_self.session, (value) {
      return _then(_self.copyWith(session: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventConversationCreated extends RealtimeEvent {
  const RealtimeEventConversationCreated(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.conversationCreated,
      required this.conversation})
      : super._();
  factory RealtimeEventConversationCreated.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventConversationCreatedFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The conversation resource.
  final Conversation conversation;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventConversationCreatedCopyWith<RealtimeEventConversationCreated>
      get copyWith => _$RealtimeEventConversationCreatedCopyWithImpl<
          RealtimeEventConversationCreated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventConversationCreatedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventConversationCreated &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, conversation);

  @override
  String toString() {
    return 'RealtimeEvent.conversationCreated(eventId: $eventId, type: $type, conversation: $conversation)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventConversationCreatedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventConversationCreatedCopyWith(
          RealtimeEventConversationCreated value,
          $Res Function(RealtimeEventConversationCreated) _then) =
      _$RealtimeEventConversationCreatedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      Conversation conversation});

  $ConversationCopyWith<$Res> get conversation;
}

/// @nodoc
class _$RealtimeEventConversationCreatedCopyWithImpl<$Res>
    implements $RealtimeEventConversationCreatedCopyWith<$Res> {
  _$RealtimeEventConversationCreatedCopyWithImpl(this._self, this._then);

  final RealtimeEventConversationCreated _self;
  final $Res Function(RealtimeEventConversationCreated) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? conversation = null,
  }) {
    return _then(RealtimeEventConversationCreated(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      conversation: null == conversation
          ? _self.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversationCopyWith<$Res> get conversation {
    return $ConversationCopyWith<$Res>(_self.conversation, (value) {
      return _then(_self.copyWith(conversation: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventConversationItemCreated extends RealtimeEvent {
  const RealtimeEventConversationItemCreated(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.conversationItemCreated,
      @JsonKey(name: 'previous_item_id', includeIfNull: false)
      this.previousItemId,
      required this.item})
      : super._();
  factory RealtimeEventConversationItemCreated.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventConversationItemCreatedFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the preceding item in the Conversation context, allows the client to understand the
  /// order of the conversation.
  @JsonKey(name: 'previous_item_id', includeIfNull: false)
  final String? previousItemId;

  /// The item to add to the conversation.
  /// Any of: [ItemMessage], [ItemFunctionCall], [ItemFunctionCallOutput]
  final Item item;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventConversationItemCreatedCopyWith<
          RealtimeEventConversationItemCreated>
      get copyWith => _$RealtimeEventConversationItemCreatedCopyWithImpl<
          RealtimeEventConversationItemCreated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventConversationItemCreatedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventConversationItemCreated &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.previousItemId, previousItemId) ||
                other.previousItemId == previousItemId) &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, type, previousItemId, item);

  @override
  String toString() {
    return 'RealtimeEvent.conversationItemCreated(eventId: $eventId, type: $type, previousItemId: $previousItemId, item: $item)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventConversationItemCreatedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventConversationItemCreatedCopyWith(
          RealtimeEventConversationItemCreated value,
          $Res Function(RealtimeEventConversationItemCreated) _then) =
      _$RealtimeEventConversationItemCreatedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'previous_item_id', includeIfNull: false)
      String? previousItemId,
      Item item});

  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class _$RealtimeEventConversationItemCreatedCopyWithImpl<$Res>
    implements $RealtimeEventConversationItemCreatedCopyWith<$Res> {
  _$RealtimeEventConversationItemCreatedCopyWithImpl(this._self, this._then);

  final RealtimeEventConversationItemCreated _self;
  final $Res Function(RealtimeEventConversationItemCreated) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? previousItemId = freezed,
    Object? item = null,
  }) {
    return _then(RealtimeEventConversationItemCreated(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      previousItemId: freezed == previousItemId
          ? _self.previousItemId
          : previousItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res> get item {
    return $ItemCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventConversationItemDeleted extends RealtimeEvent {
  const RealtimeEventConversationItemDeleted(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.conversationItemDeleted,
      @JsonKey(name: 'item_id') required this.itemId})
      : super._();
  factory RealtimeEventConversationItemDeleted.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventConversationItemDeletedFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the item that was deleted.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventConversationItemDeletedCopyWith<
          RealtimeEventConversationItemDeleted>
      get copyWith => _$RealtimeEventConversationItemDeletedCopyWithImpl<
          RealtimeEventConversationItemDeleted>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventConversationItemDeletedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventConversationItemDeleted &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, itemId);

  @override
  String toString() {
    return 'RealtimeEvent.conversationItemDeleted(eventId: $eventId, type: $type, itemId: $itemId)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventConversationItemDeletedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventConversationItemDeletedCopyWith(
          RealtimeEventConversationItemDeleted value,
          $Res Function(RealtimeEventConversationItemDeleted) _then) =
      _$RealtimeEventConversationItemDeletedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'item_id') String itemId});
}

/// @nodoc
class _$RealtimeEventConversationItemDeletedCopyWithImpl<$Res>
    implements $RealtimeEventConversationItemDeletedCopyWith<$Res> {
  _$RealtimeEventConversationItemDeletedCopyWithImpl(this._self, this._then);

  final RealtimeEventConversationItemDeleted _self;
  final $Res Function(RealtimeEventConversationItemDeleted) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? itemId = null,
  }) {
    return _then(RealtimeEventConversationItemDeleted(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventConversationItemInputAudioTranscriptionCompleted
    extends RealtimeEvent {
  const RealtimeEventConversationItemInputAudioTranscriptionCompleted(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type =
          RealtimeEventType.conversationItemInputAudioTranscriptionCompleted,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'content_index') required this.contentIndex,
      required this.transcript})
      : super._();
  factory RealtimeEventConversationItemInputAudioTranscriptionCompleted.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventConversationItemInputAudioTranscriptionCompletedFromJson(
          json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the user message item containing the audio.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// The index of the content part containing the audio.
  @JsonKey(name: 'content_index')
  final int contentIndex;

  /// The transcribed text.
  final String transcript;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventConversationItemInputAudioTranscriptionCompletedCopyWith<
          RealtimeEventConversationItemInputAudioTranscriptionCompleted>
      get copyWith =>
          _$RealtimeEventConversationItemInputAudioTranscriptionCompletedCopyWithImpl<
                  RealtimeEventConversationItemInputAudioTranscriptionCompleted>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventConversationItemInputAudioTranscriptionCompletedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other
                is RealtimeEventConversationItemInputAudioTranscriptionCompleted &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.contentIndex, contentIndex) ||
                other.contentIndex == contentIndex) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, type, itemId, contentIndex, transcript);

  @override
  String toString() {
    return 'RealtimeEvent.conversationItemInputAudioTranscriptionCompleted(eventId: $eventId, type: $type, itemId: $itemId, contentIndex: $contentIndex, transcript: $transcript)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventConversationItemInputAudioTranscriptionCompletedCopyWith<
    $Res> implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventConversationItemInputAudioTranscriptionCompletedCopyWith(
          RealtimeEventConversationItemInputAudioTranscriptionCompleted value,
          $Res Function(
                  RealtimeEventConversationItemInputAudioTranscriptionCompleted)
              _then) =
      _$RealtimeEventConversationItemInputAudioTranscriptionCompletedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'content_index') int contentIndex,
      String transcript});
}

/// @nodoc
class _$RealtimeEventConversationItemInputAudioTranscriptionCompletedCopyWithImpl<
        $Res>
    implements
        $RealtimeEventConversationItemInputAudioTranscriptionCompletedCopyWith<
            $Res> {
  _$RealtimeEventConversationItemInputAudioTranscriptionCompletedCopyWithImpl(
      this._self, this._then);

  final RealtimeEventConversationItemInputAudioTranscriptionCompleted _self;
  final $Res Function(
      RealtimeEventConversationItemInputAudioTranscriptionCompleted) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? itemId = null,
    Object? contentIndex = null,
    Object? transcript = null,
  }) {
    return _then(RealtimeEventConversationItemInputAudioTranscriptionCompleted(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      contentIndex: null == contentIndex
          ? _self.contentIndex
          : contentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      transcript: null == transcript
          ? _self.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventConversationItemInputAudioTranscriptionFailed
    extends RealtimeEvent {
  const RealtimeEventConversationItemInputAudioTranscriptionFailed(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type =
          RealtimeEventType.conversationItemInputAudioTranscriptionFailed,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'content_index') required this.contentIndex,
      required this.error})
      : super._();
  factory RealtimeEventConversationItemInputAudioTranscriptionFailed.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventConversationItemInputAudioTranscriptionFailedFromJson(
          json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the user message item.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// The index of the content part containing the audio.
  @JsonKey(name: 'content_index')
  final int contentIndex;

  /// Details of the transcription error.
  final TranscriptionError error;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventConversationItemInputAudioTranscriptionFailedCopyWith<
          RealtimeEventConversationItemInputAudioTranscriptionFailed>
      get copyWith =>
          _$RealtimeEventConversationItemInputAudioTranscriptionFailedCopyWithImpl<
                  RealtimeEventConversationItemInputAudioTranscriptionFailed>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventConversationItemInputAudioTranscriptionFailedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other
                is RealtimeEventConversationItemInputAudioTranscriptionFailed &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.contentIndex, contentIndex) ||
                other.contentIndex == contentIndex) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, type, itemId, contentIndex, error);

  @override
  String toString() {
    return 'RealtimeEvent.conversationItemInputAudioTranscriptionFailed(eventId: $eventId, type: $type, itemId: $itemId, contentIndex: $contentIndex, error: $error)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventConversationItemInputAudioTranscriptionFailedCopyWith<
    $Res> implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventConversationItemInputAudioTranscriptionFailedCopyWith(
          RealtimeEventConversationItemInputAudioTranscriptionFailed value,
          $Res Function(
                  RealtimeEventConversationItemInputAudioTranscriptionFailed)
              _then) =
      _$RealtimeEventConversationItemInputAudioTranscriptionFailedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'content_index') int contentIndex,
      TranscriptionError error});

  $TranscriptionErrorCopyWith<$Res> get error;
}

/// @nodoc
class _$RealtimeEventConversationItemInputAudioTranscriptionFailedCopyWithImpl<
        $Res>
    implements
        $RealtimeEventConversationItemInputAudioTranscriptionFailedCopyWith<
            $Res> {
  _$RealtimeEventConversationItemInputAudioTranscriptionFailedCopyWithImpl(
      this._self, this._then);

  final RealtimeEventConversationItemInputAudioTranscriptionFailed _self;
  final $Res Function(
      RealtimeEventConversationItemInputAudioTranscriptionFailed) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? itemId = null,
    Object? contentIndex = null,
    Object? error = null,
  }) {
    return _then(RealtimeEventConversationItemInputAudioTranscriptionFailed(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      contentIndex: null == contentIndex
          ? _self.contentIndex
          : contentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as TranscriptionError,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TranscriptionErrorCopyWith<$Res> get error {
    return $TranscriptionErrorCopyWith<$Res>(_self.error, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventConversationItemInputAudioTranscriptionDelta
    extends RealtimeEvent {
  const RealtimeEventConversationItemInputAudioTranscriptionDelta(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type =
          RealtimeEventType.conversationItemInputAudioTranscriptionDelta,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'content_index', includeIfNull: false) this.contentIndex,
      @JsonKey(includeIfNull: false) this.delta})
      : super._();
  factory RealtimeEventConversationItemInputAudioTranscriptionDelta.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventConversationItemInputAudioTranscriptionDeltaFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the user message item containing the audio.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// The index of the content part containing the audio.
  @JsonKey(name: 'content_index', includeIfNull: false)
  final int? contentIndex;

  /// The text delta.
  @JsonKey(includeIfNull: false)
  final String? delta;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventConversationItemInputAudioTranscriptionDeltaCopyWith<
          RealtimeEventConversationItemInputAudioTranscriptionDelta>
      get copyWith =>
          _$RealtimeEventConversationItemInputAudioTranscriptionDeltaCopyWithImpl<
                  RealtimeEventConversationItemInputAudioTranscriptionDelta>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventConversationItemInputAudioTranscriptionDeltaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other
                is RealtimeEventConversationItemInputAudioTranscriptionDelta &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.contentIndex, contentIndex) ||
                other.contentIndex == contentIndex) &&
            (identical(other.delta, delta) || other.delta == delta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, type, itemId, contentIndex, delta);

  @override
  String toString() {
    return 'RealtimeEvent.conversationItemInputAudioTranscriptionDelta(eventId: $eventId, type: $type, itemId: $itemId, contentIndex: $contentIndex, delta: $delta)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventConversationItemInputAudioTranscriptionDeltaCopyWith<
    $Res> implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventConversationItemInputAudioTranscriptionDeltaCopyWith(
          RealtimeEventConversationItemInputAudioTranscriptionDelta value,
          $Res Function(
                  RealtimeEventConversationItemInputAudioTranscriptionDelta)
              _then) =
      _$RealtimeEventConversationItemInputAudioTranscriptionDeltaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'content_index', includeIfNull: false) int? contentIndex,
      @JsonKey(includeIfNull: false) String? delta});
}

/// @nodoc
class _$RealtimeEventConversationItemInputAudioTranscriptionDeltaCopyWithImpl<
        $Res>
    implements
        $RealtimeEventConversationItemInputAudioTranscriptionDeltaCopyWith<
            $Res> {
  _$RealtimeEventConversationItemInputAudioTranscriptionDeltaCopyWithImpl(
      this._self, this._then);

  final RealtimeEventConversationItemInputAudioTranscriptionDelta _self;
  final $Res Function(RealtimeEventConversationItemInputAudioTranscriptionDelta)
      _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? itemId = null,
    Object? contentIndex = freezed,
    Object? delta = freezed,
  }) {
    return _then(RealtimeEventConversationItemInputAudioTranscriptionDelta(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      contentIndex: freezed == contentIndex
          ? _self.contentIndex
          : contentIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      delta: freezed == delta
          ? _self.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventConversationItemTruncated extends RealtimeEvent {
  const RealtimeEventConversationItemTruncated(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.conversationItemTruncated,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'content_index') required this.contentIndex,
      @JsonKey(name: 'audio_end_ms') required this.audioEndMs})
      : super._();
  factory RealtimeEventConversationItemTruncated.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventConversationItemTruncatedFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the assistant message item that was truncated.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// The index of the content part that was truncated.
  @JsonKey(name: 'content_index')
  final int contentIndex;

  /// The duration up to which the audio was truncated, in milliseconds.
  @JsonKey(name: 'audio_end_ms')
  final int audioEndMs;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventConversationItemTruncatedCopyWith<
          RealtimeEventConversationItemTruncated>
      get copyWith => _$RealtimeEventConversationItemTruncatedCopyWithImpl<
          RealtimeEventConversationItemTruncated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventConversationItemTruncatedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventConversationItemTruncated &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.contentIndex, contentIndex) ||
                other.contentIndex == contentIndex) &&
            (identical(other.audioEndMs, audioEndMs) ||
                other.audioEndMs == audioEndMs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, type, itemId, contentIndex, audioEndMs);

  @override
  String toString() {
    return 'RealtimeEvent.conversationItemTruncated(eventId: $eventId, type: $type, itemId: $itemId, contentIndex: $contentIndex, audioEndMs: $audioEndMs)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventConversationItemTruncatedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventConversationItemTruncatedCopyWith(
          RealtimeEventConversationItemTruncated value,
          $Res Function(RealtimeEventConversationItemTruncated) _then) =
      _$RealtimeEventConversationItemTruncatedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'content_index') int contentIndex,
      @JsonKey(name: 'audio_end_ms') int audioEndMs});
}

/// @nodoc
class _$RealtimeEventConversationItemTruncatedCopyWithImpl<$Res>
    implements $RealtimeEventConversationItemTruncatedCopyWith<$Res> {
  _$RealtimeEventConversationItemTruncatedCopyWithImpl(this._self, this._then);

  final RealtimeEventConversationItemTruncated _self;
  final $Res Function(RealtimeEventConversationItemTruncated) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? itemId = null,
    Object? contentIndex = null,
    Object? audioEndMs = null,
  }) {
    return _then(RealtimeEventConversationItemTruncated(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      contentIndex: null == contentIndex
          ? _self.contentIndex
          : contentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      audioEndMs: null == audioEndMs
          ? _self.audioEndMs
          : audioEndMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventError extends RealtimeEvent {
  const RealtimeEventError(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.error,
      required this.error})
      : super._();
  factory RealtimeEventError.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventErrorFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// Details of the API error.
  final APIError error;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventErrorCopyWith<RealtimeEventError> get copyWith =>
      _$RealtimeEventErrorCopyWithImpl<RealtimeEventError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventErrorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventError &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, error);

  @override
  String toString() {
    return 'RealtimeEvent.error(eventId: $eventId, type: $type, error: $error)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventErrorCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventErrorCopyWith(
          RealtimeEventError value, $Res Function(RealtimeEventError) _then) =
      _$RealtimeEventErrorCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      APIError error});

  $APIErrorCopyWith<$Res> get error;
}

/// @nodoc
class _$RealtimeEventErrorCopyWithImpl<$Res>
    implements $RealtimeEventErrorCopyWith<$Res> {
  _$RealtimeEventErrorCopyWithImpl(this._self, this._then);

  final RealtimeEventError _self;
  final $Res Function(RealtimeEventError) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? error = null,
  }) {
    return _then(RealtimeEventError(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as APIError,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $APIErrorCopyWith<$Res> get error {
    return $APIErrorCopyWith<$Res>(_self.error, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventInputAudioBufferCleared extends RealtimeEvent {
  const RealtimeEventInputAudioBufferCleared(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.inputAudioBufferCleared})
      : super._();
  factory RealtimeEventInputAudioBufferCleared.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventInputAudioBufferClearedFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventInputAudioBufferClearedCopyWith<
          RealtimeEventInputAudioBufferCleared>
      get copyWith => _$RealtimeEventInputAudioBufferClearedCopyWithImpl<
          RealtimeEventInputAudioBufferCleared>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventInputAudioBufferClearedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventInputAudioBufferCleared &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type);

  @override
  String toString() {
    return 'RealtimeEvent.inputAudioBufferCleared(eventId: $eventId, type: $type)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventInputAudioBufferClearedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventInputAudioBufferClearedCopyWith(
          RealtimeEventInputAudioBufferCleared value,
          $Res Function(RealtimeEventInputAudioBufferCleared) _then) =
      _$RealtimeEventInputAudioBufferClearedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId, RealtimeEventType type});
}

/// @nodoc
class _$RealtimeEventInputAudioBufferClearedCopyWithImpl<$Res>
    implements $RealtimeEventInputAudioBufferClearedCopyWith<$Res> {
  _$RealtimeEventInputAudioBufferClearedCopyWithImpl(this._self, this._then);

  final RealtimeEventInputAudioBufferCleared _self;
  final $Res Function(RealtimeEventInputAudioBufferCleared) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
  }) {
    return _then(RealtimeEventInputAudioBufferCleared(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventInputAudioBufferCommitted extends RealtimeEvent {
  const RealtimeEventInputAudioBufferCommitted(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.inputAudioBufferCommitted,
      @JsonKey(name: 'previous_item_id', includeIfNull: false)
      this.previousItemId,
      @JsonKey(name: 'item_id') required this.itemId})
      : super._();
  factory RealtimeEventInputAudioBufferCommitted.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventInputAudioBufferCommittedFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the preceding item after which the new item will be inserted.
  @JsonKey(name: 'previous_item_id', includeIfNull: false)
  final String? previousItemId;

  /// The ID of the user message item that will be created.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventInputAudioBufferCommittedCopyWith<
          RealtimeEventInputAudioBufferCommitted>
      get copyWith => _$RealtimeEventInputAudioBufferCommittedCopyWithImpl<
          RealtimeEventInputAudioBufferCommitted>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventInputAudioBufferCommittedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventInputAudioBufferCommitted &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.previousItemId, previousItemId) ||
                other.previousItemId == previousItemId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, type, previousItemId, itemId);

  @override
  String toString() {
    return 'RealtimeEvent.inputAudioBufferCommitted(eventId: $eventId, type: $type, previousItemId: $previousItemId, itemId: $itemId)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventInputAudioBufferCommittedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventInputAudioBufferCommittedCopyWith(
          RealtimeEventInputAudioBufferCommitted value,
          $Res Function(RealtimeEventInputAudioBufferCommitted) _then) =
      _$RealtimeEventInputAudioBufferCommittedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'previous_item_id', includeIfNull: false)
      String? previousItemId,
      @JsonKey(name: 'item_id') String itemId});
}

/// @nodoc
class _$RealtimeEventInputAudioBufferCommittedCopyWithImpl<$Res>
    implements $RealtimeEventInputAudioBufferCommittedCopyWith<$Res> {
  _$RealtimeEventInputAudioBufferCommittedCopyWithImpl(this._self, this._then);

  final RealtimeEventInputAudioBufferCommitted _self;
  final $Res Function(RealtimeEventInputAudioBufferCommitted) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? previousItemId = freezed,
    Object? itemId = null,
  }) {
    return _then(RealtimeEventInputAudioBufferCommitted(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      previousItemId: freezed == previousItemId
          ? _self.previousItemId
          : previousItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventInputAudioBufferSpeechStarted extends RealtimeEvent {
  const RealtimeEventInputAudioBufferSpeechStarted(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.inputAudioBufferSpeechStarted,
      @JsonKey(name: 'audio_start_ms') required this.audioStartMs,
      @JsonKey(name: 'item_id') required this.itemId})
      : super._();
  factory RealtimeEventInputAudioBufferSpeechStarted.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventInputAudioBufferSpeechStartedFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// Milliseconds from the start of all audio written to the buffer during the session when speech was
  /// first detected. This will correspond to the beginning of audio sent to the model, and thus
  /// includes the `prefix_padding_ms` configured in the Session.
  @JsonKey(name: 'audio_start_ms')
  final int audioStartMs;

  /// The ID of the user message item that will be created when speech stops.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventInputAudioBufferSpeechStartedCopyWith<
          RealtimeEventInputAudioBufferSpeechStarted>
      get copyWith => _$RealtimeEventInputAudioBufferSpeechStartedCopyWithImpl<
          RealtimeEventInputAudioBufferSpeechStarted>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventInputAudioBufferSpeechStartedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventInputAudioBufferSpeechStarted &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.audioStartMs, audioStartMs) ||
                other.audioStartMs == audioStartMs) &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, type, audioStartMs, itemId);

  @override
  String toString() {
    return 'RealtimeEvent.inputAudioBufferSpeechStarted(eventId: $eventId, type: $type, audioStartMs: $audioStartMs, itemId: $itemId)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventInputAudioBufferSpeechStartedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventInputAudioBufferSpeechStartedCopyWith(
          RealtimeEventInputAudioBufferSpeechStarted value,
          $Res Function(RealtimeEventInputAudioBufferSpeechStarted) _then) =
      _$RealtimeEventInputAudioBufferSpeechStartedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'audio_start_ms') int audioStartMs,
      @JsonKey(name: 'item_id') String itemId});
}

/// @nodoc
class _$RealtimeEventInputAudioBufferSpeechStartedCopyWithImpl<$Res>
    implements $RealtimeEventInputAudioBufferSpeechStartedCopyWith<$Res> {
  _$RealtimeEventInputAudioBufferSpeechStartedCopyWithImpl(
      this._self, this._then);

  final RealtimeEventInputAudioBufferSpeechStarted _self;
  final $Res Function(RealtimeEventInputAudioBufferSpeechStarted) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? audioStartMs = null,
    Object? itemId = null,
  }) {
    return _then(RealtimeEventInputAudioBufferSpeechStarted(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      audioStartMs: null == audioStartMs
          ? _self.audioStartMs
          : audioStartMs // ignore: cast_nullable_to_non_nullable
              as int,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventInputAudioBufferSpeechStopped extends RealtimeEvent {
  const RealtimeEventInputAudioBufferSpeechStopped(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.inputAudioBufferSpeechStopped,
      @JsonKey(name: 'audio_end_ms') required this.audioEndMs,
      @JsonKey(name: 'item_id') required this.itemId})
      : super._();
  factory RealtimeEventInputAudioBufferSpeechStopped.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventInputAudioBufferSpeechStoppedFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// Milliseconds since the session started when speech stopped. This will correspond to the end of
  /// audio sent to the model, and thus includes the `min_silence_duration_ms` configured in the
  /// Session.
  @JsonKey(name: 'audio_end_ms')
  final int audioEndMs;

  /// The ID of the user message item that will be created.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventInputAudioBufferSpeechStoppedCopyWith<
          RealtimeEventInputAudioBufferSpeechStopped>
      get copyWith => _$RealtimeEventInputAudioBufferSpeechStoppedCopyWithImpl<
          RealtimeEventInputAudioBufferSpeechStopped>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventInputAudioBufferSpeechStoppedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventInputAudioBufferSpeechStopped &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.audioEndMs, audioEndMs) ||
                other.audioEndMs == audioEndMs) &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, type, audioEndMs, itemId);

  @override
  String toString() {
    return 'RealtimeEvent.inputAudioBufferSpeechStopped(eventId: $eventId, type: $type, audioEndMs: $audioEndMs, itemId: $itemId)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventInputAudioBufferSpeechStoppedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventInputAudioBufferSpeechStoppedCopyWith(
          RealtimeEventInputAudioBufferSpeechStopped value,
          $Res Function(RealtimeEventInputAudioBufferSpeechStopped) _then) =
      _$RealtimeEventInputAudioBufferSpeechStoppedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'audio_end_ms') int audioEndMs,
      @JsonKey(name: 'item_id') String itemId});
}

/// @nodoc
class _$RealtimeEventInputAudioBufferSpeechStoppedCopyWithImpl<$Res>
    implements $RealtimeEventInputAudioBufferSpeechStoppedCopyWith<$Res> {
  _$RealtimeEventInputAudioBufferSpeechStoppedCopyWithImpl(
      this._self, this._then);

  final RealtimeEventInputAudioBufferSpeechStopped _self;
  final $Res Function(RealtimeEventInputAudioBufferSpeechStopped) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? audioEndMs = null,
    Object? itemId = null,
  }) {
    return _then(RealtimeEventInputAudioBufferSpeechStopped(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      audioEndMs: null == audioEndMs
          ? _self.audioEndMs
          : audioEndMs // ignore: cast_nullable_to_non_nullable
              as int,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventRateLimitsUpdated extends RealtimeEvent {
  const RealtimeEventRateLimitsUpdated(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.rateLimitsUpdated,
      @JsonKey(name: 'rate_limits') required final List<RateLimit> rateLimits})
      : _rateLimits = rateLimits,
        super._();
  factory RealtimeEventRateLimitsUpdated.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventRateLimitsUpdatedFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// List of rate limit information.
  final List<RateLimit> _rateLimits;

  /// List of rate limit information.
  @JsonKey(name: 'rate_limits')
  List<RateLimit> get rateLimits {
    if (_rateLimits is EqualUnmodifiableListView) return _rateLimits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rateLimits);
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventRateLimitsUpdatedCopyWith<RealtimeEventRateLimitsUpdated>
      get copyWith => _$RealtimeEventRateLimitsUpdatedCopyWithImpl<
          RealtimeEventRateLimitsUpdated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventRateLimitsUpdatedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventRateLimitsUpdated &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._rateLimits, _rateLimits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type,
      const DeepCollectionEquality().hash(_rateLimits));

  @override
  String toString() {
    return 'RealtimeEvent.rateLimitsUpdated(eventId: $eventId, type: $type, rateLimits: $rateLimits)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventRateLimitsUpdatedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventRateLimitsUpdatedCopyWith(
          RealtimeEventRateLimitsUpdated value,
          $Res Function(RealtimeEventRateLimitsUpdated) _then) =
      _$RealtimeEventRateLimitsUpdatedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'rate_limits') List<RateLimit> rateLimits});
}

/// @nodoc
class _$RealtimeEventRateLimitsUpdatedCopyWithImpl<$Res>
    implements $RealtimeEventRateLimitsUpdatedCopyWith<$Res> {
  _$RealtimeEventRateLimitsUpdatedCopyWithImpl(this._self, this._then);

  final RealtimeEventRateLimitsUpdated _self;
  final $Res Function(RealtimeEventRateLimitsUpdated) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? rateLimits = null,
  }) {
    return _then(RealtimeEventRateLimitsUpdated(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      rateLimits: null == rateLimits
          ? _self._rateLimits
          : rateLimits // ignore: cast_nullable_to_non_nullable
              as List<RateLimit>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseAudioDelta extends RealtimeEvent {
  const RealtimeEventResponseAudioDelta(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseAudioDelta,
      @JsonKey(name: 'response_id') required this.responseId,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'output_index') required this.outputIndex,
      @JsonKey(name: 'content_index') required this.contentIndex,
      required this.delta})
      : super._();
  factory RealtimeEventResponseAudioDelta.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventResponseAudioDeltaFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the response.
  @JsonKey(name: 'response_id')
  final String responseId;

  /// The ID of the item.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// The index of the output item in the response.
  @JsonKey(name: 'output_index')
  final int outputIndex;

  /// The index of the content part in the item's content array.
  @JsonKey(name: 'content_index')
  final int contentIndex;

  /// Base64-encoded audio data delta.
  final String delta;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseAudioDeltaCopyWith<RealtimeEventResponseAudioDelta>
      get copyWith => _$RealtimeEventResponseAudioDeltaCopyWithImpl<
          RealtimeEventResponseAudioDelta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseAudioDeltaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseAudioDelta &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.outputIndex, outputIndex) ||
                other.outputIndex == outputIndex) &&
            (identical(other.contentIndex, contentIndex) ||
                other.contentIndex == contentIndex) &&
            (identical(other.delta, delta) || other.delta == delta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, responseId,
      itemId, outputIndex, contentIndex, delta);

  @override
  String toString() {
    return 'RealtimeEvent.responseAudioDelta(eventId: $eventId, type: $type, responseId: $responseId, itemId: $itemId, outputIndex: $outputIndex, contentIndex: $contentIndex, delta: $delta)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseAudioDeltaCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseAudioDeltaCopyWith(
          RealtimeEventResponseAudioDelta value,
          $Res Function(RealtimeEventResponseAudioDelta) _then) =
      _$RealtimeEventResponseAudioDeltaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'response_id') String responseId,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'output_index') int outputIndex,
      @JsonKey(name: 'content_index') int contentIndex,
      String delta});
}

/// @nodoc
class _$RealtimeEventResponseAudioDeltaCopyWithImpl<$Res>
    implements $RealtimeEventResponseAudioDeltaCopyWith<$Res> {
  _$RealtimeEventResponseAudioDeltaCopyWithImpl(this._self, this._then);

  final RealtimeEventResponseAudioDelta _self;
  final $Res Function(RealtimeEventResponseAudioDelta) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? responseId = null,
    Object? itemId = null,
    Object? outputIndex = null,
    Object? contentIndex = null,
    Object? delta = null,
  }) {
    return _then(RealtimeEventResponseAudioDelta(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      responseId: null == responseId
          ? _self.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      outputIndex: null == outputIndex
          ? _self.outputIndex
          : outputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      contentIndex: null == contentIndex
          ? _self.contentIndex
          : contentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      delta: null == delta
          ? _self.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseAudioDone extends RealtimeEvent {
  const RealtimeEventResponseAudioDone(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseAudioDone,
      @JsonKey(name: 'response_id') required this.responseId,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'output_index') required this.outputIndex,
      @JsonKey(name: 'content_index') required this.contentIndex})
      : super._();
  factory RealtimeEventResponseAudioDone.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventResponseAudioDoneFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the response.
  @JsonKey(name: 'response_id')
  final String responseId;

  /// The ID of the item.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// The index of the output item in the response.
  @JsonKey(name: 'output_index')
  final int outputIndex;

  /// The index of the content part in the item's content array.
  @JsonKey(name: 'content_index')
  final int contentIndex;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseAudioDoneCopyWith<RealtimeEventResponseAudioDone>
      get copyWith => _$RealtimeEventResponseAudioDoneCopyWithImpl<
          RealtimeEventResponseAudioDone>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseAudioDoneToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseAudioDone &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.outputIndex, outputIndex) ||
                other.outputIndex == outputIndex) &&
            (identical(other.contentIndex, contentIndex) ||
                other.contentIndex == contentIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, responseId,
      itemId, outputIndex, contentIndex);

  @override
  String toString() {
    return 'RealtimeEvent.responseAudioDone(eventId: $eventId, type: $type, responseId: $responseId, itemId: $itemId, outputIndex: $outputIndex, contentIndex: $contentIndex)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseAudioDoneCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseAudioDoneCopyWith(
          RealtimeEventResponseAudioDone value,
          $Res Function(RealtimeEventResponseAudioDone) _then) =
      _$RealtimeEventResponseAudioDoneCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'response_id') String responseId,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'output_index') int outputIndex,
      @JsonKey(name: 'content_index') int contentIndex});
}

/// @nodoc
class _$RealtimeEventResponseAudioDoneCopyWithImpl<$Res>
    implements $RealtimeEventResponseAudioDoneCopyWith<$Res> {
  _$RealtimeEventResponseAudioDoneCopyWithImpl(this._self, this._then);

  final RealtimeEventResponseAudioDone _self;
  final $Res Function(RealtimeEventResponseAudioDone) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? responseId = null,
    Object? itemId = null,
    Object? outputIndex = null,
    Object? contentIndex = null,
  }) {
    return _then(RealtimeEventResponseAudioDone(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      responseId: null == responseId
          ? _self.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      outputIndex: null == outputIndex
          ? _self.outputIndex
          : outputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      contentIndex: null == contentIndex
          ? _self.contentIndex
          : contentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseAudioTranscriptDelta extends RealtimeEvent {
  const RealtimeEventResponseAudioTranscriptDelta(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseAudioTranscriptDelta,
      @JsonKey(name: 'response_id') required this.responseId,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'output_index') required this.outputIndex,
      @JsonKey(name: 'content_index') required this.contentIndex,
      required this.delta})
      : super._();
  factory RealtimeEventResponseAudioTranscriptDelta.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventResponseAudioTranscriptDeltaFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the response.
  @JsonKey(name: 'response_id')
  final String responseId;

  /// The ID of the item.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// The index of the output item in the response.
  @JsonKey(name: 'output_index')
  final int outputIndex;

  /// The index of the content part in the item's content array.
  @JsonKey(name: 'content_index')
  final int contentIndex;

  /// The transcript delta.
  final String delta;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseAudioTranscriptDeltaCopyWith<
          RealtimeEventResponseAudioTranscriptDelta>
      get copyWith => _$RealtimeEventResponseAudioTranscriptDeltaCopyWithImpl<
          RealtimeEventResponseAudioTranscriptDelta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseAudioTranscriptDeltaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseAudioTranscriptDelta &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.outputIndex, outputIndex) ||
                other.outputIndex == outputIndex) &&
            (identical(other.contentIndex, contentIndex) ||
                other.contentIndex == contentIndex) &&
            (identical(other.delta, delta) || other.delta == delta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, responseId,
      itemId, outputIndex, contentIndex, delta);

  @override
  String toString() {
    return 'RealtimeEvent.responseAudioTranscriptDelta(eventId: $eventId, type: $type, responseId: $responseId, itemId: $itemId, outputIndex: $outputIndex, contentIndex: $contentIndex, delta: $delta)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseAudioTranscriptDeltaCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseAudioTranscriptDeltaCopyWith(
          RealtimeEventResponseAudioTranscriptDelta value,
          $Res Function(RealtimeEventResponseAudioTranscriptDelta) _then) =
      _$RealtimeEventResponseAudioTranscriptDeltaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'response_id') String responseId,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'output_index') int outputIndex,
      @JsonKey(name: 'content_index') int contentIndex,
      String delta});
}

/// @nodoc
class _$RealtimeEventResponseAudioTranscriptDeltaCopyWithImpl<$Res>
    implements $RealtimeEventResponseAudioTranscriptDeltaCopyWith<$Res> {
  _$RealtimeEventResponseAudioTranscriptDeltaCopyWithImpl(
      this._self, this._then);

  final RealtimeEventResponseAudioTranscriptDelta _self;
  final $Res Function(RealtimeEventResponseAudioTranscriptDelta) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? responseId = null,
    Object? itemId = null,
    Object? outputIndex = null,
    Object? contentIndex = null,
    Object? delta = null,
  }) {
    return _then(RealtimeEventResponseAudioTranscriptDelta(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      responseId: null == responseId
          ? _self.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      outputIndex: null == outputIndex
          ? _self.outputIndex
          : outputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      contentIndex: null == contentIndex
          ? _self.contentIndex
          : contentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      delta: null == delta
          ? _self.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseAudioTranscriptDone extends RealtimeEvent {
  const RealtimeEventResponseAudioTranscriptDone(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseAudioTranscriptDone,
      @JsonKey(name: 'response_id') required this.responseId,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'output_index') required this.outputIndex,
      @JsonKey(name: 'content_index') required this.contentIndex,
      required this.transcript})
      : super._();
  factory RealtimeEventResponseAudioTranscriptDone.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventResponseAudioTranscriptDoneFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the response.
  @JsonKey(name: 'response_id')
  final String responseId;

  /// The ID of the item.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// The index of the output item in the response.
  @JsonKey(name: 'output_index')
  final int outputIndex;

  /// The index of the content part in the item's content array.
  @JsonKey(name: 'content_index')
  final int contentIndex;

  /// The final transcript of the audio.
  final String transcript;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseAudioTranscriptDoneCopyWith<
          RealtimeEventResponseAudioTranscriptDone>
      get copyWith => _$RealtimeEventResponseAudioTranscriptDoneCopyWithImpl<
          RealtimeEventResponseAudioTranscriptDone>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseAudioTranscriptDoneToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseAudioTranscriptDone &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.outputIndex, outputIndex) ||
                other.outputIndex == outputIndex) &&
            (identical(other.contentIndex, contentIndex) ||
                other.contentIndex == contentIndex) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, responseId,
      itemId, outputIndex, contentIndex, transcript);

  @override
  String toString() {
    return 'RealtimeEvent.responseAudioTranscriptDone(eventId: $eventId, type: $type, responseId: $responseId, itemId: $itemId, outputIndex: $outputIndex, contentIndex: $contentIndex, transcript: $transcript)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseAudioTranscriptDoneCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseAudioTranscriptDoneCopyWith(
          RealtimeEventResponseAudioTranscriptDone value,
          $Res Function(RealtimeEventResponseAudioTranscriptDone) _then) =
      _$RealtimeEventResponseAudioTranscriptDoneCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'response_id') String responseId,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'output_index') int outputIndex,
      @JsonKey(name: 'content_index') int contentIndex,
      String transcript});
}

/// @nodoc
class _$RealtimeEventResponseAudioTranscriptDoneCopyWithImpl<$Res>
    implements $RealtimeEventResponseAudioTranscriptDoneCopyWith<$Res> {
  _$RealtimeEventResponseAudioTranscriptDoneCopyWithImpl(
      this._self, this._then);

  final RealtimeEventResponseAudioTranscriptDone _self;
  final $Res Function(RealtimeEventResponseAudioTranscriptDone) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? responseId = null,
    Object? itemId = null,
    Object? outputIndex = null,
    Object? contentIndex = null,
    Object? transcript = null,
  }) {
    return _then(RealtimeEventResponseAudioTranscriptDone(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      responseId: null == responseId
          ? _self.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      outputIndex: null == outputIndex
          ? _self.outputIndex
          : outputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      contentIndex: null == contentIndex
          ? _self.contentIndex
          : contentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      transcript: null == transcript
          ? _self.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseContentPartAdded extends RealtimeEvent {
  const RealtimeEventResponseContentPartAdded(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseContentPartAdded,
      @JsonKey(name: 'response_id') required this.responseId,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'output_index') required this.outputIndex,
      @JsonKey(name: 'content_index') required this.contentIndex,
      required this.part})
      : super._();
  factory RealtimeEventResponseContentPartAdded.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventResponseContentPartAddedFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the response.
  @JsonKey(name: 'response_id')
  final String responseId;

  /// The ID of the item to which the content part was added.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// The index of the output item in the response.
  @JsonKey(name: 'output_index')
  final int outputIndex;

  /// The index of the content part in the item's content array.
  @JsonKey(name: 'content_index')
  final int contentIndex;

  /// A part of the content.
  /// Any of: [ContentPartInputText], [ContentPartInputAudio], [ContentPartText], [ContentPartAudio]
  final ContentPart part;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseContentPartAddedCopyWith<
          RealtimeEventResponseContentPartAdded>
      get copyWith => _$RealtimeEventResponseContentPartAddedCopyWithImpl<
          RealtimeEventResponseContentPartAdded>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseContentPartAddedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseContentPartAdded &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.outputIndex, outputIndex) ||
                other.outputIndex == outputIndex) &&
            (identical(other.contentIndex, contentIndex) ||
                other.contentIndex == contentIndex) &&
            (identical(other.part, part) || other.part == part));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, responseId,
      itemId, outputIndex, contentIndex, part);

  @override
  String toString() {
    return 'RealtimeEvent.responseContentPartAdded(eventId: $eventId, type: $type, responseId: $responseId, itemId: $itemId, outputIndex: $outputIndex, contentIndex: $contentIndex, part: $part)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseContentPartAddedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseContentPartAddedCopyWith(
          RealtimeEventResponseContentPartAdded value,
          $Res Function(RealtimeEventResponseContentPartAdded) _then) =
      _$RealtimeEventResponseContentPartAddedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'response_id') String responseId,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'output_index') int outputIndex,
      @JsonKey(name: 'content_index') int contentIndex,
      ContentPart part});

  $ContentPartCopyWith<$Res> get part;
}

/// @nodoc
class _$RealtimeEventResponseContentPartAddedCopyWithImpl<$Res>
    implements $RealtimeEventResponseContentPartAddedCopyWith<$Res> {
  _$RealtimeEventResponseContentPartAddedCopyWithImpl(this._self, this._then);

  final RealtimeEventResponseContentPartAdded _self;
  final $Res Function(RealtimeEventResponseContentPartAdded) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? responseId = null,
    Object? itemId = null,
    Object? outputIndex = null,
    Object? contentIndex = null,
    Object? part = null,
  }) {
    return _then(RealtimeEventResponseContentPartAdded(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      responseId: null == responseId
          ? _self.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      outputIndex: null == outputIndex
          ? _self.outputIndex
          : outputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      contentIndex: null == contentIndex
          ? _self.contentIndex
          : contentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      part: null == part
          ? _self.part
          : part // ignore: cast_nullable_to_non_nullable
              as ContentPart,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentPartCopyWith<$Res> get part {
    return $ContentPartCopyWith<$Res>(_self.part, (value) {
      return _then(_self.copyWith(part: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseContentPartDone extends RealtimeEvent {
  const RealtimeEventResponseContentPartDone(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseContentPartDone,
      @JsonKey(name: 'response_id') required this.responseId,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'output_index') required this.outputIndex,
      @JsonKey(name: 'content_index') required this.contentIndex,
      required this.part})
      : super._();
  factory RealtimeEventResponseContentPartDone.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventResponseContentPartDoneFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the response.
  @JsonKey(name: 'response_id')
  final String responseId;

  /// The ID of the item.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// The index of the output item in the response.
  @JsonKey(name: 'output_index')
  final int outputIndex;

  /// The index of the content part in the item's content array.
  @JsonKey(name: 'content_index')
  final int contentIndex;

  /// A part of the content.
  /// Any of: [ContentPartInputText], [ContentPartInputAudio], [ContentPartText], [ContentPartAudio]
  final ContentPart part;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseContentPartDoneCopyWith<
          RealtimeEventResponseContentPartDone>
      get copyWith => _$RealtimeEventResponseContentPartDoneCopyWithImpl<
          RealtimeEventResponseContentPartDone>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseContentPartDoneToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseContentPartDone &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.outputIndex, outputIndex) ||
                other.outputIndex == outputIndex) &&
            (identical(other.contentIndex, contentIndex) ||
                other.contentIndex == contentIndex) &&
            (identical(other.part, part) || other.part == part));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, responseId,
      itemId, outputIndex, contentIndex, part);

  @override
  String toString() {
    return 'RealtimeEvent.responseContentPartDone(eventId: $eventId, type: $type, responseId: $responseId, itemId: $itemId, outputIndex: $outputIndex, contentIndex: $contentIndex, part: $part)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseContentPartDoneCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseContentPartDoneCopyWith(
          RealtimeEventResponseContentPartDone value,
          $Res Function(RealtimeEventResponseContentPartDone) _then) =
      _$RealtimeEventResponseContentPartDoneCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'response_id') String responseId,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'output_index') int outputIndex,
      @JsonKey(name: 'content_index') int contentIndex,
      ContentPart part});

  $ContentPartCopyWith<$Res> get part;
}

/// @nodoc
class _$RealtimeEventResponseContentPartDoneCopyWithImpl<$Res>
    implements $RealtimeEventResponseContentPartDoneCopyWith<$Res> {
  _$RealtimeEventResponseContentPartDoneCopyWithImpl(this._self, this._then);

  final RealtimeEventResponseContentPartDone _self;
  final $Res Function(RealtimeEventResponseContentPartDone) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? responseId = null,
    Object? itemId = null,
    Object? outputIndex = null,
    Object? contentIndex = null,
    Object? part = null,
  }) {
    return _then(RealtimeEventResponseContentPartDone(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      responseId: null == responseId
          ? _self.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      outputIndex: null == outputIndex
          ? _self.outputIndex
          : outputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      contentIndex: null == contentIndex
          ? _self.contentIndex
          : contentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      part: null == part
          ? _self.part
          : part // ignore: cast_nullable_to_non_nullable
              as ContentPart,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentPartCopyWith<$Res> get part {
    return $ContentPartCopyWith<$Res>(_self.part, (value) {
      return _then(_self.copyWith(part: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseCreated extends RealtimeEvent {
  const RealtimeEventResponseCreated(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseCreated,
      required this.response})
      : super._();
  factory RealtimeEventResponseCreated.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventResponseCreatedFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The response resource.
  final Response response;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseCreatedCopyWith<RealtimeEventResponseCreated>
      get copyWith => _$RealtimeEventResponseCreatedCopyWithImpl<
          RealtimeEventResponseCreated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseCreatedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseCreated &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, response);

  @override
  String toString() {
    return 'RealtimeEvent.responseCreated(eventId: $eventId, type: $type, response: $response)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseCreatedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseCreatedCopyWith(
          RealtimeEventResponseCreated value,
          $Res Function(RealtimeEventResponseCreated) _then) =
      _$RealtimeEventResponseCreatedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      Response response});

  $ResponseCopyWith<$Res> get response;
}

/// @nodoc
class _$RealtimeEventResponseCreatedCopyWithImpl<$Res>
    implements $RealtimeEventResponseCreatedCopyWith<$Res> {
  _$RealtimeEventResponseCreatedCopyWithImpl(this._self, this._then);

  final RealtimeEventResponseCreated _self;
  final $Res Function(RealtimeEventResponseCreated) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? response = null,
  }) {
    return _then(RealtimeEventResponseCreated(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as Response,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseCopyWith<$Res> get response {
    return $ResponseCopyWith<$Res>(_self.response, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseDone extends RealtimeEvent {
  const RealtimeEventResponseDone(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseDone,
      required this.response})
      : super._();
  factory RealtimeEventResponseDone.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventResponseDoneFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The response resource.
  final Response response;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseDoneCopyWith<RealtimeEventResponseDone> get copyWith =>
      _$RealtimeEventResponseDoneCopyWithImpl<RealtimeEventResponseDone>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseDoneToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseDone &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, response);

  @override
  String toString() {
    return 'RealtimeEvent.responseDone(eventId: $eventId, type: $type, response: $response)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseDoneCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseDoneCopyWith(RealtimeEventResponseDone value,
          $Res Function(RealtimeEventResponseDone) _then) =
      _$RealtimeEventResponseDoneCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      Response response});

  $ResponseCopyWith<$Res> get response;
}

/// @nodoc
class _$RealtimeEventResponseDoneCopyWithImpl<$Res>
    implements $RealtimeEventResponseDoneCopyWith<$Res> {
  _$RealtimeEventResponseDoneCopyWithImpl(this._self, this._then);

  final RealtimeEventResponseDone _self;
  final $Res Function(RealtimeEventResponseDone) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? response = null,
  }) {
    return _then(RealtimeEventResponseDone(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as Response,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseCopyWith<$Res> get response {
    return $ResponseCopyWith<$Res>(_self.response, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseFunctionCallArgumentsDelta extends RealtimeEvent {
  const RealtimeEventResponseFunctionCallArgumentsDelta(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseFunctionCallArgumentsDelta,
      @JsonKey(name: 'response_id') required this.responseId,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'output_index') required this.outputIndex,
      @JsonKey(name: 'call_id') required this.callId,
      required this.delta})
      : super._();
  factory RealtimeEventResponseFunctionCallArgumentsDelta.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventResponseFunctionCallArgumentsDeltaFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the response.
  @JsonKey(name: 'response_id')
  final String responseId;

  /// The ID of the function call item.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// The index of the output item in the response.
  @JsonKey(name: 'output_index')
  final int outputIndex;

  /// The ID of the function call.
  @JsonKey(name: 'call_id')
  final String callId;

  /// The arguments delta as a JSON string.
  final String delta;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseFunctionCallArgumentsDeltaCopyWith<
          RealtimeEventResponseFunctionCallArgumentsDelta>
      get copyWith =>
          _$RealtimeEventResponseFunctionCallArgumentsDeltaCopyWithImpl<
                  RealtimeEventResponseFunctionCallArgumentsDelta>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseFunctionCallArgumentsDeltaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseFunctionCallArgumentsDelta &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.outputIndex, outputIndex) ||
                other.outputIndex == outputIndex) &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.delta, delta) || other.delta == delta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, responseId,
      itemId, outputIndex, callId, delta);

  @override
  String toString() {
    return 'RealtimeEvent.responseFunctionCallArgumentsDelta(eventId: $eventId, type: $type, responseId: $responseId, itemId: $itemId, outputIndex: $outputIndex, callId: $callId, delta: $delta)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseFunctionCallArgumentsDeltaCopyWith<
    $Res> implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseFunctionCallArgumentsDeltaCopyWith(
          RealtimeEventResponseFunctionCallArgumentsDelta value,
          $Res Function(RealtimeEventResponseFunctionCallArgumentsDelta)
              _then) =
      _$RealtimeEventResponseFunctionCallArgumentsDeltaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'response_id') String responseId,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'output_index') int outputIndex,
      @JsonKey(name: 'call_id') String callId,
      String delta});
}

/// @nodoc
class _$RealtimeEventResponseFunctionCallArgumentsDeltaCopyWithImpl<$Res>
    implements $RealtimeEventResponseFunctionCallArgumentsDeltaCopyWith<$Res> {
  _$RealtimeEventResponseFunctionCallArgumentsDeltaCopyWithImpl(
      this._self, this._then);

  final RealtimeEventResponseFunctionCallArgumentsDelta _self;
  final $Res Function(RealtimeEventResponseFunctionCallArgumentsDelta) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? responseId = null,
    Object? itemId = null,
    Object? outputIndex = null,
    Object? callId = null,
    Object? delta = null,
  }) {
    return _then(RealtimeEventResponseFunctionCallArgumentsDelta(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      responseId: null == responseId
          ? _self.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      outputIndex: null == outputIndex
          ? _self.outputIndex
          : outputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      callId: null == callId
          ? _self.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String,
      delta: null == delta
          ? _self.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseFunctionCallArgumentsDone extends RealtimeEvent {
  const RealtimeEventResponseFunctionCallArgumentsDone(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseFunctionCallArgumentsDone,
      @JsonKey(name: 'response_id') required this.responseId,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'output_index') required this.outputIndex,
      @JsonKey(name: 'call_id') required this.callId,
      required this.arguments})
      : super._();
  factory RealtimeEventResponseFunctionCallArgumentsDone.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventResponseFunctionCallArgumentsDoneFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the response.
  @JsonKey(name: 'response_id')
  final String responseId;

  /// The ID of the function call item.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// The index of the output item in the response.
  @JsonKey(name: 'output_index')
  final int outputIndex;

  /// The ID of the function call.
  @JsonKey(name: 'call_id')
  final String callId;

  /// The final arguments as a JSON string.
  final String arguments;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseFunctionCallArgumentsDoneCopyWith<
          RealtimeEventResponseFunctionCallArgumentsDone>
      get copyWith =>
          _$RealtimeEventResponseFunctionCallArgumentsDoneCopyWithImpl<
              RealtimeEventResponseFunctionCallArgumentsDone>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseFunctionCallArgumentsDoneToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseFunctionCallArgumentsDone &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.outputIndex, outputIndex) ||
                other.outputIndex == outputIndex) &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.arguments, arguments) ||
                other.arguments == arguments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, responseId,
      itemId, outputIndex, callId, arguments);

  @override
  String toString() {
    return 'RealtimeEvent.responseFunctionCallArgumentsDone(eventId: $eventId, type: $type, responseId: $responseId, itemId: $itemId, outputIndex: $outputIndex, callId: $callId, arguments: $arguments)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseFunctionCallArgumentsDoneCopyWith<
    $Res> implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseFunctionCallArgumentsDoneCopyWith(
          RealtimeEventResponseFunctionCallArgumentsDone value,
          $Res Function(RealtimeEventResponseFunctionCallArgumentsDone) _then) =
      _$RealtimeEventResponseFunctionCallArgumentsDoneCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'response_id') String responseId,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'output_index') int outputIndex,
      @JsonKey(name: 'call_id') String callId,
      String arguments});
}

/// @nodoc
class _$RealtimeEventResponseFunctionCallArgumentsDoneCopyWithImpl<$Res>
    implements $RealtimeEventResponseFunctionCallArgumentsDoneCopyWith<$Res> {
  _$RealtimeEventResponseFunctionCallArgumentsDoneCopyWithImpl(
      this._self, this._then);

  final RealtimeEventResponseFunctionCallArgumentsDone _self;
  final $Res Function(RealtimeEventResponseFunctionCallArgumentsDone) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? responseId = null,
    Object? itemId = null,
    Object? outputIndex = null,
    Object? callId = null,
    Object? arguments = null,
  }) {
    return _then(RealtimeEventResponseFunctionCallArgumentsDone(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      responseId: null == responseId
          ? _self.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      outputIndex: null == outputIndex
          ? _self.outputIndex
          : outputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      callId: null == callId
          ? _self.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String,
      arguments: null == arguments
          ? _self.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseOutputItemAdded extends RealtimeEvent {
  const RealtimeEventResponseOutputItemAdded(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseOutputItemAdded,
      @JsonKey(name: 'response_id') required this.responseId,
      @JsonKey(name: 'output_index') required this.outputIndex,
      required this.item})
      : super._();
  factory RealtimeEventResponseOutputItemAdded.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventResponseOutputItemAddedFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the Response to which the item belongs.
  @JsonKey(name: 'response_id')
  final String responseId;

  /// The index of the output item in the Response.
  @JsonKey(name: 'output_index')
  final int outputIndex;

  /// The item to add to the conversation.
  /// Any of: [ItemMessage], [ItemFunctionCall], [ItemFunctionCallOutput]
  final Item item;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseOutputItemAddedCopyWith<
          RealtimeEventResponseOutputItemAdded>
      get copyWith => _$RealtimeEventResponseOutputItemAddedCopyWithImpl<
          RealtimeEventResponseOutputItemAdded>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseOutputItemAddedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseOutputItemAdded &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.outputIndex, outputIndex) ||
                other.outputIndex == outputIndex) &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, type, responseId, outputIndex, item);

  @override
  String toString() {
    return 'RealtimeEvent.responseOutputItemAdded(eventId: $eventId, type: $type, responseId: $responseId, outputIndex: $outputIndex, item: $item)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseOutputItemAddedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseOutputItemAddedCopyWith(
          RealtimeEventResponseOutputItemAdded value,
          $Res Function(RealtimeEventResponseOutputItemAdded) _then) =
      _$RealtimeEventResponseOutputItemAddedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'response_id') String responseId,
      @JsonKey(name: 'output_index') int outputIndex,
      Item item});

  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class _$RealtimeEventResponseOutputItemAddedCopyWithImpl<$Res>
    implements $RealtimeEventResponseOutputItemAddedCopyWith<$Res> {
  _$RealtimeEventResponseOutputItemAddedCopyWithImpl(this._self, this._then);

  final RealtimeEventResponseOutputItemAdded _self;
  final $Res Function(RealtimeEventResponseOutputItemAdded) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? responseId = null,
    Object? outputIndex = null,
    Object? item = null,
  }) {
    return _then(RealtimeEventResponseOutputItemAdded(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      responseId: null == responseId
          ? _self.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      outputIndex: null == outputIndex
          ? _self.outputIndex
          : outputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res> get item {
    return $ItemCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseOutputItemDone extends RealtimeEvent {
  const RealtimeEventResponseOutputItemDone(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseOutputItemDone,
      @JsonKey(name: 'response_id') required this.responseId,
      @JsonKey(name: 'output_index') required this.outputIndex,
      required this.item})
      : super._();
  factory RealtimeEventResponseOutputItemDone.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventResponseOutputItemDoneFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the Response to which the item belongs.
  @JsonKey(name: 'response_id')
  final String responseId;

  /// The index of the output item in the Response.
  @JsonKey(name: 'output_index')
  final int outputIndex;

  /// The item to add to the conversation.
  /// Any of: [ItemMessage], [ItemFunctionCall], [ItemFunctionCallOutput]
  final Item item;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseOutputItemDoneCopyWith<
          RealtimeEventResponseOutputItemDone>
      get copyWith => _$RealtimeEventResponseOutputItemDoneCopyWithImpl<
          RealtimeEventResponseOutputItemDone>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseOutputItemDoneToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseOutputItemDone &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.outputIndex, outputIndex) ||
                other.outputIndex == outputIndex) &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, type, responseId, outputIndex, item);

  @override
  String toString() {
    return 'RealtimeEvent.responseOutputItemDone(eventId: $eventId, type: $type, responseId: $responseId, outputIndex: $outputIndex, item: $item)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseOutputItemDoneCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseOutputItemDoneCopyWith(
          RealtimeEventResponseOutputItemDone value,
          $Res Function(RealtimeEventResponseOutputItemDone) _then) =
      _$RealtimeEventResponseOutputItemDoneCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'response_id') String responseId,
      @JsonKey(name: 'output_index') int outputIndex,
      Item item});

  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class _$RealtimeEventResponseOutputItemDoneCopyWithImpl<$Res>
    implements $RealtimeEventResponseOutputItemDoneCopyWith<$Res> {
  _$RealtimeEventResponseOutputItemDoneCopyWithImpl(this._self, this._then);

  final RealtimeEventResponseOutputItemDone _self;
  final $Res Function(RealtimeEventResponseOutputItemDone) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? responseId = null,
    Object? outputIndex = null,
    Object? item = null,
  }) {
    return _then(RealtimeEventResponseOutputItemDone(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      responseId: null == responseId
          ? _self.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      outputIndex: null == outputIndex
          ? _self.outputIndex
          : outputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res> get item {
    return $ItemCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseTextDelta extends RealtimeEvent {
  const RealtimeEventResponseTextDelta(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseTextDelta,
      @JsonKey(name: 'response_id') required this.responseId,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'output_index') required this.outputIndex,
      @JsonKey(name: 'content_index') required this.contentIndex,
      required this.delta})
      : super._();
  factory RealtimeEventResponseTextDelta.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventResponseTextDeltaFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the response.
  @JsonKey(name: 'response_id')
  final String responseId;

  /// The ID of the item.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// The index of the output item in the response.
  @JsonKey(name: 'output_index')
  final int outputIndex;

  /// The index of the content part in the item's content array.
  @JsonKey(name: 'content_index')
  final int contentIndex;

  /// The text delta.
  final String delta;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseTextDeltaCopyWith<RealtimeEventResponseTextDelta>
      get copyWith => _$RealtimeEventResponseTextDeltaCopyWithImpl<
          RealtimeEventResponseTextDelta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseTextDeltaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseTextDelta &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.outputIndex, outputIndex) ||
                other.outputIndex == outputIndex) &&
            (identical(other.contentIndex, contentIndex) ||
                other.contentIndex == contentIndex) &&
            (identical(other.delta, delta) || other.delta == delta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, responseId,
      itemId, outputIndex, contentIndex, delta);

  @override
  String toString() {
    return 'RealtimeEvent.responseTextDelta(eventId: $eventId, type: $type, responseId: $responseId, itemId: $itemId, outputIndex: $outputIndex, contentIndex: $contentIndex, delta: $delta)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseTextDeltaCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseTextDeltaCopyWith(
          RealtimeEventResponseTextDelta value,
          $Res Function(RealtimeEventResponseTextDelta) _then) =
      _$RealtimeEventResponseTextDeltaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'response_id') String responseId,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'output_index') int outputIndex,
      @JsonKey(name: 'content_index') int contentIndex,
      String delta});
}

/// @nodoc
class _$RealtimeEventResponseTextDeltaCopyWithImpl<$Res>
    implements $RealtimeEventResponseTextDeltaCopyWith<$Res> {
  _$RealtimeEventResponseTextDeltaCopyWithImpl(this._self, this._then);

  final RealtimeEventResponseTextDelta _self;
  final $Res Function(RealtimeEventResponseTextDelta) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? responseId = null,
    Object? itemId = null,
    Object? outputIndex = null,
    Object? contentIndex = null,
    Object? delta = null,
  }) {
    return _then(RealtimeEventResponseTextDelta(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      responseId: null == responseId
          ? _self.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      outputIndex: null == outputIndex
          ? _self.outputIndex
          : outputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      contentIndex: null == contentIndex
          ? _self.contentIndex
          : contentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      delta: null == delta
          ? _self.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventResponseTextDone extends RealtimeEvent {
  const RealtimeEventResponseTextDone(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.responseTextDone,
      @JsonKey(name: 'response_id') required this.responseId,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'output_index') required this.outputIndex,
      @JsonKey(name: 'content_index') required this.contentIndex,
      required this.text})
      : super._();
  factory RealtimeEventResponseTextDone.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventResponseTextDoneFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The ID of the response.
  @JsonKey(name: 'response_id')
  final String responseId;

  /// The ID of the item.
  @JsonKey(name: 'item_id')
  final String itemId;

  /// The index of the output item in the response.
  @JsonKey(name: 'output_index')
  final int outputIndex;

  /// The index of the content part in the item's content array.
  @JsonKey(name: 'content_index')
  final int contentIndex;

  /// The final text content.
  final String text;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventResponseTextDoneCopyWith<RealtimeEventResponseTextDone>
      get copyWith => _$RealtimeEventResponseTextDoneCopyWithImpl<
          RealtimeEventResponseTextDone>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventResponseTextDoneToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventResponseTextDone &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.outputIndex, outputIndex) ||
                other.outputIndex == outputIndex) &&
            (identical(other.contentIndex, contentIndex) ||
                other.contentIndex == contentIndex) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, responseId,
      itemId, outputIndex, contentIndex, text);

  @override
  String toString() {
    return 'RealtimeEvent.responseTextDone(eventId: $eventId, type: $type, responseId: $responseId, itemId: $itemId, outputIndex: $outputIndex, contentIndex: $contentIndex, text: $text)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventResponseTextDoneCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventResponseTextDoneCopyWith(
          RealtimeEventResponseTextDone value,
          $Res Function(RealtimeEventResponseTextDone) _then) =
      _$RealtimeEventResponseTextDoneCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      @JsonKey(name: 'response_id') String responseId,
      @JsonKey(name: 'item_id') String itemId,
      @JsonKey(name: 'output_index') int outputIndex,
      @JsonKey(name: 'content_index') int contentIndex,
      String text});
}

/// @nodoc
class _$RealtimeEventResponseTextDoneCopyWithImpl<$Res>
    implements $RealtimeEventResponseTextDoneCopyWith<$Res> {
  _$RealtimeEventResponseTextDoneCopyWithImpl(this._self, this._then);

  final RealtimeEventResponseTextDone _self;
  final $Res Function(RealtimeEventResponseTextDone) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? responseId = null,
    Object? itemId = null,
    Object? outputIndex = null,
    Object? contentIndex = null,
    Object? text = null,
  }) {
    return _then(RealtimeEventResponseTextDone(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      responseId: null == responseId
          ? _self.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      outputIndex: null == outputIndex
          ? _self.outputIndex
          : outputIndex // ignore: cast_nullable_to_non_nullable
              as int,
      contentIndex: null == contentIndex
          ? _self.contentIndex
          : contentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventSessionCreated extends RealtimeEvent {
  const RealtimeEventSessionCreated(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.sessionCreated,
      required this.session})
      : super._();
  factory RealtimeEventSessionCreated.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventSessionCreatedFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The session resource.
  final Session session;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventSessionCreatedCopyWith<RealtimeEventSessionCreated>
      get copyWith => _$RealtimeEventSessionCreatedCopyWithImpl<
          RealtimeEventSessionCreated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventSessionCreatedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventSessionCreated &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.session, session) || other.session == session));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, session);

  @override
  String toString() {
    return 'RealtimeEvent.sessionCreated(eventId: $eventId, type: $type, session: $session)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventSessionCreatedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventSessionCreatedCopyWith(
          RealtimeEventSessionCreated value,
          $Res Function(RealtimeEventSessionCreated) _then) =
      _$RealtimeEventSessionCreatedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      Session session});

  $SessionCopyWith<$Res> get session;
}

/// @nodoc
class _$RealtimeEventSessionCreatedCopyWithImpl<$Res>
    implements $RealtimeEventSessionCreatedCopyWith<$Res> {
  _$RealtimeEventSessionCreatedCopyWithImpl(this._self, this._then);

  final RealtimeEventSessionCreated _self;
  final $Res Function(RealtimeEventSessionCreated) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? session = null,
  }) {
    return _then(RealtimeEventSessionCreated(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      session: null == session
          ? _self.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res> get session {
    return $SessionCopyWith<$Res>(_self.session, (value) {
      return _then(_self.copyWith(session: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventSessionUpdated extends RealtimeEvent {
  const RealtimeEventSessionUpdated(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.sessionUpdated,
      required this.session})
      : super._();
  factory RealtimeEventSessionUpdated.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventSessionUpdatedFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// The session resource.
  final Session session;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventSessionUpdatedCopyWith<RealtimeEventSessionUpdated>
      get copyWith => _$RealtimeEventSessionUpdatedCopyWithImpl<
          RealtimeEventSessionUpdated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventSessionUpdatedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventSessionUpdated &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.session, session) || other.session == session));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, session);

  @override
  String toString() {
    return 'RealtimeEvent.sessionUpdated(eventId: $eventId, type: $type, session: $session)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventSessionUpdatedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventSessionUpdatedCopyWith(
          RealtimeEventSessionUpdated value,
          $Res Function(RealtimeEventSessionUpdated) _then) =
      _$RealtimeEventSessionUpdatedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      Session session});

  $SessionCopyWith<$Res> get session;
}

/// @nodoc
class _$RealtimeEventSessionUpdatedCopyWithImpl<$Res>
    implements $RealtimeEventSessionUpdatedCopyWith<$Res> {
  _$RealtimeEventSessionUpdatedCopyWithImpl(this._self, this._then);

  final RealtimeEventSessionUpdated _self;
  final $Res Function(RealtimeEventSessionUpdated) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? session = null,
  }) {
    return _then(RealtimeEventSessionUpdated(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      session: null == session
          ? _self.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res> get session {
    return $SessionCopyWith<$Res>(_self.session, (value) {
      return _then(_self.copyWith(session: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventClose extends RealtimeEvent {
  const RealtimeEventClose(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.close,
      required this.error})
      : super._();
  factory RealtimeEventClose.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventCloseFromJson(json);

  /// The unique ID of the server event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// Whether the close was due to an error.
  final bool error;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventCloseCopyWith<RealtimeEventClose> get copyWith =>
      _$RealtimeEventCloseCopyWithImpl<RealtimeEventClose>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventCloseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventClose &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, error);

  @override
  String toString() {
    return 'RealtimeEvent.close(eventId: $eventId, type: $type, error: $error)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventCloseCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventCloseCopyWith(
          RealtimeEventClose value, $Res Function(RealtimeEventClose) _then) =
      _$RealtimeEventCloseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      bool error});
}

/// @nodoc
class _$RealtimeEventCloseCopyWithImpl<$Res>
    implements $RealtimeEventCloseCopyWith<$Res> {
  _$RealtimeEventCloseCopyWithImpl(this._self, this._then);

  final RealtimeEventClose _self;
  final $Res Function(RealtimeEventClose) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? error = null,
  }) {
    return _then(RealtimeEventClose(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventConversationInterrupted extends RealtimeEvent {
  const RealtimeEventConversationInterrupted(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.conversationInterrupted})
      : super._();
  factory RealtimeEventConversationInterrupted.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventConversationInterruptedFromJson(json);

  /// The unique ID of the event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventConversationInterruptedCopyWith<
          RealtimeEventConversationInterrupted>
      get copyWith => _$RealtimeEventConversationInterruptedCopyWithImpl<
          RealtimeEventConversationInterrupted>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventConversationInterruptedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventConversationInterrupted &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type);

  @override
  String toString() {
    return 'RealtimeEvent.conversationInterrupted(eventId: $eventId, type: $type)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventConversationInterruptedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventConversationInterruptedCopyWith(
          RealtimeEventConversationInterrupted value,
          $Res Function(RealtimeEventConversationInterrupted) _then) =
      _$RealtimeEventConversationInterruptedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId, RealtimeEventType type});
}

/// @nodoc
class _$RealtimeEventConversationInterruptedCopyWithImpl<$Res>
    implements $RealtimeEventConversationInterruptedCopyWith<$Res> {
  _$RealtimeEventConversationInterruptedCopyWithImpl(this._self, this._then);

  final RealtimeEventConversationInterrupted _self;
  final $Res Function(RealtimeEventConversationInterrupted) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
  }) {
    return _then(RealtimeEventConversationInterrupted(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventConversationUpdated extends RealtimeEvent {
  const RealtimeEventConversationUpdated(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.conversationUpdated,
      required this.result})
      : super._();
  factory RealtimeEventConversationUpdated.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventConversationUpdatedFromJson(json);

  /// The unique ID of the event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// No Description
  final EventHandlerResult result;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventConversationUpdatedCopyWith<RealtimeEventConversationUpdated>
      get copyWith => _$RealtimeEventConversationUpdatedCopyWithImpl<
          RealtimeEventConversationUpdated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventConversationUpdatedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventConversationUpdated &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, result);

  @override
  String toString() {
    return 'RealtimeEvent.conversationUpdated(eventId: $eventId, type: $type, result: $result)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventConversationUpdatedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventConversationUpdatedCopyWith(
          RealtimeEventConversationUpdated value,
          $Res Function(RealtimeEventConversationUpdated) _then) =
      _$RealtimeEventConversationUpdatedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      EventHandlerResult result});

  $EventHandlerResultCopyWith<$Res> get result;
}

/// @nodoc
class _$RealtimeEventConversationUpdatedCopyWithImpl<$Res>
    implements $RealtimeEventConversationUpdatedCopyWith<$Res> {
  _$RealtimeEventConversationUpdatedCopyWithImpl(this._self, this._then);

  final RealtimeEventConversationUpdated _self;
  final $Res Function(RealtimeEventConversationUpdated) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? result = null,
  }) {
    return _then(RealtimeEventConversationUpdated(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      result: null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as EventHandlerResult,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventHandlerResultCopyWith<$Res> get result {
    return $EventHandlerResultCopyWith<$Res>(_self.result, (value) {
      return _then(_self.copyWith(result: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventConversationItemAppended extends RealtimeEvent {
  const RealtimeEventConversationItemAppended(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.conversationItemAppended,
      required this.item})
      : super._();
  factory RealtimeEventConversationItemAppended.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventConversationItemAppendedFromJson(json);

  /// The unique ID of the event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// A formatted item.
  final FormattedItem item;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventConversationItemAppendedCopyWith<
          RealtimeEventConversationItemAppended>
      get copyWith => _$RealtimeEventConversationItemAppendedCopyWithImpl<
          RealtimeEventConversationItemAppended>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventConversationItemAppendedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventConversationItemAppended &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, item);

  @override
  String toString() {
    return 'RealtimeEvent.conversationItemAppended(eventId: $eventId, type: $type, item: $item)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventConversationItemAppendedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventConversationItemAppendedCopyWith(
          RealtimeEventConversationItemAppended value,
          $Res Function(RealtimeEventConversationItemAppended) _then) =
      _$RealtimeEventConversationItemAppendedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      FormattedItem item});

  $FormattedItemCopyWith<$Res> get item;
}

/// @nodoc
class _$RealtimeEventConversationItemAppendedCopyWithImpl<$Res>
    implements $RealtimeEventConversationItemAppendedCopyWith<$Res> {
  _$RealtimeEventConversationItemAppendedCopyWithImpl(this._self, this._then);

  final RealtimeEventConversationItemAppended _self;
  final $Res Function(RealtimeEventConversationItemAppended) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? item = null,
  }) {
    return _then(RealtimeEventConversationItemAppended(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as FormattedItem,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormattedItemCopyWith<$Res> get item {
    return $FormattedItemCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventConversationItemCompleted extends RealtimeEvent {
  const RealtimeEventConversationItemCompleted(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.conversationItemCompleted,
      required this.item})
      : super._();
  factory RealtimeEventConversationItemCompleted.fromJson(
          Map<String, dynamic> json) =>
      _$RealtimeEventConversationItemCompletedFromJson(json);

  /// The unique ID of the event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// A formatted item.
  final FormattedItem item;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventConversationItemCompletedCopyWith<
          RealtimeEventConversationItemCompleted>
      get copyWith => _$RealtimeEventConversationItemCompletedCopyWithImpl<
          RealtimeEventConversationItemCompleted>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventConversationItemCompletedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventConversationItemCompleted &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, item);

  @override
  String toString() {
    return 'RealtimeEvent.conversationItemCompleted(eventId: $eventId, type: $type, item: $item)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventConversationItemCompletedCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventConversationItemCompletedCopyWith(
          RealtimeEventConversationItemCompleted value,
          $Res Function(RealtimeEventConversationItemCompleted) _then) =
      _$RealtimeEventConversationItemCompletedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      FormattedItem item});

  $FormattedItemCopyWith<$Res> get item;
}

/// @nodoc
class _$RealtimeEventConversationItemCompletedCopyWithImpl<$Res>
    implements $RealtimeEventConversationItemCompletedCopyWith<$Res> {
  _$RealtimeEventConversationItemCompletedCopyWithImpl(this._self, this._then);

  final RealtimeEventConversationItemCompleted _self;
  final $Res Function(RealtimeEventConversationItemCompleted) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? item = null,
  }) {
    return _then(RealtimeEventConversationItemCompleted(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as FormattedItem,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormattedItemCopyWith<$Res> get item {
    return $FormattedItemCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class RealtimeEventGeneric extends RealtimeEvent {
  const RealtimeEventGeneric(
      {@JsonKey(name: 'event_id') required this.eventId,
      this.type = RealtimeEventType.realtimeEvent,
      required this.event})
      : super._();
  factory RealtimeEventGeneric.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventGenericFromJson(json);

  /// The unique ID of the event.
  @override
  @JsonKey(name: 'event_id')
  final String eventId;

  /// The type of the event.
  @override
  @JsonKey()
  final RealtimeEventType type;

  /// A Realtime API event.
  /// Any of: [RealtimeEventConversationItemCreate], [RealtimeEventConversationItemDelete], [RealtimeEventConversationItemTruncate], [RealtimeEventInputAudioBufferAppend], [RealtimeEventInputAudioBufferClear], [RealtimeEventInputAudioBufferCommit], [RealtimeEventResponseCancel], [RealtimeEventResponseCreate], [RealtimeEventSessionUpdate], [RealtimeEventConversationCreated], [RealtimeEventConversationItemCreated], [RealtimeEventConversationItemDeleted], [RealtimeEventConversationItemInputAudioTranscriptionCompleted], [RealtimeEventConversationItemInputAudioTranscriptionFailed], [RealtimeEventConversationItemInputAudioTranscriptionDelta], [RealtimeEventConversationItemTruncated], [RealtimeEventError], [RealtimeEventInputAudioBufferCleared], [RealtimeEventInputAudioBufferCommitted], [RealtimeEventInputAudioBufferSpeechStarted], [RealtimeEventInputAudioBufferSpeechStopped], [RealtimeEventRateLimitsUpdated], [RealtimeEventResponseAudioDelta], [RealtimeEventResponseAudioDone], [RealtimeEventResponseAudioTranscriptDelta], [RealtimeEventResponseAudioTranscriptDone], [RealtimeEventResponseContentPartAdded], [RealtimeEventResponseContentPartDone], [RealtimeEventResponseCreated], [RealtimeEventResponseDone], [RealtimeEventResponseFunctionCallArgumentsDelta], [RealtimeEventResponseFunctionCallArgumentsDone], [RealtimeEventResponseOutputItemAdded], [RealtimeEventResponseOutputItemDone], [RealtimeEventResponseTextDelta], [RealtimeEventResponseTextDone], [RealtimeEventSessionCreated], [RealtimeEventSessionUpdated], [RealtimeEventClose], [RealtimeEventConversationInterrupted], [RealtimeEventConversationUpdated], [RealtimeEventConversationItemAppended], [RealtimeEventConversationItemCompleted], [RealtimeEventGeneric]
  final RealtimeEvent event;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RealtimeEventGenericCopyWith<RealtimeEventGeneric> get copyWith =>
      _$RealtimeEventGenericCopyWithImpl<RealtimeEventGeneric>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RealtimeEventGenericToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RealtimeEventGeneric &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.event, event) || other.event == event));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, type, event);

  @override
  String toString() {
    return 'RealtimeEvent.generic(eventId: $eventId, type: $type, event: $event)';
  }
}

/// @nodoc
abstract mixin class $RealtimeEventGenericCopyWith<$Res>
    implements $RealtimeEventCopyWith<$Res> {
  factory $RealtimeEventGenericCopyWith(RealtimeEventGeneric value,
          $Res Function(RealtimeEventGeneric) _then) =
      _$RealtimeEventGenericCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'event_id') String eventId,
      RealtimeEventType type,
      RealtimeEvent event});

  $RealtimeEventCopyWith<$Res> get event;
}

/// @nodoc
class _$RealtimeEventGenericCopyWithImpl<$Res>
    implements $RealtimeEventGenericCopyWith<$Res> {
  _$RealtimeEventGenericCopyWithImpl(this._self, this._then);

  final RealtimeEventGeneric _self;
  final $Res Function(RealtimeEventGeneric) _then;

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventId = null,
    Object? type = null,
    Object? event = null,
  }) {
    return _then(RealtimeEventGeneric(
      eventId: null == eventId
          ? _self.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RealtimeEventType,
      event: null == event
          ? _self.event
          : event // ignore: cast_nullable_to_non_nullable
              as RealtimeEvent,
    ));
  }

  /// Create a copy of RealtimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RealtimeEventCopyWith<$Res> get event {
    return $RealtimeEventCopyWith<$Res>(_self.event, (value) {
      return _then(_self.copyWith(event: value));
    });
  }
}

// dart format on
