# Summarize

A summarization chain can be used to summarize multiple documents.

There are two methods to summarize documents:
- `stuff` uses the `StuffDocumentsChain` to combine all the documents into
  a single string, then prompts the model to summarize that string. This
  method is limited by the context length limit of the model.
- `mapReduce` uses the `MapReduceDocumentsChain` to summarize each document
  individually, then combines the results into a single summary.

## Stuff

The `stuff` method uses the `StuffDocumentsChain` to combine all the
documents into a single string, then prompts the model to summarize that
string. This method is limited by the context length limit of the `llm`.

Example:
```dart
final loader = TextLoader('path/to/file.txt');
final docs = await loader.load();

const textSplitter = RecursiveCharacterTextSplitter();
final docsChunks = textSplitter.splitDocuments(docs);

final llm = ChatOpenAI(apiKey: openAIKey);
final summarizeChain = SummarizeChain.stuff(llm: llm);

final summary = await summarizeChain.run(docsChunks);
```

## MapReduce

The `mapReduce` method uses the `MapReduceDocumentsChain` to summarize
each document individually, then combines the results into a single
summary.

The `MapReduceDocumentsChain` involves two chains behind the scenes:
- `MapReduceDocumentsChain.mapLlmChain` this is the chain that is applied
  to each document to create a summary.
- `MapReduceDocumentsChain.reduceDocumentsChain this is a
  `ReduceDocumentsChain` that reduces the summaries of each document into
  a single summary.

Example:
```dart
final loader = WebBaseLoader(['https://example.com']);
final docs = await loader.load();

const textSplitter = RecursiveCharacterTextSplitter();
final docsChunks = textSplitter.splitDocuments(docs);

final llm = ChatOpenAI(apiKey: openAIKey);
final summarizeChain = SummarizeChain.mapReduce(llm: llm);

final summary = await summarizeChain.run(docsChunks);
```
