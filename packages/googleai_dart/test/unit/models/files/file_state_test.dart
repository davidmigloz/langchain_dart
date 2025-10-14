import 'package:googleai_dart/src/models/files/file_state.dart';
import 'package:test/test.dart';

void main() {
  group('FileState', () {
    test('fileStateFromString converts all states correctly', () {
      expect(fileStateFromString('PROCESSING'), FileState.processing);
      expect(fileStateFromString('ACTIVE'), FileState.active);
      expect(fileStateFromString('FAILED'), FileState.failed);
      expect(fileStateFromString('UNKNOWN'), FileState.unspecified);
      expect(fileStateFromString(null), FileState.unspecified);
    });

    test('fileStateToString converts all states correctly', () {
      expect(fileStateToString(FileState.processing), 'PROCESSING');
      expect(fileStateToString(FileState.active), 'ACTIVE');
      expect(fileStateToString(FileState.failed), 'FAILED');
      expect(fileStateToString(FileState.unspecified), 'STATE_UNSPECIFIED');
    });

    test('state conversion is case-insensitive', () {
      expect(fileStateFromString('processing'), FileState.processing);
      expect(fileStateFromString('Active'), FileState.active);
      expect(fileStateFromString('FAILED'), FileState.failed);
    });
  });
}
