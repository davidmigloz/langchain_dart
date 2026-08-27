import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

/// {@template ai_chat_message_content_block}
/// An ordered content block produced by a chat model.
///
/// A block can be correlated across streaming chunks through either a stable
/// provider [id] or an explicit provider [index]. Provider-specific values must
/// be nested under a provider namespace in [providerData].
/// {@endtemplate}
@immutable
sealed class AIChatMessageContentBlock {
  /// {@macro ai_chat_message_content_block}
  const AIChatMessageContentBlock({
    this.id = '',
    this.index,
    this.isMergeable = true,
    this.providerData = const {},
  });

  /// Stable provider identifier for this block, when available.
  final String id;

  /// Position assigned to this block by the provider's streaming protocol.
  final int? index;

  /// Whether later streaming chunks may be merged into this block.
  ///
  /// Set this to `false` when the provider requires the exact boundary of a
  /// completed content part to be retained.
  final bool isMergeable;

  /// Provider-specific data, nested under a provider namespace.
  final Map<String, dynamic> providerData;

  /// A stable identity that can be used to merge streamed chunks.
  String? get streamIdentity => id.isNotEmpty
      ? 'id:$id'
      : index != null
      ? 'index:$index'
      : null;

  /// Converts this block to a map.
  Map<String, dynamic> toMap();

  /// Converts a map to a content block.
  factory AIChatMessageContentBlock.fromMap(Map<String, dynamic> map) =>
      switch (map['type']) {
        'text' => AIChatMessageTextBlock.fromMap(map),
        'reasoning' => AIChatMessageReasoningBlock.fromMap(map),
        'media' => AIChatMessageMediaBlock.fromMap(map),
        'file' => AIChatMessageFileBlock.fromMap(map),
        'toolCall' => AIChatMessageToolCall.fromMap(map),
        'serverToolCall' => AIChatMessageServerToolCall.fromMap(map),
        'serverToolResult' => AIChatMessageServerToolResult.fromMap(map),
        'providerMetadata' => AIChatMessageProviderMetadataBlock.fromMap(map),
        'nonStandard' => AIChatMessageNonStandardBlock.fromMap(map),
        _ => throw ArgumentError('Unknown AI content block: ${map['type']}'),
      };

  /// Whether [other] is a chunk of the same logical streaming block.
  bool canMerge(final AIChatMessageContentBlock other) {
    if (!isMergeable || !other.isMergeable) return false;
    if (runtimeType != other.runtimeType) return false;
    if (id.isNotEmpty && other.id.isNotEmpty) {
      return id == other.id;
    }
    return index != null && index == other.index;
  }

  /// Merges a later streaming chunk into this block.
  AIChatMessageContentBlock concat(final AIChatMessageContentBlock other) {
    if (!canMerge(other)) {
      throw ArgumentError('Cannot merge unrelated content blocks');
    }
    return switch ((this, other)) {
      (final AIChatMessageTextBlock first, final AIChatMessageTextBlock next) =>
        AIChatMessageTextBlock(
          text: first.text + next.text,
          id: _mergedId(first, next),
          index: next.index ?? first.index,
          providerData: mergeProviderData(
            first.providerData,
            next.providerData,
          ),
        ),
      (
        final AIChatMessageReasoningBlock first,
        final AIChatMessageReasoningBlock next,
      ) =>
        AIChatMessageReasoningBlock(
          reasoning: first.reasoning + next.reasoning,
          id: _mergedId(first, next),
          index: next.index ?? first.index,
          providerData: mergeProviderData(
            first.providerData,
            next.providerData,
          ),
        ),
      (
        final AIChatMessageMediaBlock first,
        final AIChatMessageMediaBlock next,
      ) =>
        AIChatMessageMediaBlock(
          data: first.data + next.data,
          mimeType: next.mimeType ?? first.mimeType,
          id: _mergedId(first, next),
          index: next.index ?? first.index,
          providerData: mergeProviderData(
            first.providerData,
            next.providerData,
          ),
        ),
      (final AIChatMessageFileBlock first, final AIChatMessageFileBlock next) =>
        AIChatMessageFileBlock(
          uri: next.uri.isNotEmpty ? next.uri : first.uri,
          name: next.name ?? first.name,
          mimeType: next.mimeType ?? first.mimeType,
          id: _mergedId(first, next),
          index: next.index ?? first.index,
          providerData: mergeProviderData(
            first.providerData,
            next.providerData,
          ),
        ),
      (final AIChatMessageToolCall first, final AIChatMessageToolCall next) =>
        AIChatMessageToolCall(
          id: _mergedToolCallId(first, next),
          index: next.index ?? first.index,
          name: first.name + next.name,
          argumentsRaw: first.argumentsRaw + next.argumentsRaw,
          arguments: _mergeToolArguments(first, next),
          providerData: mergeProviderData(
            first.providerData,
            next.providerData,
          ),
        ),
      (
        final AIChatMessageServerToolCall first,
        final AIChatMessageServerToolCall next,
      ) =>
        AIChatMessageServerToolCall(
          id: _mergedId(first, next),
          index: next.index ?? first.index,
          name: first.name + next.name,
          argumentsRaw: first.argumentsRaw + next.argumentsRaw,
          arguments: _mergeServerToolArguments(first, next),
          providerData: mergeProviderData(
            first.providerData,
            next.providerData,
          ),
        ),
      (
        final AIChatMessageServerToolResult first,
        final AIChatMessageServerToolResult next,
      ) =>
        AIChatMessageServerToolResult(
          id: _mergedId(first, next),
          index: next.index ?? first.index,
          toolCallId: next.toolCallId.isNotEmpty
              ? next.toolCallId
              : first.toolCallId,
          name: next.name ?? first.name,
          result: _mergeValues(first.result, next.result),
          providerData: mergeProviderData(
            first.providerData,
            next.providerData,
          ),
        ),
      (
        final AIChatMessageProviderMetadataBlock first,
        final AIChatMessageProviderMetadataBlock next,
      ) =>
        AIChatMessageProviderMetadataBlock(
          id: _mergedId(first, next),
          index: next.index ?? first.index,
          providerData: mergeProviderData(
            first.providerData,
            next.providerData,
          ),
        ),
      (
        final AIChatMessageNonStandardBlock first,
        final AIChatMessageNonStandardBlock next,
      ) =>
        AIChatMessageNonStandardBlock(
          value: _mergeValues(first.value, next.value),
          id: _mergedId(first, next),
          index: next.index ?? first.index,
          providerData: mergeProviderData(
            first.providerData,
            next.providerData,
          ),
        ),
      _ => throw StateError('Unreachable content-block merge'),
    };
  }
}

/// A visible text block.
@immutable
final class AIChatMessageTextBlock extends AIChatMessageContentBlock {
  /// Creates a visible text block.
  const AIChatMessageTextBlock({
    required this.text,
    super.id,
    super.index,
    super.isMergeable,
    super.providerData,
  });

  /// The visible text.
  final String text;

  /// Converts a map to a text block.
  factory AIChatMessageTextBlock.fromMap(Map<String, dynamic> map) =>
      AIChatMessageTextBlock(
        text: map['text'] as String,
        id: _readId(map),
        index: map['index'] as int?,
        isMergeable: _readIsMergeable(map),
        providerData: _readProviderData(map),
      );

  @override
  Map<String, dynamic> toMap() => {
    'type': 'text',
    'text': text,
    ..._metadataMap(this),
  };

  @override
  bool operator ==(covariant AIChatMessageTextBlock other) =>
      identical(this, other) ||
      text == other.text && _metadataEquals(this, other);

  @override
  int get hashCode => Object.hash(text, _metadataHash(this));
}

/// A reasoning or thinking block that is not visible model output.
@immutable
final class AIChatMessageReasoningBlock extends AIChatMessageContentBlock {
  /// Creates a reasoning block.
  const AIChatMessageReasoningBlock({
    required this.reasoning,
    super.id,
    super.index,
    super.isMergeable,
    super.providerData,
  });

  /// The reasoning text.
  final String reasoning;

  /// Converts a map to a reasoning block.
  factory AIChatMessageReasoningBlock.fromMap(Map<String, dynamic> map) =>
      AIChatMessageReasoningBlock(
        reasoning: map['reasoning'] as String,
        id: _readId(map),
        index: map['index'] as int?,
        isMergeable: _readIsMergeable(map),
        providerData: _readProviderData(map),
      );

  @override
  Map<String, dynamic> toMap() => {
    'type': 'reasoning',
    'reasoning': reasoning,
    ..._metadataMap(this),
  };

  @override
  bool operator ==(covariant AIChatMessageReasoningBlock other) =>
      identical(this, other) ||
      reasoning == other.reasoning && _metadataEquals(this, other);

  @override
  int get hashCode => Object.hash(reasoning, _metadataHash(this));
}

/// An inline media block.
@immutable
final class AIChatMessageMediaBlock extends AIChatMessageContentBlock {
  /// Creates an inline media block.
  const AIChatMessageMediaBlock({
    required this.data,
    this.mimeType,
    super.id,
    super.index,
    super.isMergeable,
    super.providerData,
  });

  /// The inline media data.
  final String data;

  /// The media MIME type, when known.
  final String? mimeType;

  /// Converts a map to a media block.
  factory AIChatMessageMediaBlock.fromMap(Map<String, dynamic> map) =>
      AIChatMessageMediaBlock(
        data: map['data'] as String,
        mimeType: map['mimeType'] as String?,
        id: _readId(map),
        index: map['index'] as int?,
        isMergeable: _readIsMergeable(map),
        providerData: _readProviderData(map),
      );

  @override
  Map<String, dynamic> toMap() => {
    'type': 'media',
    'data': data,
    if (mimeType != null) 'mimeType': mimeType,
    ..._metadataMap(this),
  };

  @override
  bool operator ==(covariant AIChatMessageMediaBlock other) =>
      identical(this, other) ||
      data == other.data &&
          mimeType == other.mimeType &&
          _metadataEquals(this, other);

  @override
  int get hashCode => Object.hash(data, mimeType, _metadataHash(this));
}

/// A provider-hosted file block.
@immutable
final class AIChatMessageFileBlock extends AIChatMessageContentBlock {
  /// Creates a file block.
  const AIChatMessageFileBlock({
    required this.uri,
    this.name,
    this.mimeType,
    super.id,
    super.index,
    super.isMergeable,
    super.providerData,
  });

  /// URI that identifies the file.
  final String uri;

  /// Optional file name.
  final String? name;

  /// Optional file MIME type.
  final String? mimeType;

  /// Converts a map to a file block.
  factory AIChatMessageFileBlock.fromMap(Map<String, dynamic> map) =>
      AIChatMessageFileBlock(
        uri: map['uri'] as String,
        name: map['name'] as String?,
        mimeType: map['mimeType'] as String?,
        id: _readId(map),
        index: map['index'] as int?,
        isMergeable: _readIsMergeable(map),
        providerData: _readProviderData(map),
      );

  @override
  Map<String, dynamic> toMap() => {
    'type': 'file',
    'uri': uri,
    if (name != null) 'name': name,
    if (mimeType != null) 'mimeType': mimeType,
    ..._metadataMap(this),
  };

  @override
  bool operator ==(covariant AIChatMessageFileBlock other) =>
      identical(this, other) ||
      uri == other.uri &&
          name == other.name &&
          mimeType == other.mimeType &&
          _metadataEquals(this, other);

  @override
  int get hashCode => Object.hash(uri, name, mimeType, _metadataHash(this));
}

/// {@template ai_chat_message_tool_call}
/// A client-defined tool that the model wants to call.
/// {@endtemplate}
@immutable
final class AIChatMessageToolCall extends AIChatMessageContentBlock {
  /// {@macro ai_chat_message_tool_call}
  const AIChatMessageToolCall({
    required super.id,
    required this.name,
    required this.argumentsRaw,
    required this.arguments,
    super.index,
    super.isMergeable,
    super.providerData,
  });

  /// The name of the tool to call.
  final String name;

  /// The raw arguments JSON string (needed to parse streaming responses).
  final String argumentsRaw;

  /// The arguments to pass to the tool in JSON Map format.
  final Map<String, dynamic> arguments;

  /// Converts a map to a tool-call block.
  factory AIChatMessageToolCall.fromMap(Map<String, dynamic> map) =>
      AIChatMessageToolCall(
        id: _readId(map),
        name: map['name'] as String,
        argumentsRaw: map['argumentsRaw'] as String,
        arguments: _readMap(map['arguments']),
        index: map['index'] as int?,
        isMergeable: _readIsMergeable(map),
        providerData: _readProviderData(map),
      );

  @override
  Map<String, dynamic> toMap() => {
    'type': 'toolCall',
    'id': id,
    'name': name,
    'argumentsRaw': argumentsRaw,
    'arguments': arguments,
    'providerData': providerData,
    if (index != null) 'index': index,
    if (!isMergeable) 'isMergeable': false,
  };

  @override
  bool operator ==(covariant AIChatMessageToolCall other) {
    const deepEquals = DeepCollectionEquality();
    return identical(this, other) ||
        id == other.id &&
            index == other.index &&
            isMergeable == other.isMergeable &&
            name == other.name &&
            argumentsRaw == other.argumentsRaw &&
            deepEquals.equals(arguments, other.arguments) &&
            deepEquals.equals(providerData, other.providerData);
  }

  @override
  int get hashCode {
    const deepEquals = DeepCollectionEquality();
    return Object.hash(
      id,
      index,
      isMergeable,
      name,
      argumentsRaw,
      deepEquals.hash(arguments),
      deepEquals.hash(providerData),
    );
  }

  @override
  String toString() =>
      'AIChatMessageToolCall(id: $id, index: $index, name: $name, '
      'argumentsRaw: $argumentsRaw, arguments: $arguments, '
      'providerData: $providerData)';
}

/// A provider-owned server tool invocation.
@immutable
final class AIChatMessageServerToolCall extends AIChatMessageContentBlock {
  /// Creates a server tool-call block.
  const AIChatMessageServerToolCall({
    required super.id,
    required this.name,
    required this.argumentsRaw,
    required this.arguments,
    super.index,
    super.isMergeable,
    super.providerData,
  });

  /// The server tool name.
  final String name;

  /// The raw arguments JSON string.
  final String argumentsRaw;

  /// The parsed arguments.
  final Map<String, dynamic> arguments;

  /// Converts a map to a server tool-call block.
  factory AIChatMessageServerToolCall.fromMap(Map<String, dynamic> map) =>
      AIChatMessageServerToolCall(
        id: _readId(map),
        name: map['name'] as String,
        argumentsRaw: map['argumentsRaw'] as String,
        arguments: _readMap(map['arguments']),
        index: map['index'] as int?,
        isMergeable: _readIsMergeable(map),
        providerData: _readProviderData(map),
      );

  @override
  Map<String, dynamic> toMap() => {
    'type': 'serverToolCall',
    'name': name,
    'argumentsRaw': argumentsRaw,
    'arguments': arguments,
    ..._metadataMap(this),
  };

  @override
  bool operator ==(covariant AIChatMessageServerToolCall other) {
    const deepEquals = DeepCollectionEquality();
    return identical(this, other) ||
        name == other.name &&
            argumentsRaw == other.argumentsRaw &&
            deepEquals.equals(arguments, other.arguments) &&
            _metadataEquals(this, other);
  }

  @override
  int get hashCode {
    const deepEquals = DeepCollectionEquality();
    return Object.hash(
      name,
      argumentsRaw,
      deepEquals.hash(arguments),
      _metadataHash(this),
    );
  }
}

/// The result of a provider-owned server tool invocation.
@immutable
final class AIChatMessageServerToolResult extends AIChatMessageContentBlock {
  /// Creates a server tool-result block.
  const AIChatMessageServerToolResult({
    required this.toolCallId,
    required this.result,
    this.name,
    super.id,
    super.index,
    super.isMergeable,
    super.providerData,
  });

  /// Identifier of the corresponding server tool call.
  final String toolCallId;

  /// Optional server tool name.
  final String? name;

  /// Provider-native result payload.
  final Object? result;

  /// Converts a map to a server tool-result block.
  factory AIChatMessageServerToolResult.fromMap(Map<String, dynamic> map) =>
      AIChatMessageServerToolResult(
        toolCallId: map['toolCallId'] as String,
        name: map['name'] as String?,
        result: map['result'],
        id: _readId(map),
        index: map['index'] as int?,
        isMergeable: _readIsMergeable(map),
        providerData: _readProviderData(map),
      );

  @override
  Map<String, dynamic> toMap() => {
    'type': 'serverToolResult',
    'toolCallId': toolCallId,
    if (name != null) 'name': name,
    'result': result,
    ..._metadataMap(this),
  };

  @override
  bool operator ==(covariant AIChatMessageServerToolResult other) {
    const deepEquals = DeepCollectionEquality();
    return identical(this, other) ||
        toolCallId == other.toolCallId &&
            name == other.name &&
            deepEquals.equals(result, other.result) &&
            _metadataEquals(this, other);
  }

  @override
  int get hashCode {
    const deepEquals = DeepCollectionEquality();
    return Object.hash(
      toolCallId,
      name,
      deepEquals.hash(result),
      _metadataHash(this),
    );
  }
}

/// A metadata-only provider content block.
@immutable
final class AIChatMessageProviderMetadataBlock
    extends AIChatMessageContentBlock {
  /// Creates a provider metadata block.
  const AIChatMessageProviderMetadataBlock({
    super.id,
    super.index,
    super.isMergeable,
    required super.providerData,
  });

  /// Converts a map to a provider metadata block.
  factory AIChatMessageProviderMetadataBlock.fromMap(
    Map<String, dynamic> map,
  ) => AIChatMessageProviderMetadataBlock(
    id: _readId(map),
    index: map['index'] as int?,
    isMergeable: _readIsMergeable(map),
    providerData: _readProviderData(map),
  );

  @override
  Map<String, dynamic> toMap() => {
    'type': 'providerMetadata',
    ..._metadataMap(this),
  };

  @override
  bool operator ==(covariant AIChatMessageProviderMetadataBlock other) =>
      identical(this, other) || _metadataEquals(this, other);

  @override
  int get hashCode => _metadataHash(this);
}

/// A provider payload not represented by a standard content block.
@immutable
final class AIChatMessageNonStandardBlock extends AIChatMessageContentBlock {
  /// Creates a non-standard provider payload block.
  const AIChatMessageNonStandardBlock({
    required this.value,
    super.id,
    super.index,
    super.isMergeable,
    super.providerData,
  });

  /// The preserved provider-native payload.
  final Object? value;

  /// Converts a map to a non-standard block.
  factory AIChatMessageNonStandardBlock.fromMap(Map<String, dynamic> map) =>
      AIChatMessageNonStandardBlock(
        value: map['value'],
        id: _readId(map),
        index: map['index'] as int?,
        isMergeable: _readIsMergeable(map),
        providerData: _readProviderData(map),
      );

  @override
  Map<String, dynamic> toMap() => {
    'type': 'nonStandard',
    'value': value,
    ..._metadataMap(this),
  };

  @override
  bool operator ==(covariant AIChatMessageNonStandardBlock other) {
    const deepEquals = DeepCollectionEquality();
    return identical(this, other) ||
        deepEquals.equals(value, other.value) && _metadataEquals(this, other);
  }

  @override
  int get hashCode {
    const deepEquals = DeepCollectionEquality();
    return Object.hash(deepEquals.hash(value), _metadataHash(this));
  }
}

/// Deeply merges namespaced provider data, with later values taking priority.
Map<String, dynamic> mergeProviderData(
  final Map<String, dynamic> first,
  final Map<String, dynamic> second,
) {
  final merged = <String, dynamic>{...first};
  for (final entry in second.entries) {
    final previous = merged[entry.key];
    final next = entry.value;
    merged[entry.key] =
        previous is Map<String, dynamic> && next is Map<String, dynamic>
        ? mergeProviderData(previous, next)
        : next;
  }
  return merged;
}

String _mergedId(
  final AIChatMessageContentBlock first,
  final AIChatMessageContentBlock second,
) => second.id.isNotEmpty ? second.id : first.id;

String _mergedToolCallId(
  final AIChatMessageToolCall first,
  final AIChatMessageToolCall second,
) => first.id.isNotEmpty ? first.id : second.id;

Object? _mergeValues(final Object? first, final Object? second) =>
    first is Map<String, dynamic> && second is Map<String, dynamic>
    ? mergeProviderData(first, second)
    : second ?? first;

Map<String, dynamic> _mergeToolArguments(
  final AIChatMessageToolCall first,
  final AIChatMessageToolCall second,
) => _mergeArguments(
  first.arguments,
  second.arguments,
  first.argumentsRaw + second.argumentsRaw,
);

Map<String, dynamic> _mergeServerToolArguments(
  final AIChatMessageServerToolCall first,
  final AIChatMessageServerToolCall second,
) => _mergeArguments(
  first.arguments,
  second.arguments,
  first.argumentsRaw + second.argumentsRaw,
);

Map<String, dynamic> _mergeArguments(
  final Map<String, dynamic> first,
  final Map<String, dynamic> second,
  final String raw,
) {
  final merged = {...first, ...second};
  if (merged.isNotEmpty || raw.isEmpty) return merged;
  try {
    return (jsonDecode(raw) as Map).cast<String, dynamic>();
  } on Object {
    return merged;
  }
}

String _readId(final Map<String, dynamic> map) => map['id'] as String? ?? '';

bool _readIsMergeable(final Map<String, dynamic> map) =>
    map['isMergeable'] as bool? ?? true;

Map<String, dynamic> _readMap(final Object? value) =>
    (value as Map?)?.cast<String, dynamic>() ?? const {};

Map<String, dynamic> _readProviderData(final Map<String, dynamic> map) =>
    _readMap(map['providerData']);

Map<String, dynamic> _metadataMap(final AIChatMessageContentBlock block) => {
  if (block.id.isNotEmpty) 'id': block.id,
  if (block.index != null) 'index': block.index,
  if (!block.isMergeable) 'isMergeable': false,
  if (block.providerData.isNotEmpty) 'providerData': block.providerData,
};

bool _metadataEquals(
  final AIChatMessageContentBlock first,
  final AIChatMessageContentBlock second,
) {
  const deepEquals = DeepCollectionEquality();
  return first.id == second.id &&
      first.index == second.index &&
      first.isMergeable == second.isMergeable &&
      deepEquals.equals(first.providerData, second.providerData);
}

int _metadataHash(final AIChatMessageContentBlock block) {
  const deepEquals = DeepCollectionEquality();
  return Object.hash(
    block.id,
    block.index,
    block.isMergeable,
    deepEquals.hash(block.providerData),
  );
}
