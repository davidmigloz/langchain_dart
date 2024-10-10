import 'dart:convert';

import 'package:langchain_core/embeddings.dart';
import 'package:langchain_core/documents.dart';
import 'package:langchain_core/vector_stores.dart';

import 'src/database.dart';

/// SQLite with VEC extension as a vector database.
///
/// To use, you should have the `sqlite-vec` package installed.
///
/// Example:
/// ```dart
/// import 'package:langchain_community/vector_stores/sqlite_vec.dart';
/// import 'package:langchain_community/embeddings/openai.dart';
///
/// // ... (rest of the example code)
/// ```
class SQLiteVEC extends VectorStore {
  late final Database db;
  final String table;
  final String dbFile;

  SQLiteVEC._internal({
    required super.embeddings,
    required this.table,
    required this.dbFile,
    required this.db,
  });

  static Future<SQLiteVEC> create({
    required Embeddings embeddings,
    required String table,
    required String dbFile,
  }) async {
    final dummyEmbedding = await embeddings.embedQuery('This is a dummy text');
    final embeddingDimension = dummyEmbedding.length;

    final db = Database(embeddings, embeddingDimension, dbFile: dbFile);

    return SQLiteVEC._internal(
      embeddings: embeddings,
      table: table,
      dbFile: dbFile,
      db: db,
    );
  }

  /// Return VectorStore initialized from texts and embeddings.
  static Future<SQLiteVEC> fromTexts(
    List<String> texts,
    Embeddings embeddings, {
    List<Map<String, dynamic>>? metadatas,
    String table = 'langchain',
    String dbFile = 'vec',
  }) async {
    final vec = await SQLiteVEC.create(
      embeddings: embeddings,
      table: table,
      dbFile: dbFile,
    );
    await vec.addTexts(texts: texts, metadatas: metadatas);
    return vec;
  }

  /// Adds texts to the vector store.
  Future<List<int>> addTexts({
    required List<String> texts,
    List<Map<String, dynamic>>? metadatas,
  }) async {
    final ids = <int>[];
    for (int i = 0; i < texts.length; i++) {
      final metadata = (metadatas != null && i < metadatas.length)
          ? metadatas[i]
          : <String, dynamic>{};
      // documents.add(Document(pageContent: texts[i], metadata: metadata));

      final fileId = await db //
          .insertFile('in-memory', texts[i], jsonEncode(metadata))
          .then((e) => e);
      final chunks = chunkText(texts[i]);
      for (final chunk in chunks) {
        final chunkId = await db.addChunk(chunk.$1);
        await db.insertFileEmbedding(fileId, chunkId, chunk.$2, chunk.$3);
        ids.add(chunkId);
      }
    }
    return ids;
  }

  @override
  Future<List<String>> addDocuments({
    required List<Document> documents,
  }) async {
    final vectors = await embeddings.embedDocuments(documents);
    return addVectors(
      vectors: vectors,
      documents: documents,
    );
  }

  @override
  Future<List<String>> addVectors({
    required List<List<double>> vectors,
    required List<Document> documents,
  }) async {
    // Ensure all vectors have the correct dimension
    // for (final vector in vectors) {
    //   if (vector.length != db.embeddingDimension) {
    //     throw ArgumentError(
    //       'Embedding dimension mismatch: Expected ${db.embeddingDimension}, got ${vector.length}',
    //     );
    //   }
    // }

    final ids = await db.addVectors(vectors: vectors, documents: documents);
    return ids.map((id) => id.toString()).toList();
  }

  @override
  Future<void> delete({required List<String> ids}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<(Document, double)>> similaritySearchByVectorWithScores({
    required List<double> embedding,
    VectorStoreSimilaritySearch config = const VectorStoreSimilaritySearch(),
  }) async {
    return db.similaritySearchByVectorWithScores(
      embedding: embedding,
      config: config,
    );
  }
}
