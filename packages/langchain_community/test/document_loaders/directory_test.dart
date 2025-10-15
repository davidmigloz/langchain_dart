// ignore_for_file: unnecessary_async

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

        final Set<String> processedFiles = docs
            .map((doc) => doc.metadata['source'] as String)
            .toSet();

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

        final textDocs = docs
            .where((doc) => doc.metadata['name'] == 'example.txt')
            .toList();

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
          jsonDocs.any(
            (doc) => doc.pageContent.contains('Sayings of the Century'),
          ),
          isTrue,
          reason: 'JSON content should match for example_2.json',
        );
      },
    );

    test('Test directory loader with specific loader map', () {
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

    test('Test directory loader with custom metadata builder', () {
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
        throwsA(isA<FileSystemException>()),
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

    test('Sample size of 0 loads all files', () async {
      const filePath = './test/document_loaders/assets';

      const loader = DirectoryLoader(
        filePath,
        glob: '*.{txt,json}',
        sampleSize: 0,
      );

      final loadedDocs = await loader.load();

      final allFiles = Directory(filePath)
          .listSync()
          .where(
            (entity) =>
                entity is File &&
                RegExp(r'\.(txt|json)$').hasMatch(entity.path),
          )
          .length;

      expect(loadedDocs, hasLength(allFiles));
    });

    test('Sample size larger than total files loads all files', () async {
      const filePath = './test/document_loaders/assets';

      const loader = DirectoryLoader(
        filePath,
        glob: '*.{txt,json}',
        sampleSize: 1000,
      );

      final loadedDocs = await loader.load();

      final allFiles = Directory(filePath)
          .listSync()
          .where(
            (entity) =>
                entity is File &&
                RegExp(r'\.(txt|json)$').hasMatch(entity.path),
          )
          .length;

      expect(loadedDocs, hasLength(allFiles));
    });

    test('Reproducible random sampling', () async {
      const filePath = './test/document_loaders/assets';

      const loader1 = DirectoryLoader(
        filePath,
        glob: '*.{txt,json}',
        sampleSize: 2,
        randomizeSample: true,
        sampleSeed: 42,
      );

      const loader2 = DirectoryLoader(
        filePath,
        glob: '*.{txt,json}',
        sampleSize: 2,
        randomizeSample: true,
        sampleSeed: 42,
      );

      final docs1 = await loader1.load();

      final docs2 = await loader2.load();

      expect(
        docs1.map((doc) => doc.metadata['source']),
        equals(docs2.map((doc) => doc.metadata['source'])),
      );
    });

    test('Loader map with no matching loader uses fallback', () async {
      const filePath = './test/document_loaders/assets';

      const loader = DirectoryLoader(
        filePath,
        glob: '*.md',
        loaderMap: {'.xml': TextLoader.new},
      );

      final loadedDocs = await loader.load();

      expect(loadedDocs, isEmpty);
    });

    test('Mixed hidden and non-hidden files', () async {
      final tempDir = await Directory.systemTemp.createTemp('mixed_files_test');

      try {
        await File(
          '${tempDir.path}/.hidden.txt',
        ).writeAsString('hidden content');

        await File(
          '${tempDir.path}/visible.txt',
        ).writeAsString('visible content');

        final loader1 = DirectoryLoader(
          tempDir.path,
          glob: '*.txt',
          loadHidden: false,
        );

        final docs1 = await loader1.load();

        expect(
          docs1.any((doc) => doc.metadata['name'] == '.hidden.txt'),
          isFalse,
        );

        final loader2 = DirectoryLoader(
          tempDir.path,
          glob: '*.txt',
          loadHidden: true,
        );

        final docs2 = await loader2.load();

        expect(
          docs2.any((doc) => doc.metadata['name'] == '.hidden.txt'),
          isTrue,
        );
      } finally {
        await tempDir.delete(recursive: true);
      }
    });
  });
}
