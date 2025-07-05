import 'dart:async';
import 'dart:convert';

import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

import 'chat/chat_models/chat_models.dart';
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
  /// "providerName:modelName", or "providerName/modelName". For example:
  /// "openai", "openai:gpt-4o", "openai/gpt-4o", "anthropic",
  /// "anthropic:claude-3-sonnet", etc.
  ///
  /// Optional parameters:
  /// - [tools]: List of tools the agent can use
  /// - [temperature]: Model temperature (0.0 to 1.0)
  /// - [systemPrompt]: Default system prompt for the agent
  Agent(
    String model, {
    List<Tool>? tools,
    double? temperature,
    String? systemPrompt,
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
      systemPrompt: systemPrompt,
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
    String? systemPrompt,
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
      systemPrompt: systemPrompt,
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
  /// loggers. Setting this property automatically configures the logging system
  /// with the specified options.
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
  void dispose() => _model.dispose();

  late final String _providerName;
  late final ChatModel _model;
  late final String? _displayName;
  static const _uuid = Uuid();

  /// Invokes the agent with the given prompt and returns the final result.
  ///
  /// This method internally uses [runStream] and accumulates all results.
  Future<ChatResult<String>> run(
    String prompt, {
    List<ChatMessage> history = const [],
    List<Part> attachments = const [],
  }) async {
    _logger.info(
      'Running agent with prompt and ${history.length} history messages',
    );

    final allNewMessages = <ChatMessage>[];
    var finalOutput = '';
    var finalResult = const ChatResult<String>(
      id: '',
      output: '',
      finishReason: FinishReason.unspecified,
      metadata: <String, dynamic>{},
      usage: LanguageModelUsage(),
    );

    await for (final result in runStream(
      prompt,
      history: history,
      attachments: attachments,
    )) {
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

  /// Runs the given [prompt] through the model and returns a typed response.
  ///
  /// Returns an [ChatResult<TOutput>] containing the output converted to type
  /// [TOutput]. Uses [outputFromJson] to convert the JSON response if provided,
  /// otherwise returns the decoded JSON.
  Future<ChatResult<TOutput>> runFor<TOutput extends Object>(
    String prompt, {
    required JsonSchema outputSchema,
    dynamic Function(Map<String, dynamic> json)? outputFromJson,
    List<ChatMessage> history = const [],
    List<Part> attachments = const [],
  }) async {
    final response = await run(
      prompt,
      history: history,
      attachments: attachments,
    );

    final outputJson = jsonDecode(response.output);
    final typedOutput = outputFromJson?.call(outputJson) ?? outputJson;
    return ChatResult<TOutput>(
      id: response.id,
      output: typedOutput,
      messages: response.messages,
      finishReason: response.finishReason,
      metadata: response.metadata,
      usage: response.usage,
    );
  }

  /// Streams responses from the agent, handling tool execution automatically.
  ///
  /// Returns a stream of [ChatResult] where:
  /// - [ChatResult.output] contains streaming text chunks
  /// - [ChatResult.messages] contains new messages since the last result
  Stream<ChatResult<String>> runStream(
    String prompt, {
    List<ChatMessage> history = const [],
    List<Part> attachments = const [],
  }) async* {
    _logger.info(
      'Starting agent stream with prompt and ${history.length} '
      'history messages',
    );

    // Create new user message from prompt and attachments
    final newUserMessage = ChatMessage.userParts([
      TextPart(prompt),
      ...attachments,
    ]);

    // Immediately yield the new user message
    _assertNoMultipleTextParts([newUserMessage]);
    yield ChatResult<String>(
      id: '',
      output: '',
      messages: [newUserMessage],
      finishReason: FinishReason.unspecified,
      metadata: const <String, dynamic>{},
      usage: const LanguageModelUsage(),
    );

    // Build full conversation history
    final conversationHistory = List<ChatMessage>.from([
      ...history,
      newUserMessage,
    ]);
    final toolMap = {
      for (final tool in _model.tools ?? <Tool>[]) tool.name: tool,
    };

    var done = false;
    var shouldPrefixNextMessage = false; // Local state for this stream
    while (!done) {
      var isFirstChunkOfMessage = true; // Track first chunk of each AI message
      var accumulatedMessage = const ChatMessage(
        role: MessageRole.model,
        parts: [],
      );
      var lastResult = const ChatResult<ChatMessage>(
        id: '',
        output: ChatMessage(role: MessageRole.model, parts: []),
        finishReason: FinishReason.unspecified,
        metadata: <String, dynamic>{},
        usage: LanguageModelUsage(),
      );

      // Stream the raw response and collect it
      await for (final result in _model.sendStream(conversationHistory)) {
        // Stream the text output to the caller Extract text content from
        // Message output
        final textOutput = result.output.parts
            .whereType<TextPart>()
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
          // Logic: If shouldPrefixNextMessage is true (set when previous AI
          // message had tool calls) AND this is the first chunk of the new
          // message, then prefix with newline.
          final streamOutput =
              (shouldPrefixNextMessage && isFirstChunkOfMessage)
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

        // Accumulate the complete message using manual concat logic
        final messageToConcat = _shouldAssignIdsBeforeConcat(result.output)
            ? ChatMessage(
                role: result.output.role,
                parts: _assignToolCallIdsToMessage(result.output.parts),
              )
            : result.output;

        accumulatedMessage = _concatMessages(
          accumulatedMessage,
          messageToConcat,
        );
        lastResult = result;
      }

      // Text consolidation and final message creation
      final textParts = accumulatedMessage.parts.whereType<TextPart>().toList();
      final nonTextParts = accumulatedMessage.parts
          .where((part) => part is! TextPart)
          .toList();

      final finalParts = <Part>[];

      // Add consolidated text as a single TextPart (if any)
      if (textParts.isNotEmpty) {
        final consolidatedText = textParts.map((p) => p.text).join();
        if (consolidatedText.isNotEmpty) {
          finalParts.add(TextPart(consolidatedText));
        }
      }

      // Add all non-text parts (already properly merged by _concatMessages)
      finalParts.addAll(nonTextParts);

      // Create final message with consolidated parts
      final messageWithIds = ChatMessage(
        role: MessageRole.model,
        parts: finalParts,
      );

      // Add the complete AI message to conversation history
      conversationHistory.add(messageWithIds);

      // Yield the complete AI message
      _assertNoMultipleTextParts([messageWithIds]);
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
          .whereType<ToolPart>()
          .where((p) => p.kind == ToolPartKind.call)
          .toList();

      if (toolCalls.isEmpty) {
        _logger.fine('No tool calls found, completing agent stream');
        done = true;
      } else {
        _logger.info(
          'Found ${toolCalls.length} tool calls to execute: '
          '${toolCalls.map((t) => '${t.name}(${t.id})').join(', ')}',
        );
        // STREAMING UX: Set flag to prefix next AI message with newline
        //
        // Since this AI message has tool calls, we know another AI message will
        // follow (the synthesis response). Set flag so that message gets
        // visually separated with a newline prefix for better UX.
        shouldPrefixNextMessage = true;
        // Execute all tools
        final toolResults = <ChatMessage>[];
        for (final toolPart in toolCalls) {
          final tool = toolMap[toolPart.name];
          if (tool != null) {
            _logger.fine(
              'Executing tool: ${toolPart.name} with args: '
              '${toolPart.argumentsRaw}',
            );
            try {
              // Parse arguments from argumentsRaw if arguments is empty This
              // handles the streaming case where JSON parsing is deferred
              var parsedArguments = toolPart.arguments ?? {};
              if (parsedArguments.isEmpty && toolPart.argumentsRaw.isNotEmpty) {
                final decoded = json.decode(toolPart.argumentsRaw);
                if (decoded is Map<String, dynamic>) {
                  parsedArguments = decoded;
                } else {
                  // Handle cases where decoded is null or other types (e.g.,
                  // Cohere sends "null" for tools with no parameters)
                  parsedArguments = <String, dynamic>{};
                }
              }

              final result = await tool.invoke(parsedArguments);
              final resultString = result is String
                  ? result
                  : json.encode(result);

              _logger.info(
                'Tool ${toolPart.name}(${toolPart.id}) executed successfully, '
                'result length: ${resultString.length}',
              );

              // Create a user message with tool result part
              final toolResultMessage = ChatMessage(
                role: MessageRole.user,
                parts: [
                  ToolPart.result(
                    id: toolPart.id,
                    name: toolPart.name,
                    result: resultString,
                  ),
                ],
              );

              toolResults.add(toolResultMessage);
            } on Exception catch (error) {
              _logger.warning('Tool ${toolPart.name} execution failed: $error');

              toolResults.add(
                ChatMessage(
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
        _assertNoMultipleTextParts(toolResults);
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
  /// Returns true for providers that send multiple tool calls with empty IDs in
  /// the same chunk (Ollama, Google), which would cause incorrect merging.
  /// Returns false for providers that use proper streaming protocols.
  bool _shouldAssignIdsBeforeConcat(ChatMessage message) {
    final toolParts = message.parts
        .whereType<ToolPart>()
        .where((p) => p.kind == ToolPartKind.call)
        .toList();

    // If there are multiple tool calls and any have empty IDs, we need to
    // assign UUIDs before concat to prevent incorrect merging
    if (toolParts.length > 1) {
      return toolParts.any((tc) => tc.id.isEmpty);
    }

    // For single tool calls, check if it has an empty ID and no name This
    // indicates a partial chunk that should be concatenated
    if (toolParts.length == 1) {
      final toolCall = toolParts.first;
      return toolCall.id.isEmpty && toolCall.name.isNotEmpty;
    }

    return false;
  }

  /// Assigns UUIDs to tool parts that don't have IDs.
  ///
  /// This is primarily for providers like Ollama and Google that don't provide
  /// tool call IDs. OpenAI provides proper IDs and uses a different streaming
  /// protocol where partial tool calls should be concatenated.
  List<Part> _assignToolCallIdsToMessage(List<Part> parts) => parts.map((part) {
    if (part is ToolPart && part.kind == ToolPartKind.call && part.id.isEmpty) {
      // Only assign UUIDs if the tool call has an empty ID
      return ToolPart.call(
        id: _uuid.v4(),
        name: part.name,
        arguments: part.arguments ?? {},
      );
    }
    // Return as-is if not a tool call or ID already exists
    return part;
  }).toList();

  /// Concatenates two ChatMessage objects, properly merging streaming chunks.
  ///
  /// This method handles the OpenAI streaming protocol where tool calls are
  /// built incrementally across multiple chunks. Tool calls with the same ID
  /// are merged, while different tool calls are kept separate.
  ChatMessage _concatMessages(ChatMessage accumulated, ChatMessage newChunk) {
    if (accumulated.parts.isEmpty) {
      return newChunk;
    }

    // Collect parts by type for merging
    final accumulatedParts = <Part>[...accumulated.parts];

    for (final newPart in newChunk.parts) {
      if (newPart is ToolPart && newPart.kind == ToolPartKind.call) {
        // Find existing tool call with same ID for merging
        final existingIndex = accumulatedParts.indexWhere(
          (part) =>
              part is ToolPart &&
              part.kind == ToolPartKind.call &&
              part.id.isNotEmpty &&
              part.id == newPart.id,
        );

        if (existingIndex != -1) {
          // Merge with existing tool call
          final existingToolCall = accumulatedParts[existingIndex] as ToolPart;
          final mergedToolCall = ToolPart.call(
            id: newPart.id,
            name: newPart.name.isNotEmpty
                ? newPart.name
                : existingToolCall.name,
            arguments: newPart.arguments?.isNotEmpty ?? false
                ? newPart.arguments!
                : existingToolCall.arguments ?? {},
          );
          accumulatedParts[existingIndex] = mergedToolCall;
        } else {
          // Add new tool call
          accumulatedParts.add(newPart);
        }
      } else {
        // Add other parts as-is (TextPart, DataPart, etc.)
        accumulatedParts.add(newPart);
      }
    }

    return ChatMessage(role: accumulated.role, parts: accumulatedParts);
  }

  /// Asserts that no message in the list contains more than one TextPart.
  ///
  /// This helps catch streaming consolidation issues where text content gets
  /// split into multiple TextPart objects instead of being properly accumulated
  /// into a single TextPart.
  ///
  /// Throws an AssertionError in debug mode if any message violates this rule.
  void _assertNoMultipleTextParts(List<ChatMessage> messages) {
    assert(() {
      for (final message in messages) {
        final textParts = message.parts.whereType<TextPart>().toList();
        if (textParts.length > 1) {
          throw AssertionError(
            'Message contains ${textParts.length} TextParts but should have '
            'at most 1. Message: $message. '
            'TextParts: ${textParts.map((p) => '"${p.text}"').join(', ')}. '
            'This indicates a streaming consolidation bug.',
          );
        }
      }
      return true;
    }());
  }
}
