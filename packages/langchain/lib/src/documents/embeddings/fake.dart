import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

import '../models/models.dart';
import 'base.dart';

/// {@template fake_embeddings}
/// Fake embeddings model for testing.
///
/// By default, the embeddings are deterministic (the same text will always
/// have the same embedding vector). You can change this behavior by setting
/// [deterministic] to false.
/// {@endtemplate}
class FakeEmbeddings implements Embeddings {
  /// {@macro fake_embeddings}
  FakeEmbeddings({
    this.size = 10,
    this.deterministic = true,
  });

  /// The size of the embedding vector.
  final int size;

  /// Whether the embedding vector is deterministic.
  final bool deterministic;

  @override
  Future<List<List<double>>> embedDocuments(
    final List<Document> documents,
  ) async {
    return documents
        .map((final d) => _getEmbeddings(d.pageContent))
        .toList(growable: false);
  }

  @override
  Future<List<double>> embedQuery(final String query) async {
    return _getEmbeddings(query);
  }

  List<double> _getEmbeddings(final String text) {
    final random = Random(deterministic ? _getSeed(text) : null);
    return List.generate(size, (final i) => random.nextDouble());
  }

  int _getSeed(final String text) {
    final bytes = utf8.encode(text);
    final digest = sha256.convert(bytes);
    // We restrict the seed to 32 bits to avoid overflow
    return (BigInt.parse(digest.toString(), radix: 16) %
            BigInt.from(pow(2, 32)))
        .toInt();
  }
}
