import 'dart:typed_data';

import 'base.dart';

/// {@template local_file_store_stub}
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
  /// {@macro local_file_store_stub}
  LocalFileStore(this.rootPath) {
    throw _unimplementedError;
  }

  /// The root path of the store.
  final String rootPath;

  @override
  Future<void> delete(final List<String> keys) {
    throw _unimplementedError;
  }

  @override
  Future<List<Uint8List?>> get(final List<String> keys) {
    throw _unimplementedError;
  }

  @override
  Future<void> set(final List<(String, Uint8List)> keyValuePairs) {
    throw _unimplementedError;
  }

  @override
  Stream<String> yieldKeys({final String? prefix}) {
    throw _unimplementedError;
  }

  UnimplementedError get _unimplementedError => throw UnimplementedError(
        'LocalFileStore is not supported for web.',
      );
}
