import 'dart:async';
import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

import 'chat/chat_models/chat_models.dart';
import 'chat/chat_providers/chat_providers.dart';
import 'chat/tools/tools.dart';
import 'language_models/language_models.dart';
import 'logging_options.dart';

/// An agent that manages chat models and provides tool execution and message
/// collection capabilities using the new Message/Part types.
///
/// The Agent handles:
/// - Provider and model creation from string specification
/// - Tool call ID assignment for providers that don't provide them
/// - Automatic tool execution with error handling
/// - Message collection and streaming UX enhancement
/// - Model caching and lifecycle management
class Agent {
  /// Creates an agent with the specified model.
  ///
  /// The [model] parameter should be in the format "providerName",
  /// "providerName:modelName", or "providerName/modelName".
  /// For example: "openai", "openai:gpt-4o", "openai/gpt-4o",
  /// "anthropic", "anthropic:claude-3-sonnet", etc.
  ///
  /// Optional parameters:
  /// - [tools]: List of tools the agent can use
  /// - [temperature]: Model temperature (0.0 to 1.0)
  Agent(
    String model, {
    List<Tool>? tools,
    double? temperature,
    String? displayName,
  }) {
    // split the model into provider name and model name
    final index = model.indexOf(RegExp('[:/]'));
    final providerName = index == -1 ? model : model.substring(0, index);
    final modelName = index == -1 ? null : model.substring(index + 1);

    _logger.info(
      'Creating agent message with model: $model '
      '(provider: $providerName, model: $modelName)',
    );

    // cache the provider name from the input; it could be an alias
    _providerName = providerName;
    _displayName = displayName;

    // Create model
    final provider = ChatProvider.forName(providerName);
    _model = provider.createModel(
      name: modelName,
      tools: tools,
      temperature: temperature,
    );
  }

  /// Creates an agent from a provider
  Agent.fromProvider(
    ChatProvider provider, {
    String? modelName,
    List<Tool>? tools,
    double? temperature,
    String? displayName,
  }) {
    _providerName = provider.name;
    _displayName = displayName;
    _model = provider.createModel(
      name: modelName,
      tools: tools,
      temperature: temperature,
    );
  }

  /// Creates an agent from a model.
  Agent.fromModel(
    ChatModel model, {
    required String providerName,
    String? displayName,
  }) {
    _providerName = providerName;
    _displayName = displayName;
    _model = model;
  }

  /// Logger for agent message operations.
  static final Logger _logger = Logger('dartantic.agent.message');

  /// Global logging configuration for all Agent operations.
  ///
  /// Controls logging level, filtering, and output handling for all dartantic
  /// loggers. Setting this property automatically configures the logging
  /// system with the specified options.
  ///
  /// Example usage:
  /// ```dart
  /// // Filter to only OpenAI operations
  /// Agent.loggingOptions = LoggingOptions(filter: 'openai');
  ///
  /// // Custom level and handler
  /// Agent.loggingOptions = LoggingOptions(
  ///   level: Level.FINE,
  ///   onRecord: (record) => myLogger.log(record),
  /// );
  /// ```
  static LoggingOptions get loggingOptions => _loggingOptions;
  static LoggingOptions _loggingOptions = const LoggingOptions();
  static StreamSubscription<LogRecord>? _loggingSubscription;

  /// Sets the global logging configuration and applies it immediately.
  static set loggingOptions(LoggingOptions options) {
    _loggingOptions = options;
    _setupLogging();
  }

  /// Sets up the logging system with the current options.
  static void _setupLogging() {
    // Cancel existing subscription if any
    unawaited(_loggingSubscription?.cancel());

    // Configure root logger level
    Logger.root.level = _loggingOptions.level;

    // Set up new subscription with filtering
    _loggingSubscription = Logger.root.onRecord.listen((record) {
      // Apply level filter (should already be handled by Logger.root.level)
      if (record.level < _loggingOptions.level) return;

      // Apply name filter - empty string matches all
      if (_loggingOptions.filter.isNotEmpty &&
          !record.loggerName.contains(_loggingOptions.filter)) {
        return;
      }

      // Call the configured handler
      _loggingOptions.onRecord(record);
    });
  }

  /// Gets the provider name.
  String get providerName => _providerName;

  /// Gets the model name.
  String get modelName => _model.name;

  /// Gets the fully qualified model name.
  String get model => '$providerName:$modelName';

  /// Gets the display name.
  String get displayName => _displayName ?? model;

  /// Gets an environment map for the agent.
  static Map<String, String> environment = {};

  /// Closes the underlying model.
  void close() => _model.dispose();

  late final String _providerName;
  late final ChatModel _model;
  late final String? _displayName;
  static const _uuid = Uuid();

  /// Flag to track if we should prefix the next AI message with a newline.
  /// Used to separate consecutive AI messages for better readability.
  ///
  /// CRITICAL FOR UX: This prevents AI responses from running together like:
  /// "I'll help you with that.The result is 42."
  ///
  /// Instead produces readable output like:
  /// "I'll help you with that.
  /// The result is 42."
  ///
  /// ⚠️  WARNING: Removing this feature will cause poor streaming UX where
  /// consecutive AI messages (initial response + tool synthesis) appear as
  /// one continuous sentence without proper separation. Users will see
  /// confusing output like "...tools.The..." instead of clear message breaks.
  ///
  /// This flag is set to true when an AI message contains tool calls
  /// (indicating another AI message will follow), and used to prefix the first
  /// chunk of the subsequent AI message with a newline for visual separation.
  bool _shouldPrefixNextMessage = false;

  /// Invokes the agent with the given messages and returns the final result.
  ///
  /// This method internally uses [runStream] and accumulates all results.
  Future<ChatResult<String>> run(List<Message> messages) async {
    final allNewMessages = <Message>[];
    var finalOutput = '';
    var finalResult = const ChatResult<String>(
      id: '',
      output: '',
      finishReason: FinishReason.unspecified,
      metadata: <String, dynamic>{},
      usage: LanguageModelUsage(),
    );

    await for (final result in runStream(messages)) {
      final outputText = result.outputAsString;
      if (outputText.isNotEmpty) {
        finalOutput += outputText;
      }
      allNewMessages.addAll(result.messages);
      finalResult = result;
    }

    return ChatResult<String>(
      id: finalResult.id,
      output: finalOutput,
      messages: allNewMessages,
      finishReason: finalResult.finishReason,
      metadata: finalResult.metadata,
      usage: finalResult.usage,
    );
  }

  /// Streams responses from the agent, handling tool execution automatically.
  ///
  /// Returns a stream of [ChatResult] where:
  /// - [ChatResult.output] contains streaming text chunks
  /// - [ChatResult.messages] contains new messages since the last result
  Stream<ChatResult<String>> runStream(List<Message> messages) async* {
    final conversationHistory = List<Message>.from(messages);
    final toolMap = {
      for (final tool in _model.tools ?? <Tool>[]) tool.name: tool,
    };

    var done = false;
    _shouldPrefixNextMessage = false; // Reset at start of stream
    while (!done) {
      var isFirstChunkOfMessage = true; // Track first chunk of each AI message
      final textBuffer = StringBuffer();
      final toolCalls = <ToolPart>[];
      var lastResult = const ChatResult<Message>(
        id: '',
        output: Message(role: MessageRole.model, parts: []),
        finishReason: FinishReason.unspecified,
        metadata: <String, dynamic>{},
        usage: LanguageModelUsage(),
      );

      // Stream the raw response and collect it
      await for (final result in _model.sendStream(conversationHistory)) {
        // Extract text and tool parts from the message
        final textParts = result.output.parts.whereType<TextPart>();
        final newToolParts = result.output.parts.whereType<ToolPart>();

        // Accumulate text content
        final textOutput = textParts.map((p) => p.text).join();

        if (textOutput.isNotEmpty) {
          textBuffer.write(textOutput);

          // STREAMING UX ENHANCEMENT: Add newline prefix for readability
          //
          // This critical UX feature prevents consecutive AI messages from
          // running together (e.g. "...tools.The..." → "...tools.\nThe...")
          //
          // Only prefixes the FIRST chunk of subsequent AI messages, not every
          // chunk within the same message, to maintain proper text flow.
          //
          // Logic: If _shouldPrefixNextMessage is true (set when previous AI
          // message had tool calls) AND this is the first chunk of the new
          // message, then prefix with newline.
          final streamOutput =
              (_shouldPrefixNextMessage && isFirstChunkOfMessage)
              ? '\n$textOutput'
              : textOutput;
          isFirstChunkOfMessage = false;

          yield ChatResult<String>(
            id: result.id,
            output: streamOutput,
            messages: const [],
            finishReason: result.finishReason,
            metadata: result.metadata,
            usage: result.usage,
          );
        }

        // Accumulate tool calls
        for (final toolPart in newToolParts) {
          if (toolPart.kind == ToolPartKind.call) {
            // Skip empty tool calls (streaming artifacts)
            if (toolPart.name.isEmpty && toolPart.id.isEmpty) {
              continue;
            }

            // For streaming, merge tool calls with same ID
            final existingIndex = toolCalls.indexWhere(
              (t) => t.id == toolPart.id && t.id.isNotEmpty,
            );

            if (existingIndex >= 0) {
              // Merge with existing tool call (for streaming arguments)
              final existing = toolCalls[existingIndex];
              toolCalls[existingIndex] = _mergeToolParts(existing, toolPart);
            } else {
              // Add new tool call
              toolCalls.add(toolPart);
            }
          }
        }

        lastResult = result;
      }

      // Assign UUIDs to tool calls that don't have IDs
      final toolCallsWithIds = _assignToolCallIds(toolCalls);

      // Create the complete message with all parts
      final parts = <Part>[];
      if (textBuffer.isNotEmpty) {
        parts.add(TextPart(textBuffer.toString()));
      }
      parts.addAll(toolCallsWithIds);

      final completeMessage = Message(role: MessageRole.model, parts: parts);

      // Add the complete AI message to conversation history
      conversationHistory.add(completeMessage);

      // Yield the complete AI message
      yield ChatResult<String>(
        id: lastResult.id,
        output: '',
        messages: [completeMessage],
        finishReason: lastResult.finishReason,
        metadata: lastResult.metadata,
        usage: lastResult.usage,
      );

      // Check if we need to execute tools
      if (toolCallsWithIds.isEmpty) {
        done = true;
      } else {
        // STREAMING UX: Set flag to prefix next AI message with newline
        //
        // Since this AI message has tool calls, we know another AI message
        // will follow (the synthesis response). Set flag so that message
        // gets visually separated with a newline prefix for better UX.
        _shouldPrefixNextMessage = true;

        // Execute all tools
        final toolResultMessages = <Message>[];
        for (final toolPart in toolCallsWithIds) {
          final tool = toolMap[toolPart.name];
          if (tool != null) {
            try {
              // Use the arguments directly from the ToolPart
              final parsedArguments = toolPart.arguments ?? <String, dynamic>{};

              final result = await tool.invoke(parsedArguments);
              final resultString = result is String
                  ? result
                  : json.encode(result);

              // Create a tool result message
              toolResultMessages.add(
                Message(
                  role: MessageRole.user,
                  parts: [
                    ToolPart.result(
                      id: toolPart.id,
                      name: toolPart.name,
                      result: resultString,
                    ),
                  ],
                ),
              );
            } on Exception catch (error) {
              // Create an error result message
              toolResultMessages.add(
                Message(
                  role: MessageRole.user,
                  parts: [
                    ToolPart.result(
                      id: toolPart.id,
                      name: toolPart.name,
                      result: json.encode({'error': error.toString()}),
                    ),
                  ],
                ),
              );
            }
          }
        }

        // Add tool results to conversation history
        conversationHistory.addAll(toolResultMessages);

        // Yield tool results
        yield ChatResult<String>(
          id: lastResult.id,
          output: '',
          messages: toolResultMessages,
          finishReason: lastResult.finishReason,
          metadata: lastResult.metadata,
          usage: lastResult.usage,
        );
      }
    }
  }

  /// Merges two ToolPart instances during streaming.
  ///
  /// This handles the case where tool call arguments are streamed in chunks.
  ToolPart _mergeToolParts(ToolPart existing, ToolPart update) {
    // Only merge tool calls, not results
    if (existing.kind != ToolPartKind.call ||
        update.kind != ToolPartKind.call) {
      return update;
    }

    // Merge arguments if both have them
    final mergedArguments = <String, dynamic>{};
    if (existing.arguments != null) {
      mergedArguments.addAll(existing.arguments!);
    }
    if (update.arguments != null) {
      mergedArguments.addAll(update.arguments!);
    }

    return ToolPart.call(
      id: existing.id.isNotEmpty ? existing.id : update.id,
      name: existing.name.isNotEmpty ? existing.name : update.name,
      arguments: mergedArguments.isNotEmpty ? mergedArguments : null,
    );
  }

  /// Assigns UUIDs to tool calls that don't have IDs.
  ///
  /// This handles providers that don't provide tool call IDs (e.g., Google).
  List<ToolPart> _assignToolCallIds(List<ToolPart> toolParts) =>
      toolParts.map((toolPart) {
        if (toolPart.kind == ToolPartKind.call && toolPart.id.isEmpty) {
          return ToolPart.call(
            id: _uuid.v4(),
            name: toolPart.name,
            arguments: toolPart.arguments,
          );
        }
        return toolPart;
      }).toList();
}
