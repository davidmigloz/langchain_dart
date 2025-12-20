// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: WebSearchUserLocation
// ==========================================

/// User location information for web search.
@freezed
abstract class WebSearchUserLocation with _$WebSearchUserLocation {
  const WebSearchUserLocation._();

  /// Factory constructor for WebSearchUserLocation
  const factory WebSearchUserLocation({
    /// The type of location.
    @Default('approximate') String type,

    /// The city name.
    @JsonKey(includeIfNull: false) String? city,

    /// The region or state name.
    @JsonKey(includeIfNull: false) String? region,

    /// The country code (ISO 3166-1 alpha-2).
    @JsonKey(includeIfNull: false) String? country,

    /// The timezone (IANA timezone ID).
    @JsonKey(includeIfNull: false) String? timezone,
  }) = _WebSearchUserLocation;

  /// Object construction from a JSON representation
  factory WebSearchUserLocation.fromJson(Map<String, dynamic> json) =>
      _$WebSearchUserLocationFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'type',
    'city',
    'region',
    'country',
    'timezone',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'city': city,
      'region': region,
      'country': country,
      'timezone': timezone,
    };
  }
}
