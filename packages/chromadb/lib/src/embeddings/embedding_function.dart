/// Embedding function interface.
///
/// This interface is used to embed an [Embeddable] into a vectors. You can
/// create your own implementation using any embedding model you want
/// (e.g. OpenAI, Cohere, PaLM, Instructor, etc.).
abstract interface class EmbeddingFunction {
  /// Generates embeddings for the given inputs.
  ///
  /// - [input] - The input to embed.
  Future<List<List<double>>> generate(final List<Embeddable> input);
}

/// Embeddable interface.
sealed class Embeddable {
  const Embeddable();

  /// Creates a new [Embeddable] from a text document.
  factory Embeddable.document(final String document) {
    return EmbeddableDocument(document: document);
  }

  /// Creates a new [Embeddable] from an image.
  factory Embeddable.image(final String image) {
    return EmbeddableImage(image: image);
  }
}

/// Text document.
class EmbeddableDocument extends Embeddable {
  const EmbeddableDocument({
    required this.document,
  });

  final String document;
}

/// Image.
class EmbeddableImage extends Embeddable {
  const EmbeddableImage({
    required this.image,
  });

  final String image;
}
