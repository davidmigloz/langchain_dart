import 'package:langchain/langchain.dart';
import 'package:tiktoken/tiktoken.dart';

import '../client/base.dart';
import '../client/openai_client.dart';
import 'mappers.dart';
import 'models/models.dart';

/// {@template base_chat_openai}
/// Wrapper around OpenAI Chat large language models.
/// {@endtemplate}
abstract base class BaseChatOpenAI extends BaseChatModel<ChatOpenAIOptions> {
  /// {@macro base_chat_openai}
  BaseChatOpenAI({
    required final String? apiKey,
    required final BaseOpenAIClient? apiClient,
    required this.model,
    required this.temperature,
    required this.topP,
    required this.n,
    required this.maxTokens,
    required this.presencePenalty,
    required this.frequencyPenalty,
    required this.logitBias,
    required this.encoding,
  })  : assert(
          apiKey != null || apiClient != null,
          'Either apiKey or apiClient must be provided.',
        ),
        _client = apiClient ?? OpenAIClient.instanceFor(apiKey: apiKey!);

  /// API client to use.
  final BaseOpenAIClient _client;

  /// ID of the model to use (e.g. 'gpt-3.5-turbo').
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-model
  final String model;

  /// What sampling temperature to use, between 0 and 2.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-temperature
  final double temperature;

  /// An alternative to sampling with temperature, called nucleus sampling,
  /// where the model considers the results of the tokens with top_p
  /// probability mass.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-top_p
  final double topP;

  /// How many chat completion choices to generate for each input message.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-n
  final int n;

  /// The maximum number of tokens to generate in the chat completion.
  /// Defaults to inf.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-max_tokens
  final int? maxTokens;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// whether they appear in the text so far, increasing the model's likelihood
  /// to talk about new topics.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-presence_penalty
  final double presencePenalty;

  /// Number between -2.0 and 2.0. Positive values penalize new tokens based on
  /// their existing frequency in the text so far, decreasing the model's
  /// likelihood to repeat the same line verbatim.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-frequency_penalty
  final double frequencyPenalty;

  /// Modify the likelihood of specified tokens appearing in the completion.
  ///
  /// See https://platform.openai.com/docs/api-reference/chat/create#chat/create-logit_bias
  final Map<String, double>? logitBias;

  /// The encoding to use by tiktoken when [tokenize] is called.
  ///
  /// By default, when [encoding] is not set, it is derived from the [model].
  /// However, there are some cases where you may want to use this wrapper
  /// class with a [model] not supported by tiktoken (e.g. when using Azure
  /// embeddings or when using one of the many model providers that expose an
  /// OpenAI-like API but with different models). In those cases, tiktoken won't
  /// be able to derive the encoding to use, so you have to explicitly specify
  /// it using this field.
  ///
  /// Supported encodings:
  /// - `cl100k_base` (used by gpt-4, gpt-3.5-turbo, text-embedding-ada-002).
  /// - `p50k_base` (used by codex models, text-davinci-002, text-davinci-003).
  /// - `r50k_base` (used by gpt-3 models like davinci).
  ///
  /// For an exhaustive list check:
  /// https://github.com/mvitlov/tiktoken/blob/master/lib/tiktoken.dart
  final String? encoding;

  @override
  String get modelType => 'openai-chat';

  @override
  Future<ChatResult> generate(
    final List<ChatMessage> messages, {
    final ChatOpenAIOptions? options,
  }) async {
    final messagesDtos = messages
        .map((final m) => m.toOpenAIChatMessage())
        .toList(growable: false);

    final completion = await _client.createChatCompletion(
      model: model,
      messages: messagesDtos,
      functions: options?.functions
          ?.map((final f) => f.toOpenAIFunction())
          .toList(growable: false),
      functionCall: options?.functionCall?.toOpenAIFunctionCall(),
      maxTokens: maxTokens,
      temperature: temperature,
      topP: topP,
      n: n,
      stop: options?.stop,
      presencePenalty: presencePenalty,
      frequencyPenalty: frequencyPenalty,
      logitBias: logitBias,
    );

    return completion.toChatResult(model);
  }

  /// Tokenizes the given prompt using tiktoken with the encoding used by the
  /// [model]. If an encoding model is specified in [encoding] field, that
  /// encoding is used instead.
  ///
  /// - [promptValue] The prompt to tokenize.
  @override
  Future<List<int>> tokenize(final PromptValue promptValue) async {
    return _getTiktoken().encode(promptValue.toString());
  }

  @override
  Future<int> countTokens(final PromptValue promptValue) async {
    final tiktoken = _getTiktoken();
    final messages = promptValue.toChatMessages();

    // Ref: https://github.com/openai/openai-cookbook/blob/main/examples/How_to_count_tokens_with_tiktoken.ipynb
    final int tokensPerMessage;
    final int tokensPerName;

    switch (model) {
      case 'gpt-3.5-turbo-0613':
      case 'gpt-3.5-turbo-16k-0613':
      case 'gpt-4-0314':
      case 'gpt-4-32k-0314':
      case 'gpt-4-0613':
      case 'gpt-4-32k-0613':
        tokensPerMessage = 3;
        tokensPerName = 1;
      case 'gpt-3.5-turbo-0301':
        // Every message follows <|start|>{role/name}\n{content}<|end|>\n
        tokensPerMessage = 4;
        // If there's a name, the role is omitted
        tokensPerName = -1;
      default:
        if (model.startsWith('gpt-3.5-turbo') || model.startsWith('gpt-4')) {
          // Returning num tokens assuming gpt-3.5-turbo-0613
          tokensPerMessage = 3;
          tokensPerName = 1;
        } else {
          throw UnimplementedError(
            'countTokens not supported for model $model',
          );
        }
    }

    int numTokens = 0;
    for (final message in messages) {
      numTokens += tokensPerMessage;
      numTokens += tiktoken.encode(message.content).length;
      numTokens += switch (message) {
        final SystemChatMessage _ => tiktoken.encode('system').length,
        final HumanChatMessage _ => tiktoken.encode('user').length,
        final AIChatMessage msg => tiktoken.encode('assistant').length +
            (msg.functionCall != null
                ? tiktoken.encode(msg.functionCall!.name).length +
                    tiktoken
                        .encode(msg.functionCall!.arguments.toString())
                        .length
                : 0),
        final FunctionChatMessage msg =>
          tiktoken.encode(msg.name).length + tokensPerName,
        final CustomChatMessage msg => tiktoken.encode(msg.role).length,
      };
    }

    // every reply is primed with <im_start>assistant
    return numTokens + 3;
  }

  /// Returns the tiktoken model to use for the given model.
  Tiktoken _getTiktoken() {
    return encoding != null ? getEncoding(encoding!) : encodingForModel(model);
  }
}

/// {@template chat_openai}
/// Wrapper around [OpenAI Chat API](https://platform.openai.com/docs/api-reference/chat).
///
/// Example:
/// ```dart
/// final chat = ChatOpenAI(apiKey: '...', temperature: 1);
/// ```
/// {@endtemplate}
final class ChatOpenAI extends BaseChatOpenAI {
  /// {@macro chat_openai}
  ChatOpenAI({
    super.apiKey,
    super.apiClient,
    super.model = 'gpt-3.5-turbo',
    super.temperature = 0.7,
    super.topP = 1,
    super.n = 1,
    super.maxTokens,
    super.presencePenalty = 0,
    super.frequencyPenalty = 0,
    super.logitBias,
    super.encoding,
  });
}
