import 'generated/schema/schema.dart';

extension EmbeddingX on Embedding {
  /// The embedding vector as a list of doubles.
  ///
  /// You can only use this field if you created the embedding with
  /// [CreateEmbeddingRequest.encodingFormat] set to
  /// [EmbeddingEncodingFormat.float].
  List<double> get embeddingVector {
    return embedding.mapOrNull(
      string: (final s) => throw ArgumentError(
        '`encodingFormat` is not set to `float` in the create embedding request',
      ),
      arrayNumber: (final a) => a.value,
    )!;
  }

  /// The embedding vector as a base64-encoded string.
  ///
  /// You can only use this field if you created the embedding with
  /// [CreateEmbeddingRequest.encodingFormat] set to
  /// [EmbeddingEncodingFormat.base64].
  String get embeddingVectorBase64 {
    return embedding.mapOrNull(
      string: (final s) => s.value,
      arrayNumber: (final a) => throw ArgumentError(
        '`encodingFormat` is not set to `base64` in the create embedding request',
      ),
    )!;
  }
}
