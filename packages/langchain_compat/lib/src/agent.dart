import 'dart:async';
import 'dart:convert';

import 'package:uuid/uuid.dart';

import 'chat/chat_models/chat_models.dart';
import 'chat/chat_providers/chat_providers.dart';
import 'chat/tools/tools.dart';
import 'language_models/language_models.dart';

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
  Future<ChatResult<String>> run(List<ChatMessage> messages) async {
    final allNewMessages = <ChatMessage>[];
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
  Stream<ChatResult<String>> runStream(List<ChatMessage> messages) async* {
    final conversationHistory = List<ChatMessage>.from(messages);
    final toolMap = {
      for (final tool in _model.tools ?? <Tool>[]) tool.name: tool,
    };

    var done = false;
    _shouldPrefixNextMessage = false; // Reset at start of stream
    while (!done) {
      var isFirstChunkOfMessage = true; // Track first chunk of each AI message
      var currentAIMessage = const AIChatMessage(content: '');
      var lastResult = const ChatResult<AIChatMessage>(
        id: '',
        output: AIChatMessage(content: ''),
        finishReason: FinishReason.unspecified,
        metadata: <String, dynamic>{},
        usage: LanguageModelUsage(),
      );

      // Stream the raw response and collect it
      await for (final result in _model.sendStream(conversationHistory)) {
        // Stream the text output to the caller
        // Extract text content from AIChatMessage output
        final textOutput = result.output.content;

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
        // Handle different provider streaming protocols:
        // - OpenAI/Anthropic: Use concat logic for proper tool call merging
        // - Ollama/Google: Assign UUIDs before concat to prevent merging
        final messageToConcat = _shouldAssignIdsBeforeConcat(result.output)
            ? AIChatMessage(
                content: result.output.content,
                toolCalls: _assignToolCallIds(result.output.toolCalls),
              )
            : result.output;
        currentAIMessage = currentAIMessage.concat(messageToConcat);
        lastResult = result;
      }

      // Assign UUIDs to tool calls that still have empty IDs after concat
      // This handles providers like Ollama and Google that don't provide IDs
      final messageWithIds = AIChatMessage(
        content: currentAIMessage.content,
        toolCalls: _assignToolCallIds(currentAIMessage.toolCalls),
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
      if (messageWithIds.toolCalls.isEmpty) {
        done = true;
      } else {
        // STREAMING UX: Set flag to prefix next AI message with newline
        //
        // Since this AI message has tool calls, we know another AI message
        // will follow (the synthesis response). Set flag so that message
        // gets visually separated with a newline prefix for better UX.
        _shouldPrefixNextMessage = true;
        // Execute all tools
        final toolResults = <ChatMessage>[];
        for (final toolCall in messageWithIds.toolCalls) {
          final tool = toolMap[toolCall.name];
          if (tool != null) {
            try {
              // Parse arguments from argumentsRaw if arguments is empty
              // This handles the streaming case where JSON parsing is deferred
              var parsedArguments = toolCall.arguments;
              if (parsedArguments.isEmpty && toolCall.argumentsRaw.isNotEmpty) {
                final decoded = json.decode(toolCall.argumentsRaw);
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
              toolResults.add(
                ChatMessage.tool(
                  toolCallId: toolCall.id,
                  content: resultString,
                ),
              );
            } on Exception catch (error) {
              toolResults.add(
                ChatMessage.tool(
                  toolCallId: toolCall.id,
                  content: json.encode({'error': error.toString()}),
                ),
              );
            }
          }
        }

        // Add tool results to conversation history
        conversationHistory.addAll(toolResults);

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
  bool _shouldAssignIdsBeforeConcat(AIChatMessage message) {
    // If there are multiple tool calls and any have empty IDs, we need to
    // assign UUIDs before concat to prevent incorrect merging
    if (message.toolCalls.length > 1) {
      return message.toolCalls.any((tc) => tc.id.isEmpty);
    }

    // For single tool calls, check if it has an empty ID and no name
    // This indicates a partial chunk that should be concatenated
    if (message.toolCalls.length == 1) {
      final toolCall = message.toolCalls.first;
      return toolCall.id.isEmpty && toolCall.name.isNotEmpty;
    }

    return false;
  }

  /// Assigns UUIDs to tool calls that don't have IDs.
  ///
  /// This is primarily for providers like Ollama and Google that don't
  /// provide tool call IDs. OpenAI provides proper IDs and uses a different
  /// streaming protocol where partial tool calls should be concatenated
  /// using the existing concat logic.
  List<AIChatMessageToolCall> _assignToolCallIds(
    List<AIChatMessageToolCall> toolCalls,
  ) => toolCalls.map((toolCall) {
    // Only assign UUIDs if the tool call has an empty ID
    // Providers like OpenAI already provide proper IDs and use
    // concat logic for streaming, so we should not assign UUIDs
    if (toolCall.id.isEmpty) {
      return AIChatMessageToolCall(
        id: _uuid.v4(),
        name: toolCall.name,
        argumentsRaw: toolCall.argumentsRaw,
        arguments: toolCall.arguments,
      );
    }
    // Return as-is if ID already exists
    return toolCall;
  }).toList();
}
