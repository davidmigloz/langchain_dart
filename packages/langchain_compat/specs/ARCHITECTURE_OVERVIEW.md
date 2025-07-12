# LangChain Dart Compatibility Layer - Architecture Overview

This document provides a comprehensive overview of the langchain_compat package architecture and points to detailed specifications for each major system.

## System Purpose

The langchain_compat package provides a unified interface to 15+ LLM providers through a single import, implementing a clean abstraction layer that supports:
- Chat conversations with streaming
- Tool/function calling 
- Structured JSON output
- Multiple provider types (cloud APIs, local models)
- Comprehensive logging and debugging

## Core Architectural Principles

### 1. **Three-Layer Architecture**
- **Agent Layer**: User-facing API, orchestration, tool execution, metadata preservation
- **Model Layer**: Provider-specific implementations 
- **Mapper Layer**: Protocol conversion, streaming handling, ID assignment, metadata attachment

### 2. **Provider Abstraction**
- Single unified API regardless of underlying provider
- Static capability declaration for type-safe filtering
- Native API support where available, standardized fallbacks elsewhere

### 3. **Fail-Fast Philosophy**
- Static validation at construction time
- Clear error messages for configuration issues
- No defensive exception hiding - let errors bubble up

### 4. **Separation of Concerns**
- Each layer has distinct responsibilities
- Provider-agnostic Agent layer
- Protocol-specific Mapper implementations

## Major System Components

### 🔧 **Provider Capabilities System**
**Purpose**: Dynamic provider discovery and filtering based on supported features
**Location**: [`PROVIDER_CAPABILITIES_DESIGN.md`](./PROVIDER_CAPABILITIES_DESIGN.md)

- Type-safe capability enumeration (`ProviderCaps`)
- Static capability declarations per provider
- Capability-based provider filtering for tests and runtime
- Clear handling of provider limitations

### 📝 **Model Naming System** 
**Purpose**: Centralized model selection and default management
**Location**: [`MODEL_NAMING_SPECIFICATION.md`](./MODEL_NAMING_SPECIFICATION.md)

- Single source of truth for default models
- Validation to prevent empty model strings
- Clear distinction between native vs cross-platform providers
- Migration patterns for model updates

### 🌊 **Unified Streaming and Typed Output Architecture**
**Purpose**: Comprehensive streaming, tool execution, and typed output handling
**Location**: [`UNIFIED_STREAMING_AND_TYPED_OUTPUT_ARCHITECTURE.md`](./UNIFIED_STREAMING_AND_TYPED_OUTPUT_ARCHITECTURE.md)

- Provider-specific streaming protocol handling
- Centralized tool ID generation and coordination
- Message accumulation with metadata preservation
- Tool execution with error handling and streaming UX
- Native schema support where available (OpenAI, Google, Ollama)
- Tool-based typed output for Anthropic (return_result pattern)
- Per-message metadata for suppressed content tracking
- Agent-level JSON validation and parsing

### 📋 **Logging Architecture**
**Purpose**: Comprehensive, user-configurable logging system
**Location**: [`LOGGING_ARCHITECTURE.md`](./LOGGING_ARCHITECTURE.md)

- Hierarchical logger naming (`dartantic.*`)
- Simple user configuration via `Agent.loggingOptions`
- Domain-based organization for debugging
- Integration with Dart's logging package

### 🔌 **OpenAI Compatibility Reference**
**Purpose**: Provider configuration and compatibility documentation
**Location**: [`OpenAI-compat.md`](./OpenAI-compat.md)

- Complete provider directory with base URLs and API keys
- Default model configurations
- OpenAI API compatibility notes
- Provider-specific limitations and features

## Data Flow Architecture

```
User Request
    ↓
Agent Layer (orchestration, tool execution, UX, metadata preservation)
    ↓
ChatModel Layer (provider selection, API calls)
    ↓
Mapper Layer (protocol conversion, streaming, ID assignment, metadata)
    ↓
Helper Layer (utilities, common patterns)
    ↓
Provider APIs (OpenAI, Anthropic, Google, etc.)
```

## Key Design Patterns

### **Static Declaration Pattern**
All configuration is declared statically for fail-fast behavior:
- Model defaults in chat model classes
- Provider capabilities in capability sets
- Logger names in hierarchical structure

### **Capability-Based Selection**
Runtime decisions based on declared capabilities:
```dart
final toolProviders = ChatProvider.allWith({ProviderCaps.multiToolCalls});
final streamingProviders = ChatProvider.allWith({ProviderCaps.streaming});
```

### **Provider-Agnostic Interface**
Same API regardless of underlying provider:
```dart
final agent = Agent('openai:gpt-4o', tools: tools);
final agent = Agent('anthropic:claude-3-5-sonnet', tools: tools);
// Identical API, different implementations
```

### **Layered Error Handling**
- Agent: User-friendly error messages and orchestration
- Model: Provider-specific error handling
- Mapper: Protocol-level error recovery
- No defensive exception hiding

### **Message Metadata Pattern**
Per-message visibility into processing decisions:
- Suppressed text content when using typed output
- Dropped tool calls alongside return_result
- Extra return_result calls beyond the first
- Preserved during message accumulation in Agent layer

## Provider Support Matrix

| Provider | Native API | OpenAI Compat | Tools | Streaming | Typed Output |
|----------|------------|---------------|--------|-----------|--------------|
| OpenAI | ✅ | ✅ | ✅ | ✅ | ✅ |
| Anthropic | ✅ | ❌ | ✅ | ✅ | ✅ |
| Google | ✅ | ❌ | ✅ | ✅ | ✅ |
| Mistral | ✅ | ❌ | ❌ | ✅ | ❌ |
| Cohere | ❌ | ✅ | ✅ | ✅ | ❌ |
| Ollama | ✅ | ✅ | ✅ | ✅ | ✅ |
| Others | ❌ | ✅ | ✅ | ✅ | ❌ |

## Testing Strategy

### **Capability-Based Test Filtering**
Tests automatically filter providers based on required capabilities:
```dart
final toolProviders = ChatProvider.allWith({ProviderCaps.multiToolCalls});
// Only test providers that support tools
```

### **80% vs Edge Case Separation**
- **80% Cases**: Core functionality across all supporting providers
- **Edge Cases**: Special scenarios on limited providers (typically OpenAI + Anthropic)

### **Ground Truth Validation**
When debugging provider issues:
1. Use curl to test raw API behavior
2. Compare with our implementation
3. Fix root cause, don't hide exceptions

## Development Guidelines

### **Adding New Providers**
1. Declare capabilities in provider definition
2. Update model naming defaults
3. Implement required mapper protocol handling
4. Add to OpenAI compatibility reference if applicable
5. Update tests to include new provider

### **Adding New Features**
1. Define capabilities if provider-specific
2. Implement in three-layer pattern
3. Update logging hierarchy as needed
4. Create specification document
5. Add capability-based tests

### **Debugging Issues**
1. Enable hierarchical logging via `Agent.loggingOptions`
2. Use curl for ground truth API testing
3. Check provider capabilities and limitations
4. Reference relevant specification documents
5. Follow fail-fast principle - fix root cause

## Related Documentation

- **Implementation Details**: See individual specification files linked above
- **Provider Setup**: See [`OpenAI-compat.md`](./OpenAI-compat.md) for API keys and configuration
- **Testing Patterns**: See [`PROVIDER_CAPABILITIES_DESIGN.md`](./PROVIDER_CAPABILITIES_DESIGN.md) for test filtering
- **Migration Guides**: See [`MODEL_NAMING_SPECIFICATION.md`](./MODEL_NAMING_SPECIFICATION.md) for model updates

## Future Architecture Considerations

### **Planned Enhancements**
- Vision/audio capabilities (capability system ready)
- Batch processing support
- Context caching integration
- Performance monitoring integration with logging

### **Potential Consolidations**
- Unified provider registry combining capabilities, defaults, and configuration
- Centralized error handling specification
- Performance guidelines and monitoring
- Integration examples showing all systems working together

This architecture provides a solid foundation for supporting diverse LLM providers while maintaining a clean, consistent API for users.