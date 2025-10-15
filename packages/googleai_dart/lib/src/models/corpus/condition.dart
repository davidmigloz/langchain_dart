import '../copy_with_sentinel.dart';

/// Filter condition applicable to a single key.
class Condition {
  /// Creates a new [Condition] instance.
  const Condition({
    required this.operation,
    this.stringValue,
    this.numericValue,
  });

  /// Operator applied to the key-value pair.
  ///
  /// Required.
  final ConditionOperator operation;

  /// The string value to filter on.
  ///
  /// Used with string and list operations.
  final String? stringValue;

  /// The numeric value to filter on.
  ///
  /// Used with numeric operations.
  final double? numericValue;

  /// Creates a [Condition] from JSON.
  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      operation: conditionOperatorFromString(json['operation'] as String),
      stringValue: json['stringValue'] as String?,
      numericValue: json['numericValue'] != null
          ? (json['numericValue'] as num).toDouble()
          : null,
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      'operation': conditionOperatorToString(operation),
      if (stringValue != null) 'stringValue': stringValue,
      if (numericValue != null) 'numericValue': numericValue,
    };
  }

  /// Creates a copy with replaced values.
  Condition copyWith({
    Object? operation = unsetCopyWithValue,
    Object? stringValue = unsetCopyWithValue,
    Object? numericValue = unsetCopyWithValue,
  }) {
    return Condition(
      operation: operation == unsetCopyWithValue
          ? this.operation
          : operation! as ConditionOperator,
      stringValue: stringValue == unsetCopyWithValue
          ? this.stringValue
          : stringValue as String?,
      numericValue: numericValue == unsetCopyWithValue
          ? this.numericValue
          : numericValue as double?,
    );
  }

  @override
  String toString() =>
      'Condition('
      'operation: $operation, '
      'stringValue: $stringValue, '
      'numericValue: $numericValue)';
}

/// Operator applied to the key-value pair in a condition.
enum ConditionOperator {
  /// Unspecified operator (unused default).
  unspecified,

  /// Less than (numeric only).
  less,

  /// Less than or equal (numeric only).
  lessEqual,

  /// Equal (numeric and string).
  equal,

  /// Greater than or equal (numeric only).
  greaterEqual,

  /// Greater than (numeric only).
  greater,

  /// Not equal (numeric and string).
  notEqual,

  /// Includes (string only, when CustomMetadata has string_list_value).
  includes,

  /// Excludes (string only, when CustomMetadata has string_list_value).
  excludes,
}

/// Converts a string to a [ConditionOperator].
ConditionOperator conditionOperatorFromString(String? value) {
  return switch (value?.toUpperCase()) {
    'LESS' => ConditionOperator.less,
    'LESS_EQUAL' => ConditionOperator.lessEqual,
    'EQUAL' => ConditionOperator.equal,
    'GREATER_EQUAL' => ConditionOperator.greaterEqual,
    'GREATER' => ConditionOperator.greater,
    'NOT_EQUAL' => ConditionOperator.notEqual,
    'INCLUDES' => ConditionOperator.includes,
    'EXCLUDES' => ConditionOperator.excludes,
    _ => ConditionOperator.unspecified,
  };
}

/// Converts a [ConditionOperator] to its string representation.
String conditionOperatorToString(ConditionOperator operator) {
  return switch (operator) {
    ConditionOperator.unspecified => 'OPERATOR_UNSPECIFIED',
    ConditionOperator.less => 'LESS',
    ConditionOperator.lessEqual => 'LESS_EQUAL',
    ConditionOperator.equal => 'EQUAL',
    ConditionOperator.greaterEqual => 'GREATER_EQUAL',
    ConditionOperator.greater => 'GREATER',
    ConditionOperator.notEqual => 'NOT_EQUAL',
    ConditionOperator.includes => 'INCLUDES',
    ConditionOperator.excludes => 'EXCLUDES',
  };
}
