// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  final anyscaleApiKey = Platform.environment['ANYSCALE_API_KEY'];
  final embeddings = OpenAIEmbeddings(
    apiKey: anyscaleApiKey,
    baseUrl: 'https://api.endpoints.anyscale.com/v1',
    model: 'thenlper/gte-large',
  );

  // Embedding a document
  const doc = Document(pageContent: 'This is a test document.');
  final res1 = await embeddings.embedDocuments([doc]);
  print(res1);
  // [[-0.0011281073093414307, -0.013280618004500866, 0.02164546772837639, ...]]

  // Embedding a retrieval query
  const text = 'This is a test query.';
  final res2 = await embeddings.embedQuery(text);
  print(res2);
  // [-0.027850965037941933, 0.00269310618750751, 0.008118202909827232, ...]

  embeddings.close();
}
