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

/// {@template embeddable_document}
/// Text document.
/// {@endtemplate}
class EmbeddableDocument extends Embeddable {
  /// {@macro embeddable_document}
  const EmbeddableDocument({
    required this.document,
  });

  /// The text document to embed.
  final String document;
}

/// {@template embeddable_image}
/// Image.
/// {@endtemplate}
class EmbeddableImage extends Embeddable {
  /// {@macro embeddable_image}
  const EmbeddableImage({
    required this.image,
  });

  /// The image to embed.
  final String image;
}
