import 'dart:ffi';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:langchain_community/dart_utils/debugging.dart';

import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';

Future<File> databaseFile(String name) async {
  // We use `path_provider` to find a suitable path to store our data in.
  final appDir = await getApplicationDocumentsDirectory();
  final dbPath = p.join(appDir.path, '$name.db');
  return File(dbPath);
}

/// Obtains a database connection for running drift in a Dart VM.
QueryExecutor connect(String name) {
  if (name == ':memory:') {
    return NativeDatabase.memory();
  }
  return DatabaseConnection.delayed(Future(() async {
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();

      final cachebase = (await getTemporaryDirectory()).path;

      // We can't access /tmp on Android, which sqlite3 would try by default.
      // Explicitly tell it about the correct temporary directory.
      sqlite3.tempDirectory = cachebase;
    }

    sqlite3.ensureExtensionLoaded(
      SqliteExtension.inLibrary(_loadLibrary('vec0'), 'sqlite3_vec_init'),
    );

    return NativeDatabase.createBackgroundConnection(
      await databaseFile(name),
    );
  }));
}

DynamicLibrary _loadLibrary(String name) {
  if (Platform.isIOS || Platform.isMacOS) {
    return DynamicLibrary.open('$name.dylib');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('$name.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open(() {
      if (kDebugDartMode) {
        return p.normalize(p.join(
          Directory.current.path,
          'extensions',
          '$name.dll',
        ));
      } else {
        final assets = p.normalize(
          p.join(
            'data',
            'flutter_assets',
            'packages',
            'flutter_sqlite_document_search',
            'extensions',
          ),
        );
        final exe = File(Platform.resolvedExecutable).parent.path;
        return p.normalize(p.join(exe, assets, '$name.dll'));
      }
    }());
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}
