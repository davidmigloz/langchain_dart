# Retrievers

A retriever is an interface that returns documents given an unstructured query.
It is more general than a vector store. A retriever does not need to be able to
store documents, only to return (or retrieve) it. Vector stores can be used as
the backbone of a retriever, but there are other types of retrievers as well.

## Get started

The public API of the `BaseRetriever` class in LangChain is as follows:

```dart
abstract interface class BaseRetriever {
  Future<List<Document>> getRelevantDocuments(final String query);
}
```

It's that simple! You can call `getRelevantDocuments` method to retrieve
documents relevant to a query, where "relevance" is defined by the specific
retriever object you are calling.

Of course, we also help construct what we think useful Retrievers are. The main
type of Retriever that we focus on is a VectorStore retriever. We will focus on
that for the rest of this guide.

In order to understand what a vector store retriever is, it's important to
understand what a vector store is. So let's look at that.

This example showcases question answering over documents. We have chosen this as the example for getting started because it nicely combines a lot of different elements (Text splitters, embeddings, vectorstores) and then also shows how to use them in a chain.

Question answering over documents consists of four steps:

1. Create an index
2. Create a Retriever from that index
3. Create a question answering chain
4. Ask questions!

```dart
const filePath = './test/chains/assets/state_of_the_union.txt';
const loader = TextLoader(filePath);
final documents = await loader.load();
const textSplitter = CharacterTextSplitter(
  chunkSize: 800,
  chunkOverlap: 0,
);
final texts = textSplitter.splitDocuments(documents);
final textsWithSources = texts
    .mapIndexed(
      (final i, final d) => d.copyWith(
        metadata: {
          ...d.metadata,
          'source': '$i-pl',
        },
      ),
    )
    .toList(growable: false);
final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);
final docSearch = await MemoryVectorStore.fromDocuments(
  documents: textsWithSources,
  embeddings: embeddings,
);
final llm = ChatOpenAI(
  apiKey: openAiKey,
  defaultOptions: const ChatOpenAIOptions(temperature: 0),
);
final qaChain = OpenAIQAWithSourcesChain(llm: llm);
final docPrompt = PromptTemplate.fromTemplate(
  'Content: {page_content}\nSource: {source}',
);
final finalQAChain = StuffDocumentsChain(
  llmChain: qaChain,
  documentPrompt: docPrompt,
);
final retrievalQA = RetrievalQAChain(
  retriever: docSearch.asRetriever(),
  combineDocumentsChain: finalQAChain,
);
const query = 'What did President Biden say about Russia?';
final res = await retrievalQA(query);
```
