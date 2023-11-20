import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'base.dart';

/// {@template local_file_store_io}
/// A simple file system implementation of a [BaseStore].
///
/// Given a [rootPath], each key is mapped to a file relative to that path.
///
/// Note: [LocalFileStore] is not supported for web.
///
/// Example:
/// ```dart
/// final store = LocalFileStore('/tmp');
/// ```
/// {@endtemplate}
class LocalFileStore implements BaseStore<String, Uint8List> {
  /// {@macro local_file_store_io}
  LocalFileStore(this.rootPath);

  /// The root path of the store.
  final String rootPath;

  @override
  Future<List<Uint8List?>> get(final List<String> keys) async {
    return Future.wait(
      keys.map(
        (final key) async {
          final file = _getLocalFile(key);
          return file.existsSync() ? file.readAsBytes() : null;
        },
      ),
    );
  }

  @override
  Future<void> set(final List<(String, Uint8List)> keyValuePairs) async {
    for (final pair in keyValuePairs) {
      final file = _getLocalFile(pair.$1);
      await file.writeAsBytes(pair.$2);
    }
  }

  @override
  Future<void> delete(final List<String> keys) async {
    for (final key in keys) {
      final file = _getLocalFile(key);
      if (file.existsSync()) {
        await file.delete();
      }
    }
  }

  @override
  Stream<String> yieldKeys({final String? prefix}) async* {
    final directory = Directory(rootPath);
    await for (final entity in directory.list()) {
      if (entity is File) {
        final fileName = entity.path.split('/').last;
        if (prefix == null || fileName.startsWith(prefix)) {
          yield fileName;
        }
      }
    }
  }

  File _getLocalFile(final String key) {
    return File('$rootPath/$key');
  }
}
