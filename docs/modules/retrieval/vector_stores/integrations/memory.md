# MemoryVectorStore

`MemoryVectorStore` is an in-memory, ephemeral vector store that stores
embeddings in-memory and does an exact, linear search for the most similar
embeddings. The default similarity metric is cosine similarity.

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
  apiKey: openaiApiKey,
  model: 'gpt-3.5-turbo-0613',
  temperature: 0,
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
