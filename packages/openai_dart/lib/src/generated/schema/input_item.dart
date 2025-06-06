// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: InputItem
// ==========================================

/// An input item for a response.
@freezed
class InputItem with _$InputItem {
  const InputItem._();

  /// Factory constructor for InputItem
  const factory InputItem({
    /// The ID of the input item.
    required String id,

    /// The type of the input content.
    required InputContentType type,

    /// No Description
    required List<UnionSchema> content,
  }) = _InputItem;

  /// Object construction from a JSON representation
  factory InputItem.fromJson(Map<String, dynamic> json) =>
      _$InputItemFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'type', 'content'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'content': content,
    };
  }
}
