# ChatOllama

Wrapper around [Ollama](https://ollama.ai) Completions API that enables to interact with the LLMs in a chat-like fashion.

Ollama allows you to run open-source large language models, such as Llama 3, locally.

Ollama bundles model weights, configuration, and data into a single package, defined by a Modelfile.

It optimizes setup and configuration details, including GPU usage.

For a complete list of supported models and model variants, see the [Ollama model library](https://ollama.ai/library).

## Setup

Follow [these instructions](https://github.com/jmorganca/ollama) to set up and run a local Ollama instance:

1. Download and install [Ollama](https://ollama.ai)
2. Fetch a model via `ollama pull <model family>`
  * e.g., for Llama 3: `ollama pull llama3`

## Usage

```dart
final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'You are a helpful assistant that translates {input_language} to {output_language}.'),
  (ChatMessageType.human, '{text}'),
]);

final chatModel = ChatOllama(
  defaultOptions: ChatOllamaOptions(
    model: 'llama3',
    temperature: 0,
  ),
);

final chain = promptTemplate | chatModel | StringOutputParser();

final res = await chain.invoke({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.',
});
print(res);
// -> 'La traduction est : "J'aime le programming.'
```

## Streaming

```dart
final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'You are a helpful assistant that replies only with numbers in order without any spaces or commas'),
  (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
]);
final chat = ChatOllama(
  defaultOptions: ChatOllamaOptions(
    model: 'llama3',
    temperature: 0,
  ),
);
final chain = promptTemplate.pipe(chat).pipe(StringOutputParser());

final stream = chain.stream({'max_num': '9'});
await stream.forEach(print);
// 1
// 2
// 3
// ..
// 9
```

## JSON mode

You can force the model to produce JSON output that you can easily parse using `JsonOutputParser`, useful for extracting structured data.

```dart
final promptTemplate = ChatPromptTemplate.fromTemplates(const [
  (ChatMessageType.system, 'You are an assistant that respond question using JSON format.'),
  (ChatMessageType.human, '{question}'),
]);
final chat = ChatOllama(
  defaultOptions: ChatOllamaOptions(
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
```

## Multimodal support

Ollama has support for multi-modal LLMs, such as [bakllava](https://ollama.ai/library/bakllava) and [llava](https://ollama.ai/library/llava).

You can provide several base64-encoded `png` or `jpeg` images. Images up to 100MB in size are supported.

```dart
final chatModel = ChatOllama(
  defaultOptions: ChatOllamaOptions(
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
```

## RAG (Retrieval-Augmented Generation) pipeline

We can easily create a fully local RAG pipeline using `OllamaEmbeddings` and `ChatOllama`.

```dart
// 1. Create a vector store and add documents to it
final vectorStore = MemoryVectorStore(
  embeddings: OllamaEmbeddings(model: 'llama3'),
);
await vectorStore.addDocuments(
  documents: [
    Document(pageContent: 'LangChain was created by Harrison'),
    Document(pageContent: 'David ported LangChain to Dart in LangChain.dart'),
  ],
);

// 2. Construct a RAG prompt template
final promptTemplate = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, 'Answer the question based on only the following context:\n{context}'),
  (ChatMessageType.human, '{question}'),
]);

// 3. Define the model to use and the vector store retriever
final chatModel = ChatOllama(
  defaultOptions: ChatOllamaOptions(model: 'llama3'),
);
final retriever = vectorStore.asRetriever(
  defaultOptions: VectorStoreRetrieverOptions(
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
}).pipe(promptTemplate).pipe(chatModel).pipe(StringOutputParser());

// 5. Run the pipeline
final res = await chain.invoke('Who created LangChain.dart?');
print(res);
// Based on the context provided, David created LangChain.dart.
```
