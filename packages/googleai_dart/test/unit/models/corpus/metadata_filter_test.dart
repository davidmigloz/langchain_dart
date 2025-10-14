// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/src/models/corpus/condition.dart';
import 'package:googleai_dart/src/models/corpus/metadata_filter.dart';
import 'package:test/test.dart';

void main() {
  group('MetadataFilter', () {
    group('fromJson', () {
      test('creates MetadataFilter with single condition', () {
        final json = {
          'key': 'document.custom_metadata.genre',
          'conditions': [
            {'operation': 'EQUAL', 'stringValue': 'drama'},
          ],
        };

        final filter = MetadataFilter.fromJson(json);

        expect(filter.key, 'document.custom_metadata.genre');
        expect(filter.conditions, hasLength(1));
        expect(filter.conditions[0].operation, ConditionOperator.equal);
        expect(filter.conditions[0].stringValue, 'drama');
      });

      test('creates MetadataFilter with multiple conditions', () {
        final json = {
          'key': 'chunk.custom_metadata.year',
          'conditions': [
            {'operation': 'GREATER_EQUAL', 'numericValue': 2020.0},
            {'operation': 'LESS_EQUAL', 'numericValue': 2024.0},
          ],
        };

        final filter = MetadataFilter.fromJson(json);

        expect(filter.key, 'chunk.custom_metadata.year');
        expect(filter.conditions, hasLength(2));
        expect(filter.conditions[0].operation, ConditionOperator.greaterEqual);
        expect(filter.conditions[0].numericValue, 2020.0);
        expect(filter.conditions[1].operation, ConditionOperator.lessEqual);
        expect(filter.conditions[1].numericValue, 2024.0);
      });

      test('creates MetadataFilter with mixed condition types', () {
        final json = {
          'key': 'document.custom_metadata.tags',
          'conditions': [
            {'operation': 'INCLUDES', 'stringValue': 'ai'},
            {'operation': 'INCLUDES', 'stringValue': 'ml'},
            {'operation': 'EXCLUDES', 'stringValue': 'deprecated'},
          ],
        };

        final filter = MetadataFilter.fromJson(json);

        expect(filter.key, 'document.custom_metadata.tags');
        expect(filter.conditions, hasLength(3));
        expect(filter.conditions[0].operation, ConditionOperator.includes);
        expect(filter.conditions[0].stringValue, 'ai');
        expect(filter.conditions[1].operation, ConditionOperator.includes);
        expect(filter.conditions[1].stringValue, 'ml');
        expect(filter.conditions[2].operation, ConditionOperator.excludes);
        expect(filter.conditions[2].stringValue, 'deprecated');
      });
    });

    group('toJson', () {
      test('converts MetadataFilter with single condition to JSON', () {
        const filter = MetadataFilter(
          key: 'document.custom_metadata.author',
          conditions: [
            Condition(operation: ConditionOperator.equal, stringValue: 'Alice'),
          ],
        );

        final json = filter.toJson();

        expect(json['key'], 'document.custom_metadata.author');
        expect(json['conditions'], hasLength(1));
        expect(json['conditions'][0]['operation'], 'EQUAL');
        expect(json['conditions'][0]['stringValue'], 'Alice');
      });

      test('converts MetadataFilter with multiple conditions to JSON', () {
        const filter = MetadataFilter(
          key: 'chunk.custom_metadata.rating',
          conditions: [
            Condition(operation: ConditionOperator.greater, numericValue: 4.0),
            Condition(operation: ConditionOperator.less, numericValue: 5.0),
          ],
        );

        final json = filter.toJson();

        expect(json['key'], 'chunk.custom_metadata.rating');
        expect(json['conditions'], hasLength(2));
        expect(json['conditions'][0]['operation'], 'GREATER');
        expect(json['conditions'][0]['numericValue'], 4.0);
        expect(json['conditions'][1]['operation'], 'LESS');
        expect(json['conditions'][1]['numericValue'], 5.0);
      });

      test('converts MetadataFilter with mixed condition types to JSON', () {
        const filter = MetadataFilter(
          key: 'document.custom_metadata.status',
          conditions: [
            Condition(
              operation: ConditionOperator.equal,
              stringValue: 'active',
            ),
            Condition(
              operation: ConditionOperator.notEqual,
              stringValue: 'deleted',
            ),
          ],
        );

        final json = filter.toJson();

        expect(json['key'], 'document.custom_metadata.status');
        expect(json['conditions'], hasLength(2));
        expect(json['conditions'][0]['operation'], 'EQUAL');
        expect(json['conditions'][0]['stringValue'], 'active');
        expect(json['conditions'][1]['operation'], 'NOT_EQUAL');
        expect(json['conditions'][1]['stringValue'], 'deleted');
      });
    });

    test('round-trip conversion with single condition preserves data', () {
      const original = MetadataFilter(
        key: 'document.custom_metadata.category',
        conditions: [
          Condition(operation: ConditionOperator.equal, stringValue: 'science'),
        ],
      );

      final json = original.toJson();
      final restored = MetadataFilter.fromJson(json);

      expect(restored.key, original.key);
      expect(restored.conditions, hasLength(original.conditions.length));
      expect(
        restored.conditions[0].operation,
        original.conditions[0].operation,
      );
      expect(
        restored.conditions[0].stringValue,
        original.conditions[0].stringValue,
      );
    });

    test('round-trip conversion with multiple conditions preserves data', () {
      const original = MetadataFilter(
        key: 'chunk.custom_metadata.priority',
        conditions: [
          Condition(
            operation: ConditionOperator.greaterEqual,
            numericValue: 1.0,
          ),
          Condition(operation: ConditionOperator.lessEqual, numericValue: 10.0),
          Condition(operation: ConditionOperator.notEqual, numericValue: 5.0),
        ],
      );

      final json = original.toJson();
      final restored = MetadataFilter.fromJson(json);

      expect(restored.key, original.key);
      expect(restored.conditions, hasLength(original.conditions.length));
      for (var i = 0; i < original.conditions.length; i++) {
        expect(
          restored.conditions[i].operation,
          original.conditions[i].operation,
        );
        expect(
          restored.conditions[i].numericValue,
          original.conditions[i].numericValue,
        );
      }
    });

    group('toString', () {
      test('includes key and conditions', () {
        const filter = MetadataFilter(
          key: 'document.custom_metadata.genre',
          conditions: [
            Condition(operation: ConditionOperator.equal, stringValue: 'drama'),
            Condition(
              operation: ConditionOperator.equal,
              stringValue: 'action',
            ),
          ],
        );

        final str = filter.toString();

        expect(str, contains('MetadataFilter('));
        expect(str, contains('key: document.custom_metadata.genre'));
        expect(str, contains('conditions:'));
      });

      test('shows single condition', () {
        const filter = MetadataFilter(
          key: 'test.key',
          conditions: [
            Condition(
              operation: ConditionOperator.greater,
              numericValue: 100.0,
            ),
          ],
        );

        final str = filter.toString();

        expect(str, contains('key: test.key'));
        expect(str, contains('conditions:'));
      });
    });
  });
}
