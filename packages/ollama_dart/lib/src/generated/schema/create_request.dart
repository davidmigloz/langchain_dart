// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: CreateRequest
// ==========================================

/// No Description
@freezed
class CreateRequest with _$CreateRequest {
  const CreateRequest._();

  /// Factory constructor for CreateRequest
  const factory CreateRequest({
    /// (required) the model name
    required String name,

    /// contents of the Modelfile
    required String modelfile,

    /// path to the Modelfile (deprecated: please use modelfile instead)
    @JsonKey(includeIfNull: false) String? path,

    /// (optional) if false the response will be returned as a single response object, rather than a stream of objects
    @JsonKey(includeIfNull: false) bool? stream,
  }) = _CreateRequest;

  /// Object construction from a JSON representation
  factory CreateRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'name',
    'modelfile',
    'path',
    'stream'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'modelfile': modelfile,
      'path': path,
      'stream': stream,
    };
  }
}
