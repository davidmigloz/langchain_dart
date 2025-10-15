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
    schemaOptions: const SchemaGeneratorOptions(
      onSchemaUnionFactoryName: _onSchemaUnionFactoryName,
    ),
    clientOptions: const ClientGeneratorOptions(
      enabled: true,
    ),
  );

  await Process.run(
    'dart',
    ['run', 'build_runner', 'build', 'lib', '--delete-conflicting-outputs'],
  );
}

String? _onSchemaUnionFactoryName(
  final String union,
  final String unionSubclass,
) => switch (unionSubclass) {
  // Format field for chat completion
  'GenerateChatCompletionRequestFormatEnumeration' => 'json',
  'GenerateChatCompletionRequestFormatMapStringDynamic' => 'schema',
  // Format field for completion
  'GenerateCompletionRequestFormatEnumeration' => 'json',
  'GenerateCompletionRequestFormatMapStringDynamic' => 'schema',
  // Think field for chat completion
  'GenerateChatCompletionRequestThinkEnumeration' => 'level',
  // Think field for completion
  'GenerateCompletionRequestThinkEnumeration' => 'level',
  _ => null,
};
