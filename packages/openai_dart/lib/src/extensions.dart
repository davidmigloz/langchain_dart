import 'generated/schema/schema.dart';

/// Extension methods for [Embedding].
extension EmbeddingX on Embedding {
  /// The embedding vector as a list of doubles.
  ///
  /// You can only use this field if you created the embedding with
  /// [CreateEmbeddingRequest.encodingFormat] set to
  /// [EmbeddingEncodingFormat.float].
  List<double> get embeddingVector {
    return embedding.mapOrNull(
      vectorBase64: (final s) => throw ArgumentError(
        '`encodingFormat` is not set to `float` in the create embedding request',
      ),
      vector: (final a) => a.value,
    )!;
  }

  /// The embedding vector as a base64-encoded string.
  ///
  /// You can only use this field if you created the embedding with
  /// [CreateEmbeddingRequest.encodingFormat] set to
  /// [EmbeddingEncodingFormat.base64].
  String get embeddingVectorBase64 {
    return embedding.mapOrNull(
      vectorBase64: (final s) => s.value,
      vector: (final a) => throw ArgumentError(
        '`encodingFormat` is not set to `base64` in the create embedding request',
      ),
    )!;
  }
}

/// Extension methods for [MessageContent].
extension MessageContentX on MessageContent {
  /// Returns the text of the message.
  ///
  /// You can only use this field if the message content is of type
  /// [MessageContentText].
  String get text {
    return mapOrNull(
      text: (final MessageContentTextObject c) => c.text.value,
      imageFile: (final a) => throw ArgumentError(
        'Message content is not of type `text`',
      ),
    )!;
  }

  /// Returns the image file ID of the message.
  ///
  /// You can only use this field if the message content is of type
  /// [MessageContentImage].
  String get imageFile {
    return mapOrNull(
      text: (final s) => throw ArgumentError(
        'Message content is not of type `imageFile`',
      ),
      imageFile: (final c) => c.imageFile.fileId,
    )!;
  }
}
