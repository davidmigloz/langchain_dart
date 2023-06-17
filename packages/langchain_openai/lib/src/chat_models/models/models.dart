import 'package:langchain/langchain.dart';

/// {@template chat_openai_options}
/// Options to pass into the OpenAI Chat Model.
/// {@endtemplate}
class ChatOpenAIOptions extends ChatModelOptions {
  /// {@macro chat_openai_options}
  const ChatOpenAIOptions({
    /// Up to 4 sequences where the API will stop generating further tokens.
    ///
    /// Ref: https://platform.openai.com/docs/api-reference/chat/create#chat/create-stop
    super.stop,
    this.functions,
    this.functionCall,
  });

  /// A list of functions the model may generate JSON inputs for.
  ///
  /// Ref: https://platform.openai.com/docs/api-reference/chat/create#chat/create-functions
  final List<ChatFunction>? functions;

  /// Controls how the model responds to function calls.
  ///
  /// Ref: https://platform.openai.com/docs/api-reference/chat/create#chat/create-function_call
  final ChatFunctionCall? functionCall;
}
