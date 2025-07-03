import 'dart:async';
import 'dart:convert';

import 'package:uuid/uuid.dart';

import '../../language_models/language_models.dart';
import '../tools/tool.dart';
import '../tools/tool_spec.dart';
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
  List<ToolSpec>? get tools;

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
    final toolMap = <String, Tool>{};
    
    // Build tool map for quick lookup - only include executable tools
    if (tools != null) {
      for (final toolSpec in tools!) {
        if (toolSpec is Tool) {
          toolMap[toolSpec.name] = toolSpec;
        }
      }
    }

    var done = false;
    while (!done) {
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
          yield ChatResult(
            id: result.id,
            output: textOutput,
            messages: const [],
            finishReason: result.finishReason,
            metadata: result.metadata,
            usage: result.usage,
          );
        }

        // Accumulate the full message
        // Note: result.output is actually an AIChatMessage from _rawStream
        if (rawOutput is AIChatMessage) {
          // Assign UUIDs to tool calls before concatenating to avoid merging
          // issues
          final messageWithIds = AIChatMessage(
            content: rawOutput.content,
            toolCalls: _assignToolCallIds(rawOutput.toolCalls),
          );
          currentAIMessage = currentAIMessage.concat(messageWithIds);
        } else {
          // Fallback for string output
          currentAIMessage = currentAIMessage.concat(
            AIChatMessage(content: rawOutput.toString()),
          );
        }
        lastResult = result;
      }

      // Tool call IDs are already assigned during accumulation

      // Add the complete AI message to conversation history
      conversationHistory.add(currentAIMessage);

      // Yield the complete AI message
      yield ChatResult(
        id: lastResult.id,
        output: '',
        messages: [currentAIMessage],
        finishReason: lastResult.finishReason,
        metadata: lastResult.metadata,
        usage: lastResult.usage,
      );

      // Check if we need to execute tools
      if (currentAIMessage.toolCalls.isEmpty) {
        done = true;
      } else {
        // Execute all tools
        final toolResults = <ChatMessage>[];
        for (final toolCall in currentAIMessage.toolCalls) {
          final tool = toolMap[toolCall.name];
          if (tool != null) {
            try {
              final result = await tool.invoke(toolCall.arguments);
              final resultString =
                  result is String ? result : json.encode(result);
              toolResults.add(ChatMessage.tool(
                toolCallId: toolCall.id,
                content: resultString,
              ));
            } on Exception catch (error) {
              toolResults.add(ChatMessage.tool(
                toolCallId: toolCall.id,
                content: json.encode({'error': error.toString()}),
              ));
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

  /// Assigns UUIDs to tool calls that don't have IDs.
  List<AIChatMessageToolCall> _assignToolCallIds(
    List<AIChatMessageToolCall> toolCalls,
  ) =>
      toolCalls
          .map((toolCall) {
            // Only assign UUIDs if the tool call has an empty ID
            // Providers like OpenAI already provide proper IDs
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
          })
          .toList();
}
