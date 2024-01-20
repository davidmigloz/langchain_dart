// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: Embedding
// ==========================================

/// Represents an embedding vector returned by embedding endpoint.
@freezed
class Embedding with _$Embedding {
  const Embedding._();

  /// Factory constructor for Embedding
  const factory Embedding({
    /// The index of the embedding in the list of embeddings.
    required int index,

    /// The embedding vector, which is a list of floats. The length of vector depends on the model as listed in the [embedding guide](https://platform.openai.com/docs/guides/embeddings).
    @_EmbeddingVectorConverter() required EmbeddingVector embedding,

    /// The object type, which is always "embedding".
    required EmbeddingObject object,
  }) = _Embedding;

  /// Object construction from a JSON representation
  factory Embedding.fromJson(Map<String, dynamic> json) =>
      _$EmbeddingFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['index', 'embedding', 'object'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'embedding': embedding,
      'object': object,
    };
  }
}

// ==========================================
// CLASS: EmbeddingVector
// ==========================================

/// The embedding vector, which is a list of floats. The length of vector depends on the model as listed in the [embedding guide](https://platform.openai.com/docs/guides/embeddings).
@freezed
sealed class EmbeddingVector with _$EmbeddingVector {
  const EmbeddingVector._();

  /// The embedding vector as a list of floats.
  const factory EmbeddingVector.vector(
    List<double> value,
  ) = EmbeddingVectorListDouble;

  /// The embedding vector as a base64-encoded string.
  const factory EmbeddingVector.vectorBase64(
    String value,
  ) = EmbeddingVectorString;

  /// Object construction from a JSON representation
  factory EmbeddingVector.fromJson(Map<String, dynamic> json) =>
      _$EmbeddingVectorFromJson(json);
}

/// Custom JSON converter for [EmbeddingVector]
class _EmbeddingVectorConverter
    implements JsonConverter<EmbeddingVector, Object?> {
  const _EmbeddingVectorConverter();

  @override
  EmbeddingVector fromJson(Object? data) {
    if (data is List && data.every((item) => item is num)) {
      return EmbeddingVectorListDouble(data.cast());
    }
    if (data is String) {
      return EmbeddingVectorString(data);
    }
    throw Exception(
      'Unexpected value for EmbeddingVector: $data',
    );
  }

  @override
  Object? toJson(EmbeddingVector data) {
    return switch (data) {
      EmbeddingVectorListDouble(value: final v) => v,
      EmbeddingVectorString(value: final v) => v,
    };
  }
}

// ==========================================
// ENUM: EmbeddingObject
// ==========================================

/// The object type, which is always "embedding".
enum EmbeddingObject {
  @JsonValue('embedding')
  embedding,
}
