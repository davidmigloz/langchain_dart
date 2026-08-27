// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:firebase_ai/firebase_ai.dart' as f;
import 'package:langchain_core/chat_models.dart';

List<AIChatMessageContentBlock> firebasePartsToContentBlocks(
  final List<f.Part> parts, {
  required final String responseId,
}) => [
  for (final (index, part) in parts.indexed)
    _firebasePartToContentBlock(
      part,
      fallbackId: 'firebase:$responseId:0:$index',
      index: index,
    ),
];

String firebasePartsToLegacyContent(final List<f.Part> parts) => parts
    .map(
      (part) => switch (part) {
        final f.TextPart part => part.text,
        final f.InlineDataPart part => base64Encode(part.bytes),
        final f.FileData part => part.fileUri,
        f.Part() => '',
      },
    )
    .join('\n');

List<f.Part> aiMessageToFirebaseParts(final AIChatMessage message) => message
    .contentBlocks
    .map(_contentBlockToFirebasePart)
    .toList(growable: false);

AIChatMessageContentBlock _firebasePartToContentBlock(
  final f.Part part, {
  required final String fallbackId,
  required final int index,
}) {
  final rawPart = (part.toJson() as Map).cast<String, dynamic>();
  final providerData = <String, dynamic>{
    'firebase': {'part': rawPart},
  };
  final isMergeable =
      part is f.FunctionCall || rawPart['thoughtSignature'] == null;
  return switch (part) {
    final f.TextPart text when text.isThought ?? false =>
      AIChatMessageReasoningBlock(
        reasoning: text.text,
        id: fallbackId,
        index: index,
        isMergeable: isMergeable,
        providerData: providerData,
      ),
    final f.TextPart text => AIChatMessageTextBlock(
      text: text.text,
      id: fallbackId,
      index: index,
      isMergeable: isMergeable,
      providerData: providerData,
    ),
    final f.InlineDataPart media => AIChatMessageMediaBlock(
      data: base64Encode(media.bytes),
      mimeType: media.mimeType,
      id: fallbackId,
      index: index,
      isMergeable: isMergeable,
      providerData: providerData,
    ),
    final f.FileData file => AIChatMessageFileBlock(
      uri: file.fileUri,
      mimeType: file.mimeType,
      id: fallbackId,
      index: index,
      isMergeable: isMergeable,
      providerData: providerData,
    ),
    final f.FunctionCall call => AIChatMessageToolCall(
      id: call.id ?? fallbackId,
      index: index,
      isMergeable: isMergeable,
      name: call.name,
      argumentsRaw: jsonEncode(call.args),
      arguments: call.args.cast<String, dynamic>(),
      providerData: providerData,
    ),
    final f.FunctionResponse result => AIChatMessageServerToolResult(
      id: result.id ?? fallbackId,
      index: index,
      isMergeable: isMergeable,
      toolCallId: result.id ?? fallbackId,
      name: result.name,
      result: result.response,
      providerData: providerData,
    ),
    f.ExecutableCodePart() => AIChatMessageServerToolCall(
      id: fallbackId,
      index: index,
      isMergeable: isMergeable,
      name: 'codeExecution',
      argumentsRaw: jsonEncode(rawPart['executableCode']),
      arguments: _readMap(rawPart['executableCode']),
      providerData: providerData,
    ),
    f.CodeExecutionResultPart() => AIChatMessageServerToolResult(
      id: fallbackId,
      index: index,
      isMergeable: isMergeable,
      toolCallId: fallbackId,
      name: 'codeExecution',
      result: rawPart['codeExecutionResult'],
      providerData: providerData,
    ),
    final f.UnknownPart unknown => AIChatMessageNonStandardBlock(
      value: unknown.data,
      id: fallbackId,
      index: index,
      isMergeable: isMergeable,
      providerData: providerData,
    ),
  };
}

f.Part _contentBlockToFirebasePart(final AIChatMessageContentBlock block) {
  final rawPart = switch (block.providerData['firebase']) {
    {'part': final Map<Object?, Object?> value} =>
      value.cast<String, dynamic>(),
    _ => null,
  };
  return switch (block) {
    final AIChatMessageTextBlock text =>
      rawPart == null
          ? f.TextPart(text.text)
          : _firebaseRawPart({...rawPart, 'text': text.text}),
    final AIChatMessageReasoningBlock reasoning =>
      rawPart == null
          ? f.TextPart(reasoning.reasoning, isThought: true)
          : _firebaseRawPart({
              ...rawPart,
              'text': reasoning.reasoning,
              'thought': true,
            }),
    final AIChatMessageMediaBlock media =>
      rawPart == null
          ? f.InlineDataPart(media.mimeType ?? '', base64Decode(media.data))
          : _firebaseRawPart({
              ...rawPart,
              'inlineData': {
                ...?_readNullableMap(rawPart['inlineData']),
                if (media.mimeType != null) 'mimeType': media.mimeType,
                'data': media.data,
              },
            }),
    final AIChatMessageFileBlock file =>
      rawPart == null
          ? f.FileData(file.mimeType ?? '', file.uri)
          : _firebaseRawPart({
              ...rawPart,
              'file_data': {
                ...?_readNullableMap(rawPart['file_data']),
                if (file.mimeType != null) 'mime_type': file.mimeType,
                'file_uri': file.uri,
              },
            }),
    final AIChatMessageToolCall call =>
      rawPart == null
          ? f.FunctionCall(call.name, call.arguments, id: call.id)
          : _firebaseRawPart({
              ...rawPart,
              'functionCall': {
                ...?_readNullableMap(rawPart['functionCall']),
                'id': call.id,
                'name': call.name,
                'args': call.arguments,
              },
            }),
    AIChatMessageServerToolCall() ||
    AIChatMessageServerToolResult() ||
    AIChatMessageProviderMetadataBlock() => _rawFirebasePart(block, rawPart),
    final AIChatMessageNonStandardBlock nonStandard =>
      rawPart != null
          ? _firebaseRawPart(rawPart)
          : switch (nonStandard.value) {
              final Map<Object?, Object?> value => _firebaseRawPart(
                value.cast<String, dynamic>(),
              ),
              _ => f.UnknownPart({'value': nonStandard.value}),
            },
  };
}

f.Part _rawFirebasePart(
  final AIChatMessageContentBlock block,
  final Map<String, dynamic>? rawPart,
) {
  if (rawPart == null) {
    throw UnsupportedError(
      '${block.runtimeType} can only be replayed to Firebase when it contains '
      'providerData["firebase"]["part"]',
    );
  }
  return _firebaseRawPart(rawPart);
}

f.Part _firebaseRawPart(final Map<String, dynamic> rawPart) =>
    f.UnknownPart(rawPart.cast<String, Object?>());

Map<String, dynamic> _readMap(final Object? value) =>
    _readNullableMap(value) ?? const {};

Map<String, dynamic>? _readNullableMap(final Object? value) =>
    value is Map ? value.cast<String, dynamic>() : null;
