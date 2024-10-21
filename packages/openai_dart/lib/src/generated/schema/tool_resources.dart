// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ToolResources
// ==========================================

/// A set of resources that are made available to the assistant's tools in this thread. The resources are specific
/// to the type of tool. For example, the `code_interpreter` tool requires a list of file IDs, while the
/// `file_search` tool requires a list of vector store IDs.
@freezed
class ToolResources with _$ToolResources {
  const ToolResources._();

  /// Factory constructor for ToolResources
  const factory ToolResources({
    /// No Description
    @JsonKey(name: 'code_interpreter', includeIfNull: false)
    ToolResourcesCodeInterpreter? codeInterpreter,

    /// No Description
    @JsonKey(name: 'file_search', includeIfNull: false)
    ToolResourcesFileSearch? fileSearch,
  }) = _ToolResources;

  /// Object construction from a JSON representation
  factory ToolResources.fromJson(Map<String, dynamic> json) =>
      _$ToolResourcesFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['code_interpreter', 'file_search'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'code_interpreter': codeInterpreter,
      'file_search': fileSearch,
    };
  }
}

// ==========================================
// CLASS: ToolResourcesCodeInterpreter
// ==========================================

/// No Description
@freezed
class ToolResourcesCodeInterpreter with _$ToolResourcesCodeInterpreter {
  const ToolResourcesCodeInterpreter._();

  /// Factory constructor for ToolResourcesCodeInterpreter
  const factory ToolResourcesCodeInterpreter({
    /// A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the
    /// `code_interpreter` tool. There can be a maximum of 20 files associated with the tool.
    @JsonKey(name: 'file_ids') @Default([]) List<String> fileIds,
  }) = _ToolResourcesCodeInterpreter;

  /// Object construction from a JSON representation
  factory ToolResourcesCodeInterpreter.fromJson(Map<String, dynamic> json) =>
      _$ToolResourcesCodeInterpreterFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['file_ids'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'file_ids': fileIds,
    };
  }
}

// ==========================================
// CLASS: ToolResourcesFileSearch
// ==========================================

/// No Description
@freezed
class ToolResourcesFileSearch with _$ToolResourcesFileSearch {
  const ToolResourcesFileSearch._();

  /// Factory constructor for ToolResourcesFileSearch
  const factory ToolResourcesFileSearch({
    /// The [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to
    /// this thread. There can be a maximum of 1 vector store attached to the thread.
    @JsonKey(name: 'vector_store_ids', includeIfNull: false)
    List<String>? vectorStoreIds,

    /// A helper to create a [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object)
    /// with file_ids and attach it to this thread. There can be a maximum of 1 vector store attached to the
    /// thread.
    @JsonKey(name: 'vector_stores', includeIfNull: false)
    List<ToolResourcesFileSearchVectorStore>? vectorStores,
  }) = _ToolResourcesFileSearch;

  /// Object construction from a JSON representation
  factory ToolResourcesFileSearch.fromJson(Map<String, dynamic> json) =>
      _$ToolResourcesFileSearchFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'vector_store_ids',
    'vector_stores'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'vector_store_ids': vectorStoreIds,
      'vector_stores': vectorStores,
    };
  }
}
