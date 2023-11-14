// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ChatCompletionFunctionCallOption
// ==========================================

/// Forces the model to call the specified function.
@freezed
class ChatCompletionFunctionCallOption with _$ChatCompletionFunctionCallOption {
  const ChatCompletionFunctionCallOption._();

  /// Factory constructor for ChatCompletionFunctionCallOption
  const factory ChatCompletionFunctionCallOption({
    /// The name of the function to call.
    required String name,
  }) = _ChatCompletionFunctionCallOption;

  /// Object construction from a JSON representation
  factory ChatCompletionFunctionCallOption.fromJson(
          Map<String, dynamic> json) =>
      _$ChatCompletionFunctionCallOptionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['name'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
