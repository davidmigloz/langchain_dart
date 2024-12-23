import 'package:langchain_community/langchain_community.dart';
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

    test('Test that non-ASCII characters are handled correctly', () async {
      const url = 'http://web.tccf.org.tw/lib/addon.php?act=post&id=4975';

      const loader = WebBaseLoader([url]);
      final loadedDocs = await loader.load();

      expect(loadedDocs, hasLength(1));

      final loadedDoc = loadedDocs.first;
      expect(loadedDoc.pageContent, contains('子宮內膜癌的介紹及治療現況'));

      final metadata = loadedDoc.metadata;
      expect(metadata['source'], url);
      expect(metadata['title'], contains('子宮內膜癌的介紹及治療現況'));
    });
  });
}
