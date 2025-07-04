import '../tools/tool.dart';
import 'chat_models.dart';

/// Chat model base class.
abstract class ChatModel<TOptions extends ChatModelOptions> {
  /// Creates a new chat model instance.
  ChatModel({
    required this.name,
    required this.defaultOptions,
    this.tools,
    this.temperature,
  });

  /// The default options for the chat model.
  final TOptions defaultOptions;

  /// The model name to use.
  final String name;

  /// The tools the model may call.
  final List<Tool>? tools;

  /// The temperature for the model.
  final double? temperature;

  /// Streaming method that returns Message objects.
  ///
  /// This method should call the underlying LLM API and return a stream
  /// of responses.
  Stream<ChatResult<Message>> sendStream(
    List<Message> messages, {
    TOptions? options,
  });

  /// Disposes the chat model.
  void dispose();
}
