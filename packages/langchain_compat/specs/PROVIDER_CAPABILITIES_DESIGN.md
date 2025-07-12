# Provider Capabilities Design

## Overview

The Provider Capabilities system enables dynamic discovery and filtering of LLM providers based on their supported features. This design provides a type-safe, extensible way to query provider capabilities at runtime, improving test reliability and user experience.

## Core Components

### 1. ProviderCaps Enum (`lib/src/provider_caps.dart`)

```dart
enum ProviderCaps {
  chat,                       // Basic chat completion
  embeddings,                 // Text embeddings generation
  multiToolCalls,             // Multiple function/tool calls in one response
  typedOutput,                // Structured JSON output generation
  typedOutputWithTools,       // Typed output + tools together (any implementation)
  vision,                     // Vision/multi-modal input (images, etc.)
}
```

Note: Streaming is not a capability because all chat providers support it by default.

#### Typed Output Capabilities

The typed output capabilities:
- `typedOutput`: Provider supports structured JSON output
- `typedOutputWithTools`: Provider can use typed output AND tools in the same request

Implementation notes:
- Providers with native support (OpenAI, Google) filter out the `return_result` tool in their constructors
- Providers needing the return_result pattern (Anthropic) use the tool added by Agent
- The Agent unconditionally adds `return_result` tool for typed output requests

Examples:
- OpenAI: Has both capabilities (native support, filters return_result)
- Anthropic: Has both capabilities (uses return_result pattern)
- Fireworks: Has only `typedOutput` (cannot combine with tools)

### 2. Provider Integration

Each provider declares its capabilities during initialization:

```dart
static final openai = OpenAIChatProvider(
  name: 'openai',
  caps: {
    ProviderCaps.chat,
    ProviderCaps.multiToolCalls,
    ProviderCaps.typedOutput,
    ProviderCaps.typedOutputWithTools,
    ProviderCaps.vision,
  },
);

static final anthropic = AnthropicChatProvider(
  name: 'anthropic',
  caps: {
    ProviderCaps.chat,
    ProviderCaps.multiToolCalls,
    ProviderCaps.typedOutput,
    ProviderCaps.typedOutputWithTools,
    ProviderCaps.vision,
  },
);

static final mistral = MistralChatProvider(
  name: 'mistral',
  caps: {
    ProviderCaps.chat,
    ProviderCaps.vision,
  },  // Basic chat only, no tools or typed output
);
```

### 3. Capability Querying

Providers can be filtered by required capabilities:

```dart
// Get all providers that support tool calling
final toolProviders = ChatProvider.allWith({ProviderCaps.multiToolCalls});

// Get providers supporting both tools and typed output
final advancedProviders = ChatProvider.allWith({
  ProviderCaps.multiToolCalls,
  ProviderCaps.typedOutput,
});

// Check if a specific provider supports a capability
if (provider.capabilities.contains(ProviderCaps.multiToolCalls)) {
  // Use tools with this provider
}
```

## Design Principles

### 1. Fail-Fast Philosophy
- No runtime filtering of providers based on missing API keys
- Tests run against ALL providers claiming capability support
- Failures due to missing API keys are explicit and visible

### 2. Static Declaration
- Capabilities are declared at compile-time, not discovered at runtime
- Prevents runtime surprises and improves performance
- Makes provider limitations explicit in code

### 3. Test-Driven Capability Updates
**CRITICAL: When a test fails for a provider capability:**
1. **NEVER** immediately disable the capability in provider definitions
2. **ALWAYS** investigate at the API level first:
   - Test with curl to verify if the feature works at the raw API level
   - Check the provider's official documentation
   - Look for differences between our implementation and the API requirements
3. **ONLY** disable a capability after confirming:
   - The API itself doesn't support the feature, OR
   - The API has a fundamental limitation (like Together's streaming tool format)
4. **If the API supports it but our code doesn't**: FIX THE IMPLEMENTATION

### 4. Test Integration
Tests use capability filtering to run feature-specific tests only on supporting providers:

```dart
test('tool calling works', () async {
  for (final provider in ChatProvider.allWith({ProviderCaps.multiToolCalls})) {
    // Test will run for all tool-supporting providers
    // Will fail explicitly if API key is missing
  }
});
```

Tests also validate message history to ensure proper user/model alternation:
```dart
// After collecting messages from agent.run()
validateMessageHistory(result.messages);
```

### 5. Known Limitations

#### Mistral
- Capabilities: Only `ProviderCaps.chat`
- No support for tools or typed output in their API

#### Fireworks, Cohere, Together, Lambda
- Cannot use response_format and tools simultaneously
- API returns error when both are requested together
- Have `typedOutput` but NOT `typedOutputWithTools`

#### Anthropic, Google, Ollama
- Support typed output with tools via return_result pattern
- Have `typedOutput` and `typedOutputWithTools` but NOT `nativeTypedOutputWithTools`

#### OpenAI
- Full native support for response_format + tools
- Has all three typed output capabilities

## Implementation Details

### Capability Declaration

Providers must explicitly declare their capabilities. This approach provides clarity and prevents accidental inheritance of unsupported features.

```dart
// Each provider explicitly lists its capabilities
caps: {
  ProviderCaps.chat,
  ProviderCaps.multiToolCalls,
  ProviderCaps.typedOutput,
  // ... only what the provider actually supports
}
```

## Usage Examples

### 1. Feature Discovery
```dart
// List all providers supporting tools
final providers = ChatProvider.allWith({ProviderCaps.tools});
print('Tool-capable providers: ${providers.map((p) => p.name).join(', ')}');
```

### 2. Conditional Feature Usage
```dart
final provider = ChatProvider.forName('openai');
if (provider.supports(ProviderCaps.typedOutput)) {
  // Use typed output feature
  final agent = Agent(
    '${provider.name}:${provider.defaultModelName}',
    outputSchema: mySchema,
  );
}
```

### 3. Test Organization
```dart
group('typed output tests', () {
  for (final provider in ChatProvider.allWith({ProviderCaps.typedOutput})) {
    test('${provider.name} generates valid JSON', () async {
      // Test implementation
    });
  }
});
```

### 4. Comprehensive Integration Test
```dart
runToolProviderTest(
  'multi-turn conversation with multiple tool calls and message validation',
  (provider) async {
    // Test implementation that validates:
    // - Multi-turn conversations
    // - Multiple tool calls in single turn
    // - Message history validation
    validateMessageHistory(history);
  },
);
```

## Future Enhancements

### 1. Additional Capabilities
- `ProviderCaps.vision` - Image input support
- `ProviderCaps.audio` - Audio input/output
- `ProviderCaps.caching` - Context caching support
- `ProviderCaps.batching` - Batch API support

### 2. Dynamic Capability Discovery
- Runtime API calls to verify actual capabilities
- Graceful degradation when features unexpectedly fail
- Capability caching to avoid repeated discovery

### 3. Capability Versioning
- Track capability versions (e.g., tools v1 vs v2)
- Handle provider-specific capability variations
- Migration paths for capability evolution

## Design Decisions

### Why Not Runtime Discovery?
1. **Performance**: Avoids startup API calls to discover capabilities
2. **Reliability**: No network dependencies for capability detection
3. **Predictability**: Capabilities known at compile time
4. **Simplicity**: No complex discovery protocols needed

### Why Fail on Missing API Keys?
1. **Transparency**: Makes configuration issues immediately visible
2. **Testing Integrity**: Ensures all claimed capabilities are tested
3. **No Silent Failures**: Prevents false positives from skipped tests
4. **User Trust**: What you see in capabilities is what you get

### Why Static Provider Lists?
1. **Discoverability**: All providers visible in one place
2. **Type Safety**: Compile-time checking of provider references
3. **Documentation**: Self-documenting provider capabilities
4. **Performance**: No runtime provider registration overhead

## Summary

The Provider Capabilities system provides a robust, type-safe mechanism for managing the diverse feature sets across 15+ LLM providers. By making capabilities explicit and failing fast on configuration issues, it ensures reliable operation while maintaining flexibility for future enhancements.