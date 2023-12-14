// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: Status
// ==========================================

/// The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
@freezed
class Status with _$Status {
  const Status._();

  /// Factory constructor for Status
  const factory Status({
    /// A list of messages that carry the error details. There is a common set of message types for APIs to use.
    @JsonKey(includeIfNull: false) List<Map<String, dynamic>>? details,

    /// The status code, which should be an enum value of google.rpc.Code.
    @JsonKey(includeIfNull: false) int? code,

    /// A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
    @JsonKey(includeIfNull: false) String? message,
  }) = _Status;

  /// Object construction from a JSON representation
  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['details', 'code', 'message'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'details': details,
      'code': code,
      'message': message,
    };
  }
}
