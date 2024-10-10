import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:langchain_core/documents.dart';
import 'package:langchain_core/embeddings.dart';
import 'package:langchain_core/vector_stores.dart';
import 'connection/connection.dart' as impl;

part 'database.g.dart';

@DriftDatabase(include: {'sql.drift'})
class Database extends _$Database {
  Database(this.textEmbedder, this.embeddingDimension, {this.dbFile = 'app.v5'})
      : super(impl.connect(dbFile));
  // Database(this.textEmbedder, this.embeddingDimension)
  //     : super(impl.connect('app.v5'));

  final Embeddings textEmbedder;
  final int embeddingDimension;
  final String dbFile;

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          if (details.wasCreated) return;

          /// Get embedding dimension from chunks
          final schemaQueryRow = await customSelect(
                  "SELECT sql FROM sqlite_master WHERE name = 'chunks';")
              .getSingleOrNull();
          final createStmnt = schemaQueryRow?.read<String>('sql');

          final size = createStmnt?.split('float[').last.split(']').first;

          if (size == null || int.tryParse(size) != embeddingDimension) {
            /// drop table if page size is different
            await customStatement('DROP TABLE IF EXISTS chunks;');
            await customStatement(
                'CREATE VIRTUAL TABLE IF NOT EXISTS chunks using vec0( '
                '  id INTEGER PRIMARY KEY AUTOINCREMENT, '
                '  embedding float[$embeddingDimension] '
                ');');
          }
        },
        onCreate: (m) async {
          await m.createAll();
          await m.database.customStatement(
            'CREATE VIRTUAL TABLE IF NOT EXISTS chunks using vec0( '
            '  id INTEGER PRIMARY KEY AUTOINCREMENT, '
            '  embedding float[$embeddingDimension] '
            ');',
          );
        },
      );

  Future<int> addChunk(
    String text, {
    String? title,
    int? outputDimensionality,
  }) async {
    final result = await textEmbedder
        .embedQuery(title != null ? 'title: $title\n$text' : text);
    await customStatement(
      'INSERT INTO chunks (embedding) VALUES (:embedding)',
      [_serializeFloat32(result)],
    );
    return getLastId().getSingle();
  }

  Future<Selectable<SearchEmbeddingsResult>> searchChunks(
    String query, {
    String? title,
    int? outputDimensionality,
  }) async {
    final result = await textEmbedder
        .embedQuery(title != null ? 'title: $title\n$query' : query);
    return searchEmbeddings(_serializeFloat32(result));
  }

  Future<List<(Document, double)>> similaritySearchByVectorWithScores({
    required List<double> embedding,
    VectorStoreSimilaritySearch config = const VectorStoreSimilaritySearch(),
  }) async {
    // TODO: implement similaritySearchByVectorWithScores
    final embeddingResults =
        await this.searchEmbeddings(_serializeFloat32(embedding)).get();
    return embeddingResults
        .map((e) => (
              Document(
                  pageContent: e.content ?? '',
                  metadata: jsonDecode(e.metadata ?? '{}')),
              e.distance
            ))
        .toList();
  }

  Future<void> deleteChunk(int id) async {
    await customStatement(
      'DELETE FROM chunks WHERE id = :id',
      [id],
    );
  }

  /// Return a [DatabaseConnection] for the given database file.
  static DatabaseConnection createConnection(String dbFile) {
    return DatabaseConnection(impl.connect(dbFile));
  }

  Future<List<int>> addVectors({
    required List<List<double>> vectors,
    required List<Document> documents,
  }) async {
    if (vectors.length != documents.length) {
      throw ArgumentError(
          'The number of vectors must match the number of documents.');
    }

    final List<int> addedIds = [];

    for (int i = 0; i < vectors.length; i++) {
      final vector = vectors[i];
      await customStatement(
        'INSERT INTO chunks (embedding) VALUES (:embedding)',
        [_serializeFloat32(vector)],
      );
      final id = await getLastId().getSingle();
      addedIds.add(id);
    }
    return addedIds;
  }
}

// Serializes a float32 list into a vector BLOB that sqlite-vec accepts.
Uint8List _serializeFloat32(List<double> vector) {
  final ByteData byteData = ByteData(vector.length * 4); // 4 bytes per float32

  for (int i = 0; i < vector.length; i++) {
    byteData.setFloat32(i * 4, vector[i], Endian.little);
  }

  return byteData.buffer.asUint8List();
}

// Split long text into chunks for embedding
Iterable<(String, int, int)> chunkText(String text) sync* {
  final regex = RegExp(r'((?:[^\n][\n]?)+)');
  final matches = regex.allMatches(text);
  for (final match in matches) {
    // Need to limit to 500 tokens for really long paragraphs
    final str = text.substring(match.start, match.end);
    yield (str, match.start, match.end);
  }
}
