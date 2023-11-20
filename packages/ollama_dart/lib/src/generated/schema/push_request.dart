// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: PushRequest
// ==========================================

/// Upload a model to a model library. Requires registering for ollama.ai and adding a public key first.
@freezed
class PushRequest with _$PushRequest {
  const PushRequest._();

  /// Factory constructor for PushRequest
  const factory PushRequest({
    /// name of the model to push in the form of <namespace>/<model>:<tag>
    required String name,

    /// (optional) allow insecure connections to the library. Only use this if you are pushing to your library during development.
    @JsonKey(includeIfNull: false) bool? insecure,

    /// (optional) if false the response will be returned as a single response object, rather than a stream of objects
    @JsonKey(includeIfNull: false) bool? stream,
  }) = _PushRequest;

  /// Object construction from a JSON representation
  factory PushRequest.fromJson(Map<String, dynamic> json) =>
      _$PushRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['name', 'insecure', 'stream'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'insecure': insecure,
      'stream': stream,
    };
  }
}
