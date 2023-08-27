import 'package:openapi_spec/openapi_spec.dart';

/// Generates Chroma API client Dart code from the OpenAPI spec.
void main() async {
  final spec = OpenApi.fromFile(source: 'oas/openapi.json');
  await spec.generate(
    package: 'chroma_api',
    destination: 'lib/src/generated/',
    replace: true,
    clientOptions: const ClientGeneratorOptions(
      enabled: true,
    ),
  );
}
