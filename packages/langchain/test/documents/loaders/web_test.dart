import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('WebBaseLoader tests', () {
    test('Test that a web page can be loaded', () async {
      const url = 'https://en.wikipedia.org/wiki/Wikipedia';

      const loader = WebBaseLoader([url]);
      final loadedDocs = await loader.load();

      expect(loadedDocs, hasLength(1));

      final loadedDoc = loadedDocs.first;
      expect(loadedDoc.pageContent, isNot(contains('<html')));
      expect(loadedDoc.pageContent, isNot(contains('<head')));
      expect(loadedDoc.pageContent, isNot(contains('<body')));
      expect(loadedDoc.pageContent, isNot(contains('<style')));
      expect(loadedDoc.pageContent, isNot(contains('<script')));

      final metadata = loadedDoc.metadata;
      expect(metadata['source'], url);
      expect(metadata['title'], contains('Wikipedia'));
      expect(metadata['language'], 'en');
    });
  });
}
