// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: EventHandlerResult
// ==========================================

/// No Description
@freezed
class EventHandlerResult with _$EventHandlerResult {
  const EventHandlerResult._();

  /// Factory constructor for EventHandlerResult
  const factory EventHandlerResult({
    /// A formatted item.
    @JsonKey(includeIfNull: false) FormattedItem? item,

    /// Delta object.
    @JsonKey(includeIfNull: false) Delta? delta,

    /// The response resource.
    @JsonKey(includeIfNull: false) Response? response,
  }) = _EventHandlerResult;

  /// Object construction from a JSON representation
  factory EventHandlerResult.fromJson(Map<String, dynamic> json) =>
      _$EventHandlerResultFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['item', 'delta', 'response'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'item': item,
      'delta': delta,
      'response': response,
    };
  }
}
