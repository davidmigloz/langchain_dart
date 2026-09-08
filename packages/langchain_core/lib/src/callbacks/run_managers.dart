import '../agents/types.dart';
import '../documents/document.dart';
import '../language_models/types.dart';
import 'base_handler.dart';
import 'manager.dart';
import 'types.dart';

/// {@template run_manager}
/// Base class for run managers.
///
/// A run manager is returned by [CallbackManager] `handleXStart` methods
/// and provides methods to dispatch end/error events for that run.
/// {@endtemplate}
class RunManager {
  /// {@macro run_manager}
  const RunManager({required this.runInfo, required this.handlers});

  /// Information about the current run.
  final RunInfo runInfo;

  /// The callback handlers to dispatch events to.
  final List<BaseCallbackHandler> handlers;

  /// Creates a child [CallbackManager] for nested runs.
  CallbackManager getChild() {
    return CallbackManager(
      handlers: handlers,
      parentRunId: runInfo.runId,
      tags: runInfo.tags,
      metadata: runInfo.metadata,
    );
  }
}

/// {@template llm_run_manager}
/// Run manager for LLM runs.
/// {@endtemplate}
class LlmRunManager extends RunManager {
  /// {@macro llm_run_manager}
  const LlmRunManager({required super.runInfo, required super.handlers});

  /// Dispatches [BaseCallbackHandler.onLlmNewToken] to all handlers.
  void handleNewToken(String token) {
    for (final handler in handlers) {
      if (handler.ignoreLlm) continue;
      try {
        handler.onLlmNewToken(runInfo: runInfo, token: token);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
  }

  /// Dispatches [BaseCallbackHandler.onLlmEnd] to all handlers.
  void handleEnd(LanguageModelResult<Object> output) {
    for (final handler in handlers) {
      if (handler.ignoreLlm) continue;
      try {
        handler.onLlmEnd(runInfo: runInfo, output: output);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
  }

  /// Dispatches [BaseCallbackHandler.onLlmError] to all handlers.
  void handleError(Object error) {
    for (final handler in handlers) {
      if (handler.ignoreLlm) continue;
      try {
        handler.onLlmError(runInfo: runInfo, error: error);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
  }
}

/// {@template chat_model_run_manager}
/// Run manager for chat model runs.
/// {@endtemplate}
class ChatModelRunManager extends LlmRunManager {
  /// {@macro chat_model_run_manager}
  const ChatModelRunManager({required super.runInfo, required super.handlers});
}

/// {@template chain_run_manager}
/// Run manager for chain runs.
/// {@endtemplate}
class ChainRunManager extends RunManager {
  /// {@macro chain_run_manager}
  const ChainRunManager({required super.runInfo, required super.handlers});

  /// Dispatches [BaseCallbackHandler.onChainEnd] to all handlers.
  void handleEnd(Map<String, dynamic> outputs) {
    for (final handler in handlers) {
      if (handler.ignoreChain) continue;
      try {
        handler.onChainEnd(runInfo: runInfo, outputs: outputs);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
  }

  /// Dispatches [BaseCallbackHandler.onChainError] to all handlers.
  void handleError(Object error) {
    for (final handler in handlers) {
      if (handler.ignoreChain) continue;
      try {
        handler.onChainError(runInfo: runInfo, error: error);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
  }

  /// Dispatches [BaseCallbackHandler.onAgentAction] to all handlers.
  void handleAgentAction(AgentAction action) {
    for (final handler in handlers) {
      if (handler.ignoreAgent) continue;
      try {
        handler.onAgentAction(runInfo: runInfo, action: action);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
  }

  /// Dispatches [BaseCallbackHandler.onAgentFinish] to all handlers.
  void handleAgentFinish(AgentFinish finish) {
    for (final handler in handlers) {
      if (handler.ignoreAgent) continue;
      try {
        handler.onAgentFinish(runInfo: runInfo, finish: finish);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
  }

  /// Dispatches [BaseCallbackHandler.onText] to all handlers.
  void handleText(String text) {
    for (final handler in handlers) {
      try {
        handler.onText(runInfo: runInfo, text: text);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
  }
}

/// {@template tool_run_manager}
/// Run manager for tool runs.
/// {@endtemplate}
class ToolRunManager extends RunManager {
  /// {@macro tool_run_manager}
  const ToolRunManager({required super.runInfo, required super.handlers});

  /// Dispatches [BaseCallbackHandler.onToolEnd] to all handlers.
  void handleEnd(Object output) {
    for (final handler in handlers) {
      if (handler.ignoreTool) continue;
      try {
        handler.onToolEnd(runInfo: runInfo, output: output);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
  }

  /// Dispatches [BaseCallbackHandler.onToolError] to all handlers.
  void handleError(Object error) {
    for (final handler in handlers) {
      if (handler.ignoreTool) continue;
      try {
        handler.onToolError(runInfo: runInfo, error: error);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
  }
}

/// {@template retriever_run_manager}
/// Run manager for retriever runs.
/// {@endtemplate}
class RetrieverRunManager extends RunManager {
  /// {@macro retriever_run_manager}
  const RetrieverRunManager({required super.runInfo, required super.handlers});

  /// Dispatches [BaseCallbackHandler.onRetrieverEnd] to all handlers.
  void handleEnd(List<Document> documents) {
    for (final handler in handlers) {
      if (handler.ignoreRetriever) continue;
      try {
        handler.onRetrieverEnd(runInfo: runInfo, documents: documents);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
  }

  /// Dispatches [BaseCallbackHandler.onRetrieverError] to all handlers.
  void handleError(Object error) {
    for (final handler in handlers) {
      if (handler.ignoreRetriever) continue;
      try {
        handler.onRetrieverError(runInfo: runInfo, error: error);
      } catch (e) {
        if (handler.raiseError) rethrow;
      }
    }
  }
}
