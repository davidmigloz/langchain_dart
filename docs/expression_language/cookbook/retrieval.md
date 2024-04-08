# Retrieval Augmented Generation (RAG)

Let's look at adding in a retrieval step to a prompt and LLM, which adds up to a "retrieval-augmented generation" chain.

For this example, we are going to use Chroma vector store. First, we'll add some documents to the vector store:

```dart
final openaiApiKey = Platform.environment['OPENAI_API_KEY']!;
final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);

final vectorStore = Chroma(embeddings: embeddings);
await vectorStore.addDocuments(
  documents: const [
    Document(pageContent: 'Payment methods: iDEAL, PayPal and credit card'),
    Document(pageContent: 'Free shipping: on orders over 30€'),
  ],
);
```

Now we can use the vector store as a retriever in a chain:

```dart
final retriever = vectorStore.asRetriever();
final model = ChatOpenAI(apiKey: openaiApiKey);

final promptTemplate = ChatPromptTemplate.fromTemplate('''
Answer the question based only on the following context:
{context}

Question: {question}''');

final chain = Runnable.fromMap<String>({
  'context': retriever | Runnable.fromFunction((docs, _) => docs.join('\n')),
  'question': Runnable.passthrough(),
}) | promptTemplate | model | StringOutputParser();

final res1 = await chain.invoke('What payment methods do you accept?');
print(res1);
// The payment methods accepted are iDEAL, PayPal, and credit card.

await chain.stream('How can I get free shipping?').forEach(stdout.write);
// To get free shipping, you need to place an order over 30€.
```

Imagine that we now want to answer the question in a different language. We will need to pass two parameters when invoking the chain. We can use 

```dart
final promptTemplate = ChatPromptTemplate.fromTemplate('''
Answer the question based only on the following context:
{context}

Question: {question}

Answer in the following language: {language}''');

final chain = Runnable.fromMap({
      'context': Runnable.getItemFromMap<String>('question') |
          (retriever | Runnable.fromFunction((docs, _) => docs.join('\n'))),
      'question': Runnable.getItemFromMap('question'),
      'language': Runnable.getItemFromMap('language'),
    }) |
    promptTemplate |
    model |
    StringOutputParser();

final res1 = await chain.invoke({
  'question': 'What payment methods do you accept?',
  'language': 'es_ES',
});
print(res1);
// Aceptamos los siguientes métodos de pago: iDEAL, PayPal y tarjeta de crédito.

await chain.stream({
  'question': 'How can I get free shipping?',
  'language': 'nl_NL',
}).forEach(stdout.write);
// Om gratis verzending te krijgen, moet je bestellingen plaatsen van meer dan 30€.
```

*Note: you may have noticed that we added parentheses around the retriever. This is to workaround the type inference limitations of Dart when using the `|` operator. You won't need them if you use `.pipe` instead.*

## Conversational Retrieval Chain

Because we can create `Runnable`s from functions we can add in conversation history via a formatting function. This allows us to recreate the popular   `ConversationalRetrievalQAChain` to "chat with data":

```dart
final retriever = vectorStore.asRetriever();
final model = ChatOpenAI(apiKey: openaiApiKey);

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
            Runnable.fromFunction((history, _) => formatChatHistory(history)),
      }) |
      condenseQuestionPrompt |
      model |
      StringOutputParser(reduceOutputStream: true),
});

final context = Runnable.fromMap({
  'context': Runnable.getItemFromMap<String>('standalone_question') |
      retriever |
      Runnable.fromFunction<List<Document>, String>(
        (docs, _) => combineDocuments(docs),
      ),
  'question': Runnable.getItemFromMap('standalone_question'),
});

final conversationalQaChain =
    inputs | context | answerPrompt | model | StringOutputParser();

final res1 = await conversationalQaChain.invoke({
  'question': 'What payment methods do you accept?',
  'chat_history': <(String, String)>[],
});
print(res1);
// The methods of payment that are currently accepted are iDEAL, PayPal, and credit card.

await conversationalQaChain.stream({
  'question': 'Do I get free shipping?',
  'chat_history': [('How much did you spend?', 'I spent 100€')],
}).forEach(stdout.write);
// Yes, shipping is free on orders over 30€.
```

### With Memory and returning source documents

In this example, we will add a memory to the chain and return the source documents from the retriever.

```dart
final retriever = vectorStore.asRetriever(
  defaultOptions: const VectorStoreRetrieverOptions(
    searchType: VectorStoreSimilaritySearch(k: 1),
  ),
);
final model = ChatOpenAI(apiKey: openaiApiKey);
const stringOutputParser = StringOutputParser<ChatResult>();
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
  'memory': Runnable.fromFunction((_, __) => memory.loadMemoryVariables()),
});

// Next, we get the chat history from the memory
final expandedMemory = Runnable.fromMap({
  'question': Runnable.getItemFromMap('question'),
  'chat_history': Runnable.getItemFromMap('memory') |
      Runnable.fromFunction<MemoryVariables, List<ChatMessage>>(
        (input, _) => input['history'],
      ),
});

// Now, we generate a standalone question that includes the 
// necessary details from the chat history
final standaloneQuestion = Runnable.fromMap({
  'standalone_question': Runnable.fromMap({
        'question': Runnable.getItemFromMap('question'),
        'chat_history': Runnable.getItemFromMap<List<ChatMessage>>(
                'chat_history') |
            Runnable.fromFunction((history, _) => formatChatHistory(history)),
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
        (docs, _) => combineDocuments(docs),
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
    'question': ChatMessage.humanText('How much does my order cost?')
  },
  outputValues: {'answer': ChatMessage.ai('You have to pay 100€')},
);

final res = await conversationalQaChain.invoke({
  'question': 'Do I get free shipping on the value of my order?',
});
print(res);
// {
//   answer: Yes, based on the given context, you would receive free shipping on
//     your order of 100€ since it exceeds the minimum requirement of 30€ for
//     free shipping.,
//   docs: [
//     Document{
//       id: 69974fe1-8436-40c7-87d1-c59c5ff1c6a6,
//       pageContent: Free shipping: on orders over 30€,
//       metadata: {},
//     }
//   ]
// }
```
