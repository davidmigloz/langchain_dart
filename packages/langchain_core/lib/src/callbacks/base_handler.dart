import '../agents/types.dart';
import '../chat_models/types.dart';
import '../documents/document.dart';
import '../language_models/types.dart';
import '../prompts/types.dart';
import 'types.dart';

/// {@template base_callback_handler}
/// Base class for callback handlers.
///
/// Callback handlers can be used to listen to events that occur during the
/// execution of LangChain components (chat models, LLMs, chains, tools,
/// retrievers, agents).
///
/// To create a custom callback handler, extend this class and override the
/// methods you are interested in.
///
/// Example:
/// ```dart
/// class MyHandler extends BaseCallbackHandler {
///   @override
///   void onChatModelStart({
///     required RunInfo runInfo,
///     required List<ChatMessage> messages,
///   }) {
///     print('Chat model started with ${messages.length} messages');
///   }
///
///   @override
///   void onLlmEnd({
///     required RunInfo runInfo,
///     required LanguageModelResult<Object> output,
///   }) {
///     print('LLM finished: ${output.outputAsString}');
///   }
/// }
/// ```
/// {@endtemplate}
abstract class BaseCallbackHandler {
  /// {@macro base_callback_handler}
  const BaseCallbackHandler({
    this.ignoreLlm = false,
    this.ignoreChain = false,
    this.ignoreTool = false,
    this.ignoreRetriever = false,
    this.ignoreAgent = false,
    this.ignoreCustomEvent = false,
    this.raiseError = false,
  });

  /// If true, LLM/chat model callbacks will be ignored.
  final bool ignoreLlm;

  /// If true, chain callbacks will be ignored.
  final bool ignoreChain;

  /// If true, tool callbacks will be ignored.
  final bool ignoreTool;

  /// If true, retriever callbacks will be ignored.
  final bool ignoreRetriever;

  /// If true, agent callbacks will be ignored.
  final bool ignoreAgent;

  /// If true, custom event callbacks will be ignored.
  final bool ignoreCustomEvent;

  /// If true, errors thrown by this handler will be re-thrown
  /// instead of being silently caught.
  final bool raiseError;

  // -- LLM / Chat Model callbacks --

  /// Called when an LLM starts running.
  void onLlmStart({required RunInfo runInfo, required PromptValue input}) {}

  /// Called when a chat model starts running.
  void onChatModelStart({
    required RunInfo runInfo,
    required List<ChatMessage> messages,
  }) {}

  /// Called when an LLM produces a new token during streaming.
  void onLlmNewToken({required RunInfo runInfo, required String token}) {}

  /// Called when an LLM/chat model finishes running.
  void onLlmEnd({
    required RunInfo runInfo,
    required LanguageModelResult<Object> output,
  }) {}

  /// Called when an LLM/chat model encounters an error.
  void onLlmError({required RunInfo runInfo, required Object error}) {}

  // -- Chain callbacks --

  /// Called when a chain starts running.
  void onChainStart({
    required RunInfo runInfo,
    required Map<String, dynamic> inputs,
  }) {}

  /// Called when a chain finishes running.
  void onChainEnd({
    required RunInfo runInfo,
    required Map<String, dynamic> outputs,
  }) {}

  /// Called when a chain encounters an error.
  void onChainError({required RunInfo runInfo, required Object error}) {}

  // -- Tool callbacks --

  /// Called when a tool starts running.
  void onToolStart({required RunInfo runInfo, required Object input}) {}

  /// Called when a tool finishes running.
  void onToolEnd({required RunInfo runInfo, required Object output}) {}

  /// Called when a tool encounters an error.
  void onToolError({required RunInfo runInfo, required Object error}) {}

  // -- Retriever callbacks --

  /// Called when a retriever starts running.
  void onRetrieverStart({required RunInfo runInfo, required String query}) {}

  /// Called when a retriever finishes running.
  void onRetrieverEnd({
    required RunInfo runInfo,
    required List<Document> documents,
  }) {}

  /// Called when a retriever encounters an error.
  void onRetrieverError({required RunInfo runInfo, required Object error}) {}

  // -- Agent callbacks --

  /// Called when an agent decides on an action.
  void onAgentAction({required RunInfo runInfo, required AgentAction action}) {}

  /// Called when an agent finishes.
  void onAgentFinish({required RunInfo runInfo, required AgentFinish finish}) {}

  // -- Other callbacks --

  /// Called when text is produced.
  void onText({required RunInfo runInfo, required String text}) {}

  /// Called when a custom event is dispatched.
  void onCustomEvent({
    required RunInfo runInfo,
    required String name,
    required Object? data,
  }) {}
}
