// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: Tensor
// ==========================================

/// Metadata for a given tensor.
@freezed
class Tensor with _$Tensor {
  const Tensor._();

  /// Factory constructor for Tensor
  const factory Tensor({
    /// The name of the tensor.
    @JsonKey(includeIfNull: false) String? name,

    /// The type of the tensor.
    @JsonKey(includeIfNull: false) String? type,

    /// The shape of the tensor.
    @JsonKey(includeIfNull: false) List<int>? shape,
  }) = _Tensor;

  /// Object construction from a JSON representation
  factory Tensor.fromJson(Map<String, dynamic> json) => _$TensorFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['name', 'type', 'shape'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'shape': shape,
    };
  }
}
