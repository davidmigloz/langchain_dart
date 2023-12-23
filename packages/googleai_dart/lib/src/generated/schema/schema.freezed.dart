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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TuningSnapshot _$TuningSnapshotFromJson(Map<String, dynamic> json) {
  return _TuningSnapshot.fromJson(json);
}

/// @nodoc
mixin _$TuningSnapshot {
  /// Output only. The tuning step.
  @JsonKey(includeIfNull: false)
  int? get step => throw _privateConstructorUsedError;

  /// Output only. The timestamp when this metric was computed.
  @JsonKey(includeIfNull: false)
  String? get computeTime => throw _privateConstructorUsedError;

  /// Output only. The epoch this step was part of.
  @JsonKey(includeIfNull: false)
  int? get epoch => throw _privateConstructorUsedError;

  /// Output only. The mean loss of the training examples for this step.
  @JsonKey(includeIfNull: false)
  double? get meanLoss => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TuningSnapshotCopyWith<TuningSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TuningSnapshotCopyWith<$Res> {
  factory $TuningSnapshotCopyWith(
          TuningSnapshot value, $Res Function(TuningSnapshot) then) =
      _$TuningSnapshotCopyWithImpl<$Res, TuningSnapshot>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? step,
      @JsonKey(includeIfNull: false) String? computeTime,
      @JsonKey(includeIfNull: false) int? epoch,
      @JsonKey(includeIfNull: false) double? meanLoss});
}

/// @nodoc
class _$TuningSnapshotCopyWithImpl<$Res, $Val extends TuningSnapshot>
    implements $TuningSnapshotCopyWith<$Res> {
  _$TuningSnapshotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = freezed,
    Object? computeTime = freezed,
    Object? epoch = freezed,
    Object? meanLoss = freezed,
  }) {
    return _then(_value.copyWith(
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      computeTime: freezed == computeTime
          ? _value.computeTime
          : computeTime // ignore: cast_nullable_to_non_nullable
              as String?,
      epoch: freezed == epoch
          ? _value.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as int?,
      meanLoss: freezed == meanLoss
          ? _value.meanLoss
          : meanLoss // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TuningSnapshotImplCopyWith<$Res>
    implements $TuningSnapshotCopyWith<$Res> {
  factory _$$TuningSnapshotImplCopyWith(_$TuningSnapshotImpl value,
          $Res Function(_$TuningSnapshotImpl) then) =
      __$$TuningSnapshotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? step,
      @JsonKey(includeIfNull: false) String? computeTime,
      @JsonKey(includeIfNull: false) int? epoch,
      @JsonKey(includeIfNull: false) double? meanLoss});
}

/// @nodoc
class __$$TuningSnapshotImplCopyWithImpl<$Res>
    extends _$TuningSnapshotCopyWithImpl<$Res, _$TuningSnapshotImpl>
    implements _$$TuningSnapshotImplCopyWith<$Res> {
  __$$TuningSnapshotImplCopyWithImpl(
      _$TuningSnapshotImpl _value, $Res Function(_$TuningSnapshotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = freezed,
    Object? computeTime = freezed,
    Object? epoch = freezed,
    Object? meanLoss = freezed,
  }) {
    return _then(_$TuningSnapshotImpl(
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      computeTime: freezed == computeTime
          ? _value.computeTime
          : computeTime // ignore: cast_nullable_to_non_nullable
              as String?,
      epoch: freezed == epoch
          ? _value.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as int?,
      meanLoss: freezed == meanLoss
          ? _value.meanLoss
          : meanLoss // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TuningSnapshotImpl extends _TuningSnapshot {
  const _$TuningSnapshotImpl(
      {@JsonKey(includeIfNull: false) this.step,
      @JsonKey(includeIfNull: false) this.computeTime,
      @JsonKey(includeIfNull: false) this.epoch,
      @JsonKey(includeIfNull: false) this.meanLoss})
      : super._();

  factory _$TuningSnapshotImpl.fromJson(Map<String, dynamic> json) =>
      _$$TuningSnapshotImplFromJson(json);

  /// Output only. The tuning step.
  @override
  @JsonKey(includeIfNull: false)
  final int? step;

  /// Output only. The timestamp when this metric was computed.
  @override
  @JsonKey(includeIfNull: false)
  final String? computeTime;

  /// Output only. The epoch this step was part of.
  @override
  @JsonKey(includeIfNull: false)
  final int? epoch;

  /// Output only. The mean loss of the training examples for this step.
  @override
  @JsonKey(includeIfNull: false)
  final double? meanLoss;

  @override
  String toString() {
    return 'TuningSnapshot(step: $step, computeTime: $computeTime, epoch: $epoch, meanLoss: $meanLoss)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TuningSnapshotImpl &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.computeTime, computeTime) ||
                other.computeTime == computeTime) &&
            (identical(other.epoch, epoch) || other.epoch == epoch) &&
            (identical(other.meanLoss, meanLoss) ||
                other.meanLoss == meanLoss));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, step, computeTime, epoch, meanLoss);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TuningSnapshotImplCopyWith<_$TuningSnapshotImpl> get copyWith =>
      __$$TuningSnapshotImplCopyWithImpl<_$TuningSnapshotImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TuningSnapshotImplToJson(
      this,
    );
  }
}

abstract class _TuningSnapshot extends TuningSnapshot {
  const factory _TuningSnapshot(
          {@JsonKey(includeIfNull: false) final int? step,
          @JsonKey(includeIfNull: false) final String? computeTime,
          @JsonKey(includeIfNull: false) final int? epoch,
          @JsonKey(includeIfNull: false) final double? meanLoss}) =
      _$TuningSnapshotImpl;
  const _TuningSnapshot._() : super._();

  factory _TuningSnapshot.fromJson(Map<String, dynamic> json) =
      _$TuningSnapshotImpl.fromJson;

  @override

  /// Output only. The tuning step.
  @JsonKey(includeIfNull: false)
  int? get step;
  @override

  /// Output only. The timestamp when this metric was computed.
  @JsonKey(includeIfNull: false)
  String? get computeTime;
  @override

  /// Output only. The epoch this step was part of.
  @JsonKey(includeIfNull: false)
  int? get epoch;
  @override

  /// Output only. The mean loss of the training examples for this step.
  @JsonKey(includeIfNull: false)
  double? get meanLoss;
  @override
  @JsonKey(ignore: true)
  _$$TuningSnapshotImplCopyWith<_$TuningSnapshotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateTunedModelMetadata _$CreateTunedModelMetadataFromJson(
    Map<String, dynamic> json) {
  return _CreateTunedModelMetadata.fromJson(json);
}

/// @nodoc
mixin _$CreateTunedModelMetadata {
  /// The total number of tuning steps.
  @JsonKey(includeIfNull: false)
  int? get totalSteps => throw _privateConstructorUsedError;

  /// Name of the tuned model associated with the tuning operation.
  @JsonKey(includeIfNull: false)
  String? get tunedModel => throw _privateConstructorUsedError;

  /// The number of steps completed.
  @JsonKey(includeIfNull: false)
  int? get completedSteps => throw _privateConstructorUsedError;

  /// Metrics collected during tuning.
  @JsonKey(includeIfNull: false)
  List<TuningSnapshot>? get snapshots => throw _privateConstructorUsedError;

  /// The completed percentage for the tuning operation.
  @JsonKey(includeIfNull: false)
  double? get completedPercent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateTunedModelMetadataCopyWith<CreateTunedModelMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTunedModelMetadataCopyWith<$Res> {
  factory $CreateTunedModelMetadataCopyWith(CreateTunedModelMetadata value,
          $Res Function(CreateTunedModelMetadata) then) =
      _$CreateTunedModelMetadataCopyWithImpl<$Res, CreateTunedModelMetadata>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? totalSteps,
      @JsonKey(includeIfNull: false) String? tunedModel,
      @JsonKey(includeIfNull: false) int? completedSteps,
      @JsonKey(includeIfNull: false) List<TuningSnapshot>? snapshots,
      @JsonKey(includeIfNull: false) double? completedPercent});
}

/// @nodoc
class _$CreateTunedModelMetadataCopyWithImpl<$Res,
        $Val extends CreateTunedModelMetadata>
    implements $CreateTunedModelMetadataCopyWith<$Res> {
  _$CreateTunedModelMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSteps = freezed,
    Object? tunedModel = freezed,
    Object? completedSteps = freezed,
    Object? snapshots = freezed,
    Object? completedPercent = freezed,
  }) {
    return _then(_value.copyWith(
      totalSteps: freezed == totalSteps
          ? _value.totalSteps
          : totalSteps // ignore: cast_nullable_to_non_nullable
              as int?,
      tunedModel: freezed == tunedModel
          ? _value.tunedModel
          : tunedModel // ignore: cast_nullable_to_non_nullable
              as String?,
      completedSteps: freezed == completedSteps
          ? _value.completedSteps
          : completedSteps // ignore: cast_nullable_to_non_nullable
              as int?,
      snapshots: freezed == snapshots
          ? _value.snapshots
          : snapshots // ignore: cast_nullable_to_non_nullable
              as List<TuningSnapshot>?,
      completedPercent: freezed == completedPercent
          ? _value.completedPercent
          : completedPercent // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTunedModelMetadataImplCopyWith<$Res>
    implements $CreateTunedModelMetadataCopyWith<$Res> {
  factory _$$CreateTunedModelMetadataImplCopyWith(
          _$CreateTunedModelMetadataImpl value,
          $Res Function(_$CreateTunedModelMetadataImpl) then) =
      __$$CreateTunedModelMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? totalSteps,
      @JsonKey(includeIfNull: false) String? tunedModel,
      @JsonKey(includeIfNull: false) int? completedSteps,
      @JsonKey(includeIfNull: false) List<TuningSnapshot>? snapshots,
      @JsonKey(includeIfNull: false) double? completedPercent});
}

/// @nodoc
class __$$CreateTunedModelMetadataImplCopyWithImpl<$Res>
    extends _$CreateTunedModelMetadataCopyWithImpl<$Res,
        _$CreateTunedModelMetadataImpl>
    implements _$$CreateTunedModelMetadataImplCopyWith<$Res> {
  __$$CreateTunedModelMetadataImplCopyWithImpl(
      _$CreateTunedModelMetadataImpl _value,
      $Res Function(_$CreateTunedModelMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSteps = freezed,
    Object? tunedModel = freezed,
    Object? completedSteps = freezed,
    Object? snapshots = freezed,
    Object? completedPercent = freezed,
  }) {
    return _then(_$CreateTunedModelMetadataImpl(
      totalSteps: freezed == totalSteps
          ? _value.totalSteps
          : totalSteps // ignore: cast_nullable_to_non_nullable
              as int?,
      tunedModel: freezed == tunedModel
          ? _value.tunedModel
          : tunedModel // ignore: cast_nullable_to_non_nullable
              as String?,
      completedSteps: freezed == completedSteps
          ? _value.completedSteps
          : completedSteps // ignore: cast_nullable_to_non_nullable
              as int?,
      snapshots: freezed == snapshots
          ? _value._snapshots
          : snapshots // ignore: cast_nullable_to_non_nullable
              as List<TuningSnapshot>?,
      completedPercent: freezed == completedPercent
          ? _value.completedPercent
          : completedPercent // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTunedModelMetadataImpl extends _CreateTunedModelMetadata {
  const _$CreateTunedModelMetadataImpl(
      {@JsonKey(includeIfNull: false) this.totalSteps,
      @JsonKey(includeIfNull: false) this.tunedModel,
      @JsonKey(includeIfNull: false) this.completedSteps,
      @JsonKey(includeIfNull: false) final List<TuningSnapshot>? snapshots,
      @JsonKey(includeIfNull: false) this.completedPercent})
      : _snapshots = snapshots,
        super._();

  factory _$CreateTunedModelMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTunedModelMetadataImplFromJson(json);

  /// The total number of tuning steps.
  @override
  @JsonKey(includeIfNull: false)
  final int? totalSteps;

  /// Name of the tuned model associated with the tuning operation.
  @override
  @JsonKey(includeIfNull: false)
  final String? tunedModel;

  /// The number of steps completed.
  @override
  @JsonKey(includeIfNull: false)
  final int? completedSteps;

  /// Metrics collected during tuning.
  final List<TuningSnapshot>? _snapshots;

  /// Metrics collected during tuning.
  @override
  @JsonKey(includeIfNull: false)
  List<TuningSnapshot>? get snapshots {
    final value = _snapshots;
    if (value == null) return null;
    if (_snapshots is EqualUnmodifiableListView) return _snapshots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// The completed percentage for the tuning operation.
  @override
  @JsonKey(includeIfNull: false)
  final double? completedPercent;

  @override
  String toString() {
    return 'CreateTunedModelMetadata(totalSteps: $totalSteps, tunedModel: $tunedModel, completedSteps: $completedSteps, snapshots: $snapshots, completedPercent: $completedPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTunedModelMetadataImpl &&
            (identical(other.totalSteps, totalSteps) ||
                other.totalSteps == totalSteps) &&
            (identical(other.tunedModel, tunedModel) ||
                other.tunedModel == tunedModel) &&
            (identical(other.completedSteps, completedSteps) ||
                other.completedSteps == completedSteps) &&
            const DeepCollectionEquality()
                .equals(other._snapshots, _snapshots) &&
            (identical(other.completedPercent, completedPercent) ||
                other.completedPercent == completedPercent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalSteps,
      tunedModel,
      completedSteps,
      const DeepCollectionEquality().hash(_snapshots),
      completedPercent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTunedModelMetadataImplCopyWith<_$CreateTunedModelMetadataImpl>
      get copyWith => __$$CreateTunedModelMetadataImplCopyWithImpl<
          _$CreateTunedModelMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTunedModelMetadataImplToJson(
      this,
    );
  }
}

abstract class _CreateTunedModelMetadata extends CreateTunedModelMetadata {
  const factory _CreateTunedModelMetadata(
          {@JsonKey(includeIfNull: false) final int? totalSteps,
          @JsonKey(includeIfNull: false) final String? tunedModel,
          @JsonKey(includeIfNull: false) final int? completedSteps,
          @JsonKey(includeIfNull: false) final List<TuningSnapshot>? snapshots,
          @JsonKey(includeIfNull: false) final double? completedPercent}) =
      _$CreateTunedModelMetadataImpl;
  const _CreateTunedModelMetadata._() : super._();

  factory _CreateTunedModelMetadata.fromJson(Map<String, dynamic> json) =
      _$CreateTunedModelMetadataImpl.fromJson;

  @override

  /// The total number of tuning steps.
  @JsonKey(includeIfNull: false)
  int? get totalSteps;
  @override

  /// Name of the tuned model associated with the tuning operation.
  @JsonKey(includeIfNull: false)
  String? get tunedModel;
  @override

  /// The number of steps completed.
  @JsonKey(includeIfNull: false)
  int? get completedSteps;
  @override

  /// Metrics collected during tuning.
  @JsonKey(includeIfNull: false)
  List<TuningSnapshot>? get snapshots;
  @override

  /// The completed percentage for the tuning operation.
  @JsonKey(includeIfNull: false)
  double? get completedPercent;
  @override
  @JsonKey(ignore: true)
  _$$CreateTunedModelMetadataImplCopyWith<_$CreateTunedModelMetadataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GenerationConfig _$GenerationConfigFromJson(Map<String, dynamic> json) {
  return _GenerationConfig.fromJson(json);
}

/// @nodoc
mixin _$GenerationConfig {
  /// Optional. The maximum cumulative probability of tokens to consider when sampling. The model uses combined Top-k and nucleus sampling. Tokens are sorted based on their assigned probabilities so that only the most likely tokens are considered. Top-k sampling directly limits the maximum number of tokens to consider, while Nucleus sampling limits number of tokens based on the cumulative probability. Note: The default value varies by model, see the `Model.top_p` attribute of the `Model` returned the `getModel` function.
  @JsonKey(includeIfNull: false)
  double? get topP => throw _privateConstructorUsedError;

  /// Optional. The maximum number of tokens to consider when sampling. The model uses combined Top-k and nucleus sampling. Top-k sampling considers the set of `top_k` most probable tokens. Defaults to 40. Note: The default value varies by model, see the `Model.top_k` attribute of the `Model` returned the `getModel` function.
  @JsonKey(includeIfNull: false)
  int? get topK => throw _privateConstructorUsedError;

  /// Optional. Number of generated responses to return. This value must be between [1, 8], inclusive. If unset, this will default to 1.
  @JsonKey(includeIfNull: false)
  int? get candidateCount => throw _privateConstructorUsedError;

  /// Optional. The maximum number of tokens to include in a candidate. If unset, this will default to output_token_limit specified in the `Model` specification.
  @JsonKey(includeIfNull: false)
  int? get maxOutputTokens => throw _privateConstructorUsedError;

  /// Optional. Controls the randomness of the output. Note: The default value varies by model, see the `Model.temperature` attribute of the `Model` returned the `getModel` function. Values can range from [0.0,1.0], inclusive. A value closer to 1.0 will produce responses that are more varied and creative, while a value closer to 0.0 will typically result in more straightforward responses from the model.
  @JsonKey(includeIfNull: false)
  double? get temperature => throw _privateConstructorUsedError;

  /// Optional. The set of character sequences (up to 5) that will stop output generation. If specified, the API will stop at the first appearance of a stop sequence. The stop sequence will not be included as part of the response.
  @JsonKey(includeIfNull: false)
  List<String>? get stopSequences => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerationConfigCopyWith<GenerationConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationConfigCopyWith<$Res> {
  factory $GenerationConfigCopyWith(
          GenerationConfig value, $Res Function(GenerationConfig) then) =
      _$GenerationConfigCopyWithImpl<$Res, GenerationConfig>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) double? topP,
      @JsonKey(includeIfNull: false) int? topK,
      @JsonKey(includeIfNull: false) int? candidateCount,
      @JsonKey(includeIfNull: false) int? maxOutputTokens,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(includeIfNull: false) List<String>? stopSequences});
}

/// @nodoc
class _$GenerationConfigCopyWithImpl<$Res, $Val extends GenerationConfig>
    implements $GenerationConfigCopyWith<$Res> {
  _$GenerationConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topP = freezed,
    Object? topK = freezed,
    Object? candidateCount = freezed,
    Object? maxOutputTokens = freezed,
    Object? temperature = freezed,
    Object? stopSequences = freezed,
  }) {
    return _then(_value.copyWith(
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      topK: freezed == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      candidateCount: freezed == candidateCount
          ? _value.candidateCount
          : candidateCount // ignore: cast_nullable_to_non_nullable
              as int?,
      maxOutputTokens: freezed == maxOutputTokens
          ? _value.maxOutputTokens
          : maxOutputTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      stopSequences: freezed == stopSequences
          ? _value.stopSequences
          : stopSequences // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerationConfigImplCopyWith<$Res>
    implements $GenerationConfigCopyWith<$Res> {
  factory _$$GenerationConfigImplCopyWith(_$GenerationConfigImpl value,
          $Res Function(_$GenerationConfigImpl) then) =
      __$$GenerationConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) double? topP,
      @JsonKey(includeIfNull: false) int? topK,
      @JsonKey(includeIfNull: false) int? candidateCount,
      @JsonKey(includeIfNull: false) int? maxOutputTokens,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(includeIfNull: false) List<String>? stopSequences});
}

/// @nodoc
class __$$GenerationConfigImplCopyWithImpl<$Res>
    extends _$GenerationConfigCopyWithImpl<$Res, _$GenerationConfigImpl>
    implements _$$GenerationConfigImplCopyWith<$Res> {
  __$$GenerationConfigImplCopyWithImpl(_$GenerationConfigImpl _value,
      $Res Function(_$GenerationConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topP = freezed,
    Object? topK = freezed,
    Object? candidateCount = freezed,
    Object? maxOutputTokens = freezed,
    Object? temperature = freezed,
    Object? stopSequences = freezed,
  }) {
    return _then(_$GenerationConfigImpl(
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      topK: freezed == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      candidateCount: freezed == candidateCount
          ? _value.candidateCount
          : candidateCount // ignore: cast_nullable_to_non_nullable
              as int?,
      maxOutputTokens: freezed == maxOutputTokens
          ? _value.maxOutputTokens
          : maxOutputTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      stopSequences: freezed == stopSequences
          ? _value._stopSequences
          : stopSequences // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerationConfigImpl extends _GenerationConfig {
  const _$GenerationConfigImpl(
      {@JsonKey(includeIfNull: false) this.topP,
      @JsonKey(includeIfNull: false) this.topK,
      @JsonKey(includeIfNull: false) this.candidateCount,
      @JsonKey(includeIfNull: false) this.maxOutputTokens,
      @JsonKey(includeIfNull: false) this.temperature,
      @JsonKey(includeIfNull: false) final List<String>? stopSequences})
      : _stopSequences = stopSequences,
        super._();

  factory _$GenerationConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerationConfigImplFromJson(json);

  /// Optional. The maximum cumulative probability of tokens to consider when sampling. The model uses combined Top-k and nucleus sampling. Tokens are sorted based on their assigned probabilities so that only the most likely tokens are considered. Top-k sampling directly limits the maximum number of tokens to consider, while Nucleus sampling limits number of tokens based on the cumulative probability. Note: The default value varies by model, see the `Model.top_p` attribute of the `Model` returned the `getModel` function.
  @override
  @JsonKey(includeIfNull: false)
  final double? topP;

  /// Optional. The maximum number of tokens to consider when sampling. The model uses combined Top-k and nucleus sampling. Top-k sampling considers the set of `top_k` most probable tokens. Defaults to 40. Note: The default value varies by model, see the `Model.top_k` attribute of the `Model` returned the `getModel` function.
  @override
  @JsonKey(includeIfNull: false)
  final int? topK;

  /// Optional. Number of generated responses to return. This value must be between [1, 8], inclusive. If unset, this will default to 1.
  @override
  @JsonKey(includeIfNull: false)
  final int? candidateCount;

  /// Optional. The maximum number of tokens to include in a candidate. If unset, this will default to output_token_limit specified in the `Model` specification.
  @override
  @JsonKey(includeIfNull: false)
  final int? maxOutputTokens;

  /// Optional. Controls the randomness of the output. Note: The default value varies by model, see the `Model.temperature` attribute of the `Model` returned the `getModel` function. Values can range from [0.0,1.0], inclusive. A value closer to 1.0 will produce responses that are more varied and creative, while a value closer to 0.0 will typically result in more straightforward responses from the model.
  @override
  @JsonKey(includeIfNull: false)
  final double? temperature;

  /// Optional. The set of character sequences (up to 5) that will stop output generation. If specified, the API will stop at the first appearance of a stop sequence. The stop sequence will not be included as part of the response.
  final List<String>? _stopSequences;

  /// Optional. The set of character sequences (up to 5) that will stop output generation. If specified, the API will stop at the first appearance of a stop sequence. The stop sequence will not be included as part of the response.
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get stopSequences {
    final value = _stopSequences;
    if (value == null) return null;
    if (_stopSequences is EqualUnmodifiableListView) return _stopSequences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GenerationConfig(topP: $topP, topK: $topK, candidateCount: $candidateCount, maxOutputTokens: $maxOutputTokens, temperature: $temperature, stopSequences: $stopSequences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationConfigImpl &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.topK, topK) || other.topK == topK) &&
            (identical(other.candidateCount, candidateCount) ||
                other.candidateCount == candidateCount) &&
            (identical(other.maxOutputTokens, maxOutputTokens) ||
                other.maxOutputTokens == maxOutputTokens) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            const DeepCollectionEquality()
                .equals(other._stopSequences, _stopSequences));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      topP,
      topK,
      candidateCount,
      maxOutputTokens,
      temperature,
      const DeepCollectionEquality().hash(_stopSequences));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerationConfigImplCopyWith<_$GenerationConfigImpl> get copyWith =>
      __$$GenerationConfigImplCopyWithImpl<_$GenerationConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerationConfigImplToJson(
      this,
    );
  }
}

abstract class _GenerationConfig extends GenerationConfig {
  const factory _GenerationConfig(
          {@JsonKey(includeIfNull: false) final double? topP,
          @JsonKey(includeIfNull: false) final int? topK,
          @JsonKey(includeIfNull: false) final int? candidateCount,
          @JsonKey(includeIfNull: false) final int? maxOutputTokens,
          @JsonKey(includeIfNull: false) final double? temperature,
          @JsonKey(includeIfNull: false) final List<String>? stopSequences}) =
      _$GenerationConfigImpl;
  const _GenerationConfig._() : super._();

  factory _GenerationConfig.fromJson(Map<String, dynamic> json) =
      _$GenerationConfigImpl.fromJson;

  @override

  /// Optional. The maximum cumulative probability of tokens to consider when sampling. The model uses combined Top-k and nucleus sampling. Tokens are sorted based on their assigned probabilities so that only the most likely tokens are considered. Top-k sampling directly limits the maximum number of tokens to consider, while Nucleus sampling limits number of tokens based on the cumulative probability. Note: The default value varies by model, see the `Model.top_p` attribute of the `Model` returned the `getModel` function.
  @JsonKey(includeIfNull: false)
  double? get topP;
  @override

  /// Optional. The maximum number of tokens to consider when sampling. The model uses combined Top-k and nucleus sampling. Top-k sampling considers the set of `top_k` most probable tokens. Defaults to 40. Note: The default value varies by model, see the `Model.top_k` attribute of the `Model` returned the `getModel` function.
  @JsonKey(includeIfNull: false)
  int? get topK;
  @override

  /// Optional. Number of generated responses to return. This value must be between [1, 8], inclusive. If unset, this will default to 1.
  @JsonKey(includeIfNull: false)
  int? get candidateCount;
  @override

  /// Optional. The maximum number of tokens to include in a candidate. If unset, this will default to output_token_limit specified in the `Model` specification.
  @JsonKey(includeIfNull: false)
  int? get maxOutputTokens;
  @override

  /// Optional. Controls the randomness of the output. Note: The default value varies by model, see the `Model.temperature` attribute of the `Model` returned the `getModel` function. Values can range from [0.0,1.0], inclusive. A value closer to 1.0 will produce responses that are more varied and creative, while a value closer to 0.0 will typically result in more straightforward responses from the model.
  @JsonKey(includeIfNull: false)
  double? get temperature;
  @override

  /// Optional. The set of character sequences (up to 5) that will stop output generation. If specified, the API will stop at the first appearance of a stop sequence. The stop sequence will not be included as part of the response.
  @JsonKey(includeIfNull: false)
  List<String>? get stopSequences;
  @override
  @JsonKey(ignore: true)
  _$$GenerationConfigImplCopyWith<_$GenerationConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListOperationsResponse _$ListOperationsResponseFromJson(
    Map<String, dynamic> json) {
  return _ListOperationsResponse.fromJson(json);
}

/// @nodoc
mixin _$ListOperationsResponse {
  /// The standard List next-page token.
  @JsonKey(includeIfNull: false)
  String? get nextPageToken => throw _privateConstructorUsedError;

  /// A list of operations that matches the specified filter in the request.
  @JsonKey(includeIfNull: false)
  List<Operation>? get operations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListOperationsResponseCopyWith<ListOperationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListOperationsResponseCopyWith<$Res> {
  factory $ListOperationsResponseCopyWith(ListOperationsResponse value,
          $Res Function(ListOperationsResponse) then) =
      _$ListOperationsResponseCopyWithImpl<$Res, ListOperationsResponse>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? nextPageToken,
      @JsonKey(includeIfNull: false) List<Operation>? operations});
}

/// @nodoc
class _$ListOperationsResponseCopyWithImpl<$Res,
        $Val extends ListOperationsResponse>
    implements $ListOperationsResponseCopyWith<$Res> {
  _$ListOperationsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextPageToken = freezed,
    Object? operations = freezed,
  }) {
    return _then(_value.copyWith(
      nextPageToken: freezed == nextPageToken
          ? _value.nextPageToken
          : nextPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      operations: freezed == operations
          ? _value.operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<Operation>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListOperationsResponseImplCopyWith<$Res>
    implements $ListOperationsResponseCopyWith<$Res> {
  factory _$$ListOperationsResponseImplCopyWith(
          _$ListOperationsResponseImpl value,
          $Res Function(_$ListOperationsResponseImpl) then) =
      __$$ListOperationsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? nextPageToken,
      @JsonKey(includeIfNull: false) List<Operation>? operations});
}

/// @nodoc
class __$$ListOperationsResponseImplCopyWithImpl<$Res>
    extends _$ListOperationsResponseCopyWithImpl<$Res,
        _$ListOperationsResponseImpl>
    implements _$$ListOperationsResponseImplCopyWith<$Res> {
  __$$ListOperationsResponseImplCopyWithImpl(
      _$ListOperationsResponseImpl _value,
      $Res Function(_$ListOperationsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextPageToken = freezed,
    Object? operations = freezed,
  }) {
    return _then(_$ListOperationsResponseImpl(
      nextPageToken: freezed == nextPageToken
          ? _value.nextPageToken
          : nextPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      operations: freezed == operations
          ? _value._operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<Operation>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListOperationsResponseImpl extends _ListOperationsResponse {
  const _$ListOperationsResponseImpl(
      {@JsonKey(includeIfNull: false) this.nextPageToken,
      @JsonKey(includeIfNull: false) final List<Operation>? operations})
      : _operations = operations,
        super._();

  factory _$ListOperationsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListOperationsResponseImplFromJson(json);

  /// The standard List next-page token.
  @override
  @JsonKey(includeIfNull: false)
  final String? nextPageToken;

  /// A list of operations that matches the specified filter in the request.
  final List<Operation>? _operations;

  /// A list of operations that matches the specified filter in the request.
  @override
  @JsonKey(includeIfNull: false)
  List<Operation>? get operations {
    final value = _operations;
    if (value == null) return null;
    if (_operations is EqualUnmodifiableListView) return _operations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListOperationsResponse(nextPageToken: $nextPageToken, operations: $operations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListOperationsResponseImpl &&
            (identical(other.nextPageToken, nextPageToken) ||
                other.nextPageToken == nextPageToken) &&
            const DeepCollectionEquality()
                .equals(other._operations, _operations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nextPageToken,
      const DeepCollectionEquality().hash(_operations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListOperationsResponseImplCopyWith<_$ListOperationsResponseImpl>
      get copyWith => __$$ListOperationsResponseImplCopyWithImpl<
          _$ListOperationsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListOperationsResponseImplToJson(
      this,
    );
  }
}

abstract class _ListOperationsResponse extends ListOperationsResponse {
  const factory _ListOperationsResponse(
          {@JsonKey(includeIfNull: false) final String? nextPageToken,
          @JsonKey(includeIfNull: false) final List<Operation>? operations}) =
      _$ListOperationsResponseImpl;
  const _ListOperationsResponse._() : super._();

  factory _ListOperationsResponse.fromJson(Map<String, dynamic> json) =
      _$ListOperationsResponseImpl.fromJson;

  @override

  /// The standard List next-page token.
  @JsonKey(includeIfNull: false)
  String? get nextPageToken;
  @override

  /// A list of operations that matches the specified filter in the request.
  @JsonKey(includeIfNull: false)
  List<Operation>? get operations;
  @override
  @JsonKey(ignore: true)
  _$$ListOperationsResponseImplCopyWith<_$ListOperationsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Model _$ModelFromJson(Map<String, dynamic> json) {
  return _Model.fromJson(json);
}

/// @nodoc
mixin _$Model {
  /// Required. The resource name of the `Model`. Format: `models/{model}` with a `{model}` naming convention of: * "{base_model_id}-{version}" Examples: * `models/chat-bison-001`
  @JsonKey(includeIfNull: false)
  String? get name => throw _privateConstructorUsedError;

  /// The human-readable name of the model. E.g. "Chat Bison". The name can be up to 128 characters long and can consist of any UTF-8 characters.
  @JsonKey(includeIfNull: false)
  String? get displayName => throw _privateConstructorUsedError;

  /// A short description of the model.
  @JsonKey(includeIfNull: false)
  String? get description => throw _privateConstructorUsedError;

  /// For Top-k sampling. Top-k sampling considers the set of `top_k` most probable tokens. This value specifies default to be used by the backend while making the call to the model.
  @JsonKey(includeIfNull: false)
  int? get topK => throw _privateConstructorUsedError;

  /// Required. The version number of the model. This represents the major version
  @JsonKey(includeIfNull: false)
  String? get version => throw _privateConstructorUsedError;

  /// Controls the randomness of the output. Values can range over `[0.0,1.0]`, inclusive. A value closer to `1.0` will produce responses that are more varied, while a value closer to `0.0` will typically result in less surprising responses from the model. This value specifies default to be used by the backend while making the call to the model.
  @JsonKey(includeIfNull: false)
  double? get temperature => throw _privateConstructorUsedError;

  /// For Nucleus sampling. Nucleus sampling considers the smallest set of tokens whose probability sum is at least `top_p`. This value specifies default to be used by the backend while making the call to the model.
  @JsonKey(includeIfNull: false)
  double? get topP => throw _privateConstructorUsedError;

  /// Required. The name of the base model, pass this to the generation request. Examples: * `chat-bison`
  @JsonKey(includeIfNull: false)
  String? get baseModelId => throw _privateConstructorUsedError;

  /// Maximum number of input tokens allowed for this model.
  @JsonKey(includeIfNull: false)
  int? get inputTokenLimit => throw _privateConstructorUsedError;

  /// Maximum number of output tokens available for this model.
  @JsonKey(includeIfNull: false)
  int? get outputTokenLimit => throw _privateConstructorUsedError;

  /// The model's supported generation methods. The method names are defined as Pascal case strings, such as `generateMessage` which correspond to API methods.
  @JsonKey(includeIfNull: false)
  List<String>? get supportedGenerationMethods =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelCopyWith<Model> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelCopyWith<$Res> {
  factory $ModelCopyWith(Model value, $Res Function(Model) then) =
      _$ModelCopyWithImpl<$Res, Model>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? name,
      @JsonKey(includeIfNull: false) String? displayName,
      @JsonKey(includeIfNull: false) String? description,
      @JsonKey(includeIfNull: false) int? topK,
      @JsonKey(includeIfNull: false) String? version,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(includeIfNull: false) double? topP,
      @JsonKey(includeIfNull: false) String? baseModelId,
      @JsonKey(includeIfNull: false) int? inputTokenLimit,
      @JsonKey(includeIfNull: false) int? outputTokenLimit,
      @JsonKey(includeIfNull: false) List<String>? supportedGenerationMethods});
}

/// @nodoc
class _$ModelCopyWithImpl<$Res, $Val extends Model>
    implements $ModelCopyWith<$Res> {
  _$ModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? displayName = freezed,
    Object? description = freezed,
    Object? topK = freezed,
    Object? version = freezed,
    Object? temperature = freezed,
    Object? topP = freezed,
    Object? baseModelId = freezed,
    Object? inputTokenLimit = freezed,
    Object? outputTokenLimit = freezed,
    Object? supportedGenerationMethods = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      topK: freezed == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      baseModelId: freezed == baseModelId
          ? _value.baseModelId
          : baseModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      inputTokenLimit: freezed == inputTokenLimit
          ? _value.inputTokenLimit
          : inputTokenLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      outputTokenLimit: freezed == outputTokenLimit
          ? _value.outputTokenLimit
          : outputTokenLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      supportedGenerationMethods: freezed == supportedGenerationMethods
          ? _value.supportedGenerationMethods
          : supportedGenerationMethods // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModelImplCopyWith<$Res> implements $ModelCopyWith<$Res> {
  factory _$$ModelImplCopyWith(
          _$ModelImpl value, $Res Function(_$ModelImpl) then) =
      __$$ModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? name,
      @JsonKey(includeIfNull: false) String? displayName,
      @JsonKey(includeIfNull: false) String? description,
      @JsonKey(includeIfNull: false) int? topK,
      @JsonKey(includeIfNull: false) String? version,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(includeIfNull: false) double? topP,
      @JsonKey(includeIfNull: false) String? baseModelId,
      @JsonKey(includeIfNull: false) int? inputTokenLimit,
      @JsonKey(includeIfNull: false) int? outputTokenLimit,
      @JsonKey(includeIfNull: false) List<String>? supportedGenerationMethods});
}

/// @nodoc
class __$$ModelImplCopyWithImpl<$Res>
    extends _$ModelCopyWithImpl<$Res, _$ModelImpl>
    implements _$$ModelImplCopyWith<$Res> {
  __$$ModelImplCopyWithImpl(
      _$ModelImpl _value, $Res Function(_$ModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? displayName = freezed,
    Object? description = freezed,
    Object? topK = freezed,
    Object? version = freezed,
    Object? temperature = freezed,
    Object? topP = freezed,
    Object? baseModelId = freezed,
    Object? inputTokenLimit = freezed,
    Object? outputTokenLimit = freezed,
    Object? supportedGenerationMethods = freezed,
  }) {
    return _then(_$ModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      topK: freezed == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      baseModelId: freezed == baseModelId
          ? _value.baseModelId
          : baseModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      inputTokenLimit: freezed == inputTokenLimit
          ? _value.inputTokenLimit
          : inputTokenLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      outputTokenLimit: freezed == outputTokenLimit
          ? _value.outputTokenLimit
          : outputTokenLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      supportedGenerationMethods: freezed == supportedGenerationMethods
          ? _value._supportedGenerationMethods
          : supportedGenerationMethods // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModelImpl extends _Model {
  const _$ModelImpl(
      {@JsonKey(includeIfNull: false) this.name,
      @JsonKey(includeIfNull: false) this.displayName,
      @JsonKey(includeIfNull: false) this.description,
      @JsonKey(includeIfNull: false) this.topK,
      @JsonKey(includeIfNull: false) this.version,
      @JsonKey(includeIfNull: false) this.temperature,
      @JsonKey(includeIfNull: false) this.topP,
      @JsonKey(includeIfNull: false) this.baseModelId,
      @JsonKey(includeIfNull: false) this.inputTokenLimit,
      @JsonKey(includeIfNull: false) this.outputTokenLimit,
      @JsonKey(includeIfNull: false)
      final List<String>? supportedGenerationMethods})
      : _supportedGenerationMethods = supportedGenerationMethods,
        super._();

  factory _$ModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelImplFromJson(json);

  /// Required. The resource name of the `Model`. Format: `models/{model}` with a `{model}` naming convention of: * "{base_model_id}-{version}" Examples: * `models/chat-bison-001`
  @override
  @JsonKey(includeIfNull: false)
  final String? name;

  /// The human-readable name of the model. E.g. "Chat Bison". The name can be up to 128 characters long and can consist of any UTF-8 characters.
  @override
  @JsonKey(includeIfNull: false)
  final String? displayName;

  /// A short description of the model.
  @override
  @JsonKey(includeIfNull: false)
  final String? description;

  /// For Top-k sampling. Top-k sampling considers the set of `top_k` most probable tokens. This value specifies default to be used by the backend while making the call to the model.
  @override
  @JsonKey(includeIfNull: false)
  final int? topK;

  /// Required. The version number of the model. This represents the major version
  @override
  @JsonKey(includeIfNull: false)
  final String? version;

  /// Controls the randomness of the output. Values can range over `[0.0,1.0]`, inclusive. A value closer to `1.0` will produce responses that are more varied, while a value closer to `0.0` will typically result in less surprising responses from the model. This value specifies default to be used by the backend while making the call to the model.
  @override
  @JsonKey(includeIfNull: false)
  final double? temperature;

  /// For Nucleus sampling. Nucleus sampling considers the smallest set of tokens whose probability sum is at least `top_p`. This value specifies default to be used by the backend while making the call to the model.
  @override
  @JsonKey(includeIfNull: false)
  final double? topP;

  /// Required. The name of the base model, pass this to the generation request. Examples: * `chat-bison`
  @override
  @JsonKey(includeIfNull: false)
  final String? baseModelId;

  /// Maximum number of input tokens allowed for this model.
  @override
  @JsonKey(includeIfNull: false)
  final int? inputTokenLimit;

  /// Maximum number of output tokens available for this model.
  @override
  @JsonKey(includeIfNull: false)
  final int? outputTokenLimit;

  /// The model's supported generation methods. The method names are defined as Pascal case strings, such as `generateMessage` which correspond to API methods.
  final List<String>? _supportedGenerationMethods;

  /// The model's supported generation methods. The method names are defined as Pascal case strings, such as `generateMessage` which correspond to API methods.
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get supportedGenerationMethods {
    final value = _supportedGenerationMethods;
    if (value == null) return null;
    if (_supportedGenerationMethods is EqualUnmodifiableListView)
      return _supportedGenerationMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Model(name: $name, displayName: $displayName, description: $description, topK: $topK, version: $version, temperature: $temperature, topP: $topP, baseModelId: $baseModelId, inputTokenLimit: $inputTokenLimit, outputTokenLimit: $outputTokenLimit, supportedGenerationMethods: $supportedGenerationMethods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.topK, topK) || other.topK == topK) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.baseModelId, baseModelId) ||
                other.baseModelId == baseModelId) &&
            (identical(other.inputTokenLimit, inputTokenLimit) ||
                other.inputTokenLimit == inputTokenLimit) &&
            (identical(other.outputTokenLimit, outputTokenLimit) ||
                other.outputTokenLimit == outputTokenLimit) &&
            const DeepCollectionEquality().equals(
                other._supportedGenerationMethods,
                _supportedGenerationMethods));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      displayName,
      description,
      topK,
      version,
      temperature,
      topP,
      baseModelId,
      inputTokenLimit,
      outputTokenLimit,
      const DeepCollectionEquality().hash(_supportedGenerationMethods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelImplCopyWith<_$ModelImpl> get copyWith =>
      __$$ModelImplCopyWithImpl<_$ModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelImplToJson(
      this,
    );
  }
}

abstract class _Model extends Model {
  const factory _Model(
      {@JsonKey(includeIfNull: false) final String? name,
      @JsonKey(includeIfNull: false) final String? displayName,
      @JsonKey(includeIfNull: false) final String? description,
      @JsonKey(includeIfNull: false) final int? topK,
      @JsonKey(includeIfNull: false) final String? version,
      @JsonKey(includeIfNull: false) final double? temperature,
      @JsonKey(includeIfNull: false) final double? topP,
      @JsonKey(includeIfNull: false) final String? baseModelId,
      @JsonKey(includeIfNull: false) final int? inputTokenLimit,
      @JsonKey(includeIfNull: false) final int? outputTokenLimit,
      @JsonKey(includeIfNull: false)
      final List<String>? supportedGenerationMethods}) = _$ModelImpl;
  const _Model._() : super._();

  factory _Model.fromJson(Map<String, dynamic> json) = _$ModelImpl.fromJson;

  @override

  /// Required. The resource name of the `Model`. Format: `models/{model}` with a `{model}` naming convention of: * "{base_model_id}-{version}" Examples: * `models/chat-bison-001`
  @JsonKey(includeIfNull: false)
  String? get name;
  @override

  /// The human-readable name of the model. E.g. "Chat Bison". The name can be up to 128 characters long and can consist of any UTF-8 characters.
  @JsonKey(includeIfNull: false)
  String? get displayName;
  @override

  /// A short description of the model.
  @JsonKey(includeIfNull: false)
  String? get description;
  @override

  /// For Top-k sampling. Top-k sampling considers the set of `top_k` most probable tokens. This value specifies default to be used by the backend while making the call to the model.
  @JsonKey(includeIfNull: false)
  int? get topK;
  @override

  /// Required. The version number of the model. This represents the major version
  @JsonKey(includeIfNull: false)
  String? get version;
  @override

  /// Controls the randomness of the output. Values can range over `[0.0,1.0]`, inclusive. A value closer to `1.0` will produce responses that are more varied, while a value closer to `0.0` will typically result in less surprising responses from the model. This value specifies default to be used by the backend while making the call to the model.
  @JsonKey(includeIfNull: false)
  double? get temperature;
  @override

  /// For Nucleus sampling. Nucleus sampling considers the smallest set of tokens whose probability sum is at least `top_p`. This value specifies default to be used by the backend while making the call to the model.
  @JsonKey(includeIfNull: false)
  double? get topP;
  @override

  /// Required. The name of the base model, pass this to the generation request. Examples: * `chat-bison`
  @JsonKey(includeIfNull: false)
  String? get baseModelId;
  @override

  /// Maximum number of input tokens allowed for this model.
  @JsonKey(includeIfNull: false)
  int? get inputTokenLimit;
  @override

  /// Maximum number of output tokens available for this model.
  @JsonKey(includeIfNull: false)
  int? get outputTokenLimit;
  @override

  /// The model's supported generation methods. The method names are defined as Pascal case strings, such as `generateMessage` which correspond to API methods.
  @JsonKey(includeIfNull: false)
  List<String>? get supportedGenerationMethods;
  @override
  @JsonKey(ignore: true)
  _$$ModelImplCopyWith<_$ModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SafetyRating _$SafetyRatingFromJson(Map<String, dynamic> json) {
  return _SafetyRating.fromJson(json);
}

/// @nodoc
mixin _$SafetyRating {
  /// Required. The category for this rating.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  SafetyRatingCategory? get category => throw _privateConstructorUsedError;

  /// Required. The probability of harm for this content.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  SafetyRatingProbability? get probability =>
      throw _privateConstructorUsedError;

  /// Was this content blocked because of this rating?
  @JsonKey(includeIfNull: false)
  bool? get blocked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SafetyRatingCopyWith<SafetyRating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SafetyRatingCopyWith<$Res> {
  factory $SafetyRatingCopyWith(
          SafetyRating value, $Res Function(SafetyRating) then) =
      _$SafetyRatingCopyWithImpl<$Res, SafetyRating>;
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      SafetyRatingCategory? category,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      SafetyRatingProbability? probability,
      @JsonKey(includeIfNull: false) bool? blocked});
}

/// @nodoc
class _$SafetyRatingCopyWithImpl<$Res, $Val extends SafetyRating>
    implements $SafetyRatingCopyWith<$Res> {
  _$SafetyRatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? probability = freezed,
    Object? blocked = freezed,
  }) {
    return _then(_value.copyWith(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as SafetyRatingCategory?,
      probability: freezed == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as SafetyRatingProbability?,
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SafetyRatingImplCopyWith<$Res>
    implements $SafetyRatingCopyWith<$Res> {
  factory _$$SafetyRatingImplCopyWith(
          _$SafetyRatingImpl value, $Res Function(_$SafetyRatingImpl) then) =
      __$$SafetyRatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      SafetyRatingCategory? category,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      SafetyRatingProbability? probability,
      @JsonKey(includeIfNull: false) bool? blocked});
}

/// @nodoc
class __$$SafetyRatingImplCopyWithImpl<$Res>
    extends _$SafetyRatingCopyWithImpl<$Res, _$SafetyRatingImpl>
    implements _$$SafetyRatingImplCopyWith<$Res> {
  __$$SafetyRatingImplCopyWithImpl(
      _$SafetyRatingImpl _value, $Res Function(_$SafetyRatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? probability = freezed,
    Object? blocked = freezed,
  }) {
    return _then(_$SafetyRatingImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as SafetyRatingCategory?,
      probability: freezed == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as SafetyRatingProbability?,
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SafetyRatingImpl extends _SafetyRating {
  const _$SafetyRatingImpl(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.category,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.probability,
      @JsonKey(includeIfNull: false) this.blocked})
      : super._();

  factory _$SafetyRatingImpl.fromJson(Map<String, dynamic> json) =>
      _$$SafetyRatingImplFromJson(json);

  /// Required. The category for this rating.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final SafetyRatingCategory? category;

  /// Required. The probability of harm for this content.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final SafetyRatingProbability? probability;

  /// Was this content blocked because of this rating?
  @override
  @JsonKey(includeIfNull: false)
  final bool? blocked;

  @override
  String toString() {
    return 'SafetyRating(category: $category, probability: $probability, blocked: $blocked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SafetyRatingImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.probability, probability) ||
                other.probability == probability) &&
            (identical(other.blocked, blocked) || other.blocked == blocked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, probability, blocked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SafetyRatingImplCopyWith<_$SafetyRatingImpl> get copyWith =>
      __$$SafetyRatingImplCopyWithImpl<_$SafetyRatingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SafetyRatingImplToJson(
      this,
    );
  }
}

abstract class _SafetyRating extends SafetyRating {
  const factory _SafetyRating(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      final SafetyRatingCategory? category,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      final SafetyRatingProbability? probability,
      @JsonKey(includeIfNull: false) final bool? blocked}) = _$SafetyRatingImpl;
  const _SafetyRating._() : super._();

  factory _SafetyRating.fromJson(Map<String, dynamic> json) =
      _$SafetyRatingImpl.fromJson;

  @override

  /// Required. The category for this rating.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  SafetyRatingCategory? get category;
  @override

  /// Required. The probability of harm for this content.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  SafetyRatingProbability? get probability;
  @override

  /// Was this content blocked because of this rating?
  @JsonKey(includeIfNull: false)
  bool? get blocked;
  @override
  @JsonKey(ignore: true)
  _$$SafetyRatingImplCopyWith<_$SafetyRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Part _$PartFromJson(Map<String, dynamic> json) {
  return _Part.fromJson(json);
}

/// @nodoc
mixin _$Part {
  /// Inline media bytes.
  @JsonKey(includeIfNull: false)
  Blob? get inlineData => throw _privateConstructorUsedError;

  /// Inline text.
  @JsonKey(includeIfNull: false)
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartCopyWith<Part> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartCopyWith<$Res> {
  factory $PartCopyWith(Part value, $Res Function(Part) then) =
      _$PartCopyWithImpl<$Res, Part>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) Blob? inlineData,
      @JsonKey(includeIfNull: false) String? text});

  $BlobCopyWith<$Res>? get inlineData;
}

/// @nodoc
class _$PartCopyWithImpl<$Res, $Val extends Part>
    implements $PartCopyWith<$Res> {
  _$PartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inlineData = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      inlineData: freezed == inlineData
          ? _value.inlineData
          : inlineData // ignore: cast_nullable_to_non_nullable
              as Blob?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BlobCopyWith<$Res>? get inlineData {
    if (_value.inlineData == null) {
      return null;
    }

    return $BlobCopyWith<$Res>(_value.inlineData!, (value) {
      return _then(_value.copyWith(inlineData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PartImplCopyWith<$Res> implements $PartCopyWith<$Res> {
  factory _$$PartImplCopyWith(
          _$PartImpl value, $Res Function(_$PartImpl) then) =
      __$$PartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) Blob? inlineData,
      @JsonKey(includeIfNull: false) String? text});

  @override
  $BlobCopyWith<$Res>? get inlineData;
}

/// @nodoc
class __$$PartImplCopyWithImpl<$Res>
    extends _$PartCopyWithImpl<$Res, _$PartImpl>
    implements _$$PartImplCopyWith<$Res> {
  __$$PartImplCopyWithImpl(_$PartImpl _value, $Res Function(_$PartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inlineData = freezed,
    Object? text = freezed,
  }) {
    return _then(_$PartImpl(
      inlineData: freezed == inlineData
          ? _value.inlineData
          : inlineData // ignore: cast_nullable_to_non_nullable
              as Blob?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartImpl extends _Part {
  const _$PartImpl(
      {@JsonKey(includeIfNull: false) this.inlineData,
      @JsonKey(includeIfNull: false) this.text})
      : super._();

  factory _$PartImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartImplFromJson(json);

  /// Inline media bytes.
  @override
  @JsonKey(includeIfNull: false)
  final Blob? inlineData;

  /// Inline text.
  @override
  @JsonKey(includeIfNull: false)
  final String? text;

  @override
  String toString() {
    return 'Part(inlineData: $inlineData, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartImpl &&
            (identical(other.inlineData, inlineData) ||
                other.inlineData == inlineData) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, inlineData, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartImplCopyWith<_$PartImpl> get copyWith =>
      __$$PartImplCopyWithImpl<_$PartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartImplToJson(
      this,
    );
  }
}

abstract class _Part extends Part {
  const factory _Part(
      {@JsonKey(includeIfNull: false) final Blob? inlineData,
      @JsonKey(includeIfNull: false) final String? text}) = _$PartImpl;
  const _Part._() : super._();

  factory _Part.fromJson(Map<String, dynamic> json) = _$PartImpl.fromJson;

  @override

  /// Inline media bytes.
  @JsonKey(includeIfNull: false)
  Blob? get inlineData;
  @override

  /// Inline text.
  @JsonKey(includeIfNull: false)
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$PartImplCopyWith<_$PartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Empty _$EmptyFromJson(Map<String, dynamic> json) {
  return _Empty.fromJson(json);
}

/// @nodoc
mixin _$Empty {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmptyCopyWith<$Res> {
  factory $EmptyCopyWith(Empty value, $Res Function(Empty) then) =
      _$EmptyCopyWithImpl<$Res, Empty>;
}

/// @nodoc
class _$EmptyCopyWithImpl<$Res, $Val extends Empty>
    implements $EmptyCopyWith<$Res> {
  _$EmptyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<$Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl value, $Res Function(_$EmptyImpl) then) =
      __$$EmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<$Res>
    extends _$EmptyCopyWithImpl<$Res, _$EmptyImpl>
    implements _$$EmptyImplCopyWith<$Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl _value, $Res Function(_$EmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EmptyImpl extends _Empty {
  const _$EmptyImpl() : super._();

  factory _$EmptyImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmptyImplFromJson(json);

  @override
  String toString() {
    return 'Empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$EmptyImplToJson(
      this,
    );
  }
}

abstract class _Empty extends Empty {
  const factory _Empty() = _$EmptyImpl;
  const _Empty._() : super._();

  factory _Empty.fromJson(Map<String, dynamic> json) = _$EmptyImpl.fromJson;
}

GenerateContentRequest _$GenerateContentRequestFromJson(
    Map<String, dynamic> json) {
  return _GenerateContentRequest.fromJson(json);
}

/// @nodoc
mixin _$GenerateContentRequest {
  /// Optional. Configuration options for model generation and outputs.
  @JsonKey(includeIfNull: false)
  GenerationConfig? get generationConfig => throw _privateConstructorUsedError;

  /// Required. The content of the current conversation with the model. For single-turn queries, this is a single instance. For multi-turn queries, this is a repeated field that contains conversation history + latest request.
  @JsonKey(includeIfNull: false)
  List<Content>? get contents => throw _privateConstructorUsedError;

  /// Optional. A list of unique `SafetySetting` instances for blocking unsafe content. This will be enforced on the `GenerateContentRequest.contents` and `GenerateContentResponse.candidates`. There should not be more than one setting for each `SafetyCategory` type. The API will block any contents and responses that fail to meet the thresholds set by these settings. This list overrides the default settings for each `SafetyCategory` specified in the safety_settings. If there is no `SafetySetting` for a given `SafetyCategory` provided in the list, the API will use the default safety setting for that category. Harm categories HARM_CATEGORY_HATE_SPEECH, HARM_CATEGORY_SEXUALLY_EXPLICIT, HARM_CATEGORY_DANGEROUS_CONTENT, HARM_CATEGORY_HARASSMENT are supported.
  @JsonKey(includeIfNull: false)
  List<SafetySetting>? get safetySettings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateContentRequestCopyWith<GenerateContentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateContentRequestCopyWith<$Res> {
  factory $GenerateContentRequestCopyWith(GenerateContentRequest value,
          $Res Function(GenerateContentRequest) then) =
      _$GenerateContentRequestCopyWithImpl<$Res, GenerateContentRequest>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) GenerationConfig? generationConfig,
      @JsonKey(includeIfNull: false) List<Content>? contents,
      @JsonKey(includeIfNull: false) List<SafetySetting>? safetySettings});

  $GenerationConfigCopyWith<$Res>? get generationConfig;
}

/// @nodoc
class _$GenerateContentRequestCopyWithImpl<$Res,
        $Val extends GenerateContentRequest>
    implements $GenerateContentRequestCopyWith<$Res> {
  _$GenerateContentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generationConfig = freezed,
    Object? contents = freezed,
    Object? safetySettings = freezed,
  }) {
    return _then(_value.copyWith(
      generationConfig: freezed == generationConfig
          ? _value.generationConfig
          : generationConfig // ignore: cast_nullable_to_non_nullable
              as GenerationConfig?,
      contents: freezed == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
      safetySettings: freezed == safetySettings
          ? _value.safetySettings
          : safetySettings // ignore: cast_nullable_to_non_nullable
              as List<SafetySetting>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GenerationConfigCopyWith<$Res>? get generationConfig {
    if (_value.generationConfig == null) {
      return null;
    }

    return $GenerationConfigCopyWith<$Res>(_value.generationConfig!, (value) {
      return _then(_value.copyWith(generationConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GenerateContentRequestImplCopyWith<$Res>
    implements $GenerateContentRequestCopyWith<$Res> {
  factory _$$GenerateContentRequestImplCopyWith(
          _$GenerateContentRequestImpl value,
          $Res Function(_$GenerateContentRequestImpl) then) =
      __$$GenerateContentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) GenerationConfig? generationConfig,
      @JsonKey(includeIfNull: false) List<Content>? contents,
      @JsonKey(includeIfNull: false) List<SafetySetting>? safetySettings});

  @override
  $GenerationConfigCopyWith<$Res>? get generationConfig;
}

/// @nodoc
class __$$GenerateContentRequestImplCopyWithImpl<$Res>
    extends _$GenerateContentRequestCopyWithImpl<$Res,
        _$GenerateContentRequestImpl>
    implements _$$GenerateContentRequestImplCopyWith<$Res> {
  __$$GenerateContentRequestImplCopyWithImpl(
      _$GenerateContentRequestImpl _value,
      $Res Function(_$GenerateContentRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generationConfig = freezed,
    Object? contents = freezed,
    Object? safetySettings = freezed,
  }) {
    return _then(_$GenerateContentRequestImpl(
      generationConfig: freezed == generationConfig
          ? _value.generationConfig
          : generationConfig // ignore: cast_nullable_to_non_nullable
              as GenerationConfig?,
      contents: freezed == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
      safetySettings: freezed == safetySettings
          ? _value._safetySettings
          : safetySettings // ignore: cast_nullable_to_non_nullable
              as List<SafetySetting>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateContentRequestImpl extends _GenerateContentRequest {
  const _$GenerateContentRequestImpl(
      {@JsonKey(includeIfNull: false) this.generationConfig,
      @JsonKey(includeIfNull: false) final List<Content>? contents,
      @JsonKey(includeIfNull: false) final List<SafetySetting>? safetySettings})
      : _contents = contents,
        _safetySettings = safetySettings,
        super._();

  factory _$GenerateContentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateContentRequestImplFromJson(json);

  /// Optional. Configuration options for model generation and outputs.
  @override
  @JsonKey(includeIfNull: false)
  final GenerationConfig? generationConfig;

  /// Required. The content of the current conversation with the model. For single-turn queries, this is a single instance. For multi-turn queries, this is a repeated field that contains conversation history + latest request.
  final List<Content>? _contents;

  /// Required. The content of the current conversation with the model. For single-turn queries, this is a single instance. For multi-turn queries, this is a repeated field that contains conversation history + latest request.
  @override
  @JsonKey(includeIfNull: false)
  List<Content>? get contents {
    final value = _contents;
    if (value == null) return null;
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional. A list of unique `SafetySetting` instances for blocking unsafe content. This will be enforced on the `GenerateContentRequest.contents` and `GenerateContentResponse.candidates`. There should not be more than one setting for each `SafetyCategory` type. The API will block any contents and responses that fail to meet the thresholds set by these settings. This list overrides the default settings for each `SafetyCategory` specified in the safety_settings. If there is no `SafetySetting` for a given `SafetyCategory` provided in the list, the API will use the default safety setting for that category. Harm categories HARM_CATEGORY_HATE_SPEECH, HARM_CATEGORY_SEXUALLY_EXPLICIT, HARM_CATEGORY_DANGEROUS_CONTENT, HARM_CATEGORY_HARASSMENT are supported.
  final List<SafetySetting>? _safetySettings;

  /// Optional. A list of unique `SafetySetting` instances for blocking unsafe content. This will be enforced on the `GenerateContentRequest.contents` and `GenerateContentResponse.candidates`. There should not be more than one setting for each `SafetyCategory` type. The API will block any contents and responses that fail to meet the thresholds set by these settings. This list overrides the default settings for each `SafetyCategory` specified in the safety_settings. If there is no `SafetySetting` for a given `SafetyCategory` provided in the list, the API will use the default safety setting for that category. Harm categories HARM_CATEGORY_HATE_SPEECH, HARM_CATEGORY_SEXUALLY_EXPLICIT, HARM_CATEGORY_DANGEROUS_CONTENT, HARM_CATEGORY_HARASSMENT are supported.
  @override
  @JsonKey(includeIfNull: false)
  List<SafetySetting>? get safetySettings {
    final value = _safetySettings;
    if (value == null) return null;
    if (_safetySettings is EqualUnmodifiableListView) return _safetySettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GenerateContentRequest(generationConfig: $generationConfig, contents: $contents, safetySettings: $safetySettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateContentRequestImpl &&
            (identical(other.generationConfig, generationConfig) ||
                other.generationConfig == generationConfig) &&
            const DeepCollectionEquality().equals(other._contents, _contents) &&
            const DeepCollectionEquality()
                .equals(other._safetySettings, _safetySettings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      generationConfig,
      const DeepCollectionEquality().hash(_contents),
      const DeepCollectionEquality().hash(_safetySettings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateContentRequestImplCopyWith<_$GenerateContentRequestImpl>
      get copyWith => __$$GenerateContentRequestImplCopyWithImpl<
          _$GenerateContentRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateContentRequestImplToJson(
      this,
    );
  }
}

abstract class _GenerateContentRequest extends GenerateContentRequest {
  const factory _GenerateContentRequest(
      {@JsonKey(includeIfNull: false) final GenerationConfig? generationConfig,
      @JsonKey(includeIfNull: false) final List<Content>? contents,
      @JsonKey(includeIfNull: false)
      final List<SafetySetting>?
          safetySettings}) = _$GenerateContentRequestImpl;
  const _GenerateContentRequest._() : super._();

  factory _GenerateContentRequest.fromJson(Map<String, dynamic> json) =
      _$GenerateContentRequestImpl.fromJson;

  @override

  /// Optional. Configuration options for model generation and outputs.
  @JsonKey(includeIfNull: false)
  GenerationConfig? get generationConfig;
  @override

  /// Required. The content of the current conversation with the model. For single-turn queries, this is a single instance. For multi-turn queries, this is a repeated field that contains conversation history + latest request.
  @JsonKey(includeIfNull: false)
  List<Content>? get contents;
  @override

  /// Optional. A list of unique `SafetySetting` instances for blocking unsafe content. This will be enforced on the `GenerateContentRequest.contents` and `GenerateContentResponse.candidates`. There should not be more than one setting for each `SafetyCategory` type. The API will block any contents and responses that fail to meet the thresholds set by these settings. This list overrides the default settings for each `SafetyCategory` specified in the safety_settings. If there is no `SafetySetting` for a given `SafetyCategory` provided in the list, the API will use the default safety setting for that category. Harm categories HARM_CATEGORY_HATE_SPEECH, HARM_CATEGORY_SEXUALLY_EXPLICIT, HARM_CATEGORY_DANGEROUS_CONTENT, HARM_CATEGORY_HARASSMENT are supported.
  @JsonKey(includeIfNull: false)
  List<SafetySetting>? get safetySettings;
  @override
  @JsonKey(ignore: true)
  _$$GenerateContentRequestImplCopyWith<_$GenerateContentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EmbedContentResponse _$EmbedContentResponseFromJson(Map<String, dynamic> json) {
  return _EmbedContentResponse.fromJson(json);
}

/// @nodoc
mixin _$EmbedContentResponse {
  /// Output only. The embedding generated from the input content.
  @JsonKey(includeIfNull: false)
  ContentEmbedding? get embedding => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmbedContentResponseCopyWith<EmbedContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmbedContentResponseCopyWith<$Res> {
  factory $EmbedContentResponseCopyWith(EmbedContentResponse value,
          $Res Function(EmbedContentResponse) then) =
      _$EmbedContentResponseCopyWithImpl<$Res, EmbedContentResponse>;
  @useResult
  $Res call({@JsonKey(includeIfNull: false) ContentEmbedding? embedding});

  $ContentEmbeddingCopyWith<$Res>? get embedding;
}

/// @nodoc
class _$EmbedContentResponseCopyWithImpl<$Res,
        $Val extends EmbedContentResponse>
    implements $EmbedContentResponseCopyWith<$Res> {
  _$EmbedContentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embedding = freezed,
  }) {
    return _then(_value.copyWith(
      embedding: freezed == embedding
          ? _value.embedding
          : embedding // ignore: cast_nullable_to_non_nullable
              as ContentEmbedding?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentEmbeddingCopyWith<$Res>? get embedding {
    if (_value.embedding == null) {
      return null;
    }

    return $ContentEmbeddingCopyWith<$Res>(_value.embedding!, (value) {
      return _then(_value.copyWith(embedding: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmbedContentResponseImplCopyWith<$Res>
    implements $EmbedContentResponseCopyWith<$Res> {
  factory _$$EmbedContentResponseImplCopyWith(_$EmbedContentResponseImpl value,
          $Res Function(_$EmbedContentResponseImpl) then) =
      __$$EmbedContentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: false) ContentEmbedding? embedding});

  @override
  $ContentEmbeddingCopyWith<$Res>? get embedding;
}

/// @nodoc
class __$$EmbedContentResponseImplCopyWithImpl<$Res>
    extends _$EmbedContentResponseCopyWithImpl<$Res, _$EmbedContentResponseImpl>
    implements _$$EmbedContentResponseImplCopyWith<$Res> {
  __$$EmbedContentResponseImplCopyWithImpl(_$EmbedContentResponseImpl _value,
      $Res Function(_$EmbedContentResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embedding = freezed,
  }) {
    return _then(_$EmbedContentResponseImpl(
      embedding: freezed == embedding
          ? _value.embedding
          : embedding // ignore: cast_nullable_to_non_nullable
              as ContentEmbedding?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmbedContentResponseImpl extends _EmbedContentResponse {
  const _$EmbedContentResponseImpl(
      {@JsonKey(includeIfNull: false) this.embedding})
      : super._();

  factory _$EmbedContentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmbedContentResponseImplFromJson(json);

  /// Output only. The embedding generated from the input content.
  @override
  @JsonKey(includeIfNull: false)
  final ContentEmbedding? embedding;

  @override
  String toString() {
    return 'EmbedContentResponse(embedding: $embedding)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmbedContentResponseImpl &&
            (identical(other.embedding, embedding) ||
                other.embedding == embedding));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, embedding);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmbedContentResponseImplCopyWith<_$EmbedContentResponseImpl>
      get copyWith =>
          __$$EmbedContentResponseImplCopyWithImpl<_$EmbedContentResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmbedContentResponseImplToJson(
      this,
    );
  }
}

abstract class _EmbedContentResponse extends EmbedContentResponse {
  const factory _EmbedContentResponse(
          {@JsonKey(includeIfNull: false) final ContentEmbedding? embedding}) =
      _$EmbedContentResponseImpl;
  const _EmbedContentResponse._() : super._();

  factory _EmbedContentResponse.fromJson(Map<String, dynamic> json) =
      _$EmbedContentResponseImpl.fromJson;

  @override

  /// Output only. The embedding generated from the input content.
  @JsonKey(includeIfNull: false)
  ContentEmbedding? get embedding;
  @override
  @JsonKey(ignore: true)
  _$$EmbedContentResponseImplCopyWith<_$EmbedContentResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Content _$ContentFromJson(Map<String, dynamic> json) {
  return _Content.fromJson(json);
}

/// @nodoc
mixin _$Content {
  /// Optional. The producer of the content. Must be either 'user' or 'model'. Useful to set for multi-turn conversations, otherwise can be left blank or unset.
  @JsonKey(includeIfNull: false)
  String? get role => throw _privateConstructorUsedError;

  /// Ordered `Parts` that constitute a single message. Parts may have different MIME types.
  @JsonKey(includeIfNull: false)
  List<Part>? get parts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res, Content>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? role,
      @JsonKey(includeIfNull: false) List<Part>? parts});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res, $Val extends Content>
    implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? parts = freezed,
  }) {
    return _then(_value.copyWith(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      parts: freezed == parts
          ? _value.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<Part>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentImplCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$$ContentImplCopyWith(
          _$ContentImpl value, $Res Function(_$ContentImpl) then) =
      __$$ContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? role,
      @JsonKey(includeIfNull: false) List<Part>? parts});
}

/// @nodoc
class __$$ContentImplCopyWithImpl<$Res>
    extends _$ContentCopyWithImpl<$Res, _$ContentImpl>
    implements _$$ContentImplCopyWith<$Res> {
  __$$ContentImplCopyWithImpl(
      _$ContentImpl _value, $Res Function(_$ContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? parts = freezed,
  }) {
    return _then(_$ContentImpl(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      parts: freezed == parts
          ? _value._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<Part>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentImpl extends _Content {
  const _$ContentImpl(
      {@JsonKey(includeIfNull: false) this.role,
      @JsonKey(includeIfNull: false) final List<Part>? parts})
      : _parts = parts,
        super._();

  factory _$ContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentImplFromJson(json);

  /// Optional. The producer of the content. Must be either 'user' or 'model'. Useful to set for multi-turn conversations, otherwise can be left blank or unset.
  @override
  @JsonKey(includeIfNull: false)
  final String? role;

  /// Ordered `Parts` that constitute a single message. Parts may have different MIME types.
  final List<Part>? _parts;

  /// Ordered `Parts` that constitute a single message. Parts may have different MIME types.
  @override
  @JsonKey(includeIfNull: false)
  List<Part>? get parts {
    final value = _parts;
    if (value == null) return null;
    if (_parts is EqualUnmodifiableListView) return _parts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Content(role: $role, parts: $parts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentImpl &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other._parts, _parts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, role, const DeepCollectionEquality().hash(_parts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      __$$ContentImplCopyWithImpl<_$ContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentImplToJson(
      this,
    );
  }
}

abstract class _Content extends Content {
  const factory _Content(
      {@JsonKey(includeIfNull: false) final String? role,
      @JsonKey(includeIfNull: false) final List<Part>? parts}) = _$ContentImpl;
  const _Content._() : super._();

  factory _Content.fromJson(Map<String, dynamic> json) = _$ContentImpl.fromJson;

  @override

  /// Optional. The producer of the content. Must be either 'user' or 'model'. Useful to set for multi-turn conversations, otherwise can be left blank or unset.
  @JsonKey(includeIfNull: false)
  String? get role;
  @override

  /// Ordered `Parts` that constitute a single message. Parts may have different MIME types.
  @JsonKey(includeIfNull: false)
  List<Part>? get parts;
  @override
  @JsonKey(ignore: true)
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CancelOperationRequest _$CancelOperationRequestFromJson(
    Map<String, dynamic> json) {
  return _CancelOperationRequest.fromJson(json);
}

/// @nodoc
mixin _$CancelOperationRequest {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelOperationRequestCopyWith<$Res> {
  factory $CancelOperationRequestCopyWith(CancelOperationRequest value,
          $Res Function(CancelOperationRequest) then) =
      _$CancelOperationRequestCopyWithImpl<$Res, CancelOperationRequest>;
}

/// @nodoc
class _$CancelOperationRequestCopyWithImpl<$Res,
        $Val extends CancelOperationRequest>
    implements $CancelOperationRequestCopyWith<$Res> {
  _$CancelOperationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CancelOperationRequestImplCopyWith<$Res> {
  factory _$$CancelOperationRequestImplCopyWith(
          _$CancelOperationRequestImpl value,
          $Res Function(_$CancelOperationRequestImpl) then) =
      __$$CancelOperationRequestImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelOperationRequestImplCopyWithImpl<$Res>
    extends _$CancelOperationRequestCopyWithImpl<$Res,
        _$CancelOperationRequestImpl>
    implements _$$CancelOperationRequestImplCopyWith<$Res> {
  __$$CancelOperationRequestImplCopyWithImpl(
      _$CancelOperationRequestImpl _value,
      $Res Function(_$CancelOperationRequestImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$CancelOperationRequestImpl extends _CancelOperationRequest {
  const _$CancelOperationRequestImpl() : super._();

  factory _$CancelOperationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelOperationRequestImplFromJson(json);

  @override
  String toString() {
    return 'CancelOperationRequest()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelOperationRequestImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelOperationRequestImplToJson(
      this,
    );
  }
}

abstract class _CancelOperationRequest extends CancelOperationRequest {
  const factory _CancelOperationRequest() = _$CancelOperationRequestImpl;
  const _CancelOperationRequest._() : super._();

  factory _CancelOperationRequest.fromJson(Map<String, dynamic> json) =
      _$CancelOperationRequestImpl.fromJson;
}

EmbedContentRequest _$EmbedContentRequestFromJson(Map<String, dynamic> json) {
  return _EmbedContentRequest.fromJson(json);
}

/// @nodoc
mixin _$EmbedContentRequest {
  /// Required. The content to embed. Only the `parts.text` fields will be counted.
  @JsonKey(includeIfNull: false)
  Content? get content => throw _privateConstructorUsedError;

  /// Optional. Optional task type for which the embeddings will be used. Can only be set for `models/embedding-001`.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  EmbedContentRequestTaskType? get taskType =>
      throw _privateConstructorUsedError;

  /// Required. The model's resource name. This serves as an ID for the Model to use. This name should match a model name returned by the `ListModels` method. Format: `models/{model}`
  @JsonKey(includeIfNull: false)
  String? get model => throw _privateConstructorUsedError;

  /// Optional. An optional title for the text. Only applicable when TaskType is `RETRIEVAL_DOCUMENT`.
  @JsonKey(includeIfNull: false)
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmbedContentRequestCopyWith<EmbedContentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmbedContentRequestCopyWith<$Res> {
  factory $EmbedContentRequestCopyWith(
          EmbedContentRequest value, $Res Function(EmbedContentRequest) then) =
      _$EmbedContentRequestCopyWithImpl<$Res, EmbedContentRequest>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) Content? content,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      EmbedContentRequestTaskType? taskType,
      @JsonKey(includeIfNull: false) String? model,
      @JsonKey(includeIfNull: false) String? title});

  $ContentCopyWith<$Res>? get content;
}

/// @nodoc
class _$EmbedContentRequestCopyWithImpl<$Res, $Val extends EmbedContentRequest>
    implements $EmbedContentRequestCopyWith<$Res> {
  _$EmbedContentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? taskType = freezed,
    Object? model = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      taskType: freezed == taskType
          ? _value.taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as EmbedContentRequestTaskType?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_value.content!, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmbedContentRequestImplCopyWith<$Res>
    implements $EmbedContentRequestCopyWith<$Res> {
  factory _$$EmbedContentRequestImplCopyWith(_$EmbedContentRequestImpl value,
          $Res Function(_$EmbedContentRequestImpl) then) =
      __$$EmbedContentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) Content? content,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      EmbedContentRequestTaskType? taskType,
      @JsonKey(includeIfNull: false) String? model,
      @JsonKey(includeIfNull: false) String? title});

  @override
  $ContentCopyWith<$Res>? get content;
}

/// @nodoc
class __$$EmbedContentRequestImplCopyWithImpl<$Res>
    extends _$EmbedContentRequestCopyWithImpl<$Res, _$EmbedContentRequestImpl>
    implements _$$EmbedContentRequestImplCopyWith<$Res> {
  __$$EmbedContentRequestImplCopyWithImpl(_$EmbedContentRequestImpl _value,
      $Res Function(_$EmbedContentRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? taskType = freezed,
    Object? model = freezed,
    Object? title = freezed,
  }) {
    return _then(_$EmbedContentRequestImpl(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      taskType: freezed == taskType
          ? _value.taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as EmbedContentRequestTaskType?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmbedContentRequestImpl extends _EmbedContentRequest {
  const _$EmbedContentRequestImpl(
      {@JsonKey(includeIfNull: false) this.content,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.taskType,
      @JsonKey(includeIfNull: false) this.model,
      @JsonKey(includeIfNull: false) this.title})
      : super._();

  factory _$EmbedContentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmbedContentRequestImplFromJson(json);

  /// Required. The content to embed. Only the `parts.text` fields will be counted.
  @override
  @JsonKey(includeIfNull: false)
  final Content? content;

  /// Optional. Optional task type for which the embeddings will be used. Can only be set for `models/embedding-001`.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final EmbedContentRequestTaskType? taskType;

  /// Required. The model's resource name. This serves as an ID for the Model to use. This name should match a model name returned by the `ListModels` method. Format: `models/{model}`
  @override
  @JsonKey(includeIfNull: false)
  final String? model;

  /// Optional. An optional title for the text. Only applicable when TaskType is `RETRIEVAL_DOCUMENT`.
  @override
  @JsonKey(includeIfNull: false)
  final String? title;

  @override
  String toString() {
    return 'EmbedContentRequest(content: $content, taskType: $taskType, model: $model, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmbedContentRequestImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.taskType, taskType) ||
                other.taskType == taskType) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, taskType, model, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmbedContentRequestImplCopyWith<_$EmbedContentRequestImpl> get copyWith =>
      __$$EmbedContentRequestImplCopyWithImpl<_$EmbedContentRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmbedContentRequestImplToJson(
      this,
    );
  }
}

abstract class _EmbedContentRequest extends EmbedContentRequest {
  const factory _EmbedContentRequest(
          {@JsonKey(includeIfNull: false) final Content? content,
          @JsonKey(
              includeIfNull: false,
              unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
          final EmbedContentRequestTaskType? taskType,
          @JsonKey(includeIfNull: false) final String? model,
          @JsonKey(includeIfNull: false) final String? title}) =
      _$EmbedContentRequestImpl;
  const _EmbedContentRequest._() : super._();

  factory _EmbedContentRequest.fromJson(Map<String, dynamic> json) =
      _$EmbedContentRequestImpl.fromJson;

  @override

  /// Required. The content to embed. Only the `parts.text` fields will be counted.
  @JsonKey(includeIfNull: false)
  Content? get content;
  @override

  /// Optional. Optional task type for which the embeddings will be used. Can only be set for `models/embedding-001`.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  EmbedContentRequestTaskType? get taskType;
  @override

  /// Required. The model's resource name. This serves as an ID for the Model to use. This name should match a model name returned by the `ListModels` method. Format: `models/{model}`
  @JsonKey(includeIfNull: false)
  String? get model;
  @override

  /// Optional. An optional title for the text. Only applicable when TaskType is `RETRIEVAL_DOCUMENT`.
  @JsonKey(includeIfNull: false)
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$EmbedContentRequestImplCopyWith<_$EmbedContentRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListModelsResponse _$ListModelsResponseFromJson(Map<String, dynamic> json) {
  return _ListModelsResponse.fromJson(json);
}

/// @nodoc
mixin _$ListModelsResponse {
  /// A token, which can be sent as `page_token` to retrieve the next page. If this field is omitted, there are no more pages.
  @JsonKey(includeIfNull: false)
  String? get nextPageToken => throw _privateConstructorUsedError;

  /// The returned Models.
  @JsonKey(includeIfNull: false)
  List<Model>? get models => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListModelsResponseCopyWith<ListModelsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListModelsResponseCopyWith<$Res> {
  factory $ListModelsResponseCopyWith(
          ListModelsResponse value, $Res Function(ListModelsResponse) then) =
      _$ListModelsResponseCopyWithImpl<$Res, ListModelsResponse>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? nextPageToken,
      @JsonKey(includeIfNull: false) List<Model>? models});
}

/// @nodoc
class _$ListModelsResponseCopyWithImpl<$Res, $Val extends ListModelsResponse>
    implements $ListModelsResponseCopyWith<$Res> {
  _$ListModelsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextPageToken = freezed,
    Object? models = freezed,
  }) {
    return _then(_value.copyWith(
      nextPageToken: freezed == nextPageToken
          ? _value.nextPageToken
          : nextPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      models: freezed == models
          ? _value.models
          : models // ignore: cast_nullable_to_non_nullable
              as List<Model>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListModelsResponseImplCopyWith<$Res>
    implements $ListModelsResponseCopyWith<$Res> {
  factory _$$ListModelsResponseImplCopyWith(_$ListModelsResponseImpl value,
          $Res Function(_$ListModelsResponseImpl) then) =
      __$$ListModelsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? nextPageToken,
      @JsonKey(includeIfNull: false) List<Model>? models});
}

/// @nodoc
class __$$ListModelsResponseImplCopyWithImpl<$Res>
    extends _$ListModelsResponseCopyWithImpl<$Res, _$ListModelsResponseImpl>
    implements _$$ListModelsResponseImplCopyWith<$Res> {
  __$$ListModelsResponseImplCopyWithImpl(_$ListModelsResponseImpl _value,
      $Res Function(_$ListModelsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextPageToken = freezed,
    Object? models = freezed,
  }) {
    return _then(_$ListModelsResponseImpl(
      nextPageToken: freezed == nextPageToken
          ? _value.nextPageToken
          : nextPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      models: freezed == models
          ? _value._models
          : models // ignore: cast_nullable_to_non_nullable
              as List<Model>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListModelsResponseImpl extends _ListModelsResponse {
  const _$ListModelsResponseImpl(
      {@JsonKey(includeIfNull: false) this.nextPageToken,
      @JsonKey(includeIfNull: false) final List<Model>? models})
      : _models = models,
        super._();

  factory _$ListModelsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListModelsResponseImplFromJson(json);

  /// A token, which can be sent as `page_token` to retrieve the next page. If this field is omitted, there are no more pages.
  @override
  @JsonKey(includeIfNull: false)
  final String? nextPageToken;

  /// The returned Models.
  final List<Model>? _models;

  /// The returned Models.
  @override
  @JsonKey(includeIfNull: false)
  List<Model>? get models {
    final value = _models;
    if (value == null) return null;
    if (_models is EqualUnmodifiableListView) return _models;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListModelsResponse(nextPageToken: $nextPageToken, models: $models)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListModelsResponseImpl &&
            (identical(other.nextPageToken, nextPageToken) ||
                other.nextPageToken == nextPageToken) &&
            const DeepCollectionEquality().equals(other._models, _models));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, nextPageToken, const DeepCollectionEquality().hash(_models));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListModelsResponseImplCopyWith<_$ListModelsResponseImpl> get copyWith =>
      __$$ListModelsResponseImplCopyWithImpl<_$ListModelsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListModelsResponseImplToJson(
      this,
    );
  }
}

abstract class _ListModelsResponse extends ListModelsResponse {
  const factory _ListModelsResponse(
          {@JsonKey(includeIfNull: false) final String? nextPageToken,
          @JsonKey(includeIfNull: false) final List<Model>? models}) =
      _$ListModelsResponseImpl;
  const _ListModelsResponse._() : super._();

  factory _ListModelsResponse.fromJson(Map<String, dynamic> json) =
      _$ListModelsResponseImpl.fromJson;

  @override

  /// A token, which can be sent as `page_token` to retrieve the next page. If this field is omitted, there are no more pages.
  @JsonKey(includeIfNull: false)
  String? get nextPageToken;
  @override

  /// The returned Models.
  @JsonKey(includeIfNull: false)
  List<Model>? get models;
  @override
  @JsonKey(ignore: true)
  _$$ListModelsResponseImplCopyWith<_$ListModelsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BatchEmbedContentsRequest _$BatchEmbedContentsRequestFromJson(
    Map<String, dynamic> json) {
  return _BatchEmbedContentsRequest.fromJson(json);
}

/// @nodoc
mixin _$BatchEmbedContentsRequest {
  /// Required. Embed requests for the batch. The model in each of these requests must match the model specified `BatchEmbedContentsRequest.model`.
  @JsonKey(includeIfNull: false)
  List<EmbedContentRequest>? get requests => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BatchEmbedContentsRequestCopyWith<BatchEmbedContentsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchEmbedContentsRequestCopyWith<$Res> {
  factory $BatchEmbedContentsRequestCopyWith(BatchEmbedContentsRequest value,
          $Res Function(BatchEmbedContentsRequest) then) =
      _$BatchEmbedContentsRequestCopyWithImpl<$Res, BatchEmbedContentsRequest>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<EmbedContentRequest>? requests});
}

/// @nodoc
class _$BatchEmbedContentsRequestCopyWithImpl<$Res,
        $Val extends BatchEmbedContentsRequest>
    implements $BatchEmbedContentsRequestCopyWith<$Res> {
  _$BatchEmbedContentsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requests = freezed,
  }) {
    return _then(_value.copyWith(
      requests: freezed == requests
          ? _value.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<EmbedContentRequest>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchEmbedContentsRequestImplCopyWith<$Res>
    implements $BatchEmbedContentsRequestCopyWith<$Res> {
  factory _$$BatchEmbedContentsRequestImplCopyWith(
          _$BatchEmbedContentsRequestImpl value,
          $Res Function(_$BatchEmbedContentsRequestImpl) then) =
      __$$BatchEmbedContentsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<EmbedContentRequest>? requests});
}

/// @nodoc
class __$$BatchEmbedContentsRequestImplCopyWithImpl<$Res>
    extends _$BatchEmbedContentsRequestCopyWithImpl<$Res,
        _$BatchEmbedContentsRequestImpl>
    implements _$$BatchEmbedContentsRequestImplCopyWith<$Res> {
  __$$BatchEmbedContentsRequestImplCopyWithImpl(
      _$BatchEmbedContentsRequestImpl _value,
      $Res Function(_$BatchEmbedContentsRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requests = freezed,
  }) {
    return _then(_$BatchEmbedContentsRequestImpl(
      requests: freezed == requests
          ? _value._requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<EmbedContentRequest>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BatchEmbedContentsRequestImpl extends _BatchEmbedContentsRequest {
  const _$BatchEmbedContentsRequestImpl(
      {@JsonKey(includeIfNull: false)
      final List<EmbedContentRequest>? requests})
      : _requests = requests,
        super._();

  factory _$BatchEmbedContentsRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchEmbedContentsRequestImplFromJson(json);

  /// Required. Embed requests for the batch. The model in each of these requests must match the model specified `BatchEmbedContentsRequest.model`.
  final List<EmbedContentRequest>? _requests;

  /// Required. Embed requests for the batch. The model in each of these requests must match the model specified `BatchEmbedContentsRequest.model`.
  @override
  @JsonKey(includeIfNull: false)
  List<EmbedContentRequest>? get requests {
    final value = _requests;
    if (value == null) return null;
    if (_requests is EqualUnmodifiableListView) return _requests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BatchEmbedContentsRequest(requests: $requests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchEmbedContentsRequestImpl &&
            const DeepCollectionEquality().equals(other._requests, _requests));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_requests));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchEmbedContentsRequestImplCopyWith<_$BatchEmbedContentsRequestImpl>
      get copyWith => __$$BatchEmbedContentsRequestImplCopyWithImpl<
          _$BatchEmbedContentsRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchEmbedContentsRequestImplToJson(
      this,
    );
  }
}

abstract class _BatchEmbedContentsRequest extends BatchEmbedContentsRequest {
  const factory _BatchEmbedContentsRequest(
          {@JsonKey(includeIfNull: false)
          final List<EmbedContentRequest>? requests}) =
      _$BatchEmbedContentsRequestImpl;
  const _BatchEmbedContentsRequest._() : super._();

  factory _BatchEmbedContentsRequest.fromJson(Map<String, dynamic> json) =
      _$BatchEmbedContentsRequestImpl.fromJson;

  @override

  /// Required. Embed requests for the batch. The model in each of these requests must match the model specified `BatchEmbedContentsRequest.model`.
  @JsonKey(includeIfNull: false)
  List<EmbedContentRequest>? get requests;
  @override
  @JsonKey(ignore: true)
  _$$BatchEmbedContentsRequestImplCopyWith<_$BatchEmbedContentsRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ContentEmbedding _$ContentEmbeddingFromJson(Map<String, dynamic> json) {
  return _ContentEmbedding.fromJson(json);
}

/// @nodoc
mixin _$ContentEmbedding {
  /// The embedding values.
  @JsonKey(includeIfNull: false)
  List<double>? get values => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentEmbeddingCopyWith<ContentEmbedding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentEmbeddingCopyWith<$Res> {
  factory $ContentEmbeddingCopyWith(
          ContentEmbedding value, $Res Function(ContentEmbedding) then) =
      _$ContentEmbeddingCopyWithImpl<$Res, ContentEmbedding>;
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<double>? values});
}

/// @nodoc
class _$ContentEmbeddingCopyWithImpl<$Res, $Val extends ContentEmbedding>
    implements $ContentEmbeddingCopyWith<$Res> {
  _$ContentEmbeddingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = freezed,
  }) {
    return _then(_value.copyWith(
      values: freezed == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentEmbeddingImplCopyWith<$Res>
    implements $ContentEmbeddingCopyWith<$Res> {
  factory _$$ContentEmbeddingImplCopyWith(_$ContentEmbeddingImpl value,
          $Res Function(_$ContentEmbeddingImpl) then) =
      __$$ContentEmbeddingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<double>? values});
}

/// @nodoc
class __$$ContentEmbeddingImplCopyWithImpl<$Res>
    extends _$ContentEmbeddingCopyWithImpl<$Res, _$ContentEmbeddingImpl>
    implements _$$ContentEmbeddingImplCopyWith<$Res> {
  __$$ContentEmbeddingImplCopyWithImpl(_$ContentEmbeddingImpl _value,
      $Res Function(_$ContentEmbeddingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = freezed,
  }) {
    return _then(_$ContentEmbeddingImpl(
      values: freezed == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentEmbeddingImpl extends _ContentEmbedding {
  const _$ContentEmbeddingImpl(
      {@JsonKey(includeIfNull: false) final List<double>? values})
      : _values = values,
        super._();

  factory _$ContentEmbeddingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentEmbeddingImplFromJson(json);

  /// The embedding values.
  final List<double>? _values;

  /// The embedding values.
  @override
  @JsonKey(includeIfNull: false)
  List<double>? get values {
    final value = _values;
    if (value == null) return null;
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ContentEmbedding(values: $values)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentEmbeddingImpl &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentEmbeddingImplCopyWith<_$ContentEmbeddingImpl> get copyWith =>
      __$$ContentEmbeddingImplCopyWithImpl<_$ContentEmbeddingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentEmbeddingImplToJson(
      this,
    );
  }
}

abstract class _ContentEmbedding extends ContentEmbedding {
  const factory _ContentEmbedding(
          {@JsonKey(includeIfNull: false) final List<double>? values}) =
      _$ContentEmbeddingImpl;
  const _ContentEmbedding._() : super._();

  factory _ContentEmbedding.fromJson(Map<String, dynamic> json) =
      _$ContentEmbeddingImpl.fromJson;

  @override

  /// The embedding values.
  @JsonKey(includeIfNull: false)
  List<double>? get values;
  @override
  @JsonKey(ignore: true)
  _$$ContentEmbeddingImplCopyWith<_$ContentEmbeddingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PromptFeedback _$PromptFeedbackFromJson(Map<String, dynamic> json) {
  return _PromptFeedback.fromJson(json);
}

/// @nodoc
mixin _$PromptFeedback {
  /// Ratings for safety of the prompt. There is at most one rating per category.
  @JsonKey(includeIfNull: false)
  List<SafetyRating>? get safetyRatings => throw _privateConstructorUsedError;

  /// Optional. If set, the prompt was blocked and no candidates are returned. Rephrase your prompt.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  PromptFeedbackBlockReason? get blockReason =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromptFeedbackCopyWith<PromptFeedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptFeedbackCopyWith<$Res> {
  factory $PromptFeedbackCopyWith(
          PromptFeedback value, $Res Function(PromptFeedback) then) =
      _$PromptFeedbackCopyWithImpl<$Res, PromptFeedback>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<SafetyRating>? safetyRatings,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      PromptFeedbackBlockReason? blockReason});
}

/// @nodoc
class _$PromptFeedbackCopyWithImpl<$Res, $Val extends PromptFeedback>
    implements $PromptFeedbackCopyWith<$Res> {
  _$PromptFeedbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? safetyRatings = freezed,
    Object? blockReason = freezed,
  }) {
    return _then(_value.copyWith(
      safetyRatings: freezed == safetyRatings
          ? _value.safetyRatings
          : safetyRatings // ignore: cast_nullable_to_non_nullable
              as List<SafetyRating>?,
      blockReason: freezed == blockReason
          ? _value.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as PromptFeedbackBlockReason?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromptFeedbackImplCopyWith<$Res>
    implements $PromptFeedbackCopyWith<$Res> {
  factory _$$PromptFeedbackImplCopyWith(_$PromptFeedbackImpl value,
          $Res Function(_$PromptFeedbackImpl) then) =
      __$$PromptFeedbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<SafetyRating>? safetyRatings,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      PromptFeedbackBlockReason? blockReason});
}

/// @nodoc
class __$$PromptFeedbackImplCopyWithImpl<$Res>
    extends _$PromptFeedbackCopyWithImpl<$Res, _$PromptFeedbackImpl>
    implements _$$PromptFeedbackImplCopyWith<$Res> {
  __$$PromptFeedbackImplCopyWithImpl(
      _$PromptFeedbackImpl _value, $Res Function(_$PromptFeedbackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? safetyRatings = freezed,
    Object? blockReason = freezed,
  }) {
    return _then(_$PromptFeedbackImpl(
      safetyRatings: freezed == safetyRatings
          ? _value._safetyRatings
          : safetyRatings // ignore: cast_nullable_to_non_nullable
              as List<SafetyRating>?,
      blockReason: freezed == blockReason
          ? _value.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as PromptFeedbackBlockReason?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromptFeedbackImpl extends _PromptFeedback {
  const _$PromptFeedbackImpl(
      {@JsonKey(includeIfNull: false) final List<SafetyRating>? safetyRatings,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.blockReason})
      : _safetyRatings = safetyRatings,
        super._();

  factory _$PromptFeedbackImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromptFeedbackImplFromJson(json);

  /// Ratings for safety of the prompt. There is at most one rating per category.
  final List<SafetyRating>? _safetyRatings;

  /// Ratings for safety of the prompt. There is at most one rating per category.
  @override
  @JsonKey(includeIfNull: false)
  List<SafetyRating>? get safetyRatings {
    final value = _safetyRatings;
    if (value == null) return null;
    if (_safetyRatings is EqualUnmodifiableListView) return _safetyRatings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional. If set, the prompt was blocked and no candidates are returned. Rephrase your prompt.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final PromptFeedbackBlockReason? blockReason;

  @override
  String toString() {
    return 'PromptFeedback(safetyRatings: $safetyRatings, blockReason: $blockReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromptFeedbackImpl &&
            const DeepCollectionEquality()
                .equals(other._safetyRatings, _safetyRatings) &&
            (identical(other.blockReason, blockReason) ||
                other.blockReason == blockReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_safetyRatings), blockReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromptFeedbackImplCopyWith<_$PromptFeedbackImpl> get copyWith =>
      __$$PromptFeedbackImplCopyWithImpl<_$PromptFeedbackImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromptFeedbackImplToJson(
      this,
    );
  }
}

abstract class _PromptFeedback extends PromptFeedback {
  const factory _PromptFeedback(
      {@JsonKey(includeIfNull: false) final List<SafetyRating>? safetyRatings,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      final PromptFeedbackBlockReason? blockReason}) = _$PromptFeedbackImpl;
  const _PromptFeedback._() : super._();

  factory _PromptFeedback.fromJson(Map<String, dynamic> json) =
      _$PromptFeedbackImpl.fromJson;

  @override

  /// Ratings for safety of the prompt. There is at most one rating per category.
  @JsonKey(includeIfNull: false)
  List<SafetyRating>? get safetyRatings;
  @override

  /// Optional. If set, the prompt was blocked and no candidates are returned. Rephrase your prompt.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  PromptFeedbackBlockReason? get blockReason;
  @override
  @JsonKey(ignore: true)
  _$$PromptFeedbackImplCopyWith<_$PromptFeedbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Operation _$OperationFromJson(Map<String, dynamic> json) {
  return _Operation.fromJson(json);
}

/// @nodoc
mixin _$Operation {
  /// The server-assigned name, which is only unique within the same service that originally returns it. If you use the default HTTP mapping, the `name` should be a resource name ending with `operations/{unique_id}`.
  @JsonKey(includeIfNull: false)
  String? get name => throw _privateConstructorUsedError;

  /// The normal, successful response of the operation. If the original method returns no data on success, such as `Delete`, the response is `google.protobuf.Empty`. If the original method is standard `Get`/`Create`/`Update`, the response should be the resource. For other methods, the response should have the type `XxxResponse`, where `Xxx` is the original method name. For example, if the original method name is `TakeSnapshot()`, the inferred response type is `TakeSnapshotResponse`.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get response => throw _privateConstructorUsedError;

  /// If the value is `false`, it means the operation is still in progress. If `true`, the operation is completed, and either `error` or `response` is available.
  @JsonKey(includeIfNull: false)
  bool? get done => throw _privateConstructorUsedError;

  /// Service-specific metadata associated with the operation. It typically contains progress information and common metadata such as create time. Some services might not provide such metadata. Any method that returns a long-running operation should document the metadata type, if any.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// The error result of the operation in case of failure or cancellation.
  @JsonKey(includeIfNull: false)
  Status? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OperationCopyWith<Operation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationCopyWith<$Res> {
  factory $OperationCopyWith(Operation value, $Res Function(Operation) then) =
      _$OperationCopyWithImpl<$Res, Operation>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? name,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? response,
      @JsonKey(includeIfNull: false) bool? done,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
      @JsonKey(includeIfNull: false) Status? error});

  $StatusCopyWith<$Res>? get error;
}

/// @nodoc
class _$OperationCopyWithImpl<$Res, $Val extends Operation>
    implements $OperationCopyWith<$Res> {
  _$OperationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? response = freezed,
    Object? done = freezed,
    Object? metadata = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      done: freezed == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Status?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $StatusCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OperationImplCopyWith<$Res>
    implements $OperationCopyWith<$Res> {
  factory _$$OperationImplCopyWith(
          _$OperationImpl value, $Res Function(_$OperationImpl) then) =
      __$$OperationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? name,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? response,
      @JsonKey(includeIfNull: false) bool? done,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
      @JsonKey(includeIfNull: false) Status? error});

  @override
  $StatusCopyWith<$Res>? get error;
}

/// @nodoc
class __$$OperationImplCopyWithImpl<$Res>
    extends _$OperationCopyWithImpl<$Res, _$OperationImpl>
    implements _$$OperationImplCopyWith<$Res> {
  __$$OperationImplCopyWithImpl(
      _$OperationImpl _value, $Res Function(_$OperationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? response = freezed,
    Object? done = freezed,
    Object? metadata = freezed,
    Object? error = freezed,
  }) {
    return _then(_$OperationImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      done: freezed == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Status?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OperationImpl extends _Operation {
  const _$OperationImpl(
      {@JsonKey(includeIfNull: false) this.name,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? response,
      @JsonKey(includeIfNull: false) this.done,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? metadata,
      @JsonKey(includeIfNull: false) this.error})
      : _response = response,
        _metadata = metadata,
        super._();

  factory _$OperationImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperationImplFromJson(json);

  /// The server-assigned name, which is only unique within the same service that originally returns it. If you use the default HTTP mapping, the `name` should be a resource name ending with `operations/{unique_id}`.
  @override
  @JsonKey(includeIfNull: false)
  final String? name;

  /// The normal, successful response of the operation. If the original method returns no data on success, such as `Delete`, the response is `google.protobuf.Empty`. If the original method is standard `Get`/`Create`/`Update`, the response should be the resource. For other methods, the response should have the type `XxxResponse`, where `Xxx` is the original method name. For example, if the original method name is `TakeSnapshot()`, the inferred response type is `TakeSnapshotResponse`.
  final Map<String, dynamic>? _response;

  /// The normal, successful response of the operation. If the original method returns no data on success, such as `Delete`, the response is `google.protobuf.Empty`. If the original method is standard `Get`/`Create`/`Update`, the response should be the resource. For other methods, the response should have the type `XxxResponse`, where `Xxx` is the original method name. For example, if the original method name is `TakeSnapshot()`, the inferred response type is `TakeSnapshotResponse`.
  @override
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get response {
    final value = _response;
    if (value == null) return null;
    if (_response is EqualUnmodifiableMapView) return _response;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// If the value is `false`, it means the operation is still in progress. If `true`, the operation is completed, and either `error` or `response` is available.
  @override
  @JsonKey(includeIfNull: false)
  final bool? done;

  /// Service-specific metadata associated with the operation. It typically contains progress information and common metadata such as create time. Some services might not provide such metadata. Any method that returns a long-running operation should document the metadata type, if any.
  final Map<String, dynamic>? _metadata;

  /// Service-specific metadata associated with the operation. It typically contains progress information and common metadata such as create time. Some services might not provide such metadata. Any method that returns a long-running operation should document the metadata type, if any.
  @override
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// The error result of the operation in case of failure or cancellation.
  @override
  @JsonKey(includeIfNull: false)
  final Status? error;

  @override
  String toString() {
    return 'Operation(name: $name, response: $response, done: $done, metadata: $metadata, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._response, _response) &&
            (identical(other.done, done) || other.done == done) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_response),
      done,
      const DeepCollectionEquality().hash(_metadata),
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationImplCopyWith<_$OperationImpl> get copyWith =>
      __$$OperationImplCopyWithImpl<_$OperationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperationImplToJson(
      this,
    );
  }
}

abstract class _Operation extends Operation {
  const factory _Operation(
      {@JsonKey(includeIfNull: false) final String? name,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? response,
      @JsonKey(includeIfNull: false) final bool? done,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? metadata,
      @JsonKey(includeIfNull: false) final Status? error}) = _$OperationImpl;
  const _Operation._() : super._();

  factory _Operation.fromJson(Map<String, dynamic> json) =
      _$OperationImpl.fromJson;

  @override

  /// The server-assigned name, which is only unique within the same service that originally returns it. If you use the default HTTP mapping, the `name` should be a resource name ending with `operations/{unique_id}`.
  @JsonKey(includeIfNull: false)
  String? get name;
  @override

  /// The normal, successful response of the operation. If the original method returns no data on success, such as `Delete`, the response is `google.protobuf.Empty`. If the original method is standard `Get`/`Create`/`Update`, the response should be the resource. For other methods, the response should have the type `XxxResponse`, where `Xxx` is the original method name. For example, if the original method name is `TakeSnapshot()`, the inferred response type is `TakeSnapshotResponse`.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get response;
  @override

  /// If the value is `false`, it means the operation is still in progress. If `true`, the operation is completed, and either `error` or `response` is available.
  @JsonKey(includeIfNull: false)
  bool? get done;
  @override

  /// Service-specific metadata associated with the operation. It typically contains progress information and common metadata such as create time. Some services might not provide such metadata. Any method that returns a long-running operation should document the metadata type, if any.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata;
  @override

  /// The error result of the operation in case of failure or cancellation.
  @JsonKey(includeIfNull: false)
  Status? get error;
  @override
  @JsonKey(ignore: true)
  _$$OperationImplCopyWith<_$OperationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GenerateContentResponse _$GenerateContentResponseFromJson(
    Map<String, dynamic> json) {
  return _GenerateContentResponse.fromJson(json);
}

/// @nodoc
mixin _$GenerateContentResponse {
  /// Returns the prompt's feedback related to the content filters.
  @JsonKey(includeIfNull: false)
  PromptFeedback? get promptFeedback => throw _privateConstructorUsedError;

  /// Candidate responses from the model.
  @JsonKey(includeIfNull: false)
  List<Candidate>? get candidates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateContentResponseCopyWith<GenerateContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateContentResponseCopyWith<$Res> {
  factory $GenerateContentResponseCopyWith(GenerateContentResponse value,
          $Res Function(GenerateContentResponse) then) =
      _$GenerateContentResponseCopyWithImpl<$Res, GenerateContentResponse>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) PromptFeedback? promptFeedback,
      @JsonKey(includeIfNull: false) List<Candidate>? candidates});

  $PromptFeedbackCopyWith<$Res>? get promptFeedback;
}

/// @nodoc
class _$GenerateContentResponseCopyWithImpl<$Res,
        $Val extends GenerateContentResponse>
    implements $GenerateContentResponseCopyWith<$Res> {
  _$GenerateContentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptFeedback = freezed,
    Object? candidates = freezed,
  }) {
    return _then(_value.copyWith(
      promptFeedback: freezed == promptFeedback
          ? _value.promptFeedback
          : promptFeedback // ignore: cast_nullable_to_non_nullable
              as PromptFeedback?,
      candidates: freezed == candidates
          ? _value.candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<Candidate>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PromptFeedbackCopyWith<$Res>? get promptFeedback {
    if (_value.promptFeedback == null) {
      return null;
    }

    return $PromptFeedbackCopyWith<$Res>(_value.promptFeedback!, (value) {
      return _then(_value.copyWith(promptFeedback: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GenerateContentResponseImplCopyWith<$Res>
    implements $GenerateContentResponseCopyWith<$Res> {
  factory _$$GenerateContentResponseImplCopyWith(
          _$GenerateContentResponseImpl value,
          $Res Function(_$GenerateContentResponseImpl) then) =
      __$$GenerateContentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) PromptFeedback? promptFeedback,
      @JsonKey(includeIfNull: false) List<Candidate>? candidates});

  @override
  $PromptFeedbackCopyWith<$Res>? get promptFeedback;
}

/// @nodoc
class __$$GenerateContentResponseImplCopyWithImpl<$Res>
    extends _$GenerateContentResponseCopyWithImpl<$Res,
        _$GenerateContentResponseImpl>
    implements _$$GenerateContentResponseImplCopyWith<$Res> {
  __$$GenerateContentResponseImplCopyWithImpl(
      _$GenerateContentResponseImpl _value,
      $Res Function(_$GenerateContentResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptFeedback = freezed,
    Object? candidates = freezed,
  }) {
    return _then(_$GenerateContentResponseImpl(
      promptFeedback: freezed == promptFeedback
          ? _value.promptFeedback
          : promptFeedback // ignore: cast_nullable_to_non_nullable
              as PromptFeedback?,
      candidates: freezed == candidates
          ? _value._candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<Candidate>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateContentResponseImpl extends _GenerateContentResponse {
  const _$GenerateContentResponseImpl(
      {@JsonKey(includeIfNull: false) this.promptFeedback,
      @JsonKey(includeIfNull: false) final List<Candidate>? candidates})
      : _candidates = candidates,
        super._();

  factory _$GenerateContentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateContentResponseImplFromJson(json);

  /// Returns the prompt's feedback related to the content filters.
  @override
  @JsonKey(includeIfNull: false)
  final PromptFeedback? promptFeedback;

  /// Candidate responses from the model.
  final List<Candidate>? _candidates;

  /// Candidate responses from the model.
  @override
  @JsonKey(includeIfNull: false)
  List<Candidate>? get candidates {
    final value = _candidates;
    if (value == null) return null;
    if (_candidates is EqualUnmodifiableListView) return _candidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GenerateContentResponse(promptFeedback: $promptFeedback, candidates: $candidates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateContentResponseImpl &&
            (identical(other.promptFeedback, promptFeedback) ||
                other.promptFeedback == promptFeedback) &&
            const DeepCollectionEquality()
                .equals(other._candidates, _candidates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, promptFeedback,
      const DeepCollectionEquality().hash(_candidates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateContentResponseImplCopyWith<_$GenerateContentResponseImpl>
      get copyWith => __$$GenerateContentResponseImplCopyWithImpl<
          _$GenerateContentResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateContentResponseImplToJson(
      this,
    );
  }
}

abstract class _GenerateContentResponse extends GenerateContentResponse {
  const factory _GenerateContentResponse(
          {@JsonKey(includeIfNull: false) final PromptFeedback? promptFeedback,
          @JsonKey(includeIfNull: false) final List<Candidate>? candidates}) =
      _$GenerateContentResponseImpl;
  const _GenerateContentResponse._() : super._();

  factory _GenerateContentResponse.fromJson(Map<String, dynamic> json) =
      _$GenerateContentResponseImpl.fromJson;

  @override

  /// Returns the prompt's feedback related to the content filters.
  @JsonKey(includeIfNull: false)
  PromptFeedback? get promptFeedback;
  @override

  /// Candidate responses from the model.
  @JsonKey(includeIfNull: false)
  List<Candidate>? get candidates;
  @override
  @JsonKey(ignore: true)
  _$$GenerateContentResponseImplCopyWith<_$GenerateContentResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SafetySetting _$SafetySettingFromJson(Map<String, dynamic> json) {
  return _SafetySetting.fromJson(json);
}

/// @nodoc
mixin _$SafetySetting {
  /// Required. The category for this setting.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  SafetySettingCategory? get category => throw _privateConstructorUsedError;

  /// Required. Controls the probability threshold at which harm is blocked.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  SafetySettingThreshold? get threshold => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SafetySettingCopyWith<SafetySetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SafetySettingCopyWith<$Res> {
  factory $SafetySettingCopyWith(
          SafetySetting value, $Res Function(SafetySetting) then) =
      _$SafetySettingCopyWithImpl<$Res, SafetySetting>;
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      SafetySettingCategory? category,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      SafetySettingThreshold? threshold});
}

/// @nodoc
class _$SafetySettingCopyWithImpl<$Res, $Val extends SafetySetting>
    implements $SafetySettingCopyWith<$Res> {
  _$SafetySettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? threshold = freezed,
  }) {
    return _then(_value.copyWith(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as SafetySettingCategory?,
      threshold: freezed == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as SafetySettingThreshold?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SafetySettingImplCopyWith<$Res>
    implements $SafetySettingCopyWith<$Res> {
  factory _$$SafetySettingImplCopyWith(
          _$SafetySettingImpl value, $Res Function(_$SafetySettingImpl) then) =
      __$$SafetySettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      SafetySettingCategory? category,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      SafetySettingThreshold? threshold});
}

/// @nodoc
class __$$SafetySettingImplCopyWithImpl<$Res>
    extends _$SafetySettingCopyWithImpl<$Res, _$SafetySettingImpl>
    implements _$$SafetySettingImplCopyWith<$Res> {
  __$$SafetySettingImplCopyWithImpl(
      _$SafetySettingImpl _value, $Res Function(_$SafetySettingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? threshold = freezed,
  }) {
    return _then(_$SafetySettingImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as SafetySettingCategory?,
      threshold: freezed == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as SafetySettingThreshold?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SafetySettingImpl extends _SafetySetting {
  const _$SafetySettingImpl(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.category,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.threshold})
      : super._();

  factory _$SafetySettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$SafetySettingImplFromJson(json);

  /// Required. The category for this setting.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final SafetySettingCategory? category;

  /// Required. Controls the probability threshold at which harm is blocked.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final SafetySettingThreshold? threshold;

  @override
  String toString() {
    return 'SafetySetting(category: $category, threshold: $threshold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SafetySettingImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, threshold);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SafetySettingImplCopyWith<_$SafetySettingImpl> get copyWith =>
      __$$SafetySettingImplCopyWithImpl<_$SafetySettingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SafetySettingImplToJson(
      this,
    );
  }
}

abstract class _SafetySetting extends SafetySetting {
  const factory _SafetySetting(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      final SafetySettingCategory? category,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      final SafetySettingThreshold? threshold}) = _$SafetySettingImpl;
  const _SafetySetting._() : super._();

  factory _SafetySetting.fromJson(Map<String, dynamic> json) =
      _$SafetySettingImpl.fromJson;

  @override

  /// Required. The category for this setting.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  SafetySettingCategory? get category;
  @override

  /// Required. Controls the probability threshold at which harm is blocked.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  SafetySettingThreshold? get threshold;
  @override
  @JsonKey(ignore: true)
  _$$SafetySettingImplCopyWith<_$SafetySettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Candidate _$CandidateFromJson(Map<String, dynamic> json) {
  return _Candidate.fromJson(json);
}

/// @nodoc
mixin _$Candidate {
  /// Output only. Generated content returned from the model.
  @JsonKey(includeIfNull: false)
  Content? get content => throw _privateConstructorUsedError;

  /// Optional. Output only. The reason why the model stopped generating tokens. If empty, the model has not stopped generating the tokens.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  CandidateFinishReason? get finishReason => throw _privateConstructorUsedError;

  /// Output only. Citation information for model-generated candidate. This field may be populated with recitation information for any text included in the `content`. These are passages that are "recited" from copyrighted material in the foundational LLM's training data.
  @JsonKey(includeIfNull: false)
  CitationMetadata? get citationMetadata => throw _privateConstructorUsedError;

  /// Output only. Index of the candidate in the list of candidates.
  @JsonKey(includeIfNull: false)
  int? get index => throw _privateConstructorUsedError;

  /// Output only. Token count for this candidate.
  @JsonKey(includeIfNull: false)
  int? get tokenCount => throw _privateConstructorUsedError;

  /// List of ratings for the safety of a response candidate. There is at most one rating per category.
  @JsonKey(includeIfNull: false)
  List<SafetyRating>? get safetyRatings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CandidateCopyWith<Candidate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateCopyWith<$Res> {
  factory $CandidateCopyWith(Candidate value, $Res Function(Candidate) then) =
      _$CandidateCopyWithImpl<$Res, Candidate>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) Content? content,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      CandidateFinishReason? finishReason,
      @JsonKey(includeIfNull: false) CitationMetadata? citationMetadata,
      @JsonKey(includeIfNull: false) int? index,
      @JsonKey(includeIfNull: false) int? tokenCount,
      @JsonKey(includeIfNull: false) List<SafetyRating>? safetyRatings});

  $ContentCopyWith<$Res>? get content;
  $CitationMetadataCopyWith<$Res>? get citationMetadata;
}

/// @nodoc
class _$CandidateCopyWithImpl<$Res, $Val extends Candidate>
    implements $CandidateCopyWith<$Res> {
  _$CandidateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? finishReason = freezed,
    Object? citationMetadata = freezed,
    Object? index = freezed,
    Object? tokenCount = freezed,
    Object? safetyRatings = freezed,
  }) {
    return _then(_value.copyWith(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      finishReason: freezed == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as CandidateFinishReason?,
      citationMetadata: freezed == citationMetadata
          ? _value.citationMetadata
          : citationMetadata // ignore: cast_nullable_to_non_nullable
              as CitationMetadata?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenCount: freezed == tokenCount
          ? _value.tokenCount
          : tokenCount // ignore: cast_nullable_to_non_nullable
              as int?,
      safetyRatings: freezed == safetyRatings
          ? _value.safetyRatings
          : safetyRatings // ignore: cast_nullable_to_non_nullable
              as List<SafetyRating>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_value.content!, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CitationMetadataCopyWith<$Res>? get citationMetadata {
    if (_value.citationMetadata == null) {
      return null;
    }

    return $CitationMetadataCopyWith<$Res>(_value.citationMetadata!, (value) {
      return _then(_value.copyWith(citationMetadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CandidateImplCopyWith<$Res>
    implements $CandidateCopyWith<$Res> {
  factory _$$CandidateImplCopyWith(
          _$CandidateImpl value, $Res Function(_$CandidateImpl) then) =
      __$$CandidateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) Content? content,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      CandidateFinishReason? finishReason,
      @JsonKey(includeIfNull: false) CitationMetadata? citationMetadata,
      @JsonKey(includeIfNull: false) int? index,
      @JsonKey(includeIfNull: false) int? tokenCount,
      @JsonKey(includeIfNull: false) List<SafetyRating>? safetyRatings});

  @override
  $ContentCopyWith<$Res>? get content;
  @override
  $CitationMetadataCopyWith<$Res>? get citationMetadata;
}

/// @nodoc
class __$$CandidateImplCopyWithImpl<$Res>
    extends _$CandidateCopyWithImpl<$Res, _$CandidateImpl>
    implements _$$CandidateImplCopyWith<$Res> {
  __$$CandidateImplCopyWithImpl(
      _$CandidateImpl _value, $Res Function(_$CandidateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? finishReason = freezed,
    Object? citationMetadata = freezed,
    Object? index = freezed,
    Object? tokenCount = freezed,
    Object? safetyRatings = freezed,
  }) {
    return _then(_$CandidateImpl(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      finishReason: freezed == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as CandidateFinishReason?,
      citationMetadata: freezed == citationMetadata
          ? _value.citationMetadata
          : citationMetadata // ignore: cast_nullable_to_non_nullable
              as CitationMetadata?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenCount: freezed == tokenCount
          ? _value.tokenCount
          : tokenCount // ignore: cast_nullable_to_non_nullable
              as int?,
      safetyRatings: freezed == safetyRatings
          ? _value._safetyRatings
          : safetyRatings // ignore: cast_nullable_to_non_nullable
              as List<SafetyRating>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CandidateImpl extends _Candidate {
  const _$CandidateImpl(
      {@JsonKey(includeIfNull: false) this.content,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.finishReason,
      @JsonKey(includeIfNull: false) this.citationMetadata,
      @JsonKey(includeIfNull: false) this.index,
      @JsonKey(includeIfNull: false) this.tokenCount,
      @JsonKey(includeIfNull: false) final List<SafetyRating>? safetyRatings})
      : _safetyRatings = safetyRatings,
        super._();

  factory _$CandidateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CandidateImplFromJson(json);

  /// Output only. Generated content returned from the model.
  @override
  @JsonKey(includeIfNull: false)
  final Content? content;

  /// Optional. Output only. The reason why the model stopped generating tokens. If empty, the model has not stopped generating the tokens.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final CandidateFinishReason? finishReason;

  /// Output only. Citation information for model-generated candidate. This field may be populated with recitation information for any text included in the `content`. These are passages that are "recited" from copyrighted material in the foundational LLM's training data.
  @override
  @JsonKey(includeIfNull: false)
  final CitationMetadata? citationMetadata;

  /// Output only. Index of the candidate in the list of candidates.
  @override
  @JsonKey(includeIfNull: false)
  final int? index;

  /// Output only. Token count for this candidate.
  @override
  @JsonKey(includeIfNull: false)
  final int? tokenCount;

  /// List of ratings for the safety of a response candidate. There is at most one rating per category.
  final List<SafetyRating>? _safetyRatings;

  /// List of ratings for the safety of a response candidate. There is at most one rating per category.
  @override
  @JsonKey(includeIfNull: false)
  List<SafetyRating>? get safetyRatings {
    final value = _safetyRatings;
    if (value == null) return null;
    if (_safetyRatings is EqualUnmodifiableListView) return _safetyRatings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Candidate(content: $content, finishReason: $finishReason, citationMetadata: $citationMetadata, index: $index, tokenCount: $tokenCount, safetyRatings: $safetyRatings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.finishReason, finishReason) ||
                other.finishReason == finishReason) &&
            (identical(other.citationMetadata, citationMetadata) ||
                other.citationMetadata == citationMetadata) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.tokenCount, tokenCount) ||
                other.tokenCount == tokenCount) &&
            const DeepCollectionEquality()
                .equals(other._safetyRatings, _safetyRatings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      finishReason,
      citationMetadata,
      index,
      tokenCount,
      const DeepCollectionEquality().hash(_safetyRatings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CandidateImplCopyWith<_$CandidateImpl> get copyWith =>
      __$$CandidateImplCopyWithImpl<_$CandidateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CandidateImplToJson(
      this,
    );
  }
}

abstract class _Candidate extends Candidate {
  const factory _Candidate(
      {@JsonKey(includeIfNull: false) final Content? content,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      final CandidateFinishReason? finishReason,
      @JsonKey(includeIfNull: false) final CitationMetadata? citationMetadata,
      @JsonKey(includeIfNull: false) final int? index,
      @JsonKey(includeIfNull: false) final int? tokenCount,
      @JsonKey(includeIfNull: false)
      final List<SafetyRating>? safetyRatings}) = _$CandidateImpl;
  const _Candidate._() : super._();

  factory _Candidate.fromJson(Map<String, dynamic> json) =
      _$CandidateImpl.fromJson;

  @override

  /// Output only. Generated content returned from the model.
  @JsonKey(includeIfNull: false)
  Content? get content;
  @override

  /// Optional. Output only. The reason why the model stopped generating tokens. If empty, the model has not stopped generating the tokens.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  CandidateFinishReason? get finishReason;
  @override

  /// Output only. Citation information for model-generated candidate. This field may be populated with recitation information for any text included in the `content`. These are passages that are "recited" from copyrighted material in the foundational LLM's training data.
  @JsonKey(includeIfNull: false)
  CitationMetadata? get citationMetadata;
  @override

  /// Output only. Index of the candidate in the list of candidates.
  @JsonKey(includeIfNull: false)
  int? get index;
  @override

  /// Output only. Token count for this candidate.
  @JsonKey(includeIfNull: false)
  int? get tokenCount;
  @override

  /// List of ratings for the safety of a response candidate. There is at most one rating per category.
  @JsonKey(includeIfNull: false)
  List<SafetyRating>? get safetyRatings;
  @override
  @JsonKey(ignore: true)
  _$$CandidateImplCopyWith<_$CandidateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CountTokensResponse _$CountTokensResponseFromJson(Map<String, dynamic> json) {
  return _CountTokensResponse.fromJson(json);
}

/// @nodoc
mixin _$CountTokensResponse {
  /// The number of tokens that the `model` tokenizes the `prompt` into. Always non-negative.
  @JsonKey(includeIfNull: false)
  int? get totalTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountTokensResponseCopyWith<CountTokensResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountTokensResponseCopyWith<$Res> {
  factory $CountTokensResponseCopyWith(
          CountTokensResponse value, $Res Function(CountTokensResponse) then) =
      _$CountTokensResponseCopyWithImpl<$Res, CountTokensResponse>;
  @useResult
  $Res call({@JsonKey(includeIfNull: false) int? totalTokens});
}

/// @nodoc
class _$CountTokensResponseCopyWithImpl<$Res, $Val extends CountTokensResponse>
    implements $CountTokensResponseCopyWith<$Res> {
  _$CountTokensResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTokens = freezed,
  }) {
    return _then(_value.copyWith(
      totalTokens: freezed == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountTokensResponseImplCopyWith<$Res>
    implements $CountTokensResponseCopyWith<$Res> {
  factory _$$CountTokensResponseImplCopyWith(_$CountTokensResponseImpl value,
          $Res Function(_$CountTokensResponseImpl) then) =
      __$$CountTokensResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: false) int? totalTokens});
}

/// @nodoc
class __$$CountTokensResponseImplCopyWithImpl<$Res>
    extends _$CountTokensResponseCopyWithImpl<$Res, _$CountTokensResponseImpl>
    implements _$$CountTokensResponseImplCopyWith<$Res> {
  __$$CountTokensResponseImplCopyWithImpl(_$CountTokensResponseImpl _value,
      $Res Function(_$CountTokensResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTokens = freezed,
  }) {
    return _then(_$CountTokensResponseImpl(
      totalTokens: freezed == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountTokensResponseImpl extends _CountTokensResponse {
  const _$CountTokensResponseImpl(
      {@JsonKey(includeIfNull: false) this.totalTokens})
      : super._();

  factory _$CountTokensResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountTokensResponseImplFromJson(json);

  /// The number of tokens that the `model` tokenizes the `prompt` into. Always non-negative.
  @override
  @JsonKey(includeIfNull: false)
  final int? totalTokens;

  @override
  String toString() {
    return 'CountTokensResponse(totalTokens: $totalTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountTokensResponseImpl &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalTokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountTokensResponseImplCopyWith<_$CountTokensResponseImpl> get copyWith =>
      __$$CountTokensResponseImplCopyWithImpl<_$CountTokensResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountTokensResponseImplToJson(
      this,
    );
  }
}

abstract class _CountTokensResponse extends CountTokensResponse {
  const factory _CountTokensResponse(
          {@JsonKey(includeIfNull: false) final int? totalTokens}) =
      _$CountTokensResponseImpl;
  const _CountTokensResponse._() : super._();

  factory _CountTokensResponse.fromJson(Map<String, dynamic> json) =
      _$CountTokensResponseImpl.fromJson;

  @override

  /// The number of tokens that the `model` tokenizes the `prompt` into. Always non-negative.
  @JsonKey(includeIfNull: false)
  int? get totalTokens;
  @override
  @JsonKey(ignore: true)
  _$$CountTokensResponseImplCopyWith<_$CountTokensResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CountTokensRequest _$CountTokensRequestFromJson(Map<String, dynamic> json) {
  return _CountTokensRequest.fromJson(json);
}

/// @nodoc
mixin _$CountTokensRequest {
  /// Required. The input given to the model as a prompt.
  @JsonKey(includeIfNull: false)
  List<Content>? get contents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountTokensRequestCopyWith<CountTokensRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountTokensRequestCopyWith<$Res> {
  factory $CountTokensRequestCopyWith(
          CountTokensRequest value, $Res Function(CountTokensRequest) then) =
      _$CountTokensRequestCopyWithImpl<$Res, CountTokensRequest>;
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<Content>? contents});
}

/// @nodoc
class _$CountTokensRequestCopyWithImpl<$Res, $Val extends CountTokensRequest>
    implements $CountTokensRequestCopyWith<$Res> {
  _$CountTokensRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = freezed,
  }) {
    return _then(_value.copyWith(
      contents: freezed == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountTokensRequestImplCopyWith<$Res>
    implements $CountTokensRequestCopyWith<$Res> {
  factory _$$CountTokensRequestImplCopyWith(_$CountTokensRequestImpl value,
          $Res Function(_$CountTokensRequestImpl) then) =
      __$$CountTokensRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<Content>? contents});
}

/// @nodoc
class __$$CountTokensRequestImplCopyWithImpl<$Res>
    extends _$CountTokensRequestCopyWithImpl<$Res, _$CountTokensRequestImpl>
    implements _$$CountTokensRequestImplCopyWith<$Res> {
  __$$CountTokensRequestImplCopyWithImpl(_$CountTokensRequestImpl _value,
      $Res Function(_$CountTokensRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = freezed,
  }) {
    return _then(_$CountTokensRequestImpl(
      contents: freezed == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountTokensRequestImpl extends _CountTokensRequest {
  const _$CountTokensRequestImpl(
      {@JsonKey(includeIfNull: false) final List<Content>? contents})
      : _contents = contents,
        super._();

  factory _$CountTokensRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountTokensRequestImplFromJson(json);

  /// Required. The input given to the model as a prompt.
  final List<Content>? _contents;

  /// Required. The input given to the model as a prompt.
  @override
  @JsonKey(includeIfNull: false)
  List<Content>? get contents {
    final value = _contents;
    if (value == null) return null;
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CountTokensRequest(contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountTokensRequestImpl &&
            const DeepCollectionEquality().equals(other._contents, _contents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_contents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountTokensRequestImplCopyWith<_$CountTokensRequestImpl> get copyWith =>
      __$$CountTokensRequestImplCopyWithImpl<_$CountTokensRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountTokensRequestImplToJson(
      this,
    );
  }
}

abstract class _CountTokensRequest extends CountTokensRequest {
  const factory _CountTokensRequest(
          {@JsonKey(includeIfNull: false) final List<Content>? contents}) =
      _$CountTokensRequestImpl;
  const _CountTokensRequest._() : super._();

  factory _CountTokensRequest.fromJson(Map<String, dynamic> json) =
      _$CountTokensRequestImpl.fromJson;

  @override

  /// Required. The input given to the model as a prompt.
  @JsonKey(includeIfNull: false)
  List<Content>? get contents;
  @override
  @JsonKey(ignore: true)
  _$$CountTokensRequestImplCopyWith<_$CountTokensRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BatchEmbedContentsResponse _$BatchEmbedContentsResponseFromJson(
    Map<String, dynamic> json) {
  return _BatchEmbedContentsResponse.fromJson(json);
}

/// @nodoc
mixin _$BatchEmbedContentsResponse {
  /// Output only. The embeddings for each request, in the same order as provided in the batch request.
  @JsonKey(includeIfNull: false)
  List<ContentEmbedding>? get embeddings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BatchEmbedContentsResponseCopyWith<BatchEmbedContentsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchEmbedContentsResponseCopyWith<$Res> {
  factory $BatchEmbedContentsResponseCopyWith(BatchEmbedContentsResponse value,
          $Res Function(BatchEmbedContentsResponse) then) =
      _$BatchEmbedContentsResponseCopyWithImpl<$Res,
          BatchEmbedContentsResponse>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<ContentEmbedding>? embeddings});
}

/// @nodoc
class _$BatchEmbedContentsResponseCopyWithImpl<$Res,
        $Val extends BatchEmbedContentsResponse>
    implements $BatchEmbedContentsResponseCopyWith<$Res> {
  _$BatchEmbedContentsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embeddings = freezed,
  }) {
    return _then(_value.copyWith(
      embeddings: freezed == embeddings
          ? _value.embeddings
          : embeddings // ignore: cast_nullable_to_non_nullable
              as List<ContentEmbedding>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchEmbedContentsResponseImplCopyWith<$Res>
    implements $BatchEmbedContentsResponseCopyWith<$Res> {
  factory _$$BatchEmbedContentsResponseImplCopyWith(
          _$BatchEmbedContentsResponseImpl value,
          $Res Function(_$BatchEmbedContentsResponseImpl) then) =
      __$$BatchEmbedContentsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<ContentEmbedding>? embeddings});
}

/// @nodoc
class __$$BatchEmbedContentsResponseImplCopyWithImpl<$Res>
    extends _$BatchEmbedContentsResponseCopyWithImpl<$Res,
        _$BatchEmbedContentsResponseImpl>
    implements _$$BatchEmbedContentsResponseImplCopyWith<$Res> {
  __$$BatchEmbedContentsResponseImplCopyWithImpl(
      _$BatchEmbedContentsResponseImpl _value,
      $Res Function(_$BatchEmbedContentsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embeddings = freezed,
  }) {
    return _then(_$BatchEmbedContentsResponseImpl(
      embeddings: freezed == embeddings
          ? _value._embeddings
          : embeddings // ignore: cast_nullable_to_non_nullable
              as List<ContentEmbedding>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BatchEmbedContentsResponseImpl extends _BatchEmbedContentsResponse {
  const _$BatchEmbedContentsResponseImpl(
      {@JsonKey(includeIfNull: false) final List<ContentEmbedding>? embeddings})
      : _embeddings = embeddings,
        super._();

  factory _$BatchEmbedContentsResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BatchEmbedContentsResponseImplFromJson(json);

  /// Output only. The embeddings for each request, in the same order as provided in the batch request.
  final List<ContentEmbedding>? _embeddings;

  /// Output only. The embeddings for each request, in the same order as provided in the batch request.
  @override
  @JsonKey(includeIfNull: false)
  List<ContentEmbedding>? get embeddings {
    final value = _embeddings;
    if (value == null) return null;
    if (_embeddings is EqualUnmodifiableListView) return _embeddings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BatchEmbedContentsResponse(embeddings: $embeddings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchEmbedContentsResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._embeddings, _embeddings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_embeddings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchEmbedContentsResponseImplCopyWith<_$BatchEmbedContentsResponseImpl>
      get copyWith => __$$BatchEmbedContentsResponseImplCopyWithImpl<
          _$BatchEmbedContentsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchEmbedContentsResponseImplToJson(
      this,
    );
  }
}

abstract class _BatchEmbedContentsResponse extends BatchEmbedContentsResponse {
  const factory _BatchEmbedContentsResponse(
          {@JsonKey(includeIfNull: false)
          final List<ContentEmbedding>? embeddings}) =
      _$BatchEmbedContentsResponseImpl;
  const _BatchEmbedContentsResponse._() : super._();

  factory _BatchEmbedContentsResponse.fromJson(Map<String, dynamic> json) =
      _$BatchEmbedContentsResponseImpl.fromJson;

  @override

  /// Output only. The embeddings for each request, in the same order as provided in the batch request.
  @JsonKey(includeIfNull: false)
  List<ContentEmbedding>? get embeddings;
  @override
  @JsonKey(ignore: true)
  _$$BatchEmbedContentsResponseImplCopyWith<_$BatchEmbedContentsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CitationMetadata _$CitationMetadataFromJson(Map<String, dynamic> json) {
  return _CitationMetadata.fromJson(json);
}

/// @nodoc
mixin _$CitationMetadata {
  /// Citations to sources for a specific response.
  @JsonKey(includeIfNull: false)
  List<CitationSource>? get citationSources =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CitationMetadataCopyWith<CitationMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CitationMetadataCopyWith<$Res> {
  factory $CitationMetadataCopyWith(
          CitationMetadata value, $Res Function(CitationMetadata) then) =
      _$CitationMetadataCopyWithImpl<$Res, CitationMetadata>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<CitationSource>? citationSources});
}

/// @nodoc
class _$CitationMetadataCopyWithImpl<$Res, $Val extends CitationMetadata>
    implements $CitationMetadataCopyWith<$Res> {
  _$CitationMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? citationSources = freezed,
  }) {
    return _then(_value.copyWith(
      citationSources: freezed == citationSources
          ? _value.citationSources
          : citationSources // ignore: cast_nullable_to_non_nullable
              as List<CitationSource>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CitationMetadataImplCopyWith<$Res>
    implements $CitationMetadataCopyWith<$Res> {
  factory _$$CitationMetadataImplCopyWith(_$CitationMetadataImpl value,
          $Res Function(_$CitationMetadataImpl) then) =
      __$$CitationMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<CitationSource>? citationSources});
}

/// @nodoc
class __$$CitationMetadataImplCopyWithImpl<$Res>
    extends _$CitationMetadataCopyWithImpl<$Res, _$CitationMetadataImpl>
    implements _$$CitationMetadataImplCopyWith<$Res> {
  __$$CitationMetadataImplCopyWithImpl(_$CitationMetadataImpl _value,
      $Res Function(_$CitationMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? citationSources = freezed,
  }) {
    return _then(_$CitationMetadataImpl(
      citationSources: freezed == citationSources
          ? _value._citationSources
          : citationSources // ignore: cast_nullable_to_non_nullable
              as List<CitationSource>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CitationMetadataImpl extends _CitationMetadata {
  const _$CitationMetadataImpl(
      {@JsonKey(includeIfNull: false)
      final List<CitationSource>? citationSources})
      : _citationSources = citationSources,
        super._();

  factory _$CitationMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CitationMetadataImplFromJson(json);

  /// Citations to sources for a specific response.
  final List<CitationSource>? _citationSources;

  /// Citations to sources for a specific response.
  @override
  @JsonKey(includeIfNull: false)
  List<CitationSource>? get citationSources {
    final value = _citationSources;
    if (value == null) return null;
    if (_citationSources is EqualUnmodifiableListView) return _citationSources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CitationMetadata(citationSources: $citationSources)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CitationMetadataImpl &&
            const DeepCollectionEquality()
                .equals(other._citationSources, _citationSources));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_citationSources));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CitationMetadataImplCopyWith<_$CitationMetadataImpl> get copyWith =>
      __$$CitationMetadataImplCopyWithImpl<_$CitationMetadataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CitationMetadataImplToJson(
      this,
    );
  }
}

abstract class _CitationMetadata extends CitationMetadata {
  const factory _CitationMetadata(
      {@JsonKey(includeIfNull: false)
      final List<CitationSource>? citationSources}) = _$CitationMetadataImpl;
  const _CitationMetadata._() : super._();

  factory _CitationMetadata.fromJson(Map<String, dynamic> json) =
      _$CitationMetadataImpl.fromJson;

  @override

  /// Citations to sources for a specific response.
  @JsonKey(includeIfNull: false)
  List<CitationSource>? get citationSources;
  @override
  @JsonKey(ignore: true)
  _$$CitationMetadataImplCopyWith<_$CitationMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Blob _$BlobFromJson(Map<String, dynamic> json) {
  return _Blob.fromJson(json);
}

/// @nodoc
mixin _$Blob {
  /// The IANA standard MIME type of the source data. Accepted types include: "image/png", "image/jpeg", "image/heic", "image/heif", "image/webp".
  @JsonKey(includeIfNull: false)
  String? get mimeType => throw _privateConstructorUsedError;

  /// Raw bytes for media formats.
  @JsonKey(includeIfNull: false)
  String? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlobCopyWith<Blob> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlobCopyWith<$Res> {
  factory $BlobCopyWith(Blob value, $Res Function(Blob) then) =
      _$BlobCopyWithImpl<$Res, Blob>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? mimeType,
      @JsonKey(includeIfNull: false) String? data});
}

/// @nodoc
class _$BlobCopyWithImpl<$Res, $Val extends Blob>
    implements $BlobCopyWith<$Res> {
  _$BlobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mimeType = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlobImplCopyWith<$Res> implements $BlobCopyWith<$Res> {
  factory _$$BlobImplCopyWith(
          _$BlobImpl value, $Res Function(_$BlobImpl) then) =
      __$$BlobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? mimeType,
      @JsonKey(includeIfNull: false) String? data});
}

/// @nodoc
class __$$BlobImplCopyWithImpl<$Res>
    extends _$BlobCopyWithImpl<$Res, _$BlobImpl>
    implements _$$BlobImplCopyWith<$Res> {
  __$$BlobImplCopyWithImpl(_$BlobImpl _value, $Res Function(_$BlobImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mimeType = freezed,
    Object? data = freezed,
  }) {
    return _then(_$BlobImpl(
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlobImpl extends _Blob {
  const _$BlobImpl(
      {@JsonKey(includeIfNull: false) this.mimeType,
      @JsonKey(includeIfNull: false) this.data})
      : super._();

  factory _$BlobImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlobImplFromJson(json);

  /// The IANA standard MIME type of the source data. Accepted types include: "image/png", "image/jpeg", "image/heic", "image/heif", "image/webp".
  @override
  @JsonKey(includeIfNull: false)
  final String? mimeType;

  /// Raw bytes for media formats.
  @override
  @JsonKey(includeIfNull: false)
  final String? data;

  @override
  String toString() {
    return 'Blob(mimeType: $mimeType, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlobImpl &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlobImplCopyWith<_$BlobImpl> get copyWith =>
      __$$BlobImplCopyWithImpl<_$BlobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlobImplToJson(
      this,
    );
  }
}

abstract class _Blob extends Blob {
  const factory _Blob(
      {@JsonKey(includeIfNull: false) final String? mimeType,
      @JsonKey(includeIfNull: false) final String? data}) = _$BlobImpl;
  const _Blob._() : super._();

  factory _Blob.fromJson(Map<String, dynamic> json) = _$BlobImpl.fromJson;

  @override

  /// The IANA standard MIME type of the source data. Accepted types include: "image/png", "image/jpeg", "image/heic", "image/heif", "image/webp".
  @JsonKey(includeIfNull: false)
  String? get mimeType;
  @override

  /// Raw bytes for media formats.
  @JsonKey(includeIfNull: false)
  String? get data;
  @override
  @JsonKey(ignore: true)
  _$$BlobImplCopyWith<_$BlobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CitationSource _$CitationSourceFromJson(Map<String, dynamic> json) {
  return _CitationSource.fromJson(json);
}

/// @nodoc
mixin _$CitationSource {
  /// Optional. End of the attributed segment, exclusive.
  @JsonKey(includeIfNull: false)
  int? get endIndex => throw _privateConstructorUsedError;

  /// Optional. License for the GitHub project that is attributed as a source for segment. License info is required for code citations.
  @JsonKey(includeIfNull: false)
  String? get license => throw _privateConstructorUsedError;

  /// Optional. URI that is attributed as a source for a portion of the text.
  @JsonKey(includeIfNull: false)
  String? get uri => throw _privateConstructorUsedError;

  /// Optional. Start of segment of the response that is attributed to this source. Index indicates the start of the segment, measured in bytes.
  @JsonKey(includeIfNull: false)
  int? get startIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CitationSourceCopyWith<CitationSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CitationSourceCopyWith<$Res> {
  factory $CitationSourceCopyWith(
          CitationSource value, $Res Function(CitationSource) then) =
      _$CitationSourceCopyWithImpl<$Res, CitationSource>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? endIndex,
      @JsonKey(includeIfNull: false) String? license,
      @JsonKey(includeIfNull: false) String? uri,
      @JsonKey(includeIfNull: false) int? startIndex});
}

/// @nodoc
class _$CitationSourceCopyWithImpl<$Res, $Val extends CitationSource>
    implements $CitationSourceCopyWith<$Res> {
  _$CitationSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endIndex = freezed,
    Object? license = freezed,
    Object? uri = freezed,
    Object? startIndex = freezed,
  }) {
    return _then(_value.copyWith(
      endIndex: freezed == endIndex
          ? _value.endIndex
          : endIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
      startIndex: freezed == startIndex
          ? _value.startIndex
          : startIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CitationSourceImplCopyWith<$Res>
    implements $CitationSourceCopyWith<$Res> {
  factory _$$CitationSourceImplCopyWith(_$CitationSourceImpl value,
          $Res Function(_$CitationSourceImpl) then) =
      __$$CitationSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? endIndex,
      @JsonKey(includeIfNull: false) String? license,
      @JsonKey(includeIfNull: false) String? uri,
      @JsonKey(includeIfNull: false) int? startIndex});
}

/// @nodoc
class __$$CitationSourceImplCopyWithImpl<$Res>
    extends _$CitationSourceCopyWithImpl<$Res, _$CitationSourceImpl>
    implements _$$CitationSourceImplCopyWith<$Res> {
  __$$CitationSourceImplCopyWithImpl(
      _$CitationSourceImpl _value, $Res Function(_$CitationSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endIndex = freezed,
    Object? license = freezed,
    Object? uri = freezed,
    Object? startIndex = freezed,
  }) {
    return _then(_$CitationSourceImpl(
      endIndex: freezed == endIndex
          ? _value.endIndex
          : endIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
      startIndex: freezed == startIndex
          ? _value.startIndex
          : startIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CitationSourceImpl extends _CitationSource {
  const _$CitationSourceImpl(
      {@JsonKey(includeIfNull: false) this.endIndex,
      @JsonKey(includeIfNull: false) this.license,
      @JsonKey(includeIfNull: false) this.uri,
      @JsonKey(includeIfNull: false) this.startIndex})
      : super._();

  factory _$CitationSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CitationSourceImplFromJson(json);

  /// Optional. End of the attributed segment, exclusive.
  @override
  @JsonKey(includeIfNull: false)
  final int? endIndex;

  /// Optional. License for the GitHub project that is attributed as a source for segment. License info is required for code citations.
  @override
  @JsonKey(includeIfNull: false)
  final String? license;

  /// Optional. URI that is attributed as a source for a portion of the text.
  @override
  @JsonKey(includeIfNull: false)
  final String? uri;

  /// Optional. Start of segment of the response that is attributed to this source. Index indicates the start of the segment, measured in bytes.
  @override
  @JsonKey(includeIfNull: false)
  final int? startIndex;

  @override
  String toString() {
    return 'CitationSource(endIndex: $endIndex, license: $license, uri: $uri, startIndex: $startIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CitationSourceImpl &&
            (identical(other.endIndex, endIndex) ||
                other.endIndex == endIndex) &&
            (identical(other.license, license) || other.license == license) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.startIndex, startIndex) ||
                other.startIndex == startIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, endIndex, license, uri, startIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CitationSourceImplCopyWith<_$CitationSourceImpl> get copyWith =>
      __$$CitationSourceImplCopyWithImpl<_$CitationSourceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CitationSourceImplToJson(
      this,
    );
  }
}

abstract class _CitationSource extends CitationSource {
  const factory _CitationSource(
          {@JsonKey(includeIfNull: false) final int? endIndex,
          @JsonKey(includeIfNull: false) final String? license,
          @JsonKey(includeIfNull: false) final String? uri,
          @JsonKey(includeIfNull: false) final int? startIndex}) =
      _$CitationSourceImpl;
  const _CitationSource._() : super._();

  factory _CitationSource.fromJson(Map<String, dynamic> json) =
      _$CitationSourceImpl.fromJson;

  @override

  /// Optional. End of the attributed segment, exclusive.
  @JsonKey(includeIfNull: false)
  int? get endIndex;
  @override

  /// Optional. License for the GitHub project that is attributed as a source for segment. License info is required for code citations.
  @JsonKey(includeIfNull: false)
  String? get license;
  @override

  /// Optional. URI that is attributed as a source for a portion of the text.
  @JsonKey(includeIfNull: false)
  String? get uri;
  @override

  /// Optional. Start of segment of the response that is attributed to this source. Index indicates the start of the segment, measured in bytes.
  @JsonKey(includeIfNull: false)
  int? get startIndex;
  @override
  @JsonKey(ignore: true)
  _$$CitationSourceImplCopyWith<_$CitationSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Status _$StatusFromJson(Map<String, dynamic> json) {
  return _Status.fromJson(json);
}

/// @nodoc
mixin _$Status {
  /// A list of messages that carry the error details. There is a common set of message types for APIs to use.
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>>? get details => throw _privateConstructorUsedError;

  /// The status code, which should be an enum value of google.rpc.Code.
  @JsonKey(includeIfNull: false)
  int? get code => throw _privateConstructorUsedError;

  /// A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
  @JsonKey(includeIfNull: false)
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusCopyWith<Status> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res, Status>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<Map<String, dynamic>>? details,
      @JsonKey(includeIfNull: false) int? code,
      @JsonKey(includeIfNull: false) String? message});
}

/// @nodoc
class _$StatusCopyWithImpl<$Res, $Val extends Status>
    implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = freezed,
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusImplCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$$StatusImplCopyWith(
          _$StatusImpl value, $Res Function(_$StatusImpl) then) =
      __$$StatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<Map<String, dynamic>>? details,
      @JsonKey(includeIfNull: false) int? code,
      @JsonKey(includeIfNull: false) String? message});
}

/// @nodoc
class __$$StatusImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusImpl>
    implements _$$StatusImplCopyWith<$Res> {
  __$$StatusImplCopyWithImpl(
      _$StatusImpl _value, $Res Function(_$StatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = freezed,
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_$StatusImpl(
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusImpl extends _Status {
  const _$StatusImpl(
      {@JsonKey(includeIfNull: false) final List<Map<String, dynamic>>? details,
      @JsonKey(includeIfNull: false) this.code,
      @JsonKey(includeIfNull: false) this.message})
      : _details = details,
        super._();

  factory _$StatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusImplFromJson(json);

  /// A list of messages that carry the error details. There is a common set of message types for APIs to use.
  final List<Map<String, dynamic>>? _details;

  /// A list of messages that carry the error details. There is a common set of message types for APIs to use.
  @override
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// The status code, which should be an enum value of google.rpc.Code.
  @override
  @JsonKey(includeIfNull: false)
  final int? code;

  /// A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
  @override
  @JsonKey(includeIfNull: false)
  final String? message;

  @override
  String toString() {
    return 'Status(details: $details, code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusImpl &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_details), code, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      __$$StatusImplCopyWithImpl<_$StatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusImplToJson(
      this,
    );
  }
}

abstract class _Status extends Status {
  const factory _Status(
      {@JsonKey(includeIfNull: false) final List<Map<String, dynamic>>? details,
      @JsonKey(includeIfNull: false) final int? code,
      @JsonKey(includeIfNull: false) final String? message}) = _$StatusImpl;
  const _Status._() : super._();

  factory _Status.fromJson(Map<String, dynamic> json) = _$StatusImpl.fromJson;

  @override

  /// A list of messages that carry the error details. There is a common set of message types for APIs to use.
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>>? get details;
  @override

  /// The status code, which should be an enum value of google.rpc.Code.
  @JsonKey(includeIfNull: false)
  int? get code;
  @override

  /// A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
  @JsonKey(includeIfNull: false)
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
