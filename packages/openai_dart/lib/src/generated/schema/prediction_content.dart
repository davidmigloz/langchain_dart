// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: PredictionContent
// ==========================================

/// Configuration for a [Predicted Output](https://platform.openai.com/docs/guides/predicted-outputs),
/// which can greatly improve response times when large parts of the model
/// response are known ahead of time. This is most common when you are
/// regenerating a file with only minor changes to most of the content.
@freezed
abstract class PredictionContent with _$PredictionContent {
  const PredictionContent._();

  /// Factory constructor for PredictionContent
  const factory PredictionContent({
    /// The type of the predicted content you want to provide. This type is
    /// currently always `content`.
    @Default('content') String type,

    /// The content that should be matched when generating a model response.
    /// If generated tokens would match this content, the entire model response
    /// can be returned much more quickly.
    @_PredictionContentContentConverter()
    required PredictionContentContent content,
  }) = _PredictionContent;

  /// Object construction from a JSON representation
  factory PredictionContent.fromJson(Map<String, dynamic> json) =>
      _$PredictionContentFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'content'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'content': content,
    };
  }
}

// ==========================================
// CLASS: PredictionContentContent
// ==========================================

/// The content that should be matched when generating a model response.
/// If generated tokens would match this content, the entire model response
/// can be returned much more quickly.
@freezed
sealed class PredictionContentContent with _$PredictionContentContent {
  const PredictionContentContent._();

  /// An array of content parts with a defined type. Supported options differ based on the [model](https://platform.openai.com/docs/models) being used to generate the response. Can contain text inputs.
  const factory PredictionContentContent.textParts(
    List<ChatCompletionMessageContentPartText> value,
  ) = PredictionContentContentListChatCompletionMessageContentPartText;

  /// The content used for a Predicted Output. This is often the
  /// text of a file you are regenerating with minor changes.
  const factory PredictionContentContent.text(
    String value,
  ) = PredictionContentContentString;

  /// Object construction from a JSON representation
  factory PredictionContentContent.fromJson(Map<String, dynamic> json) =>
      _$PredictionContentContentFromJson(json);
}

/// Custom JSON converter for [PredictionContentContent]
class _PredictionContentContentConverter
    implements JsonConverter<PredictionContentContent, Object?> {
  const _PredictionContentContentConverter();

  @override
  PredictionContentContent fromJson(Object? data) {
    if (data is List && data.every((item) => item is Map)) {
      return PredictionContentContentListChatCompletionMessageContentPartText(
        data
            .map(
              (i) => ChatCompletionMessageContentPartText.fromJson(
                i as Map<String, dynamic>,
              ),
            )
            .toList(growable: false),
      );
    }
    if (data is String) {
      return PredictionContentContentString(data);
    }
    throw Exception(
      'Unexpected value for PredictionContentContent: $data',
    );
  }

  @override
  Object? toJson(PredictionContentContent data) {
    return switch (data) {
      PredictionContentContentListChatCompletionMessageContentPartText(
        value: final v,
      ) =>
        v,
      PredictionContentContentString(value: final v) => v,
    };
  }
}
