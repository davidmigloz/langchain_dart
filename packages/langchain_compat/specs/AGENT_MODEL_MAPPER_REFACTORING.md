# Agent, Model, and Mapper Refactoring Specification

## Overview

This document specifies a phased refactoring of the langchain_compat package to improve code organization, maintainability, and debugging capabilities while maintaining complete backward compatibility of all public APIs.

## Core Principles to Maintain

1. **Exception Transparency**: Never catch exceptions to suppress them. Errors must bubble up to the caller with full context.
2. **No Silent Failures**: No error should be logged and ignored. Either handle it properly or let it propagate.
3. **Provider Agnostic Public API**: The Agent API must work identically regardless of the underlying provider.
4. **Fail-Fast Philosophy**: Invalid states should be detected and reported immediately.
5. **Backward Compatibility**: All public APIs (Agent, ChatProvider, ChatModel) must remain unchanged.

## Architectural Invariants to Preserve

### Message Ordering and Structure
1. **System Message Rule**: At most one system message, and it must be the first message if present
2. **Message Alternation**: After the optional system message, messages must alternate user/model/user/model
3. **Tool Result Consolidation**: Multiple tool results must be consolidated into a single user message
4. **TextPart Consolidation**: Each message must have at most one TextPart (multiple text chunks must be joined)

### Tool Handling
1. **return_result Tool Pattern**: Agent always adds return_result tool for typed output
2. **Provider Filtering**: Providers with native typed output support (OpenAI) must filter out return_result
3. **Tool ID Generation**: Providers without native IDs (Google, Ollama) must have UUIDs assigned consistently
4. **Tool Execution**: Tool errors become tool results with error JSON, not exceptions

### Streaming Behavior
1. **Immediate User Message**: User messages must be yielded immediately upon creation
2. **Message Prefixing**: First text chunk after tool calls must be prefixed with newline for readability
3. **Accumulation Before Yield**: Complete messages must be accumulated before yielding (except streaming text)
4. **Metadata Preservation**: All provider metadata must be preserved through the streaming pipeline

### Provider-Specific Requirements

#### OpenAI
- Multiple tool results must be expanded into separate tool messages
- Streaming uses index-based accumulation for tool calls
- Native typed output support via response_format

#### Anthropic
- Tool results stay in single user message with multiple content blocks
- Event-based streaming with explicit stages
- Typed output via return_result tool pattern

#### Google/Ollama
- Must assign UUIDs to tool calls that lack IDs
- Arguments must be converted to JSON strings
- Complete chunks per message (no partial streaming)

#### Cohere
- Special edge case: sends "null" string for tools with no parameters
- Custom streaming format must be handled

## Phased Implementation Plan

### Phase 1: Infrastructure Layer (Smallest Changes)

#### 1.1 Create Structured Exception Hierarchy
```dart
// lib/src/exceptions/structured_exceptions.dart

abstract class LangchainCompatException implements Exception {
  final String message;
  final String provider;
  final Map<String, dynamic> metadata;
  final Object? cause;
  final StackTrace? causeStackTrace;
  
  const LangchainCompatException({
    required this.message,
    required this.provider,
    required this.metadata,
    this.cause,
    this.causeStackTrace,
  });
  
  @override
  String toString() => '$runtimeType: $message\n'
      'Provider: $provider\n'
      'Metadata: $metadata\n'
      '${cause != null ? 'Caused by: $cause' : ''}';
}

class ToolExecutionException extends LangchainCompatException {
  final Tool tool;
  final Map<String, dynamic> executionContext;
  
  const ToolExecutionException({
    required super.message,
    required this.tool,
    required super.provider,
    required this.executionContext,
    super.cause,
    super.causeStackTrace,
  }) : super(
    metadata: {
      'toolName': tool.name,
      'toolId': executionContext['toolId'],
      'arguments': executionContext['arguments'],
      ...executionContext,
    },
  );
}

class ProviderConfigurationException extends LangchainCompatException {
  const ProviderConfigurationException({
    required super.message,
    required super.provider,
    required super.metadata,
    super.cause,
  });
}

class StreamingException extends LangchainCompatException {
  final int chunkIndex;
  final String streamState;
  
  const StreamingException({
    required super.message,
    required super.provider,
    required this.chunkIndex,
    required this.streamState,
    required Map<String, dynamic> additionalMetadata,
    super.cause,
    super.causeStackTrace,
  }) : super(
    metadata: {
      'chunkIndex': chunkIndex,
      'streamState': streamState,
      ...additionalMetadata,
    },
  );
}
```

#### 1.2 Create Type-Safe Tool Arguments
```dart
// lib/src/tools/tool_arguments.dart

class ToolArguments {
  final Map<String, Object?> _args;
  
  const ToolArguments(this._args);
  
  factory ToolArguments.fromJson(String json) {
    final decoded = jsonDecode(json);
    if (decoded is Map<String, dynamic>) {
      return ToolArguments(decoded);
    }
    throw FormatException('Invalid tool arguments JSON: $json');
  }
  
  T get<T>(String key) {
    if (!_args.containsKey(key)) {
      throw ArgumentError('Missing required argument: $key');
    }
    return _args[key] as T;
  }
  
  T? getOrNull<T>(String key) => _args[key] as T?;
  
  Map<String, Object?> toMap() => Map.unmodifiable(_args);
  
  String toJson() => jsonEncode(_args);
}
```

#### Testing Strategy Phase 1
- Run all existing tests - they should pass unchanged
- Add new unit tests for exception hierarchy
- Add unit tests for ToolArguments

### Phase 2: Extract Streaming State Management

#### 2.1 Create StreamingState Class
```dart
// lib/src/agent/streaming_state.dart

class StreamingState {
  bool _previousMessageHadTools = false;
  bool _isFirstChunkOfMessage = true;
  int _chunkCount = 0;
  final List<ChatMessage> _conversationHistory;
  
  StreamingState({required List<ChatMessage> initialHistory}) 
    : _conversationHistory = List.from(initialHistory);
  
  bool get shouldPrefixNextMessage => _previousMessageHadTools;
  bool get isFirstChunk => _isFirstChunkOfMessage;
  int get chunkCount => _chunkCount;
  List<ChatMessage> get history => List.unmodifiable(_conversationHistory);
  
  void recordChunk() {
    _chunkCount++;
    _isFirstChunkOfMessage = false;
  }
  
  void startNewMessage() {
    _isFirstChunkOfMessage = true;
  }
  
  void completeMessage(ChatMessage message) {
    _previousMessageHadTools = message.parts
        .whereType<ToolPart>()
        .any((p) => p.kind == ToolPartKind.call);
    _conversationHistory.add(message);
  }
  
  String formatStreamOutput(String text) {
    if (shouldPrefixNextMessage && isFirstChunk && text.isNotEmpty) {
      return '\n$text';
    }
    return text;
  }
}
```

#### 2.2 Update Agent to Use StreamingState
Modify the `_runStream` method to use StreamingState instead of local variables.

#### Testing Strategy Phase 2
- All existing tests should still pass
- Add unit tests for StreamingState
- Verify streaming UX behavior is preserved

### Phase 3: Extract Tool ID Management

#### 3.1 Enhance ToolIdRegistry
```dart
// lib/src/tools/tool_id_registry.dart

class ToolIdRegistry {
  final Map<String, String> _toolIds = {};
  final String Function() _idGenerator;
  
  ToolIdRegistry({String Function()? idGenerator}) 
    : _idGenerator = idGenerator ?? (() => const Uuid().v4());
  
  String ensureToolId(ToolPart tool) {
    if (tool.id.isNotEmpty) return tool.id;
    
    // Create stable key for tools without IDs
    final key = '${tool.name}_${tool.argumentsHash}';
    return _toolIds.putIfAbsent(key, _idGenerator);
  }
  
  void clear() => _toolIds.clear();
}

extension on ToolPart {
  String get argumentsHash {
    final args = arguments ?? {};
    final sortedKeys = args.keys.toList()..sort();
    final canonical = {for (final k in sortedKeys) k: args[k]};
    return canonical.toString().hashCode.toString();
  }
}
```

#### 3.2 Update Mappers to Use ToolIdRegistry
Each mapper that generates IDs should use a shared ToolIdRegistry instance.

#### Testing Strategy Phase 3
- All tests should pass
- Add unit tests for ToolIdRegistry
- Verify stable ID generation across providers

### Phase 4: Extract Message Accumulation Strategy

#### 4.1 Create MessageAccumulator Interface
```dart
// lib/src/chat/message_accumulator.dart

abstract class MessageAccumulator {
  ChatMessage accumulate(ChatMessage current, ChatMessage chunk);
  
  /// Check if this chunk completes a message
  bool isMessageComplete(ChatMessage chunk);
}
```

#### 4.2 Create Provider-Specific Implementations
```dart
// lib/src/chat/chat_models/openai_chat/openai_message_accumulator.dart

class OpenAIMessageAccumulator extends MessageAccumulator {
  @override
  ChatMessage accumulate(ChatMessage accumulated, ChatMessage newChunk) {
    if (accumulated.parts.isEmpty) {
      return newChunk;
    }
    
    final accumulatedParts = <Part>[...accumulated.parts];
    
    for (final newPart in newChunk.parts) {
      if (newPart is ToolPart && newPart.kind == ToolPartKind.call) {
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
          accumulatedParts.add(newPart);
        }
      } else {
        accumulatedParts.add(newPart);
      }
    }
    
    return ChatMessage(
      role: accumulated.role,
      parts: accumulatedParts,
      metadata: {...accumulated.metadata, ...newChunk.metadata},
    );
  }
  
  @override
  bool isMessageComplete(ChatMessage chunk) {
    // OpenAI signals completion via finish_reason
    return chunk.metadata['finish_reason'] != null;
  }
}
```

#### Testing Strategy Phase 4
- All tests should pass
- Add unit tests for each accumulator implementation
- Verify streaming accumulation behavior

### Phase 5: Extract Tool Execution

#### 5.1 Create ToolExecutor
```dart
// lib/src/agent/tool_executor.dart

class ToolExecutor {
  final String providerName;
  final Logger _logger = Logger('dartantic.agent.tool_executor');
  
  const ToolExecutor({required this.providerName});
  
  Future<List<ToolPart>> executeTools({
    required List<ToolPart> toolCalls,
    required Map<String, Tool> toolMap,
  }) async {
    final results = <ToolPart>[];
    
    for (final toolCall in toolCalls) {
      final result = await _executeSingleTool(
        toolCall: toolCall,
        tool: toolMap[toolCall.name],
      );
      results.add(result);
    }
    
    return results;
  }
  
  Future<ToolPart> _executeSingleTool({
    required ToolPart toolCall,
    required Tool? tool,
  }) async {
    if (tool == null) {
      _logger.warning(
        'Tool ${toolCall.name} not found in available tools',
      );
      return ToolPart.result(
        id: toolCall.id,
        name: toolCall.name,
        result: jsonEncode({
          'error': 'Tool not found: ${toolCall.name}',
        }),
      );
    }
    
    try {
      // Parse arguments with edge case handling
      final args = _parseToolArguments(toolCall);
      final result = await tool.invoke(args.toMap());
      final resultString = result is String ? result : jsonEncode(result);
      
      return ToolPart.result(
        id: toolCall.id,
        name: toolCall.name,
        result: resultString,
      );
    } catch (error, stackTrace) {
      _logger.warning(
        'Tool ${toolCall.name} execution failed: $error',
        error,
        stackTrace,
      );
      
      // Throw structured exception with full context
      throw ToolExecutionException(
        message: 'Failed to execute tool: ${toolCall.name}',
        tool: tool,
        provider: providerName,
        executionContext: {
          'toolId': toolCall.id,
          'arguments': toolCall.arguments,
          'argumentsRaw': toolCall.argumentsRawString,
        },
        cause: error,
        causeStackTrace: stackTrace,
      );
    }
  }
  
  ToolArguments _parseToolArguments(ToolPart toolCall) {
    var args = toolCall.arguments ?? {};
    
    if (args.isEmpty && (toolCall.argumentsRawString?.isNotEmpty ?? false)) {
      final parsed = jsonDecode(toolCall.argumentsRawString!);
      if (parsed is Map<String, dynamic>) {
        args = parsed;
      } else if (parsed == null || parsed == 'null') {
        // Cohere edge case
        args = <String, dynamic>{};
      }
    }
    
    return ToolArguments(args);
  }
}
```

#### Testing Strategy Phase 5
- All tests should pass
- Add unit tests for ToolExecutor
- Verify error handling produces structured exceptions

### Phase 6: Extract Model Lifecycle Management

#### 6.1 Create ModelLifecycleManager
```dart
// lib/src/agent/model_lifecycle_manager.dart

class ModelLifecycleManager {
  final Logger _logger = Logger('dartantic.agent.lifecycle');
  
  Future<T> withModel<T>({
    required ChatProvider provider,
    required String modelName,
    required List<Tool>? tools,
    required double? temperature,
    required String? systemPrompt,
    required Future<T> Function(ChatModel model) operation,
  }) async {
    final model = provider.createModel(
      name: modelName,
      tools: tools,
      temperature: temperature,
      systemPrompt: systemPrompt,
    );
    
    _logger.fine(
      'Created model ${provider.name}:$modelName with '
      '${tools?.length ?? 0} tools',
    );
    
    try {
      return await operation(model);
    } finally {
      model.dispose();
      _logger.fine('Disposed model ${provider.name}:$modelName');
    }
  }
  
  Stream<T> withModelStream<T>({
    required ChatProvider provider,
    required String modelName,
    required List<Tool>? tools,
    required double? temperature,
    required String? systemPrompt,
    required Stream<T> Function(ChatModel model) operation,
  }) async* {
    final model = provider.createModel(
      name: modelName,
      tools: tools,
      temperature: temperature,
      systemPrompt: systemPrompt,
    );
    
    _logger.fine(
      'Created model ${provider.name}:$modelName for streaming',
    );
    
    try {
      yield* operation(model);
    } finally {
      model.dispose();
      _logger.fine('Disposed streaming model ${provider.name}:$modelName');
    }
  }
}
```

#### Testing Strategy Phase 6
- All tests should pass
- Add unit tests for lifecycle manager
- Verify proper resource cleanup

### Phase 7: Create Streaming Orchestrator

#### 7.1 Extract Core Streaming Logic
```dart
// lib/src/agent/streaming_orchestrator.dart

class StreamingOrchestrator {
  final ToolExecutor _toolExecutor;
  final ModelLifecycleManager _lifecycleManager;
  final Logger _logger = Logger('dartantic.agent.orchestrator');
  
  StreamingOrchestrator({
    required String providerName,
  }) : _toolExecutor = ToolExecutor(providerName: providerName),
       _lifecycleManager = ModelLifecycleManager();
  
  Stream<ChatResult<String>> orchestrateStream({
    required String prompt,
    required List<ChatMessage> history,
    required List<Part> attachments,
    required ChatProvider provider,
    required String modelName,
    required List<Tool>? tools,
    required double? temperature,
    required String? systemPrompt,
    JsonSchema? outputSchema,
  }) {
    return _lifecycleManager.withModelStream(
      provider: provider,
      modelName: modelName,
      tools: _prepareTools(tools, outputSchema, provider),
      temperature: temperature,
      systemPrompt: systemPrompt,
      operation: (model) => _streamWithModel(
        model: model,
        prompt: prompt,
        history: history,
        attachments: attachments,
        outputSchema: outputSchema,
      ),
    );
  }
  
  List<Tool>? _prepareTools(
    List<Tool>? tools,
    JsonSchema? outputSchema,
    ChatProvider provider,
  ) {
    if (outputSchema == null) return tools;
    
    final returnResultTool = Tool<Map<String, dynamic>>(
      name: kReturnResultToolName,
      description:
          'REQUIRED: You MUST call this tool to return the final result. '
          'Use this tool to format and return your response according to '
          'the specified JSON schema.',
      inputSchema: outputSchema,
      inputFromJson: (json) => json,
      onCall: (args) async => jsonEncode(args),
    );
    
    return [...?tools, returnResultTool];
  }
  
  Stream<ChatResult<String>> _streamWithModel({
    required ChatModel model,
    required String prompt,
    required List<ChatMessage> history,
    required List<Part> attachments,
    JsonSchema? outputSchema,
  }) async* {
    // Implementation moves here from Agent._runStream
    // Using StreamingState, MessageAccumulator, etc.
  }
}
```

#### Testing Strategy Phase 7
- All tests should pass
- Verify streaming behavior is identical
- Check tool execution and typed output handling

### Phase 8: Refactor Agent Class

#### 8.1 Simplify Agent to Use Orchestrator
```dart
// lib/src/agent.dart

class Agent {
  // Public API remains EXACTLY the same
  Agent(
    String model, {
    List<Tool>? tools,
    double? temperature,
    String? systemPrompt,
    String? displayName,
  }) {
    // Existing initialization code
    _orchestrator = StreamingOrchestrator(providerName: _providerName);
  }
  
  late final StreamingOrchestrator _orchestrator;
  
  // Public methods remain the same but delegate to orchestrator
  Stream<ChatResult<String>> runStream(
    String prompt, {
    List<ChatMessage> history = const [],
    List<Part> attachments = const [],
    JsonSchema? outputSchema,
  }) {
    return _orchestrator.orchestrateStream(
      prompt: prompt,
      history: history,
      attachments: attachments,
      provider: _provider,
      modelName: _modelName,
      tools: _tools,
      temperature: _temperature,
      systemPrompt: _systemPrompt,
      outputSchema: outputSchema,
    );
  }
}
```

#### Testing Strategy Phase 8
- ALL tests must pass without modification
- Public API must be identical
- Sample code must run unchanged

## Backward Compatibility Verification

### Public APIs That Must Not Change
1. `Agent` constructor signatures
2. `Agent.run()` method signature and behavior
3. `Agent.runFor<T>()` method signature and behavior
4. `Agent.runStream()` method signature and behavior
5. `ChatProvider` interface
6. `ChatModel` abstract class interface
7. All public types in chat_message.dart
8. All public types in tool.dart

### Internal APIs That Can Change
1. Message mapper implementations
2. Streaming accumulation logic
3. Tool ID generation
4. Any classes in src/ that aren't exported

## Success Criteria

1. All existing tests pass without modification
2. All sample code runs without modification
3. Public API remains 100% compatible
4. New architecture is in place internally
5. Structured exceptions provide better debugging
6. Code is more maintainable and testable

## Implementation Notes

- Start with Phase 1 and ensure all tests pass before proceeding
- Each phase should be a separate commit for easy rollback
- Run full test suite after each phase
- Document any unexpected edge cases discovered during implementation
- If a phase reveals issues with the plan, stop and reassess rather than forcing it

This refactoring preserves all the carefully crafted behaviors while significantly improving the internal architecture for better maintainability and debugging capabilities.