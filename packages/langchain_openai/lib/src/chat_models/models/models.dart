import 'package:langchain/langchain.dart';
import '../openai.dart';

/// {@template chat_openai_options}
/// Options to pass into the OpenAI Chat Model.
/// {@endtemplate}
class ChatOpenAIOptions extends ChatModelOptions {
  /// {@macro chat_openai_options}
  const ChatOpenAIOptions({
    this.stop,
    this.functions,
    this.functionCall,
    this.user,
  });

  /// Up to 4 sequences where the API will stop generating further tokens.
  ///
  /// Ref: https://platform.openai.com/docs/api-reference/chat/create#chat/create-stop
  final List<String>? stop;

  /// A list of functions the model may generate JSON inputs for.
  ///
  /// Ref: https://platform.openai.com/docs/api-reference/chat/create#chat/create-functions
  final List<ChatFunction>? functions;

  /// Controls how the model responds to function calls.
  ///
  /// Ref: https://platform.openai.com/docs/api-reference/chat/create#chat/create-function_call
  final ChatFunctionCall? functionCall;

  /// A unique identifier representing your end-user, which can help OpenAI to
  /// monitor and detect abuse.
  ///
  /// If the user does not change between requests, you can set this field in
  /// [ChatOpenAI.user] instead.
  ///
  /// If you specify it in both places, the value in [ChatOpenAIOptions.user]
  /// will be used.
  ///
  /// Ref: https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids
  final String? user;
}

/// {@template chat_openai_response_format}
/// An object specifying the format that the model must output.
/// {@endtemplate}
class ChatOpenAIResponseFormat {
  /// {@macro chat_openai_response_format}
  const ChatOpenAIResponseFormat({
    required this.type,
  });

  /// The format type.
  final ChatOpenAIResponseFormatType type;
}

/// Types of response formats.
enum ChatOpenAIResponseFormatType {
  /// Standard text mode.
  text,

  /// [ChatOpenAIResponseFormatType.jsonObject] enables JSON mode, which
  /// guarantees the message the model generates is valid JSON.
  jsonObject,
}
