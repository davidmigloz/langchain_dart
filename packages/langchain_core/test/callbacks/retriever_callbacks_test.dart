import 'package:langchain_core/documents.dart';
import 'package:langchain_core/retrievers.dart';
import 'package:test/test.dart';

import 'fake_callback_handler.dart';

void main() {
  group('Retriever callback integration', () {
    test('invoke fires onRetrieverStart and onRetrieverEnd', () async {
      final handler = FakeCallbackHandler();
      const retriever = FakeRetriever([
        Document(pageContent: 'result for query'),
      ]);

      final docs = await retriever.invoke(
        'test query',
        options: RetrieverOptions(callbacks: [handler]),
      );

      expect(docs, hasLength(1));
      expect(docs.first.pageContent, 'result for query');
      expect(handler.retrieverStarts, 1);
      expect(handler.retrieverEnds, 1);
      expect(handler.retrieverErrors, 0);
    });
  });
}
