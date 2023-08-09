import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('CsvLoader tests', () {
    test('Test that a csv file can be loaded', () async {
      const filePath = './test/documents/loaders/assets/example_1.csv';

      const expectedDoc = Document(
        pageContent: 'Foo: Foo\nBar: Bar\nBaz: Baz',
        metadata: {'source': filePath},
      );

      final loader = CsvLoader(filePath);

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          expectedDoc,
          emitsDone,
        ]),
      );
    });

    test('Test field names override', () async {
      const filePath = './test/documents/loaders/assets/example_2.csv';

      final loader = CsvLoader(
        filePath,
        fieldsOverride: ['cat', 'auth', 'tit', 'cost'],
      );

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          const Document(
            pageContent: 'cat: reference\n'
                'auth: Nigel Rees\n'
                'tit: Sayings of the Century\n'
                'cost: 8.95',
            metadata: {'source': filePath},
          ),
          const Document(
            pageContent: 'cat: fiction\n'
                'auth: Evelyn Waugh\n'
                'tit: Sword of Honour\n'
                'cost: 12.99',
            metadata: {'source': filePath},
          ),
          const Document(
            pageContent: 'cat: fiction\n'
                'auth: Herman Melville\n'
                'tit: Moby Dick\n'
                'cost: 8.99',
            metadata: {'source': filePath},
          ),
          const Document(
            pageContent: 'cat: fiction\n'
                'auth: J. R. R. Tolkien\n'
                'tit: The Lord of the Rings\n'
                'cost: 22.99',
            metadata: {'source': filePath},
          ),
          emitsDone,
        ]),
      );
    });

    test('Test extracting field', () async {
      const filePath = './test/documents/loaders/assets/example_2.csv';

      final loader = CsvLoader(
        filePath,
        fields: ['category'],
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

    test('Test extracting field and override name', () async {
      const filePath = './test/documents/loaders/assets/example_2.csv';

      final loader = CsvLoader(
        filePath,
        fields: ['category'],
        fieldsOverride: ['cat'],
      );

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          (final Document doc) => doc.pageContent == 'cat: reference',
          (final Document doc) => doc.pageContent == 'cat: fiction',
          (final Document doc) => doc.pageContent == 'cat: fiction',
          (final Document doc) => doc.pageContent == 'cat: fiction',
        ]),
      );
    });

    test('test invalid column throws exception', () async {
      const filePath = './test/documents/loaders/assets/example_2.csv';

      final loader = CsvLoader(
        filePath,
        fields: ['isbn'],
      );

      expect(() async => loader.load(), throwsA(isA<AssertionError>()));
    });

    test('test custom source metadata', () async {
      const filePath = './test/documents/loaders/assets/example_2.csv';

      final loader = CsvLoader(
        filePath,
        fields: ['category'],
        sourceField: 'title',
      );

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          (final Document doc) =>
              doc.pageContent == 'category: reference' &&
              doc.metadata['source'] == 'Sayings of the Century',
          (final Document doc) =>
              doc.pageContent == 'category: fiction' &&
              doc.metadata['source'] == 'Sword of Honour',
          (final Document doc) =>
              doc.pageContent == 'category: fiction' &&
              doc.metadata['source'] == 'Moby Dick',
          (final Document doc) =>
              doc.pageContent == 'category: fiction' &&
              doc.metadata['source'] == 'The Lord of the Rings',
        ]),
      );
    });

    test('Test metadata builder', () async {
      const filePath = './test/documents/loaders/assets/example_2.csv';

      final loader = CsvLoader(
        filePath,
        metadataBuilder: (final Map<String, dynamic> row, final rowMetadata) {
          return {'source': '${row['title']} | ${row['price']}'};
        },
      );

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          (final Document doc) =>
              doc.metadata['source'] == 'Sayings of the Century | 8.95',
          (final Document doc) =>
              doc.metadata['source'] == 'Sword of Honour | 12.99',
          (final Document doc) => doc.metadata['source'] == 'Moby Dick | 8.99',
          (final Document doc) =>
              doc.metadata['source'] == 'The Lord of the Rings | 22.99',
        ]),
      );
    });

    test('Test TSV file', () async {
      const filePath = './test/documents/loaders/assets/example_2.tsv';

      final loader = CsvLoader(
        filePath,
        fieldDelimiter: '\t',
      );

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          const Document(
            pageContent: 'category: reference\n'
                'author: Nigel Rees\n'
                'title: Sayings of the Century\n'
                'price: 8.95',
            metadata: {'source': filePath},
          ),
          const Document(
            pageContent: 'category: fiction\n'
                'author: Evelyn Waugh\n'
                'title: Sword of Honour\n'
                'price: 12.99',
            metadata: {'source': filePath},
          ),
          const Document(
            pageContent: 'category: fiction\n'
                'author: Herman Melville\n'
                'title: Moby Dick\n'
                'price: 8.99',
            metadata: {'source': filePath},
          ),
          const Document(
            pageContent: 'category: fiction\n'
                'author: J. R. R. Tolkien\n'
                'title: The Lord of the Rings\n'
                'price: 22.99',
            metadata: {'source': filePath},
          ),
          emitsDone,
        ]),
      );
    });
  });
}
