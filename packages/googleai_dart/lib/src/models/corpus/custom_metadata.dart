import '../copy_with_sentinel.dart';
import 'string_list.dart';

/// User-provided metadata stored as key-value pairs.
///
/// Only one value type (stringValue, stringListValue, or numericValue)
/// should be set per CustomMetadata object.
class CustomMetadata {
  /// Creates a new [CustomMetadata] instance.
  const CustomMetadata({
    required this.key,
    this.stringValue,
    this.stringListValue,
    this.numericValue,
  });

  /// The key of the metadata to store.
  ///
  /// Required.
  final String key;

  /// The string value of the metadata.
  final String? stringValue;

  /// The StringList value of the metadata.
  final StringList? stringListValue;

  /// The numeric value of the metadata.
  final double? numericValue;

  /// Creates a [CustomMetadata] from JSON.
  factory CustomMetadata.fromJson(Map<String, dynamic> json) {
    return CustomMetadata(
      key: json['key'] as String,
      stringValue: json['stringValue'] as String?,
      stringListValue: json['stringListValue'] != null
          ? StringList.fromJson(json['stringListValue'] as Map<String, dynamic>)
          : null,
      numericValue: json['numericValue'] != null
          ? (json['numericValue'] as num).toDouble()
          : null,
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      if (stringValue != null) 'stringValue': stringValue,
      if (stringListValue != null) 'stringListValue': stringListValue!.toJson(),
      if (numericValue != null) 'numericValue': numericValue,
    };
  }

  /// Creates a copy with replaced values.
  CustomMetadata copyWith({
    Object? key = unsetCopyWithValue,
    Object? stringValue = unsetCopyWithValue,
    Object? stringListValue = unsetCopyWithValue,
    Object? numericValue = unsetCopyWithValue,
  }) {
    return CustomMetadata(
      key: key == unsetCopyWithValue ? this.key : key! as String,
      stringValue: stringValue == unsetCopyWithValue
          ? this.stringValue
          : stringValue as String?,
      stringListValue: stringListValue == unsetCopyWithValue
          ? this.stringListValue
          : stringListValue as StringList?,
      numericValue: numericValue == unsetCopyWithValue
          ? this.numericValue
          : numericValue as double?,
    );
  }

  @override
  String toString() => 'CustomMetadata('
      'key: $key, '
      'stringValue: $stringValue, '
      'stringListValue: $stringListValue, '
      'numericValue: $numericValue)';
}
