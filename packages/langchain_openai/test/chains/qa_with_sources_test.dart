@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:collection/collection.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:langchain_openai/src/chains/qa_with_sources.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAIQAWithSourcesChain tests', () {
    final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

    test('Test OpenAIQAWithSourcesChain', () async {
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

      expect(res['query'], query);

      expect(res['result'], isA<QAWithSources>());
      final qaWithSources = res['result'] as QAWithSources;

      final answer = qaWithSources.answer;
      expect(answer, isNotEmpty);

      final sources = qaWithSources.sources;
      expect(sources, isNotEmpty);
      expect(sources.first, endsWith('-pl'));
    });
  });
}
