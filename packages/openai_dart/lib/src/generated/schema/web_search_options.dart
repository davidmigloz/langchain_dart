// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: WebSearchOptions
// ==========================================

/// This tool searches the web for relevant results to use in a response.
@freezed
abstract class WebSearchOptions with _$WebSearchOptions {
  const WebSearchOptions._();

  /// Factory constructor for WebSearchOptions
  const factory WebSearchOptions({
    /// Approximate location parameters for the search.
    @JsonKey(name: 'user_location', includeIfNull: false)
    WebSearchOptionsUserLocation? userLocation,

    /// High level guidance for the amount of context window space to use for the
    /// search. One of `low`, `medium`, or `high`. `medium` is the default.
    @JsonKey(name: 'search_context_size')
    @Default(WebSearchContextSize.medium)
    WebSearchContextSize searchContextSize,
  }) = _WebSearchOptions;

  /// Object construction from a JSON representation
  factory WebSearchOptions.fromJson(Map<String, dynamic> json) =>
      _$WebSearchOptionsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'user_location',
    'search_context_size',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'user_location': userLocation,
      'search_context_size': searchContextSize,
    };
  }
}

// ==========================================
// CLASS: WebSearchOptionsUserLocation
// ==========================================

/// Approximate location parameters for the search.
@freezed
abstract class WebSearchOptionsUserLocation
    with _$WebSearchOptionsUserLocation {
  const WebSearchOptionsUserLocation._();

  /// Factory constructor for WebSearchOptionsUserLocation
  const factory WebSearchOptionsUserLocation({
    /// The type of location approximation. Always `approximate`.
    required WebSearchOptionsUserLocationType type,

    /// Approximate location parameters for the search.
    required WebSearchLocation approximate,
  }) = _WebSearchOptionsUserLocation;

  /// Object construction from a JSON representation
  factory WebSearchOptionsUserLocation.fromJson(Map<String, dynamic> json) =>
      _$WebSearchOptionsUserLocationFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'approximate'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'type': type, 'approximate': approximate};
  }
}

// ==========================================
// ENUM: WebSearchOptionsUserLocationType
// ==========================================

/// The type of location approximation. Always `approximate`.
enum WebSearchOptionsUserLocationType {
  @JsonValue('approximate')
  approximate,
}
