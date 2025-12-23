// USAGE: Copy this file, then find-replace:
//   {ClassName} → YourModelName (PascalCase, e.g., FileSearchStore)
//   {description} → Description from OpenAPI spec
//   Replace example fields with actual fields from schema
//
// Type mappings: String, int, double, bool, List<T>, Map<String, dynamic>
// Nested objects: use factory fromJson and toJson methods
//
// See references/implementation-patterns.md for detailed conventions

import '../copy_with_sentinel.dart';

/// {description}.
class {ClassName} {
  /// The resource name.
  final String? name;

  /// Display name.
  final String? displayName;

  /// Creation timestamp (ISO 8601).
  final String? createTime;

  /// Update timestamp (ISO 8601).
  final String? updateTime;

  /// Creates a [{ClassName}].
  const {ClassName}({
    this.name,
    this.displayName,
    this.createTime,
    this.updateTime,
  });

  /// Creates a [{ClassName}] from JSON.
  factory {ClassName}.fromJson(Map<String, dynamic> json) => {ClassName}(
        name: json['name'] as String?,
        displayName: json['displayName'] as String?,
        createTime: json['createTime'] as String?,
        updateTime: json['updateTime'] as String?,
      );

  /// Converts to JSON.
  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (displayName != null) 'displayName': displayName,
        if (createTime != null) 'createTime': createTime,
        if (updateTime != null) 'updateTime': updateTime,
      };

  /// Creates a copy with replaced values.
  {ClassName} copyWith({
    Object? name = unsetCopyWithValue,
    Object? displayName = unsetCopyWithValue,
    Object? createTime = unsetCopyWithValue,
    Object? updateTime = unsetCopyWithValue,
  }) {
    return {ClassName}(
      name: name == unsetCopyWithValue ? this.name : name as String?,
      displayName:
          displayName == unsetCopyWithValue
              ? this.displayName
              : displayName as String?,
      createTime:
          createTime == unsetCopyWithValue
              ? this.createTime
              : createTime as String?,
      updateTime:
          updateTime == unsetCopyWithValue
              ? this.updateTime
              : updateTime as String?,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is {ClassName} &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          displayName == other.displayName &&
          createTime == other.createTime &&
          updateTime == other.updateTime;

  @override
  int get hashCode => Object.hash(name, displayName, createTime, updateTime);

  @override
  String toString() => '{ClassName}('
      'name: $name, '
      'displayName: $displayName, '
      'createTime: $createTime, '
      'updateTime: $updateTime)';
}
