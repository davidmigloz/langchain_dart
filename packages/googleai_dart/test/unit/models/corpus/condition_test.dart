import 'package:googleai_dart/src/models/corpus/condition.dart';
import 'package:test/test.dart';

void main() {
  group('Condition', () {
    group('fromJson', () {
      test('creates Condition with string value', () {
        final json = {'operation': 'EQUAL', 'stringValue': 'test'};

        final condition = Condition.fromJson(json);

        expect(condition.operation, ConditionOperator.equal);
        expect(condition.stringValue, 'test');
        expect(condition.numericValue, isNull);
      });

      test('creates Condition with numeric value', () {
        final json = {'operation': 'GREATER', 'numericValue': 42.5};

        final condition = Condition.fromJson(json);

        expect(condition.operation, ConditionOperator.greater);
        expect(condition.stringValue, isNull);
        expect(condition.numericValue, 42.5);
      });

      test('creates Condition with only operation', () {
        final json = {'operation': 'NOT_EQUAL'};

        final condition = Condition.fromJson(json);

        expect(condition.operation, ConditionOperator.notEqual);
        expect(condition.stringValue, isNull);
        expect(condition.numericValue, isNull);
      });

      test('converts integer to double for numeric value', () {
        final json = {'operation': 'LESS', 'numericValue': 100};

        final condition = Condition.fromJson(json);

        expect(condition.numericValue, 100.0);
        expect(condition.numericValue, isA<double>());
      });

      test('handles null values', () {
        final json = {
          'operation': 'INCLUDES',
          'stringValue': null,
          'numericValue': null,
        };

        final condition = Condition.fromJson(json);

        expect(condition.operation, ConditionOperator.includes);
        expect(condition.stringValue, isNull);
        expect(condition.numericValue, isNull);
      });
    });

    group('toJson', () {
      test('converts Condition with string value to JSON', () {
        const condition = Condition(
          operation: ConditionOperator.equal,
          stringValue: 'value',
        );

        final json = condition.toJson();

        expect(json['operation'], 'EQUAL');
        expect(json['stringValue'], 'value');
        expect(json.containsKey('numericValue'), false);
      });

      test('converts Condition with numeric value to JSON', () {
        const condition = Condition(
          operation: ConditionOperator.lessEqual,
          numericValue: 99.9,
        );

        final json = condition.toJson();

        expect(json['operation'], 'LESS_EQUAL');
        expect(json.containsKey('stringValue'), false);
        expect(json['numericValue'], 99.9);
      });

      test('converts Condition with only operation to JSON', () {
        const condition = Condition(operation: ConditionOperator.excludes);

        final json = condition.toJson();

        expect(json['operation'], 'EXCLUDES');
        expect(json.containsKey('stringValue'), false);
        expect(json.containsKey('numericValue'), false);
      });

      test('omits null values from JSON', () {
        const condition = Condition(
          operation: ConditionOperator.greater,
          stringValue: null,
          numericValue: null,
        );

        final json = condition.toJson();

        expect(json['operation'], 'GREATER');
        expect(json.containsKey('stringValue'), false);
        expect(json.containsKey('numericValue'), false);
      });
    });

    test('round-trip conversion with string value preserves data', () {
      const original = Condition(
        operation: ConditionOperator.notEqual,
        stringValue: 'test_value',
      );

      final json = original.toJson();
      final restored = Condition.fromJson(json);

      expect(restored.operation, original.operation);
      expect(restored.stringValue, original.stringValue);
      expect(restored.numericValue, original.numericValue);
    });

    test('round-trip conversion with numeric value preserves data', () {
      const original = Condition(
        operation: ConditionOperator.greaterEqual,
        numericValue: 123.45,
      );

      final json = original.toJson();
      final restored = Condition.fromJson(json);

      expect(restored.operation, original.operation);
      expect(restored.stringValue, original.stringValue);
      expect(restored.numericValue, original.numericValue);
    });

    group('toString', () {
      test('includes all fields with string value', () {
        const condition = Condition(
          operation: ConditionOperator.equal,
          stringValue: 'test',
        );

        final str = condition.toString();

        expect(str, contains('Condition('));
        expect(str, contains('operation: ConditionOperator.equal'));
        expect(str, contains('stringValue: test'));
        expect(str, contains('numericValue: null'));
      });

      test('includes all fields with numeric value', () {
        const condition = Condition(
          operation: ConditionOperator.less,
          numericValue: 42.0,
        );

        final str = condition.toString();

        expect(str, contains('operation: ConditionOperator.less'));
        expect(str, contains('stringValue: null'));
        expect(str, contains('numericValue: 42.0'));
      });
    });
  });

  group('ConditionOperator', () {
    group('conditionOperatorFromString', () {
      test('converts LESS to less', () {
        expect(conditionOperatorFromString('LESS'), ConditionOperator.less);
      });

      test('converts LESS_EQUAL to lessEqual', () {
        expect(
          conditionOperatorFromString('LESS_EQUAL'),
          ConditionOperator.lessEqual,
        );
      });

      test('converts EQUAL to equal', () {
        expect(conditionOperatorFromString('EQUAL'), ConditionOperator.equal);
      });

      test('converts GREATER_EQUAL to greaterEqual', () {
        expect(
          conditionOperatorFromString('GREATER_EQUAL'),
          ConditionOperator.greaterEqual,
        );
      });

      test('converts GREATER to greater', () {
        expect(
          conditionOperatorFromString('GREATER'),
          ConditionOperator.greater,
        );
      });

      test('converts NOT_EQUAL to notEqual', () {
        expect(
          conditionOperatorFromString('NOT_EQUAL'),
          ConditionOperator.notEqual,
        );
      });

      test('converts INCLUDES to includes', () {
        expect(
          conditionOperatorFromString('INCLUDES'),
          ConditionOperator.includes,
        );
      });

      test('converts EXCLUDES to excludes', () {
        expect(
          conditionOperatorFromString('EXCLUDES'),
          ConditionOperator.excludes,
        );
      });

      test('converts OPERATOR_UNSPECIFIED to unspecified', () {
        expect(
          conditionOperatorFromString('OPERATOR_UNSPECIFIED'),
          ConditionOperator.unspecified,
        );
      });

      test('converts null to unspecified', () {
        expect(
          conditionOperatorFromString(null),
          ConditionOperator.unspecified,
        );
      });

      test('converts invalid string to unspecified', () {
        expect(
          conditionOperatorFromString('INVALID'),
          ConditionOperator.unspecified,
        );
      });

      test('is case insensitive', () {
        expect(conditionOperatorFromString('equal'), ConditionOperator.equal);
        expect(conditionOperatorFromString('Equal'), ConditionOperator.equal);
        expect(
          conditionOperatorFromString('greater_equal'),
          ConditionOperator.greaterEqual,
        );
      });
    });

    group('conditionOperatorToString', () {
      test('converts unspecified to OPERATOR_UNSPECIFIED', () {
        expect(
          conditionOperatorToString(ConditionOperator.unspecified),
          'OPERATOR_UNSPECIFIED',
        );
      });

      test('converts less to LESS', () {
        expect(conditionOperatorToString(ConditionOperator.less), 'LESS');
      });

      test('converts lessEqual to LESS_EQUAL', () {
        expect(
          conditionOperatorToString(ConditionOperator.lessEqual),
          'LESS_EQUAL',
        );
      });

      test('converts equal to EQUAL', () {
        expect(conditionOperatorToString(ConditionOperator.equal), 'EQUAL');
      });

      test('converts greaterEqual to GREATER_EQUAL', () {
        expect(
          conditionOperatorToString(ConditionOperator.greaterEqual),
          'GREATER_EQUAL',
        );
      });

      test('converts greater to GREATER', () {
        expect(conditionOperatorToString(ConditionOperator.greater), 'GREATER');
      });

      test('converts notEqual to NOT_EQUAL', () {
        expect(
          conditionOperatorToString(ConditionOperator.notEqual),
          'NOT_EQUAL',
        );
      });

      test('converts includes to INCLUDES', () {
        expect(
          conditionOperatorToString(ConditionOperator.includes),
          'INCLUDES',
        );
      });

      test('converts excludes to EXCLUDES', () {
        expect(
          conditionOperatorToString(ConditionOperator.excludes),
          'EXCLUDES',
        );
      });
    });

    test('round-trip conversion preserves value', () {
      for (final operator in ConditionOperator.values) {
        final str = conditionOperatorToString(operator);
        final converted = conditionOperatorFromString(str);
        expect(converted, operator);
      }
    });
  });
}
