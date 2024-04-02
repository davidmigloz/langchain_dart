import 'dart:io';

import 'package:openapi_spec/openapi_spec.dart';

/// Generates Google AI API client Dart code from the OpenAPI spec.
/// https://generativelanguage.googleapis.com//$discovery/rest?version={version}&key={key}
/// To convert Google Discovery to OpenAPI:
/// https://github.com/stackql/google-discovery-to-openapi
void main() async {
  final spec = OpenApi.fromFile(source: 'oas/googleai_openapi_curated.yaml');

  await spec.generate(
    package: 'GoogleAI',
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
