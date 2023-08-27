// ignore_for_file: avoid_print
import 'package:chromadb/chromadb.dart';

void main() async {
  final client = ChromaClient();
  final collection = await client.createCollection(name: 'test');
  await collection.add(
    ids: ['id1', 'id2'],
    embeddings: [
      [1.0, 2.0, 3.0],
      [4.0, 5.0, 6.0],
    ],
    metadatas: [
      {'source': 'source1'},
      {'source': 'source2'},
    ],
  );
  final result = await collection.query(
    nResults: 2,
    queryEmbeddings: [
      [1.0, 2.0, 3.0],
    ],
  );
  print(result);
}
