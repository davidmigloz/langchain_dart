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
      'AssistantModelEnumeration' => 'model',
      'AssistantModelString' => 'modelId',
      'CreateAssistantRequestResponseFormatAssistantsResponseFormat' =>
        'format',
      'CreateAssistantRequestResponseFormatEnumeration' => 'mode',
      'CreateMessageRequestContentListMessageContent' => 'parts',
      'CreateMessageRequestContentString' => 'text',
      'CreateRunRequestModelEnumeration' => 'model',
      'CreateRunRequestModelString' => 'modelId',
      'CreateRunRequestResponseFormatAssistantsResponseFormat' => 'format',
      'CreateRunRequestResponseFormatEnumeration' => 'mode',
      'CreateRunRequestToolChoiceAssistantsNamedToolChoice' => 'tool',
      'CreateRunRequestToolChoiceEnumeration' => 'mode',
      'CreateThreadAndRunRequestResponseFormatAssistantsResponseFormat' =>
        'format',
      'CreateThreadAndRunRequestResponseFormatEnumeration' => 'mode',
      'CreateThreadAndRunRequestToolChoiceAssistantsNamedToolChoice' => 'tool',
      'CreateThreadAndRunRequestToolChoiceEnumeration' => 'mode',
      'MessageContentImageFileObject' => 'imageFile',
      'MessageContentImageUrlObject' => 'imageUrl',
      'MessageContentTextAnnotationsFileCitationObject' => 'fileCitation',
      'MessageContentTextAnnotationsFilePathObject' => 'filePath',
      'MessageContentTextObject' => 'text',
      'MessageDeltaContentImageFileObject' => 'imageFile',
      'MessageDeltaContentTextAnnotationsFileCitationObject' => 'fileCitation',
      'MessageDeltaContentTextAnnotationsFilePathObject' => 'filePath',
      'MessageDeltaContentTextObject' => 'text',
      'ModifyAssistantRequestResponseFormatAssistantsResponseFormat' =>
        'format',
      'ModifyAssistantRequestResponseFormatEnumeration' => 'mode',
      'RunModelEnumeration' => 'model',
      'RunModelString' => 'modelId',
      'RunObjectResponseFormatAssistantsResponseFormat' => 'format',
      'RunObjectResponseFormatEnumeration' => 'mode',
      'RunObjectToolChoiceAssistantsNamedToolChoice' => 'tool',
      'RunObjectToolChoiceEnumeration' => 'mode',
      'RunStepDeltaStepDetailsMessageCreationObject' => 'messageCreation',
      'RunStepDeltaStepDetailsToolCallsCodeObject' => 'codeInterpreter',
      'RunStepDeltaStepDetailsToolCallsCodeOutputImageObject' => 'image',
      'RunStepDeltaStepDetailsToolCallsCodeOutputLogsObject' => 'logs',
      'RunStepDeltaStepDetailsToolCallsFileSearchObject' => 'fileSearch',
      'RunStepDeltaStepDetailsToolCallsFunctionObject' => 'function',
      'RunStepDeltaStepDetailsToolCallsObject' => 'toolCalls',
      'RunStepDetailsMessageCreationObject' => 'messageCreation',
      'RunStepDetailsToolCallsCodeObject' => 'codeInterpreter',
      'RunStepDetailsToolCallsCodeOutputImageObject' => 'image',
      'RunStepDetailsToolCallsCodeOutputLogsObject' => 'logs',
      'RunStepDetailsToolCallsFileSearchObject' => 'fileSearch',
      'RunStepDetailsToolCallsFunctionObject' => 'function',
      'RunStepDetailsToolCallsObject' => 'toolCalls',
      'ThreadAndRunModelEnumeration' => 'model',
      'ThreadAndRunModelString' => 'modelId',
      _ => null,
    };
