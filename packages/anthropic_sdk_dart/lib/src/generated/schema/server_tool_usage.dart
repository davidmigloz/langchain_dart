// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: ServerToolUsage
// ==========================================

/// Usage information for server-side tool execution.
@freezed
abstract class ServerToolUsage with _$ServerToolUsage {
  const ServerToolUsage._();

  /// Factory constructor for ServerToolUsage
  const factory ServerToolUsage({
    /// The number of web search requests made during tool execution.
    @JsonKey(name: 'web_search_requests', includeIfNull: false)
    int? webSearchRequests,
  }) = _ServerToolUsage;

  /// Object construction from a JSON representation
  factory ServerToolUsage.fromJson(Map<String, dynamic> json) =>
      _$ServerToolUsageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['web_search_requests'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'web_search_requests': webSearchRequests};
  }
}
