// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _mapInput();
  await _mapInputStream();
  await _getItemFromMap();
  await _getMapFromInput();
}

Future<void> _mapInput() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  // 1. Create a vector store and add documents to it
  final vectorStore = MemoryVectorStore(
    embeddings: OpenAIEmbeddings(apiKey: openaiApiKey),
  );
  await vectorStore.addDocuments(
    documents: const [
      Document(pageContent: 'LangChain was created by Harrison'),
      Document(pageContent: 'David ported LangChain to Dart in LangChain.dart'),
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
  final chain = setupAndRetrieval
      .pipe(promptTemplate)
      .pipe(model)
      .pipe(outputParser);

  // 5. Run the pipeline
  final res = await chain.invoke('Who created LangChain.dart?');
  print(res);
  // David created LangChain.dart
}

Future<void> _mapInputStream() async {
  final openAiApiKey = Platform.environment['OPENAI_API_KEY'];

  final model = ChatOpenAI(
    apiKey: openAiApiKey,
    defaultOptions: const ChatOpenAIOptions(
      responseFormat: ChatOpenAIResponseFormat.jsonObject,
    ),
  );
  final parser = JsonOutputParser<ChatResult>();
  final mapper = Runnable.mapInputStream((
    Stream<Map<String, dynamic>> inputStream,
  ) async* {
    yield await inputStream.last;
  });

  final chain = model.pipe(parser).pipe(mapper);

  final stream = chain.stream(
    PromptValue.string(
      'Output a list of the countries france, spain and japan and their '
      'populations in JSON format. Use a dict with an outer key of '
      '"countries" which contains a list of countries. '
      'Each country should have the key "name" and "population"',
    ),
  );
  await stream.forEach((final chunk) => print('$chunk|'));
  // {countries: [{name: France, population: 65273511}, {name: Spain, population: 46754778}, {name: Japan, population: 126476461}]}|
}

Future<void> _getItemFromMap() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final vectorStore = MemoryVectorStore(
    embeddings: OpenAIEmbeddings(apiKey: openaiApiKey),
  );
  await vectorStore.addDocuments(
    documents: const [
      Document(pageContent: 'LangChain was created by Harrison'),
      Document(pageContent: 'David ported LangChain to Dart in LangChain.dart'),
    ],
  );
  final retriever = vectorStore.asRetriever();
  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'Answer the question based on only the following context:\n{context}\n'
          'Answer in the following language: {language}',
    ),
    (ChatMessageType.human, '{question}'),
  ]);
  final model = ChatOpenAI(apiKey: openaiApiKey);
  const outputParser = StringOutputParser<ChatResult>();

  final retrievalChain = Runnable.fromMap<Map<String, dynamic>>({
    'context': Runnable.getItemFromMap('question').pipe(retriever),
    'question': Runnable.getItemFromMap('question'),
    'language': Runnable.getItemFromMap('language'),
  }).pipe(promptTemplate).pipe(model).pipe(outputParser);

  final res = await retrievalChain.invoke({
    'question': 'Who created LangChain.dart?',
    'language': 'Spanish',
  });
  print(res);
  // David portó LangChain a Dart en LangChain.dart
}

Future<void> _getMapFromInput() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);
  const outputParser = StringOutputParser<ChatResult>();

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'Write out the following equation using algebraic symbols then solve it. '
          'Use the format\n\nEQUATION:...\nSOLUTION:...\n\n',
    ),
    (ChatMessageType.human, '{equation_statement}'),
  ]);

  final chain = Runnable.getMapFromInput<String>(
    'equation_statement',
  ).pipe(promptTemplate).pipe(model).pipe(outputParser);

  final res = await chain.invoke('x raised to the third plus seven equals 12');
  print(res);
  // EQUATION: \(x^3 + 7 = 12\)
  //
  // SOLUTION:
  // Subtract 7 from both sides:
  // \(x^3 = 5\)
  //
  // Take the cube root of both sides:
  // \(x = \sqrt[3]{5}\)
}
