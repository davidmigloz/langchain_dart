// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: WebSearchLocation
// ==========================================

/// Approximate location parameters for the search.
@freezed
class WebSearchLocation with _$WebSearchLocation {
  const WebSearchLocation._();

  /// Factory constructor for WebSearchLocation
  const factory WebSearchLocation({
    /// The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
    @JsonKey(includeIfNull: false) String? country,

    /// Free text input for the region of the user, e.g. `California`.
    @JsonKey(includeIfNull: false) String? region,

    /// Free text input for the city of the user, e.g. `San Francisco`.
    @JsonKey(includeIfNull: false) String? city,

    /// The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los_Angeles`.
    @JsonKey(includeIfNull: false) String? timezone,
  }) = _WebSearchLocation;

  /// Object construction from a JSON representation
  factory WebSearchLocation.fromJson(Map<String, dynamic> json) =>
      _$WebSearchLocationFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'country',
    'region',
    'city',
    'timezone'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'region': region,
      'city': city,
      'timezone': timezone,
    };
  }
}
