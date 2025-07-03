import '../tools/tool.dart';
import 'chat_models.dart';

/// Chat model base class.
abstract class ChatModel<TOptions extends ChatModelOptions> {
  /// Creates a new chat model instance.
  const ChatModel({
    required this.defaultOptions,
    this.model,
    this.tools,
    this.temperature,
  });

  /// The default options for the chat model.
  final TOptions defaultOptions;

  /// The model ID to use.
  final String? model;

  /// The tools the model may call.
  final List<Tool>? tools;

  /// The temperature for the model.
  final double? temperature;

  /// The name of the model.
  String get name;

  /// Invokes the chat model.
  Future<ChatResult<String>> invoke(
    List<ChatMessage> messages, {
    TOptions? options,
  });

  /// Streams the chat model.
  Stream<ChatResult<String>> stream(
    List<ChatMessage> messages, {
    TOptions? options,
  });

  /// Closes the chat model.
  void close();
}
