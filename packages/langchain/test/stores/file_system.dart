import 'dart:io';
import 'dart:typed_data';

import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  late String tempDirPath;
  late Directory tempDir;

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync();
    tempDirPath = tempDir.path;
  });

  tearDown(() {
    tempDir.deleteSync(recursive: true);
  });

  test('should create, retrieve and delete a file', () async {
    final store = LocalFileStore(tempDirPath);
    final data = Uint8List.fromList([1, 2, 3]);

    await store.set([('testKey', data)]);
    expect(await File('$tempDirPath/testKey').readAsBytes(), data);

    final readData = await store.get(['testKey']);
    expect(readData.length, 1);
    expect(readData.first, data);

    await store.delete(['testKey']);
    expect(File('$tempDirPath/testKey').existsSync(), false);
  });

  test('should yield the correct keys', () async {
    final store = LocalFileStore(tempDirPath);
    final data = Uint8List.fromList([1, 2, 3]);

    await store.set([
      ('keyA', data),
      ('keyB', data),
      ('prefixKeyC', data),
    ]);

    final keys = await store.yieldKeys().toList();
    expect(keys, containsAll(<String>['keyA', 'keyB', 'prefixKeyC']));

    final prefixedKeys = await store.yieldKeys(prefix: 'prefix').toList();
    expect(prefixedKeys, contains('prefixKeyC'));
  });

  test('should handle a missing key gracefully', () async {
    final store = LocalFileStore(tempDirPath);

    // No exception should be thrown here.
    await store.delete(['missingKey']);
    final readData = await store.get(['missingKey']);

    // The returned data should be a list of one item being null.
    expect(readData.length, 1);
    expect(readData.first, isNull);
  });
}
