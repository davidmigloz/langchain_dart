import '../../embeddings_model_options.dart';

/// Options for Cohere embeddings models.
class CohereEmbeddingsModelOptions extends EmbeddingsModelOptions {
  /// Creates new Cohere embeddings model options.
  const CohereEmbeddingsModelOptions({
    super.dimensions,
    super.batchSize,
    this.inputType,
    this.embeddingTypes,
    this.truncate,
  });

  /// The input type for the embeddings.
  /// Can be 'search_document', 'search_query', 'classification', 'clustering'.
  final String? inputType;

  /// The embedding types to return.
  /// Can include 'float', 'int8', 'uint8', 'binary', 'ubinary'.
  final List<String>? embeddingTypes;

  /// How to handle inputs longer than the maximum token length.
  /// Can be 'NONE', 'START', 'END'.
  final String? truncate;

  /// Creates a copy with optional parameter overrides.
  CohereEmbeddingsModelOptions copyWith({
    int? dimensions,
    int? batchSize,
    String? inputType,
    List<String>? embeddingTypes,
    String? truncate,
  }) =>
      CohereEmbeddingsModelOptions(
        dimensions: dimensions ?? this.dimensions,
        batchSize: batchSize ?? this.batchSize,
        inputType: inputType ?? this.inputType,
        embeddingTypes: embeddingTypes ?? this.embeddingTypes,
        truncate: truncate ?? this.truncate,
      );

  /// Converts the options to a map.
  Map<String, dynamic> toMap() => {
        if (dimensions != null) 'dimensions': dimensions,
        if (batchSize != null) 'batch_size': batchSize,
        if (inputType != null) 'input_type': inputType,
        if (embeddingTypes != null) 'embedding_types': embeddingTypes,
        if (truncate != null) 'truncate': truncate,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CohereEmbeddingsModelOptions &&
          runtimeType == other.runtimeType &&
          dimensions == other.dimensions &&
          batchSize == other.batchSize &&
          inputType == other.inputType &&
          embeddingTypes == other.embeddingTypes &&
          truncate == other.truncate;

  @override
  int get hashCode =>
      dimensions.hashCode ^
      batchSize.hashCode ^
      inputType.hashCode ^
      embeddingTypes.hashCode ^
      truncate.hashCode;

  @override
  String toString() => 'CohereEmbeddingsModelOptions('
      'dimensions: $dimensions, '
      'batchSize: $batchSize, '
      'inputType: $inputType, '
      'embeddingTypes: $embeddingTypes, '
      'truncate: $truncate)';
}
