// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  final togetherAiApiKey = Platform.environment['TOGETHER_AI_API_KEY'];
  final embeddings = OpenAIEmbeddings(
    apiKey: togetherAiApiKey,
    baseUrl: 'https://api.together.xyz/v1',
    model: 'togethercomputer/m2-bert-80M-32k-retrieval',
  );

  // Embedding a document
  const doc = Document(pageContent: 'This is a test document.');
  final res1 = await embeddings.embedDocuments([doc]);
  print(res1);
  // [[-0.038838703, 0.0580902, 0.022614542, 0.0078403875, ...]]

  // Embedding a retrieval query
  const text = 'This is a test query.';
  final res2 = await embeddings.embedQuery(text);
  print(res2);
  // [-0.019722218, 0.04656633, -0.0074559706, 0.005712764, ...]

  embeddings.close();
}
