// ignore_for_file: avoid_print
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_ollama/langchain_ollama.dart';

void main() async {
  final loader = CsvLoader('bin/wikivoyage_eu_dataset.csv');
  final docs = await loader.load();

  final embeddings = OllamaEmbeddings(
    model: 'jina/jina-embeddings-v2-small-en',
  );
  final vectorStore = ObjectBoxVectorStore(
    embeddings: embeddings,
    dimensions: 512,
  );

  final ids = await vectorStore.addDocuments(documents: docs);
  print('Added ${ids.length} documents to the vector store.');

  embeddings.close();
}
