// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: PullRequest
// ==========================================

/// Download a model from the ollama library. Cancelled pulls are resumed from where they left off, and multiple calls will share the same download progress.
@freezed
class PullRequest with _$PullRequest {
  const PullRequest._();

  /// Factory constructor for PullRequest
  const factory PullRequest({
    /// name of the model to pull
    required String name,

    /// (optional) allow insecure connections to the library. Only use this if you are pulling from your own library during development.
    @JsonKey(includeIfNull: false) bool? insecure,

    /// (optional) if false the response will be returned as a single response object, rather than a stream of objects
    @JsonKey(includeIfNull: false) bool? stream,
  }) = _PullRequest;

  /// Object construction from a JSON representation
  factory PullRequest.fromJson(Map<String, dynamic> json) =>
      _$PullRequestFromJson(json);

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
