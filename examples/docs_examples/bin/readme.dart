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
    documents: const [
      Document(pageContent: 'LangChain was created by Harrison'),
      Document(
        pageContent: 'David ported LangChain to Dart in LangChain.dart',
      ),
    ],
  );

  // 2. Define the retrieval chain
  final retriever = vectorStore.asRetriever();
  final setupAndRetrieval = Runnable.fromMap<String>({
    'context': retriever.pipe(
      Runnable.mapInput((docs) => docs.map((d) => d.pageContent).join('\n')),
    ),
    'question': Runnable.passthrough(),
  });

  // 3. Construct a RAG prompt template
  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'Answer the question based on only the following context:\n{context}',
    ),
    (ChatMessageType.human, '{question}'),
  ]);

  // 4. Define the final chain
  final model = ChatOpenAI(apiKey: openaiApiKey);
  const outputParser = StringOutputParser<ChatResult>();
  final chain =
      setupAndRetrieval.pipe(promptTemplate).pipe(model).pipe(outputParser);

  // 5. Run the pipeline
  final res = await chain.invoke('Who created LangChain.dart?');
  print(res);
  // David created LangChain.dart
}
