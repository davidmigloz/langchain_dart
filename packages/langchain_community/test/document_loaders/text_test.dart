import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_core/documents.dart';
import 'package:test/test.dart';

void main() {
  group('TextLoader tests', () {
    test('Test that a text file can be loaded', () async {
      const filePath = './test/document_loaders/assets/example.txt';
      const loader = TextLoader(filePath);
      expect(
        loader.lazyLoad(),
        emitsInOrder([
          (final Document doc) {
            expect(doc.pageContent, 'Foo\nBar\nBaz\n');
            expect(doc.metadata['source'], filePath);
            expect(doc.metadata['name'], 'example.txt');
            expect(doc.metadata['size'], 12);
            expect(doc.metadata['lastModified'], isA<int>());
            return true;
          },
          emitsDone,
        ]),
      );
    });
  });
}
