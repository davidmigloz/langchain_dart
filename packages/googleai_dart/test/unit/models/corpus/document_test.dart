import 'package:googleai_dart/src/models/corpus/document.dart';
import 'package:test/test.dart';

void main() {
  group('Document', () {
    group('fromJson', () {
      test('creates Document with all fields', () {
        final json = {
          'name': 'corpora/corpus-123/documents/doc-456',
          'displayName': 'My Test Document',
          'createTime': '2024-01-15T10:30:00Z',
          'updateTime': '2024-01-16T14:45:00Z',
        };

        final document = Document.fromJson(json);

        expect(document.name, 'corpora/corpus-123/documents/doc-456');
        expect(document.displayName, 'My Test Document');
        expect(document.createTime, DateTime.parse('2024-01-15T10:30:00Z'));
        expect(document.updateTime, DateTime.parse('2024-01-16T14:45:00Z'));
      });

      test('creates Document with minimal fields', () {
        final json = <String, dynamic>{};

        final document = Document.fromJson(json);

        expect(document.name, isNull);
        expect(document.displayName, isNull);
        expect(document.createTime, isNull);
        expect(document.updateTime, isNull);
      });

      test('creates Document with null fields', () {
        final json = {
          'name': null,
          'displayName': null,
          'createTime': null,
          'updateTime': null,
        };

        final document = Document.fromJson(json);

        expect(document.name, isNull);
        expect(document.displayName, isNull);
        expect(document.createTime, isNull);
        expect(document.updateTime, isNull);
      });

      test('parses DateTime from ISO 8601 string', () {
        final json = {
          'createTime': '2024-01-15T10:30:00.123Z',
          'updateTime': '2024-01-16T14:45:30.456Z',
        };

        final document = Document.fromJson(json);

        expect(document.createTime, DateTime.parse('2024-01-15T10:30:00.123Z'));
        expect(document.updateTime, DateTime.parse('2024-01-16T14:45:30.456Z'));
      });
    });

    group('toJson', () {
      test('converts Document with all fields to JSON', () {
        final document = Document(
          name: 'corpora/corpus-789/documents/doc-012',
          displayName: 'Another Document',
          createTime: DateTime.parse('2024-02-20T08:15:00Z'),
          updateTime: DateTime.parse('2024-02-21T16:30:00Z'),
        );

        final json = document.toJson();

        expect(json['name'], 'corpora/corpus-789/documents/doc-012');
        expect(json['displayName'], 'Another Document');
        expect(json['createTime'], '2024-02-20T08:15:00.000Z');
        expect(json['updateTime'], '2024-02-21T16:30:00.000Z');
      });

      test('converts Document with minimal fields to JSON', () {
        const document = Document();

        final json = document.toJson();

        expect(json.containsKey('name'), false);
        expect(json.containsKey('displayName'), false);
        expect(json.containsKey('createTime'), false);
        expect(json.containsKey('updateTime'), false);
      });

      test('omits null fields from JSON', () {
        const document = Document(
          name: 'corpora/corpus-123/documents/doc-456',
          displayName: null,
        );

        final json = document.toJson();

        expect(json['name'], 'corpora/corpus-123/documents/doc-456');
        expect(json.containsKey('displayName'), false);
        expect(json.containsKey('createTime'), false);
        expect(json.containsKey('updateTime'), false);
      });

      test('formats DateTime as ISO 8601 string', () {
        final document = Document(
          createTime: DateTime.parse('2024-03-10T12:00:00.123Z'),
          updateTime: DateTime.parse('2024-03-11T18:45:30.456Z'),
        );

        final json = document.toJson();

        expect(json['createTime'], '2024-03-10T12:00:00.123Z');
        expect(json['updateTime'], '2024-03-11T18:45:30.456Z');
      });
    });

    test('round-trip conversion preserves data', () {
      final original = Document(
        name: 'corpora/corpus-abc/documents/doc-xyz',
        displayName: 'Roundtrip Test',
        createTime: DateTime.parse('2024-04-05T10:20:30Z'),
        updateTime: DateTime.parse('2024-04-06T11:21:31Z'),
      );

      final json = original.toJson();
      final restored = Document.fromJson(json);

      expect(restored.name, original.name);
      expect(restored.displayName, original.displayName);
      expect(restored.createTime, original.createTime);
      expect(restored.updateTime, original.updateTime);
    });

    group('toString', () {
      test('includes all fields', () {
        final document = Document(
          name: 'corpora/corpus-123/documents/doc-456',
          displayName: 'Test Display',
          createTime: DateTime.parse('2024-05-01T08:00:00Z'),
          updateTime: DateTime.parse('2024-05-02T09:00:00Z'),
        );

        final str = document.toString();

        expect(str, contains('Document('));
        expect(str, contains('name: corpora/corpus-123/documents/doc-456'));
        expect(str, contains('displayName: Test Display'));
        expect(str, contains('createTime:'));
        expect(str, contains('updateTime:'));
      });

      test('includes null fields', () {
        const document = Document();

        final str = document.toString();

        expect(str, contains('name: null'));
        expect(str, contains('displayName: null'));
        expect(str, contains('createTime: null'));
        expect(str, contains('updateTime: null'));
      });
    });
  });
}
