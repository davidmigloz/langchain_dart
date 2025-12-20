import 'package:googleai_dart/src/models/corpus/document_state.dart';
import 'package:test/test.dart';

void main() {
  group('DocumentState', () {
    test('all enum values have correct string values', () {
      expect(DocumentState.unspecified.value, 'STATE_UNSPECIFIED');
      expect(DocumentState.pending.value, 'STATE_PENDING');
      expect(DocumentState.active.value, 'STATE_ACTIVE');
      expect(DocumentState.failed.value, 'STATE_FAILED');
    });

    test('fromString converts all states correctly', () {
      expect(
        DocumentState.fromString('STATE_UNSPECIFIED'),
        DocumentState.unspecified,
      );
      expect(DocumentState.fromString('STATE_PENDING'), DocumentState.pending);
      expect(DocumentState.fromString('STATE_ACTIVE'), DocumentState.active);
      expect(DocumentState.fromString('STATE_FAILED'), DocumentState.failed);
    });

    test('fromString returns unspecified for unknown values', () {
      expect(DocumentState.fromString('UNKNOWN'), DocumentState.unspecified);
      expect(DocumentState.fromString('invalid'), DocumentState.unspecified);
      expect(DocumentState.fromString(''), DocumentState.unspecified);
    });

    test('fromString is case-sensitive', () {
      // These should not match because the enum uses uppercase
      expect(
        DocumentState.fromString('state_active'),
        DocumentState.unspecified,
      );
      expect(DocumentState.fromString('Active'), DocumentState.unspecified);
    });
  });
}
