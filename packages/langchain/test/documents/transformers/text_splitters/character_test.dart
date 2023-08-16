import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('CharacterTextSplitter tests', () {
    test('Test splitting by character count', () {
      const text = 'foo bar baz 123';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 7,
        chunkOverlap: 3,
      );
      final output = splitter.splitText(text);
      final expectedOutput = ['foo bar', 'bar baz', 'baz 123'];
      expect(output, expectedOutput);
    });

    test('Test splitting by character count does not create empty documents',
        () {
      const text = 'foo  bar';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 2,
        chunkOverlap: 0,
      );
      final output = splitter.splitText(text);
      final expectedOutput = ['foo', 'bar'];
      expect(output, expectedOutput);
    });

    test('Test edge cases are separators', () {
      const text = 'f b';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 2,
        chunkOverlap: 0,
      );
      final output = splitter.splitText(text);
      final expectedOutput = ['f', 'b'];
      expect(output, expectedOutput);
    });

    test('Test splitting by character count on long words', () {
      const text = 'foo bar baz a a';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 3,
        chunkOverlap: 1,
      );
      final output = splitter.splitText(text);
      final expectedOutput = ['foo', 'bar', 'baz', 'a a'];
      expect(output, expectedOutput);
    });

    test('Test splitting by character count when shorter words are first', () {
      const text = 'a a foo bar baz';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 3,
        chunkOverlap: 1,
      );
      final output = splitter.splitText(text);
      final expectedOutput = ['a a', 'foo', 'bar', 'baz'];
      expect(output, expectedOutput);
    });

    test('Test splitting by characters when splits not found easily', () {
      const text = 'foo bar baz 123';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 1,
        chunkOverlap: 1,
      );
      final output = splitter.splitText(text);
      final expectedOutput = ['foo', 'bar', 'baz', '123'];
      expect(output, expectedOutput);
    });

    test('Test merging splits with a given separator', () {
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 9,
        chunkOverlap: 2,
      );
      final splits = ['foo', 'bar', 'baz'];
      final expectedOutput = ['foo bar', 'baz'];
      final output = splitter.mergeSplits(splits, ' ');
      expect(output, expectedOutput);
    });

    test('Test split documents method', () {
      const docs = [
        Document(id: '1', pageContent: 'foo bar', metadata: {'m': '1'}),
        Document(id: '2', pageContent: 'baz', metadata: {'m': '2'}),
      ];
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 3,
        chunkOverlap: 0,
      );
      final splitDocs = splitter.splitDocuments(docs);
      final expectedDocs = [
        const Document(id: '1', pageContent: 'foo', metadata: {'m': '1'}),
        const Document(id: '1', pageContent: 'bar', metadata: {'m': '1'}),
        const Document(id: '2', pageContent: 'baz', metadata: {'m': '2'}),
      ];
      expect(splitDocs, equals(expectedDocs));
    });

    test('Test create documents method', () {
      final texts = ['foo bar', 'baz'];
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 3,
        chunkOverlap: 0,
      );
      final docs = splitter.createDocuments(texts);
      final expectedDocs = [
        const Document(pageContent: 'foo'),
        const Document(pageContent: 'bar'),
        const Document(pageContent: 'baz'),
      ];
      expect(docs, equals(expectedDocs));
    });

    test('Test create documents with metadata method', () {
      final texts = ['foo bar', 'baz'];
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 3,
        chunkOverlap: 0,
      );
      final docs = splitter.createDocuments(
        texts,
        metadatas: [
          {'source': '1'},
          {'source': '2'},
        ],
      );
      final expectedDocs = [
        const Document(pageContent: 'foo', metadata: {'source': '1'}),
        const Document(pageContent: 'bar', metadata: {'source': '1'}),
        const Document(pageContent: 'baz', metadata: {'source': '2'}),
      ];
      expect(docs, expectedDocs);
    });

    test('Test create documents method with start index', () {
      final texts = ['foo bar baz 123'];
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 7,
        chunkOverlap: 3,
        addStartIndex: true,
      );
      final docs = splitter.createDocuments(texts);
      final expectedDocs = [
        const Document(pageContent: 'foo bar', metadata: {'start_index': 0}),
        const Document(pageContent: 'bar baz', metadata: {'start_index': 4}),
        const Document(pageContent: 'baz 123', metadata: {'start_index': 8}),
      ];
      expect(docs, equals(expectedDocs));
    });

    test('Test that metadatas are not shallow', () {
      final texts = ['foo bar'];
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 3,
        chunkOverlap: 0,
      );
      final docs = splitter.createDocuments(
        texts,
        metadatas: [
          {'source': '1'},
        ],
      );
      final expectedDocs = [
        const Document(pageContent: 'foo', metadata: {'source': '1'}),
        const Document(pageContent: 'bar', metadata: {'source': '1'}),
      ];
      expect(docs, equals(expectedDocs));
      docs[0].metadata['foo'] = 1;
      expect(docs[0].metadata, {'source': '1', 'foo': 1});
      expect(docs[1].metadata, {'source': '1'});
    });

    test('Test splitting with keepSeparator enabled', () {
      const text = 'fooXbarXbaz';
      const splitter = CharacterTextSplitter(
        separator: 'X',
        chunkSize: 7,
        chunkOverlap: 3,
        keepSeparator: true,
      );

      final output = splitter.splitText(text);
      final expectedOutput = ['fooXbar', 'Xbaz'];
      expect(output, expectedOutput);
    });

    test('Test splitting where text length is equal to chunk size', () {
      const text = 'foobar';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 6,
        chunkOverlap: 3,
      );

      final output = splitter.splitText(text);
      final expectedOutput = ['foobar'];
      expect(output, expectedOutput);
    });

    test('Test splitting where chunkSize is greater than text length', () {
      const text = 'foo bar baz';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 50,
        chunkOverlap: 3,
      );

      final output = splitter.splitText(text);
      final expectedOutput = ['foo bar baz'];
      expect(output, expectedOutput);
    });

    test('Test splitting where text has trailing whitespaces', () {
      const text = 'foo bar baz     ';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 7,
        chunkOverlap: 3,
      );

      final output = splitter.splitText(text);
      final expectedOutput = ['foo bar', 'bar baz'];
      expect(output, expectedOutput);
    });

    test('Test splitting where text has special characters', () {
      const text = r'foo $$$$ bar baz';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 9,
        chunkOverlap: 3,
      );

      final output = splitter.splitText(text);
      final expectedOutput = [r'foo $$$$', 'bar baz'];
      expect(output, expectedOutput);
    });

    test('Test chunkSize smaller than length of a single word', () {
      const text = 'foo bar';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 2,
        chunkOverlap: 0,
      );

      final output = splitter.splitText(text);
      final expectedOutput = ['foo', 'bar'];
      expect(output, expectedOutput);
    });

    test('Test multiple documents creation', () {
      final texts = ['foo bar baz', '123 456 789'];
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 7,
        chunkOverlap: 0,
        addStartIndex: true,
      );
      final docs = splitter.createDocuments(texts);
      final expectedDocs = [
        const Document(pageContent: 'foo bar', metadata: {'start_index': 0}),
        const Document(pageContent: 'baz', metadata: {'start_index': 8}),
        const Document(pageContent: '123 456', metadata: {'start_index': 0}),
        const Document(pageContent: '789', metadata: {'start_index': 8}),
      ];
      expect(docs, equals(expectedDocs));
    });

    test('Test splitting with an empty string', () {
      const text = '';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 7,
        chunkOverlap: 3,
      );

      final output = splitter.splitText(text);
      final expectedOutput = <String>[]; // no chunks should be generated
      expect(output, expectedOutput);
    });

    test('Test splitting by character count.', () {
      const text = 'foo bar baz 123';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 7,
        chunkOverlap: 3,
      );
      final output = splitter.splitText(text);
      final expectedOutput = ['foo bar', 'bar baz', 'baz 123'];
      expect(output, expectedOutput);
    });

    test("Test splitting by character count doesn't create empty documents.",
        () {
      const text = 'foo  bar';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 2,
        chunkOverlap: 0,
      );
      final output = splitter.splitText(text);
      final expectedOutput = ['foo', 'bar'];
      expect(output, expectedOutput);
    });

    test('Test splitting by character count on long words.', () {
      const text = 'foo bar baz a a';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 3,
        chunkOverlap: 1,
      );
      final output = splitter.splitText(text);
      final expectedOutput = ['foo', 'bar', 'baz', 'a a'];
      expect(output, expectedOutput);
    });

    test('Test splitting by character count when shorter words are first.', () {
      const text = 'a a foo bar baz';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 3,
        chunkOverlap: 1,
      );
      final output = splitter.splitText(text);
      final expectedOutput = ['a a', 'foo', 'bar', 'baz'];
      expect(output, expectedOutput);
    });

    test('Test splitting by characters when splits not found easily.', () {
      const text = 'foo bar baz 123';
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 1,
        chunkOverlap: 0,
      );
      final output = splitter.splitText(text);
      final expectedOutput = ['foo', 'bar', 'baz', '123'];
      expect(output, expectedOutput);
    });

    test('Test invalid arguments.', () {
      expect(
        () => CharacterTextSplitter(chunkSize: 2, chunkOverlap: 4),
        throwsA(isA<AssertionError>()),
      );
    });

    test('Test create documents method.', () async {
      final texts = ['foo bar', 'baz'];
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 3,
        chunkOverlap: 0,
      );
      final docs = splitter.createDocuments(texts);
      const expectedDocs = [
        Document(pageContent: 'foo'),
        Document(pageContent: 'bar'),
        Document(pageContent: 'baz'),
      ];
      expect(docs, equals(expectedDocs));
    });

    test('Test create documents with metadata method.', () async {
      final texts = ['foo bar', 'baz'];
      const splitter = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 3,
        chunkOverlap: 0,
      );
      final docs = splitter.createDocuments(
        texts,
        metadatas: [
          {'source': '1'},
          {'source': '2'},
        ],
      );
      const expectedDocs = [
        Document(pageContent: 'foo', metadata: {'source': '1'}),
        Document(pageContent: 'bar', metadata: {'source': '1'}),
        Document(pageContent: 'baz', metadata: {'source': '2'}),
      ];
      expect(docs, equals(expectedDocs));
    });
  });
}
