// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/src/models/corpus/custom_metadata.dart';
import 'package:googleai_dart/src/models/corpus/string_list.dart';
import 'package:test/test.dart';

void main() {
  group('CustomMetadata', () {
    group('fromJson', () {
      test('creates CustomMetadata with string value', () {
        final json = {
          'key': 'author',
          'stringValue': 'Alice',
        };

        final metadata = CustomMetadata.fromJson(json);

        expect(metadata.key, 'author');
        expect(metadata.stringValue, 'Alice');
        expect(metadata.stringListValue, isNull);
        expect(metadata.numericValue, isNull);
      });

      test('creates CustomMetadata with numeric value', () {
        final json = {
          'key': 'rating',
          'numericValue': 4.5,
        };

        final metadata = CustomMetadata.fromJson(json);

        expect(metadata.key, 'rating');
        expect(metadata.stringValue, isNull);
        expect(metadata.stringListValue, isNull);
        expect(metadata.numericValue, 4.5);
      });

      test('creates CustomMetadata with string list value', () {
        final json = {
          'key': 'tags',
          'stringListValue': {
            'values': ['science', 'technology', 'ai'],
          },
        };

        final metadata = CustomMetadata.fromJson(json);

        expect(metadata.key, 'tags');
        expect(metadata.stringValue, isNull);
        expect(metadata.stringListValue, isNotNull);
        expect(
          metadata.stringListValue!.values,
          ['science', 'technology', 'ai'],
        );
        expect(metadata.numericValue, isNull);
      });

      test('creates CustomMetadata with only key', () {
        final json = {
          'key': 'empty_metadata',
        };

        final metadata = CustomMetadata.fromJson(json);

        expect(metadata.key, 'empty_metadata');
        expect(metadata.stringValue, isNull);
        expect(metadata.stringListValue, isNull);
        expect(metadata.numericValue, isNull);
      });

      test('converts integer to double for numeric value', () {
        final json = {
          'key': 'count',
          'numericValue': 42,
        };

        final metadata = CustomMetadata.fromJson(json);

        expect(metadata.numericValue, 42.0);
        expect(metadata.numericValue, isA<double>());
      });

      test('handles null values', () {
        final json = {
          'key': 'test',
          'stringValue': null,
          'stringListValue': null,
          'numericValue': null,
        };

        final metadata = CustomMetadata.fromJson(json);

        expect(metadata.key, 'test');
        expect(metadata.stringValue, isNull);
        expect(metadata.stringListValue, isNull);
        expect(metadata.numericValue, isNull);
      });
    });

    group('toJson', () {
      test('converts CustomMetadata with string value to JSON', () {
        const metadata = CustomMetadata(
          key: 'category',
          stringValue: 'documentation',
        );

        final json = metadata.toJson();

        expect(json['key'], 'category');
        expect(json['stringValue'], 'documentation');
        expect(json.containsKey('stringListValue'), false);
        expect(json.containsKey('numericValue'), false);
      });

      test('converts CustomMetadata with numeric value to JSON', () {
        const metadata = CustomMetadata(
          key: 'priority',
          numericValue: 8.7,
        );

        final json = metadata.toJson();

        expect(json['key'], 'priority');
        expect(json.containsKey('stringValue'), false);
        expect(json.containsKey('stringListValue'), false);
        expect(json['numericValue'], 8.7);
      });

      test('converts CustomMetadata with string list value to JSON', () {
        const metadata = CustomMetadata(
          key: 'categories',
          stringListValue: StringList(values: ['news', 'tech', 'ai']),
        );

        final json = metadata.toJson();

        expect(json['key'], 'categories');
        expect(json.containsKey('stringValue'), false);
        expect(json['stringListValue']['values'], ['news', 'tech', 'ai']);
        expect(json.containsKey('numericValue'), false);
      });

      test('converts CustomMetadata with only key to JSON', () {
        const metadata = CustomMetadata(key: 'minimal');

        final json = metadata.toJson();

        expect(json['key'], 'minimal');
        expect(json.containsKey('stringValue'), false);
        expect(json.containsKey('stringListValue'), false);
        expect(json.containsKey('numericValue'), false);
      });

      test('omits null values from JSON', () {
        const metadata = CustomMetadata(
          key: 'test',
          stringValue: null,
          stringListValue: null,
          numericValue: null,
        );

        final json = metadata.toJson();

        expect(json['key'], 'test');
        expect(json.containsKey('stringValue'), false);
        expect(json.containsKey('stringListValue'), false);
        expect(json.containsKey('numericValue'), false);
      });
    });

    test('round-trip conversion with string value preserves data', () {
      const original = CustomMetadata(
        key: 'author',
        stringValue: 'Bob',
      );

      final json = original.toJson();
      final restored = CustomMetadata.fromJson(json);

      expect(restored.key, original.key);
      expect(restored.stringValue, original.stringValue);
      expect(restored.stringListValue, original.stringListValue);
      expect(restored.numericValue, original.numericValue);
    });

    test('round-trip conversion with numeric value preserves data', () {
      const original = CustomMetadata(
        key: 'score',
        numericValue: 95.5,
      );

      final json = original.toJson();
      final restored = CustomMetadata.fromJson(json);

      expect(restored.key, original.key);
      expect(restored.stringValue, original.stringValue);
      expect(restored.stringListValue, original.stringListValue);
      expect(restored.numericValue, original.numericValue);
    });

    test('round-trip conversion with string list value preserves data', () {
      const original = CustomMetadata(
        key: 'keywords',
        stringListValue: StringList(values: ['dart', 'flutter', 'test']),
      );

      final json = original.toJson();
      final restored = CustomMetadata.fromJson(json);

      expect(restored.key, original.key);
      expect(restored.stringValue, original.stringValue);
      expect(
        restored.stringListValue!.values,
        original.stringListValue!.values,
      );
      expect(restored.numericValue, original.numericValue);
    });

    group('toString', () {
      test('includes all fields for string value', () {
        const metadata = CustomMetadata(
          key: 'title',
          stringValue: 'Test Document',
        );

        final str = metadata.toString();

        expect(str, contains('CustomMetadata('));
        expect(str, contains('key: title'));
        expect(str, contains('stringValue: Test Document'));
        expect(str, contains('stringListValue: null'));
        expect(str, contains('numericValue: null'));
      });

      test('includes all fields for numeric value', () {
        const metadata = CustomMetadata(
          key: 'version',
          numericValue: 2.1,
        );

        final str = metadata.toString();

        expect(str, contains('key: version'));
        expect(str, contains('stringValue: null'));
        expect(str, contains('numericValue: 2.1'));
      });

      test('includes all fields for string list value', () {
        const metadata = CustomMetadata(
          key: 'labels',
          stringListValue: StringList(values: ['important', 'urgent']),
        );

        final str = metadata.toString();

        expect(str, contains('key: labels'));
        expect(str, contains('stringListValue:'));
        expect(str, contains('stringValue: null'));
        expect(str, contains('numericValue: null'));
      });
    });
  });
}
