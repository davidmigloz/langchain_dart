import '../../embeddings_model_options.dart';

/// Options for Mistral embeddings models.
class MistralEmbeddingsModelOptions extends EmbeddingsModelOptions {
  /// Creates new Mistral embeddings model options.
  const MistralEmbeddingsModelOptions({
    super.dimensions,
    super.batchSize,
    this.encodingFormat,
  });

  /// The encoding format for the embeddings.
  /// Can be 'float' or 'base64'.
  final String? encodingFormat;

  /// Creates a copy with optional parameter overrides.
  MistralEmbeddingsModelOptions copyWith({
    int? dimensions,
    int? batchSize,
    String? encodingFormat,
  }) => MistralEmbeddingsModelOptions(
    dimensions: dimensions ?? this.dimensions,
    batchSize: batchSize ?? this.batchSize,
    encodingFormat: encodingFormat ?? this.encodingFormat,
  );

  /// Converts the options to a map.
  Map<String, dynamic> toMap() => {
    if (dimensions != null) 'dimensions': dimensions,
    if (batchSize != null) 'batch_size': batchSize,
    if (encodingFormat != null) 'encoding_format': encodingFormat,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MistralEmbeddingsModelOptions &&
          runtimeType == other.runtimeType &&
          dimensions == other.dimensions &&
          batchSize == other.batchSize &&
          encodingFormat == other.encodingFormat;

  @override
  int get hashCode =>
      dimensions.hashCode ^ batchSize.hashCode ^ encodingFormat.hashCode;

  @override
  String toString() =>
      'MistralEmbeddingsModelOptions('
      'dimensions: $dimensions, '
      'batchSize: $batchSize, '
      'encodingFormat: $encodingFormat)';
}
