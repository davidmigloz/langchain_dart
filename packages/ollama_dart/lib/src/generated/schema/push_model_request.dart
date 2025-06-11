// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: PushModelRequest
// ==========================================

/// Request class for pushing a model.
@freezed
class PushModelRequest with _$PushModelRequest {
  const PushModelRequest._();

  /// Factory constructor for PushModelRequest
  const factory PushModelRequest({
    /// The name of the model to push in the form of <namespace>/<model>:<tag>.
    required String model,

    /// Allow insecure connections to the library.
    ///
    /// Only use this if you are pushing to your library during development.
    @Default(false) bool insecure,

    /// Ollama username.
    @JsonKey(includeIfNull: false) String? username,

    /// Ollama password.
    @JsonKey(includeIfNull: false) String? password,

    /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
    @Default(false) bool stream,
  }) = _PushModelRequest;

  /// Object construction from a JSON representation
  factory PushModelRequest.fromJson(Map<String, dynamic> json) =>
      _$PushModelRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'insecure',
    'username',
    'password',
    'stream'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'insecure': insecure,
      'username': username,
      'password': password,
      'stream': stream,
    };
  }
}
