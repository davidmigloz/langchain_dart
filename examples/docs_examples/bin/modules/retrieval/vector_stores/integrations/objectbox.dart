import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_ollama/langchain_ollama.dart';

void main() async {
  await _rag();
}

Future<void> _rag() async {
  // 1. Instantiate vector store
  final vectorStore = ObjectBoxVectorStore(
    embeddings: OllamaEmbeddings(model: 'jina/jina-embeddings-v2-small-en'),
    dimensions: 512,
    directory: 'bin/modules/retrieval/vector_stores/integrations',
  );

  // 2. Load documents
  const loader = WebBaseLoader([
    'https://objectbox.io/on-device-vector-databases-and-edge-ai/',
    'https://objectbox.io/the-first-on-device-vector-database-objectbox-4-0/',
    'https://objectbox.io/on-device-vector-database-for-dart-flutter/',
    'https://objectbox.io/evolution-of-search-traditional-vs-vector-search//',
  ]);
  final List<Document> docs = await loader.load();

  // 3. Split docs into chunks
  const splitter = RecursiveCharacterTextSplitter(
    chunkSize: 500,
    chunkOverlap: 0,
  );
  final List<Document> chunkedDocs = await splitter.invoke(docs);

  // 4. Add documents to vector store
  await vectorStore.addDocuments(documents: chunkedDocs);

  // 5. Construct a RAG prompt template
  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      '''
You are an assistant for question-answering tasks.

Use the following pieces of retrieved context to answer the user question.

Context:
{context}

If you don't know the answer, just say that you don't know. 
Use three sentences maximum and keep the answer concise.
Cite the source you used to answer the question.

Example:
"""
One sentence [1]. Another sentence [2]. 

Sources:
[1] https://example.com/1
[2] https://example.com/2
"""
'''
    ),
    (ChatMessageType.human, '{question}'),
  ]);

  // 6. Define the model to use and the vector store retriever
  final chatModel = ChatOllama(
    defaultOptions: const ChatOllamaOptions(model: 'llama3'),
  );
  final retriever = vectorStore.asRetriever();

  // 7. Create a Runnable that combines the retrieved documents into a single string
  final docCombiner = Runnable.mapInput<List<Document>, String>((docs) {
    return docs
        .map(
          (final d) => '''
Source: ${d.metadata['source']}
Title: ${d.metadata['title']}
Content: ${d.pageContent}
---
''',
        )
        .join('\n');
  });

  // 8. Define the RAG pipeline
  final chain = Runnable.fromMap<String>({
    'context': retriever.pipe(docCombiner),
    'question': Runnable.passthrough(),
  }).pipe(promptTemplate).pipe(chatModel).pipe(const StringOutputParser());

  // 9. Run the pipeline
  final stream = chain.stream(
    'Which algorithm does ObjectBox Vector Search use? Can I use it in Flutter apps?',
  );
  await stream.forEach(stdout.write);
  // According to the sources provided, ObjectBox Vector Search uses the HNSW
  // (Hierarchical Navigable Small World) algorithm [1].
  //
  // And yes, you can use it in Flutter apps. The article specifically mentions
  // that ObjectBox 4.0 introduces an on-device vector database for the
  // Dart/Flutter platform [2].
  //
  // Sources:
  // [1] https://objectbox.io/first-on-device-vector-database-objectbox-4-0/
  // [2] https://objectbox.io/on-device-vector-database-for-dart-flutter/
}
