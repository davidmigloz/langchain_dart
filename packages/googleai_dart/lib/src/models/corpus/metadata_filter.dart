import '../copy_with_sentinel.dart';
import 'condition.dart';

/// User-provided filter to limit retrieval based on Chunk or Document
/// level metadata values.
///
/// Example:
/// ```dart
/// MetadataFilter(
///   key: 'document.custom_metadata.genre',
///   conditions: [
///     Condition(operation: ConditionOperator.equal, stringValue: 'drama'),
///     Condition(operation: ConditionOperator.equal, stringValue: 'action'),
///   ],
/// )
/// ```
///
/// The above filter retrieves documents where genre is 'drama' OR 'action'.
class MetadataFilter {
  /// Creates a new [MetadataFilter] instance.
  const MetadataFilter({required this.key, required this.conditions});

  /// The key of the metadata to filter on.
  ///
  /// Required.
  ///
  /// Examples:
  /// - `"document.custom_metadata.genre"`
  /// - `"chunk.custom_metadata.year"`
  final String key;

  /// The Conditions for the given key.
  ///
  /// Required.
  ///
  /// Multiple Conditions are joined by logical OR.
  final List<Condition> conditions;

  /// Creates a [MetadataFilter] from JSON.
  factory MetadataFilter.fromJson(Map<String, dynamic> json) {
    return MetadataFilter(
      key: json['key'] as String,
      conditions: ((json['conditions'] as List?) ?? [])
          .map((e) => Condition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'conditions': conditions.map((e) => e.toJson()).toList(),
    };
  }

  /// Creates a copy with replaced values.
  MetadataFilter copyWith({
    Object? key = unsetCopyWithValue,
    Object? conditions = unsetCopyWithValue,
  }) {
    return MetadataFilter(
      key: key == unsetCopyWithValue ? this.key : key! as String,
      conditions: conditions == unsetCopyWithValue
          ? this.conditions
          : conditions! as List<Condition>,
    );
  }

  @override
  String toString() =>
      'MetadataFilter('
      'key: $key, '
      'conditions: $conditions)';
}
