import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../../language_models/models/models.dart';

/// {@template chat_model_options}
/// Generation options to pass into the Chat Model.
/// {@endtemplate}
class ChatModelOptions extends LanguageModelOptions {
  /// {@macro chat_model_options}
  const ChatModelOptions();
}

/// Result returned by the Chat Model.
typedef ChatResult = LanguageModelResult<AIChatMessage>;

/// {@template chat_generation}
/// Output of a single generation.
/// {@endtemplate}
@immutable
class ChatGeneration extends LanguageModelGeneration<AIChatMessage> {
  /// {@macro chat_generation}
  const ChatGeneration(
    super.output, {
    super.generationInfo,
  });

  @override
  String get outputAsString => output.content;

  @override
  LanguageModelGeneration<AIChatMessage> concat(
    final LanguageModelGeneration<AIChatMessage> other,
  ) {
    return ChatGeneration(
      output.concat(other.output),
      generationInfo: {
        ...?generationInfo,
        ...?other.generationInfo,
      },
    );
  }

  @override
  String toString() {
    return '''
ChatGeneration{
  output: $output, 
  generationInfo: $generationInfo, 
''';
  }
}

/// {@template chat_message}
/// A message that is part of a chat conversation.
/// {@endtemplate}
@immutable
sealed class ChatMessage {
  /// {@macro chat_message}
  const ChatMessage();

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
    final AIChatMessageFunctionCall? functionCall,
  }) =>
      AIChatMessage(
        content: content,
        functionCall: functionCall,
      );

  /// Type of message that is the response of calling a function.
  factory ChatMessage.function({
    required final String name,
    required final String content,
  }) =>
      FunctionChatMessage(
        content: content,
        name: name,
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
        final FunctionChatMessage function => function.content,
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

  /// The content of the message.
  final String content;

  /// Default prefix for [SystemChatMessage].
  static const String defaultPrefix = 'System';

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

  /// The content of the message.
  final ChatMessageContent content;

  /// Default prefix for [HumanChatMessage].
  static const String defaultPrefix = 'Human';

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
    this.functionCall,
  });

  /// The content of the message.
  final String content;

  /// A function call that the AI wants to make.
  final AIChatMessageFunctionCall? functionCall;

  /// Default prefix for [AIChatMessage].
  static const String defaultPrefix = 'AI';

  @override
  bool operator ==(covariant final AIChatMessage other) =>
      identical(this, other) ||
      content == other.content && functionCall == other.functionCall;

  @override
  int get hashCode => content.hashCode ^ functionCall.hashCode;

  @override
  AIChatMessage concat(final ChatMessage other) {
    if (other is! AIChatMessage) {
      return this;
    }

    return AIChatMessage(
      content: content + other.content,
      functionCall: functionCall != null || other.functionCall != null
          ? AIChatMessageFunctionCall(
              name:
                  (functionCall?.name ?? '') + (other.functionCall?.name ?? ''),
              argumentsRaw: (functionCall?.argumentsRaw ?? '') +
                  (other.functionCall?.argumentsRaw ?? ''),
              arguments: {
                ...?functionCall?.arguments,
                ...?other.functionCall?.arguments,
              },
            )
          : null,
    );
  }

  @override
  String toString() {
    return '''
AIChatMessage{
  content: $content,
  functionCall: $functionCall,
}''';
  }
}

/// {@template ai_chat_message_function_call}
/// A function call that the AI wants to make.
/// {@endtemplate}
@immutable
class AIChatMessageFunctionCall {
  /// {@macro ai_chat_message_function_call}
  const AIChatMessageFunctionCall({
    required this.name,
    required this.argumentsRaw,
    required this.arguments,
  });

  /// The name of the function that the model wants to call.
  final String name;

  /// The raw arguments JSON string (needed to parse streaming responses).
  final String argumentsRaw;

  /// The arguments that the model wants to pass to the function.
  final Map<String, dynamic> arguments;

  /// Converts the [AIChatMessageFunctionCall] to a [Map].
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'argumentsRaw': argumentsRaw,
      'arguments': arguments,
    };
  }

  @override
  bool operator ==(covariant final AIChatMessageFunctionCall other) {
    final mapEquals = const MapEquality<String, dynamic>().equals;
    return identical(this, other) ||
        name == other.name &&
            argumentsRaw == other.argumentsRaw &&
            mapEquals(arguments, other.arguments);
  }

  @override
  int get hashCode =>
      name.hashCode ^ argumentsRaw.hashCode ^ arguments.hashCode;

  @override
  String toString() {
    return '''
AIChatMessageFunctionCall{
  name: $name,
  argumentsRaw: $argumentsRaw,
  arguments: $arguments,
}''';
  }
}

/// {@template function_chat_message}
/// Type of message that is the response of calling a function.
/// {@endtemplate}
@immutable
class FunctionChatMessage extends ChatMessage {
  /// {@macro function_chat_message}
  const FunctionChatMessage({
    required this.content,
    required this.name,
  });

  /// The response of the function call.
  final String content;

  /// The function that was called.
  final String name;

  /// Default prefix for [FunctionChatMessage].
  static const String defaultPrefix = 'Function';

  @override
  bool operator ==(covariant final FunctionChatMessage other) =>
      identical(this, other) || content == other.content && name == other.name;

  @override
  int get hashCode => content.hashCode;

  @override
  FunctionChatMessage concat(final ChatMessage other) {
    if (other is! FunctionChatMessage) {
      return this;
    }

    return FunctionChatMessage(
      content: content + other.content,
      name: name + other.name,
    );
  }

  @override
  String toString() {
    return '''
FunctionChatMessage{
  name: $name,
  content: $content,
}''';
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
  /// - A URL of the image.
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

  @override
  bool operator ==(covariant final ChatMessageContentImage other) =>
      identical(this, other) ||
      data == other.data && data == other.data && detail == other.detail;

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

/// {@template chat_function}
/// The description of a function that can be called by the chat model.
/// {@endtemplate}
@immutable
class ChatFunction {
  /// {@macro chat_function}
  const ChatFunction({
    required this.name,
    this.description,
    this.parameters,
  });

  /// The name of the function to be called.
  final String name;

  /// The description of what the function does.
  final String? description;

  /// The parameters the functions accepts, described as a
  /// [JSON Schema](https://json-schema.org/understanding-json-schema) object.
  final Map<String, dynamic>? parameters;

  @override
  bool operator ==(covariant final ChatFunction other) {
    final mapEquals = const MapEquality<String, dynamic>().equals;
    return identical(this, other) ||
        name == other.name &&
            description == other.description &&
            mapEquals(parameters, other.parameters);
  }

  @override
  int get hashCode =>
      name.hashCode ^ description.hashCode ^ parameters.hashCode;

  @override
  String toString() {
    return '''
ChatFunction{
  name: $name,
  description: $description,
  parameters: $parameters,
}
''';
  }
}

/// {@template chat_function_call}
/// Controls how the model responds to function calls.
/// {@endtemplate}
sealed class ChatFunctionCall {
  /// {@macro chat_function_call}
  const ChatFunctionCall();

  /// The model does not call a function, and responds to the end-user.
  static const none = ChatFunctionCallNone();

  /// The model can pick between an end-user or calling a function.
  static const auto = ChatFunctionCallAuto();

  /// The model is forced to to call the specified function.
  factory ChatFunctionCall.forced({required final String functionName}) =>
      ChatFunctionCallForced(functionName: functionName);
}

/// {@template chat_function_call_none}
/// The model does not call a function, and responds to the end-user.
/// {@endtemplate}
final class ChatFunctionCallNone extends ChatFunctionCall {
  /// {@macro chat_function_call_none}
  const ChatFunctionCallNone();
}

/// {@template chat_function_call_auto}
/// The model can pick between an end-user or calling a function.
/// {@endtemplate}
final class ChatFunctionCallAuto extends ChatFunctionCall {
  /// {@macro chat_function_call_auto}
  const ChatFunctionCallAuto();
}

/// {@template chat_function_call_forced}
/// The model is forced to to call the specified function.
/// {@endtemplate}
final class ChatFunctionCallForced extends ChatFunctionCall {
  /// {@macro chat_function_call_forced}
  const ChatFunctionCallForced({
    required this.functionName,
  });

  /// The name of the function to call.
  final String functionName;
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
