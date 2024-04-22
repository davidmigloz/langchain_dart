import 'dart:math';

/// Measures the cosine of the angle between two vectors in a vector space.
/// It ranges from -1 to 1, where 1 represents identical vectors, 0 represents
/// orthogonal vectors, and -1 represents vectors that are diametrically
/// opposed.
double cosineSimilarity(final List<double> a, final List<double> b) {
  double p = 0;
  double p2 = 0;
  double q2 = 0;
  for (int i = 0; i < a.length; i++) {
    p += a[i] * b[i];
    p2 += a[i] * a[i];
    q2 += b[i] * b[i];
  }
  return p / sqrt(p2 * q2);
}

/// Calculates the similarity between an embedding and a list of embeddings.
///
/// The similarity is calculated using the provided [similarityFunction].
/// The default similarity function is [cosineSimilarity].
List<double> calculateSimilarity(
  final List<double> embedding,
  final List<List<double>> embeddings, {
  final double Function(List<double> a, List<double> b) similarityFunction =
      cosineSimilarity,
}) {
  return embeddings
      .map((final vector) => similarityFunction(vector, embedding))
      .toList(growable: false);
}

/// Returns a sorted list of indexes of [embeddings] that are most similar to
/// the provided [embedding] (in descending order, most similar first).
///
/// The similarity is calculated using the provided [similarityFunction].
/// The default similarity function is [cosineSimilarity].
List<int> getIndexesMostSimilarEmbeddings(
  final List<double> embedding,
  final List<List<double>> embeddings, {
  final double Function(List<double> a, List<double> b) similarityFunction =
      cosineSimilarity,
}) {
  final similarities = calculateSimilarity(
    embedding,
    embeddings,
    similarityFunction: similarityFunction,
  );
  return List<int>.generate(embeddings.length, (i) => i)
    ..sort((a, b) => similarities[b].compareTo(similarities[a]));
}
