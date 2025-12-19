// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ImageGenUsage
// ==========================================

/// Token usage details for image generation.
@freezed
abstract class ImageGenUsage with _$ImageGenUsage {
  const ImageGenUsage._();

  /// Factory constructor for ImageGenUsage
  const factory ImageGenUsage({
    /// Total number of tokens used.
    @JsonKey(name: 'total_tokens') required int totalTokens,

    /// Number of input tokens.
    @JsonKey(name: 'input_tokens') required int inputTokens,

    /// Number of output tokens.
    @JsonKey(name: 'output_tokens') required int outputTokens,

    /// Details about the input tokens.
    @JsonKey(name: 'input_tokens_details')
    required ImageGenUsageInputTokensDetails inputTokensDetails,
  }) = _ImageGenUsage;

  /// Object construction from a JSON representation
  factory ImageGenUsage.fromJson(Map<String, dynamic> json) =>
      _$ImageGenUsageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'total_tokens',
    'input_tokens',
    'output_tokens',
    'input_tokens_details',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'total_tokens': totalTokens,
      'input_tokens': inputTokens,
      'output_tokens': outputTokens,
      'input_tokens_details': inputTokensDetails,
    };
  }
}

// ==========================================
// CLASS: ImageGenUsageInputTokensDetails
// ==========================================

/// Details about the input tokens.
@freezed
abstract class ImageGenUsageInputTokensDetails
    with _$ImageGenUsageInputTokensDetails {
  const ImageGenUsageInputTokensDetails._();

  /// Factory constructor for ImageGenUsageInputTokensDetails
  const factory ImageGenUsageInputTokensDetails({
    /// Text tokens in the input.
    @JsonKey(name: 'text_tokens', includeIfNull: false) int? textTokens,

    /// Image tokens in the input.
    @JsonKey(name: 'image_tokens', includeIfNull: false) int? imageTokens,
  }) = _ImageGenUsageInputTokensDetails;

  /// Object construction from a JSON representation
  factory ImageGenUsageInputTokensDetails.fromJson(Map<String, dynamic> json) =>
      _$ImageGenUsageInputTokensDetailsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['text_tokens', 'image_tokens'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'text_tokens': textTokens, 'image_tokens': imageTokens};
  }
}
