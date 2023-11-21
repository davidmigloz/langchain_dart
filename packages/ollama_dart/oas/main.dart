import 'dart:io';

import 'package:openapi_spec/openapi_spec.dart';

/// Generates Ollama API client Dart code from the OpenAPI spec.
/// https://github.com/jmorganca/ollama/blob/main/docs/api.md
void main() async {
  final spec = OpenApi.fromFile(source: 'oas/ollama-curated.yaml');

  await spec.generate(
    package: 'Ollama',
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
