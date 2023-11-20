import 'dart:io';

import 'package:openapi_spec/openapi_spec.dart';

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
