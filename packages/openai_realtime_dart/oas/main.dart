// ignore_for_file: avoid_print
import 'dart:io';

import 'package:openapi_spec/openapi_spec.dart';

/// Generates OpenAI Realtime Dart types from the OpenAPI spec.
/// Official spec: https://github.com/openai/openai-openapi/blob/master/openapi.yaml
void main() async {
  final spec = OpenApi.fromFile(source: 'oas/openai_spec_curated.yaml');
  await spec.generate(
    package: 'openai_realtime',
    destination: 'lib/src/schema/generated/',
    replace: true,
    schemaOptions: const SchemaGeneratorOptions(
      onSchemaUnionFactoryName: _onSchemaUnionFactoryName,
    ),
  );
  final res = await Process.run(
    'dart',
    ['run', 'build_runner', 'build', 'lib', '--delete-conflicting-outputs'],
  );
  print(res.stdout);
  print(res.stderr);
}

String? _onSchemaUnionFactoryName(
  final String union,
  final String unionSubclass,
) =>
    switch (unionSubclass) {
      'SessionToolChoiceEnumeration' => 'mode',
      'SessionConfigToolChoiceEnumeration' => 'mode',
      'ResponseConfigToolChoiceEnumeration' => 'mode',
      _ => null,
    };
