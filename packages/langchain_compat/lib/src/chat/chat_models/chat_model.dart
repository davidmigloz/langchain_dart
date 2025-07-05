import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

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
    this.systemPrompt,
  });

  /// Logger for chat model operations.
  static final Logger _logger = Logger('dartantic.chat.model');

  /// The default options for the chat model.
  final TOptions defaultOptions;

  /// The model name to use.
  final String name;

  /// The tools the model may call.
  final List<Tool>? tools;

  /// The temperature for the model.
  final double? temperature;

  /// The default system prompt for the model.
  ///
  /// This system prompt will be used if no system message is provided
  /// as the first message in the conversation. If a system message is
  /// provided as the first message, it will override this default.
  final String? systemPrompt;

  /// Streaming method that returns Message objects.
  ///
  /// This method should call the underlying LLM API and return a stream
  /// of responses.
  ///
  /// [messages] is the list of messages to send to the model.
  ///
  /// [options] is an optional set of options that can be used to configure
  /// the model.
  ///
  /// [outputSchema] is an optional schema that can be used to validate
  /// the output of the model.
  Stream<ChatResult<ChatMessage>> sendStream(
    List<ChatMessage> messages, {
    TOptions? options,
    JsonSchema? outputSchema,
  });

  /// Disposes the chat model.
  void dispose();

  /// Prepares the messages list with default system prompt if needed.
  ///
  /// If the first message is not a system message and [systemPrompt] is set,
  /// prepends a system message with the default system prompt.
  @protected
  List<ChatMessage> prepareMessagesWithDefaults(List<ChatMessage> messages) {
    final hasSystemMessage =
        messages.isNotEmpty && messages.first.role == MessageRole.system;
    final hasDefaultSystemPrompt =
        systemPrompt != null && systemPrompt!.isNotEmpty;

    if (hasSystemMessage && hasDefaultSystemPrompt) {
      // System message overrides default system prompt
      final systemMessageText = messages.first.parts
          .whereType<TextPart>()
          .map((p) => p.text)
          .join(' ')
          .trim();
      final truncatedText = systemMessageText.length > 50
          ? '${systemMessageText.substring(0, 50)}...'
          : systemMessageText;
      _logger.info(
        'Overriding default system prompt message: '
        '"$truncatedText" for model: $name',
      );
      return messages;
    }

    if (hasSystemMessage) {
      // System message present, no default system prompt
      _logger.info('Using system prompt message for model: $name');
      return messages;
    }

    if (hasDefaultSystemPrompt) {
      // Use default system prompt
      final truncatedPrompt = systemPrompt!.length > 50
          ? '${systemPrompt!.substring(0, 50)}...'
          : systemPrompt!;
      _logger.info(
        'Using default system prompt message '
        '"$truncatedPrompt" for model: $name',
      );
      return [
        ChatMessage(role: MessageRole.system, parts: [TextPart(systemPrompt!)]),
        ...messages,
      ];
    }

    // No system prompt at all
    _logger.info('No system prompt for model: $name');
    return messages;
  }

  /// Filters system messages from the response messages.
  ///
  /// System messages should not be included in ChatResult.messages
  /// as they are configuration, not conversation content.
  @protected
  List<ChatMessage> filterSystemMessages(List<ChatMessage> messages) =>
      messages.where((m) => m.role != MessageRole.system).toList();
}
