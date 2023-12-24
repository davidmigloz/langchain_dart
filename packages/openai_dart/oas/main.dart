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
      'ChatCompletionUserMessageContentListChatCompletionMessageContentPart' =>
        'ChatCompletionMessageContentParts',
      _ => schemaName,
    };

String? _onSchemaUnionFactoryName(
  final String union,
  final String unionSubclass,
) =>
    switch (unionSubclass) {
      // Chat Completion
      'ChatCompletionModelEnumeration' => 'model',
      'ChatCompletionModelString' => 'modelId',
      'ChatCompletionSystemMessage' => 'system',
      'ChatCompletionUserMessage' => 'user',
      'ChatCompletionAssistantMessage' => 'assistant',
      'ChatCompletionToolMessage' => 'tool',
      'ChatCompletionFunctionMessage' => 'function',
      'ChatCompletionMessageContentParts' => 'parts',
      'ChatCompletionMessageContentPartText' => 'text',
      'ChatCompletionMessageContentPartImage' => 'image',
      'ChatCompletionToolChoiceOptionEnumeration' => 'mode',
      'ChatCompletionToolChoiceOptionChatCompletionNamedToolChoice' => 'tool',
      'ChatCompletionFunctionCallEnumeration' => 'mode',
      'ChatCompletionFunctionCallChatCompletionFunctionCallOption' =>
        'function',
      // Completion
      'CompletionModelEnumeration' => 'model',
      'CompletionModelString' => 'modelId',
      'CompletionPromptListInt' => 'tokens',
      'CompletionPromptListListInt' => 'listTokens',
      // Embeddings
      'EmbeddingModelEnumeration' => 'model',
      'EmbeddingModelString' => 'modelId',
      'EmbeddingVectorListDouble' => 'vector',
      'EmbeddingVectorString' => 'vectorBase64',
      'EmbeddingInputListInt' => 'tokens',
      'EmbeddingInputListListInt' => 'listTokens',
      // FineTuning
      'FineTuningModelEnumeration' => 'model',
      'FineTuningModelString' => 'modelId',
      'FineTuningNEpochsEnumeration' => 'mode',
      'FineTuningNEpochsInt' => 'number',
      // Images
      'CreateImageRequestModelEnumeration' => 'model',
      'CreateImageRequestModelString' => 'modelId',
      // Moderations
      'ModerationModelEnumeration' => 'model',
      'ModerationModelString' => 'modelId',
      // Assistant
      'MessageContentImageFileObject' => 'imageFile',
      'MessageContentTextObject' => 'text',
      'MessageContentTextAnnotationsFileCitationObject' => 'fileCitation',
      'MessageContentTextAnnotationsFilePathObject' => 'filePath',
      'RunStepDetailsToolCallsCodeObject' => 'codeInterpreter',
      'RunStepDetailsToolCallsRetrievalObject' => 'retrieval',
      'RunStepDetailsToolCallsFunctionObject' => 'function',
      'RunStepDetailsToolCallsCodeOutputLogsObject' => 'logs',
      'RunStepDetailsToolCallsCodeOutputImageObject' => 'image',
      'RunStepDetailsMessageCreationObject' => 'messageCreation',
      'RunStepDetailsToolCallsObject' => 'toolCalls',
      _ => null,
    };
