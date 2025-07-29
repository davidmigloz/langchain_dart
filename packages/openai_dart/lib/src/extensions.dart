import 'generated/schema/schema.dart';

/// Extension methods for [Embedding].
extension EmbeddingX on Embedding {
  /// The embedding vector as a list of doubles.
  ///
  /// You can only use this field if you created the embedding with
  /// [CreateEmbeddingRequest.encodingFormat] set to
  /// [EmbeddingEncodingFormat.float].
  List<double> get embeddingVector {
    switch (embedding) {
      case EmbeddingVectorListDouble(:final value):
        return value;
      case EmbeddingVectorString():
        throw ArgumentError(
          '`encodingFormat` is not set to `float` in the create embedding request',
        );
    }
  }

  /// The embedding vector as a base64-encoded string.
  ///
  /// You can only use this field if you created the embedding with
  /// [CreateEmbeddingRequest.encodingFormat] set to
  /// [EmbeddingEncodingFormat.base64].
  String get embeddingVectorBase64 {
    switch (embedding) {
      case EmbeddingVectorString(:final value):
        return value;
      case EmbeddingVectorListDouble():
        throw ArgumentError(
          '`encodingFormat` is not set to `base64` in the create embedding request',
        );
    }
  }
}

/// Extension methods for [MessageContent].
extension MessageContentX on MessageContent {
  /// Returns the text of the message.
  ///
  /// You can only use this field if the message content is of type
  /// [MessageContentText].
  String get text {
    switch (this) {
      case MessageContentTextObject(:final text):
        return text.value;
      default:
        throw ArgumentError('Message content is not of type `text`');
    }
  }

  /// Returns the image file ID of the message.
  ///
  /// You can only use this field if the message content is of type
  /// [MessageContentImage].
  String get imageFile {
    switch (this) {
      case MessageContentImageFileObject(:final imageFile):
        return imageFile.fileId;
      default:
        throw ArgumentError('Message content is not of type `imageFile`');
    }
  }
}
