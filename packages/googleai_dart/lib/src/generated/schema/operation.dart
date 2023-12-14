// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: Operation
// ==========================================

/// This resource represents a long-running operation that is the result of a network API call.
@freezed
class Operation with _$Operation {
  const Operation._();

  /// Factory constructor for Operation
  const factory Operation({
    /// The server-assigned name, which is only unique within the same service that originally returns it. If you use the default HTTP mapping, the `name` should be a resource name ending with `operations/{unique_id}`.
    @JsonKey(includeIfNull: false) String? name,

    /// The normal, successful response of the operation. If the original method returns no data on success, such as `Delete`, the response is `google.protobuf.Empty`. If the original method is standard `Get`/`Create`/`Update`, the response should be the resource. For other methods, the response should have the type `XxxResponse`, where `Xxx` is the original method name. For example, if the original method name is `TakeSnapshot()`, the inferred response type is `TakeSnapshotResponse`.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? response,

    /// If the value is `false`, it means the operation is still in progress. If `true`, the operation is completed, and either `error` or `response` is available.
    @JsonKey(includeIfNull: false) bool? done,

    /// Service-specific metadata associated with the operation. It typically contains progress information and common metadata such as create time. Some services might not provide such metadata. Any method that returns a long-running operation should document the metadata type, if any.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,

    /// The error result of the operation in case of failure or cancellation.
    @JsonKey(includeIfNull: false) Status? error,
  }) = _Operation;

  /// Object construction from a JSON representation
  factory Operation.fromJson(Map<String, dynamic> json) =>
      _$OperationFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'name',
    'response',
    'done',
    'metadata',
    'error'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'response': response,
      'done': done,
      'metadata': metadata,
      'error': error,
    };
  }
}
