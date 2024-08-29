import 'dart:async';

import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:langchain_community/dart_utils/debugging.dart';



/// Obtains a database connection for running drift on the web.
DatabaseConnection connect(String name) {
  return DatabaseConnection.delayed(Future(() async {
    final db = await WasmDatabase.open(
      databaseName: name,
      sqlite3Uri: Uri.parse('sqlite3_vec.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.js'),
    );

    if (db.missingFeatures.isNotEmpty) {
      kDebugPrint(
        'Using ${db.chosenImplementation} due to unsupported '
        'browser features: ${db.missingFeatures}',
      );
    }

    return db.resolvedExecutor;
  }));
}

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {
  // Unfortunately, validating database schemas only works for native platforms
  // right now.
  // As we also have migration tests (see the `Testing migrations` section in
  // the readme of this example), this is not a huge issue.
}
