import 'dart:async';
import 'dart:convert';

import 'package:uuid/uuid.dart';

import '../../language_models/language_models.dart';
import '../tools/tool.dart';
import 'chat_message.dart';
import 'chat_model_options.dart';
import 'chat_result.dart';

/// Base class that provides tool execution and message collection capabilities
/// for chat models.
///
/// This class implements both [invoke] and [stream] methods, handling:
/// - Tool call ID assignment for providers that don't provide them
/// - Automatic tool execution with error handling
/// - Message collection and streaming
///
/// Chat models that extend this class should implement [rawStream] instead
/// of [invoke] and [stream].
mixin ToolsAndMessagesHelper<TOptions extends ChatModelOptions> {
  /// The tools available to this model. Models must provide this.
  List<Tool>? get tools;

  /// Raw streaming method that models must implement.
  /// This should call the underlying LLM API and return a stream of responses.
  ///
  /// Models that use this mixin should override this method.
  Stream<ChatResult> rawStream(
    List<ChatMessage> messages, {
    TOptions? options,
  }) {
    throw UnimplementedError('Models must override rawStream');
  }

  /// UUID generator for tool call IDs.
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

  /// Invokes the model with the given messages and returns the final result.
  ///
  /// This method internally uses [stream] and accumulates all results.
  Future<ChatResult> invoke(
    List<ChatMessage> messages, {
    TOptions? options,
  }) async {
    final allNewMessages = <ChatMessage>[];
    var finalOutput = '';
    var finalResult = const ChatResult(
      id: '',
      output: '',
      finishReason: FinishReason.unspecified,
      metadata: <String, dynamic>{},
      usage: LanguageModelUsage(),
    );

    await for (final result in stream(messages, options: options)) {
      final outputText = result.output is String ? result.output as String : '';
      if (outputText.isNotEmpty) {
        finalOutput += outputText;
      }
      allNewMessages.addAll(result.messages);
      finalResult = result;
    }

    return ChatResult(
      id: finalResult.id,
      output: finalOutput,
      messages: allNewMessages,
      finishReason: finalResult.finishReason,
      metadata: finalResult.metadata,
      usage: finalResult.usage,
    );
  }

  /// Streams responses from the model, handling tool execution automatically.
  ///
  /// Returns a stream of [ChatResult] where:
  /// - [ChatResult.output] contains streaming text chunks
  /// - [ChatResult.messages] contains new messages since the last result
  Stream<ChatResult> stream(
    List<ChatMessage> messages, {
    TOptions? options,
  }) async* {
    final conversationHistory = List<ChatMessage>.from(messages);
    final toolMap = {for (final tool in tools ?? <Tool>[]) tool.name: tool};

    var done = false;
    _shouldPrefixNextMessage = false; // Reset at start of stream
    while (!done) {
      var isFirstChunkOfMessage = true; // Track first chunk of each AI message
      var currentAIMessage = const AIChatMessage(content: '');
      var lastResult = const ChatResult(
        id: '',
        output: '',
        finishReason: FinishReason.unspecified,
        metadata: <String, dynamic>{},
        usage: LanguageModelUsage(),
      );

      // Stream the raw response and collect it
      await for (final result in rawStream(
        conversationHistory,
        options: options,
      )) {
        // Stream the text output to the caller
        // Convert AIChatMessage output to string output
        final rawOutput = result.output as dynamic;
        final textOutput = rawOutput is AIChatMessage
            ? rawOutput.content
            : rawOutput.toString();

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

          yield ChatResult(
            id: result.id,
            output: streamOutput,
            messages: const [],
            finishReason: result.finishReason,
            metadata: result.metadata,
            usage: result.usage,
          );
        }

        // Accumulate the full message
        // Note: result.output is actually an AIChatMessage from _rawStream
        if (rawOutput is AIChatMessage) {
          // Handle different provider streaming protocols:
          // - OpenAI/Anthropic: Use concat logic for proper tool call merging
          // - Ollama/Google: Assign UUIDs before concat to prevent merging
          final messageToConcat = _shouldAssignIdsBeforeConcat(rawOutput)
              ? AIChatMessage(
                  content: rawOutput.content,
                  toolCalls: _assignToolCallIds(rawOutput.toolCalls),
                )
              : rawOutput;
          currentAIMessage = currentAIMessage.concat(messageToConcat);
        } else {
          // Fallback for string output
          currentAIMessage = currentAIMessage.concat(
            AIChatMessage(content: rawOutput.toString()),
          );
        }
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
      yield ChatResult(
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
              final result = await tool.invoke(toolCall.arguments);
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
        yield ChatResult(
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
