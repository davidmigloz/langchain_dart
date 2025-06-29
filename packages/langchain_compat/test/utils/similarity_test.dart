import 'package:langchain_compat/utils.dart';
import 'package:test/test.dart';

void main() {
  group('cosineSimilarity tests', () {
    const precision = 0.0001;

    test('Test cosine similarity function', () {
      expect(
        cosineSimilarity([1, 2, 3], [4, 5, 6]),
        closeTo(0.9746, precision),
      );
      expect(cosineSimilarity([1, 0], [0, 1]), closeTo(0.0, precision));
      expect(cosineSimilarity([1, 2], [2, 4]), closeTo(1.0, precision));
      expect(cosineSimilarity([1], [2]), closeTo(1.0, precision));
      expect(cosineSimilarity([1], [1]), closeTo(1.0, precision));
      expect(cosineSimilarity([], []), isNaN);
    });
  });

  group('calculateSimilarity tests', () {
    const precision = 0.0001;

    test('Calculates similarity for non-empty vectors', () {
      expect(
        calculateSimilarity(
          [1, 2, 3],
          [
            [4, 5, 6],
            [7, 8, 9],
          ],
        ),
        equals([0.9746, 0.9594].map((v) => closeTo(v, precision)).toList()),
      );
    });

    test('Calculates similarity for orthogonal vectors', () {
      expect(
        calculateSimilarity(
          [1, 0],
          [
            [0, 1],
            [0, -1],
          ],
        ),
        equals([0.0, 0.0].map((v) => closeTo(v, precision)).toList()),
      );
    });

    test('Calculates similarity for identical vectors', () {
      expect(
        calculateSimilarity(
          [1, 2],
          [
            [1, 2],
            [2, 4],
          ],
        ),
        equals([1.0, 1.0].map((v) => closeTo(v, precision)).toList()),
      );
    });

    test('Calculates similarity for empty vectors', () {
      expect(calculateSimilarity([], [[]]).first, isNaN);
    });

    test('Calculates similarity with custom similarity function', () {
      expect(
        calculateSimilarity(
          [1, 2, 3],
          [
            [4, 5, 6],
            [7, 8, 9],
          ],
          similarityFunction: (a, b) => a[0] * b[0],
        ),
        equals([4.0, 7.0]),
      );
    });
  });

  group('getIndexesMostSimilarEmbedding tests', () {
    test(
      'Returns sorted indexes of most similar vectors for non-empty vectors',
      () {
        expect(
          getIndexesMostSimilarEmbeddings(
            [1, 2, 3],
            [
              [4, 5, 6],
              [7, 8, 9],
            ],
          ),
          equals([0, 1]),
        );
      },
    );

    test(
      'Returns sorted indexes of most similar vectors for orthogonal vectors',
      () {
        expect(
          getIndexesMostSimilarEmbeddings(
            [1, 0],
            [
              [0, 1],
              [0, -1],
            ],
          ),
          equals([0, 1]),
        );
      },
    );

    test(
      'Returns sorted indexes of most similar vectors for identical vectors',
      () {
        expect(
          getIndexesMostSimilarEmbeddings(
            [1, 2],
            [
              [1, 2],
              [2, 4],
            ],
          ),
          equals([0, 1]),
        );
      },
    );

    test(
      'Returns sorted indexes of most similar vectors with custom similarity function',
      () {
        expect(
          getIndexesMostSimilarEmbeddings(
            [1, 2, 3],
            [
              [4, 5, 6],
              [7, 8, 9],
            ],
            similarityFunction: (a, b) => a[0] * b[0],
          ),
          equals([1, 0]),
        );
      },
    );
  });
}
