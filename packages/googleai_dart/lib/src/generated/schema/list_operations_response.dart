// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: ListOperationsResponse
// ==========================================

/// The response message for Operations.ListOperations.
@freezed
class ListOperationsResponse with _$ListOperationsResponse {
  const ListOperationsResponse._();

  /// Factory constructor for ListOperationsResponse
  const factory ListOperationsResponse({
    /// A list of operations that matches the specified filter in the request.
    @JsonKey(includeIfNull: false) List<Operation>? operations,

    /// The standard List next-page token.
    @JsonKey(includeIfNull: false) String? nextPageToken,
  }) = _ListOperationsResponse;

  /// Object construction from a JSON representation
  factory ListOperationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOperationsResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['operations', 'nextPageToken'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'operations': operations,
      'nextPageToken': nextPageToken,
    };
  }
}
