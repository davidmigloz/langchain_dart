// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _callLLM();
  await _rag();
}

Future<void> _callLLM() async {
  final googleApiKey = Platform.environment['GOOGLE_API_KEY'];
  final model = ChatGoogleGenerativeAI(apiKey: googleApiKey);
  final prompt = PromptValue.string('Hello world!');
  final result = await model.invoke(prompt);
  print(result);
  // Hello everyone! I'm new here and excited to be part of this community.
}

Future<void> _rag() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  // 1. Create a vector store and add documents to it
  final vectorStore = MemoryVectorStore(
    embeddings: OpenAIEmbeddings(apiKey: openaiApiKey),
  );
  await vectorStore.addDocuments(
    documents: [
      const Document(pageContent: 'LangChain was created by Harrison'),
      const Document(
        pageContent: 'David ported LangChain to Dart in LangChain.dart',
      ),
    ],
  );

  // 2. Construct a RAG prompt template
  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'Answer the question based on only the following context:\n{context}',
    ),
    (ChatMessageType.human, '{question}'),
  ]);

  // 3. Create a Runnable that combines the retrieved documents into a single string
  final docCombiner =
      Runnable.fromFunction<List<Document>, String>((final docs, final _) {
    return docs.map((final d) => d.pageContent).join('\n');
  });

  // 4. Define the RAG pipeline
  final chain = Runnable.fromMap<String>({
    'context': vectorStore.asRetriever().pipe(docCombiner),
    'question': Runnable.passthrough(),
  })
      .pipe(promptTemplate)
      .pipe(ChatOpenAI(apiKey: openaiApiKey))
      .pipe(const StringOutputParser());

  // 5. Run the pipeline
  final res = await chain.invoke('Who created LangChain.dart?');
  print(res);
  // David created LangChain.dart
}
