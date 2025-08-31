// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: PullModelRequest
// ==========================================

/// Request class for pulling a model.
@freezed
abstract class PullModelRequest with _$PullModelRequest {
  const PullModelRequest._();

  /// Factory constructor for PullModelRequest
  const factory PullModelRequest({
    /// The model name.
    ///
    /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
    required String model,

    /// Allow insecure connections to the library.
    ///
    /// Only use this if you are pulling from your own library during development.
    @Default(false) bool insecure,

    /// Ollama username.
    @JsonKey(includeIfNull: false) String? username,

    /// Ollama password.
    @JsonKey(includeIfNull: false) String? password,

    /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
    @Default(false) bool stream,
  }) = _PullModelRequest;

  /// Object construction from a JSON representation
  factory PullModelRequest.fromJson(Map<String, dynamic> json) =>
      _$PullModelRequestFromJson(json);

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
