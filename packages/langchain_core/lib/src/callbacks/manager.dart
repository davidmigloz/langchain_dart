import '../chat_models/types.dart';
import '../prompts/types.dart';
import 'base_handler.dart';
import 'run_managers.dart';
import 'types.dart';

/// {@template callback_manager}
/// Manages callback handlers and dispatches events during runs.
///
/// The [CallbackManager] is responsible for:
/// - Holding a list of [BaseCallbackHandler]s
/// - Creating run managers via `handleXStart` methods
/// - Creating child managers for nested runs
///
/// Use [CallbackManager.configure] as the primary entry point.
/// It returns `null` when no callbacks are configured (zero overhead fast
/// path).
/// {@endtemplate}
class CallbackManager {
  /// {@macro callback_manager}
  CallbackManager({
    required this.handlers,
    this.parentRunId,
    this.tags,
    this.metadata,
  });

  /// The callback handlers managed by this manager.
  final List<BaseCallbackHandler> handlers;

  /// The parent run ID, if this manager was created for a nested run.
  final String? parentRunId;

  /// Tags to associate with runs created by this manager.
  final List<String>? tags;

  /// Metadata to associate with runs created by this manager.
  final Map<String, dynamic>? metadata;

  /// Configures a [CallbackManager] from the given parameters.
  ///
  /// Returns `null` if no callbacks are configured, enabling a fast path
  /// with zero callback overhead.
  static CallbackManager? configure({
    Callbacks? callbacks,
    List<String>? tags,
    Map<String, dynamic>? metadata,
    String? parentRunId,
  }) {
    if (callbacks == null || callbacks.isEmpty) return null;
    return CallbackManager(
      handlers: callbacks,
      parentRunId: parentRunId,
      tags: tags,
      metadata: metadata,
    );
  }

  RunInfo _createRunInfo() {
    return RunInfo(
      runId: generateRunId(),
      parentRunId: parentRunId,
      tags: tags,
      metadata: metadata,
    );
  }

  /// Dispatches [BaseCallbackHandler.onLlmStart] and returns a run manager.
  LlmRunManager handleLlmStart({required PromptValue input}) {
    final runInfo = _createRunInfo();
    for (final handler in handlers) {
      if (handler.ignoreLlm) continue;
      try {
        handler.onLlmStart(runInfo: runInfo, input: input);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
    return LlmRunManager(runInfo: runInfo, handlers: handlers);
  }

  /// Dispatches [BaseCallbackHandler.onChatModelStart] and returns a run
  /// manager.
  ChatModelRunManager handleChatModelStart({
    required List<ChatMessage> messages,
  }) {
    final runInfo = _createRunInfo();
    for (final handler in handlers) {
      if (handler.ignoreLlm) continue;
      try {
        handler.onChatModelStart(runInfo: runInfo, messages: messages);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
    return ChatModelRunManager(runInfo: runInfo, handlers: handlers);
  }

  /// Dispatches [BaseCallbackHandler.onChainStart] and returns a run manager.
  ChainRunManager handleChainStart({required Map<String, dynamic> inputs}) {
    final runInfo = _createRunInfo();
    for (final handler in handlers) {
      if (handler.ignoreChain) continue;
      try {
        handler.onChainStart(runInfo: runInfo, inputs: inputs);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
    return ChainRunManager(runInfo: runInfo, handlers: handlers);
  }

  /// Dispatches [BaseCallbackHandler.onToolStart] and returns a run manager.
  ToolRunManager handleToolStart({required Object input}) {
    final runInfo = _createRunInfo();
    for (final handler in handlers) {
      if (handler.ignoreTool) continue;
      try {
        handler.onToolStart(runInfo: runInfo, input: input);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
    return ToolRunManager(runInfo: runInfo, handlers: handlers);
  }

  /// Dispatches [BaseCallbackHandler.onRetrieverStart] and returns a run
  /// manager.
  RetrieverRunManager handleRetrieverStart({required String query}) {
    final runInfo = _createRunInfo();
    for (final handler in handlers) {
      if (handler.ignoreRetriever) continue;
      try {
        handler.onRetrieverStart(runInfo: runInfo, query: query);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
    return RetrieverRunManager(runInfo: runInfo, handlers: handlers);
  }

  /// Dispatches [BaseCallbackHandler.onCustomEvent] to all handlers.
  void handleCustomEvent({required String name, required Object? data}) {
    final runInfo = _createRunInfo();
    for (final handler in handlers) {
      if (handler.ignoreCustomEvent) continue;
      try {
        handler.onCustomEvent(runInfo: runInfo, name: name, data: data);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
  }
}
