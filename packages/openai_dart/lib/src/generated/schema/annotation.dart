// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: Annotation
// ==========================================

/// A URL citation when using web search.
@freezed
abstract class Annotation with _$Annotation {
  const Annotation._();

  /// Factory constructor for Annotation
  const factory Annotation({
    /// The type of the URL citation. Always `url_citation`.
    required AnnotationType type,

    /// A URL citation when using web search.
    @JsonKey(name: 'url_citation') required AnnotationUrlCitation urlCitation,
  }) = _Annotation;

  /// Object construction from a JSON representation
  factory Annotation.fromJson(Map<String, dynamic> json) =>
      _$AnnotationFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'url_citation'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'type': type, 'url_citation': urlCitation};
  }
}

// ==========================================
// ENUM: AnnotationType
// ==========================================

/// The type of the URL citation. Always `url_citation`.
enum AnnotationType {
  @JsonValue('url_citation')
  urlCitation,
}

// ==========================================
// CLASS: AnnotationUrlCitation
// ==========================================

/// A URL citation when using web search.
@freezed
abstract class AnnotationUrlCitation with _$AnnotationUrlCitation {
  const AnnotationUrlCitation._();

  /// Factory constructor for AnnotationUrlCitation
  const factory AnnotationUrlCitation({
    /// The index of the last character of the URL citation in the message.
    @JsonKey(name: 'end_index', includeIfNull: false) int? endIndex,

    /// The index of the first character of the URL citation in the message.
    @JsonKey(name: 'start_index', includeIfNull: false) int? startIndex,

    /// The URL of the web resource.
    @JsonKey(includeIfNull: false) String? url,

    /// The title of the web resource.
    @JsonKey(includeIfNull: false) String? title,
  }) = _AnnotationUrlCitation;

  /// Object construction from a JSON representation
  factory AnnotationUrlCitation.fromJson(Map<String, dynamic> json) =>
      _$AnnotationUrlCitationFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'end_index',
    'start_index',
    'url',
    'title',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'end_index': endIndex,
      'start_index': startIndex,
      'url': url,
      'title': title,
    };
  }
}
