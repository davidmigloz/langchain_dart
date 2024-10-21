// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ModifyThreadRequest
// ==========================================

/// Request object for the Modify thread endpoint.
@freezed
class ModifyThreadRequest with _$ModifyThreadRequest {
  const ModifyThreadRequest._();

  /// Factory constructor for ModifyThreadRequest
  const factory ModifyThreadRequest({
    /// A set of resources that are made available to the assistant's tools in this thread. The resources are specific
    /// to the type of tool. For example, the `code_interpreter` tool requires a list of file IDs, while the
    /// `file_search` tool requires a list of vector store IDs.
    @JsonKey(name: 'tool_resources', includeIfNull: false)
    ToolResources? toolResources,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional
    /// information about the object in a structured format. Keys can be a maximum of 64 characters long and values
    /// can be a maximum of 512 characters long.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
  }) = _ModifyThreadRequest;

  /// Object construction from a JSON representation
  factory ModifyThreadRequest.fromJson(Map<String, dynamic> json) =>
      _$ModifyThreadRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['tool_resources', 'metadata'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'tool_resources': toolResources,
      'metadata': metadata,
    };
  }
}
