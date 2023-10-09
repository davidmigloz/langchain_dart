import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('JsonLoader tests', () {
    test('Test that a json file can be loaded', () async {
      const filePath = './test/documents/loaders/assets/example_1.json';

      const loader = JsonLoader(
        filePath,
        jpSchema: r'$..text',
      );

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          (final Document doc) {
            expect(doc.pageContent, 'Foo\nBar\nBaz\n');
            expect(doc.metadata['source'], filePath);
            expect(doc.metadata['name'], 'example_1.json');
            expect(doc.metadata['size'], 32);
            expect(doc.metadata['lastModified'], isA<int>());
            return true;
          },
          emitsDone,
        ]),
      );
    });

    test('test extracting numeric field', () async {
      const filePath = './test/documents/loaders/assets/example_2.json';

      const loader = JsonLoader(
        filePath,
        jpSchema: r'$..price',
      );

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          (final Document doc) => doc.pageContent == '8.95',
          (final Document doc) => doc.pageContent == '12.99',
          (final Document doc) => doc.pageContent == '8.99',
          (final Document doc) => doc.pageContent == '22.99',
          (final Document doc) => doc.pageContent == '19.95',
        ]),
      );
    });

    test('test extracting string field', () async {
      const filePath = './test/documents/loaders/assets/example_2.json';

      const loader = JsonLoader(
        filePath,
        jpSchema: r'$..category',
      );

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          (final Document doc) => doc.pageContent == 'reference',
          (final Document doc) => doc.pageContent == 'fiction',
          (final Document doc) => doc.pageContent == 'fiction',
          (final Document doc) => doc.pageContent == 'fiction',
        ]),
      );
    });

    test('test invalid jpSchema throws exception', () async {
      const filePath = './test/documents/loaders/assets/example_2.json';

      const loader = JsonLoader(
        filePath,
        jpSchema: r'.[]',
      );

      expect(() async => loader.load(), throwsException);
    });

    test('test custom metadata', () async {
      const filePath = './test/documents/loaders/assets/example_2.json';

      final loader = JsonLoader(
        filePath,
        jpSchema: r'$..category',
        metadataBuilder: (final matchValue, final fileMetadata) {
          return {'length': matchValue.toString().length};
        },
      );

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          (final Document doc) => doc.metadata['length'] == 9,
          (final Document doc) => doc.metadata['length'] == 7,
          (final Document doc) => doc.metadata['length'] == 7,
          (final Document doc) => doc.metadata['length'] == 7,
        ]),
      );
    });
  });
}
