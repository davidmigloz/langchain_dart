// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _map();
  await _getItem();
  await _concurrency();
}

Future<void> _map() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

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

Future<void> _getItem() async {
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

Future<void> _concurrency() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);
  const outputParser = StringOutputParser<ChatResult>();

  final jokeChain = PromptTemplate.fromTemplate(
    'tell me a joke about {topic}',
  ).pipe(model).pipe(outputParser);
  final poemChain = PromptTemplate.fromTemplate(
    'write a 2-line poem about {topic}',
  ).pipe(model).pipe(outputParser);

  final mapChain = Runnable.fromMap<Map<String, dynamic>>({
    'joke': jokeChain,
    'poem': poemChain,
  });

  final res = await mapChain.invoke({'topic': 'bear'});
  print(res);
  // {joke: Why did the bear bring a flashlight to the party? Because he wanted to be the "light" of the party!,
  //  poem: In the forest's hush, the bear prowls wide, A silent guardian, a force of nature's pride.}
}
