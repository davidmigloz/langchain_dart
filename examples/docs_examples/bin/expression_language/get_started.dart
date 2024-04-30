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
  const outputParser = StringOutputParser<ChatResult>();

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

  final input = {'topic': 'ice cream'};

  final res1 = await promptTemplate.invoke(input);
  print(res1.toChatMessages());
  // [HumanChatMessage{
  //   content: ChatMessageContentText{
  //     text: Tell me a joke about ice cream,
  //   },
  // }]

  final res2 = await promptTemplate.pipe(model).invoke(input);
  print(res2);
  // ChatResult{
  //   id: chatcmpl-9J37Tnjm1dGUXqXBF98k7jfexATZW,
  //   output: AIChatMessage{
  //     content: Why did the ice cream cone go to therapy? Because it had too many sprinkles of emotional issues!,
  //   },
  //   finishReason: FinishReason.stop,
  //   metadata: {
  //     model: gpt-3.5-turbo-0125,
  //     created: 1714327251,
  //     system_fingerprint: fp_3b956da36b
  //   },
  //   usage: LanguageModelUsage{
  //     promptTokens: 14,
  //     promptBillableCharacters: null,
  //     responseTokens: 21,
  //     responseBillableCharacters: null,
  //     totalTokens: 35
  //     },
  //   streaming: false
  // }
}

Future<void> _ragSearch() async {
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
