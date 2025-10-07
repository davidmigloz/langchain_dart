// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ChatCompletionStreamOptions
// ==========================================

/// Options for streaming response. Only set this when you set `stream: true`.
@freezed
abstract class ChatCompletionStreamOptions with _$ChatCompletionStreamOptions {
  const ChatCompletionStreamOptions._();

  /// Factory constructor for ChatCompletionStreamOptions
  const factory ChatCompletionStreamOptions({
    /// If set, an additional chunk will be streamed before the `data: [DONE]` message. The `usage` field on this chunk shows the token usage statistics for the entire request, and the `choices` field will always be an empty array. All other chunks will also include a `usage` field, but with a null value.
    @JsonKey(name: 'include_usage', includeIfNull: false) bool? includeUsage,
  }) = _ChatCompletionStreamOptions;

  /// Object construction from a JSON representation
  factory ChatCompletionStreamOptions.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionStreamOptionsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['include_usage'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'include_usage': includeUsage,
    };
  }
}
