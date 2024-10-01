// ignore_for_file: avoid_print, avoid_redundant_argument_values
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_ollama/langchain_ollama.dart';

void main(final List<String> arguments) async {
  await _chatOllama();
  await _chatOllamaStreaming();
  await _chatOllamaJsonMode();
  await _chatOllamaMultimodal();
  await _rag();
}

Future<void> _chatOllama() async {
  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that translates {input_language} to {output_language}.',
    ),
    (ChatMessageType.human, '{text}'),
  ]);

  final chatModel = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llama3',
      temperature: 0,
    ),
  );

  final chain = promptTemplate | chatModel | const StringOutputParser();

  final res = await chain.invoke({
    'input_language': 'English',
    'output_language': 'French',
    'text': 'I love programming.',
  });
  print(res);
  // -> 'La traduction est : "J'aime le programming.'
}

Future<void> _chatOllamaStreaming() async {
  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that replies only with numbers '
          'in order without any spaces or commas',
    ),
    (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
  ]);
  final chat = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llama3',
      temperature: 0,
    ),
  );
  final chain = promptTemplate.pipe(chat).pipe(const StringOutputParser());

  final stream = chain.stream({'max_num': '9'});
  await stream.forEach(print);
  // 1
  // 2
  // 3
  // ..
  // 9
}

Future<void> _chatOllamaJsonMode() async {
  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are an assistant that respond question using JSON format.'
    ),
    (ChatMessageType.human, '{question}'),
  ]);
  final chat = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llama3',
      temperature: 0,
      format: OllamaResponseFormat.json,
    ),
  );

  final chain = Runnable.getMapFromInput<String>('question')
      .pipe(promptTemplate)
      .pipe(chat)
      .pipe(JsonOutputParser());

  final res = await chain.invoke(
    'What is the population of Spain, The Netherlands, and France?',
  );
  print(res);
  // {Spain: 46735727, The Netherlands: 17398435, France: 65273538}
}

Future<void> _chatOllamaMultimodal() async {
  final chatModel = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llava',
      temperature: 0,
    ),
  );
  final prompt = ChatMessage.human(
    ChatMessageContent.multiModal([
      ChatMessageContent.text('What fruit is this?'),
      ChatMessageContent.image(
        data: base64.encode(
          await File('./bin/assets/apple.jpeg').readAsBytes(),
        ),
      ),
    ]),
  );
  final res = await chatModel.invoke(PromptValue.chat([prompt]));
  print(res.output.content);
  // -> 'An Apple'
}

Future<void> _rag() async {
  // 1. Create a vector store and add documents to it
  final vectorStore = MemoryVectorStore(
    embeddings: OllamaEmbeddings(model: 'llama3'),
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

  // 3. Define the model to use and the vector store retriever
  final chatModel = ChatOllama(
    defaultOptions: const ChatOllamaOptions(model: 'llama3'),
  );
  final retriever = vectorStore.asRetriever(
    defaultOptions: const VectorStoreRetrieverOptions(
      searchType: VectorStoreSimilaritySearch(k: 1),
    ),
  );

  // 4. Create a Runnable that combines the retrieved documents into a single string
  final docCombiner = Runnable.mapInput<List<Document>, String>((docs) {
    return docs.map((final d) => d.pageContent).join('\n');
  });

  // 4. Define the RAG pipeline
  final chain = Runnable.fromMap<String>({
    'context': retriever.pipe(docCombiner),
    'question': Runnable.passthrough(),
  }).pipe(promptTemplate).pipe(chatModel).pipe(const StringOutputParser());

  // 5. Run the pipeline
  final res = await chain.invoke('Who created LangChain.dart?');
  print(res);
  // Based on the context provided, David created LangChain.dart.
}
