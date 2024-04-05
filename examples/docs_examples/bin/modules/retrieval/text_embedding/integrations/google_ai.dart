// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_google/langchain_google.dart';

void main(final List<String> arguments) async {
  final apiKey = Platform.environment['GOOGLEAI_API_KEY'];
  final embeddings = GoogleGenerativeAIEmbeddings(
    apiKey: apiKey,
  );

  // Embedding a document
  const doc = Document(pageContent: 'This is a test document.');
  final res1 = await embeddings.embedDocuments([doc]);
  print(res1);
  // [[0.05677966, 0.0030236526, -0.06441004, ...]]

  // Embedding a retrieval query
  const text = 'This is a test query.';
  final res2 = await embeddings.embedQuery(text);
  print(res2);
  // [0.025963314, -0.06858828, -0.026590854, ...]

  embeddings.close();
}
