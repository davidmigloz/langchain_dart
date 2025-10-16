// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/src/models/corpus/corpus.dart';
import 'package:googleai_dart/src/models/corpus/list_corpora_response.dart';
import 'package:test/test.dart';

void main() {
  group('ListCorporaResponse', () {
    group('fromJson', () {
      test('creates ListCorporaResponse with corpora and nextPageToken', () {
        final json = {
          'corpora': [
            {
              'name': 'corpora/corpus-1',
              'displayName': 'First Corpus',
              'createTime': '2024-01-10T08:00:00Z',
            },
            {
              'name': 'corpora/corpus-2',
              'displayName': 'Second Corpus',
              'createTime': '2024-01-11T09:00:00Z',
            },
          ],
          'nextPageToken': 'token-abc123',
        };

        final response = ListCorporaResponse.fromJson(json);

        expect(response.corpora, hasLength(2));
        expect(response.corpora![0].name, 'corpora/corpus-1');
        expect(response.corpora![0].displayName, 'First Corpus');
        expect(response.corpora![1].name, 'corpora/corpus-2');
        expect(response.corpora![1].displayName, 'Second Corpus');
        expect(response.nextPageToken, 'token-abc123');
      });

      test('creates ListCorporaResponse with empty corpora list', () {
        final json = {'corpora': <dynamic>[]};

        final response = ListCorporaResponse.fromJson(json);

        expect(response.corpora, isEmpty);
        expect(response.nextPageToken, isNull);
      });

      test('creates ListCorporaResponse with minimal fields', () {
        final json = <String, dynamic>{};

        final response = ListCorporaResponse.fromJson(json);

        expect(response.corpora, isNull);
        expect(response.nextPageToken, isNull);
      });

      test('creates ListCorporaResponse with null fields', () {
        final json = {'corpora': null, 'nextPageToken': null};

        final response = ListCorporaResponse.fromJson(json);

        expect(response.corpora, isNull);
        expect(response.nextPageToken, isNull);
      });

      test('creates ListCorporaResponse without nextPageToken', () {
        final json = {
          'corpora': [
            {'name': 'corpora/corpus-1'},
          ],
        };

        final response = ListCorporaResponse.fromJson(json);

        expect(response.corpora, hasLength(1));
        expect(response.nextPageToken, isNull);
      });

      test('creates ListCorporaResponse with only nextPageToken', () {
        final json = {'nextPageToken': 'token-xyz789'};

        final response = ListCorporaResponse.fromJson(json);

        expect(response.corpora, isNull);
        expect(response.nextPageToken, 'token-xyz789');
      });
    });

    group('toJson', () {
      test('converts ListCorporaResponse with all fields to JSON', () {
        final response = ListCorporaResponse(
          corpora: [
            Corpus(
              name: 'corpora/corpus-a',
              displayName: 'Corpus A',
              createTime: DateTime.parse('2024-02-01T10:00:00Z'),
            ),
            Corpus(
              name: 'corpora/corpus-b',
              displayName: 'Corpus B',
              createTime: DateTime.parse('2024-02-02T11:00:00Z'),
            ),
          ],
          nextPageToken: 'token-def456',
        );

        final json = response.toJson();

        expect(json['corpora'], hasLength(2));
        expect(json['corpora'][0]['name'], 'corpora/corpus-a');
        expect(json['corpora'][0]['displayName'], 'Corpus A');
        expect(json['corpora'][0]['createTime'], '2024-02-01T10:00:00.000Z');
        expect(json['corpora'][1]['name'], 'corpora/corpus-b');
        expect(json['corpora'][1]['displayName'], 'Corpus B');
        expect(json['corpora'][1]['createTime'], '2024-02-02T11:00:00.000Z');
        expect(json['nextPageToken'], 'token-def456');
      });

      test('converts ListCorporaResponse with empty corpora to JSON', () {
        const response = ListCorporaResponse(corpora: []);

        final json = response.toJson();

        expect(json['corpora'], isEmpty);
        expect(json.containsKey('nextPageToken'), false);
      });

      test('converts ListCorporaResponse with minimal fields to JSON', () {
        const response = ListCorporaResponse();

        final json = response.toJson();

        expect(json.containsKey('corpora'), false);
        expect(json.containsKey('nextPageToken'), false);
      });

      test('omits null fields from JSON', () {
        const response = ListCorporaResponse(nextPageToken: 'token-only');

        final json = response.toJson();

        expect(json.containsKey('corpora'), false);
        expect(json['nextPageToken'], 'token-only');
      });
    });

    test('round-trip conversion with all fields preserves data', () {
      final original = ListCorporaResponse(
        corpora: [
          Corpus(
            name: 'corpora/corpus-x',
            displayName: 'Corpus X',
            createTime: DateTime.parse('2024-03-15T14:30:00Z'),
            updateTime: DateTime.parse('2024-03-16T15:30:00Z'),
          ),
          Corpus(
            name: 'corpora/corpus-y',
            displayName: 'Corpus Y',
            createTime: DateTime.parse('2024-03-17T16:30:00Z'),
          ),
        ],
        nextPageToken: 'token-roundtrip',
      );

      final json = original.toJson();
      final restored = ListCorporaResponse.fromJson(json);

      expect(restored.corpora, hasLength(2));
      expect(restored.corpora![0].name, original.corpora![0].name);
      expect(
        restored.corpora![0].displayName,
        original.corpora![0].displayName,
      );
      expect(restored.corpora![0].createTime, original.corpora![0].createTime);
      expect(restored.corpora![0].updateTime, original.corpora![0].updateTime);
      expect(restored.corpora![1].name, original.corpora![1].name);
      expect(
        restored.corpora![1].displayName,
        original.corpora![1].displayName,
      );
      expect(restored.nextPageToken, original.nextPageToken);
    });

    test('round-trip conversion with minimal fields preserves data', () {
      const original = ListCorporaResponse();

      final json = original.toJson();
      final restored = ListCorporaResponse.fromJson(json);

      expect(restored.corpora, original.corpora);
      expect(restored.nextPageToken, original.nextPageToken);
    });

    group('toString', () {
      test('includes all fields', () {
        const response = ListCorporaResponse(
          corpora: [
            Corpus(name: 'corpora/test-1'),
            Corpus(name: 'corpora/test-2'),
          ],
          nextPageToken: 'token-test',
        );

        final str = response.toString();

        expect(str, contains('ListCorporaResponse('));
        expect(str, contains('corpora:'));
        expect(str, contains('nextPageToken: token-test'));
      });

      test('includes null fields', () {
        const response = ListCorporaResponse();

        final str = response.toString();

        expect(str, contains('corpora: null'));
        expect(str, contains('nextPageToken: null'));
      });

      test('shows empty list', () {
        const response = ListCorporaResponse(corpora: []);

        final str = response.toString();

        expect(str, contains('corpora: []'));
      });
    });
  });
}
