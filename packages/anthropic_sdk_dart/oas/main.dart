import 'dart:io';

import 'package:openapi_spec/openapi_spec.dart';

/// Generates Anthropic API client Dart code from the OpenAPI spec.
/// https://docs.anthropic.com/en/api
void main() async {
  final spec = OpenApi.fromFile(source: 'oas/anthropic_openapi_curated.yaml');

  await spec.generate(
    package: 'Anthropic',
    destination: 'lib/src/generated/',
    replace: true,
    schemaOptions: const SchemaGeneratorOptions(
      onSchemaName: _onSchemaName,
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

String? _onSchemaName(final String schemaName) => switch (schemaName) {
  'ModelEnumeration' => 'ModelCatalog',
  'ModelString' => 'ModelId',
  'MessageContentString' => 'MessageContentText',
  'MessageContentListBlock' => 'MessageContentBlocks',
  'ToolResultBlockContentListBlock' => 'ToolResultBlockContentBlocks',
  'ToolResultBlockContentString' => 'ToolResultBlockContentText',
  'CreateMessageRequestSystemString' => 'SystemMessageContentText',
  'CreateMessageRequestSystemListBlock' => 'SystemMessageContentBlocks',
  _ => schemaName,
};

String? _onSchemaUnionFactoryName(
  final String union,
  final String unionSubclass,
) => switch (unionSubclass) {
  'ModelCatalog' => 'model',
  'ModelId' => 'modelId',
  'MessageContentText' => 'text',
  'MessageContentBlocks' => 'blocks',
  'SystemMessageContentText' => 'text',
  'SystemMessageContentBlocks' => 'blocks',
  'ToolResultBlockContentBlocks' => 'blocks',
  'ToolResultBlockContentText' => 'text',
  'TextBlockDelta' => 'textDelta',
  'InputJsonBlockDelta' => 'inputJsonDelta',
  'MessageStartEvent' => 'messageStart',
  'MessageDeltaEvent' => 'messageDelta',
  'MessageStopEvent' => 'messageStop',
  'ContentBlockStartEvent' => 'contentBlockStart',
  'ContentBlockDeltaEvent' => 'contentBlockDelta',
  'ContentBlockStopEvent' => 'contentBlockStop',
  'PingEvent' => 'ping',
  'ErrorEvent' => 'error',
  _ => null,
};
