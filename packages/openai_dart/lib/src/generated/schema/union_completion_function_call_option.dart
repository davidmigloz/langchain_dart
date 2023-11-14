// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: UnionCompletionFunctionCallOption
// ==========================================

/// Union class for [ChatCompletionFunctionCallOption]
@Freezed(unionKey: 'type')
sealed class UnionCompletionFunctionCallOption
    with _$UnionCompletionFunctionCallOption {
  const UnionCompletionFunctionCallOption._();

  // ------------------------------------------
  // UNION: ChatCompletionFunctionCallOption
  // ------------------------------------------

  /// Union constructor for [ChatCompletionFunctionCallOption]
  const factory UnionCompletionFunctionCallOption.Chat({
    /// The name of the function to call.
    required String name,
  }) = UnionCompletionFunctionCallOptionChat;

  /// Object construction from a JSON representation
  factory UnionCompletionFunctionCallOption.fromJson(
          Map<String, dynamic> json) =>
      _$UnionCompletionFunctionCallOptionFromJson(json);
}
