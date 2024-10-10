import 'dart:ffi';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';

/// Obtains a database connection for running drift in a pure Dart environment.
Future<File> databaseFile(String name) async {
  // Replace with a suitable path for non-Flutter environments
  final appDir = Directory.current.path; // Use the current directory
  final dbPath = p.join(appDir, '$name.db');
  return File(dbPath);
}

/// Obtains a database connection for running drift in a pure Dart environment.
QueryExecutor connect(String name) {
  // For Android, Linux, or other Unix-based systems
  if (Platform.isAndroid || Platform.isLinux) {
    final cachebase =
        Directory.systemTemp.path; // Use system temporary directory
    sqlite3.tempDirectory = cachebase; // Set SQLite temporary directory
  }

  sqlite3.ensureExtensionLoaded(
    SqliteExtension.inLibrary(
      _loadLibrary(Platform.isWindows ? 'win_vec0' : 'mac_vec0'),
      'sqlite3_vec_init',
    ),
  );

  if (name == ':memory:') {
    return NativeDatabase.memory();
  }
  return DatabaseConnection.delayed(
    Future(() async {
      return NativeDatabase.createBackgroundConnection(
        await databaseFile(name),
      );
    }),
  );
}

DynamicLibrary _loadLibrary(String name) {
  // Dynamically load the library based on the operating system
  if (Platform.isIOS || Platform.isMacOS) {
    return DynamicLibrary.open('$name.dylib');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('$name.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open(
      p.join(Directory.current.path, 'extensions', '$name.dll'),
    );
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}
