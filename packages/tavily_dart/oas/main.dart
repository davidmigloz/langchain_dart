import 'dart:io';

import 'package:openapi_spec/openapi_spec.dart';

/// Generates Tavily API client Dart code from the OpenAPI spec.
/// https://docs.tavily.com/docs/tavily-api/rest_api
void main() async {
  final spec = OpenApi.fromFile(source: 'oas/tavily_openapi.yaml');

  await spec.generate(
    package: 'Tavily',
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
