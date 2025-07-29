// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: FormattedItem
// ==========================================

/// A formatted item.
@freezed
abstract class FormattedItem with _$FormattedItem {
  const FormattedItem._();

  /// Factory constructor for FormattedItem
  const factory FormattedItem({
    /// The item to add to the conversation.
    /// Any of: [ItemMessage], [ItemFunctionCall], [ItemFunctionCallOutput]
    required Item item,

    /// A formatted property.
    required FormattedProperty? formatted,
  }) = _FormattedItem;

  /// Object construction from a JSON representation
  factory FormattedItem.fromJson(Map<String, dynamic> json) =>
      _$FormattedItemFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['item', 'formatted'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'item': item,
      'formatted': formatted,
    };
  }
}
