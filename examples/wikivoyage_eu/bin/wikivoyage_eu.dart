import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_ollama/langchain_ollama.dart';

void main() async {
  final vectorStore = ObjectBoxVectorStore.open(
    embeddings: OllamaEmbeddings(model: 'jina/jina-embeddings-v2-small-en'),
    dimensions: 512,
  );

  final retriever = vectorStore.asRetriever(
    defaultOptions: VectorStoreRetrieverOptions(
      searchType: ObjectBoxSimilaritySearch(k: 5),
    ),
  );
  final setupAndRetrieval = Runnable.fromMap<String>({
    'context': retriever.pipe(
      Runnable.mapInput(
        (docs) => docs.map((d) => d.pageContent).join('\n---\n'),
      ),
    ),
    'question': Runnable.passthrough(),
  });

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      '''
Here is some data from Wikivoyage about travel destinations in Europe:

<context>
{context}
</context>

Please read the Wikivoyage data carefully and consider how you can best answer the user's question using only the information provided.

Use ANSI escape codes instead of Markdown to format your answer. 
For example, `\x1B[1m<text>\x1B[0m` will make "<text>" bold.

If the user's question is not about Europe, just respond with:
"I can only help you with vacation planning in Europe."
Do not provide any other suggestion if the question is not about Europe.
''',
    ),
    (ChatMessageType.human, '{question}'),
  ]);

  final model = ChatOllama(
    defaultOptions: const ChatOllamaOptions(model: 'llama3.2'),
  );
  const outputParser = StringOutputParser<ChatResult>();
  final chain =
      setupAndRetrieval //
          .pipe(promptTemplate)
          .pipe(model)
          .pipe(outputParser);

  stdout.writeln(
    'Hello! Ask me anything about your vacation plans in Europe, '
    'and I will provide you with the best itinerary.',
  );

  while (true) {
    stdout.write('> ');
    final query = stdin.readLineSync() ?? '';

    if (query.toLowerCase() == 'q') {
      break;
    }

    final stream = chain.stream(query);
    await stream.forEach(stdout.write);
    stdout.write('\n\n');
  }

  chain.close();
}
