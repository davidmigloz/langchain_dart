// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: ListModelsResponse
// ==========================================

/// Response from `ListModel` containing a paginated list of Models.
@freezed
class ListModelsResponse with _$ListModelsResponse {
  const ListModelsResponse._();

  /// Factory constructor for ListModelsResponse
  const factory ListModelsResponse({
    /// A token, which can be sent as `page_token` to retrieve the next page. If this field is omitted, there are no more pages.
    @JsonKey(includeIfNull: false) String? nextPageToken,

    /// The returned Models.
    @JsonKey(includeIfNull: false) List<Model>? models,
  }) = _ListModelsResponse;

  /// Object construction from a JSON representation
  factory ListModelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListModelsResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['nextPageToken', 'models'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'nextPageToken': nextPageToken,
      'models': models,
    };
  }
}
