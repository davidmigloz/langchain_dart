// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: Content
// ==========================================

/// The base structured datatype containing multi-part content of a message. A `Content` includes a `role` field designating the producer of the `Content` and a `parts` field containing multi-part data that contains the content of the message turn.
@freezed
class Content with _$Content {
  const Content._();

  /// Factory constructor for Content
  const factory Content({
    /// Optional. The producer of the content. Must be either 'user' or 'model'. Useful to set for multi-turn conversations, otherwise can be left blank or unset.
    @JsonKey(includeIfNull: false) String? role,

    /// Ordered `Parts` that constitute a single message. Parts may have different MIME types.
    @JsonKey(includeIfNull: false) List<Part>? parts,
  }) = _Content;

  /// Object construction from a JSON representation
  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['role', 'parts'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'parts': parts,
    };
  }
}
