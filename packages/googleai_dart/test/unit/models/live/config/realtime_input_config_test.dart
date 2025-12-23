import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('RealtimeInputConfig', () {
    group('fromJson', () {
      test('creates RealtimeInputConfig with all fields', () {
        final json = {
          'automaticActivityDetection': {
            'disabled': false,
            'silenceDurationMs': 500,
          },
          'activityHandling': 'START_OF_ACTIVITY_INTERRUPTS',
          'turnCoverage': 'TURN_INCLUDES_ONLY_ACTIVITY',
        };

        final config = RealtimeInputConfig.fromJson(json);

        expect(config.automaticActivityDetection, isNotNull);
        expect(
          config.activityHandling,
          ActivityHandling.startOfActivityInterrupts,
        );
        expect(config.turnCoverage, TurnCoverage.turnIncludesOnlyActivity);
      });

      test('creates RealtimeInputConfig with minimal fields', () {
        final json = <String, dynamic>{};
        final config = RealtimeInputConfig.fromJson(json);

        expect(config.automaticActivityDetection, isNull);
        expect(config.activityHandling, isNull);
        expect(config.turnCoverage, isNull);
      });

      test('creates RealtimeInputConfig with only activityHandling', () {
        final json = {'activityHandling': 'NO_INTERRUPTION'};
        final config = RealtimeInputConfig.fromJson(json);

        expect(config.automaticActivityDetection, isNull);
        expect(config.activityHandling, ActivityHandling.noInterruption);
        expect(config.turnCoverage, isNull);
      });
    });

    group('toJson', () {
      test('includes all non-null fields', () {
        final config = RealtimeInputConfig(
          automaticActivityDetection: AutomaticActivityDetection.enabled(
            silenceDurationMs: 500,
          ),
          activityHandling: ActivityHandling.startOfActivityInterrupts,
          turnCoverage: TurnCoverage.turnIncludesOnlyActivity,
        );

        final json = config.toJson();

        expect(json['automaticActivityDetection'], isNotNull);
        expect(json['activityHandling'], 'START_OF_ACTIVITY_INTERRUPTS');
        expect(json['turnCoverage'], 'TURN_INCLUDES_ONLY_ACTIVITY');
      });

      test('omits null fields', () {
        const config = RealtimeInputConfig();
        final json = config.toJson();

        expect(json, isEmpty);
      });

      test('includes only specified fields', () {
        const config = RealtimeInputConfig(
          activityHandling: ActivityHandling.noInterruption,
        );
        final json = config.toJson();

        expect(json.containsKey('activityHandling'), true);
        expect(json.containsKey('automaticActivityDetection'), false);
        expect(json.containsKey('turnCoverage'), false);
      });
    });

    group('copyWith', () {
      test('with no params returns instance with same values', () {
        const original = RealtimeInputConfig(
          activityHandling: ActivityHandling.startOfActivityInterrupts,
          turnCoverage: TurnCoverage.turnIncludesAllInput,
        );
        final copied = original.copyWith();

        expect(copied.activityHandling, original.activityHandling);
        expect(copied.turnCoverage, original.turnCoverage);
      });

      test('updates specified fields only', () {
        const original = RealtimeInputConfig(
          activityHandling: ActivityHandling.startOfActivityInterrupts,
          turnCoverage: TurnCoverage.turnIncludesAllInput,
        );
        final updated = original.copyWith(
          activityHandling: ActivityHandling.noInterruption,
        );

        expect(updated.activityHandling, ActivityHandling.noInterruption);
        expect(updated.turnCoverage, original.turnCoverage);
      });

      test('can update multiple fields', () {
        const original = RealtimeInputConfig();
        final updated = original.copyWith(
          activityHandling: ActivityHandling.startOfActivityInterrupts,
          turnCoverage: TurnCoverage.turnIncludesOnlyActivity,
        );

        expect(
          updated.activityHandling,
          ActivityHandling.startOfActivityInterrupts,
        );
        expect(updated.turnCoverage, TurnCoverage.turnIncludesOnlyActivity);
      });
    });

    group('factory constructors', () {
      test('withVAD creates config with automatic VAD enabled', () {
        final config = RealtimeInputConfig.withVAD(silenceDurationMs: 500);

        expect(config.automaticActivityDetection, isNotNull);
        expect(config.automaticActivityDetection!.disabled, false);
        expect(config.automaticActivityDetection!.silenceDurationMs, 500);
        expect(
          config.activityHandling,
          ActivityHandling.startOfActivityInterrupts,
        );
      });

      test('withVAD with custom activityHandling', () {
        final config = RealtimeInputConfig.withVAD(
          silenceDurationMs: 300,
          activityHandling: ActivityHandling.noInterruption,
        );

        expect(config.automaticActivityDetection, isNotNull);
        expect(config.activityHandling, ActivityHandling.noInterruption);
      });

      test('manual creates config with VAD disabled', () {
        final config = RealtimeInputConfig.manual();

        expect(config.automaticActivityDetection, isNotNull);
        expect(config.automaticActivityDetection!.disabled, true);
        expect(config.activityHandling, ActivityHandling.noInterruption);
      });

      test('manual with custom activityHandling', () {
        final config = RealtimeInputConfig.manual(
          activityHandling: ActivityHandling.startOfActivityInterrupts,
        );

        expect(config.automaticActivityDetection!.disabled, true);
        expect(
          config.activityHandling,
          ActivityHandling.startOfActivityInterrupts,
        );
      });
    });

    test('round-trip conversion preserves data', () {
      final original = RealtimeInputConfig(
        automaticActivityDetection: AutomaticActivityDetection.enabled(
          silenceDurationMs: 500,
        ),
        activityHandling: ActivityHandling.startOfActivityInterrupts,
        turnCoverage: TurnCoverage.turnIncludesOnlyActivity,
      );

      final json = original.toJson();
      final restored = RealtimeInputConfig.fromJson(json);

      expect(restored.activityHandling, original.activityHandling);
      expect(restored.turnCoverage, original.turnCoverage);
      expect(
        restored.automaticActivityDetection!.silenceDurationMs,
        original.automaticActivityDetection!.silenceDurationMs,
      );
    });

    test('toString includes key fields', () {
      const config = RealtimeInputConfig(
        activityHandling: ActivityHandling.startOfActivityInterrupts,
        turnCoverage: TurnCoverage.turnIncludesOnlyActivity,
      );
      final str = config.toString();

      expect(str, contains('RealtimeInputConfig'));
      expect(str, contains('activityHandling'));
      expect(str, contains('turnCoverage'));
    });
  });
}
