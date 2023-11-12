import 'dart:io';

import 'package:openapi_spec/openapi_spec.dart';

/// Generates Chroma API client Dart code from the OpenAPI spec.
/// http://localhost:8000/openapi.json
void main() async {
  final spec = OpenApi.fromFile(source: 'oas/openapi_curated.json');
  await spec.generate(
    package: 'chroma_api',
    destination: 'lib/src/generated/',
    replace: true,
    clientOptions: const ClientGeneratorOptions(
      enabled: true,
    ),
  );
  await Process.run(
    'dart',
    ['run', 'build_runner', 'build', 'lib', '--delete-conflicting-outputs'],
  );
}
