// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _passthrough();
  await _retrieval();
}

Future<void> _passthrough() async {
  final runnable = Runnable.fromMap<Map<String, dynamic>>({
    'passed': Runnable.passthrough(),
    'modified': Runnable.mapInput((input) => (input['num'] as int) + 1),
  });

  final res = await runnable.invoke({'num': 1});
  print(res);
  // {passed: {num: 1}, modified: 2}
}

Future<void> _retrieval() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final vectorStore = MemoryVectorStore(
    embeddings: OpenAIEmbeddings(apiKey: openaiApiKey),
  );
  await vectorStore.addDocuments(
    documents: const [
      Document(pageContent: 'LangChain was created by Harrison'),
      Document(
        pageContent: 'David ported LangChain to Dart in LangChain.dart',
      ),
    ],
  );
  final retriever = vectorStore.asRetriever();
  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'Answer the question based on only the following context:\n{context}',
    ),
    (ChatMessageType.human, '{question}'),
  ]);
  final model = ChatOpenAI(apiKey: openaiApiKey);
  const outputParser = StringOutputParser<ChatResult>();

  final retrievalChain = Runnable.fromMap<String>({
    'context': retriever,
    'question': Runnable.passthrough(),
  }).pipe(promptTemplate).pipe(model).pipe(outputParser);

  final res = await retrievalChain.invoke('Who created LangChain.dart?');
  print(res);
  // David created LangChain.dart.
}
