import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../../language_models/models/models.dart';

/// {@template chat_model_options}
/// Generation options to pass into the Chat Model.
/// {@endtemplate}
class ChatModelOptions extends LanguageModelOptions {
  /// {@macro chat_model_options}
  const ChatModelOptions({
    super.stop,
  });
}

/// {@template chat_result}
/// Result returned by the Chat Model.
/// {@endtemplate}
@immutable
class ChatResult extends LanguageModelResult<ChatMessage> {
  /// {@macro chat_result}
  const ChatResult({
    required super.generations,
    super.usage,
    super.modelOutput,
  });

  @override
  String toString() {
    return '''
ChatResult{
  generations: $generations, 
  usage: $usage, 
  modelOutput: $modelOutput},
''';
  }
}

/// {@template chat_generation}
/// Output of a single generation.
/// {@endtemplate}
@immutable
class ChatGeneration extends LanguageModelGeneration<ChatMessage> {
  /// {@macro chat_generation}
  const ChatGeneration(
    super.output, {
    super.generationInfo,
  });

  @override
  String get outputAsString => output.content;

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
  const ChatMessage({
    required this.content,
  });

  /// Type of message that is a system message.
  factory ChatMessage.system(final String content) =>
      SystemChatMessage(content: content);

  /// Type of message that is spoken by the human.
  factory ChatMessage.human(
    final String content, {
    final bool example = false,
  }) =>
      HumanChatMessage(
        content: content,
        example: example,
      );

  /// Type of message that is spoken by the AI.
  factory ChatMessage.ai(
    final String content, {
    final AIChatMessageFunctionCall? functionCall,
    final bool example = false,
  }) =>
      AIChatMessage(
        content: content,
        functionCall: functionCall,
        example: example,
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

  /// The content of the message.
  final String content;
}

/// {@template system_chat_message}
/// Type of message that is a system message.
/// {@endtemplate}
@immutable
class SystemChatMessage extends ChatMessage {
  /// {@macro system_chat_message}
  const SystemChatMessage({
    required super.content,
  });

  /// Default prefix for [SystemChatMessage].
  static const String defaultPrefix = 'System';

  @override
  bool operator ==(covariant final SystemChatMessage other) =>
      identical(this, other) || content == other.content;

  @override
  int get hashCode => content.hashCode;

  @override
  String toString() {
    return '''
SystemChatMessage{
  content: $content,
}
''';
  }
}

/// {@template human_chat_message}
/// Type of message that is spoken by the human.
/// {@endtemplate}
@immutable
class HumanChatMessage extends ChatMessage {
  /// {@macro human_chat_message}
  const HumanChatMessage({
    required super.content,
    this.example = false,
  });

  /// Whether this message is an example.
  final bool example;

  /// Default prefix for [HumanChatMessage].
  static const String defaultPrefix = 'Human';

  @override
  bool operator ==(covariant final HumanChatMessage other) =>
      identical(this, other) ||
      content == other.content && example == other.example;

  @override
  int get hashCode => content.hashCode ^ example.hashCode;

  @override
  String toString() {
    return '''
HumanChatMessage{
  content: $content,
  example: $example,
}
''';
  }
}

/// {@template ai_chat_message}
/// Type of message that is spoken by the AI.
/// {@endtemplate}
@immutable
class AIChatMessage extends ChatMessage {
  /// {@macro ai_chat_message}
  const AIChatMessage({
    required super.content,
    this.functionCall,
    this.example = false,
  });

  /// A function call that the AI wants to make.
  final AIChatMessageFunctionCall? functionCall;

  /// Whether this message is an example.
  final bool example;

  /// Default prefix for [AIChatMessage].
  static const String defaultPrefix = 'AI';

  @override
  bool operator ==(covariant final AIChatMessage other) =>
      identical(this, other) ||
      content == other.content &&
          functionCall == other.functionCall &&
          example == other.example;

  @override
  int get hashCode => content.hashCode ^ example.hashCode;

  @override
  String toString() {
    return '''
AIChatMessage{
  content: $content,
  functionCall: $functionCall,
  example: $example,
}
''';
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
    required this.arguments,
  });

  /// The name of the function that the model wants to call.
  final String name;

  /// The arguments that the model wants to pass to the function.
  final Map<String, dynamic> arguments;

  @override
  bool operator ==(covariant final AIChatMessageFunctionCall other) {
    final mapEquals = const MapEquality<String, dynamic>().equals;
    return identical(this, other) ||
        name == other.name && mapEquals(arguments, other.arguments);
  }

  @override
  int get hashCode => name.hashCode ^ arguments.hashCode;

  @override
  String toString() {
    return '''
AIChatMessageFunctionCall{
  name: $name,
  arguments: $arguments,
}
      ''';
  }
}

/// {@template function_chat_message}
/// Type of message that is the response of calling a function.
/// {@endtemplate}
@immutable
class FunctionChatMessage extends ChatMessage {
  /// {@macro function_chat_message}
  const FunctionChatMessage({
    required super.content,
    required this.name,
  });

  final String name;

  /// Default prefix for [FunctionChatMessage].
  static const String defaultPrefix = 'Function';

  @override
  bool operator ==(covariant final FunctionChatMessage other) =>
      identical(this, other) || content == other.content && name == other.name;

  @override
  int get hashCode => content.hashCode;

  @override
  String toString() {
    return '''
FunctionChatMessage{
  name: $name,
  content: $content,
}
''';
  }
}

/// {@template custom_chat_message}
/// Chat message with custom role.
/// {@endtemplate}
@immutable
class CustomChatMessage extends ChatMessage {
  /// {@macro custom_chat_message}
  const CustomChatMessage({
    required super.content,
    required this.role,
  });

  /// The role of the author of this message.
  final String role;

  @override
  bool operator ==(covariant final CustomChatMessage other) =>
      identical(this, other) || content == other.content && role == other.role;

  @override
  int get hashCode => content.hashCode ^ role.hashCode;

  @override
  String toString() {
    return '''
CustomChatMessage{
  content: $content,
  role: $role,
}
''';
  }
}

/// Role of a chat message
enum ChatMessageRole { system, human, ai, custom }

/// {@template openai_function_model}
/// The description of a function that can be called by the chat model.
/// {@endtemplate
@immutable
class ChatFunction {
  /// {@macro openai_function_model}
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
  const ChatFunctionCallForced({
    required this.functionName,
  });

  /// The name of the function to call.
  final String functionName;
}
