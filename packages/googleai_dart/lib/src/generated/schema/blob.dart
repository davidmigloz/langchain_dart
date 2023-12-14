// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: Blob
// ==========================================

/// Raw media bytes. Text should not be sent as raw bytes, use the 'text' field.
@freezed
class Blob with _$Blob {
  const Blob._();

  /// Factory constructor for Blob
  const factory Blob({
    /// The IANA standard MIME type of the source data. Accepted types include: "image/png", "image/jpeg", "image/heic", "image/heif", "image/webp".
    @JsonKey(includeIfNull: false) String? mimeType,

    /// Raw bytes for media formats.
    @JsonKey(includeIfNull: false) String? data,
  }) = _Blob;

  /// Object construction from a JSON representation
  factory Blob.fromJson(Map<String, dynamic> json) => _$BlobFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['mimeType', 'data'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'mimeType': mimeType,
      'data': data,
    };
  }
}
