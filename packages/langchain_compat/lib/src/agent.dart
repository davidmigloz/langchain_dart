import 'dart:async';
import 'dart:convert';

import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';

import 'chat/chat_models/chat_models.dart';
import 'chat/chat_providers/chat_providers.dart';
import 'chat/tools/tools.dart';
import 'language_models/language_models.dart';
import 'logging_options.dart';

/// Exception thrown when a tool execution fails.
class ToolExecutionException implements Exception {
  /// Creates a tool execution exception.
  const ToolExecutionException(
    this.message, {
    required this.tool,
    this.originalError,
    this.stackTrace,
  });

  /// The error message.
  final String message;

  /// The name of the tool that failed.
  final String tool;

  /// The original error that caused the failure.
  final Object? originalError;

  /// The stack trace from the original error.
  final StackTrace? stackTrace;

  @override
  String toString() => 'ToolExecutionException: $message';
}

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

    // Store provider and model parameters
    _provider = ChatProvider.forName(providerName);
    _modelName = modelName ?? _provider.defaultModelName;
    _tools = tools;
    _temperature = temperature;
    _systemPrompt = systemPrompt;

    _logger.fine(
      'Agent created successfully with ${tools?.length ?? 0} tools, '
      'temperature: $temperature',
    );
  }

  /// Creates an agent from a provider
  Agent.forProvider(
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
    
    // Store provider and model parameters
    _provider = provider;
    _modelName = modelName ?? provider.defaultModelName;
    _tools = tools;
    _temperature = temperature;
    _systemPrompt = systemPrompt;

    _logger.fine(
      'Agent created from provider with ${tools?.length ?? 0} tools, '
      'temperature: $temperature',
    );
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
  String get modelName => _modelName;

  /// Gets the fully qualified model name.
  String get model => '$providerName:$modelName';

  /// Gets the display name.
  String get displayName => _displayName ?? model;

  /// Gets an environment map for the agent.
  static Map<String, String> environment = {};

  /// Closes the underlying model.
  void dispose() {
    // No longer needed since models are created on-the-fly
  }

  late final String _providerName;
  late final ChatProvider _provider;
  late final String _modelName;
  late final List<Tool>? _tools;
  late final double? _temperature;
  late final String? _systemPrompt;
  late final String? _displayName;

  /// Invokes the agent with the given prompt and returns the final result.
  ///
  /// This method internally uses [runStream] and accumulates all results.
  Future<ChatResult<String>> run(
    String prompt, {
    List<ChatMessage> history = const [],
    List<Part> attachments = const [],
    JsonSchema? outputSchema,
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
    
    // Track if return_result was called
    var returnResultCalled = false;
    String? returnResultJson;

    await for (final result in runStream(
      prompt,
      history: history,
      attachments: attachments,
      outputSchema: outputSchema,
    )) {
      final outputText = result.outputAsString;
      if (outputText.isNotEmpty) {
        finalOutput += outputText;
      }
      allNewMessages.addAll(result.messages);
      finalResult = result;
      
      // Check if return_result was called in tool messages
      for (final msg in result.messages) {
        for (final part in msg.parts) {
          if (part is ToolPart && 
              part.kind == ToolPartKind.result && 
              part.name == kReturnResultToolName) {
            returnResultCalled = true;
            returnResultJson = part.result as String?;
            _logger.fine('return_result tool returned: $returnResultJson');
          }
        }
      }
    }
    
    // Handle typed output
    if (outputSchema != null) {
      final metadata = <String, dynamic>{};
      
      if (returnResultCalled && returnResultJson != null) {
        // Anthropic case: use return_result output
        if (finalOutput.isNotEmpty && finalOutput != returnResultJson) {
          metadata['suppressed_text'] = finalOutput;
        }
        finalOutput = returnResultJson;
        _logger.fine('Using return_result output for typed response');
        
        // Check if the last message is empty (Anthropic's behavior)
        // If so, replace it with a message containing the JSON
        if (allNewMessages.isNotEmpty) {
          final lastMessage = allNewMessages.last;
          if (lastMessage.role == MessageRole.model && 
              lastMessage.parts.isEmpty) {
            // Replace empty message with JSON message
            allNewMessages[allNewMessages.length - 1] = ChatMessage(
              role: MessageRole.model,
              parts: [TextPart(returnResultJson)],
              metadata: lastMessage.metadata,
            );
            _logger.fine('Replaced empty model message with JSON output');
          }
        }
      } else {
        // OpenAI case: finalOutput should already be JSON
        _logger.fine('Using model output as typed response');
      }
      
      // Update final result metadata
      finalResult = ChatResult<String>(
        id: finalResult.id,
        output: finalOutput,
        messages: allNewMessages,
        finishReason: finalResult.finishReason,
        metadata: {...finalResult.metadata, ...metadata},
        usage: finalResult.usage,
      );
    } else {
      // No outputSchema - still need to return all accumulated messages
      finalResult = ChatResult<String>(
        id: finalResult.id,
        output: finalOutput,
        messages: allNewMessages,
        finishReason: finalResult.finishReason,
        metadata: finalResult.metadata,
        usage: finalResult.usage,
      );
    }

    _logger.info(
      'Agent run completed with ${allNewMessages.length} new messages, '
      'finish reason: ${finalResult.finishReason}',
    );

    return finalResult;
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
      outputSchema: outputSchema,
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
    JsonSchema? outputSchema,
  }) async* {
    _logger.info(
      'Starting agent stream with prompt and ${history.length} '
      'history messages',
    );

    // Create model with appropriate tools
    var tools = _tools;
    if (outputSchema != null) {
      final returnResultTool = Tool<Map<String, dynamic>>(
        name: kReturnResultToolName,
        description: 
            'Return the final result in the required structured format',
        inputSchema: outputSchema,
        inputFromJson: (json) => json, // Identity function for JSON input
        onCall: (args) async => json.encode(args), // Return JSON string
      );
      
      tools = [...?_tools, returnResultTool];
    }
    
    final model = _provider.createModel(
      name: _modelName,
      tools: tools,
      temperature: _temperature,
      systemPrompt: _systemPrompt,
    );

    try {
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
        for (final tool in model.tools ?? <Tool>[]) tool.name: tool,
      };
      
      _logger.fine(
        'Available tools in toolMap: ${toolMap.keys.join(', ')}',
      );

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
      await for (final result in model.sendStream(
        conversationHistory,
        outputSchema: outputSchema,
      )) {
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
        accumulatedMessage = _concatMessages(accumulatedMessage, result.output);
        lastResult = result;
      }

      // Text consolidation and final message creation
      final textParts = accumulatedMessage.parts.whereType<TextPart>().toList();
      final nonTextParts = accumulatedMessage.parts
          .where((part) => part is! TextPart)
          .toList();
      
      // Check if we should suppress text (typed output + tool calls)
      final hasToolCalls = nonTextParts.any((part) => 
          part is ToolPart && part.kind == ToolPartKind.call);
      final shouldSuppressText = outputSchema != null && hasToolCalls;

      final finalParts = <Part>[];
      var suppressedText = '';

      // Add consolidated text as a single TextPart (if any)
      if (textParts.isNotEmpty) {
        final consolidatedText = textParts.map((p) => p.text).join();
        if (consolidatedText.isNotEmpty) {
          if (shouldSuppressText) {
            // Suppress text when we have typed output and tool calls
            suppressedText = consolidatedText;
            _logger.fine(
              'Suppressing text in typed output: "$consolidatedText"',
            );
          } else {
            finalParts.add(TextPart(consolidatedText));
          }
        }
      }

      // Add all non-text parts (already properly merged by _concatMessages)
      finalParts.addAll(nonTextParts);
      
      // Add suppressed text to metadata if any
      final messageMetadata = {...accumulatedMessage.metadata};
      if (suppressedText.isNotEmpty) {
        messageMetadata['suppressed_text'] = suppressedText;
      }

      // Create final message with consolidated parts and metadata
      final messageWithIds = ChatMessage(
        role: MessageRole.model,
        parts: finalParts,
        metadata: messageMetadata,
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

      _logger.fine(
        'Tool calls found: '
        '${toolCalls.map((t) => '${t.name}(${t.id})').join(', ')}',
      );

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
        // Execute all tools and collect results
        final toolResultParts = <Part>[];
        for (final toolPart in toolCalls) {
          final tool = toolMap[toolPart.name];
          if (tool != null) {
            _logger.fine(
              'Executing tool: ${toolPart.name} with args: '
              '${toolPart.argumentsRaw}',
            );
            try {
              // CRITICAL: Parse argumentsRaw when arguments is empty This
              // handles OpenAI-compatible providers that send empty arguments
              // during streaming
              var args = toolPart.arguments ?? {};
              if (args.isEmpty &&
                  (toolPart.argumentsRawString?.isNotEmpty ?? false)) {
                final parsed = json.decode(toolPart.argumentsRawString!);
                if (parsed is Map<String, dynamic>) {
                  args = parsed;
                } else if (parsed == null || parsed == 'null') {
                  // Handle Cohere edge case where it sends "null" for no
                  // params
                  args = <String, dynamic>{};
                }
              }

              final result = await tool.invoke(args);
              final resultString = result is String
                  ? result
                  : json.encode(result);

              _logger.info(
                'Tool ${toolPart.name}(${toolPart.id}) executed successfully, '
                'result length: ${resultString.length}',
              );

              // Add tool result part to collection
              toolResultParts.add(
                ToolPart.result(
                  id: toolPart.id,
                  name: toolPart.name,
                  result: resultString,
                ),
              );
              // ignore: exception_hiding
            } on Exception catch (error, stackTrace) {
              _logger.warning(
                'Tool ${toolPart.name} execution failed: $error',
                error,
                stackTrace,
              );

              // Add error result part
              toolResultParts.add(
                ToolPart.result(
                  id: toolPart.id,
                  name: toolPart.name,
                  result: json.encode({'error': error.toString()}),
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

        // Create a single user message with all tool results
        final toolResultMessage = ChatMessage(
          role: MessageRole.user,
          parts: toolResultParts,
        );

        // Add tool result message to conversation history
        conversationHistory.add(toolResultMessage);
        _logger.fine(
          'Added tool result message with ${toolResultParts.length} results',
        );

        // Yield tool result message
        _assertNoMultipleTextParts([toolResultMessage]);
        yield ChatResult<String>(
          id: lastResult.id,
          output: '',
          messages: [toolResultMessage],
          finishReason: lastResult.finishReason,
          metadata: lastResult.metadata,
          usage: lastResult.usage,
        );
      }
    }
    } finally {
      // Dispose of the model created for this operation
      model.dispose();
    }
  }

  /// Concatenates two ChatMessage objects, properly merging streaming chunks.
  ///
  /// This method handles streaming protocols where tool calls are built
  /// incrementally across multiple chunks. Tool calls with the same ID
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
            argumentsRawString:
                newPart.argumentsRawString ??
                existingToolCall.argumentsRawString,
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

    // Merge metadata from both messages
    final mergedMetadata = <String, dynamic>{
      ...accumulated.metadata,
      ...newChunk.metadata,
    };
    
    return ChatMessage(
      role: accumulated.role,
      parts: accumulatedParts,
      metadata: mergedMetadata,
    );
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
