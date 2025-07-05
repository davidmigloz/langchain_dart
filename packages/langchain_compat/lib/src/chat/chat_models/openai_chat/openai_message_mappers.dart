import 'dart:convert';

import 'package:openai_dart/openai_dart.dart';

import '../../tools/tool.dart';
import '../message.dart' as msg;
import 'openai_chat_options.dart';
import 'openai_message_mappers_helpers.dart';

/// Creates a [CreateChatCompletionRequest] from the given Message input.
CreateChatCompletionRequest createChatCompletionRequestFromMessages(
  List<msg.Message> messages, {
  required String modelName,
  required OpenAIChatOptions? options,
  required OpenAIChatOptions defaultOptions,
  List<Tool>? tools,
  double? temperature,
  bool stream = false,
}) {
  final messagesDtos = messages.toOpenAIMessages();
  final toolsDtos = tools?.map((tool) => ChatCompletionTool(
    type: ChatCompletionToolType.function,
    function: FunctionObject(
      name: tool.name,
      description: tool.description,
      parameters: tool.inputSchema.schemaMap as Map<String, dynamic>?,
      strict: null, // Explicitly pass null to override any defaults
    ),
  )).toList();
  
  final toolChoice = (toolsDtos?.isNotEmpty ?? false) ? null : null;

  return CreateChatCompletionRequest(
    model: ChatCompletionModel.modelId(modelName),
    messages: messagesDtos,
    tools: toolsDtos,
    toolChoice: toolChoice,
    frequencyPenalty:
        options?.frequencyPenalty ?? defaultOptions.frequencyPenalty,
    logitBias: options?.logitBias ?? defaultOptions.logitBias,
    maxCompletionTokens: options?.maxTokens ?? defaultOptions.maxTokens,
    n: options?.n ?? defaultOptions.n,
    presencePenalty: options?.presencePenalty ?? defaultOptions.presencePenalty,
    responseFormat: options?.responseFormat ?? defaultOptions.responseFormat,
    seed: options?.seed ?? defaultOptions.seed,
    stop: (options?.stop ?? defaultOptions.stop) != null
        ? ChatCompletionStop.listString(options?.stop ?? defaultOptions.stop!)
        : null,
    temperature:
        temperature ?? options?.temperature ?? defaultOptions.temperature,
    topP: options?.topP ?? defaultOptions.topP,
    parallelToolCalls:
        options?.parallelToolCalls ?? defaultOptions.parallelToolCalls,
    user: options?.user ?? defaultOptions.user,
    streamOptions: stream
        ? (options?.streamOptions ?? defaultOptions.streamOptions)
        : null,
  );
}

/// Extension on [List<msg.Message>] to convert messages to OpenAI SDK messages.
extension MessageListToOpenAI on List<msg.Message> {
  /// Converts this list of [msg.Message]s to a list of [ChatCompletionMessage]s.
  List<ChatCompletionMessage> toOpenAIMessages() =>
      map(_mapMessage).toList(growable: false);

  ChatCompletionMessage _mapMessage(msg.Message message) {
    switch (message.role) {
      case msg.MessageRole.system:
        return _mapSystemMessage(message);
      case msg.MessageRole.user:
        return _mapUserMessage(message);
      case msg.MessageRole.model:
        return _mapModelMessage(message);
    }
  }

  ChatCompletionMessage _mapSystemMessage(msg.Message message) {
    // System messages should have a single text part
    final text = message.parts
        .whereType<msg.TextPart>()
        .map((p) => p.text)
        .join();
    return ChatCompletionMessage.system(content: text);
  }

  ChatCompletionMessage _mapUserMessage(msg.Message message) {
    // Check if this is a tool result message
    final toolResults = message.parts
        .whereType<msg.ToolPart>()
        .where((p) => p.kind == msg.ToolPartKind.result)
        .toList();
    
    if (toolResults.isNotEmpty) {
      // OpenAI expects separate tool messages for each result
      // This should be handled at a higher level, so here we just take the first
      final toolResult = toolResults.first;
      final content = toolResult.result is String
          ? toolResult.result as String
          : json.encode(toolResult.result);
      return ChatCompletionMessage.tool(
        toolCallId: toolResult.id,
        content: content,
      );
    }
    
    // Regular user message with content parts
    final contentParts = <ChatCompletionMessageContentPart>[];
    
    for (final part in message.parts) {
      switch (part) {
        case msg.TextPart(:final text):
          contentParts.add(ChatCompletionMessageContentPartText(
            text: text,
          ));
        case msg.DataPart(:final bytes, :final mimeType):
          // Convert to base64
          final base64Data = base64.encode(bytes);
          contentParts.add(ChatCompletionMessageContentPartImage(
            imageUrl: ChatCompletionMessageImageUrl(
              url: 'data:$mimeType;base64,$base64Data',
            ),
          ));
        case msg.LinkPart(:final url):
          contentParts.add(ChatCompletionMessageContentPartImage(
            imageUrl: ChatCompletionMessageImageUrl(url: url),
          ));
        case msg.ToolPart():
          // Skip tool parts in user messages (handled above)
          break;
      }
    }
    
    if (contentParts.isEmpty) {
      return ChatCompletionMessage.user(
        content: ChatCompletionUserMessageContentString(''),
      );
    } else if (contentParts.length == 1 && 
               contentParts.first is ChatCompletionMessageContentPartText) {
      final text = (contentParts.first as ChatCompletionMessageContentPartText).text;
      return ChatCompletionMessage.user(
        content: ChatCompletionUserMessageContentString(text),
      );
    } else {
      return ChatCompletionMessage.user(
        content: ChatCompletionUserMessageContent.parts(contentParts),
      );
    }
  }

  ChatCompletionMessage _mapModelMessage(msg.Message message) {
    // Extract text content
    final textContent = message.parts
        .whereType<msg.TextPart>()
        .map((p) => p.text)
        .join();
    
    // Extract tool calls
    final toolCalls = message.parts
        .whereType<msg.ToolPart>()
        .where((p) => p.kind == msg.ToolPartKind.call)
        .map((p) => ChatCompletionMessageToolCall(
              id: p.id,
              type: ChatCompletionMessageToolCallType.function,
              function: ChatCompletionMessageFunctionCall(
                name: p.name,
                arguments: json.encode(p.arguments ?? {}),
              ),
            ))
        .toList();
    
    return ChatCompletionMessage.assistant(
      content: textContent.isEmpty ? null : textContent,
      toolCalls: toolCalls.isEmpty ? null : toolCalls,
    );
  }
}


/// Converts OpenAI streaming response to Message.
msg.Message messageFromOpenAIStreamDelta(
  ChatCompletionStreamResponseDelta delta,
  List<StreamingToolCall> accumulatedToolCalls,
) {
  final parts = <msg.Part>[];
  
  // Add text content if present
  if (delta.content != null && delta.content!.isNotEmpty) {
    parts.add(msg.TextPart(delta.content!));
  }
  
  // Process tool calls
  if (delta.toolCalls != null) {
    for (var i = 0; i < delta.toolCalls!.length; i++) {
      final toolCall = delta.toolCalls![i];
      
      // Find or create tool call
      if (i < accumulatedToolCalls.length) {
        // Update existing tool call
        final existing = accumulatedToolCalls[i];
        if (toolCall.function?.arguments != null) {
          existing.argumentsJson += toolCall.function!.arguments!;
        }
        if (toolCall.id != null) {
          existing.id = toolCall.id!;
        }
        if (toolCall.function?.name != null) {
          existing.name = toolCall.function!.name!;
        }
      } else {
        // New tool call
        accumulatedToolCalls.add(StreamingToolCall(
          id: toolCall.id ?? '',
          name: toolCall.function?.name ?? '',
          argumentsJson: toolCall.function?.arguments ?? '',
        ));
      }
    }
    
    // Convert accumulated tool calls to ToolParts
    for (final streamingCall in accumulatedToolCalls) {
      // Try to parse accumulated arguments
      Map<String, dynamic>? parsedArgs;
      try {
        if (streamingCall.argumentsJson.isNotEmpty) {
          parsedArgs = json.decode(streamingCall.argumentsJson) as Map<String, dynamic>;
        }
      } catch (_) {
        // Not complete JSON yet, skip for now
        continue;
      }
      
      parts.add(msg.ToolPart.call(
        id: streamingCall.id,
        name: streamingCall.name,
        arguments: parsedArgs ?? {},
      ));
    }
  }
  
  return msg.Message(
    role: msg.MessageRole.model,
    parts: parts,
  );
}

/// Converts OpenAI completion response to Message.
msg.Message messageFromOpenAIResponse(CreateChatCompletionResponse response) {
  if (response.choices.isEmpty) {
    return msg.Message(role: msg.MessageRole.model, parts: []);
  }
  
  final choice = response.choices.first;
  final message = choice.message;
  
  final parts = <msg.Part>[];
  
  // Add text content
  if (message.content != null && message.content!.isNotEmpty) {
    parts.add(msg.TextPart(message.content!));
  }
  
  // Add tool calls
  if (message.toolCalls != null) {
    for (final toolCall in message.toolCalls!) {
      Map<String, dynamic> arguments = {};
      try {
        if (toolCall.function.arguments.isNotEmpty) {
          arguments = json.decode(toolCall.function.arguments) as Map<String, dynamic>;
        }
      } catch (_) {
        // Invalid JSON, keep empty arguments
      }
      
      parts.add(msg.ToolPart.call(
        id: toolCall.id,
        name: toolCall.function.name,
        arguments: arguments,
      ));
    }
  }
  
  return msg.Message(
    role: msg.MessageRole.model,
    parts: parts,
  );
}

