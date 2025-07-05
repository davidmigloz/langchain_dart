import 'dart:async';
import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

import 'chat/chat_models/chat_models.dart';
import 'chat/chat_models/message.dart' as msg;
import 'chat/chat_providers/chat_providers.dart';
import 'chat/tools/tools.dart';
import 'language_models/language_models.dart';
import 'logging_options.dart';

/// An agent that manages chat models and provides tool execution and message
/// collection capabilities.
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
      'Creating agent with model: $model (provider: $providerName, '
      'model: $modelName)',
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

    _logger.fine(
      'Agent created successfully with ${tools?.length ?? 0} tools, '
      'temperature: $temperature',
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
    _logger.info(
      'Creating agent from provider: ${provider.name}, model: $modelName',
    );

    _providerName = provider.name;
    _displayName = displayName;
    _model = provider.createModel(
      name: modelName,
      tools: tools,
      temperature: temperature,
    );

    _logger.fine(
      'Agent created from provider with ${tools?.length ?? 0} tools, '
      'temperature: $temperature',
    );
  }

  /// Creates an agent from a model.
  Agent.fromModel(
    ChatModel model, {
    required String providerName,
    String? displayName,
  }) {
    _logger.info('Creating agent from existing model, provider: $providerName');

    _providerName = providerName;
    _displayName = displayName;
    _model = model;

    _logger.fine('Agent created from existing model');
  }

  /// Logger for agent operations.
  static final Logger _logger = Logger('dartantic.agent');

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
  Future<ChatResult<String>> run(List<msg.Message> messages) async {
    _logger.info('Running agent with ${messages.length} messages');

    final allNewMessages = <msg.Message>[];
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

    _logger.info(
      'Agent run completed with ${allNewMessages.length} new messages, '
      'finish reason: ${finalResult.finishReason}',
    );

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
  Stream<ChatResult<String>> runStream(List<msg.Message> messages) async* {
    _logger.info('Starting agent stream with ${messages.length} messages');

    final conversationHistory = List<msg.Message>.from(messages);
    final toolMap = {
      for (final tool in _model.tools ?? <Tool>[]) tool.name: tool,
    };

    var done = false;
    _shouldPrefixNextMessage = false; // Reset at start of stream
    while (!done) {
      var isFirstChunkOfMessage = true; // Track first chunk of each AI message
      var currentAIMessage = const msg.Message(
        role: msg.MessageRole.model,
        parts: [],
      );
      var lastResult = const ChatResult<msg.Message>(
        id: '',
        output: msg.Message(role: msg.MessageRole.model, parts: []),
        finishReason: FinishReason.unspecified,
        metadata: <String, dynamic>{},
        usage: LanguageModelUsage(),
      );

      // Stream the raw response and collect it
      await for (final result in _model.sendStream(conversationHistory)) {
        // Stream the text output to the caller
        // Extract text content from Message output
        final textOutput = result.output.parts
            .whereType<msg.TextPart>()
            .map((p) => p.text)
            .join();

        if (textOutput.isNotEmpty) {
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

        // Accumulate the full message
        // Merge the parts from streaming chunks
        final newParts = result.output.parts;

        // For tool calls, ensure IDs are assigned if needed
        final processedParts = _shouldAssignIdsBeforeConcat(result.output)
            ? _assignToolCallIdsToMessage(newParts)
            : newParts;

        // Accumulate parts
        currentAIMessage = msg.Message(
          role: msg.MessageRole.model,
          parts: [...currentAIMessage.parts, ...processedParts],
        );
        lastResult = result;
      }

      // Assign UUIDs to tool calls that still have empty IDs
      // This handles providers like Ollama and Google that don't provide IDs
      final messageWithIds = msg.Message(
        role: msg.MessageRole.model,
        parts: _assignToolCallIdsToMessage(currentAIMessage.parts),
      );

      // Add the complete AI message to conversation history
      conversationHistory.add(messageWithIds);

      // Yield the complete AI message
      yield ChatResult<String>(
        id: lastResult.id,
        output: '',
        messages: [messageWithIds],
        finishReason: lastResult.finishReason,
        metadata: lastResult.metadata,
        usage: lastResult.usage,
      );

      // Check if we need to execute tools
      final toolCalls = messageWithIds.parts
          .whereType<msg.ToolPart>()
          .where((p) => p.kind == msg.ToolPartKind.call)
          .toList();

      if (toolCalls.isEmpty) {
        _logger.fine('No tool calls found, completing agent stream');
        done = true;
      } else {
        _logger.info(
          'Found ${toolCalls.length} tool calls to execute: '
          '${toolCalls.map((t) => t.name).join(', ')}',
        );
        // STREAMING UX: Set flag to prefix next AI message with newline
        //
        // Since this AI message has tool calls, we know another AI message
        // will follow (the synthesis response). Set flag so that message
        // gets visually separated with a newline prefix for better UX.
        _shouldPrefixNextMessage = true;
        // Execute all tools
        final toolResults = <msg.Message>[];
        for (final toolPart in toolCalls) {
          final tool = toolMap[toolPart.name];
          if (tool != null) {
            _logger.fine(
              'Executing tool: ${toolPart.name} with args: '
              '${toolPart.argumentsRaw}',
            );
            try {
              // Parse arguments from argumentsRaw if arguments is empty
              // This handles the streaming case where JSON parsing is deferred
              var parsedArguments = toolPart.arguments ?? {};
              if (parsedArguments.isEmpty && toolPart.argumentsRaw.isNotEmpty) {
                final decoded = json.decode(toolPart.argumentsRaw);
                if (decoded is Map<String, dynamic>) {
                  parsedArguments = decoded;
                } else {
                  // Handle cases where decoded is null or other types
                  // (e.g., Cohere sends "null" for tools with no parameters)
                  parsedArguments = <String, dynamic>{};
                }
              }

              final result = await tool.invoke(parsedArguments);
              final resultString = result is String
                  ? result
                  : json.encode(result);

              _logger.fine(
                'Tool ${toolPart.name} executed successfully, '
                'result length: ${resultString.length}',
              );

              // Create a user message with tool result part
              toolResults.add(
                msg.Message(
                  role: msg.MessageRole.user,
                  parts: [
                    msg.ToolPart.result(
                      id: toolPart.id,
                      name: toolPart.name,
                      result: resultString,
                    ),
                  ],
                ),
              );
            } on Exception catch (error) {
              _logger.warning('Tool ${toolPart.name} execution failed: $error');

              toolResults.add(
                msg.Message(
                  role: msg.MessageRole.user,
                  parts: [
                    msg.ToolPart.result(
                      id: toolPart.id,
                      name: toolPart.name,
                      result: json.encode({'error': error.toString()}),
                    ),
                  ],
                ),
              );
            }
          } else {
            _logger.warning(
              'Tool ${toolPart.name} not found in available tools: '
              '${toolMap.keys.join(', ')}',
            );
          }
        }

        // Add tool results to conversation history
        conversationHistory.addAll(toolResults);
        _logger.fine(
          'Added ${toolResults.length} tool results to conversation history',
        );

        // Yield tool results
        yield ChatResult<String>(
          id: lastResult.id,
          output: '',
          messages: toolResults,
          finishReason: lastResult.finishReason,
          metadata: lastResult.metadata,
          usage: lastResult.usage,
        );
      }
    }
  }

  /// Determines if UUIDs should be assigned before concatenation.
  ///
  /// Returns true for providers that send multiple tool calls with empty IDs
  /// in the same chunk (Ollama, Google), which would cause incorrect merging.
  /// Returns false for providers that use proper streaming protocols.
  bool _shouldAssignIdsBeforeConcat(msg.Message message) {
    final toolParts = message.parts
        .whereType<msg.ToolPart>()
        .where((p) => p.kind == msg.ToolPartKind.call)
        .toList();

    // If there are multiple tool calls and any have empty IDs, we need to
    // assign UUIDs before concat to prevent incorrect merging
    if (toolParts.length > 1) {
      return toolParts.any((tc) => tc.id.isEmpty);
    }

    // For single tool calls, check if it has an empty ID and no name
    // This indicates a partial chunk that should be concatenated
    if (toolParts.length == 1) {
      final toolCall = toolParts.first;
      return toolCall.id.isEmpty && toolCall.name.isNotEmpty;
    }

    return false;
  }

  /// Assigns UUIDs to tool parts that don't have IDs.
  ///
  /// This is primarily for providers like Ollama and Google that don't
  /// provide tool call IDs. OpenAI provides proper IDs and uses a different
  /// streaming protocol where partial tool calls should be concatenated.
  List<msg.Part> _assignToolCallIdsToMessage(List<msg.Part> parts) =>
      parts.map((part) {
        if (part is msg.ToolPart &&
            part.kind == msg.ToolPartKind.call &&
            part.id.isEmpty) {
          // Only assign UUIDs if the tool call has an empty ID
          return msg.ToolPart.call(
            id: _uuid.v4(),
            name: part.name,
            arguments: part.arguments ?? {},
          );
        }
        // Return as-is if not a tool call or ID already exists
        return part;
      }).toList();
}
