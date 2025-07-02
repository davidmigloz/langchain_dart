import 'package:meta/meta.dart';

/// Base class for embeddings model options.
@immutable
abstract class EmbeddingsModelOptions {
  /// Creates a new embeddings model options instance.
  const EmbeddingsModelOptions({this.dimensions, this.batchSize});

  /// The number of dimensions the resulting output embeddings should have.
  /// Only supported by some models.
  final int? dimensions;

  /// The maximum number of texts to embed in a single request.
  final int? batchSize;
}
