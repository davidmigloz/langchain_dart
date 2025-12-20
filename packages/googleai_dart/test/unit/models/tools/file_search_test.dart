import 'package:googleai_dart/src/models/tools/file_search.dart';
import 'package:test/test.dart';

void main() {
  group('FileSearch', () {
    group('fromJson', () {
      test('creates FileSearch with all fields', () {
        final json = {
          'fileSearchStoreNames': [
            'fileSearchStores/store-1',
            'fileSearchStores/store-2',
          ],
          'topK': 10,
          'metadataFilter': 'category = "docs"',
        };

        final fileSearch = FileSearch.fromJson(json);

        expect(fileSearch.fileSearchStoreNames, [
          'fileSearchStores/store-1',
          'fileSearchStores/store-2',
        ]);
        expect(fileSearch.topK, 10);
        expect(fileSearch.metadataFilter, 'category = "docs"');
      });

      test('creates FileSearch with only required fields', () {
        final json = {
          'fileSearchStoreNames': ['fileSearchStores/my-store'],
        };

        final fileSearch = FileSearch.fromJson(json);

        expect(fileSearch.fileSearchStoreNames, ['fileSearchStores/my-store']);
        expect(fileSearch.topK, isNull);
        expect(fileSearch.metadataFilter, isNull);
      });
    });

    group('toJson', () {
      test('converts FileSearch with all fields to JSON', () {
        const fileSearch = FileSearch(
          fileSearchStoreNames: ['fileSearchStores/test-store'],
          topK: 5,
          metadataFilter: 'type = "pdf"',
        );

        final json = fileSearch.toJson();

        expect(json['fileSearchStoreNames'], ['fileSearchStores/test-store']);
        expect(json['topK'], 5);
        expect(json['metadataFilter'], 'type = "pdf"');
      });

      test('omits null fields from JSON', () {
        const fileSearch = FileSearch(
          fileSearchStoreNames: ['fileSearchStores/store'],
        );

        final json = fileSearch.toJson();

        expect(json['fileSearchStoreNames'], ['fileSearchStores/store']);
        expect(json.containsKey('topK'), false);
        expect(json.containsKey('metadataFilter'), false);
      });
    });

    test('round-trip conversion preserves data', () {
      const original = FileSearch(
        fileSearchStoreNames: ['fileSearchStores/roundtrip'],
        topK: 15,
        metadataFilter: 'status = "active"',
      );

      final json = original.toJson();
      final restored = FileSearch.fromJson(json);

      expect(restored.fileSearchStoreNames, original.fileSearchStoreNames);
      expect(restored.topK, original.topK);
      expect(restored.metadataFilter, original.metadataFilter);
    });

    group('copyWith', () {
      test('creates copy with replaced values', () {
        const original = FileSearch(
          fileSearchStoreNames: ['fileSearchStores/original'],
          topK: 5,
        );

        final copy = original.copyWith(topK: 10);

        expect(copy.fileSearchStoreNames, ['fileSearchStores/original']);
        expect(copy.topK, 10);
      });

      test('can set optional values to null', () {
        const original = FileSearch(
          fileSearchStoreNames: ['fileSearchStores/test'],
          topK: 5,
          metadataFilter: 'filter',
        );

        final copy = original.copyWith(metadataFilter: null);

        expect(copy.fileSearchStoreNames, ['fileSearchStores/test']);
        expect(copy.topK, 5);
        expect(copy.metadataFilter, isNull);
      });
    });

    test('toString includes all fields', () {
      const fileSearch = FileSearch(
        fileSearchStoreNames: ['fileSearchStores/store-1'],
        topK: 10,
      );

      final str = fileSearch.toString();

      expect(str, contains('FileSearch('));
      expect(str, contains('fileSearchStoreNames:'));
      expect(str, contains('topK: 10'));
    });
  });
}
