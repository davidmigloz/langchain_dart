import 'package:googleai_dart/src/models/generation/thinking_level.dart';
import 'package:test/test.dart';

void main() {
  group('ThinkingLevel', () {
    group('thinkingLevelFromString', () {
      test('converts MINIMAL to minimal', () {
        expect(thinkingLevelFromString('MINIMAL'), ThinkingLevel.minimal);
      });

      test('converts LOW to low', () {
        expect(thinkingLevelFromString('LOW'), ThinkingLevel.low);
      });

      test('converts MEDIUM to medium', () {
        expect(thinkingLevelFromString('MEDIUM'), ThinkingLevel.medium);
      });

      test('converts HIGH to high', () {
        expect(thinkingLevelFromString('HIGH'), ThinkingLevel.high);
      });

      test('converts THINKING_LEVEL_UNSPECIFIED to unspecified', () {
        expect(
          thinkingLevelFromString('THINKING_LEVEL_UNSPECIFIED'),
          ThinkingLevel.unspecified,
        );
      });

      test('converts null to unspecified', () {
        expect(thinkingLevelFromString(null), ThinkingLevel.unspecified);
      });

      test('converts invalid string to unspecified', () {
        expect(thinkingLevelFromString('INVALID'), ThinkingLevel.unspecified);
      });

      test('is case insensitive', () {
        expect(thinkingLevelFromString('low'), ThinkingLevel.low);
        expect(thinkingLevelFromString('Low'), ThinkingLevel.low);
        expect(thinkingLevelFromString('medium'), ThinkingLevel.medium);
        expect(thinkingLevelFromString('Medium'), ThinkingLevel.medium);
        expect(thinkingLevelFromString('high'), ThinkingLevel.high);
        expect(thinkingLevelFromString('minimal'), ThinkingLevel.minimal);
      });
    });

    group('thinkingLevelToString', () {
      test('converts minimal to MINIMAL', () {
        expect(thinkingLevelToString(ThinkingLevel.minimal), 'MINIMAL');
      });

      test('converts low to LOW', () {
        expect(thinkingLevelToString(ThinkingLevel.low), 'LOW');
      });

      test('converts medium to MEDIUM', () {
        expect(thinkingLevelToString(ThinkingLevel.medium), 'MEDIUM');
      });

      test('converts high to HIGH', () {
        expect(thinkingLevelToString(ThinkingLevel.high), 'HIGH');
      });

      test('converts unspecified to THINKING_LEVEL_UNSPECIFIED', () {
        expect(
          thinkingLevelToString(ThinkingLevel.unspecified),
          'THINKING_LEVEL_UNSPECIFIED',
        );
      });
    });

    test('round-trip conversion preserves value', () {
      for (final level in ThinkingLevel.values) {
        final str = thinkingLevelToString(level);
        final converted = thinkingLevelFromString(str);
        expect(converted, level);
      }
    });
  });
}
