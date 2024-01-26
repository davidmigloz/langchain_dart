import 'package:langchain/langchain.dart';

/// {@template chat_openai_options}
/// Options to pass into the OpenAI Chat Model.
/// {@endtemplate}
class ChatOpenAIOptions extends ChatModelOptions {
  /// {@macro chat_openai_options}
  const ChatOpenAIOptions({
    this.model = 'gpt-3.5-turbo',
    this.frequencyPenalty,
    this.logitBias,
    this.maxTokens,
    this.n,
    this.presencePenalty,
    this.responseFormat,
    this.seed,
    this.stop,
    this.temperature,
    this.topP,
    this.functions,
    this.functionCall,
    this.user,
  });

  /// ID of the model to use (e.g. 'gpt-3.5-turbo').
  ///
  /// Available models:
  /// - `gpt-4`
  /// - `gpt-4-0314`
  /// - `gpt-4-0613`
  /// - `gpt-4-32k`
  /// - `gpt-4-32k-0314`
  /// - `gpt-4-32k-0613`
  /// - `gpt-4-turbo-preview`
  /// - `gpt-4-1106-preview`
  /// - `gpt-4-0125-preview`
  /// - `gpt-4-vision-preview`
  /// - `gpt-3.5-turbo`
  /// - `gpt-3.5-turbo-16k`
  /// - `gpt-3.5-turbo-0301`
  /// - `gpt-3.5-turbo-0613`
  /// - `gpt-3.5-turbo-1106`
  /// - `gpt-3.5-turbo-16k-0613`
  ///
  /// Mind that the list may be outdated.
  /// See https://platform.openai.com/docs/models for the latest list.
  final String? model;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// their existing frequency in the text so far, decreasing the model's
  /// likelihood to repeat the same line verbatim.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-frequency_penalty
  final double? frequencyPenalty;

  /// Modify the likelihood of specified tokens appearing in the completion.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-logit_bias
  final Map<String, int>? logitBias;

  /// The maximum number of tokens to generate in the chat completion.
  /// Defaults to inf.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-max_tokens
  final int? maxTokens;

  /// How many chat completion choices to generate for each input message.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-n
  final int? n;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// whether they appear in the text so far, increasing the model's likelihood
  /// to talk about new topics.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-presence_penalty
  final double? presencePenalty;

  /// An object specifying the format that the model must output.
  ///
  /// Setting to [ChatOpenAIResponseFormatType.jsonObject] enables JSON mode,
  /// which guarantees the message the model generates is valid JSON.
  ///
  /// Important: when using JSON mode you must still instruct the model to
  /// produce JSON yourself via some conversation message, for example via your
  /// system message. If you don't do this, the model may generate an unending
  /// stream of whitespace until the generation reaches the token limit, which
  /// may take a lot of time and give the appearance of a "stuck" request.
  /// Also note that the message content may be partial (i.e. cut off) if
  /// `finish_reason="length"`, which indicates the generation exceeded
  /// `max_tokens` or the conversation exceeded the max context length.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-response_format
  final ChatOpenAIResponseFormat? responseFormat;

  /// This feature is in Beta. If specified, our system will make a best effort
  /// to sample deterministically, such that repeated requests with the same
  /// seed and parameters should return the same result. Determinism is not
  /// guaranteed, and you should refer to the system_fingerprint response
  /// parameter to monitor changes in the backend.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-seed
  final int? seed;

  /// Up to 4 sequences where the API will stop generating further tokens.
  ///
  /// Ref: https://platform.openai.com/docs/api-reference/chat/create#chat-create-stop
  final List<String>? stop;

  /// What sampling temperature to use, between 0 and 2.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-temperature
  final double? temperature;

  /// An alternative to sampling with temperature, called nucleus sampling,
  /// where the model considers the results of the tokens with top_p
  /// probability mass.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat-create-top_p
  final double? topP;

  /// A list of functions the model may generate JSON inputs for.
  ///
  /// Ref: https://platform.openai.com/docs/api-reference/chat/create#chat-create-functions
  final List<ChatFunction>? functions;

  /// Controls how the model responds to function calls.
  ///
  /// Ref: https://platform.openai.com/docs/api-reference/chat/create#chat-create-function_call
  final ChatFunctionCall? functionCall;

  /// A unique identifier representing your end-user, which can help OpenAI to
  /// monitor and detect abuse.
  ///
  /// Ref: https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids
  final String? user;

  /// Creates a copy of this [ChatOpenAIOptions] object with the given fields
  /// replaced with the new values.
  ChatOpenAIOptions copyWith({
    final String? model,
    final double? frequencyPenalty,
    final Map<String, int>? logitBias,
    final int? maxTokens,
    final int? n,
    final double? presencePenalty,
    final ChatOpenAIResponseFormat? responseFormat,
    final int? seed,
    final List<String>? stop,
    final double? temperature,
    final double? topP,
    final List<ChatFunction>? functions,
    final ChatFunctionCall? functionCall,
    final String? user,
  }) {
    return ChatOpenAIOptions(
      model: model ?? this.model,
      frequencyPenalty: frequencyPenalty ?? this.frequencyPenalty,
      logitBias: logitBias ?? this.logitBias,
      maxTokens: maxTokens ?? this.maxTokens,
      n: n ?? this.n,
      presencePenalty: presencePenalty ?? this.presencePenalty,
      responseFormat: responseFormat ?? this.responseFormat,
      seed: seed ?? this.seed,
      stop: stop ?? this.stop,
      temperature: temperature ?? this.temperature,
      topP: topP ?? this.topP,
      functions: functions ?? this.functions,
      functionCall: functionCall ?? this.functionCall,
      user: user ?? this.user,
    );
  }
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
