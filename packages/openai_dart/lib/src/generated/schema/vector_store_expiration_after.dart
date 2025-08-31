// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: VectorStoreExpirationAfter
// ==========================================

/// The expiration policy for a vector store.
@freezed
abstract class VectorStoreExpirationAfter with _$VectorStoreExpirationAfter {
  const VectorStoreExpirationAfter._();

  /// Factory constructor for VectorStoreExpirationAfter
  const factory VectorStoreExpirationAfter({
    /// Anchor timestamp after which the expiration policy applies. Supported anchors: `last_active_at`.
    required VectorStoreExpirationAfterAnchor anchor,

    /// The number of days after the anchor time that the vector store will expire.
    required int days,
  }) = _VectorStoreExpirationAfter;

  /// Object construction from a JSON representation
  factory VectorStoreExpirationAfter.fromJson(Map<String, dynamic> json) =>
      _$VectorStoreExpirationAfterFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['anchor', 'days'];

  /// Validation constants
  static const daysMinValue = 1;
  static const daysMaxValue = 365;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (days < daysMinValue) {
      return "The value of 'days' cannot be < $daysMinValue";
    }
    if (days > daysMaxValue) {
      return "The value of 'days' cannot be > $daysMaxValue";
    }
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'anchor': anchor,
      'days': days,
    };
  }
}

// ==========================================
// ENUM: VectorStoreExpirationAfterAnchor
// ==========================================

/// Anchor timestamp after which the expiration policy applies. Supported anchors: `last_active_at`.
enum VectorStoreExpirationAfterAnchor {
  @JsonValue('last_active_at')
  lastActiveAt,
}
