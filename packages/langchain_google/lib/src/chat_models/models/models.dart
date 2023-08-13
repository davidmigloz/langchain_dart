import 'package:langchain/langchain.dart';

/// {@template chat_vertex_ai_options}
/// Options to pass into the Vertex AI Chat Model.
/// {@endtemplate}
class ChatVertexAIOptions extends ChatModelOptions {
  /// {@macro chat_vertex_ai_options}
  const ChatVertexAIOptions({
    this.examples,
  });

  /// List of messages to the model to learn how to respond to the conversation.
  final List<ChatExample>? examples;
}
