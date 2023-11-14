// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: UnionCompletionNamedToolChoice
// ==========================================

/// Union class for [ChatCompletionNamedToolChoice]
@Freezed(unionKey: 'type')
sealed class UnionCompletionNamedToolChoice
    with _$UnionCompletionNamedToolChoice {
  const UnionCompletionNamedToolChoice._();

  // ------------------------------------------
  // UNION: ChatCompletionNamedToolChoice
  // ------------------------------------------

  /// Union constructor for [ChatCompletionNamedToolChoice]
  const factory UnionCompletionNamedToolChoice.Chat({
    /// The type of the tool. Currently, only `function` is supported.
    @JsonKey(includeIfNull: false) String? type,

    /// Forces the model to call the specified function.
    @JsonKey(includeIfNull: false) ChatCompletionFunctionCallOption? function,
  }) = UnionCompletionNamedToolChoiceChat;

  /// Object construction from a JSON representation
  factory UnionCompletionNamedToolChoice.fromJson(Map<String, dynamic> json) =>
      _$UnionCompletionNamedToolChoiceFromJson(json);
}
