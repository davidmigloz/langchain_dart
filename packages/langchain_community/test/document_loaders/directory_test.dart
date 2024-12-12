import 'dart:io';
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_core/documents.dart';
import 'package:test/test.dart';

void main() {
  group('DirectoryLoader tests', () {
    test(
        'Test loading directory with multiple file types and multiple documents per file',
        () async {
      const filePath = './test/document_loaders/assets';
      const loader = DirectoryLoader(filePath, glob: '*.{txt,json,csv,tsv}');

      final List<Document> docs = await loader.lazyLoad().toList();

      expect(docs, isNotEmpty);

      final Set<String> processedFiles =
          docs.map((doc) => doc.metadata['source'] as String).toSet();

      final directory = Directory(filePath);

      final Set<String> expectedFiles = directory
          .listSync()
          .where(
            (entity) {
              return entity is File &&
                  RegExp(r'\.(txt|json|csv|tsv)$').hasMatch(entity.path);
            },
          )
          .map((file) => file.path)
          .toSet();

      expect(
        processedFiles,
        equals(expectedFiles),
      );

      final textDocs =
          docs.where((doc) => doc.metadata['name'] == 'example.txt').toList();
      expect(
        textDocs.length,
        greaterThanOrEqualTo(1),
      );
      expect(
        textDocs.any((doc) => doc.pageContent.contains('Foo\nBar\nBaz\n')),
        isTrue,
        reason: 'Text content should match for example.txt',
      );

      final jsonDocs = docs
          .where((doc) => doc.metadata['name'] == 'example_2.json')
          .toList();
      expect(
        jsonDocs.length,
        greaterThanOrEqualTo(1),
      );
      expect(
        jsonDocs
            .any((doc) => doc.pageContent.contains('Sayings of the Century')),
        isTrue,
        reason: 'JSON content should match for example_2.json',
      );
    });

    test('Test directory loader with specific loader map', () async {
      const filePath = './test/document_loaders/assets';

      final loader = DirectoryLoader(
        filePath,
        glob: '*.json',
        loaderMap: {
          '.json': (path) => JsonLoader(path, jpSchema: r'$..text'),
        },
      );

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          (final Document doc) => doc.pageContent == 'Foo\nBar\nBaz\n',
          emitsDone,
        ]),
      );
    });

    test('Test directory loader with sample size', () async {
      const filePath = './test/document_loaders/assets';

      const loader = DirectoryLoader(
        filePath,
        glob: '*.{txt,json,csv}',
        sampleSize: 2,
        randomizeSample: true,
        sampleSeed: 42,
      );

      final loadedDocs = await loader.load();
      expect(loadedDocs, hasLength(2));
    });

    test('Test directory loader with custom metadata builder', () async {
      const filePath = './test/document_loaders/assets';

      final loader = DirectoryLoader(
        filePath,
        glob: '*.txt',
        metadataBuilder: (file, defaultMetadata) {
          return {
            ...defaultMetadata,
            'custom_info': 'custom_value',
          };
        },
      );

      expect(
        loader.lazyLoad(),
        emitsInOrder([
          (final Document doc) {
            expect(doc.pageContent, 'Foo\nBar\nBaz\n');
            expect(doc.metadata['custom_info'], 'custom_value');
            return true;
          },
          emitsDone,
        ]),
      );
    });

    test('Test directory loader with non-existent directory', () {
      const filePath = './non_existent_directory';
      const loader = DirectoryLoader(filePath);

      expect(
        () async => loader.lazyLoad().toList(),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('Test directory loader with empty directory', () async {
      final tempDir = await Directory.systemTemp.createTemp('empty_test_dir');

      try {
        final loader = DirectoryLoader(
          tempDir.path,
          glob: '*.txt',
        );

        final loadedDocs = await loader.load();
        expect(loadedDocs, isEmpty);
      } finally {
        await tempDir.delete();
      }
    });

    test('Test directory loader with exclude patterns', () async {
      const filePath = './test/document_loaders/assets';

      const loader = DirectoryLoader(
        filePath,
        glob: '*.txt',
        exclude: ['example.txt'],
      );

      final loadedDocs = await loader.load();
      expect(
        loadedDocs.any((doc) => doc.metadata['name'] == 'example.txt'),
        isFalse,
      );
    });

    test('Test directory loader non-recursive mode', () async {
      const filePath = './test/document_loaders/assets';

      const loader = DirectoryLoader(filePath, glob: '*.txt', recursive: false);

      final loadedDocs = await loader.load();
      expect(loadedDocs, isNotEmpty);
    });
  });
}
