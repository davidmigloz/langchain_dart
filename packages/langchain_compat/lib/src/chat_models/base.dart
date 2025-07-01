// ignore_for_file: avoid_final_parameters

import 'package:meta/meta.dart';

import '../language_models/language_models.dart';
import '../prompts/types.dart';
import '../tools/base.dart';
import '../utils/reduce.dart';
import 'types.dart';

/// {@template base_chat_model}
/// Chat models base class.
/// It should take in chat messages and return a chat message.
/// {@endtemplate}
abstract class BaseChatModel<Options extends ChatModelOptions>
    extends BaseLanguageModel<List<ChatMessage>, Options, ChatResult> {
  /// {@macro base_chat_model}
  const BaseChatModel({
    required super.defaultOptions,
    String? model,
    List<ToolSpec>? tools,
    double? temperature,
  }) : _model = model,
       _tools = tools,
       _temperature = temperature;

  /// The model ID to use.
  final String? _model;

  /// The tools the model may call.
  final List<ToolSpec>? _tools;

  /// The temperature for the model.
  final double? _temperature;

  /// The model ID to use.
  String? get model => _model;

  /// The tools the model may call.
  List<ToolSpec>? get tools => _tools;

  /// The temperature for the model.
  double? get temperature => _temperature;

  /// The name of the model.
  String get name;

  @override
  Stream<ChatResult> streamFromInputStream(
    Stream<PromptValue> inputStream, {
    Options? options,
  }) async* {
    final input = await inputStream.toList();
    final reduced = reduce<PromptValue>(input);
    yield* stream(reduced, options: options);
  }

  /// Runs the chat model on the given messages and returns a chat message.
  ///
  /// - [messages] The messages to pass into the model.
  /// - [options] Generation options to pass into the Chat Model.
  ///
  /// Example:
  /// ```dart
  /// final result = await chat([ChatMessage.humanText('say hi!')]);
  /// ```
  Future<AIChatMessage> call(
    List<ChatMessage> messages, {
    Options? options,
  }) async {
    final result = await invoke(PromptValue.chat(messages), options: options);
    return result.output;
  }
}

/// {@template simple_chat_model}
/// [SimpleChatModel] provides a simplified interface for working with chat
/// models, rather than expecting the user to implement the full
/// [SimpleChatModel.invoke] method.
/// {@endtemplate}
abstract class SimpleChatModel<Options extends ChatModelOptions>
    extends BaseChatModel<Options> {
  /// {@macro simple_chat_model}
  const SimpleChatModel({
    required super.defaultOptions,
    super.model,
    super.tools,
    super.temperature,
  });

  @override
  Future<ChatResult> invoke(PromptValue input, {Options? options}) async {
    final text = await callInternal(input.toChatMessages(), options: options);
    final message = AIChatMessage(content: text);
    return ChatResult(
      id: '1',
      output: message,
      finishReason: FinishReason.unspecified,
      metadata: const {},
      usage: const LanguageModelUsage(),
    );
  }

  /// Method which should be implemented by subclasses to run the model.
  @visibleForOverriding
  Future<String> callInternal(List<ChatMessage> messages, {Options? options});
}
