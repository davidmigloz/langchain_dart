// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: ContentPartItemReference
// ==========================================

/// A part of the item reference content.
@freezed
class ContentPartItemReference with _$ContentPartItemReference {
  const ContentPartItemReference._();

  /// Factory constructor for ContentPartItemReference
  const factory ContentPartItemReference({
    /// The content type.
    @Default(ContentType.itemReference) ContentType type,

    /// ID of a previous conversation item to reference (for `item_reference`
    /// content types in `response.create` events). These can reference both
    /// client and server created items.
    @JsonKey(includeIfNull: false) String? id,
  }) = _ContentPartItemReference;

  /// Object construction from a JSON representation
  factory ContentPartItemReference.fromJson(Map<String, dynamic> json) =>
      _$ContentPartItemReferenceFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'id'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'id': id,
    };
  }
}
