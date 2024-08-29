import 'package:langchain_core/embeddings.dart';
import 'package:langchain_core/src/documents/document.dart';
import 'package:langchain_core/src/embeddings/fake.dart';
import 'package:langchain_core/vector_stores.dart';

import 'src/database.dart';

/// SQLite with VSS extension as a vector database.
///
/// To use, you should have the `sqlite-vss` package installed.
///
/// Example:
/// ```dart
/// import 'package:langchain_community/vector_stores/sqlite_vss.dart';
/// import 'package:langchain_community/embeddings/openai.dart';
///
/// // ... (rest of the example code)
/// ```
class SQLiteVSS extends VectorStore {
  SQLiteVSS(
      {required super.embeddings,
      required String table,
      required connection,
      required String dbFile});

  @override
  Future<List<String>> addVectors(
      {required List<List<double>> vectors,
      required List<Document> documents}) {
    // TODO: implement addVectors
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required List<String> ids}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  void addTexts(
      {required List<String> texts, List<Map<String, dynamic>>? metadatas}) {}

  @override
  Future<List<(Document, double)>> similaritySearchByVectorWithScores(
      {required List<double> embedding,
      VectorStoreSimilaritySearch config =
          const VectorStoreSimilaritySearch()}) {
    // TODO: implement similaritySearchByVectorWithScores
    throw UnimplementedError();
  }

  /// Return VectorStore initialized from texts and embeddings.
  factory SQLiteVSS.fromTexts(
    List<String> texts,
    Embeddings embeddings, {
    List<Map<String, dynamic>>? metadatas,
    String table = 'langchain',
    String dbFile = 'vss.db',
  }) {
    final connection = Database.createConnection(dbFile);
    final vss = SQLiteVSS(
      embeddings: embeddings,
      table: table,
      connection: connection,
      dbFile: dbFile,
    )..addTexts(texts: texts, metadatas: metadatas);
    return vss;
  }
}
