import 'package:googleai_dart/src/models/corpus/corpus.dart';
import 'package:test/test.dart';

void main() {
  group('Corpus', () {
    group('fromJson', () {
      test('creates Corpus with all fields', () {
        final json = {
          'name': 'corpora/my-corpus-123',
          'displayName': 'My Test Corpus',
          'createTime': '2024-01-15T10:30:00Z',
          'updateTime': '2024-01-16T14:45:00Z',
        };

        final corpus = Corpus.fromJson(json);

        expect(corpus.name, 'corpora/my-corpus-123');
        expect(corpus.displayName, 'My Test Corpus');
        expect(corpus.createTime, DateTime.parse('2024-01-15T10:30:00Z'));
        expect(corpus.updateTime, DateTime.parse('2024-01-16T14:45:00Z'));
      });

      test('creates Corpus with minimal fields', () {
        final json = <String, dynamic>{};

        final corpus = Corpus.fromJson(json);

        expect(corpus.name, isNull);
        expect(corpus.displayName, isNull);
        expect(corpus.createTime, isNull);
        expect(corpus.updateTime, isNull);
      });

      test('creates Corpus with null fields', () {
        final json = {
          'name': null,
          'displayName': null,
          'createTime': null,
          'updateTime': null,
        };

        final corpus = Corpus.fromJson(json);

        expect(corpus.name, isNull);
        expect(corpus.displayName, isNull);
        expect(corpus.createTime, isNull);
        expect(corpus.updateTime, isNull);
      });

      test('parses DateTime from ISO 8601 string', () {
        final json = {
          'createTime': '2024-01-15T10:30:00.123Z',
          'updateTime': '2024-01-16T14:45:30.456Z',
        };

        final corpus = Corpus.fromJson(json);

        expect(corpus.createTime, DateTime.parse('2024-01-15T10:30:00.123Z'));
        expect(corpus.updateTime, DateTime.parse('2024-01-16T14:45:30.456Z'));
      });
    });

    group('toJson', () {
      test('converts Corpus with all fields to JSON', () {
        final corpus = Corpus(
          name: 'corpora/my-corpus-456',
          displayName: 'Another Corpus',
          createTime: DateTime.parse('2024-02-20T08:15:00Z'),
          updateTime: DateTime.parse('2024-02-21T16:30:00Z'),
        );

        final json = corpus.toJson();

        expect(json['name'], 'corpora/my-corpus-456');
        expect(json['displayName'], 'Another Corpus');
        expect(json['createTime'], '2024-02-20T08:15:00.000Z');
        expect(json['updateTime'], '2024-02-21T16:30:00.000Z');
      });

      test('converts Corpus with minimal fields to JSON', () {
        const corpus = Corpus();

        final json = corpus.toJson();

        expect(json.containsKey('name'), false);
        expect(json.containsKey('displayName'), false);
        expect(json.containsKey('createTime'), false);
        expect(json.containsKey('updateTime'), false);
      });

      test('omits null fields from JSON', () {
        const corpus = Corpus(name: 'corpora/test-123', displayName: null);

        final json = corpus.toJson();

        expect(json['name'], 'corpora/test-123');
        expect(json.containsKey('displayName'), false);
        expect(json.containsKey('createTime'), false);
        expect(json.containsKey('updateTime'), false);
      });

      test('formats DateTime as ISO 8601 string', () {
        final corpus = Corpus(
          createTime: DateTime.parse('2024-03-10T12:00:00.123Z'),
          updateTime: DateTime.parse('2024-03-11T18:45:30.456Z'),
        );

        final json = corpus.toJson();

        expect(json['createTime'], '2024-03-10T12:00:00.123Z');
        expect(json['updateTime'], '2024-03-11T18:45:30.456Z');
      });
    });

    test('round-trip conversion preserves data', () {
      final original = Corpus(
        name: 'corpora/roundtrip-789',
        displayName: 'Roundtrip Test',
        createTime: DateTime.parse('2024-04-05T10:20:30Z'),
        updateTime: DateTime.parse('2024-04-06T11:21:31Z'),
      );

      final json = original.toJson();
      final restored = Corpus.fromJson(json);

      expect(restored.name, original.name);
      expect(restored.displayName, original.displayName);
      expect(restored.createTime, original.createTime);
      expect(restored.updateTime, original.updateTime);
    });

    group('toString', () {
      test('includes all fields', () {
        final corpus = Corpus(
          name: 'corpora/test-456',
          displayName: 'Test Display',
          createTime: DateTime.parse('2024-05-01T08:00:00Z'),
          updateTime: DateTime.parse('2024-05-02T09:00:00Z'),
        );

        final str = corpus.toString();

        expect(str, contains('Corpus('));
        expect(str, contains('name: corpora/test-456'));
        expect(str, contains('displayName: Test Display'));
        expect(str, contains('createTime:'));
        expect(str, contains('updateTime:'));
      });

      test('includes null fields', () {
        const corpus = Corpus();

        final str = corpus.toString();

        expect(str, contains('name: null'));
        expect(str, contains('displayName: null'));
        expect(str, contains('createTime: null'));
        expect(str, contains('updateTime: null'));
      });
    });
  });
}
