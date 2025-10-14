import 'package:googleai_dart/src/models/batch/batch_state.dart';
import 'package:test/test.dart';

void main() {
  group('BatchState', () {
    group('batchStateFromString', () {
      test('converts BATCH_STATE_PENDING to pending', () {
        expect(batchStateFromString('BATCH_STATE_PENDING'), BatchState.pending);
      });

      test('converts BATCH_STATE_RUNNING to running', () {
        expect(batchStateFromString('BATCH_STATE_RUNNING'), BatchState.running);
      });

      test('converts BATCH_STATE_SUCCEEDED to succeeded', () {
        expect(
          batchStateFromString('BATCH_STATE_SUCCEEDED'),
          BatchState.succeeded,
        );
      });

      test('converts BATCH_STATE_FAILED to failed', () {
        expect(batchStateFromString('BATCH_STATE_FAILED'), BatchState.failed);
      });

      test('converts BATCH_STATE_CANCELLED to cancelled', () {
        expect(
          batchStateFromString('BATCH_STATE_CANCELLED'),
          BatchState.cancelled,
        );
      });

      test('converts BATCH_STATE_EXPIRED to expired', () {
        expect(batchStateFromString('BATCH_STATE_EXPIRED'), BatchState.expired);
      });

      test('converts BATCH_STATE_UNSPECIFIED to unspecified', () {
        expect(
          batchStateFromString('BATCH_STATE_UNSPECIFIED'),
          BatchState.unspecified,
        );
      });

      test('converts null to unspecified', () {
        expect(batchStateFromString(null), BatchState.unspecified);
      });

      test('converts invalid string to unspecified', () {
        expect(batchStateFromString('INVALID'), BatchState.unspecified);
      });

      test('is case insensitive', () {
        expect(
          batchStateFromString('batch_state_running'),
          BatchState.running,
        );
        expect(
          batchStateFromString('Batch_State_Running'),
          BatchState.running,
        );
      });
    });

    group('batchStateToString', () {
      test('converts pending to BATCH_STATE_PENDING', () {
        expect(batchStateToString(BatchState.pending), 'BATCH_STATE_PENDING');
      });

      test('converts running to BATCH_STATE_RUNNING', () {
        expect(batchStateToString(BatchState.running), 'BATCH_STATE_RUNNING');
      });

      test('converts succeeded to BATCH_STATE_SUCCEEDED', () {
        expect(
          batchStateToString(BatchState.succeeded),
          'BATCH_STATE_SUCCEEDED',
        );
      });

      test('converts failed to BATCH_STATE_FAILED', () {
        expect(batchStateToString(BatchState.failed), 'BATCH_STATE_FAILED');
      });

      test('converts cancelled to BATCH_STATE_CANCELLED', () {
        expect(
          batchStateToString(BatchState.cancelled),
          'BATCH_STATE_CANCELLED',
        );
      });

      test('converts expired to BATCH_STATE_EXPIRED', () {
        expect(batchStateToString(BatchState.expired), 'BATCH_STATE_EXPIRED');
      });

      test('converts unspecified to BATCH_STATE_UNSPECIFIED', () {
        expect(
          batchStateToString(BatchState.unspecified),
          'BATCH_STATE_UNSPECIFIED',
        );
      });
    });

    test('round-trip conversion preserves value', () {
      for (final state in BatchState.values) {
        final str = batchStateToString(state);
        final converted = batchStateFromString(str);
        expect(converted, state);
      }
    });
  });
}
