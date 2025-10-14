// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/src/models/corpus/condition.dart';
import 'package:googleai_dart/src/models/corpus/metadata_filter.dart';
import 'package:googleai_dart/src/models/corpus/query_corpus_request.dart';
import 'package:test/test.dart';

void main() {
  group('QueryCorpusRequest', () {
    group('fromJson', () {
      test('creates QueryCorpusRequest with only query', () {
        final json = {
          'query': 'What is semantic search?',
        };

        final request = QueryCorpusRequest.fromJson(json);

        expect(request.query, 'What is semantic search?');
        expect(request.metadataFilters, isNull);
        expect(request.resultsCount, isNull);
      });

      test('creates QueryCorpusRequest with all fields', () {
        final json = {
          'query': 'machine learning tutorials',
          'metadataFilters': [
            {
              'key': 'document.custom_metadata.category',
              'conditions': [
                {'operation': 'EQUAL', 'stringValue': 'education'},
              ],
            },
            {
              'key': 'chunk.custom_metadata.year',
              'conditions': [
                {'operation': 'GREATER_EQUAL', 'numericValue': 2020.0},
              ],
            },
          ],
          'resultsCount': 25,
        };

        final request = QueryCorpusRequest.fromJson(json);

        expect(request.query, 'machine learning tutorials');
        expect(request.metadataFilters, hasLength(2));
        expect(
          request.metadataFilters![0].key,
          'document.custom_metadata.category',
        );
        expect(request.metadataFilters![0].conditions, hasLength(1));
        expect(
          request.metadataFilters![0].conditions[0].operation,
          ConditionOperator.equal,
        );
        expect(
          request.metadataFilters![0].conditions[0].stringValue,
          'education',
        );
        expect(request.metadataFilters![1].key, 'chunk.custom_metadata.year');
        expect(
          request.metadataFilters![1].conditions[0].operation,
          ConditionOperator.greaterEqual,
        );
        expect(request.metadataFilters![1].conditions[0].numericValue, 2020.0);
        expect(request.resultsCount, 25);
      });

      test('creates QueryCorpusRequest with empty metadataFilters', () {
        final json = {
          'query': 'test query',
          'metadataFilters': <dynamic>[],
        };

        final request = QueryCorpusRequest.fromJson(json);

        expect(request.query, 'test query');
        expect(request.metadataFilters, isEmpty);
      });

      test('handles null optional fields', () {
        final json = {
          'query': 'simple query',
          'metadataFilters': null,
          'resultsCount': null,
        };

        final request = QueryCorpusRequest.fromJson(json);

        expect(request.query, 'simple query');
        expect(request.metadataFilters, isNull);
        expect(request.resultsCount, isNull);
      });
    });

    group('toJson', () {
      test('converts QueryCorpusRequest with only query to JSON', () {
        const request = QueryCorpusRequest(
          query: 'What is Dart?',
        );

        final json = request.toJson();

        expect(json['query'], 'What is Dart?');
        expect(json.containsKey('metadataFilters'), false);
        expect(json.containsKey('resultsCount'), false);
      });

      test('converts QueryCorpusRequest with all fields to JSON', () {
        const request = QueryCorpusRequest(
          query: 'flutter development',
          metadataFilters: [
            MetadataFilter(
              key: 'document.custom_metadata.language',
              conditions: [
                Condition(
                  operation: ConditionOperator.equal,
                  stringValue: 'en',
                ),
              ],
            ),
            MetadataFilter(
              key: 'chunk.custom_metadata.rating',
              conditions: [
                Condition(
                  operation: ConditionOperator.greater,
                  numericValue: 4.0,
                ),
              ],
            ),
          ],
          resultsCount: 50,
        );

        final json = request.toJson();

        expect(json['query'], 'flutter development');
        expect(json['metadataFilters'], hasLength(2));
        expect(
          json['metadataFilters'][0]['key'],
          'document.custom_metadata.language',
        );
        expect(
          json['metadataFilters'][0]['conditions'][0]['operation'],
          'EQUAL',
        );
        expect(
          json['metadataFilters'][0]['conditions'][0]['stringValue'],
          'en',
        );
        expect(
          json['metadataFilters'][1]['key'],
          'chunk.custom_metadata.rating',
        );
        expect(
          json['metadataFilters'][1]['conditions'][0]['operation'],
          'GREATER',
        );
        expect(
          json['metadataFilters'][1]['conditions'][0]['numericValue'],
          4.0,
        );
        expect(json['resultsCount'], 50);
      });

      test('omits null fields from JSON', () {
        const request = QueryCorpusRequest(
          query: 'minimal query',
        );

        final json = request.toJson();

        expect(json['query'], 'minimal query');
        expect(json.containsKey('metadataFilters'), false);
        expect(json.containsKey('resultsCount'), false);
      });

      test('includes empty metadataFilters in JSON', () {
        const request = QueryCorpusRequest(
          query: 'test',
          metadataFilters: [],
        );

        final json = request.toJson();

        expect(json['metadataFilters'], isEmpty);
      });
    });

    test('round-trip conversion with minimal fields preserves data', () {
      const original = QueryCorpusRequest(
        query: 'test query',
      );

      final json = original.toJson();
      final restored = QueryCorpusRequest.fromJson(json);

      expect(restored.query, original.query);
      expect(restored.metadataFilters, original.metadataFilters);
      expect(restored.resultsCount, original.resultsCount);
    });

    test('round-trip conversion with all fields preserves data', () {
      const original = QueryCorpusRequest(
        query: 'comprehensive search',
        metadataFilters: [
          MetadataFilter(
            key: 'document.custom_metadata.type',
            conditions: [
              Condition(
                operation: ConditionOperator.equal,
                stringValue: 'article',
              ),
              Condition(
                operation: ConditionOperator.notEqual,
                stringValue: 'draft',
              ),
            ],
          ),
          MetadataFilter(
            key: 'chunk.custom_metadata.priority',
            conditions: [
              Condition(
                operation: ConditionOperator.greaterEqual,
                numericValue: 5.0,
              ),
            ],
          ),
        ],
        resultsCount: 100,
      );

      final json = original.toJson();
      final restored = QueryCorpusRequest.fromJson(json);

      expect(restored.query, original.query);
      expect(restored.metadataFilters, hasLength(2));
      expect(
        restored.metadataFilters![0].key,
        original.metadataFilters![0].key,
      );
      expect(
        restored.metadataFilters![0].conditions,
        hasLength(original.metadataFilters![0].conditions.length),
      );
      expect(
        restored.metadataFilters![1].key,
        original.metadataFilters![1].key,
      );
      expect(restored.resultsCount, original.resultsCount);
    });

    group('toString', () {
      test('includes all fields', () {
        const request = QueryCorpusRequest(
          query: 'AI research',
          metadataFilters: [
            MetadataFilter(
              key: 'test.key',
              conditions: [
                Condition(
                  operation: ConditionOperator.equal,
                  stringValue: 'val',
                ),
              ],
            ),
          ],
          resultsCount: 20,
        );

        final str = request.toString();

        expect(str, contains('QueryCorpusRequest('));
        expect(str, contains('query: AI research'));
        expect(str, contains('metadataFilters:'));
        expect(str, contains('resultsCount: 20'));
      });

      test('includes null fields', () {
        const request = QueryCorpusRequest(query: 'simple');

        final str = request.toString();

        expect(str, contains('query: simple'));
        expect(str, contains('metadataFilters: null'));
        expect(str, contains('resultsCount: null'));
      });
    });
  });
}
