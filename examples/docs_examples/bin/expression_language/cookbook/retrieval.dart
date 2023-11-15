// ignore_for_file: avoid_print, avoid_redundant_argument_values
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_chroma/langchain_chroma.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _addDocumentsToVectorStore();
  await _rag();
  await _ragMultipleInputs();
  await _conversationalRetrievalChain();
  await _conversationalRetrievalChainMemoryAndDocs();
}

Future<void> _addDocumentsToVectorStore() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY']!;
  final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);

  final vectorStore = Chroma(embeddings: embeddings);
  await vectorStore.addDocuments(
    documents: const [
      Document(pageContent: 'Payment methods: iDEAL, PayPal and credit card'),
      Document(pageContent: 'Free shipping: on orders over 30€'),
    ],
  );
}

Future<void> _rag() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY']!;
  final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);
  final vectorStore = Chroma(embeddings: embeddings);

  final retriever = vectorStore.asRetriever();
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate('''
Answer the question based only on the following context:
{context}

Question: {question}''');

  final chain = Runnable.fromMap({
        'context': retriever |
            Runnable.fromFunction((final docs, final _) => docs.join('\n')),
        'question': Runnable.passthrough(),
      }) |
      promptTemplate |
      model |
      const StringOutputParser();

  final res1 = await chain.invoke('What payment methods do you accept?');
  print(res1);
  // The payment methods accepted are iDEAL, PayPal, and credit card.

  final res2 = await chain.invoke('How can I get free shipping?');
  print(res2);
  // To get free shipping, you need to place an order over 30€.
}

Future<void> _ragMultipleInputs() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY']!;
  final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);
  final vectorStore = Chroma(embeddings: embeddings);

  final retriever = vectorStore.asRetriever();
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate('''
Answer the question based only on the following context:
{context}

Question: {question}

Answer in the following language: {language}''');

  final chain = Runnable.fromMap({
        'context': Runnable.getItemFromMap('question') |
            (retriever |
                Runnable.fromFunction(
                  (final docs, final _) => docs.join('\n'),
                )),
        'question': Runnable.getItemFromMap('question'),
        'language': Runnable.getItemFromMap('language'),
      }) |
      promptTemplate |
      model |
      const StringOutputParser();

  final res1 = await chain.invoke({
    'question': 'What payment methods do you accept?',
    'language': 'es_ES',
  });
  print(res1);
  // Aceptamos los siguientes métodos de pago: iDEAL, PayPal y tarjeta de
  // crédito.

  final res2 = await chain.invoke({
    'question': 'How can I get free shipping?',
    'language': 'nl_NL',
  });
  print(res2);
  // Om gratis verzending te krijgen, moet je bestellingen plaatsen van meer
  // dan 30€.
}

Future<void> _conversationalRetrievalChain() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY']!;
  final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);
  final vectorStore = Chroma(embeddings: embeddings);

  final retriever = vectorStore.asRetriever();
  final model = ChatOpenAI(apiKey: openaiApiKey);
  const stringOutputParser = StringOutputParser();

  final condenseQuestionPrompt = ChatPromptTemplate.fromTemplate('''
Given the following conversation and a follow up question, rephrase the follow up question to be a standalone question, in its original language.

Chat History:
{chat_history}
Follow Up Input: {question}
Standalone question:''');

  final answerPrompt = ChatPromptTemplate.fromTemplate('''
Answer the question based only on the following context:
{context}

Question: {question}''');

  String combineDocuments(
    final List<Document> documents, {
    final String separator = '\n\n',
  }) {
    return documents.map((final d) => d.pageContent).join(separator);
  }

  String formatChatHistory(final List<(String, String)> chatHistory) {
    final formattedDialogueTurns = chatHistory.map((final dialogueTurn) {
      final (human, ai) = dialogueTurn;
      return 'Human: $human\nAssistant: $ai';
    });
    return formattedDialogueTurns.join('\n');
  }

  final inputs = Runnable.fromMap({
    'standalone_question': Runnable.fromMap({
          'question': Runnable.getItemFromMap('question'),
          'chat_history':
              Runnable.getItemFromMap<List<(String, String)>>('chat_history') |
                  Runnable.fromFunction(
                    (final history, final _) => formatChatHistory(history),
                  ),
        }) |
        condenseQuestionPrompt |
        model |
        stringOutputParser,
  });

  final context = Runnable.fromMap({
    'context': Runnable.getItemFromMap('standalone_question') |
        retriever |
        Runnable.fromFunction<List<Document>, String>(
          (final docs, final _) => combineDocuments(docs),
        ),
    'question': Runnable.getItemFromMap('standalone_question'),
  });

  final conversationalQaChain =
      inputs | context | answerPrompt | model | stringOutputParser;

  final res1 = await conversationalQaChain.invoke({
    'question': 'What payment methods do you accept?',
    'chat_history': <(String, String)>[],
  });
  print(res1);
  // The methods of payment that are currently accepted are iDEAL, PayPal, and
  // credit card.

  final res2 = await conversationalQaChain.invoke({
    'question': 'Do I get free shipping?',
    'chat_history': [('How much did you spend?', 'I spent 100€')],
  });
  print(res2);
  // Yes, shipping is free on orders over 30€.
}

Future<void> _conversationalRetrievalChainMemoryAndDocs() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY']!;
  final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);
  final vectorStore = Chroma(embeddings: embeddings);

  final retriever = vectorStore.asRetriever(
    searchType: const VectorStoreSimilaritySearch(k: 1),
  );
  final model = ChatOpenAI(apiKey: openaiApiKey);
  const stringOutputParser = StringOutputParser();
  final memory = ConversationBufferMemory(
    inputKey: 'question',
    outputKey: 'answer',
    memoryKey: 'history',
    returnMessages: true,
  );

  final condenseQuestionPrompt = ChatPromptTemplate.fromTemplate('''
Given the following conversation and a follow up question, rephrase the follow up question to be a standalone question that includes all the details from the conversation in its original language

Chat History:
{chat_history}
Follow Up Input: {question}
Standalone question:''');

  final answerPrompt = ChatPromptTemplate.fromTemplate('''
Answer the question based only on the following context:
{context}

Question: {question}''');

  String combineDocuments(
    final List<Document> documents, {
    final String separator = '\n\n',
  }) =>
      documents.map((final d) => d.pageContent).join(separator);

  String formatChatHistory(final List<ChatMessage> chatHistory) {
    final formattedDialogueTurns = chatHistory
        .map(
          (final msg) => switch (msg) {
            HumanChatMessage _ => 'Human: ${msg.content}',
            AIChatMessage _ => 'AI: ${msg.content}',
            _ => '',
          },
        )
        .toList();
    return formattedDialogueTurns.join('\n');
  }

  // First, we load the memory
  final loadedMemory = Runnable.fromMap({
    'question': Runnable.getItemFromMap('question'),
    'memory': Runnable.fromFunction(
      (final _, final __) => memory.loadMemoryVariables(),
    ),
  });

  // Next, we get the chat history from the memory
  final expandedMemory = Runnable.fromMap({
    'question': Runnable.getItemFromMap('question'),
    'chat_history': Runnable.getItemFromMap('memory') |
        Runnable.fromFunction<MemoryVariables, List<ChatMessage>>(
          (final input, final _) => input['history'],
        ),
  });

  // Now, we generate a standalone question that includes the
  // necessary details from the chat history
  final standaloneQuestion = Runnable.fromMap({
    'standalone_question': Runnable.fromMap({
          'question': Runnable.getItemFromMap('question'),
          'chat_history':
              Runnable.getItemFromMap<List<ChatMessage>>('chat_history') |
                  Runnable.fromFunction(
                    (final history, final _) => formatChatHistory(history),
                  ),
        }) |
        condenseQuestionPrompt |
        model |
        stringOutputParser,
  });

  // Now we retrieve the documents
  final retrievedDocs = Runnable.fromMap({
    'docs': Runnable.getItemFromMap('standalone_question') | retriever,
    'question': Runnable.getItemFromMap('standalone_question'),
  });

  // Construct the inputs for the answer prompt
  final finalInputs = Runnable.fromMap({
    'context': Runnable.getItemFromMap('docs') |
        Runnable.fromFunction<List<Document>, String>(
          (final docs, final _) => combineDocuments(docs),
        ),
    'question': Runnable.getItemFromMap('question'),
  });

  // We prompt the model for an answer
  final answer = Runnable.fromMap({
    'answer': finalInputs | answerPrompt | model | stringOutputParser,
    'docs': Runnable.getItemFromMap('docs'),
  });

  // And finally, we put it all together
  final conversationalQaChain = loadedMemory |
      expandedMemory |
      standaloneQuestion |
      retrievedDocs |
      answer;

  // If we add some messages to the memory,
  // they will be used in the next invocation
  await memory.saveContext(
    inputValues: {
      'question': ChatMessage.humanText('How much does my order cost?'),
    },
    outputValues: {'answer': ChatMessage.ai('You have to pay 100€')},
  );

  final res = await conversationalQaChain.invoke({
    'question': 'Do I get free shipping on the value of my order?',
  });
  print(res);
  // {
  //   answer: Yes, based on the given context, you would receive free shipping
  //     on your order of 100€ since it exceeds the minimum requirement of 30€
  //     for free shipping.,
  //   docs: [
  //     Document{
  //       id: 69974fe1-8436-40c7-87d1-c59c5ff1c6a6,
  //       pageContent: Free shipping: on orders over 30€,
  //       metadata: {},
  //     }
  //   ]
  // }
}
