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
mixin _$BatchEmbedContentsResponse {
  /// Output only. The embeddings for each request, in the same order as provided in the batch request.
  @JsonKey(includeIfNull: false)
  List<ContentEmbedding>? get embeddings;

  /// Create a copy of BatchEmbedContentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BatchEmbedContentsResponseCopyWith<BatchEmbedContentsResponse>
      get copyWith =>
          _$BatchEmbedContentsResponseCopyWithImpl<BatchEmbedContentsResponse>(
              this as BatchEmbedContentsResponse, _$identity);

  /// Serializes this BatchEmbedContentsResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BatchEmbedContentsResponse &&
            const DeepCollectionEquality()
                .equals(other.embeddings, embeddings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(embeddings));

  @override
  String toString() {
    return 'BatchEmbedContentsResponse(embeddings: $embeddings)';
  }
}

/// @nodoc
abstract mixin class $BatchEmbedContentsResponseCopyWith<$Res> {
  factory $BatchEmbedContentsResponseCopyWith(BatchEmbedContentsResponse value,
          $Res Function(BatchEmbedContentsResponse) _then) =
      _$BatchEmbedContentsResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<ContentEmbedding>? embeddings});
}

/// @nodoc
class _$BatchEmbedContentsResponseCopyWithImpl<$Res>
    implements $BatchEmbedContentsResponseCopyWith<$Res> {
  _$BatchEmbedContentsResponseCopyWithImpl(this._self, this._then);

  final BatchEmbedContentsResponse _self;
  final $Res Function(BatchEmbedContentsResponse) _then;

  /// Create a copy of BatchEmbedContentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embeddings = freezed,
  }) {
    return _then(_self.copyWith(
      embeddings: freezed == embeddings
          ? _self.embeddings
          : embeddings // ignore: cast_nullable_to_non_nullable
              as List<ContentEmbedding>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BatchEmbedContentsResponse].
extension BatchEmbedContentsResponsePatterns on BatchEmbedContentsResponse {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BatchEmbedContentsResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BatchEmbedContentsResponse() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BatchEmbedContentsResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchEmbedContentsResponse():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BatchEmbedContentsResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchEmbedContentsResponse() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) List<ContentEmbedding>? embeddings)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BatchEmbedContentsResponse() when $default != null:
        return $default(_that.embeddings);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) List<ContentEmbedding>? embeddings)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchEmbedContentsResponse():
        return $default(_that.embeddings);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) List<ContentEmbedding>? embeddings)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchEmbedContentsResponse() when $default != null:
        return $default(_that.embeddings);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BatchEmbedContentsResponse extends BatchEmbedContentsResponse {
  const _BatchEmbedContentsResponse(
      {@JsonKey(includeIfNull: false) final List<ContentEmbedding>? embeddings})
      : _embeddings = embeddings,
        super._();
  factory _BatchEmbedContentsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchEmbedContentsResponseFromJson(json);

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

  /// Create a copy of BatchEmbedContentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BatchEmbedContentsResponseCopyWith<_BatchEmbedContentsResponse>
      get copyWith => __$BatchEmbedContentsResponseCopyWithImpl<
          _BatchEmbedContentsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BatchEmbedContentsResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BatchEmbedContentsResponse &&
            const DeepCollectionEquality()
                .equals(other._embeddings, _embeddings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_embeddings));

  @override
  String toString() {
    return 'BatchEmbedContentsResponse(embeddings: $embeddings)';
  }
}

/// @nodoc
abstract mixin class _$BatchEmbedContentsResponseCopyWith<$Res>
    implements $BatchEmbedContentsResponseCopyWith<$Res> {
  factory _$BatchEmbedContentsResponseCopyWith(
          _BatchEmbedContentsResponse value,
          $Res Function(_BatchEmbedContentsResponse) _then) =
      __$BatchEmbedContentsResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<ContentEmbedding>? embeddings});
}

/// @nodoc
class __$BatchEmbedContentsResponseCopyWithImpl<$Res>
    implements _$BatchEmbedContentsResponseCopyWith<$Res> {
  __$BatchEmbedContentsResponseCopyWithImpl(this._self, this._then);

  final _BatchEmbedContentsResponse _self;
  final $Res Function(_BatchEmbedContentsResponse) _then;

  /// Create a copy of BatchEmbedContentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? embeddings = freezed,
  }) {
    return _then(_BatchEmbedContentsResponse(
      embeddings: freezed == embeddings
          ? _self._embeddings
          : embeddings // ignore: cast_nullable_to_non_nullable
              as List<ContentEmbedding>?,
    ));
  }
}

/// @nodoc
mixin _$Candidate {
  /// Output only. Generated content returned from the model.
  @JsonKey(includeIfNull: false)
  Content? get content;

  /// Optional. Output only. The reason why the model stopped generating tokens. If empty, the model has not stopped generating the tokens.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  CandidateFinishReason? get finishReason;

  /// Output only. Citation information for model-generated candidate. This field may be populated with recitation information for any text included in the `content`. These are passages that are "recited" from copyrighted material in the foundational LLM's training data.
  @JsonKey(includeIfNull: false)
  CitationMetadata? get citationMetadata;

  /// Output only. Index of the candidate in the list of candidates.
  @JsonKey(includeIfNull: false)
  int? get index;

  /// Output only. Token count for this candidate.
  @JsonKey(includeIfNull: false)
  int? get tokenCount;

  /// List of ratings for the safety of a response candidate. There is at most one rating per category.
  @JsonKey(includeIfNull: false)
  List<SafetyRating>? get safetyRatings;

  /// Create a copy of Candidate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CandidateCopyWith<Candidate> get copyWith =>
      _$CandidateCopyWithImpl<Candidate>(this as Candidate, _$identity);

  /// Serializes this Candidate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Candidate &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.finishReason, finishReason) ||
                other.finishReason == finishReason) &&
            (identical(other.citationMetadata, citationMetadata) ||
                other.citationMetadata == citationMetadata) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.tokenCount, tokenCount) ||
                other.tokenCount == tokenCount) &&
            const DeepCollectionEquality()
                .equals(other.safetyRatings, safetyRatings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      finishReason,
      citationMetadata,
      index,
      tokenCount,
      const DeepCollectionEquality().hash(safetyRatings));

  @override
  String toString() {
    return 'Candidate(content: $content, finishReason: $finishReason, citationMetadata: $citationMetadata, index: $index, tokenCount: $tokenCount, safetyRatings: $safetyRatings)';
  }
}

/// @nodoc
abstract mixin class $CandidateCopyWith<$Res> {
  factory $CandidateCopyWith(Candidate value, $Res Function(Candidate) _then) =
      _$CandidateCopyWithImpl;
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
class _$CandidateCopyWithImpl<$Res> implements $CandidateCopyWith<$Res> {
  _$CandidateCopyWithImpl(this._self, this._then);

  final Candidate _self;
  final $Res Function(Candidate) _then;

  /// Create a copy of Candidate
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      finishReason: freezed == finishReason
          ? _self.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as CandidateFinishReason?,
      citationMetadata: freezed == citationMetadata
          ? _self.citationMetadata
          : citationMetadata // ignore: cast_nullable_to_non_nullable
              as CitationMetadata?,
      index: freezed == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenCount: freezed == tokenCount
          ? _self.tokenCount
          : tokenCount // ignore: cast_nullable_to_non_nullable
              as int?,
      safetyRatings: freezed == safetyRatings
          ? _self.safetyRatings
          : safetyRatings // ignore: cast_nullable_to_non_nullable
              as List<SafetyRating>?,
    ));
  }

  /// Create a copy of Candidate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }

  /// Create a copy of Candidate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CitationMetadataCopyWith<$Res>? get citationMetadata {
    if (_self.citationMetadata == null) {
      return null;
    }

    return $CitationMetadataCopyWith<$Res>(_self.citationMetadata!, (value) {
      return _then(_self.copyWith(citationMetadata: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Candidate].
extension CandidatePatterns on Candidate {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Candidate value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Candidate() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Candidate value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Candidate():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Candidate value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Candidate() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) Content? content,
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            CandidateFinishReason? finishReason,
            @JsonKey(includeIfNull: false) CitationMetadata? citationMetadata,
            @JsonKey(includeIfNull: false) int? index,
            @JsonKey(includeIfNull: false) int? tokenCount,
            @JsonKey(includeIfNull: false) List<SafetyRating>? safetyRatings)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Candidate() when $default != null:
        return $default(
            _that.content,
            _that.finishReason,
            _that.citationMetadata,
            _that.index,
            _that.tokenCount,
            _that.safetyRatings);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) Content? content,
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            CandidateFinishReason? finishReason,
            @JsonKey(includeIfNull: false) CitationMetadata? citationMetadata,
            @JsonKey(includeIfNull: false) int? index,
            @JsonKey(includeIfNull: false) int? tokenCount,
            @JsonKey(includeIfNull: false) List<SafetyRating>? safetyRatings)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Candidate():
        return $default(
            _that.content,
            _that.finishReason,
            _that.citationMetadata,
            _that.index,
            _that.tokenCount,
            _that.safetyRatings);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) Content? content,
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            CandidateFinishReason? finishReason,
            @JsonKey(includeIfNull: false) CitationMetadata? citationMetadata,
            @JsonKey(includeIfNull: false) int? index,
            @JsonKey(includeIfNull: false) int? tokenCount,
            @JsonKey(includeIfNull: false) List<SafetyRating>? safetyRatings)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Candidate() when $default != null:
        return $default(
            _that.content,
            _that.finishReason,
            _that.citationMetadata,
            _that.index,
            _that.tokenCount,
            _that.safetyRatings);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Candidate extends Candidate {
  const _Candidate(
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
  factory _Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);

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

  /// Create a copy of Candidate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CandidateCopyWith<_Candidate> get copyWith =>
      __$CandidateCopyWithImpl<_Candidate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CandidateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Candidate &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      finishReason,
      citationMetadata,
      index,
      tokenCount,
      const DeepCollectionEquality().hash(_safetyRatings));

  @override
  String toString() {
    return 'Candidate(content: $content, finishReason: $finishReason, citationMetadata: $citationMetadata, index: $index, tokenCount: $tokenCount, safetyRatings: $safetyRatings)';
  }
}

/// @nodoc
abstract mixin class _$CandidateCopyWith<$Res>
    implements $CandidateCopyWith<$Res> {
  factory _$CandidateCopyWith(
          _Candidate value, $Res Function(_Candidate) _then) =
      __$CandidateCopyWithImpl;
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
class __$CandidateCopyWithImpl<$Res> implements _$CandidateCopyWith<$Res> {
  __$CandidateCopyWithImpl(this._self, this._then);

  final _Candidate _self;
  final $Res Function(_Candidate) _then;

  /// Create a copy of Candidate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = freezed,
    Object? finishReason = freezed,
    Object? citationMetadata = freezed,
    Object? index = freezed,
    Object? tokenCount = freezed,
    Object? safetyRatings = freezed,
  }) {
    return _then(_Candidate(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      finishReason: freezed == finishReason
          ? _self.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as CandidateFinishReason?,
      citationMetadata: freezed == citationMetadata
          ? _self.citationMetadata
          : citationMetadata // ignore: cast_nullable_to_non_nullable
              as CitationMetadata?,
      index: freezed == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenCount: freezed == tokenCount
          ? _self.tokenCount
          : tokenCount // ignore: cast_nullable_to_non_nullable
              as int?,
      safetyRatings: freezed == safetyRatings
          ? _self._safetyRatings
          : safetyRatings // ignore: cast_nullable_to_non_nullable
              as List<SafetyRating>?,
    ));
  }

  /// Create a copy of Candidate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }

  /// Create a copy of Candidate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CitationMetadataCopyWith<$Res>? get citationMetadata {
    if (_self.citationMetadata == null) {
      return null;
    }

    return $CitationMetadataCopyWith<$Res>(_self.citationMetadata!, (value) {
      return _then(_self.copyWith(citationMetadata: value));
    });
  }
}

/// @nodoc
mixin _$CreateTunedModelMetadata {
  /// The total number of tuning steps.
  @JsonKey(includeIfNull: false)
  int? get totalSteps;

  /// Name of the tuned model associated with the tuning operation.
  @JsonKey(includeIfNull: false)
  String? get tunedModel;

  /// The number of steps completed.
  @JsonKey(includeIfNull: false)
  int? get completedSteps;

  /// Metrics collected during tuning.
  @JsonKey(includeIfNull: false)
  List<TuningSnapshot>? get snapshots;

  /// The completed percentage for the tuning operation.
  @JsonKey(includeIfNull: false)
  double? get completedPercent;

  /// Create a copy of CreateTunedModelMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateTunedModelMetadataCopyWith<CreateTunedModelMetadata> get copyWith =>
      _$CreateTunedModelMetadataCopyWithImpl<CreateTunedModelMetadata>(
          this as CreateTunedModelMetadata, _$identity);

  /// Serializes this CreateTunedModelMetadata to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateTunedModelMetadata &&
            (identical(other.totalSteps, totalSteps) ||
                other.totalSteps == totalSteps) &&
            (identical(other.tunedModel, tunedModel) ||
                other.tunedModel == tunedModel) &&
            (identical(other.completedSteps, completedSteps) ||
                other.completedSteps == completedSteps) &&
            const DeepCollectionEquality().equals(other.snapshots, snapshots) &&
            (identical(other.completedPercent, completedPercent) ||
                other.completedPercent == completedPercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalSteps,
      tunedModel,
      completedSteps,
      const DeepCollectionEquality().hash(snapshots),
      completedPercent);

  @override
  String toString() {
    return 'CreateTunedModelMetadata(totalSteps: $totalSteps, tunedModel: $tunedModel, completedSteps: $completedSteps, snapshots: $snapshots, completedPercent: $completedPercent)';
  }
}

/// @nodoc
abstract mixin class $CreateTunedModelMetadataCopyWith<$Res> {
  factory $CreateTunedModelMetadataCopyWith(CreateTunedModelMetadata value,
          $Res Function(CreateTunedModelMetadata) _then) =
      _$CreateTunedModelMetadataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? totalSteps,
      @JsonKey(includeIfNull: false) String? tunedModel,
      @JsonKey(includeIfNull: false) int? completedSteps,
      @JsonKey(includeIfNull: false) List<TuningSnapshot>? snapshots,
      @JsonKey(includeIfNull: false) double? completedPercent});
}

/// @nodoc
class _$CreateTunedModelMetadataCopyWithImpl<$Res>
    implements $CreateTunedModelMetadataCopyWith<$Res> {
  _$CreateTunedModelMetadataCopyWithImpl(this._self, this._then);

  final CreateTunedModelMetadata _self;
  final $Res Function(CreateTunedModelMetadata) _then;

  /// Create a copy of CreateTunedModelMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSteps = freezed,
    Object? tunedModel = freezed,
    Object? completedSteps = freezed,
    Object? snapshots = freezed,
    Object? completedPercent = freezed,
  }) {
    return _then(_self.copyWith(
      totalSteps: freezed == totalSteps
          ? _self.totalSteps
          : totalSteps // ignore: cast_nullable_to_non_nullable
              as int?,
      tunedModel: freezed == tunedModel
          ? _self.tunedModel
          : tunedModel // ignore: cast_nullable_to_non_nullable
              as String?,
      completedSteps: freezed == completedSteps
          ? _self.completedSteps
          : completedSteps // ignore: cast_nullable_to_non_nullable
              as int?,
      snapshots: freezed == snapshots
          ? _self.snapshots
          : snapshots // ignore: cast_nullable_to_non_nullable
              as List<TuningSnapshot>?,
      completedPercent: freezed == completedPercent
          ? _self.completedPercent
          : completedPercent // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateTunedModelMetadata].
extension CreateTunedModelMetadataPatterns on CreateTunedModelMetadata {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CreateTunedModelMetadata value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateTunedModelMetadata() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CreateTunedModelMetadata value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateTunedModelMetadata():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CreateTunedModelMetadata value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateTunedModelMetadata() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) int? totalSteps,
            @JsonKey(includeIfNull: false) String? tunedModel,
            @JsonKey(includeIfNull: false) int? completedSteps,
            @JsonKey(includeIfNull: false) List<TuningSnapshot>? snapshots,
            @JsonKey(includeIfNull: false) double? completedPercent)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateTunedModelMetadata() when $default != null:
        return $default(_that.totalSteps, _that.tunedModel,
            _that.completedSteps, _that.snapshots, _that.completedPercent);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) int? totalSteps,
            @JsonKey(includeIfNull: false) String? tunedModel,
            @JsonKey(includeIfNull: false) int? completedSteps,
            @JsonKey(includeIfNull: false) List<TuningSnapshot>? snapshots,
            @JsonKey(includeIfNull: false) double? completedPercent)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateTunedModelMetadata():
        return $default(_that.totalSteps, _that.tunedModel,
            _that.completedSteps, _that.snapshots, _that.completedPercent);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) int? totalSteps,
            @JsonKey(includeIfNull: false) String? tunedModel,
            @JsonKey(includeIfNull: false) int? completedSteps,
            @JsonKey(includeIfNull: false) List<TuningSnapshot>? snapshots,
            @JsonKey(includeIfNull: false) double? completedPercent)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateTunedModelMetadata() when $default != null:
        return $default(_that.totalSteps, _that.tunedModel,
            _that.completedSteps, _that.snapshots, _that.completedPercent);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateTunedModelMetadata extends CreateTunedModelMetadata {
  const _CreateTunedModelMetadata(
      {@JsonKey(includeIfNull: false) this.totalSteps,
      @JsonKey(includeIfNull: false) this.tunedModel,
      @JsonKey(includeIfNull: false) this.completedSteps,
      @JsonKey(includeIfNull: false) final List<TuningSnapshot>? snapshots,
      @JsonKey(includeIfNull: false) this.completedPercent})
      : _snapshots = snapshots,
        super._();
  factory _CreateTunedModelMetadata.fromJson(Map<String, dynamic> json) =>
      _$CreateTunedModelMetadataFromJson(json);

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

  /// Create a copy of CreateTunedModelMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateTunedModelMetadataCopyWith<_CreateTunedModelMetadata> get copyWith =>
      __$CreateTunedModelMetadataCopyWithImpl<_CreateTunedModelMetadata>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateTunedModelMetadataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateTunedModelMetadata &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalSteps,
      tunedModel,
      completedSteps,
      const DeepCollectionEquality().hash(_snapshots),
      completedPercent);

  @override
  String toString() {
    return 'CreateTunedModelMetadata(totalSteps: $totalSteps, tunedModel: $tunedModel, completedSteps: $completedSteps, snapshots: $snapshots, completedPercent: $completedPercent)';
  }
}

/// @nodoc
abstract mixin class _$CreateTunedModelMetadataCopyWith<$Res>
    implements $CreateTunedModelMetadataCopyWith<$Res> {
  factory _$CreateTunedModelMetadataCopyWith(_CreateTunedModelMetadata value,
          $Res Function(_CreateTunedModelMetadata) _then) =
      __$CreateTunedModelMetadataCopyWithImpl;
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
class __$CreateTunedModelMetadataCopyWithImpl<$Res>
    implements _$CreateTunedModelMetadataCopyWith<$Res> {
  __$CreateTunedModelMetadataCopyWithImpl(this._self, this._then);

  final _CreateTunedModelMetadata _self;
  final $Res Function(_CreateTunedModelMetadata) _then;

  /// Create a copy of CreateTunedModelMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalSteps = freezed,
    Object? tunedModel = freezed,
    Object? completedSteps = freezed,
    Object? snapshots = freezed,
    Object? completedPercent = freezed,
  }) {
    return _then(_CreateTunedModelMetadata(
      totalSteps: freezed == totalSteps
          ? _self.totalSteps
          : totalSteps // ignore: cast_nullable_to_non_nullable
              as int?,
      tunedModel: freezed == tunedModel
          ? _self.tunedModel
          : tunedModel // ignore: cast_nullable_to_non_nullable
              as String?,
      completedSteps: freezed == completedSteps
          ? _self.completedSteps
          : completedSteps // ignore: cast_nullable_to_non_nullable
              as int?,
      snapshots: freezed == snapshots
          ? _self._snapshots
          : snapshots // ignore: cast_nullable_to_non_nullable
              as List<TuningSnapshot>?,
      completedPercent: freezed == completedPercent
          ? _self.completedPercent
          : completedPercent // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$BatchEmbedContentsRequest {
  /// Required. Embed requests for the batch. The model in each of these requests must match the model specified `BatchEmbedContentsRequest.model`.
  @JsonKey(includeIfNull: false)
  List<EmbedContentRequest>? get requests;

  /// Create a copy of BatchEmbedContentsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BatchEmbedContentsRequestCopyWith<BatchEmbedContentsRequest> get copyWith =>
      _$BatchEmbedContentsRequestCopyWithImpl<BatchEmbedContentsRequest>(
          this as BatchEmbedContentsRequest, _$identity);

  /// Serializes this BatchEmbedContentsRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BatchEmbedContentsRequest &&
            const DeepCollectionEquality().equals(other.requests, requests));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(requests));

  @override
  String toString() {
    return 'BatchEmbedContentsRequest(requests: $requests)';
  }
}

/// @nodoc
abstract mixin class $BatchEmbedContentsRequestCopyWith<$Res> {
  factory $BatchEmbedContentsRequestCopyWith(BatchEmbedContentsRequest value,
          $Res Function(BatchEmbedContentsRequest) _then) =
      _$BatchEmbedContentsRequestCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<EmbedContentRequest>? requests});
}

/// @nodoc
class _$BatchEmbedContentsRequestCopyWithImpl<$Res>
    implements $BatchEmbedContentsRequestCopyWith<$Res> {
  _$BatchEmbedContentsRequestCopyWithImpl(this._self, this._then);

  final BatchEmbedContentsRequest _self;
  final $Res Function(BatchEmbedContentsRequest) _then;

  /// Create a copy of BatchEmbedContentsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requests = freezed,
  }) {
    return _then(_self.copyWith(
      requests: freezed == requests
          ? _self.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<EmbedContentRequest>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BatchEmbedContentsRequest].
extension BatchEmbedContentsRequestPatterns on BatchEmbedContentsRequest {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BatchEmbedContentsRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BatchEmbedContentsRequest() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BatchEmbedContentsRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchEmbedContentsRequest():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BatchEmbedContentsRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchEmbedContentsRequest() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) List<EmbedContentRequest>? requests)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BatchEmbedContentsRequest() when $default != null:
        return $default(_that.requests);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) List<EmbedContentRequest>? requests)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchEmbedContentsRequest():
        return $default(_that.requests);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) List<EmbedContentRequest>? requests)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchEmbedContentsRequest() when $default != null:
        return $default(_that.requests);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BatchEmbedContentsRequest extends BatchEmbedContentsRequest {
  const _BatchEmbedContentsRequest(
      {@JsonKey(includeIfNull: false)
      final List<EmbedContentRequest>? requests})
      : _requests = requests,
        super._();
  factory _BatchEmbedContentsRequest.fromJson(Map<String, dynamic> json) =>
      _$BatchEmbedContentsRequestFromJson(json);

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

  /// Create a copy of BatchEmbedContentsRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BatchEmbedContentsRequestCopyWith<_BatchEmbedContentsRequest>
      get copyWith =>
          __$BatchEmbedContentsRequestCopyWithImpl<_BatchEmbedContentsRequest>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BatchEmbedContentsRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BatchEmbedContentsRequest &&
            const DeepCollectionEquality().equals(other._requests, _requests));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_requests));

  @override
  String toString() {
    return 'BatchEmbedContentsRequest(requests: $requests)';
  }
}

/// @nodoc
abstract mixin class _$BatchEmbedContentsRequestCopyWith<$Res>
    implements $BatchEmbedContentsRequestCopyWith<$Res> {
  factory _$BatchEmbedContentsRequestCopyWith(_BatchEmbedContentsRequest value,
          $Res Function(_BatchEmbedContentsRequest) _then) =
      __$BatchEmbedContentsRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<EmbedContentRequest>? requests});
}

/// @nodoc
class __$BatchEmbedContentsRequestCopyWithImpl<$Res>
    implements _$BatchEmbedContentsRequestCopyWith<$Res> {
  __$BatchEmbedContentsRequestCopyWithImpl(this._self, this._then);

  final _BatchEmbedContentsRequest _self;
  final $Res Function(_BatchEmbedContentsRequest) _then;

  /// Create a copy of BatchEmbedContentsRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? requests = freezed,
  }) {
    return _then(_BatchEmbedContentsRequest(
      requests: freezed == requests
          ? _self._requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<EmbedContentRequest>?,
    ));
  }
}

/// @nodoc
mixin _$SafetyRating {
  /// Required. The category for this rating.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  SafetyRatingCategory? get category;

  /// Required. The probability of harm for this content.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  SafetyRatingProbability? get probability;

  /// Was this content blocked because of this rating?
  @JsonKey(includeIfNull: false)
  bool? get blocked;

  /// Create a copy of SafetyRating
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SafetyRatingCopyWith<SafetyRating> get copyWith =>
      _$SafetyRatingCopyWithImpl<SafetyRating>(
          this as SafetyRating, _$identity);

  /// Serializes this SafetyRating to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SafetyRating &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.probability, probability) ||
                other.probability == probability) &&
            (identical(other.blocked, blocked) || other.blocked == blocked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category, probability, blocked);

  @override
  String toString() {
    return 'SafetyRating(category: $category, probability: $probability, blocked: $blocked)';
  }
}

/// @nodoc
abstract mixin class $SafetyRatingCopyWith<$Res> {
  factory $SafetyRatingCopyWith(
          SafetyRating value, $Res Function(SafetyRating) _then) =
      _$SafetyRatingCopyWithImpl;
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
class _$SafetyRatingCopyWithImpl<$Res> implements $SafetyRatingCopyWith<$Res> {
  _$SafetyRatingCopyWithImpl(this._self, this._then);

  final SafetyRating _self;
  final $Res Function(SafetyRating) _then;

  /// Create a copy of SafetyRating
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? probability = freezed,
    Object? blocked = freezed,
  }) {
    return _then(_self.copyWith(
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as SafetyRatingCategory?,
      probability: freezed == probability
          ? _self.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as SafetyRatingProbability?,
      blocked: freezed == blocked
          ? _self.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SafetyRating].
extension SafetyRatingPatterns on SafetyRating {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SafetyRating value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SafetyRating() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SafetyRating value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SafetyRating():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SafetyRating value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SafetyRating() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            SafetyRatingCategory? category,
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            SafetyRatingProbability? probability,
            @JsonKey(includeIfNull: false) bool? blocked)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SafetyRating() when $default != null:
        return $default(_that.category, _that.probability, _that.blocked);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            SafetyRatingCategory? category,
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            SafetyRatingProbability? probability,
            @JsonKey(includeIfNull: false) bool? blocked)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SafetyRating():
        return $default(_that.category, _that.probability, _that.blocked);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            SafetyRatingCategory? category,
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            SafetyRatingProbability? probability,
            @JsonKey(includeIfNull: false) bool? blocked)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SafetyRating() when $default != null:
        return $default(_that.category, _that.probability, _that.blocked);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SafetyRating extends SafetyRating {
  const _SafetyRating(
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
  factory _SafetyRating.fromJson(Map<String, dynamic> json) =>
      _$SafetyRatingFromJson(json);

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

  /// Create a copy of SafetyRating
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SafetyRatingCopyWith<_SafetyRating> get copyWith =>
      __$SafetyRatingCopyWithImpl<_SafetyRating>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SafetyRatingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SafetyRating &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.probability, probability) ||
                other.probability == probability) &&
            (identical(other.blocked, blocked) || other.blocked == blocked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category, probability, blocked);

  @override
  String toString() {
    return 'SafetyRating(category: $category, probability: $probability, blocked: $blocked)';
  }
}

/// @nodoc
abstract mixin class _$SafetyRatingCopyWith<$Res>
    implements $SafetyRatingCopyWith<$Res> {
  factory _$SafetyRatingCopyWith(
          _SafetyRating value, $Res Function(_SafetyRating) _then) =
      __$SafetyRatingCopyWithImpl;
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
class __$SafetyRatingCopyWithImpl<$Res>
    implements _$SafetyRatingCopyWith<$Res> {
  __$SafetyRatingCopyWithImpl(this._self, this._then);

  final _SafetyRating _self;
  final $Res Function(_SafetyRating) _then;

  /// Create a copy of SafetyRating
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = freezed,
    Object? probability = freezed,
    Object? blocked = freezed,
  }) {
    return _then(_SafetyRating(
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as SafetyRatingCategory?,
      probability: freezed == probability
          ? _self.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as SafetyRatingProbability?,
      blocked: freezed == blocked
          ? _self.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
mixin _$Part {
  /// Inline media bytes.
  @JsonKey(includeIfNull: false)
  Blob? get inlineData;

  /// Inline text.
  @JsonKey(includeIfNull: false)
  String? get text;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartCopyWith<Part> get copyWith =>
      _$PartCopyWithImpl<Part>(this as Part, _$identity);

  /// Serializes this Part to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Part &&
            (identical(other.inlineData, inlineData) ||
                other.inlineData == inlineData) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, inlineData, text);

  @override
  String toString() {
    return 'Part(inlineData: $inlineData, text: $text)';
  }
}

/// @nodoc
abstract mixin class $PartCopyWith<$Res> {
  factory $PartCopyWith(Part value, $Res Function(Part) _then) =
      _$PartCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) Blob? inlineData,
      @JsonKey(includeIfNull: false) String? text});

  $BlobCopyWith<$Res>? get inlineData;
}

/// @nodoc
class _$PartCopyWithImpl<$Res> implements $PartCopyWith<$Res> {
  _$PartCopyWithImpl(this._self, this._then);

  final Part _self;
  final $Res Function(Part) _then;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inlineData = freezed,
    Object? text = freezed,
  }) {
    return _then(_self.copyWith(
      inlineData: freezed == inlineData
          ? _self.inlineData
          : inlineData // ignore: cast_nullable_to_non_nullable
              as Blob?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlobCopyWith<$Res>? get inlineData {
    if (_self.inlineData == null) {
      return null;
    }

    return $BlobCopyWith<$Res>(_self.inlineData!, (value) {
      return _then(_self.copyWith(inlineData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Part].
extension PartPatterns on Part {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Part value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Part() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Part value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Part():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Part value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Part() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) Blob? inlineData,
            @JsonKey(includeIfNull: false) String? text)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Part() when $default != null:
        return $default(_that.inlineData, _that.text);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) Blob? inlineData,
            @JsonKey(includeIfNull: false) String? text)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Part():
        return $default(_that.inlineData, _that.text);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(includeIfNull: false) Blob? inlineData,
            @JsonKey(includeIfNull: false) String? text)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Part() when $default != null:
        return $default(_that.inlineData, _that.text);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Part extends Part {
  const _Part(
      {@JsonKey(includeIfNull: false) this.inlineData,
      @JsonKey(includeIfNull: false) this.text})
      : super._();
  factory _Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);

  /// Inline media bytes.
  @override
  @JsonKey(includeIfNull: false)
  final Blob? inlineData;

  /// Inline text.
  @override
  @JsonKey(includeIfNull: false)
  final String? text;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PartCopyWith<_Part> get copyWith =>
      __$PartCopyWithImpl<_Part>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PartToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Part &&
            (identical(other.inlineData, inlineData) ||
                other.inlineData == inlineData) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, inlineData, text);

  @override
  String toString() {
    return 'Part(inlineData: $inlineData, text: $text)';
  }
}

/// @nodoc
abstract mixin class _$PartCopyWith<$Res> implements $PartCopyWith<$Res> {
  factory _$PartCopyWith(_Part value, $Res Function(_Part) _then) =
      __$PartCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) Blob? inlineData,
      @JsonKey(includeIfNull: false) String? text});

  @override
  $BlobCopyWith<$Res>? get inlineData;
}

/// @nodoc
class __$PartCopyWithImpl<$Res> implements _$PartCopyWith<$Res> {
  __$PartCopyWithImpl(this._self, this._then);

  final _Part _self;
  final $Res Function(_Part) _then;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? inlineData = freezed,
    Object? text = freezed,
  }) {
    return _then(_Part(
      inlineData: freezed == inlineData
          ? _self.inlineData
          : inlineData // ignore: cast_nullable_to_non_nullable
              as Blob?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlobCopyWith<$Res>? get inlineData {
    if (_self.inlineData == null) {
      return null;
    }

    return $BlobCopyWith<$Res>(_self.inlineData!, (value) {
      return _then(_self.copyWith(inlineData: value));
    });
  }
}

/// @nodoc
mixin _$Operation {
  /// The server-assigned name, which is only unique within the same service that originally returns it. If you use the default HTTP mapping, the `name` should be a resource name ending with `operations/{unique_id}`.
  @JsonKey(includeIfNull: false)
  String? get name;

  /// The normal, successful response of the operation. If the original method returns no data on success, such as `Delete`, the response is `google.protobuf.Empty`. If the original method is standard `Get`/`Create`/`Update`, the response should be the resource. For other methods, the response should have the type `XxxResponse`, where `Xxx` is the original method name. For example, if the original method name is `TakeSnapshot()`, the inferred response type is `TakeSnapshotResponse`.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get response;

  /// If the value is `false`, it means the operation is still in progress. If `true`, the operation is completed, and either `error` or `response` is available.
  @JsonKey(includeIfNull: false)
  bool? get done;

  /// Service-specific metadata associated with the operation. It typically contains progress information and common metadata such as create time. Some services might not provide such metadata. Any method that returns a long-running operation should document the metadata type, if any.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata;

  /// The error result of the operation in case of failure or cancellation.
  @JsonKey(includeIfNull: false)
  Status? get error;

  /// Create a copy of Operation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OperationCopyWith<Operation> get copyWith =>
      _$OperationCopyWithImpl<Operation>(this as Operation, _$identity);

  /// Serializes this Operation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Operation &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.response, response) &&
            (identical(other.done, done) || other.done == done) &&
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(response),
      done,
      const DeepCollectionEquality().hash(metadata),
      error);

  @override
  String toString() {
    return 'Operation(name: $name, response: $response, done: $done, metadata: $metadata, error: $error)';
  }
}

/// @nodoc
abstract mixin class $OperationCopyWith<$Res> {
  factory $OperationCopyWith(Operation value, $Res Function(Operation) _then) =
      _$OperationCopyWithImpl;
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
class _$OperationCopyWithImpl<$Res> implements $OperationCopyWith<$Res> {
  _$OperationCopyWithImpl(this._self, this._then);

  final Operation _self;
  final $Res Function(Operation) _then;

  /// Create a copy of Operation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? response = freezed,
    Object? done = freezed,
    Object? metadata = freezed,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      done: freezed == done
          ? _self.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as Status?,
    ));
  }

  /// Create a copy of Operation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $StatusCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Operation].
extension OperationPatterns on Operation {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Operation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Operation() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Operation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Operation():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Operation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Operation() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) String? name,
            @JsonKey(includeIfNull: false) Map<String, dynamic>? response,
            @JsonKey(includeIfNull: false) bool? done,
            @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
            @JsonKey(includeIfNull: false) Status? error)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Operation() when $default != null:
        return $default(_that.name, _that.response, _that.done, _that.metadata,
            _that.error);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) String? name,
            @JsonKey(includeIfNull: false) Map<String, dynamic>? response,
            @JsonKey(includeIfNull: false) bool? done,
            @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
            @JsonKey(includeIfNull: false) Status? error)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Operation():
        return $default(_that.name, _that.response, _that.done, _that.metadata,
            _that.error);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) String? name,
            @JsonKey(includeIfNull: false) Map<String, dynamic>? response,
            @JsonKey(includeIfNull: false) bool? done,
            @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
            @JsonKey(includeIfNull: false) Status? error)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Operation() when $default != null:
        return $default(_that.name, _that.response, _that.done, _that.metadata,
            _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Operation extends Operation {
  const _Operation(
      {@JsonKey(includeIfNull: false) this.name,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? response,
      @JsonKey(includeIfNull: false) this.done,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? metadata,
      @JsonKey(includeIfNull: false) this.error})
      : _response = response,
        _metadata = metadata,
        super._();
  factory _Operation.fromJson(Map<String, dynamic> json) =>
      _$OperationFromJson(json);

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

  /// Create a copy of Operation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OperationCopyWith<_Operation> get copyWith =>
      __$OperationCopyWithImpl<_Operation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OperationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Operation &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._response, _response) &&
            (identical(other.done, done) || other.done == done) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_response),
      done,
      const DeepCollectionEquality().hash(_metadata),
      error);

  @override
  String toString() {
    return 'Operation(name: $name, response: $response, done: $done, metadata: $metadata, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$OperationCopyWith<$Res>
    implements $OperationCopyWith<$Res> {
  factory _$OperationCopyWith(
          _Operation value, $Res Function(_Operation) _then) =
      __$OperationCopyWithImpl;
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
class __$OperationCopyWithImpl<$Res> implements _$OperationCopyWith<$Res> {
  __$OperationCopyWithImpl(this._self, this._then);

  final _Operation _self;
  final $Res Function(_Operation) _then;

  /// Create a copy of Operation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? response = freezed,
    Object? done = freezed,
    Object? metadata = freezed,
    Object? error = freezed,
  }) {
    return _then(_Operation(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _self._response
          : response // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      done: freezed == done
          ? _self.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as Status?,
    ));
  }

  /// Create a copy of Operation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res>? get error {
    if (_self.error == null) {
      return null;
    }

    return $StatusCopyWith<$Res>(_self.error!, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// @nodoc
mixin _$Status {
  /// The status code, which should be an enum value of google.rpc.Code.
  @JsonKey(includeIfNull: false)
  int? get code;

  /// A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
  @JsonKey(includeIfNull: false)
  String? get message;

  /// A list of messages that carry the error details. There is a common set of message types for APIs to use.
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>>? get details;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatusCopyWith<Status> get copyWith =>
      _$StatusCopyWithImpl<Status>(this as Status, _$identity);

  /// Serializes this Status to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Status &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.details, details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, message, const DeepCollectionEquality().hash(details));

  @override
  String toString() {
    return 'Status(code: $code, message: $message, details: $details)';
  }
}

/// @nodoc
abstract mixin class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) _then) =
      _$StatusCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? code,
      @JsonKey(includeIfNull: false) String? message,
      @JsonKey(includeIfNull: false) List<Map<String, dynamic>>? details});
}

/// @nodoc
class _$StatusCopyWithImpl<$Res> implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._self, this._then);

  final Status _self;
  final $Res Function(Status) _then;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? details = freezed,
  }) {
    return _then(_self.copyWith(
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Status].
extension StatusPatterns on Status {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Status value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Status() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Status value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Status():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Status value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Status() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) int? code,
            @JsonKey(includeIfNull: false) String? message,
            @JsonKey(includeIfNull: false) List<Map<String, dynamic>>? details)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Status() when $default != null:
        return $default(_that.code, _that.message, _that.details);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) int? code,
            @JsonKey(includeIfNull: false) String? message,
            @JsonKey(includeIfNull: false) List<Map<String, dynamic>>? details)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Status():
        return $default(_that.code, _that.message, _that.details);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) int? code,
            @JsonKey(includeIfNull: false) String? message,
            @JsonKey(includeIfNull: false) List<Map<String, dynamic>>? details)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Status() when $default != null:
        return $default(_that.code, _that.message, _that.details);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Status extends Status {
  const _Status(
      {@JsonKey(includeIfNull: false) this.code,
      @JsonKey(includeIfNull: false) this.message,
      @JsonKey(includeIfNull: false) final List<Map<String, dynamic>>? details})
      : _details = details,
        super._();
  factory _Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  /// The status code, which should be an enum value of google.rpc.Code.
  @override
  @JsonKey(includeIfNull: false)
  final int? code;

  /// A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
  @override
  @JsonKey(includeIfNull: false)
  final String? message;

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

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StatusCopyWith<_Status> get copyWith =>
      __$StatusCopyWithImpl<_Status>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StatusToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Status &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message,
      const DeepCollectionEquality().hash(_details));

  @override
  String toString() {
    return 'Status(code: $code, message: $message, details: $details)';
  }
}

/// @nodoc
abstract mixin class _$StatusCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$StatusCopyWith(_Status value, $Res Function(_Status) _then) =
      __$StatusCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? code,
      @JsonKey(includeIfNull: false) String? message,
      @JsonKey(includeIfNull: false) List<Map<String, dynamic>>? details});
}

/// @nodoc
class __$StatusCopyWithImpl<$Res> implements _$StatusCopyWith<$Res> {
  __$StatusCopyWithImpl(this._self, this._then);

  final _Status _self;
  final $Res Function(_Status) _then;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? details = freezed,
  }) {
    return _then(_Status(
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _self._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc
mixin _$CitationMetadata {
  /// Citations to sources for a specific response.
  @JsonKey(includeIfNull: false)
  List<CitationSource>? get citationSources;

  /// Create a copy of CitationMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CitationMetadataCopyWith<CitationMetadata> get copyWith =>
      _$CitationMetadataCopyWithImpl<CitationMetadata>(
          this as CitationMetadata, _$identity);

  /// Serializes this CitationMetadata to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CitationMetadata &&
            const DeepCollectionEquality()
                .equals(other.citationSources, citationSources));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(citationSources));

  @override
  String toString() {
    return 'CitationMetadata(citationSources: $citationSources)';
  }
}

/// @nodoc
abstract mixin class $CitationMetadataCopyWith<$Res> {
  factory $CitationMetadataCopyWith(
          CitationMetadata value, $Res Function(CitationMetadata) _then) =
      _$CitationMetadataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<CitationSource>? citationSources});
}

/// @nodoc
class _$CitationMetadataCopyWithImpl<$Res>
    implements $CitationMetadataCopyWith<$Res> {
  _$CitationMetadataCopyWithImpl(this._self, this._then);

  final CitationMetadata _self;
  final $Res Function(CitationMetadata) _then;

  /// Create a copy of CitationMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? citationSources = freezed,
  }) {
    return _then(_self.copyWith(
      citationSources: freezed == citationSources
          ? _self.citationSources
          : citationSources // ignore: cast_nullable_to_non_nullable
              as List<CitationSource>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CitationMetadata].
extension CitationMetadataPatterns on CitationMetadata {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CitationMetadata value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CitationMetadata() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CitationMetadata value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CitationMetadata():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CitationMetadata value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CitationMetadata() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false)
            List<CitationSource>? citationSources)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CitationMetadata() when $default != null:
        return $default(_that.citationSources);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false)
            List<CitationSource>? citationSources)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CitationMetadata():
        return $default(_that.citationSources);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false)
            List<CitationSource>? citationSources)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CitationMetadata() when $default != null:
        return $default(_that.citationSources);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CitationMetadata extends CitationMetadata {
  const _CitationMetadata(
      {@JsonKey(includeIfNull: false)
      final List<CitationSource>? citationSources})
      : _citationSources = citationSources,
        super._();
  factory _CitationMetadata.fromJson(Map<String, dynamic> json) =>
      _$CitationMetadataFromJson(json);

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

  /// Create a copy of CitationMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CitationMetadataCopyWith<_CitationMetadata> get copyWith =>
      __$CitationMetadataCopyWithImpl<_CitationMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CitationMetadataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CitationMetadata &&
            const DeepCollectionEquality()
                .equals(other._citationSources, _citationSources));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_citationSources));

  @override
  String toString() {
    return 'CitationMetadata(citationSources: $citationSources)';
  }
}

/// @nodoc
abstract mixin class _$CitationMetadataCopyWith<$Res>
    implements $CitationMetadataCopyWith<$Res> {
  factory _$CitationMetadataCopyWith(
          _CitationMetadata value, $Res Function(_CitationMetadata) _then) =
      __$CitationMetadataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<CitationSource>? citationSources});
}

/// @nodoc
class __$CitationMetadataCopyWithImpl<$Res>
    implements _$CitationMetadataCopyWith<$Res> {
  __$CitationMetadataCopyWithImpl(this._self, this._then);

  final _CitationMetadata _self;
  final $Res Function(_CitationMetadata) _then;

  /// Create a copy of CitationMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? citationSources = freezed,
  }) {
    return _then(_CitationMetadata(
      citationSources: freezed == citationSources
          ? _self._citationSources
          : citationSources // ignore: cast_nullable_to_non_nullable
              as List<CitationSource>?,
    ));
  }
}

/// @nodoc
mixin _$SafetySetting {
  /// Required. The category for this setting.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  SafetySettingCategory? get category;

  /// Required. Controls the probability threshold at which harm is blocked.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  SafetySettingThreshold? get threshold;

  /// Create a copy of SafetySetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SafetySettingCopyWith<SafetySetting> get copyWith =>
      _$SafetySettingCopyWithImpl<SafetySetting>(
          this as SafetySetting, _$identity);

  /// Serializes this SafetySetting to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SafetySetting &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category, threshold);

  @override
  String toString() {
    return 'SafetySetting(category: $category, threshold: $threshold)';
  }
}

/// @nodoc
abstract mixin class $SafetySettingCopyWith<$Res> {
  factory $SafetySettingCopyWith(
          SafetySetting value, $Res Function(SafetySetting) _then) =
      _$SafetySettingCopyWithImpl;
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
class _$SafetySettingCopyWithImpl<$Res>
    implements $SafetySettingCopyWith<$Res> {
  _$SafetySettingCopyWithImpl(this._self, this._then);

  final SafetySetting _self;
  final $Res Function(SafetySetting) _then;

  /// Create a copy of SafetySetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? threshold = freezed,
  }) {
    return _then(_self.copyWith(
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as SafetySettingCategory?,
      threshold: freezed == threshold
          ? _self.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as SafetySettingThreshold?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SafetySetting].
extension SafetySettingPatterns on SafetySetting {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SafetySetting value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SafetySetting() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SafetySetting value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SafetySetting():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SafetySetting value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SafetySetting() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            SafetySettingCategory? category,
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            SafetySettingThreshold? threshold)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SafetySetting() when $default != null:
        return $default(_that.category, _that.threshold);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            SafetySettingCategory? category,
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            SafetySettingThreshold? threshold)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SafetySetting():
        return $default(_that.category, _that.threshold);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            SafetySettingCategory? category,
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            SafetySettingThreshold? threshold)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SafetySetting() when $default != null:
        return $default(_that.category, _that.threshold);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SafetySetting extends SafetySetting {
  const _SafetySetting(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.category,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.threshold})
      : super._();
  factory _SafetySetting.fromJson(Map<String, dynamic> json) =>
      _$SafetySettingFromJson(json);

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

  /// Create a copy of SafetySetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SafetySettingCopyWith<_SafetySetting> get copyWith =>
      __$SafetySettingCopyWithImpl<_SafetySetting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SafetySettingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SafetySetting &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category, threshold);

  @override
  String toString() {
    return 'SafetySetting(category: $category, threshold: $threshold)';
  }
}

/// @nodoc
abstract mixin class _$SafetySettingCopyWith<$Res>
    implements $SafetySettingCopyWith<$Res> {
  factory _$SafetySettingCopyWith(
          _SafetySetting value, $Res Function(_SafetySetting) _then) =
      __$SafetySettingCopyWithImpl;
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
class __$SafetySettingCopyWithImpl<$Res>
    implements _$SafetySettingCopyWith<$Res> {
  __$SafetySettingCopyWithImpl(this._self, this._then);

  final _SafetySetting _self;
  final $Res Function(_SafetySetting) _then;

  /// Create a copy of SafetySetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = freezed,
    Object? threshold = freezed,
  }) {
    return _then(_SafetySetting(
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as SafetySettingCategory?,
      threshold: freezed == threshold
          ? _self.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as SafetySettingThreshold?,
    ));
  }
}

/// @nodoc
mixin _$CitationSource {
  /// Optional. License for the GitHub project that is attributed as a source for segment. License info is required for code citations.
  @JsonKey(includeIfNull: false)
  String? get license;

  /// Optional. URI that is attributed as a source for a portion of the text.
  @JsonKey(includeIfNull: false)
  String? get uri;

  /// Optional. End of the attributed segment, exclusive.
  @JsonKey(includeIfNull: false)
  int? get endIndex;

  /// Optional. Start of segment of the response that is attributed to this source. Index indicates the start of the segment, measured in bytes.
  @JsonKey(includeIfNull: false)
  int? get startIndex;

  /// Create a copy of CitationSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CitationSourceCopyWith<CitationSource> get copyWith =>
      _$CitationSourceCopyWithImpl<CitationSource>(
          this as CitationSource, _$identity);

  /// Serializes this CitationSource to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CitationSource &&
            (identical(other.license, license) || other.license == license) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.endIndex, endIndex) ||
                other.endIndex == endIndex) &&
            (identical(other.startIndex, startIndex) ||
                other.startIndex == startIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, license, uri, endIndex, startIndex);

  @override
  String toString() {
    return 'CitationSource(license: $license, uri: $uri, endIndex: $endIndex, startIndex: $startIndex)';
  }
}

/// @nodoc
abstract mixin class $CitationSourceCopyWith<$Res> {
  factory $CitationSourceCopyWith(
          CitationSource value, $Res Function(CitationSource) _then) =
      _$CitationSourceCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? license,
      @JsonKey(includeIfNull: false) String? uri,
      @JsonKey(includeIfNull: false) int? endIndex,
      @JsonKey(includeIfNull: false) int? startIndex});
}

/// @nodoc
class _$CitationSourceCopyWithImpl<$Res>
    implements $CitationSourceCopyWith<$Res> {
  _$CitationSourceCopyWithImpl(this._self, this._then);

  final CitationSource _self;
  final $Res Function(CitationSource) _then;

  /// Create a copy of CitationSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? license = freezed,
    Object? uri = freezed,
    Object? endIndex = freezed,
    Object? startIndex = freezed,
  }) {
    return _then(_self.copyWith(
      license: freezed == license
          ? _self.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: freezed == uri
          ? _self.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
      endIndex: freezed == endIndex
          ? _self.endIndex
          : endIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      startIndex: freezed == startIndex
          ? _self.startIndex
          : startIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CitationSource].
extension CitationSourcePatterns on CitationSource {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CitationSource value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CitationSource() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CitationSource value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CitationSource():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CitationSource value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CitationSource() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) String? license,
            @JsonKey(includeIfNull: false) String? uri,
            @JsonKey(includeIfNull: false) int? endIndex,
            @JsonKey(includeIfNull: false) int? startIndex)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CitationSource() when $default != null:
        return $default(
            _that.license, _that.uri, _that.endIndex, _that.startIndex);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) String? license,
            @JsonKey(includeIfNull: false) String? uri,
            @JsonKey(includeIfNull: false) int? endIndex,
            @JsonKey(includeIfNull: false) int? startIndex)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CitationSource():
        return $default(
            _that.license, _that.uri, _that.endIndex, _that.startIndex);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) String? license,
            @JsonKey(includeIfNull: false) String? uri,
            @JsonKey(includeIfNull: false) int? endIndex,
            @JsonKey(includeIfNull: false) int? startIndex)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CitationSource() when $default != null:
        return $default(
            _that.license, _that.uri, _that.endIndex, _that.startIndex);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CitationSource extends CitationSource {
  const _CitationSource(
      {@JsonKey(includeIfNull: false) this.license,
      @JsonKey(includeIfNull: false) this.uri,
      @JsonKey(includeIfNull: false) this.endIndex,
      @JsonKey(includeIfNull: false) this.startIndex})
      : super._();
  factory _CitationSource.fromJson(Map<String, dynamic> json) =>
      _$CitationSourceFromJson(json);

  /// Optional. License for the GitHub project that is attributed as a source for segment. License info is required for code citations.
  @override
  @JsonKey(includeIfNull: false)
  final String? license;

  /// Optional. URI that is attributed as a source for a portion of the text.
  @override
  @JsonKey(includeIfNull: false)
  final String? uri;

  /// Optional. End of the attributed segment, exclusive.
  @override
  @JsonKey(includeIfNull: false)
  final int? endIndex;

  /// Optional. Start of segment of the response that is attributed to this source. Index indicates the start of the segment, measured in bytes.
  @override
  @JsonKey(includeIfNull: false)
  final int? startIndex;

  /// Create a copy of CitationSource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CitationSourceCopyWith<_CitationSource> get copyWith =>
      __$CitationSourceCopyWithImpl<_CitationSource>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CitationSourceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CitationSource &&
            (identical(other.license, license) || other.license == license) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.endIndex, endIndex) ||
                other.endIndex == endIndex) &&
            (identical(other.startIndex, startIndex) ||
                other.startIndex == startIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, license, uri, endIndex, startIndex);

  @override
  String toString() {
    return 'CitationSource(license: $license, uri: $uri, endIndex: $endIndex, startIndex: $startIndex)';
  }
}

/// @nodoc
abstract mixin class _$CitationSourceCopyWith<$Res>
    implements $CitationSourceCopyWith<$Res> {
  factory _$CitationSourceCopyWith(
          _CitationSource value, $Res Function(_CitationSource) _then) =
      __$CitationSourceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? license,
      @JsonKey(includeIfNull: false) String? uri,
      @JsonKey(includeIfNull: false) int? endIndex,
      @JsonKey(includeIfNull: false) int? startIndex});
}

/// @nodoc
class __$CitationSourceCopyWithImpl<$Res>
    implements _$CitationSourceCopyWith<$Res> {
  __$CitationSourceCopyWithImpl(this._self, this._then);

  final _CitationSource _self;
  final $Res Function(_CitationSource) _then;

  /// Create a copy of CitationSource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? license = freezed,
    Object? uri = freezed,
    Object? endIndex = freezed,
    Object? startIndex = freezed,
  }) {
    return _then(_CitationSource(
      license: freezed == license
          ? _self.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: freezed == uri
          ? _self.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
      endIndex: freezed == endIndex
          ? _self.endIndex
          : endIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      startIndex: freezed == startIndex
          ? _self.startIndex
          : startIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$GenerationConfig {
  /// Optional. Controls the randomness of the output. Note: The default value varies by model, see the `Model.temperature` attribute of the `Model` returned from the `getModel` function. Values can range from [0.0, infinity).
  @JsonKey(includeIfNull: false)
  double? get temperature;

  /// Optional. The set of character sequences (up to 5) that will stop output generation. If specified, the API will stop at the first appearance of a stop sequence. The stop sequence will not be included as part of the response.
  @JsonKey(includeIfNull: false)
  List<String>? get stopSequences;

  /// Optional. The maximum number of tokens to consider when sampling. The model uses combined Top-k and nucleus sampling. Top-k sampling considers the set of `top_k` most probable tokens. Note: The default value varies by model, see the `Model.top_k` attribute of the `Model` returned from the `getModel` function.
  @JsonKey(includeIfNull: false)
  int? get topK;

  /// Optional. The maximum cumulative probability of tokens to consider when sampling. The model uses combined Top-k and nucleus sampling. Tokens are sorted based on their assigned probabilities so that only the most likely tokens are considered. Top-k sampling directly limits the maximum number of tokens to consider, while Nucleus sampling limits number of tokens based on the cumulative probability. Note: The default value varies by model, see the `Model.top_p` attribute of the `Model` returned from the `getModel` function.
  @JsonKey(includeIfNull: false)
  double? get topP;

  /// Optional. Number of generated responses to return. Currently, this value can only be set to 1. If unset, this will default to 1.
  @JsonKey(includeIfNull: false)
  int? get candidateCount;

  /// Optional. The maximum number of tokens to include in a candidate. Note: The default value varies by model, see the `Model.output_token_limit` attribute of the `Model` returned from the `getModel` function.
  @JsonKey(includeIfNull: false)
  int? get maxOutputTokens;

  /// Create a copy of GenerationConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenerationConfigCopyWith<GenerationConfig> get copyWith =>
      _$GenerationConfigCopyWithImpl<GenerationConfig>(
          this as GenerationConfig, _$identity);

  /// Serializes this GenerationConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenerationConfig &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            const DeepCollectionEquality()
                .equals(other.stopSequences, stopSequences) &&
            (identical(other.topK, topK) || other.topK == topK) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.candidateCount, candidateCount) ||
                other.candidateCount == candidateCount) &&
            (identical(other.maxOutputTokens, maxOutputTokens) ||
                other.maxOutputTokens == maxOutputTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      temperature,
      const DeepCollectionEquality().hash(stopSequences),
      topK,
      topP,
      candidateCount,
      maxOutputTokens);

  @override
  String toString() {
    return 'GenerationConfig(temperature: $temperature, stopSequences: $stopSequences, topK: $topK, topP: $topP, candidateCount: $candidateCount, maxOutputTokens: $maxOutputTokens)';
  }
}

/// @nodoc
abstract mixin class $GenerationConfigCopyWith<$Res> {
  factory $GenerationConfigCopyWith(
          GenerationConfig value, $Res Function(GenerationConfig) _then) =
      _$GenerationConfigCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(includeIfNull: false) List<String>? stopSequences,
      @JsonKey(includeIfNull: false) int? topK,
      @JsonKey(includeIfNull: false) double? topP,
      @JsonKey(includeIfNull: false) int? candidateCount,
      @JsonKey(includeIfNull: false) int? maxOutputTokens});
}

/// @nodoc
class _$GenerationConfigCopyWithImpl<$Res>
    implements $GenerationConfigCopyWith<$Res> {
  _$GenerationConfigCopyWithImpl(this._self, this._then);

  final GenerationConfig _self;
  final $Res Function(GenerationConfig) _then;

  /// Create a copy of GenerationConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = freezed,
    Object? stopSequences = freezed,
    Object? topK = freezed,
    Object? topP = freezed,
    Object? candidateCount = freezed,
    Object? maxOutputTokens = freezed,
  }) {
    return _then(_self.copyWith(
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      stopSequences: freezed == stopSequences
          ? _self.stopSequences
          : stopSequences // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      topK: freezed == topK
          ? _self.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      topP: freezed == topP
          ? _self.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      candidateCount: freezed == candidateCount
          ? _self.candidateCount
          : candidateCount // ignore: cast_nullable_to_non_nullable
              as int?,
      maxOutputTokens: freezed == maxOutputTokens
          ? _self.maxOutputTokens
          : maxOutputTokens // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [GenerationConfig].
extension GenerationConfigPatterns on GenerationConfig {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GenerationConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GenerationConfig() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GenerationConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerationConfig():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GenerationConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerationConfig() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) double? temperature,
            @JsonKey(includeIfNull: false) List<String>? stopSequences,
            @JsonKey(includeIfNull: false) int? topK,
            @JsonKey(includeIfNull: false) double? topP,
            @JsonKey(includeIfNull: false) int? candidateCount,
            @JsonKey(includeIfNull: false) int? maxOutputTokens)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GenerationConfig() when $default != null:
        return $default(_that.temperature, _that.stopSequences, _that.topK,
            _that.topP, _that.candidateCount, _that.maxOutputTokens);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) double? temperature,
            @JsonKey(includeIfNull: false) List<String>? stopSequences,
            @JsonKey(includeIfNull: false) int? topK,
            @JsonKey(includeIfNull: false) double? topP,
            @JsonKey(includeIfNull: false) int? candidateCount,
            @JsonKey(includeIfNull: false) int? maxOutputTokens)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerationConfig():
        return $default(_that.temperature, _that.stopSequences, _that.topK,
            _that.topP, _that.candidateCount, _that.maxOutputTokens);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) double? temperature,
            @JsonKey(includeIfNull: false) List<String>? stopSequences,
            @JsonKey(includeIfNull: false) int? topK,
            @JsonKey(includeIfNull: false) double? topP,
            @JsonKey(includeIfNull: false) int? candidateCount,
            @JsonKey(includeIfNull: false) int? maxOutputTokens)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerationConfig() when $default != null:
        return $default(_that.temperature, _that.stopSequences, _that.topK,
            _that.topP, _that.candidateCount, _that.maxOutputTokens);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GenerationConfig extends GenerationConfig {
  const _GenerationConfig(
      {@JsonKey(includeIfNull: false) this.temperature,
      @JsonKey(includeIfNull: false) final List<String>? stopSequences,
      @JsonKey(includeIfNull: false) this.topK,
      @JsonKey(includeIfNull: false) this.topP,
      @JsonKey(includeIfNull: false) this.candidateCount,
      @JsonKey(includeIfNull: false) this.maxOutputTokens})
      : _stopSequences = stopSequences,
        super._();
  factory _GenerationConfig.fromJson(Map<String, dynamic> json) =>
      _$GenerationConfigFromJson(json);

  /// Optional. Controls the randomness of the output. Note: The default value varies by model, see the `Model.temperature` attribute of the `Model` returned from the `getModel` function. Values can range from [0.0, infinity).
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

  /// Optional. The maximum number of tokens to consider when sampling. The model uses combined Top-k and nucleus sampling. Top-k sampling considers the set of `top_k` most probable tokens. Note: The default value varies by model, see the `Model.top_k` attribute of the `Model` returned from the `getModel` function.
  @override
  @JsonKey(includeIfNull: false)
  final int? topK;

  /// Optional. The maximum cumulative probability of tokens to consider when sampling. The model uses combined Top-k and nucleus sampling. Tokens are sorted based on their assigned probabilities so that only the most likely tokens are considered. Top-k sampling directly limits the maximum number of tokens to consider, while Nucleus sampling limits number of tokens based on the cumulative probability. Note: The default value varies by model, see the `Model.top_p` attribute of the `Model` returned from the `getModel` function.
  @override
  @JsonKey(includeIfNull: false)
  final double? topP;

  /// Optional. Number of generated responses to return. Currently, this value can only be set to 1. If unset, this will default to 1.
  @override
  @JsonKey(includeIfNull: false)
  final int? candidateCount;

  /// Optional. The maximum number of tokens to include in a candidate. Note: The default value varies by model, see the `Model.output_token_limit` attribute of the `Model` returned from the `getModel` function.
  @override
  @JsonKey(includeIfNull: false)
  final int? maxOutputTokens;

  /// Create a copy of GenerationConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GenerationConfigCopyWith<_GenerationConfig> get copyWith =>
      __$GenerationConfigCopyWithImpl<_GenerationConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GenerationConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GenerationConfig &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            const DeepCollectionEquality()
                .equals(other._stopSequences, _stopSequences) &&
            (identical(other.topK, topK) || other.topK == topK) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.candidateCount, candidateCount) ||
                other.candidateCount == candidateCount) &&
            (identical(other.maxOutputTokens, maxOutputTokens) ||
                other.maxOutputTokens == maxOutputTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      temperature,
      const DeepCollectionEquality().hash(_stopSequences),
      topK,
      topP,
      candidateCount,
      maxOutputTokens);

  @override
  String toString() {
    return 'GenerationConfig(temperature: $temperature, stopSequences: $stopSequences, topK: $topK, topP: $topP, candidateCount: $candidateCount, maxOutputTokens: $maxOutputTokens)';
  }
}

/// @nodoc
abstract mixin class _$GenerationConfigCopyWith<$Res>
    implements $GenerationConfigCopyWith<$Res> {
  factory _$GenerationConfigCopyWith(
          _GenerationConfig value, $Res Function(_GenerationConfig) _then) =
      __$GenerationConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(includeIfNull: false) List<String>? stopSequences,
      @JsonKey(includeIfNull: false) int? topK,
      @JsonKey(includeIfNull: false) double? topP,
      @JsonKey(includeIfNull: false) int? candidateCount,
      @JsonKey(includeIfNull: false) int? maxOutputTokens});
}

/// @nodoc
class __$GenerationConfigCopyWithImpl<$Res>
    implements _$GenerationConfigCopyWith<$Res> {
  __$GenerationConfigCopyWithImpl(this._self, this._then);

  final _GenerationConfig _self;
  final $Res Function(_GenerationConfig) _then;

  /// Create a copy of GenerationConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? temperature = freezed,
    Object? stopSequences = freezed,
    Object? topK = freezed,
    Object? topP = freezed,
    Object? candidateCount = freezed,
    Object? maxOutputTokens = freezed,
  }) {
    return _then(_GenerationConfig(
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      stopSequences: freezed == stopSequences
          ? _self._stopSequences
          : stopSequences // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      topK: freezed == topK
          ? _self.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      topP: freezed == topP
          ? _self.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      candidateCount: freezed == candidateCount
          ? _self.candidateCount
          : candidateCount // ignore: cast_nullable_to_non_nullable
              as int?,
      maxOutputTokens: freezed == maxOutputTokens
          ? _self.maxOutputTokens
          : maxOutputTokens // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$CountTokensRequest {
  /// Required. The input given to the model as a prompt.
  @JsonKey(includeIfNull: false)
  List<Content>? get contents;

  /// Create a copy of CountTokensRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CountTokensRequestCopyWith<CountTokensRequest> get copyWith =>
      _$CountTokensRequestCopyWithImpl<CountTokensRequest>(
          this as CountTokensRequest, _$identity);

  /// Serializes this CountTokensRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CountTokensRequest &&
            const DeepCollectionEquality().equals(other.contents, contents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(contents));

  @override
  String toString() {
    return 'CountTokensRequest(contents: $contents)';
  }
}

/// @nodoc
abstract mixin class $CountTokensRequestCopyWith<$Res> {
  factory $CountTokensRequestCopyWith(
          CountTokensRequest value, $Res Function(CountTokensRequest) _then) =
      _$CountTokensRequestCopyWithImpl;
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<Content>? contents});
}

/// @nodoc
class _$CountTokensRequestCopyWithImpl<$Res>
    implements $CountTokensRequestCopyWith<$Res> {
  _$CountTokensRequestCopyWithImpl(this._self, this._then);

  final CountTokensRequest _self;
  final $Res Function(CountTokensRequest) _then;

  /// Create a copy of CountTokensRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = freezed,
  }) {
    return _then(_self.copyWith(
      contents: freezed == contents
          ? _self.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CountTokensRequest].
extension CountTokensRequestPatterns on CountTokensRequest {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CountTokensRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CountTokensRequest() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CountTokensRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountTokensRequest():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CountTokensRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountTokensRequest() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) List<Content>? contents)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CountTokensRequest() when $default != null:
        return $default(_that.contents);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) List<Content>? contents)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountTokensRequest():
        return $default(_that.contents);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(includeIfNull: false) List<Content>? contents)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountTokensRequest() when $default != null:
        return $default(_that.contents);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CountTokensRequest extends CountTokensRequest {
  const _CountTokensRequest(
      {@JsonKey(includeIfNull: false) final List<Content>? contents})
      : _contents = contents,
        super._();
  factory _CountTokensRequest.fromJson(Map<String, dynamic> json) =>
      _$CountTokensRequestFromJson(json);

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

  /// Create a copy of CountTokensRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CountTokensRequestCopyWith<_CountTokensRequest> get copyWith =>
      __$CountTokensRequestCopyWithImpl<_CountTokensRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CountTokensRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CountTokensRequest &&
            const DeepCollectionEquality().equals(other._contents, _contents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_contents));

  @override
  String toString() {
    return 'CountTokensRequest(contents: $contents)';
  }
}

/// @nodoc
abstract mixin class _$CountTokensRequestCopyWith<$Res>
    implements $CountTokensRequestCopyWith<$Res> {
  factory _$CountTokensRequestCopyWith(
          _CountTokensRequest value, $Res Function(_CountTokensRequest) _then) =
      __$CountTokensRequestCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<Content>? contents});
}

/// @nodoc
class __$CountTokensRequestCopyWithImpl<$Res>
    implements _$CountTokensRequestCopyWith<$Res> {
  __$CountTokensRequestCopyWithImpl(this._self, this._then);

  final _CountTokensRequest _self;
  final $Res Function(_CountTokensRequest) _then;

  /// Create a copy of CountTokensRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? contents = freezed,
  }) {
    return _then(_CountTokensRequest(
      contents: freezed == contents
          ? _self._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
    ));
  }
}

/// @nodoc
mixin _$TuningSnapshot {
  /// Output only. The tuning step.
  @JsonKey(includeIfNull: false)
  int? get step;

  /// Output only. The timestamp when this metric was computed.
  @JsonKey(includeIfNull: false)
  String? get computeTime;

  /// Output only. The epoch this step was part of.
  @JsonKey(includeIfNull: false)
  int? get epoch;

  /// Output only. The mean loss of the training examples for this step.
  @JsonKey(includeIfNull: false)
  double? get meanLoss;

  /// Create a copy of TuningSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TuningSnapshotCopyWith<TuningSnapshot> get copyWith =>
      _$TuningSnapshotCopyWithImpl<TuningSnapshot>(
          this as TuningSnapshot, _$identity);

  /// Serializes this TuningSnapshot to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TuningSnapshot &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.computeTime, computeTime) ||
                other.computeTime == computeTime) &&
            (identical(other.epoch, epoch) || other.epoch == epoch) &&
            (identical(other.meanLoss, meanLoss) ||
                other.meanLoss == meanLoss));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, step, computeTime, epoch, meanLoss);

  @override
  String toString() {
    return 'TuningSnapshot(step: $step, computeTime: $computeTime, epoch: $epoch, meanLoss: $meanLoss)';
  }
}

/// @nodoc
abstract mixin class $TuningSnapshotCopyWith<$Res> {
  factory $TuningSnapshotCopyWith(
          TuningSnapshot value, $Res Function(TuningSnapshot) _then) =
      _$TuningSnapshotCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? step,
      @JsonKey(includeIfNull: false) String? computeTime,
      @JsonKey(includeIfNull: false) int? epoch,
      @JsonKey(includeIfNull: false) double? meanLoss});
}

/// @nodoc
class _$TuningSnapshotCopyWithImpl<$Res>
    implements $TuningSnapshotCopyWith<$Res> {
  _$TuningSnapshotCopyWithImpl(this._self, this._then);

  final TuningSnapshot _self;
  final $Res Function(TuningSnapshot) _then;

  /// Create a copy of TuningSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = freezed,
    Object? computeTime = freezed,
    Object? epoch = freezed,
    Object? meanLoss = freezed,
  }) {
    return _then(_self.copyWith(
      step: freezed == step
          ? _self.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      computeTime: freezed == computeTime
          ? _self.computeTime
          : computeTime // ignore: cast_nullable_to_non_nullable
              as String?,
      epoch: freezed == epoch
          ? _self.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as int?,
      meanLoss: freezed == meanLoss
          ? _self.meanLoss
          : meanLoss // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TuningSnapshot].
extension TuningSnapshotPatterns on TuningSnapshot {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TuningSnapshot value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TuningSnapshot() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TuningSnapshot value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TuningSnapshot():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TuningSnapshot value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TuningSnapshot() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) int? step,
            @JsonKey(includeIfNull: false) String? computeTime,
            @JsonKey(includeIfNull: false) int? epoch,
            @JsonKey(includeIfNull: false) double? meanLoss)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TuningSnapshot() when $default != null:
        return $default(
            _that.step, _that.computeTime, _that.epoch, _that.meanLoss);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) int? step,
            @JsonKey(includeIfNull: false) String? computeTime,
            @JsonKey(includeIfNull: false) int? epoch,
            @JsonKey(includeIfNull: false) double? meanLoss)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TuningSnapshot():
        return $default(
            _that.step, _that.computeTime, _that.epoch, _that.meanLoss);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) int? step,
            @JsonKey(includeIfNull: false) String? computeTime,
            @JsonKey(includeIfNull: false) int? epoch,
            @JsonKey(includeIfNull: false) double? meanLoss)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TuningSnapshot() when $default != null:
        return $default(
            _that.step, _that.computeTime, _that.epoch, _that.meanLoss);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TuningSnapshot extends TuningSnapshot {
  const _TuningSnapshot(
      {@JsonKey(includeIfNull: false) this.step,
      @JsonKey(includeIfNull: false) this.computeTime,
      @JsonKey(includeIfNull: false) this.epoch,
      @JsonKey(includeIfNull: false) this.meanLoss})
      : super._();
  factory _TuningSnapshot.fromJson(Map<String, dynamic> json) =>
      _$TuningSnapshotFromJson(json);

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

  /// Create a copy of TuningSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TuningSnapshotCopyWith<_TuningSnapshot> get copyWith =>
      __$TuningSnapshotCopyWithImpl<_TuningSnapshot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TuningSnapshotToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TuningSnapshot &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.computeTime, computeTime) ||
                other.computeTime == computeTime) &&
            (identical(other.epoch, epoch) || other.epoch == epoch) &&
            (identical(other.meanLoss, meanLoss) ||
                other.meanLoss == meanLoss));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, step, computeTime, epoch, meanLoss);

  @override
  String toString() {
    return 'TuningSnapshot(step: $step, computeTime: $computeTime, epoch: $epoch, meanLoss: $meanLoss)';
  }
}

/// @nodoc
abstract mixin class _$TuningSnapshotCopyWith<$Res>
    implements $TuningSnapshotCopyWith<$Res> {
  factory _$TuningSnapshotCopyWith(
          _TuningSnapshot value, $Res Function(_TuningSnapshot) _then) =
      __$TuningSnapshotCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? step,
      @JsonKey(includeIfNull: false) String? computeTime,
      @JsonKey(includeIfNull: false) int? epoch,
      @JsonKey(includeIfNull: false) double? meanLoss});
}

/// @nodoc
class __$TuningSnapshotCopyWithImpl<$Res>
    implements _$TuningSnapshotCopyWith<$Res> {
  __$TuningSnapshotCopyWithImpl(this._self, this._then);

  final _TuningSnapshot _self;
  final $Res Function(_TuningSnapshot) _then;

  /// Create a copy of TuningSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? step = freezed,
    Object? computeTime = freezed,
    Object? epoch = freezed,
    Object? meanLoss = freezed,
  }) {
    return _then(_TuningSnapshot(
      step: freezed == step
          ? _self.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      computeTime: freezed == computeTime
          ? _self.computeTime
          : computeTime // ignore: cast_nullable_to_non_nullable
              as String?,
      epoch: freezed == epoch
          ? _self.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as int?,
      meanLoss: freezed == meanLoss
          ? _self.meanLoss
          : meanLoss // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$Blob {
  /// The IANA standard MIME type of the source data. Accepted types include: "image/png", "image/jpeg", "image/heic", "image/heif", "image/webp".
  @JsonKey(includeIfNull: false)
  String? get mimeType;

  /// Raw bytes for media formats.
  @JsonKey(includeIfNull: false)
  String? get data;

  /// Create a copy of Blob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BlobCopyWith<Blob> get copyWith =>
      _$BlobCopyWithImpl<Blob>(this as Blob, _$identity);

  /// Serializes this Blob to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Blob &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mimeType, data);

  @override
  String toString() {
    return 'Blob(mimeType: $mimeType, data: $data)';
  }
}

/// @nodoc
abstract mixin class $BlobCopyWith<$Res> {
  factory $BlobCopyWith(Blob value, $Res Function(Blob) _then) =
      _$BlobCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? mimeType,
      @JsonKey(includeIfNull: false) String? data});
}

/// @nodoc
class _$BlobCopyWithImpl<$Res> implements $BlobCopyWith<$Res> {
  _$BlobCopyWithImpl(this._self, this._then);

  final Blob _self;
  final $Res Function(Blob) _then;

  /// Create a copy of Blob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mimeType = freezed,
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      mimeType: freezed == mimeType
          ? _self.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Blob].
extension BlobPatterns on Blob {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Blob value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Blob() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Blob value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Blob():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Blob value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Blob() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) String? mimeType,
            @JsonKey(includeIfNull: false) String? data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Blob() when $default != null:
        return $default(_that.mimeType, _that.data);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) String? mimeType,
            @JsonKey(includeIfNull: false) String? data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Blob():
        return $default(_that.mimeType, _that.data);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(includeIfNull: false) String? mimeType,
            @JsonKey(includeIfNull: false) String? data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Blob() when $default != null:
        return $default(_that.mimeType, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Blob extends Blob {
  const _Blob(
      {@JsonKey(includeIfNull: false) this.mimeType,
      @JsonKey(includeIfNull: false) this.data})
      : super._();
  factory _Blob.fromJson(Map<String, dynamic> json) => _$BlobFromJson(json);

  /// The IANA standard MIME type of the source data. Accepted types include: "image/png", "image/jpeg", "image/heic", "image/heif", "image/webp".
  @override
  @JsonKey(includeIfNull: false)
  final String? mimeType;

  /// Raw bytes for media formats.
  @override
  @JsonKey(includeIfNull: false)
  final String? data;

  /// Create a copy of Blob
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BlobCopyWith<_Blob> get copyWith =>
      __$BlobCopyWithImpl<_Blob>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BlobToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Blob &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mimeType, data);

  @override
  String toString() {
    return 'Blob(mimeType: $mimeType, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$BlobCopyWith<$Res> implements $BlobCopyWith<$Res> {
  factory _$BlobCopyWith(_Blob value, $Res Function(_Blob) _then) =
      __$BlobCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? mimeType,
      @JsonKey(includeIfNull: false) String? data});
}

/// @nodoc
class __$BlobCopyWithImpl<$Res> implements _$BlobCopyWith<$Res> {
  __$BlobCopyWithImpl(this._self, this._then);

  final _Blob _self;
  final $Res Function(_Blob) _then;

  /// Create a copy of Blob
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mimeType = freezed,
    Object? data = freezed,
  }) {
    return _then(_Blob(
      mimeType: freezed == mimeType
          ? _self.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ListModelsResponse {
  /// The returned Models.
  @JsonKey(includeIfNull: false)
  List<Model>? get models;

  /// A token, which can be sent as `page_token` to retrieve the next page. If this field is omitted, there are no more pages.
  @JsonKey(includeIfNull: false)
  String? get nextPageToken;

  /// Create a copy of ListModelsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListModelsResponseCopyWith<ListModelsResponse> get copyWith =>
      _$ListModelsResponseCopyWithImpl<ListModelsResponse>(
          this as ListModelsResponse, _$identity);

  /// Serializes this ListModelsResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListModelsResponse &&
            const DeepCollectionEquality().equals(other.models, models) &&
            (identical(other.nextPageToken, nextPageToken) ||
                other.nextPageToken == nextPageToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(models), nextPageToken);

  @override
  String toString() {
    return 'ListModelsResponse(models: $models, nextPageToken: $nextPageToken)';
  }
}

/// @nodoc
abstract mixin class $ListModelsResponseCopyWith<$Res> {
  factory $ListModelsResponseCopyWith(
          ListModelsResponse value, $Res Function(ListModelsResponse) _then) =
      _$ListModelsResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<Model>? models,
      @JsonKey(includeIfNull: false) String? nextPageToken});
}

/// @nodoc
class _$ListModelsResponseCopyWithImpl<$Res>
    implements $ListModelsResponseCopyWith<$Res> {
  _$ListModelsResponseCopyWithImpl(this._self, this._then);

  final ListModelsResponse _self;
  final $Res Function(ListModelsResponse) _then;

  /// Create a copy of ListModelsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? models = freezed,
    Object? nextPageToken = freezed,
  }) {
    return _then(_self.copyWith(
      models: freezed == models
          ? _self.models
          : models // ignore: cast_nullable_to_non_nullable
              as List<Model>?,
      nextPageToken: freezed == nextPageToken
          ? _self.nextPageToken
          : nextPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ListModelsResponse].
extension ListModelsResponsePatterns on ListModelsResponse {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ListModelsResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListModelsResponse() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ListModelsResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListModelsResponse():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ListModelsResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListModelsResponse() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) List<Model>? models,
            @JsonKey(includeIfNull: false) String? nextPageToken)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListModelsResponse() when $default != null:
        return $default(_that.models, _that.nextPageToken);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) List<Model>? models,
            @JsonKey(includeIfNull: false) String? nextPageToken)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListModelsResponse():
        return $default(_that.models, _that.nextPageToken);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(includeIfNull: false) List<Model>? models,
            @JsonKey(includeIfNull: false) String? nextPageToken)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListModelsResponse() when $default != null:
        return $default(_that.models, _that.nextPageToken);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ListModelsResponse extends ListModelsResponse {
  const _ListModelsResponse(
      {@JsonKey(includeIfNull: false) final List<Model>? models,
      @JsonKey(includeIfNull: false) this.nextPageToken})
      : _models = models,
        super._();
  factory _ListModelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListModelsResponseFromJson(json);

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

  /// A token, which can be sent as `page_token` to retrieve the next page. If this field is omitted, there are no more pages.
  @override
  @JsonKey(includeIfNull: false)
  final String? nextPageToken;

  /// Create a copy of ListModelsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListModelsResponseCopyWith<_ListModelsResponse> get copyWith =>
      __$ListModelsResponseCopyWithImpl<_ListModelsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListModelsResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListModelsResponse &&
            const DeepCollectionEquality().equals(other._models, _models) &&
            (identical(other.nextPageToken, nextPageToken) ||
                other.nextPageToken == nextPageToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_models), nextPageToken);

  @override
  String toString() {
    return 'ListModelsResponse(models: $models, nextPageToken: $nextPageToken)';
  }
}

/// @nodoc
abstract mixin class _$ListModelsResponseCopyWith<$Res>
    implements $ListModelsResponseCopyWith<$Res> {
  factory _$ListModelsResponseCopyWith(
          _ListModelsResponse value, $Res Function(_ListModelsResponse) _then) =
      __$ListModelsResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<Model>? models,
      @JsonKey(includeIfNull: false) String? nextPageToken});
}

/// @nodoc
class __$ListModelsResponseCopyWithImpl<$Res>
    implements _$ListModelsResponseCopyWith<$Res> {
  __$ListModelsResponseCopyWithImpl(this._self, this._then);

  final _ListModelsResponse _self;
  final $Res Function(_ListModelsResponse) _then;

  /// Create a copy of ListModelsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? models = freezed,
    Object? nextPageToken = freezed,
  }) {
    return _then(_ListModelsResponse(
      models: freezed == models
          ? _self._models
          : models // ignore: cast_nullable_to_non_nullable
              as List<Model>?,
      nextPageToken: freezed == nextPageToken
          ? _self.nextPageToken
          : nextPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ContentEmbedding {
  /// The embedding values.
  @JsonKey(includeIfNull: false)
  List<double>? get values;

  /// Create a copy of ContentEmbedding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentEmbeddingCopyWith<ContentEmbedding> get copyWith =>
      _$ContentEmbeddingCopyWithImpl<ContentEmbedding>(
          this as ContentEmbedding, _$identity);

  /// Serializes this ContentEmbedding to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentEmbedding &&
            const DeepCollectionEquality().equals(other.values, values));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(values));

  @override
  String toString() {
    return 'ContentEmbedding(values: $values)';
  }
}

/// @nodoc
abstract mixin class $ContentEmbeddingCopyWith<$Res> {
  factory $ContentEmbeddingCopyWith(
          ContentEmbedding value, $Res Function(ContentEmbedding) _then) =
      _$ContentEmbeddingCopyWithImpl;
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<double>? values});
}

/// @nodoc
class _$ContentEmbeddingCopyWithImpl<$Res>
    implements $ContentEmbeddingCopyWith<$Res> {
  _$ContentEmbeddingCopyWithImpl(this._self, this._then);

  final ContentEmbedding _self;
  final $Res Function(ContentEmbedding) _then;

  /// Create a copy of ContentEmbedding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = freezed,
  }) {
    return _then(_self.copyWith(
      values: freezed == values
          ? _self.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ContentEmbedding].
extension ContentEmbeddingPatterns on ContentEmbedding {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ContentEmbedding value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentEmbedding() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ContentEmbedding value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentEmbedding():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ContentEmbedding value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentEmbedding() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) List<double>? values)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentEmbedding() when $default != null:
        return $default(_that.values);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) List<double>? values)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentEmbedding():
        return $default(_that.values);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(includeIfNull: false) List<double>? values)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentEmbedding() when $default != null:
        return $default(_that.values);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ContentEmbedding extends ContentEmbedding {
  const _ContentEmbedding(
      {@JsonKey(includeIfNull: false) final List<double>? values})
      : _values = values,
        super._();
  factory _ContentEmbedding.fromJson(Map<String, dynamic> json) =>
      _$ContentEmbeddingFromJson(json);

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

  /// Create a copy of ContentEmbedding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContentEmbeddingCopyWith<_ContentEmbedding> get copyWith =>
      __$ContentEmbeddingCopyWithImpl<_ContentEmbedding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContentEmbeddingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentEmbedding &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_values));

  @override
  String toString() {
    return 'ContentEmbedding(values: $values)';
  }
}

/// @nodoc
abstract mixin class _$ContentEmbeddingCopyWith<$Res>
    implements $ContentEmbeddingCopyWith<$Res> {
  factory _$ContentEmbeddingCopyWith(
          _ContentEmbedding value, $Res Function(_ContentEmbedding) _then) =
      __$ContentEmbeddingCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<double>? values});
}

/// @nodoc
class __$ContentEmbeddingCopyWithImpl<$Res>
    implements _$ContentEmbeddingCopyWith<$Res> {
  __$ContentEmbeddingCopyWithImpl(this._self, this._then);

  final _ContentEmbedding _self;
  final $Res Function(_ContentEmbedding) _then;

  /// Create a copy of ContentEmbedding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? values = freezed,
  }) {
    return _then(_ContentEmbedding(
      values: freezed == values
          ? _self._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
mixin _$PromptFeedback {
  /// Ratings for safety of the prompt. There is at most one rating per category.
  @JsonKey(includeIfNull: false)
  List<SafetyRating>? get safetyRatings;

  /// Optional. If set, the prompt was blocked and no candidates are returned. Rephrase your prompt.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  PromptFeedbackBlockReason? get blockReason;

  /// Create a copy of PromptFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PromptFeedbackCopyWith<PromptFeedback> get copyWith =>
      _$PromptFeedbackCopyWithImpl<PromptFeedback>(
          this as PromptFeedback, _$identity);

  /// Serializes this PromptFeedback to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PromptFeedback &&
            const DeepCollectionEquality()
                .equals(other.safetyRatings, safetyRatings) &&
            (identical(other.blockReason, blockReason) ||
                other.blockReason == blockReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(safetyRatings), blockReason);

  @override
  String toString() {
    return 'PromptFeedback(safetyRatings: $safetyRatings, blockReason: $blockReason)';
  }
}

/// @nodoc
abstract mixin class $PromptFeedbackCopyWith<$Res> {
  factory $PromptFeedbackCopyWith(
          PromptFeedback value, $Res Function(PromptFeedback) _then) =
      _$PromptFeedbackCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<SafetyRating>? safetyRatings,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      PromptFeedbackBlockReason? blockReason});
}

/// @nodoc
class _$PromptFeedbackCopyWithImpl<$Res>
    implements $PromptFeedbackCopyWith<$Res> {
  _$PromptFeedbackCopyWithImpl(this._self, this._then);

  final PromptFeedback _self;
  final $Res Function(PromptFeedback) _then;

  /// Create a copy of PromptFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? safetyRatings = freezed,
    Object? blockReason = freezed,
  }) {
    return _then(_self.copyWith(
      safetyRatings: freezed == safetyRatings
          ? _self.safetyRatings
          : safetyRatings // ignore: cast_nullable_to_non_nullable
              as List<SafetyRating>?,
      blockReason: freezed == blockReason
          ? _self.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as PromptFeedbackBlockReason?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PromptFeedback].
extension PromptFeedbackPatterns on PromptFeedback {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PromptFeedback value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromptFeedback() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PromptFeedback value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromptFeedback():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PromptFeedback value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromptFeedback() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) List<SafetyRating>? safetyRatings,
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            PromptFeedbackBlockReason? blockReason)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromptFeedback() when $default != null:
        return $default(_that.safetyRatings, _that.blockReason);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) List<SafetyRating>? safetyRatings,
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            PromptFeedbackBlockReason? blockReason)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromptFeedback():
        return $default(_that.safetyRatings, _that.blockReason);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) List<SafetyRating>? safetyRatings,
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            PromptFeedbackBlockReason? blockReason)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromptFeedback() when $default != null:
        return $default(_that.safetyRatings, _that.blockReason);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PromptFeedback extends PromptFeedback {
  const _PromptFeedback(
      {@JsonKey(includeIfNull: false) final List<SafetyRating>? safetyRatings,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.blockReason})
      : _safetyRatings = safetyRatings,
        super._();
  factory _PromptFeedback.fromJson(Map<String, dynamic> json) =>
      _$PromptFeedbackFromJson(json);

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

  /// Create a copy of PromptFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromptFeedbackCopyWith<_PromptFeedback> get copyWith =>
      __$PromptFeedbackCopyWithImpl<_PromptFeedback>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PromptFeedbackToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromptFeedback &&
            const DeepCollectionEquality()
                .equals(other._safetyRatings, _safetyRatings) &&
            (identical(other.blockReason, blockReason) ||
                other.blockReason == blockReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_safetyRatings), blockReason);

  @override
  String toString() {
    return 'PromptFeedback(safetyRatings: $safetyRatings, blockReason: $blockReason)';
  }
}

/// @nodoc
abstract mixin class _$PromptFeedbackCopyWith<$Res>
    implements $PromptFeedbackCopyWith<$Res> {
  factory _$PromptFeedbackCopyWith(
          _PromptFeedback value, $Res Function(_PromptFeedback) _then) =
      __$PromptFeedbackCopyWithImpl;
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
class __$PromptFeedbackCopyWithImpl<$Res>
    implements _$PromptFeedbackCopyWith<$Res> {
  __$PromptFeedbackCopyWithImpl(this._self, this._then);

  final _PromptFeedback _self;
  final $Res Function(_PromptFeedback) _then;

  /// Create a copy of PromptFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? safetyRatings = freezed,
    Object? blockReason = freezed,
  }) {
    return _then(_PromptFeedback(
      safetyRatings: freezed == safetyRatings
          ? _self._safetyRatings
          : safetyRatings // ignore: cast_nullable_to_non_nullable
              as List<SafetyRating>?,
      blockReason: freezed == blockReason
          ? _self.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as PromptFeedbackBlockReason?,
    ));
  }
}

/// @nodoc
mixin _$EmbedContentRequest {
  /// Optional. An optional title for the text. Only applicable when TaskType is `RETRIEVAL_DOCUMENT`. Note: Specifying a `title` for `RETRIEVAL_DOCUMENT` provides better quality embeddings for retrieval.
  @JsonKey(includeIfNull: false)
  String? get title;

  /// Required. The content to embed. Only the `parts.text` fields will be counted.
  @JsonKey(includeIfNull: false)
  Content? get content;

  /// Optional. Optional task type for which the embeddings will be used. Can only be set for `models/embedding-001` or newer models.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  EmbedContentRequestTaskType? get taskType;

  /// Required. The model's resource name. This serves as an ID for the Model to use. This name should match a model name returned by the `ListModels` method. Format: `models/{model}`
  @JsonKey(includeIfNull: false)
  String? get model;

  /// Optional. Optional reduced dimension for the output embedding. If set, excessive values in the output embedding are truncated from the end. Supported by newer models since 2024, and the earlier model (`models/embedding-001`) cannot specify this value.
  @JsonKey(includeIfNull: false)
  int? get outputDimensionality;

  /// Create a copy of EmbedContentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmbedContentRequestCopyWith<EmbedContentRequest> get copyWith =>
      _$EmbedContentRequestCopyWithImpl<EmbedContentRequest>(
          this as EmbedContentRequest, _$identity);

  /// Serializes this EmbedContentRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmbedContentRequest &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.taskType, taskType) ||
                other.taskType == taskType) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.outputDimensionality, outputDimensionality) ||
                other.outputDimensionality == outputDimensionality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, content, taskType, model, outputDimensionality);

  @override
  String toString() {
    return 'EmbedContentRequest(title: $title, content: $content, taskType: $taskType, model: $model, outputDimensionality: $outputDimensionality)';
  }
}

/// @nodoc
abstract mixin class $EmbedContentRequestCopyWith<$Res> {
  factory $EmbedContentRequestCopyWith(
          EmbedContentRequest value, $Res Function(EmbedContentRequest) _then) =
      _$EmbedContentRequestCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? title,
      @JsonKey(includeIfNull: false) Content? content,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      EmbedContentRequestTaskType? taskType,
      @JsonKey(includeIfNull: false) String? model,
      @JsonKey(includeIfNull: false) int? outputDimensionality});

  $ContentCopyWith<$Res>? get content;
}

/// @nodoc
class _$EmbedContentRequestCopyWithImpl<$Res>
    implements $EmbedContentRequestCopyWith<$Res> {
  _$EmbedContentRequestCopyWithImpl(this._self, this._then);

  final EmbedContentRequest _self;
  final $Res Function(EmbedContentRequest) _then;

  /// Create a copy of EmbedContentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? taskType = freezed,
    Object? model = freezed,
    Object? outputDimensionality = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      taskType: freezed == taskType
          ? _self.taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as EmbedContentRequestTaskType?,
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      outputDimensionality: freezed == outputDimensionality
          ? _self.outputDimensionality
          : outputDimensionality // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of EmbedContentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// Adds pattern-matching-related methods to [EmbedContentRequest].
extension EmbedContentRequestPatterns on EmbedContentRequest {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EmbedContentRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmbedContentRequest() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EmbedContentRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmbedContentRequest():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EmbedContentRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmbedContentRequest() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) String? title,
            @JsonKey(includeIfNull: false) Content? content,
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            EmbedContentRequestTaskType? taskType,
            @JsonKey(includeIfNull: false) String? model,
            @JsonKey(includeIfNull: false) int? outputDimensionality)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmbedContentRequest() when $default != null:
        return $default(_that.title, _that.content, _that.taskType, _that.model,
            _that.outputDimensionality);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) String? title,
            @JsonKey(includeIfNull: false) Content? content,
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            EmbedContentRequestTaskType? taskType,
            @JsonKey(includeIfNull: false) String? model,
            @JsonKey(includeIfNull: false) int? outputDimensionality)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmbedContentRequest():
        return $default(_that.title, _that.content, _that.taskType, _that.model,
            _that.outputDimensionality);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) String? title,
            @JsonKey(includeIfNull: false) Content? content,
            @JsonKey(
                includeIfNull: false,
                unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
            EmbedContentRequestTaskType? taskType,
            @JsonKey(includeIfNull: false) String? model,
            @JsonKey(includeIfNull: false) int? outputDimensionality)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmbedContentRequest() when $default != null:
        return $default(_that.title, _that.content, _that.taskType, _that.model,
            _that.outputDimensionality);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EmbedContentRequest extends EmbedContentRequest {
  const _EmbedContentRequest(
      {@JsonKey(includeIfNull: false) this.title,
      @JsonKey(includeIfNull: false) this.content,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.taskType,
      @JsonKey(includeIfNull: false) this.model,
      @JsonKey(includeIfNull: false) this.outputDimensionality})
      : super._();
  factory _EmbedContentRequest.fromJson(Map<String, dynamic> json) =>
      _$EmbedContentRequestFromJson(json);

  /// Optional. An optional title for the text. Only applicable when TaskType is `RETRIEVAL_DOCUMENT`. Note: Specifying a `title` for `RETRIEVAL_DOCUMENT` provides better quality embeddings for retrieval.
  @override
  @JsonKey(includeIfNull: false)
  final String? title;

  /// Required. The content to embed. Only the `parts.text` fields will be counted.
  @override
  @JsonKey(includeIfNull: false)
  final Content? content;

  /// Optional. Optional task type for which the embeddings will be used. Can only be set for `models/embedding-001` or newer models.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final EmbedContentRequestTaskType? taskType;

  /// Required. The model's resource name. This serves as an ID for the Model to use. This name should match a model name returned by the `ListModels` method. Format: `models/{model}`
  @override
  @JsonKey(includeIfNull: false)
  final String? model;

  /// Optional. Optional reduced dimension for the output embedding. If set, excessive values in the output embedding are truncated from the end. Supported by newer models since 2024, and the earlier model (`models/embedding-001`) cannot specify this value.
  @override
  @JsonKey(includeIfNull: false)
  final int? outputDimensionality;

  /// Create a copy of EmbedContentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmbedContentRequestCopyWith<_EmbedContentRequest> get copyWith =>
      __$EmbedContentRequestCopyWithImpl<_EmbedContentRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EmbedContentRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmbedContentRequest &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.taskType, taskType) ||
                other.taskType == taskType) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.outputDimensionality, outputDimensionality) ||
                other.outputDimensionality == outputDimensionality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, content, taskType, model, outputDimensionality);

  @override
  String toString() {
    return 'EmbedContentRequest(title: $title, content: $content, taskType: $taskType, model: $model, outputDimensionality: $outputDimensionality)';
  }
}

/// @nodoc
abstract mixin class _$EmbedContentRequestCopyWith<$Res>
    implements $EmbedContentRequestCopyWith<$Res> {
  factory _$EmbedContentRequestCopyWith(_EmbedContentRequest value,
          $Res Function(_EmbedContentRequest) _then) =
      __$EmbedContentRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? title,
      @JsonKey(includeIfNull: false) Content? content,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      EmbedContentRequestTaskType? taskType,
      @JsonKey(includeIfNull: false) String? model,
      @JsonKey(includeIfNull: false) int? outputDimensionality});

  @override
  $ContentCopyWith<$Res>? get content;
}

/// @nodoc
class __$EmbedContentRequestCopyWithImpl<$Res>
    implements _$EmbedContentRequestCopyWith<$Res> {
  __$EmbedContentRequestCopyWithImpl(this._self, this._then);

  final _EmbedContentRequest _self;
  final $Res Function(_EmbedContentRequest) _then;

  /// Create a copy of EmbedContentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? taskType = freezed,
    Object? model = freezed,
    Object? outputDimensionality = freezed,
  }) {
    return _then(_EmbedContentRequest(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      taskType: freezed == taskType
          ? _self.taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as EmbedContentRequestTaskType?,
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      outputDimensionality: freezed == outputDimensionality
          ? _self.outputDimensionality
          : outputDimensionality // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of EmbedContentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// @nodoc
mixin _$ListOperationsResponse {
  /// A list of operations that matches the specified filter in the request.
  @JsonKey(includeIfNull: false)
  List<Operation>? get operations;

  /// The standard List next-page token.
  @JsonKey(includeIfNull: false)
  String? get nextPageToken;

  /// Create a copy of ListOperationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListOperationsResponseCopyWith<ListOperationsResponse> get copyWith =>
      _$ListOperationsResponseCopyWithImpl<ListOperationsResponse>(
          this as ListOperationsResponse, _$identity);

  /// Serializes this ListOperationsResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListOperationsResponse &&
            const DeepCollectionEquality()
                .equals(other.operations, operations) &&
            (identical(other.nextPageToken, nextPageToken) ||
                other.nextPageToken == nextPageToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(operations), nextPageToken);

  @override
  String toString() {
    return 'ListOperationsResponse(operations: $operations, nextPageToken: $nextPageToken)';
  }
}

/// @nodoc
abstract mixin class $ListOperationsResponseCopyWith<$Res> {
  factory $ListOperationsResponseCopyWith(ListOperationsResponse value,
          $Res Function(ListOperationsResponse) _then) =
      _$ListOperationsResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<Operation>? operations,
      @JsonKey(includeIfNull: false) String? nextPageToken});
}

/// @nodoc
class _$ListOperationsResponseCopyWithImpl<$Res>
    implements $ListOperationsResponseCopyWith<$Res> {
  _$ListOperationsResponseCopyWithImpl(this._self, this._then);

  final ListOperationsResponse _self;
  final $Res Function(ListOperationsResponse) _then;

  /// Create a copy of ListOperationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operations = freezed,
    Object? nextPageToken = freezed,
  }) {
    return _then(_self.copyWith(
      operations: freezed == operations
          ? _self.operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<Operation>?,
      nextPageToken: freezed == nextPageToken
          ? _self.nextPageToken
          : nextPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ListOperationsResponse].
extension ListOperationsResponsePatterns on ListOperationsResponse {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ListOperationsResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListOperationsResponse() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ListOperationsResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListOperationsResponse():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ListOperationsResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListOperationsResponse() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) List<Operation>? operations,
            @JsonKey(includeIfNull: false) String? nextPageToken)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListOperationsResponse() when $default != null:
        return $default(_that.operations, _that.nextPageToken);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) List<Operation>? operations,
            @JsonKey(includeIfNull: false) String? nextPageToken)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListOperationsResponse():
        return $default(_that.operations, _that.nextPageToken);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) List<Operation>? operations,
            @JsonKey(includeIfNull: false) String? nextPageToken)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListOperationsResponse() when $default != null:
        return $default(_that.operations, _that.nextPageToken);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ListOperationsResponse extends ListOperationsResponse {
  const _ListOperationsResponse(
      {@JsonKey(includeIfNull: false) final List<Operation>? operations,
      @JsonKey(includeIfNull: false) this.nextPageToken})
      : _operations = operations,
        super._();
  factory _ListOperationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOperationsResponseFromJson(json);

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

  /// The standard List next-page token.
  @override
  @JsonKey(includeIfNull: false)
  final String? nextPageToken;

  /// Create a copy of ListOperationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListOperationsResponseCopyWith<_ListOperationsResponse> get copyWith =>
      __$ListOperationsResponseCopyWithImpl<_ListOperationsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListOperationsResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListOperationsResponse &&
            const DeepCollectionEquality()
                .equals(other._operations, _operations) &&
            (identical(other.nextPageToken, nextPageToken) ||
                other.nextPageToken == nextPageToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_operations), nextPageToken);

  @override
  String toString() {
    return 'ListOperationsResponse(operations: $operations, nextPageToken: $nextPageToken)';
  }
}

/// @nodoc
abstract mixin class _$ListOperationsResponseCopyWith<$Res>
    implements $ListOperationsResponseCopyWith<$Res> {
  factory _$ListOperationsResponseCopyWith(_ListOperationsResponse value,
          $Res Function(_ListOperationsResponse) _then) =
      __$ListOperationsResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<Operation>? operations,
      @JsonKey(includeIfNull: false) String? nextPageToken});
}

/// @nodoc
class __$ListOperationsResponseCopyWithImpl<$Res>
    implements _$ListOperationsResponseCopyWith<$Res> {
  __$ListOperationsResponseCopyWithImpl(this._self, this._then);

  final _ListOperationsResponse _self;
  final $Res Function(_ListOperationsResponse) _then;

  /// Create a copy of ListOperationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? operations = freezed,
    Object? nextPageToken = freezed,
  }) {
    return _then(_ListOperationsResponse(
      operations: freezed == operations
          ? _self._operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<Operation>?,
      nextPageToken: freezed == nextPageToken
          ? _self.nextPageToken
          : nextPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Empty {
  /// Serializes this Empty to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Empty);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Empty()';
  }
}

/// @nodoc
class $EmptyCopyWith<$Res> {
  $EmptyCopyWith(Empty _, $Res Function(Empty) __);
}

/// Adds pattern-matching-related methods to [Empty].
extension EmptyPatterns on Empty {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Empty value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Empty() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Empty value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Empty():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Empty value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Empty() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Empty() when $default != null:
        return $default();
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Empty():
        return $default();
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Empty() when $default != null:
        return $default();
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Empty extends Empty {
  const _Empty() : super._();
  factory _Empty.fromJson(Map<String, dynamic> json) => _$EmptyFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$EmptyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Empty);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Empty()';
  }
}

/// @nodoc
mixin _$Content {
  /// Optional. The producer of the content. Must be either 'user' or 'model'. Useful to set for multi-turn conversations, otherwise can be left blank or unset.
  @JsonKey(includeIfNull: false)
  String? get role;

  /// Ordered `Parts` that constitute a single message. Parts may have different MIME types.
  @JsonKey(includeIfNull: false)
  List<Part>? get parts;

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentCopyWith<Content> get copyWith =>
      _$ContentCopyWithImpl<Content>(this as Content, _$identity);

  /// Serializes this Content to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Content &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other.parts, parts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, role, const DeepCollectionEquality().hash(parts));

  @override
  String toString() {
    return 'Content(role: $role, parts: $parts)';
  }
}

/// @nodoc
abstract mixin class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) _then) =
      _$ContentCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? role,
      @JsonKey(includeIfNull: false) List<Part>? parts});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res> implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._self, this._then);

  final Content _self;
  final $Res Function(Content) _then;

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? parts = freezed,
  }) {
    return _then(_self.copyWith(
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      parts: freezed == parts
          ? _self.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<Part>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Content].
extension ContentPatterns on Content {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Content value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Content() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Content value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Content():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Content value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Content() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) String? role,
            @JsonKey(includeIfNull: false) List<Part>? parts)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Content() when $default != null:
        return $default(_that.role, _that.parts);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) String? role,
            @JsonKey(includeIfNull: false) List<Part>? parts)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Content():
        return $default(_that.role, _that.parts);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(includeIfNull: false) String? role,
            @JsonKey(includeIfNull: false) List<Part>? parts)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Content() when $default != null:
        return $default(_that.role, _that.parts);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Content extends Content {
  const _Content(
      {@JsonKey(includeIfNull: false) this.role,
      @JsonKey(includeIfNull: false) final List<Part>? parts})
      : _parts = parts,
        super._();
  factory _Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

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

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContentCopyWith<_Content> get copyWith =>
      __$ContentCopyWithImpl<_Content>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Content &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other._parts, _parts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, role, const DeepCollectionEquality().hash(_parts));

  @override
  String toString() {
    return 'Content(role: $role, parts: $parts)';
  }
}

/// @nodoc
abstract mixin class _$ContentCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$ContentCopyWith(_Content value, $Res Function(_Content) _then) =
      __$ContentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? role,
      @JsonKey(includeIfNull: false) List<Part>? parts});
}

/// @nodoc
class __$ContentCopyWithImpl<$Res> implements _$ContentCopyWith<$Res> {
  __$ContentCopyWithImpl(this._self, this._then);

  final _Content _self;
  final $Res Function(_Content) _then;

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? role = freezed,
    Object? parts = freezed,
  }) {
    return _then(_Content(
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      parts: freezed == parts
          ? _self._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<Part>?,
    ));
  }
}

/// @nodoc
mixin _$CancelOperationRequest {
  /// Serializes this CancelOperationRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CancelOperationRequest);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CancelOperationRequest()';
  }
}

/// @nodoc
class $CancelOperationRequestCopyWith<$Res> {
  $CancelOperationRequestCopyWith(
      CancelOperationRequest _, $Res Function(CancelOperationRequest) __);
}

/// Adds pattern-matching-related methods to [CancelOperationRequest].
extension CancelOperationRequestPatterns on CancelOperationRequest {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CancelOperationRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CancelOperationRequest() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CancelOperationRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CancelOperationRequest():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CancelOperationRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CancelOperationRequest() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CancelOperationRequest() when $default != null:
        return $default();
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CancelOperationRequest():
        return $default();
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CancelOperationRequest() when $default != null:
        return $default();
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CancelOperationRequest extends CancelOperationRequest {
  const _CancelOperationRequest() : super._();
  factory _CancelOperationRequest.fromJson(Map<String, dynamic> json) =>
      _$CancelOperationRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$CancelOperationRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CancelOperationRequest);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CancelOperationRequest()';
  }
}

/// @nodoc
mixin _$EmbedContentResponse {
  /// Output only. The embedding generated from the input content.
  @JsonKey(includeIfNull: false)
  ContentEmbedding? get embedding;

  /// Create a copy of EmbedContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmbedContentResponseCopyWith<EmbedContentResponse> get copyWith =>
      _$EmbedContentResponseCopyWithImpl<EmbedContentResponse>(
          this as EmbedContentResponse, _$identity);

  /// Serializes this EmbedContentResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmbedContentResponse &&
            (identical(other.embedding, embedding) ||
                other.embedding == embedding));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, embedding);

  @override
  String toString() {
    return 'EmbedContentResponse(embedding: $embedding)';
  }
}

/// @nodoc
abstract mixin class $EmbedContentResponseCopyWith<$Res> {
  factory $EmbedContentResponseCopyWith(EmbedContentResponse value,
          $Res Function(EmbedContentResponse) _then) =
      _$EmbedContentResponseCopyWithImpl;
  @useResult
  $Res call({@JsonKey(includeIfNull: false) ContentEmbedding? embedding});

  $ContentEmbeddingCopyWith<$Res>? get embedding;
}

/// @nodoc
class _$EmbedContentResponseCopyWithImpl<$Res>
    implements $EmbedContentResponseCopyWith<$Res> {
  _$EmbedContentResponseCopyWithImpl(this._self, this._then);

  final EmbedContentResponse _self;
  final $Res Function(EmbedContentResponse) _then;

  /// Create a copy of EmbedContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embedding = freezed,
  }) {
    return _then(_self.copyWith(
      embedding: freezed == embedding
          ? _self.embedding
          : embedding // ignore: cast_nullable_to_non_nullable
              as ContentEmbedding?,
    ));
  }

  /// Create a copy of EmbedContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentEmbeddingCopyWith<$Res>? get embedding {
    if (_self.embedding == null) {
      return null;
    }

    return $ContentEmbeddingCopyWith<$Res>(_self.embedding!, (value) {
      return _then(_self.copyWith(embedding: value));
    });
  }
}

/// Adds pattern-matching-related methods to [EmbedContentResponse].
extension EmbedContentResponsePatterns on EmbedContentResponse {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EmbedContentResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmbedContentResponse() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EmbedContentResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmbedContentResponse():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EmbedContentResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmbedContentResponse() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) ContentEmbedding? embedding)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmbedContentResponse() when $default != null:
        return $default(_that.embedding);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) ContentEmbedding? embedding)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmbedContentResponse():
        return $default(_that.embedding);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) ContentEmbedding? embedding)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmbedContentResponse() when $default != null:
        return $default(_that.embedding);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EmbedContentResponse extends EmbedContentResponse {
  const _EmbedContentResponse({@JsonKey(includeIfNull: false) this.embedding})
      : super._();
  factory _EmbedContentResponse.fromJson(Map<String, dynamic> json) =>
      _$EmbedContentResponseFromJson(json);

  /// Output only. The embedding generated from the input content.
  @override
  @JsonKey(includeIfNull: false)
  final ContentEmbedding? embedding;

  /// Create a copy of EmbedContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmbedContentResponseCopyWith<_EmbedContentResponse> get copyWith =>
      __$EmbedContentResponseCopyWithImpl<_EmbedContentResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EmbedContentResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmbedContentResponse &&
            (identical(other.embedding, embedding) ||
                other.embedding == embedding));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, embedding);

  @override
  String toString() {
    return 'EmbedContentResponse(embedding: $embedding)';
  }
}

/// @nodoc
abstract mixin class _$EmbedContentResponseCopyWith<$Res>
    implements $EmbedContentResponseCopyWith<$Res> {
  factory _$EmbedContentResponseCopyWith(_EmbedContentResponse value,
          $Res Function(_EmbedContentResponse) _then) =
      __$EmbedContentResponseCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: false) ContentEmbedding? embedding});

  @override
  $ContentEmbeddingCopyWith<$Res>? get embedding;
}

/// @nodoc
class __$EmbedContentResponseCopyWithImpl<$Res>
    implements _$EmbedContentResponseCopyWith<$Res> {
  __$EmbedContentResponseCopyWithImpl(this._self, this._then);

  final _EmbedContentResponse _self;
  final $Res Function(_EmbedContentResponse) _then;

  /// Create a copy of EmbedContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? embedding = freezed,
  }) {
    return _then(_EmbedContentResponse(
      embedding: freezed == embedding
          ? _self.embedding
          : embedding // ignore: cast_nullable_to_non_nullable
              as ContentEmbedding?,
    ));
  }

  /// Create a copy of EmbedContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentEmbeddingCopyWith<$Res>? get embedding {
    if (_self.embedding == null) {
      return null;
    }

    return $ContentEmbeddingCopyWith<$Res>(_self.embedding!, (value) {
      return _then(_self.copyWith(embedding: value));
    });
  }
}

/// @nodoc
mixin _$CountTokensResponse {
  /// The number of tokens that the `model` tokenizes the `prompt` into. Always non-negative.
  @JsonKey(includeIfNull: false)
  int? get totalTokens;

  /// Create a copy of CountTokensResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CountTokensResponseCopyWith<CountTokensResponse> get copyWith =>
      _$CountTokensResponseCopyWithImpl<CountTokensResponse>(
          this as CountTokensResponse, _$identity);

  /// Serializes this CountTokensResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CountTokensResponse &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalTokens);

  @override
  String toString() {
    return 'CountTokensResponse(totalTokens: $totalTokens)';
  }
}

/// @nodoc
abstract mixin class $CountTokensResponseCopyWith<$Res> {
  factory $CountTokensResponseCopyWith(
          CountTokensResponse value, $Res Function(CountTokensResponse) _then) =
      _$CountTokensResponseCopyWithImpl;
  @useResult
  $Res call({@JsonKey(includeIfNull: false) int? totalTokens});
}

/// @nodoc
class _$CountTokensResponseCopyWithImpl<$Res>
    implements $CountTokensResponseCopyWith<$Res> {
  _$CountTokensResponseCopyWithImpl(this._self, this._then);

  final CountTokensResponse _self;
  final $Res Function(CountTokensResponse) _then;

  /// Create a copy of CountTokensResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTokens = freezed,
  }) {
    return _then(_self.copyWith(
      totalTokens: freezed == totalTokens
          ? _self.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CountTokensResponse].
extension CountTokensResponsePatterns on CountTokensResponse {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CountTokensResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CountTokensResponse() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CountTokensResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountTokensResponse():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CountTokensResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountTokensResponse() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) int? totalTokens)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CountTokensResponse() when $default != null:
        return $default(_that.totalTokens);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(includeIfNull: false) int? totalTokens) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountTokensResponse():
        return $default(_that.totalTokens);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(includeIfNull: false) int? totalTokens)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountTokensResponse() when $default != null:
        return $default(_that.totalTokens);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CountTokensResponse extends CountTokensResponse {
  const _CountTokensResponse({@JsonKey(includeIfNull: false) this.totalTokens})
      : super._();
  factory _CountTokensResponse.fromJson(Map<String, dynamic> json) =>
      _$CountTokensResponseFromJson(json);

  /// The number of tokens that the `model` tokenizes the `prompt` into. Always non-negative.
  @override
  @JsonKey(includeIfNull: false)
  final int? totalTokens;

  /// Create a copy of CountTokensResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CountTokensResponseCopyWith<_CountTokensResponse> get copyWith =>
      __$CountTokensResponseCopyWithImpl<_CountTokensResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CountTokensResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CountTokensResponse &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalTokens);

  @override
  String toString() {
    return 'CountTokensResponse(totalTokens: $totalTokens)';
  }
}

/// @nodoc
abstract mixin class _$CountTokensResponseCopyWith<$Res>
    implements $CountTokensResponseCopyWith<$Res> {
  factory _$CountTokensResponseCopyWith(_CountTokensResponse value,
          $Res Function(_CountTokensResponse) _then) =
      __$CountTokensResponseCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: false) int? totalTokens});
}

/// @nodoc
class __$CountTokensResponseCopyWithImpl<$Res>
    implements _$CountTokensResponseCopyWith<$Res> {
  __$CountTokensResponseCopyWithImpl(this._self, this._then);

  final _CountTokensResponse _self;
  final $Res Function(_CountTokensResponse) _then;

  /// Create a copy of CountTokensResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalTokens = freezed,
  }) {
    return _then(_CountTokensResponse(
      totalTokens: freezed == totalTokens
          ? _self.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$GenerateContentResponse {
  /// Returns the prompt's feedback related to the content filters.
  @JsonKey(includeIfNull: false)
  PromptFeedback? get promptFeedback;

  /// Candidate responses from the model.
  @JsonKey(includeIfNull: false)
  List<Candidate>? get candidates;

  /// Create a copy of GenerateContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenerateContentResponseCopyWith<GenerateContentResponse> get copyWith =>
      _$GenerateContentResponseCopyWithImpl<GenerateContentResponse>(
          this as GenerateContentResponse, _$identity);

  /// Serializes this GenerateContentResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenerateContentResponse &&
            (identical(other.promptFeedback, promptFeedback) ||
                other.promptFeedback == promptFeedback) &&
            const DeepCollectionEquality()
                .equals(other.candidates, candidates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, promptFeedback,
      const DeepCollectionEquality().hash(candidates));

  @override
  String toString() {
    return 'GenerateContentResponse(promptFeedback: $promptFeedback, candidates: $candidates)';
  }
}

/// @nodoc
abstract mixin class $GenerateContentResponseCopyWith<$Res> {
  factory $GenerateContentResponseCopyWith(GenerateContentResponse value,
          $Res Function(GenerateContentResponse) _then) =
      _$GenerateContentResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) PromptFeedback? promptFeedback,
      @JsonKey(includeIfNull: false) List<Candidate>? candidates});

  $PromptFeedbackCopyWith<$Res>? get promptFeedback;
}

/// @nodoc
class _$GenerateContentResponseCopyWithImpl<$Res>
    implements $GenerateContentResponseCopyWith<$Res> {
  _$GenerateContentResponseCopyWithImpl(this._self, this._then);

  final GenerateContentResponse _self;
  final $Res Function(GenerateContentResponse) _then;

  /// Create a copy of GenerateContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptFeedback = freezed,
    Object? candidates = freezed,
  }) {
    return _then(_self.copyWith(
      promptFeedback: freezed == promptFeedback
          ? _self.promptFeedback
          : promptFeedback // ignore: cast_nullable_to_non_nullable
              as PromptFeedback?,
      candidates: freezed == candidates
          ? _self.candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<Candidate>?,
    ));
  }

  /// Create a copy of GenerateContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromptFeedbackCopyWith<$Res>? get promptFeedback {
    if (_self.promptFeedback == null) {
      return null;
    }

    return $PromptFeedbackCopyWith<$Res>(_self.promptFeedback!, (value) {
      return _then(_self.copyWith(promptFeedback: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GenerateContentResponse].
extension GenerateContentResponsePatterns on GenerateContentResponse {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GenerateContentResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GenerateContentResponse() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GenerateContentResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerateContentResponse():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GenerateContentResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerateContentResponse() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) PromptFeedback? promptFeedback,
            @JsonKey(includeIfNull: false) List<Candidate>? candidates)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GenerateContentResponse() when $default != null:
        return $default(_that.promptFeedback, _that.candidates);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) PromptFeedback? promptFeedback,
            @JsonKey(includeIfNull: false) List<Candidate>? candidates)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerateContentResponse():
        return $default(_that.promptFeedback, _that.candidates);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) PromptFeedback? promptFeedback,
            @JsonKey(includeIfNull: false) List<Candidate>? candidates)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerateContentResponse() when $default != null:
        return $default(_that.promptFeedback, _that.candidates);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GenerateContentResponse extends GenerateContentResponse {
  const _GenerateContentResponse(
      {@JsonKey(includeIfNull: false) this.promptFeedback,
      @JsonKey(includeIfNull: false) final List<Candidate>? candidates})
      : _candidates = candidates,
        super._();
  factory _GenerateContentResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateContentResponseFromJson(json);

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

  /// Create a copy of GenerateContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GenerateContentResponseCopyWith<_GenerateContentResponse> get copyWith =>
      __$GenerateContentResponseCopyWithImpl<_GenerateContentResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GenerateContentResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GenerateContentResponse &&
            (identical(other.promptFeedback, promptFeedback) ||
                other.promptFeedback == promptFeedback) &&
            const DeepCollectionEquality()
                .equals(other._candidates, _candidates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, promptFeedback,
      const DeepCollectionEquality().hash(_candidates));

  @override
  String toString() {
    return 'GenerateContentResponse(promptFeedback: $promptFeedback, candidates: $candidates)';
  }
}

/// @nodoc
abstract mixin class _$GenerateContentResponseCopyWith<$Res>
    implements $GenerateContentResponseCopyWith<$Res> {
  factory _$GenerateContentResponseCopyWith(_GenerateContentResponse value,
          $Res Function(_GenerateContentResponse) _then) =
      __$GenerateContentResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) PromptFeedback? promptFeedback,
      @JsonKey(includeIfNull: false) List<Candidate>? candidates});

  @override
  $PromptFeedbackCopyWith<$Res>? get promptFeedback;
}

/// @nodoc
class __$GenerateContentResponseCopyWithImpl<$Res>
    implements _$GenerateContentResponseCopyWith<$Res> {
  __$GenerateContentResponseCopyWithImpl(this._self, this._then);

  final _GenerateContentResponse _self;
  final $Res Function(_GenerateContentResponse) _then;

  /// Create a copy of GenerateContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? promptFeedback = freezed,
    Object? candidates = freezed,
  }) {
    return _then(_GenerateContentResponse(
      promptFeedback: freezed == promptFeedback
          ? _self.promptFeedback
          : promptFeedback // ignore: cast_nullable_to_non_nullable
              as PromptFeedback?,
      candidates: freezed == candidates
          ? _self._candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<Candidate>?,
    ));
  }

  /// Create a copy of GenerateContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromptFeedbackCopyWith<$Res>? get promptFeedback {
    if (_self.promptFeedback == null) {
      return null;
    }

    return $PromptFeedbackCopyWith<$Res>(_self.promptFeedback!, (value) {
      return _then(_self.copyWith(promptFeedback: value));
    });
  }
}

/// @nodoc
mixin _$Model {
  /// Required. The resource name of the `Model`. Format: `models/{model}` with a `{model}` naming convention of: * "{base_model_id}-{version}" Examples: * `models/chat-bison-001`
  @JsonKey(includeIfNull: false)
  String? get name;

  /// The human-readable name of the model. E.g. "Chat Bison". The name can be up to 128 characters long and can consist of any UTF-8 characters.
  @JsonKey(includeIfNull: false)
  String? get displayName;

  /// A short description of the model.
  @JsonKey(includeIfNull: false)
  String? get description;

  /// Required. The version number of the model. This represents the major version
  @JsonKey(includeIfNull: false)
  String? get version;

  /// Required. The name of the base model, pass this to the generation request. Examples: * `chat-bison`
  @JsonKey(includeIfNull: false)
  String? get baseModelId;

  /// Controls the randomness of the output. Values can range over `[0.0,1.0]`, inclusive. A value closer to `1.0` will produce responses that are more varied, while a value closer to `0.0` will typically result in less surprising responses from the model. This value specifies default to be used by the backend while making the call to the model.
  @JsonKey(includeIfNull: false)
  double? get temperature;

  /// For Top-k sampling. Top-k sampling considers the set of `top_k` most probable tokens. This value specifies default to be used by the backend while making the call to the model.
  @JsonKey(includeIfNull: false)
  int? get topK;

  /// For Nucleus sampling. Nucleus sampling considers the smallest set of tokens whose probability sum is at least `top_p`. This value specifies default to be used by the backend while making the call to the model.
  @JsonKey(includeIfNull: false)
  double? get topP;

  /// Maximum number of input tokens allowed for this model.
  @JsonKey(includeIfNull: false)
  int? get inputTokenLimit;

  /// Maximum number of output tokens available for this model.
  @JsonKey(includeIfNull: false)
  int? get outputTokenLimit;

  /// The model's supported generation methods. The method names are defined as Pascal case strings, such as `generateMessage` which correspond to API methods.
  @JsonKey(includeIfNull: false)
  List<String>? get supportedGenerationMethods;

  /// Create a copy of Model
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModelCopyWith<Model> get copyWith =>
      _$ModelCopyWithImpl<Model>(this as Model, _$identity);

  /// Serializes this Model to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Model &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.baseModelId, baseModelId) ||
                other.baseModelId == baseModelId) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.topK, topK) || other.topK == topK) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.inputTokenLimit, inputTokenLimit) ||
                other.inputTokenLimit == inputTokenLimit) &&
            (identical(other.outputTokenLimit, outputTokenLimit) ||
                other.outputTokenLimit == outputTokenLimit) &&
            const DeepCollectionEquality().equals(
                other.supportedGenerationMethods, supportedGenerationMethods));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      displayName,
      description,
      version,
      baseModelId,
      temperature,
      topK,
      topP,
      inputTokenLimit,
      outputTokenLimit,
      const DeepCollectionEquality().hash(supportedGenerationMethods));

  @override
  String toString() {
    return 'Model(name: $name, displayName: $displayName, description: $description, version: $version, baseModelId: $baseModelId, temperature: $temperature, topK: $topK, topP: $topP, inputTokenLimit: $inputTokenLimit, outputTokenLimit: $outputTokenLimit, supportedGenerationMethods: $supportedGenerationMethods)';
  }
}

/// @nodoc
abstract mixin class $ModelCopyWith<$Res> {
  factory $ModelCopyWith(Model value, $Res Function(Model) _then) =
      _$ModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? name,
      @JsonKey(includeIfNull: false) String? displayName,
      @JsonKey(includeIfNull: false) String? description,
      @JsonKey(includeIfNull: false) String? version,
      @JsonKey(includeIfNull: false) String? baseModelId,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(includeIfNull: false) int? topK,
      @JsonKey(includeIfNull: false) double? topP,
      @JsonKey(includeIfNull: false) int? inputTokenLimit,
      @JsonKey(includeIfNull: false) int? outputTokenLimit,
      @JsonKey(includeIfNull: false) List<String>? supportedGenerationMethods});
}

/// @nodoc
class _$ModelCopyWithImpl<$Res> implements $ModelCopyWith<$Res> {
  _$ModelCopyWithImpl(this._self, this._then);

  final Model _self;
  final $Res Function(Model) _then;

  /// Create a copy of Model
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? displayName = freezed,
    Object? description = freezed,
    Object? version = freezed,
    Object? baseModelId = freezed,
    Object? temperature = freezed,
    Object? topK = freezed,
    Object? topP = freezed,
    Object? inputTokenLimit = freezed,
    Object? outputTokenLimit = freezed,
    Object? supportedGenerationMethods = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      baseModelId: freezed == baseModelId
          ? _self.baseModelId
          : baseModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topK: freezed == topK
          ? _self.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      topP: freezed == topP
          ? _self.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      inputTokenLimit: freezed == inputTokenLimit
          ? _self.inputTokenLimit
          : inputTokenLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      outputTokenLimit: freezed == outputTokenLimit
          ? _self.outputTokenLimit
          : outputTokenLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      supportedGenerationMethods: freezed == supportedGenerationMethods
          ? _self.supportedGenerationMethods
          : supportedGenerationMethods // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Model value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Model() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Model value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Model():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Model value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Model() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) String? name,
            @JsonKey(includeIfNull: false) String? displayName,
            @JsonKey(includeIfNull: false) String? description,
            @JsonKey(includeIfNull: false) String? version,
            @JsonKey(includeIfNull: false) String? baseModelId,
            @JsonKey(includeIfNull: false) double? temperature,
            @JsonKey(includeIfNull: false) int? topK,
            @JsonKey(includeIfNull: false) double? topP,
            @JsonKey(includeIfNull: false) int? inputTokenLimit,
            @JsonKey(includeIfNull: false) int? outputTokenLimit,
            @JsonKey(includeIfNull: false)
            List<String>? supportedGenerationMethods)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Model() when $default != null:
        return $default(
            _that.name,
            _that.displayName,
            _that.description,
            _that.version,
            _that.baseModelId,
            _that.temperature,
            _that.topK,
            _that.topP,
            _that.inputTokenLimit,
            _that.outputTokenLimit,
            _that.supportedGenerationMethods);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) String? name,
            @JsonKey(includeIfNull: false) String? displayName,
            @JsonKey(includeIfNull: false) String? description,
            @JsonKey(includeIfNull: false) String? version,
            @JsonKey(includeIfNull: false) String? baseModelId,
            @JsonKey(includeIfNull: false) double? temperature,
            @JsonKey(includeIfNull: false) int? topK,
            @JsonKey(includeIfNull: false) double? topP,
            @JsonKey(includeIfNull: false) int? inputTokenLimit,
            @JsonKey(includeIfNull: false) int? outputTokenLimit,
            @JsonKey(includeIfNull: false)
            List<String>? supportedGenerationMethods)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Model():
        return $default(
            _that.name,
            _that.displayName,
            _that.description,
            _that.version,
            _that.baseModelId,
            _that.temperature,
            _that.topK,
            _that.topP,
            _that.inputTokenLimit,
            _that.outputTokenLimit,
            _that.supportedGenerationMethods);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) String? name,
            @JsonKey(includeIfNull: false) String? displayName,
            @JsonKey(includeIfNull: false) String? description,
            @JsonKey(includeIfNull: false) String? version,
            @JsonKey(includeIfNull: false) String? baseModelId,
            @JsonKey(includeIfNull: false) double? temperature,
            @JsonKey(includeIfNull: false) int? topK,
            @JsonKey(includeIfNull: false) double? topP,
            @JsonKey(includeIfNull: false) int? inputTokenLimit,
            @JsonKey(includeIfNull: false) int? outputTokenLimit,
            @JsonKey(includeIfNull: false)
            List<String>? supportedGenerationMethods)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Model() when $default != null:
        return $default(
            _that.name,
            _that.displayName,
            _that.description,
            _that.version,
            _that.baseModelId,
            _that.temperature,
            _that.topK,
            _that.topP,
            _that.inputTokenLimit,
            _that.outputTokenLimit,
            _that.supportedGenerationMethods);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Model extends Model {
  const _Model(
      {@JsonKey(includeIfNull: false) this.name,
      @JsonKey(includeIfNull: false) this.displayName,
      @JsonKey(includeIfNull: false) this.description,
      @JsonKey(includeIfNull: false) this.version,
      @JsonKey(includeIfNull: false) this.baseModelId,
      @JsonKey(includeIfNull: false) this.temperature,
      @JsonKey(includeIfNull: false) this.topK,
      @JsonKey(includeIfNull: false) this.topP,
      @JsonKey(includeIfNull: false) this.inputTokenLimit,
      @JsonKey(includeIfNull: false) this.outputTokenLimit,
      @JsonKey(includeIfNull: false)
      final List<String>? supportedGenerationMethods})
      : _supportedGenerationMethods = supportedGenerationMethods,
        super._();
  factory _Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

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

  /// Required. The version number of the model. This represents the major version
  @override
  @JsonKey(includeIfNull: false)
  final String? version;

  /// Required. The name of the base model, pass this to the generation request. Examples: * `chat-bison`
  @override
  @JsonKey(includeIfNull: false)
  final String? baseModelId;

  /// Controls the randomness of the output. Values can range over `[0.0,1.0]`, inclusive. A value closer to `1.0` will produce responses that are more varied, while a value closer to `0.0` will typically result in less surprising responses from the model. This value specifies default to be used by the backend while making the call to the model.
  @override
  @JsonKey(includeIfNull: false)
  final double? temperature;

  /// For Top-k sampling. Top-k sampling considers the set of `top_k` most probable tokens. This value specifies default to be used by the backend while making the call to the model.
  @override
  @JsonKey(includeIfNull: false)
  final int? topK;

  /// For Nucleus sampling. Nucleus sampling considers the smallest set of tokens whose probability sum is at least `top_p`. This value specifies default to be used by the backend while making the call to the model.
  @override
  @JsonKey(includeIfNull: false)
  final double? topP;

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

  /// Create a copy of Model
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ModelCopyWith<_Model> get copyWith =>
      __$ModelCopyWithImpl<_Model>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Model &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.baseModelId, baseModelId) ||
                other.baseModelId == baseModelId) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.topK, topK) || other.topK == topK) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.inputTokenLimit, inputTokenLimit) ||
                other.inputTokenLimit == inputTokenLimit) &&
            (identical(other.outputTokenLimit, outputTokenLimit) ||
                other.outputTokenLimit == outputTokenLimit) &&
            const DeepCollectionEquality().equals(
                other._supportedGenerationMethods,
                _supportedGenerationMethods));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      displayName,
      description,
      version,
      baseModelId,
      temperature,
      topK,
      topP,
      inputTokenLimit,
      outputTokenLimit,
      const DeepCollectionEquality().hash(_supportedGenerationMethods));

  @override
  String toString() {
    return 'Model(name: $name, displayName: $displayName, description: $description, version: $version, baseModelId: $baseModelId, temperature: $temperature, topK: $topK, topP: $topP, inputTokenLimit: $inputTokenLimit, outputTokenLimit: $outputTokenLimit, supportedGenerationMethods: $supportedGenerationMethods)';
  }
}

/// @nodoc
abstract mixin class _$ModelCopyWith<$Res> implements $ModelCopyWith<$Res> {
  factory _$ModelCopyWith(_Model value, $Res Function(_Model) _then) =
      __$ModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? name,
      @JsonKey(includeIfNull: false) String? displayName,
      @JsonKey(includeIfNull: false) String? description,
      @JsonKey(includeIfNull: false) String? version,
      @JsonKey(includeIfNull: false) String? baseModelId,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(includeIfNull: false) int? topK,
      @JsonKey(includeIfNull: false) double? topP,
      @JsonKey(includeIfNull: false) int? inputTokenLimit,
      @JsonKey(includeIfNull: false) int? outputTokenLimit,
      @JsonKey(includeIfNull: false) List<String>? supportedGenerationMethods});
}

/// @nodoc
class __$ModelCopyWithImpl<$Res> implements _$ModelCopyWith<$Res> {
  __$ModelCopyWithImpl(this._self, this._then);

  final _Model _self;
  final $Res Function(_Model) _then;

  /// Create a copy of Model
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? displayName = freezed,
    Object? description = freezed,
    Object? version = freezed,
    Object? baseModelId = freezed,
    Object? temperature = freezed,
    Object? topK = freezed,
    Object? topP = freezed,
    Object? inputTokenLimit = freezed,
    Object? outputTokenLimit = freezed,
    Object? supportedGenerationMethods = freezed,
  }) {
    return _then(_Model(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      baseModelId: freezed == baseModelId
          ? _self.baseModelId
          : baseModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topK: freezed == topK
          ? _self.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      topP: freezed == topP
          ? _self.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      inputTokenLimit: freezed == inputTokenLimit
          ? _self.inputTokenLimit
          : inputTokenLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      outputTokenLimit: freezed == outputTokenLimit
          ? _self.outputTokenLimit
          : outputTokenLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      supportedGenerationMethods: freezed == supportedGenerationMethods
          ? _self._supportedGenerationMethods
          : supportedGenerationMethods // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
mixin _$GenerateContentRequest {
  /// Optional. Configuration options for model generation and outputs.
  @JsonKey(includeIfNull: false)
  GenerationConfig? get generationConfig;

  /// Required. The content of the current conversation with the model. For single-turn queries, this is a single instance. For multi-turn queries, this is a repeated field that contains conversation history + latest request.
  @JsonKey(includeIfNull: false)
  List<Content>? get contents;

  /// Optional. A list of unique `SafetySetting` instances for blocking unsafe content. This will be enforced on the `GenerateContentRequest.contents` and `GenerateContentResponse.candidates`. There should not be more than one setting for each `SafetyCategory` type. The API will block any contents and responses that fail to meet the thresholds set by these settings. This list overrides the default settings for each `SafetyCategory` specified in the safety_settings. If there is no `SafetySetting` for a given `SafetyCategory` provided in the list, the API will use the default safety setting for that category. Harm categories HARM_CATEGORY_HATE_SPEECH, HARM_CATEGORY_SEXUALLY_EXPLICIT, HARM_CATEGORY_DANGEROUS_CONTENT, HARM_CATEGORY_HARASSMENT are supported.
  @JsonKey(includeIfNull: false)
  List<SafetySetting>? get safetySettings;

  /// Create a copy of GenerateContentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenerateContentRequestCopyWith<GenerateContentRequest> get copyWith =>
      _$GenerateContentRequestCopyWithImpl<GenerateContentRequest>(
          this as GenerateContentRequest, _$identity);

  /// Serializes this GenerateContentRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenerateContentRequest &&
            (identical(other.generationConfig, generationConfig) ||
                other.generationConfig == generationConfig) &&
            const DeepCollectionEquality().equals(other.contents, contents) &&
            const DeepCollectionEquality()
                .equals(other.safetySettings, safetySettings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      generationConfig,
      const DeepCollectionEquality().hash(contents),
      const DeepCollectionEquality().hash(safetySettings));

  @override
  String toString() {
    return 'GenerateContentRequest(generationConfig: $generationConfig, contents: $contents, safetySettings: $safetySettings)';
  }
}

/// @nodoc
abstract mixin class $GenerateContentRequestCopyWith<$Res> {
  factory $GenerateContentRequestCopyWith(GenerateContentRequest value,
          $Res Function(GenerateContentRequest) _then) =
      _$GenerateContentRequestCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) GenerationConfig? generationConfig,
      @JsonKey(includeIfNull: false) List<Content>? contents,
      @JsonKey(includeIfNull: false) List<SafetySetting>? safetySettings});

  $GenerationConfigCopyWith<$Res>? get generationConfig;
}

/// @nodoc
class _$GenerateContentRequestCopyWithImpl<$Res>
    implements $GenerateContentRequestCopyWith<$Res> {
  _$GenerateContentRequestCopyWithImpl(this._self, this._then);

  final GenerateContentRequest _self;
  final $Res Function(GenerateContentRequest) _then;

  /// Create a copy of GenerateContentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generationConfig = freezed,
    Object? contents = freezed,
    Object? safetySettings = freezed,
  }) {
    return _then(_self.copyWith(
      generationConfig: freezed == generationConfig
          ? _self.generationConfig
          : generationConfig // ignore: cast_nullable_to_non_nullable
              as GenerationConfig?,
      contents: freezed == contents
          ? _self.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
      safetySettings: freezed == safetySettings
          ? _self.safetySettings
          : safetySettings // ignore: cast_nullable_to_non_nullable
              as List<SafetySetting>?,
    ));
  }

  /// Create a copy of GenerateContentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GenerationConfigCopyWith<$Res>? get generationConfig {
    if (_self.generationConfig == null) {
      return null;
    }

    return $GenerationConfigCopyWith<$Res>(_self.generationConfig!, (value) {
      return _then(_self.copyWith(generationConfig: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GenerateContentRequest].
extension GenerateContentRequestPatterns on GenerateContentRequest {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GenerateContentRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GenerateContentRequest() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GenerateContentRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerateContentRequest():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GenerateContentRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerateContentRequest() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) GenerationConfig? generationConfig,
            @JsonKey(includeIfNull: false) List<Content>? contents,
            @JsonKey(includeIfNull: false) List<SafetySetting>? safetySettings)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GenerateContentRequest() when $default != null:
        return $default(
            _that.generationConfig, _that.contents, _that.safetySettings);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(includeIfNull: false) GenerationConfig? generationConfig,
            @JsonKey(includeIfNull: false) List<Content>? contents,
            @JsonKey(includeIfNull: false) List<SafetySetting>? safetySettings)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerateContentRequest():
        return $default(
            _that.generationConfig, _that.contents, _that.safetySettings);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(includeIfNull: false) GenerationConfig? generationConfig,
            @JsonKey(includeIfNull: false) List<Content>? contents,
            @JsonKey(includeIfNull: false) List<SafetySetting>? safetySettings)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerateContentRequest() when $default != null:
        return $default(
            _that.generationConfig, _that.contents, _that.safetySettings);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GenerateContentRequest extends GenerateContentRequest {
  const _GenerateContentRequest(
      {@JsonKey(includeIfNull: false) this.generationConfig,
      @JsonKey(includeIfNull: false) final List<Content>? contents,
      @JsonKey(includeIfNull: false) final List<SafetySetting>? safetySettings})
      : _contents = contents,
        _safetySettings = safetySettings,
        super._();
  factory _GenerateContentRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateContentRequestFromJson(json);

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

  /// Create a copy of GenerateContentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GenerateContentRequestCopyWith<_GenerateContentRequest> get copyWith =>
      __$GenerateContentRequestCopyWithImpl<_GenerateContentRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GenerateContentRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GenerateContentRequest &&
            (identical(other.generationConfig, generationConfig) ||
                other.generationConfig == generationConfig) &&
            const DeepCollectionEquality().equals(other._contents, _contents) &&
            const DeepCollectionEquality()
                .equals(other._safetySettings, _safetySettings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      generationConfig,
      const DeepCollectionEquality().hash(_contents),
      const DeepCollectionEquality().hash(_safetySettings));

  @override
  String toString() {
    return 'GenerateContentRequest(generationConfig: $generationConfig, contents: $contents, safetySettings: $safetySettings)';
  }
}

/// @nodoc
abstract mixin class _$GenerateContentRequestCopyWith<$Res>
    implements $GenerateContentRequestCopyWith<$Res> {
  factory _$GenerateContentRequestCopyWith(_GenerateContentRequest value,
          $Res Function(_GenerateContentRequest) _then) =
      __$GenerateContentRequestCopyWithImpl;
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
class __$GenerateContentRequestCopyWithImpl<$Res>
    implements _$GenerateContentRequestCopyWith<$Res> {
  __$GenerateContentRequestCopyWithImpl(this._self, this._then);

  final _GenerateContentRequest _self;
  final $Res Function(_GenerateContentRequest) _then;

  /// Create a copy of GenerateContentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? generationConfig = freezed,
    Object? contents = freezed,
    Object? safetySettings = freezed,
  }) {
    return _then(_GenerateContentRequest(
      generationConfig: freezed == generationConfig
          ? _self.generationConfig
          : generationConfig // ignore: cast_nullable_to_non_nullable
              as GenerationConfig?,
      contents: freezed == contents
          ? _self._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
      safetySettings: freezed == safetySettings
          ? _self._safetySettings
          : safetySettings // ignore: cast_nullable_to_non_nullable
              as List<SafetySetting>?,
    ));
  }

  /// Create a copy of GenerateContentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GenerationConfigCopyWith<$Res>? get generationConfig {
    if (_self.generationConfig == null) {
      return null;
    }

    return $GenerationConfigCopyWith<$Res>(_self.generationConfig!, (value) {
      return _then(_self.copyWith(generationConfig: value));
    });
  }
}

// dart format on
