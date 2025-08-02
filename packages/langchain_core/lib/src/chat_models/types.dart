import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../language_models/language_models.dart';
import '../tools/base.dart';

/// {@template chat_model_options}
/// Generation options to pass into the Chat Model.
/// {@endtemplate}
@immutable
abstract class ChatModelOptions extends LanguageModelOptions {
  /// {@macro chat_model_options}
  const ChatModelOptions({
    super.model,
    this.tools,
    this.toolChoice,
    super.concurrencyLimit,
  });

  /// A list of tools the model may call.
  final List<ToolSpec>? tools;

  /// Controls which (if any) tool is called by the model.
  final ChatToolChoice? toolChoice;

  @override
  ChatModelOptions copyWith({
    final String? model,
    final List<ToolSpec>? tools,
    final ChatToolChoice? toolChoice,
    final int? concurrencyLimit,
  });
}

/// {@template chat_result}
/// Result returned by the Chat Model.
/// {@endtemplate}
class ChatResult extends LanguageModelResult<AIChatMessage> {
  /// {@macro chat_result}
  const ChatResult({
    required super.id,
    required super.output,
    required super.finishReason,
    required super.metadata,
    required super.usage,
    super.streaming = false,
  });

  @override
  String get outputAsString => output.content;

  @override
  ChatResult concat(
    final LanguageModelResult<AIChatMessage> other,
  ) {
    return ChatResult(
      id: other.id.isNotEmpty ? other.id : id,
      output: output.concat(other.output),
      finishReason: finishReason != FinishReason.unspecified &&
              other.finishReason == FinishReason.unspecified
          ? finishReason
          : other.finishReason,
      metadata: {
        ...metadata,
        ...other.metadata,
      },
      usage: usage.concat(other.usage),
      streaming: other.streaming,
    );
  }

  @override
  String toString() {
    return '''
ChatResult{
  id: $id, 
  output: $output,
  finishReason: $finishReason,
  metadata: $metadata,
  usage: $usage,
  streaming: $streaming
}''';
  }
}

/// {@template chat_message}
/// A message that is part of a chat conversation.
/// {@endtemplate}
@immutable
sealed class ChatMessage {
  /// {@macro chat_message}
  const ChatMessage();

  /// Converts this ChatMessage to a map along with a type hint for deserialization.
  Map<String, dynamic> toMap() => {};

  /// Converts a map to a [ChatMessage]. Requires at least a type hint.
  factory ChatMessage.fromMap(Map<String, dynamic> map) =>
      switch (map['type']) {
        'system' => SystemChatMessage.fromMap(map),
        'human' => HumanChatMessage.fromMap(map),
        'ai' => AIChatMessage.fromMap(map),
        'tool' => ToolChatMessage.fromMap(map),
        'custom' => CustomChatMessage.fromMap(map),
        null => throw ArgumentError('Type is required'),
        _ => throw UnimplementedError('Unknown type: ${map['type']}'),
      };

  /// Type of message that is a system message.
  factory ChatMessage.system(final String content) =>
      SystemChatMessage(content: content);

  /// Type of message that is spoken by the human.
  factory ChatMessage.human(final ChatMessageContent content) =>
      HumanChatMessage(content: content);

  /// This is a convenience method for [ChatMessage.human] with
  /// [ChatMessageContent.text].
  factory ChatMessage.humanText(final String text) =>
      HumanChatMessage(content: ChatMessageContent.text(text));

  /// Type of message that is spoken by the AI.
  factory ChatMessage.ai(
    final String content, {
    final List<AIChatMessageToolCall> toolCalls = const [],
  }) =>
      AIChatMessage(
        content: content,
        toolCalls: toolCalls,
      );

  /// Type of message that is the response of calling a tool.
  factory ChatMessage.tool({
    required final String toolCallId,
    required final String content,
  }) =>
      ToolChatMessage(
        toolCallId: toolCallId,
        content: content,
      );

  /// Chat message with custom role.
  factory ChatMessage.custom(
    final String content, {
    required final String role,
  }) =>
      CustomChatMessage(
        content: content,
        role: role,
      );

  /// Returns to content of the message as a string.
  String get contentAsString => switch (this) {
        final SystemChatMessage system => system.content,
        final HumanChatMessage human => switch (human.content) {
            final ChatMessageContentText text => text.text,
            final ChatMessageContentImage image => image.data,
            final ChatMessageContentMultiModal multiModal => multiModal.parts
                .map(
                  (final p) => switch (p) {
                    final ChatMessageContentText text => text.text,
                    final ChatMessageContentImage image => image.data,
                    ChatMessageContentMultiModal _ => '',
                  },
                )
                .join('\n'),
          },
        final AIChatMessage ai => ai.content,
        final ToolChatMessage tool => tool.content,
        final CustomChatMessage custom => custom.content,
      };

  /// Merges this message with another by concatenating the content.
  ChatMessage concat(final ChatMessage other);
}

/// {@template system_chat_message}
/// Type of message that is a system message.
/// {@endtemplate}
@immutable
class SystemChatMessage extends ChatMessage {
  /// {@macro system_chat_message}
  const SystemChatMessage({
    required this.content,
  });

  /// Converts a map to a [SystemChatMessage].
  factory SystemChatMessage.fromMap(Map<String, dynamic> map) =>
      SystemChatMessage(content: map['content'] as String);

  /// Converts this ChatMessage to a map along with a type hint for deserialization.
  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        'content': content,
        'type': 'system',
      };

  /// The content of the message.
  final String content;

  /// Default prefix for [SystemChatMessage].
  static const defaultPrefix = 'System';

  @override
  bool operator ==(covariant final SystemChatMessage other) =>
      identical(this, other) || content == other.content;

  @override
  int get hashCode => content.hashCode;

  @override
  SystemChatMessage concat(final ChatMessage other) {
    if (other is! SystemChatMessage) {
      return this;
    }
    return SystemChatMessage(content: content + other.content);
  }

  @override
  String toString() {
    return '''
SystemChatMessage{
  content: $content,
}''';
  }
}

/// {@template human_chat_message}
/// Type of message that is spoken by the human.
/// {@endtemplate}
@immutable
class HumanChatMessage extends ChatMessage {
  /// {@macro human_chat_message}
  const HumanChatMessage({
    required this.content,
  });

  /// Converts a map to a [HumanChatMessage].
  factory HumanChatMessage.fromMap(Map<String, dynamic> map) =>
      HumanChatMessage(content: ChatMessageContent.fromMap(map['content']));

  /// Converts this ChatMessage to a map along with a type hint for deserialization.
  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        'content': content.toMap(),
        'type': 'human',
      };

  /// The content of the message.
  final ChatMessageContent content;

  /// Default prefix for [HumanChatMessage].
  static const defaultPrefix = 'Human';

  @override
  bool operator ==(covariant final HumanChatMessage other) =>
      identical(this, other) || content == other.content;

  @override
  int get hashCode => content.hashCode;

  @override
  HumanChatMessage concat(final ChatMessage other) {
    if (other is! HumanChatMessage) {
      return this;
    }

    final thisContent = content;
    final otherContent = other.content;

    if (thisContent is ChatMessageContentText) {
      return switch (otherContent) {
        ChatMessageContentText(text: final text) => HumanChatMessage(
            content: ChatMessageContent.text(thisContent.text + text),
          ),
        final ChatMessageContentImage image => HumanChatMessage(
            content: ChatMessageContentMultiModal(parts: [thisContent, image]),
          ),
        final ChatMessageContentMultiModal multiModal => HumanChatMessage(
            content: ChatMessageContentMultiModal(
              parts: [thisContent, ...multiModal.parts],
            ),
          ),
      };
    } else if (thisContent is ChatMessageContentImage) {
      return switch (otherContent) {
        final ChatMessageContentText text => HumanChatMessage(
            content: ChatMessageContentMultiModal(parts: [thisContent, text]),
          ),
        final ChatMessageContentImage image => HumanChatMessage(
            content: ChatMessageContentMultiModal(parts: [thisContent, image]),
          ),
        final ChatMessageContentMultiModal multiModal => HumanChatMessage(
            content: ChatMessageContentMultiModal(
              parts: [thisContent, ...multiModal.parts],
            ),
          ),
      };
    } else if (thisContent is ChatMessageContentMultiModal) {
      return switch (otherContent) {
        final ChatMessageContentText text => HumanChatMessage(
            content: ChatMessageContentMultiModal(
              parts: [...thisContent.parts, text],
            ),
          ),
        final ChatMessageContentImage image => HumanChatMessage(
            content: ChatMessageContentMultiModal(
              parts: [...thisContent.parts, image],
            ),
          ),
        final ChatMessageContentMultiModal multiModal => HumanChatMessage(
            content: ChatMessageContentMultiModal(
              parts: [...thisContent.parts, ...multiModal.parts],
            ),
          ),
      };
    } else {
      throw ArgumentError('Unknown ChatMessageContent type: $thisContent');
    }
  }

  @override
  String toString() {
    return '''
HumanChatMessage{
  content: $content,
}''';
  }
}

/// {@template ai_chat_message}
/// Type of message that is spoken by the AI.
/// {@endtemplate}
@immutable
class AIChatMessage extends ChatMessage {
  /// {@macro ai_chat_message}
  const AIChatMessage({
    required this.content,
    this.toolCalls = const [],
  });

  /// Converts a map to a [AIChatMessage].
  factory AIChatMessage.fromMap(Map<String, dynamic> map) => AIChatMessage(
        content: map['content'] as String,
        toolCalls: (map['toolCalls'] as List<dynamic>)
            .map((i) => i as Map<String, dynamic>)
            .map(AIChatMessageToolCall.fromMap)
            .toList(growable: false),
      );

  /// Converts this ChatMessage to a map along with a type hint for deserialization.
  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        'content': content,
        'toolCalls': toolCalls.map((t) => t.toMap()).toList(growable: false),
        'type': 'ai',
      };

  /// The content of the message.
  final String content;

  /// The list of tool that the model wants to call.
  /// If the model does not want to call any tool, this list will be empty.
  final List<AIChatMessageToolCall> toolCalls;

  /// Default prefix for [AIChatMessage].
  static const defaultPrefix = 'AI';

  @override
  bool operator ==(covariant final AIChatMessage other) {
    final listEquals = const DeepCollectionEquality().equals;
    return identical(this, other) ||
        content == other.content && listEquals(toolCalls, other.toolCalls);
  }

  @override
  int get hashCode => content.hashCode ^ toolCalls.hashCode;

  @override
  AIChatMessage concat(final ChatMessage other) {
    if (other is! AIChatMessage) {
      return this;
    }

    final toolCalls = <AIChatMessageToolCall>[];
    if (this.toolCalls.isNotEmpty || other.toolCalls.isNotEmpty) {
      final thisToolCallsById = {
        for (final toolCall in this.toolCalls) toolCall.id: toolCall,
      };
      final otherToolCallsById = {
        for (final toolCall in other.toolCalls)
          (toolCall.id.isNotEmpty
              ? toolCall.id
              : (this.toolCalls.lastOrNull?.id ?? '')): toolCall,
      };
      final toolCallsIds = {
        ...thisToolCallsById.keys,
        ...otherToolCallsById.keys,
      };

      for (final id in toolCallsIds) {
        final thisToolCall = thisToolCallsById[id];
        final otherToolCall = otherToolCallsById[id];
        toolCalls.add(
          AIChatMessageToolCall(
            id: id,
            name: (thisToolCall?.name ?? '') + (otherToolCall?.name ?? ''),
            argumentsRaw: (thisToolCall?.argumentsRaw ?? '') +
                (otherToolCall?.argumentsRaw ?? ''),
            arguments: {
              ...?thisToolCall?.arguments,
              ...?otherToolCall?.arguments,
            },
          ),
        );
      }
    }

    return AIChatMessage(
      content: content + other.content,
      toolCalls: toolCalls,
    );
  }

  @override
  String toString() {
    return '''
AIChatMessage{
  content: $content,
  toolCalls: $toolCalls,
}''';
  }
}

/// {@template ai_chat_message_tool_call}
/// A tool that the model wants to call.
/// {@endtemplate}
@immutable
class AIChatMessageToolCall {
  /// {@macro ai_chat_message_tool_call}
  const AIChatMessageToolCall({
    required this.id,
    required this.name,
    required this.argumentsRaw,
    required this.arguments,
  });

  /// The id of the tool to call.
  ///
  /// This is used to match up the tool results later.
  final String id;

  /// The name of the tool to call.
  final String name;

  /// The raw arguments JSON string (needed to parse streaming responses).
  final String argumentsRaw;

  /// The arguments to pass to the tool in JSON Map format.
  ///
  /// Note that the model does not always generate a valid JSON, in that case,
  /// [arguments] will be empty but you can still see the raw response in
  /// [argumentsRaw].
  ///
  /// The model may also hallucinate parameters not defined by your tool schema.
  /// Validate the arguments in your code before calling your tool.
  final Map<String, dynamic> arguments;

  /// Converts the [AIChatMessageToolCall] to a [Map].
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'argumentsRaw': argumentsRaw,
      'arguments': arguments,
    };
  }

  /// Converts a map to a [AIChatMessageToolCall].
  factory AIChatMessageToolCall.fromMap(Map<String, dynamic> map) =>
      AIChatMessageToolCall(
        id: map['id'] as String,
        name: map['name'] as String,
        argumentsRaw: map['argumentsRaw'] as String,
        arguments: (map['arguments'] as Map<String, dynamic>?) ?? {},
      );

  @override
  bool operator ==(covariant final AIChatMessageToolCall other) {
    final mapEquals = const DeepCollectionEquality().equals;
    return identical(this, other) ||
        id == other.id &&
            name == other.name &&
            argumentsRaw == other.argumentsRaw &&
            mapEquals(arguments, other.arguments);
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ argumentsRaw.hashCode ^ arguments.hashCode;

  @override
  String toString() {
    return '''
AIChatMessageToolCall{
  id: $id,
  name: $name,
  argumentsRaw: $argumentsRaw,
  arguments: $arguments,
}''';
  }
}

/// {@template tool_chat_message}
/// Type of message that is the response of calling a tool.
/// {@endtemplate}
@immutable
class ToolChatMessage extends ChatMessage {
  /// {@macro tool_chat_message}
  const ToolChatMessage({
    required this.toolCallId,
    required this.content,
  }) : toolResults = const [];

  /// Chat message containing multiple tool chat messages.
  ToolChatMessage.multi({
    required Iterable<ToolChatMessage> toolResults,
  })  : toolCallId = '',
        content = '',
        toolResults = toolResults.toList(growable: false);

  /// Converts a map to a [ToolChatMessage].
  factory ToolChatMessage.fromMap(Map<String, dynamic> map) =>
      (map['toolCallId'] is String && map['content'] is String)
          ? ToolChatMessage(
              toolCallId: map['toolCallId'] as String,
              content: map['content'] as String,
            )
          : ToolChatMessage.multi(
              toolResults: (map['toolResults'] as List)
                  .map((m) => ToolChatMessage.fromMap(m))
                  .toList(growable: false),
            );

  /// Converts this ChatMessage to a map along with a type hint for deserialization.
  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        if (toolResults.isEmpty) 'content': content,
        if (toolResults.isEmpty) 'toolCallId': toolCallId,
        if (toolResults.isNotEmpty)
          'toolResults': toolResults.map((t) => t.toMap()).toList(),
        'type': 'tool',
      };

  /// The id of the tool that was called.
  final String toolCallId;

  /// The response of the tool call.
  final String content;

  /// The list of reponses in the event of multiple tool calls.
  final List<ToolChatMessage> toolResults;

  /// Default prefix for [ToolChatMessage].
  static const defaultPrefix = 'Tool';

  @override
  bool operator ==(covariant final ToolChatMessage other) =>
      identical(this, other) ||
      toolCallId == other.toolCallId &&
          content == other.content &&
          toolResults.length == other.toolResults.length &&
          toolResults.every(
            (m) => other.toolResults.any((o) => o == m),
          );

  @override
  int get hashCode => toolResults.isEmpty
      ? (toolCallId.hashCode ^ content.hashCode)
      : toolResults.fold<int>(
          0,
          (h, m) => h ^ m.hashCode,
        );

  @override
  ToolChatMessage concat(final ChatMessage other) {
    if (other is! ToolChatMessage) {
      return this;
    }

    if (toolResults.isNotEmpty) {
      // Not sure this is the right way to go. I understand `concat` is used in streaming scenarios?
      //
      // In a multi-`ToolChatMessage` scenario, there will be a top `ToolChatMessage` (the multi) and a
      // number of children `ToolChatMessage` (single results): `other` will have to be concatenated with
      // the latest child message until the message is complete, then it must be concatenated with the
      // top `ToolChatMessage`. It's the responsibility of the caller to decide which `ToolChatMessage`
      // `other` needs to be concatenated with.
      //
      // However I'm not sure streaming makes sense in this scenario, because `ToolChatMessages` should
      // not come from the LLM, and should be computed by user code instead?
      return ToolChatMessage.multi(toolResults: [...toolResults, other]);
    }

    return ToolChatMessage(
      toolCallId: toolCallId,
      content: content + other.content,
    );
  }

  @override
  String toString() {
    return toolResults.isEmpty
        ? '''
ToolChatMessage{
  toolCallId: $toolCallId,
  content: $content,
}'''
        : '''
ToolChatMessage.multi{
  toolResults: [
${toolResults.map((t) => t.toString().split('\n').map((l) => '    $l').join('\n')).join(',\n')}
]}''';
  }
}

/// {@template custom_chat_message}
/// Chat message with custom role.
/// {@endtemplate}
@immutable
class CustomChatMessage extends ChatMessage {
  /// {@macro custom_chat_message}
  const CustomChatMessage({
    required this.content,
    required this.role,
  });

  /// Converts a map to a [CustomChatMessage].
  factory CustomChatMessage.fromMap(Map<String, dynamic> map) =>
      CustomChatMessage(
        content: map['content'] as String,
        role: map['role'] as String,
      );

  /// Converts this ChatMessage to a map along with a type hint for deserialization.
  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        'content': content,
        'role': role,
        'type': 'custom',
      };

  /// The content of the message.
  final String content;

  /// The role of the author of this message.
  final String role;

  @override
  bool operator ==(covariant final CustomChatMessage other) =>
      identical(this, other) || content == other.content && role == other.role;

  @override
  int get hashCode => content.hashCode ^ role.hashCode;

  @override
  CustomChatMessage concat(final ChatMessage other) {
    if (other is! CustomChatMessage) {
      return this;
    }
    return CustomChatMessage(
      role: role,
      content: content + other.content,
    );
  }

  @override
  String toString() {
    return '''
CustomChatMessage{
  content: $content,
  role: $role,
}''';
  }
}

/// Role of a chat message
enum ChatMessageRole {
  /// A system message.
  system,

  /// A human (user) message.
  human,

  /// An AI message.
  ai,

  /// A message with a custom role.
  custom,
}

/// {@template chat_message_content}
/// The content of a message.
/// {@endtemplate}
@immutable
sealed class ChatMessageContent {
  const ChatMessageContent();

  /// Converts this ChatMessageContent to a map
  Map<String, dynamic> toMap() => {};

  factory ChatMessageContent.fromMap(Map<String, dynamic> map) =>
      switch (map['type']) {
        'text' => ChatMessageContentText.fromMap(map),
        'image' => ChatMessageContentImage.fromMap(map),
        'multi_modal' => ChatMessageContentMultiModal.fromMap(map),
        null => throw ArgumentError('Type is required'),
        _ => throw UnimplementedError('Unknown type: ${map['type']}'),
      };

  /// The content of a message that is text.
  factory ChatMessageContent.text(final String text) =>
      ChatMessageContentText(text: text);

  /// The content of a message that is an image.
  ///
  /// More info about the possible values:
  /// - [ChatMessageContentImage.data]
  /// - [ChatMessageContentImage.mimeType]
  /// - [ChatMessageContentImage.detail]
  factory ChatMessageContent.image({
    required final String data,
    final String? mimeType,
    final ChatMessageContentImageDetail imageDetail =
        ChatMessageContentImageDetail.auto,
  }) =>
      ChatMessageContentImage(
        data: data,
        mimeType: mimeType,
        detail: imageDetail,
      );

  /// The content of a message that is multi-modal.
  factory ChatMessageContent.multiModal(
    final List<ChatMessageContent> parts,
  ) =>
      ChatMessageContentMultiModal(parts: parts);
}

/// {@template chat_message_content_text}
/// The content of a message that is text.
/// {@endtemplate}
class ChatMessageContentText extends ChatMessageContent {
  /// {@macro chat_message_content_text}
  const ChatMessageContentText({
    required this.text,
  });

  /// The text content.
  final String text;

  /// Converts a map to a [ChatMessageContentText].
  factory ChatMessageContentText.fromMap(Map<String, dynamic> map) =>
      ChatMessageContentText(text: map['content'] as String);

  @override

  /// Converts this ChatMessageContent to a map along with a type hint for deserialization.
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        'type': 'text',
        'content': text,
      };

  @override
  bool operator ==(covariant final ChatMessageContentText other) =>
      identical(this, other) || text == other.text;

  @override
  int get hashCode => text.hashCode;

  @override
  String toString() {
    return '''
ChatMessageContentText{
  text: $text,
}''';
  }
}

/// {@template chat_message_content_image}
/// The content of a message that is an image.
/// {@endtemplate}
class ChatMessageContentImage extends ChatMessageContent {
  /// {@macro chat_message_content_image}
  const ChatMessageContentImage({
    required this.data,
    this.mimeType,
    this.detail = ChatMessageContentImageDetail.auto,
  });

  /// Depending on the model, this can be either:
  /// - The base64 encoded image data
  /// - A URL of the image (only supported by some providers)
  final String data;

  /// The IANA standard MIME type of the source data.
  /// The accepted types vary per model.
  ///
  /// Examples of MIME types:
  /// - `image/png`
  /// - `image/jpeg`
  /// - `image/heic`
  /// - `image/heif`
  /// - `image/webp`
  final String? mimeType;

  /// Specifies the detail level of the image.
  final ChatMessageContentImageDetail detail;

  /// Converts a map to a [ChatMessageContentImage].
  factory ChatMessageContentImage.fromMap(Map<String, dynamic> map) =>
      ChatMessageContentImage(
        data: map['data'] as String,
        mimeType: map['mimeType'] as String?,
        detail: ChatMessageContentImageDetail.values.firstWhere(
          (i) => map['detail'] == i.name,
          orElse: () => ChatMessageContentImageDetail.auto,
        ),
      );

  /// Converts this ChatMessageContent to a map along with a type hint for deserialization.
  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        'type': 'image',
        'data': data,
        'mimeType': mimeType,
        'detail': detail.name,
      };

  @override
  bool operator ==(covariant final ChatMessageContentImage other) =>
      identical(this, other) ||
      data == other.data &&
          mimeType == other.mimeType &&
          detail == other.detail;

  @override
  int get hashCode => data.hashCode ^ mimeType.hashCode ^ detail.hashCode;

  @override
  String toString() {
    return '''
ChatMessageContentImage{
  url: $data,
  mimeType: $mimeType,
  imageDetail: $detail,
}''';
  }
}

/// {@template chat_message_content_multi_modal}
/// The content of a message that is multi-modal.
/// {@endtemplate
@immutable
class ChatMessageContentMultiModal extends ChatMessageContent {
  /// {@macro chat_message_content_multi_modal}
  ChatMessageContentMultiModal({
    required this.parts,
  }) : assert(
          !parts.any((final p) => p is ChatMessageContentMultiModal),
          'Multi-modal messages cannot contain other multi-modal messages.',
        );

  /// Converts a map to a [ChatMessageContentMultiModal].
  factory ChatMessageContentMultiModal.fromMap(Map<String, dynamic> map) =>
      ChatMessageContentMultiModal(
        parts: (map['parts'] as List<dynamic>)
            .whereType<Map<String, dynamic>>()
            .map(ChatMessageContent.fromMap)
            .toList(growable: false),
      );

  /// Converts [ChatMessageContentMultiModal] to a map along with a type hint for deserialization.
  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        'type': 'multi_modal',
        'parts': parts.map((p) => p.toMap()).toList(growable: false),
      };

  /// The parts of the multi-modal message.
  final List<ChatMessageContent> parts;

  @override
  bool operator ==(covariant final ChatMessageContentMultiModal other) =>
      identical(this, other) || parts == other.parts;

  @override
  int get hashCode => parts.hashCode;

  @override
  String toString() {
    return '''
ChatMessageContentMultiModal{
  parts: $parts,
}''';
  }
}

/// Specifies the detail level of the image.
enum ChatMessageContentImageDetail {
  /// Automatically select the detail level.
  auto,

  /// Low detail level (faster response time and lower token usage).
  low,

  /// Medium detail level (slower response time and higher token usage).
  high,
}

/// {@template chat_tool_choice}
/// Controls how the model responds to tool calls.
/// {@endtemplate}
sealed class ChatToolChoice {
  /// {@macro chat_tool_choice}
  const ChatToolChoice();

  /// The model does not call a tool, and responds to the end-user.
  static const none = ChatToolChoiceNone();

  /// The model can pick between responding to the end-user or calling a tool.
  static const auto = ChatToolChoiceAuto();

  /// The model must call at least one tool, but doesn't force a particular tool.
  static const required = ChatToolChoiceRequired();

  /// The model is forced to to call the specified tool.
  factory ChatToolChoice.forced({required final String name}) =>
      ChatToolChoiceForced(name: name);

  /// Converts this ChatToolChoice to a map along with a type hint for deserialization.
  Map<String, dynamic> toMap() => {};

  /// Converts a map to a [ChatToolChoice]. Requires at least a type hint.
  factory ChatToolChoice.fromMap(Map<String, dynamic> map) =>
      switch (map['type']) {
        'none' => ChatToolChoiceNone.fromMap(map),
        'auto' => ChatToolChoiceAuto.fromMap(map),
        'required' => ChatToolChoiceRequired.fromMap(map),
        'forced' => ChatToolChoiceForced.fromMap(map),
        null => throw ArgumentError('Type is required'),
        _ => throw UnimplementedError('Unknown type: ${map['type']}'),
      };
}

/// {@template chat_tool_choice_none}
/// The model does not call a tool, and responds to the end-user.
/// {@endtemplate}
final class ChatToolChoiceNone extends ChatToolChoice {
  /// {@macro chat_tool_choice_none}
  const ChatToolChoiceNone();

  /// Converts this ChatToolChoice to a map along with a type hint for deserialization.
  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        'type': 'none',
      };

  /// Converts a map to a [ChatToolChoiceNone].
  // ignore: avoid_unused_constructor_parameters
  factory ChatToolChoiceNone.fromMap(Map<String, dynamic> map) =>
      const ChatToolChoiceNone();
}

/// {@template chat_tool_choice_auto}
/// The model can pick between responding to the end-user or calling a tool.
/// {@endtemplate}
final class ChatToolChoiceAuto extends ChatToolChoice {
  /// {@macro chat_tool_choice_auto}
  const ChatToolChoiceAuto();

  /// Converts this ChatToolChoice to a map along with a type hint for deserialization.
  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        'type': 'auto',
      };

  /// Converts a map to a [ChatToolChoiceAuto].
  // ignore: avoid_unused_constructor_parameters
  factory ChatToolChoiceAuto.fromMap(Map<String, dynamic> map) =>
      const ChatToolChoiceAuto();
}

/// {@template chat_tool_choice_required}
/// The model must call at least one tool, but doesn't force a particular tool.
/// {@endtemplate}
final class ChatToolChoiceRequired extends ChatToolChoice {
  /// {@macro chat_tool_choice_none}
  const ChatToolChoiceRequired();

  /// Converts this ChatToolChoice to a map along with a type hint for deserialization.
  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        'type': 'required',
      };

  /// Converts a map to a [ChatToolChoiceRequired].
  // ignore: avoid_unused_constructor_parameters
  factory ChatToolChoiceRequired.fromMap(Map<String, dynamic> map) =>
      const ChatToolChoiceRequired();
}

/// {@template chat_tool_choice_forced}
/// The model is forced to to call the specified tool.
/// {@endtemplate}
@immutable
final class ChatToolChoiceForced extends ChatToolChoice {
  /// {@macro chat_tool_choice_forced}
  const ChatToolChoiceForced({
    required this.name,
  });

  /// The name of the tool to call.
  final String name;

  /// Converts this ChatToolChoice to a map along with a type hint for deserialization.
  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        'type': 'forced',
        'name': name,
      };

  /// Converts a map to a [ChatToolChoiceForced].
  factory ChatToolChoiceForced.fromMap(Map<String, dynamic> map) =>
      ChatToolChoiceForced(name: map['name'] as String);

  @override
  bool operator ==(covariant final ChatToolChoiceForced other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}

/// {@template chat_example}
/// An example of a conversation between the end-user and the model.
/// {@endtemplate}
class ChatExample {
  /// {@macro chat_example}
  const ChatExample({
    required this.input,
    required this.output,
  });

  /// An example of an input message from the user.
  final ChatMessage input;

  /// An example of what the model should output given the input.
  final ChatMessage output;
}
