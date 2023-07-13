import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('JsonLoader tests', () {
    test('Test that a json file can be loaded', () async {
      const filePath = './test/documents/loaders/assets/example.json';

      final expectedDoc = Document(
        pageContent: 'Foo\nBar\nBaz\n',
        metadata: {
          'source': '$filePath/example.json',
          'path': filePath,
          'name': 'example.json',
          'size': 30,
          'lastModified': DateTime.parse('2023-07-11 17:54:43.000'),
        },
      );

      const loader = JsonLoader(
        filePath: filePath,
        jpSchema: r'$..text',
      );

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
