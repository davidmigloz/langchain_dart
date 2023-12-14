// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: Part
// ==========================================

/// A datatype containing media that is part of a multi-part `Content` message. A `Part` consists of data which has an associated datatype. A `Part` can only contain one of the accepted types in `Part.data`. A `Part` must have a fixed IANA MIME type identifying the type and subtype of the media if the `inline_data` field is filled with raw bytes.
@freezed
class Part with _$Part {
  const Part._();

  /// Factory constructor for Part
  const factory Part({
    /// Inline media bytes.
    @JsonKey(includeIfNull: false) Blob? inlineData,

    /// Inline text.
    @JsonKey(includeIfNull: false) String? text,
  }) = _Part;

  /// Object construction from a JSON representation
  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['inlineData', 'text'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'inlineData': inlineData,
      'text': text,
    };
  }
}
