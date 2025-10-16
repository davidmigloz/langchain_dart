import 'package:googleai_dart/src/models/corpus/chunk_state.dart';
import 'package:test/test.dart';

void main() {
  group('ChunkState', () {
    group('chunkStateFromString', () {
      test('converts STATE_UNSPECIFIED to unspecified', () {
        expect(
          chunkStateFromString('STATE_UNSPECIFIED'),
          ChunkState.unspecified,
        );
      });

      test('converts STATE_PENDING_PROCESSING to pendingProcessing', () {
        expect(
          chunkStateFromString('STATE_PENDING_PROCESSING'),
          ChunkState.pendingProcessing,
        );
      });

      test('converts STATE_ACTIVE to active', () {
        expect(chunkStateFromString('STATE_ACTIVE'), ChunkState.active);
      });

      test('converts STATE_FAILED to failed', () {
        expect(chunkStateFromString('STATE_FAILED'), ChunkState.failed);
      });

      test('converts null to unspecified', () {
        expect(chunkStateFromString(null), ChunkState.unspecified);
      });

      test('converts invalid string to unspecified', () {
        expect(chunkStateFromString('INVALID'), ChunkState.unspecified);
      });

      test('is case insensitive', () {
        expect(chunkStateFromString('state_active'), ChunkState.active);
        expect(chunkStateFromString('State_Active'), ChunkState.active);
        expect(chunkStateFromString('STATE_active'), ChunkState.active);
      });
    });

    group('chunkStateToString', () {
      test('converts unspecified to STATE_UNSPECIFIED', () {
        expect(chunkStateToString(ChunkState.unspecified), 'STATE_UNSPECIFIED');
      });

      test('converts pendingProcessing to STATE_PENDING_PROCESSING', () {
        expect(
          chunkStateToString(ChunkState.pendingProcessing),
          'STATE_PENDING_PROCESSING',
        );
      });

      test('converts active to STATE_ACTIVE', () {
        expect(chunkStateToString(ChunkState.active), 'STATE_ACTIVE');
      });

      test('converts failed to STATE_FAILED', () {
        expect(chunkStateToString(ChunkState.failed), 'STATE_FAILED');
      });
    });

    test('round-trip conversion preserves value', () {
      for (final state in ChunkState.values) {
        final str = chunkStateToString(state);
        final converted = chunkStateFromString(str);
        expect(converted, state);
      }
    });
  });
}
