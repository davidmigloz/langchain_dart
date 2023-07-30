import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('CsvLoader tests', () {
    test('Test that a csv file can be loaded', () async {
      const filePath = './test/documents/loaders/assets/example_1.csv';

      const expectedDoc = Document(
        pageContent: 'Foo: Foo\nBar: Bar\nBaz: Baz',
        metadata: {
          'source': './test/documents/loaders/assets/example_1.csv',
        },
      );

      final loader = CsvLoader(
        filePath,
      );

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          expectedDoc,
          emitsDone,
        ]),
      );
    });

    test('test override field names', () async {
      const filePath = './test/documents/loaders/assets/example_2.csv';

      final loader = CsvLoader(
        filePath,
        fieldNames: ['cat', 'auth', 'book title', 'cost'],
        useCols: ['price'],
      );

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          (final Document doc) => doc.pageContent == 'cost: 8.95',
          (final Document doc) => doc.pageContent == 'cost: 12.99',
          (final Document doc) => doc.pageContent == 'cost: 8.99',
          (final Document doc) => doc.pageContent == 'cost: 22.99',
        ]),
      );
    });

    test('test extracting string field', () async {
      const filePath = './test/documents/loaders/assets/example_2.csv';

      final loader = CsvLoader(
        filePath,
        useCols: ['category'],
      );

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          (final Document doc) => doc.pageContent == 'category: reference',
          (final Document doc) => doc.pageContent == 'category: fiction',
          (final Document doc) => doc.pageContent == 'category: fiction',
          (final Document doc) => doc.pageContent == 'category: fiction',
        ]),
      );
    });

    test('test invalid column throws exception', () async {
      const filePath = './test/documents/loaders/assets/example_2.csv';

      final loader = CsvLoader(
        filePath,
        useCols: ['isbn'],
      );

      expect(() async => loader.load(), throwsException);
    });

    test('test custom metadata', () async {
      const filePath = './test/documents/loaders/assets/example_2.csv';

      final loader = CsvLoader(
        filePath,
        useCols: ['title'],
        sourceColumn: 'title',
      );

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          (final Document doc) =>
              doc.metadata['source'] == 'Sayings of the Century',
          (final Document doc) => doc.metadata['source'] == 'Sword of Honour',
          (final Document doc) => doc.metadata['source'] == 'Moby Dick',
          (final Document doc) =>
              doc.metadata['source'] == 'The Lord of the Rings',
        ]),
      );
    });
  });
}
