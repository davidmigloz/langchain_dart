import 'package:googleai_dart/src/models/files/file_search_store.dart';
import 'package:test/test.dart';

void main() {
  group('FileSearchStore', () {
    group('fromJson', () {
      test('creates FileSearchStore with all fields', () {
        final json = {
          'name': 'fileSearchStores/my-store-123',
          'displayName': 'My Test Store',
          'createTime': '2024-01-15T10:30:00Z',
          'updateTime': '2024-01-16T14:45:00Z',
          'activeDocumentsCount': '10',
          'pendingDocumentsCount': '2',
          'failedDocumentsCount': '1',
          'sizeBytes': '1048576',
        };

        final store = FileSearchStore.fromJson(json);

        expect(store.name, 'fileSearchStores/my-store-123');
        expect(store.displayName, 'My Test Store');
        expect(store.createTime, DateTime.parse('2024-01-15T10:30:00Z'));
        expect(store.updateTime, DateTime.parse('2024-01-16T14:45:00Z'));
        expect(store.activeDocumentsCount, '10');
        expect(store.pendingDocumentsCount, '2');
        expect(store.failedDocumentsCount, '1');
        expect(store.sizeBytes, '1048576');
      });

      test('creates FileSearchStore with minimal fields', () {
        final json = <String, dynamic>{};

        final store = FileSearchStore.fromJson(json);

        expect(store.name, isNull);
        expect(store.displayName, isNull);
        expect(store.createTime, isNull);
        expect(store.updateTime, isNull);
        expect(store.activeDocumentsCount, isNull);
        expect(store.pendingDocumentsCount, isNull);
        expect(store.failedDocumentsCount, isNull);
        expect(store.sizeBytes, isNull);
      });
    });

    group('toJson', () {
      test('converts FileSearchStore with all fields to JSON', () {
        final store = FileSearchStore(
          name: 'fileSearchStores/my-store-456',
          displayName: 'Another Store',
          createTime: DateTime.parse('2024-02-20T08:15:00Z'),
          updateTime: DateTime.parse('2024-02-21T16:30:00Z'),
          activeDocumentsCount: '20',
          pendingDocumentsCount: '3',
          failedDocumentsCount: '0',
          sizeBytes: '2097152',
        );

        final json = store.toJson();

        expect(json['name'], 'fileSearchStores/my-store-456');
        expect(json['displayName'], 'Another Store');
        expect(json['createTime'], '2024-02-20T08:15:00.000Z');
        expect(json['updateTime'], '2024-02-21T16:30:00.000Z');
        expect(json['activeDocumentsCount'], '20');
        expect(json['pendingDocumentsCount'], '3');
        expect(json['failedDocumentsCount'], '0');
        expect(json['sizeBytes'], '2097152');
      });

      test('omits null fields from JSON', () {
        const store = FileSearchStore(name: 'fileSearchStores/test-123');

        final json = store.toJson();

        expect(json['name'], 'fileSearchStores/test-123');
        expect(json.containsKey('displayName'), false);
        expect(json.containsKey('activeDocumentsCount'), false);
      });
    });

    test('round-trip conversion preserves data', () {
      final original = FileSearchStore(
        name: 'fileSearchStores/roundtrip-789',
        displayName: 'Roundtrip Test',
        createTime: DateTime.parse('2024-04-05T10:20:30Z'),
        updateTime: DateTime.parse('2024-04-06T11:21:31Z'),
        activeDocumentsCount: '5',
        pendingDocumentsCount: '1',
        failedDocumentsCount: '0',
        sizeBytes: '512000',
      );

      final json = original.toJson();
      final restored = FileSearchStore.fromJson(json);

      expect(restored.name, original.name);
      expect(restored.displayName, original.displayName);
      expect(restored.createTime, original.createTime);
      expect(restored.updateTime, original.updateTime);
      expect(restored.activeDocumentsCount, original.activeDocumentsCount);
      expect(restored.pendingDocumentsCount, original.pendingDocumentsCount);
      expect(restored.failedDocumentsCount, original.failedDocumentsCount);
      expect(restored.sizeBytes, original.sizeBytes);
    });

    group('copyWith', () {
      test('creates copy with replaced values', () {
        const original = FileSearchStore(
          name: 'fileSearchStores/original',
          displayName: 'Original',
          activeDocumentsCount: '5',
        );

        final copy = original.copyWith(
          displayName: 'Updated',
          activeDocumentsCount: '10',
        );

        expect(copy.name, 'fileSearchStores/original');
        expect(copy.displayName, 'Updated');
        expect(copy.activeDocumentsCount, '10');
      });

      test('can set values to null', () {
        const original = FileSearchStore(
          name: 'fileSearchStores/test',
          displayName: 'Test',
        );

        final copy = original.copyWith(displayName: null);

        expect(copy.name, 'fileSearchStores/test');
        expect(copy.displayName, isNull);
      });
    });

    test('toString includes all fields', () {
      const store = FileSearchStore(
        name: 'fileSearchStores/test-456',
        displayName: 'Test Display',
      );

      final str = store.toString();

      expect(str, contains('FileSearchStore('));
      expect(str, contains('name: fileSearchStores/test-456'));
      expect(str, contains('displayName: Test Display'));
    });
  });
}
