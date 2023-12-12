import 'dart:io';

import 'package:openapi_spec/openapi_spec.dart';

/// Generates Mistral AI API client Dart code from the OpenAPI spec.
/// https://docs.mistral.ai/api
void main() async {
  final spec = OpenApi.fromFile(source: 'oas/mistral_openapi_curated.yaml');

  await spec.generate(
    package: 'MistralAI',
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
) =>
    switch (unionSubclass) {
      // Chat Completion
      'ChatCompletionModelEnumeration' => 'model',
      'ChatCompletionModelString' => 'modelId',
      // Embeddings
      'EmbeddingModelEnumeration' => 'model',
      'EmbeddingModelString' => 'modelId',
      _ => null,
    };
