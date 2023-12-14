// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: Empty
// ==========================================

/// A generic empty message that you can re-use to avoid defining duplicated empty messages in your APIs. A typical example is to use it as the request or the response type of an API method. For instance: service Foo { rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty); }
@freezed
class Empty with _$Empty {
  const Empty._();

  /// Factory constructor for Empty
  const factory Empty() = _Empty;

  /// Object construction from a JSON representation
  factory Empty.fromJson(Map<String, dynamic> json) => _$EmptyFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {};
  }
}
