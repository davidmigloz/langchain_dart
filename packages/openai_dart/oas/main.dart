import 'dart:io';

import 'package:openapi_spec/openapi_spec.dart';

/// Generates Chroma API client Dart code from the OpenAPI spec.
/// Official spec: https://github.com/openai/openai-openapi/blob/master/openapi.yaml
void main() async {
  final spec = OpenApi.fromFile(source: 'oas/openapi_curated.yaml');
  await spec.generate(
    package: 'OpenAI',
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
