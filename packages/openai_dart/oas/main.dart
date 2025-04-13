// ignore_for_file: avoid_print
import 'dart:io';

import 'package:openapi_spec/openapi_spec.dart';

/// Generates OpenAI API client Dart code from the OpenAPI spec.
/// Official spec: https://github.com/openai/openai-python/blob/cacd374b850407b211d1f1e7740da0cf4e4d68d1/.stats.yml
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
  final res = await Process.run(
    'dart',
    ['run', 'build_runner', 'build', 'lib', '--delete-conflicting-outputs'],
  );
  print(res.stdout);
  print(res.stderr);
}

String? _onSchemaName(final String schemaName) => switch (schemaName) {
      'ChatCompletionUserMessageContentListChatCompletionMessageContentPart' =>
        'ChatCompletionMessageContentParts',
  'ChatCompletionDeveloperMessageContentListChatCompletionMessageContentPart' =>
  'ChatCompletionDeveloperMessageContentParts',
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
      'ChatCompletionDeveloperMessage' => 'developer',
      'ChatCompletionSystemMessage' => 'system',
      'ChatCompletionUserMessage' => 'user',
      'ChatCompletionAssistantMessage' => 'assistant',
      'ChatCompletionToolMessage' => 'tool',
      'ChatCompletionFunctionMessage' => 'function',
      'ChatCompletionMessageContentParts' => 'parts',
      'ChatCompletionMessageContentPartText' => 'text',
      'ChatCompletionMessageContentPartImage' => 'image',
      'ChatCompletionMessageContentPartAudio' => 'audio',
      'ChatCompletionMessageContentPartRefusal' => 'refusal',
      'ChatCompletionDeveloperMessageContentParts' => 'parts',
      'ChatCompletionDeveloperMessageContentString' => 'text',
      'ChatCompletionToolChoiceOptionEnumeration' => 'mode',
      'ChatCompletionToolChoiceOptionChatCompletionNamedToolChoice' => 'tool',
      'ChatCompletionFunctionCallEnumeration' => 'mode',
      'ChatCompletionFunctionCallChatCompletionFunctionCallOption' =>
        'function',
      'PredictionContentContentListChatCompletionMessageContentPartText' =>
        'textParts',
      'PredictionContentContentString' => 'text',
      'ResponseFormatText' => 'text',
      'ResponseFormatJsonObject' => 'jsonObject',
      'ResponseFormatJsonSchema' => 'jsonSchema',
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
      'ModerationInputObjectImageUrl' => 'imageUrl',
      'ModerationInputObjectText' => 'text',
      // Assistant
      'AssistantModelEnumeration' => 'model',
      'AssistantModelString' => 'modelId',
      'AssistantObjectResponseFormatEnumeration' => 'mode',
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
      'MessageContentRefusalObject' => 'refusal',
      'MessageDeltaContentImageFileObject' => 'imageFile',
      'MessageDeltaContentRefusalObject' => 'refusal',
      'MessageDeltaContentImageUrlObject' => 'imageUrl',
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
