// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ResponseItemList
// ==========================================

/// List of input items returned by the List input items endpoint.
@freezed
class ResponseItemList with _$ResponseItemList {
  const ResponseItemList._();

  /// Factory constructor for ResponseItemList
  const factory ResponseItemList({
    /// No Description
    required String object,

    /// No Description
    required List<Map<String, dynamic>> data,

    /// No Description
    @JsonKey(name: 'first_id') required String firstId,

    /// No Description
    @JsonKey(name: 'last_id') required String lastId,

    /// No Description
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _ResponseItemList;

  /// Object construction from a JSON representation
  factory ResponseItemList.fromJson(Map<String, dynamic> json) =>
      _$ResponseItemListFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'object',
    'data',
    'first_id',
    'last_id',
    'has_more'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'object': object,
      'data': data,
      'first_id': firstId,
      'last_id': lastId,
      'has_more': hasMore,
    };
  }
}
