// ignore_for_file: deprecated_member_use, public_member_api_docs
import 'dart:convert';

import 'package:googleai_dart/googleai_dart.dart' as g;
import 'package:langchain_core/chat_models.dart';

List<AIChatMessageContentBlock> googlePartsToContentBlocks(
  final List<g.Part> parts, {
  required final String responseId,
  final int candidateIndex = 0,
}) => [
  for (final (partIndex, part) in parts.indexed)
    _googlePartToContentBlock(
      part,
      fallbackId: 'google:$responseId:$candidateIndex:$partIndex',
      index: partIndex,
    ),
];

List<g.Part> aiMessageToGoogleParts(final AIChatMessage message) =>
    message.content.map(_contentBlockToGooglePart).toList(growable: false);

AIChatMessageContentBlock _googlePartToContentBlock(
  final g.Part part, {
  required final String fallbackId,
  required final int index,
}) {
  final providerData = _googleProviderData(part);
  final isMergeable =
      part is g.FunctionCallPart || part.thoughtSignature == null;
  return switch (part) {
    final g.TextPart text when text.thought ?? false =>
      AIChatMessageReasoningBlock(
        reasoning: text.text,
        id: fallbackId,
        index: index,
        isMergeable: isMergeable,
        providerData: providerData,
      ),
    final g.TextPart text => AIChatMessageTextBlock(
      text: text.text,
      id: fallbackId,
      index: index,
      isMergeable: isMergeable,
      providerData: providerData,
    ),
    final g.InlineDataPart media => AIChatMessageMediaBlock(
      data: media.inlineData.data,
      mimeType: media.inlineData.mimeType,
      id: fallbackId,
      index: index,
      isMergeable: isMergeable,
      providerData: providerData,
    ),
    final g.FileDataPart file => AIChatMessageFileBlock(
      uri: file.fileData.fileUri,
      mimeType: file.fileData.mimeType,
      id: fallbackId,
      index: index,
      isMergeable: isMergeable,
      providerData: providerData,
    ),
    final g.FunctionCallPart call => AIChatMessageToolCall(
      id: call.functionCall.id ?? fallbackId,
      index: index,
      isMergeable: isMergeable,
      name: call.functionCall.name,
      argumentsRaw: jsonEncode(call.functionCall.args ?? const {}),
      arguments: call.functionCall.args ?? const {},
      providerData: providerData,
    ),
    final g.FunctionResponsePart result => AIChatMessageServerToolResult(
      id: result.functionResponse.id ?? fallbackId,
      index: index,
      isMergeable: isMergeable,
      toolCallId: result.functionResponse.id ?? fallbackId,
      name: result.functionResponse.name,
      result: result.functionResponse.response,
      providerData: providerData,
    ),
    final g.ExecutableCodePart code => AIChatMessageServerToolCall(
      id: code.executableCode.id ?? fallbackId,
      index: index,
      isMergeable: isMergeable,
      name: 'codeExecution',
      argumentsRaw: jsonEncode(code.executableCode.toJson()),
      arguments: code.executableCode.toJson(),
      providerData: providerData,
    ),
    final g.CodeExecutionResultPart result => AIChatMessageServerToolResult(
      id: result.codeExecutionResult.id ?? fallbackId,
      index: index,
      isMergeable: isMergeable,
      toolCallId: result.codeExecutionResult.id ?? fallbackId,
      name: 'codeExecution',
      result: result.codeExecutionResult.toJson(),
      providerData: providerData,
    ),
    final g.ToolCallPart call => AIChatMessageServerToolCall(
      id: call.toolCall.id ?? fallbackId,
      index: index,
      isMergeable: isMergeable,
      name: call.toolCall.toolName ?? call.toolCall.toolType.name,
      argumentsRaw: jsonEncode(call.toolCall.args ?? const {}),
      arguments: call.toolCall.args ?? const {},
      providerData: providerData,
    ),
    final g.ToolResponsePart result => AIChatMessageServerToolResult(
      id: result.toolResponse.id ?? fallbackId,
      index: index,
      isMergeable: isMergeable,
      toolCallId: result.toolResponse.id ?? fallbackId,
      result: result.toolResponse.response,
      providerData: providerData,
    ),
    g.MetadataPart() => AIChatMessageProviderMetadataBlock(
      id: fallbackId,
      index: index,
      isMergeable: isMergeable,
      providerData: providerData,
    ),
    final g.UnknownPart unknown => AIChatMessageNonStandardBlock(
      value: unknown.rawJson,
      id: fallbackId,
      index: index,
      isMergeable: isMergeable,
      providerData: providerData,
    ),
    // Deprecated metadata-only Parts are accepted for source compatibility.
    g.VideoMetadataPart() ||
    g.ThoughtPart() ||
    g.ThoughtSignaturePart() ||
    g.PartMetadataPart() => AIChatMessageProviderMetadataBlock(
      id: fallbackId,
      index: index,
      isMergeable: isMergeable,
      providerData: providerData,
    ),
  };
}

Map<String, dynamic> _googleProviderData(final g.Part part) => {
  'google': {
    'part': part.toJson(),
    if (part.thoughtSignature != null)
      'thoughtSignature': base64Encode(part.thoughtSignature!),
  },
};

g.Part _contentBlockToGooglePart(final AIChatMessageContentBlock block) {
  final rawPart = switch (block.providerData['google']) {
    {'part': final Map<Object?, Object?> part} => part.cast<String, dynamic>(),
    _ => null,
  };
  return switch (block) {
    final AIChatMessageTextBlock text => g.Part.fromJson({
      ...?rawPart,
      'text': text.text,
    }),
    final AIChatMessageReasoningBlock reasoning => g.Part.fromJson({
      ...?rawPart,
      'text': reasoning.reasoning,
      'thought': true,
    }),
    final AIChatMessageMediaBlock media => g.Part.fromJson({
      ...?rawPart,
      'inlineData': {
        ...?_nestedMap(rawPart?['inlineData']),
        if (media.mimeType != null) 'mimeType': media.mimeType,
        'data': media.data,
      },
    }),
    final AIChatMessageFileBlock file => g.Part.fromJson({
      ...?rawPart,
      'fileData': {
        ...?_nestedMap(rawPart?['fileData']),
        if (file.mimeType != null) 'mimeType': file.mimeType,
        'fileUri': file.uri,
      },
    }),
    final AIChatMessageToolCall call => g.Part.fromJson({
      ...?rawPart,
      'functionCall': {
        ...?_nestedMap(rawPart?['functionCall']),
        if (call.id.isNotEmpty) 'id': call.id,
        'name': call.name,
        'args': call.arguments,
      },
      if (rawPart == null) ..._legacyThoughtSignature(call.providerData),
    }),
    AIChatMessageServerToolCall() ||
    AIChatMessageServerToolResult() ||
    AIChatMessageProviderMetadataBlock() => _rawGooglePart(block, rawPart),
    final AIChatMessageNonStandardBlock nonStandard =>
      rawPart != null
          ? g.Part.fromJson(rawPart)
          : switch (nonStandard.value) {
              final Map<Object?, Object?> value => g.Part.fromJson(
                value.cast<String, dynamic>(),
              ),
              _ => g.UnknownPart({'value': nonStandard.value}),
            },
  };
}

g.Part _rawGooglePart(
  final AIChatMessageContentBlock block,
  final Map<String, dynamic>? rawPart,
) {
  if (rawPart == null) {
    throw UnsupportedError(
      '${block.runtimeType} can only be replayed to Google when it contains '
      'providerData["google"]["part"]',
    );
  }
  return g.Part.fromJson(rawPart);
}

Map<String, dynamic>? _nestedMap(final Object? value) =>
    value is Map ? value.cast<String, dynamic>() : null;

Map<String, dynamic> _legacyThoughtSignature(
  final Map<String, dynamic> providerData,
) => switch (providerData['google']) {
  {'thoughtSignature': final String signature} => {
    'thoughtSignature': signature,
  },
  _ => const {},
};
