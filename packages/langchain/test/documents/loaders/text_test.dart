import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('TextLoader tests', () {
    test('Test that a text file can be loaded', () async {
      const filePath = './test/documents/loaders/assets/example.txt';

      final expectedDoc = Document(
        pageContent: 'Foo\nBar\nBaz\n',
        metadata: {
          'path': filePath,
          'name': 'example.txt',
          'size': 12,
          'lastModified': DateTime.parse('2023-06-20 22:12:19.000'),
        },
      );

      const loader = TextLoader(filePath);
      expect(
        loader.lazyLoad(),
        emitsInOrder([
          expectedDoc,
          emitsDone,
        ]),
      );
    });
  });
}
