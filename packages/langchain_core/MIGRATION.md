# Migration guide

## Ordered AI message content blocks

`AIChatMessage.content` is now an ordered collection of
`AIChatMessageContentBlock` values. This preserves reasoning, media, tool calls,
provider metadata, and provider-native payloads in their original order.

### Constructing messages

Before:

```dart
final message = AIChatMessage(
  content: 'The weather is sunny.',
  toolCalls: [toolCall],
);
```

After:

```dart
final message = AIChatMessage(
  content: [
    const AIChatMessageTextBlock(text: 'The weather is sunny.'),
    toolCall,
  ],
);
```

For a text-only message, use the convenience constructor:

```dart
final message = AIChatMessage.text('The weather is sunny.');
// Or through the base factory:
final baseMessage = ChatMessage.aiText('The weather is sunny.');
```

`AIChatMessageToolCall` is itself a content block. The `toolCalls` getter is
still available, but is derived from `content`.

### Reading visible text and reasoning

`contentAsString` and `ChatResult.outputAsString` now contain visible text
blocks only. Reasoning is available explicitly from the ordered blocks:

```dart
final visibleText = message.contentAsString;
final reasoning = message.content
    .whereType<AIChatMessageReasoningBlock>()
    .map((block) => block.reasoning)
    .join();
```

Code that previously relied on Anthropic thinking appearing in
`contentAsString` must read reasoning blocks instead.

### Treating tool-call IDs as opaque

Google tool-call IDs are now the provider ID when one is supplied, or a
deterministic response/candidate/part ID otherwise. They are no longer the
function name. Preserve the ID and use it to associate the tool result with the
specific call:

```dart
final call = message.toolCalls.first;
final result = ToolChatMessage(
  toolCallId: call.id,
  content: await runTool(call.name, call.arguments),
  name: call.name,
);
```

Passing both values keeps parallel calls to the same function distinct while
letting providers such as Google send the required function name separately
from the opaque call ID. The built-in agents preserve both automatically.

### Serialization

`AIChatMessage.toMap()` now writes the canonical ordered block list under
`content`. It no longer writes the legacy string and top-level `toolCalls`
fields. `AIChatMessage.fromMap()` continues to read both the legacy map format
and the transitional `contentBlocks` format, so stored histories can be read
and rewritten in the canonical format.

Provider-specific values are stored in each block's `providerData`, nested by
provider name. Treat those values as opaque unless you are implementing a
provider adapter.
