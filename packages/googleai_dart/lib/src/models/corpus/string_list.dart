import '../copy_with_sentinel.dart';

/// User-provided string values assigned to a single metadata key.
class StringList {
  /// Creates a new [StringList] instance.
  const StringList({
    this.values,
  });

  /// The string values of the metadata.
  final List<String>? values;

  /// Creates a [StringList] from JSON.
  factory StringList.fromJson(Map<String, dynamic> json) {
    return StringList(
      values: json['values'] != null
          ? (json['values'] as List).map((e) => e as String).toList()
          : null,
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      if (values != null) 'values': values,
    };
  }

  /// Creates a copy with replaced values.
  StringList copyWith({
    Object? values = unsetCopyWithValue,
  }) {
    return StringList(
      values: values == unsetCopyWithValue
          ? this.values
          : values as List<String>?,
    );
  }

  @override
  String toString() => 'StringList(values: $values)';
}
