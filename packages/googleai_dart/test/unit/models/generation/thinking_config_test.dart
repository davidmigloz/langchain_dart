import 'package:googleai_dart/src/models/generation/thinking_config.dart';
import 'package:googleai_dart/src/models/generation/thinking_level.dart';
import 'package:test/test.dart';

void main() {
  group('ThinkingConfig', () {
    group('fromJson', () {
      test('creates ThinkingConfig with all fields', () {
        final json = {
          'includeThoughts': true,
          'thinkingBudget': 1000,
          'thinkingLevel': 'HIGH',
        };
        final config = ThinkingConfig.fromJson(json);

        expect(config.includeThoughts, true);
        expect(config.thinkingBudget, 1000);
        expect(config.thinkingLevel, ThinkingLevel.high);
      });

      test('creates ThinkingConfig with minimal fields', () {
        final json = <String, dynamic>{};
        final config = ThinkingConfig.fromJson(json);

        expect(config.includeThoughts, isNull);
        expect(config.thinkingBudget, isNull);
        expect(config.thinkingLevel, isNull);
      });

      test('creates ThinkingConfig with only includeThoughts', () {
        final json = {'includeThoughts': false};
        final config = ThinkingConfig.fromJson(json);

        expect(config.includeThoughts, false);
        expect(config.thinkingBudget, isNull);
        expect(config.thinkingLevel, isNull);
      });

      test('creates ThinkingConfig with only thinkingBudget', () {
        final json = {'thinkingBudget': 500};
        final config = ThinkingConfig.fromJson(json);

        expect(config.includeThoughts, isNull);
        expect(config.thinkingBudget, 500);
        expect(config.thinkingLevel, isNull);
      });

      test('creates ThinkingConfig with only thinkingLevel', () {
        final json = {'thinkingLevel': 'MEDIUM'};
        final config = ThinkingConfig.fromJson(json);

        expect(config.includeThoughts, isNull);
        expect(config.thinkingBudget, isNull);
        expect(config.thinkingLevel, ThinkingLevel.medium);
      });

      test('handles all thinkingLevel values', () {
        expect(
          ThinkingConfig.fromJson({'thinkingLevel': 'MINIMAL'}).thinkingLevel,
          ThinkingLevel.minimal,
        );
        expect(
          ThinkingConfig.fromJson({'thinkingLevel': 'LOW'}).thinkingLevel,
          ThinkingLevel.low,
        );
        expect(
          ThinkingConfig.fromJson({'thinkingLevel': 'MEDIUM'}).thinkingLevel,
          ThinkingLevel.medium,
        );
        expect(
          ThinkingConfig.fromJson({'thinkingLevel': 'HIGH'}).thinkingLevel,
          ThinkingLevel.high,
        );
      });
    });

    group('toJson', () {
      test('creates JSON with all fields', () {
        const config = ThinkingConfig(
          includeThoughts: true,
          thinkingBudget: 500,
          thinkingLevel: ThinkingLevel.low,
        );
        final json = config.toJson();

        expect(json['includeThoughts'], true);
        expect(json['thinkingBudget'], 500);
        expect(json['thinkingLevel'], 'LOW');
      });

      test('omits null fields', () {
        const config = ThinkingConfig(includeThoughts: true);
        final json = config.toJson();

        expect(json.containsKey('includeThoughts'), true);
        expect(json.containsKey('thinkingBudget'), false);
        expect(json.containsKey('thinkingLevel'), false);
      });

      test('creates empty JSON when all fields are null', () {
        const config = ThinkingConfig();
        final json = config.toJson();

        expect(json, isEmpty);
      });

      test('serializes all thinkingLevel values correctly', () {
        expect(
          const ThinkingConfig(thinkingLevel: ThinkingLevel.minimal).toJson(),
          {'thinkingLevel': 'MINIMAL'},
        );
        expect(
          const ThinkingConfig(thinkingLevel: ThinkingLevel.low).toJson(),
          {'thinkingLevel': 'LOW'},
        );
        expect(
          const ThinkingConfig(thinkingLevel: ThinkingLevel.medium).toJson(),
          {'thinkingLevel': 'MEDIUM'},
        );
        expect(
          const ThinkingConfig(thinkingLevel: ThinkingLevel.high).toJson(),
          {'thinkingLevel': 'HIGH'},
        );
        expect(
          const ThinkingConfig(
            thinkingLevel: ThinkingLevel.unspecified,
          ).toJson(),
          {'thinkingLevel': 'THINKING_LEVEL_UNSPECIFIED'},
        );
      });
    });

    group('copyWith', () {
      test('copyWith with no parameters returns instance with same values', () {
        const original = ThinkingConfig(
          includeThoughts: true,
          thinkingBudget: 1000,
          thinkingLevel: ThinkingLevel.high,
        );
        final copied = original.copyWith();

        expect(copied.includeThoughts, original.includeThoughts);
        expect(copied.thinkingBudget, original.thinkingBudget);
        expect(copied.thinkingLevel, original.thinkingLevel);
      });

      test('copyWith updates specific fields', () {
        const original = ThinkingConfig(
          includeThoughts: true,
          thinkingLevel: ThinkingLevel.high,
        );
        final updated = original.copyWith(thinkingLevel: ThinkingLevel.low);

        expect(updated.includeThoughts, original.includeThoughts);
        expect(updated.thinkingLevel, ThinkingLevel.low);
      });

      test('copyWith supports explicit null assignment', () {
        const original = ThinkingConfig(
          includeThoughts: true,
          thinkingBudget: 1000,
        );
        final updated = original.copyWith(thinkingBudget: null);

        expect(updated.includeThoughts, original.includeThoughts);
        expect(updated.thinkingBudget, isNull);
      });

      test('copyWith updates all fields', () {
        const original = ThinkingConfig(
          includeThoughts: true,
          thinkingBudget: 1000,
          thinkingLevel: ThinkingLevel.high,
        );
        final updated = original.copyWith(
          includeThoughts: false,
          thinkingBudget: 2000,
          thinkingLevel: ThinkingLevel.minimal,
        );

        expect(updated.includeThoughts, false);
        expect(updated.thinkingBudget, 2000);
        expect(updated.thinkingLevel, ThinkingLevel.minimal);
      });
    });

    test('round-trip conversion preserves values', () {
      const original = ThinkingConfig(
        includeThoughts: true,
        thinkingBudget: 2000,
        thinkingLevel: ThinkingLevel.medium,
      );
      final json = original.toJson();
      final converted = ThinkingConfig.fromJson(json);

      expect(converted.includeThoughts, original.includeThoughts);
      expect(converted.thinkingBudget, original.thinkingBudget);
      expect(converted.thinkingLevel, original.thinkingLevel);
    });
  });
}
