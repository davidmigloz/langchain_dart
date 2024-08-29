import 'dart:typed_data';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:langchain_core/embeddings.dart';
import 'connection/connection.dart' as impl;

part 'database.g.dart';

@DriftDatabase(include: {'sql.drift'})
class Database extends _$Database {
  Database(this.textEmbedder) : super(impl.connect('app.v5'));

  final Embeddings textEmbedder;
  @override
  int get schemaVersion => 1;

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

  Future<void> deleteChunk(int id) async {
    await customStatement(
      'DELETE FROM chunks WHERE id = :id',
      [id],
    );
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await m.database.customStatement(
            'CREATE VIRTUAL TABLE IF NOT EXISTS chunks using vec0( '
            '  id INTEGER PRIMARY KEY AUTOINCREMENT, '
            '  embedding float[768] '
            ');',
          );
        },
      );

  /// Return a [DatabaseConnection] for the given database file.
  static DatabaseConnection createConnection(String dbFile) {
    return DatabaseConnection(impl.connect(dbFile));
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
