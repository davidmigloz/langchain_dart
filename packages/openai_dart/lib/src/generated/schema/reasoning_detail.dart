// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ReasoningDetail
// ==========================================

/// Structured reasoning detail item containing different types of reasoning information.
///
/// **Provider:** OpenRouter
@freezed
abstract class ReasoningDetail with _$ReasoningDetail {
  const ReasoningDetail._();

  /// Factory constructor for ReasoningDetail
  const factory ReasoningDetail({
    /// The type of reasoning detail:
    /// - `summary`: A natural-language summary of reasoning
    /// - `encrypted`: Encrypted reasoning content for stateless workflows
    /// - `text`: Raw reasoning text
    required ReasoningDetailType type,

    /// Text content (for summary and text types)
    @JsonKey(includeIfNull: false) String? text,

    /// Encrypted data (for encrypted type)
    @JsonKey(includeIfNull: false) String? data,
  }) = _ReasoningDetail;

  /// Object construction from a JSON representation
  factory ReasoningDetail.fromJson(Map<String, dynamic> json) =>
      _$ReasoningDetailFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'text', 'data'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'type': type, 'text': text, 'data': data};
  }
}

// ==========================================
// ENUM: ReasoningDetailType
// ==========================================

/// The type of reasoning detail:
/// - `summary`: A natural-language summary of reasoning
/// - `encrypted`: Encrypted reasoning content for stateless workflows
/// - `text`: Raw reasoning text
enum ReasoningDetailType {
  @JsonValue('summary')
  summary,
  @JsonValue('encrypted')
  encrypted,
  @JsonValue('text')
  text,
}
