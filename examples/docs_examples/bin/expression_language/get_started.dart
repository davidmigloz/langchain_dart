// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _promptModelOutputParser();
  await _ragSearch();
}

Future<void> _promptModelOutputParser() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {topic}',
  );
  final model = ChatOpenAI(apiKey: openaiApiKey);
  const outputParser = StringOutputParser<AIChatMessage>();

  final chain = promptTemplate.pipe(model).pipe(outputParser);

  final res = await chain.invoke({'topic': 'ice cream'});
  print(res);
  // Why did the ice cream truck break down?
  // Because it had too many "scoops"!

  // 1. Prompt

  final promptValue = await promptTemplate.invoke({'topic': 'ice cream'});

  final messages = promptValue.toChatMessages();
  print(messages);
  // [HumanChatMessage{
  //   content: ChatMessageContentText{
  //     text: Tell me a joke about ice cream,
  //   },
  // }]

  final string = promptValue.toString();
  print(string);
  // Human: Tell me a joke about ice cream

  // 2. Model

  final chatOutput = await model.invoke(promptValue);
  print(chatOutput.output);
  // AIChatMessage{
  //   content: Why did the ice cream truck break down?
  //   Because it couldn't make it over the rocky road!,
  // }

  final llm = OpenAI(apiKey: openaiApiKey);
  final llmOutput = await llm.invoke(promptValue);
  print(llmOutput.output);
  // Why did the ice cream go to therapy?
  // Because it had a rocky road!

  // 3. Output parser

  final parsed = await outputParser.invoke(chatOutput);
  print(parsed);
  // Why did the ice cream go to therapy?
  // Because it had a rocky road!
}

Future<void> _ragSearch() async {
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
