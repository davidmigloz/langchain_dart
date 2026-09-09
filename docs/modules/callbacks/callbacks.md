# Callbacks

By default, LangChain components run silently — you call `invoke` or `stream`
and get a result. The callback system lets you observe what happens in between:
when a model starts generating, when a tool is called, when an error occurs, and
so on. This is useful for logging, monitoring, tracing, and streaming progress to
a UI.

Callbacks work the same way across all component types — chat models, LLMs,
chains, tools, and retrievers. You create a handler, pass it via options, and
the component dispatches events to it automatically.

## Get started

Create a handler by subclassing `BaseCallbackHandler` and overriding the methods
you care about. All methods are no-ops by default, so you only implement what you
need.

```dart
import 'package:langchain_core/callbacks.dart';
import 'package:langchain_openai/langchain_openai.dart';

class LoggingHandler extends BaseCallbackHandler {
  @override
  void onChatModelStart({
    required RunInfo runInfo,
    required List<ChatMessage> messages,
  }) {
    print('[start] ${messages.last.contentAsString}');
  }

  @override
  void onLlmEnd({
    required RunInfo runInfo,
    required LanguageModelResult<Object> output,
  }) {
    print('[done] ${output.outputAsString}');
  }
}
```

Pass it to any component through the `callbacks` field on its options:

```dart
final model = ChatOpenAI(apiKey: openaiApiKey);
await model.invoke(
  PromptValue.chat([ChatMessage.humanText('Hello!')]),
  options: ChatOpenAIOptions(callbacks: [LoggingHandler()]),
);
// [start] Hello!
// [done] Hi there! How can I help you today?
```

You can pass multiple handlers, and each one receives every event.

## Streaming

When streaming, `onLlmNewToken` fires for each chunk in addition to the start
and end events:

```dart
class TokenCounter extends BaseCallbackHandler {
  int count = 0;

  @override
  void onLlmNewToken({required RunInfo runInfo, required String token}) {
    count++;
  }
}

final counter = TokenCounter();
await model
    .stream(input, options: ChatOpenAIOptions(callbacks: [counter]))
    .toList();
print('Received ${counter.count} tokens');
```

## Error handling

When a component throws, the corresponding error callback (`onLlmError`,
`onChainError`, `onToolError`, or `onRetrieverError`) fires before the exception
propagates to your code.

By default, errors thrown *inside* a handler method are caught silently so that a
buggy handler cannot break your application. Set `raiseError: true` to propagate
handler errors instead:

```dart
class StrictHandler extends BaseCallbackHandler {
  StrictHandler() : super(raiseError: true);
}
```

## Ignore flags

A handler can opt out of event categories it is not interested in:

```dart
class ChainOnlyHandler extends BaseCallbackHandler {
  ChainOnlyHandler() : super(ignoreLlm: true, ignoreTool: true);

  @override
  void onChainStart({
    required RunInfo runInfo,
    required Map<String, dynamic> inputs,
  }) {
    print('Chain started with: $inputs');
  }
}
```

Available flags: `ignoreLlm`, `ignoreChain`, `ignoreTool`, `ignoreRetriever`,
`ignoreAgent`, `ignoreCustomEvent`.

## Tags and metadata

You can attach context to a run through `tags` and `metadata`. Both are
available in `RunInfo` inside every handler method:

```dart
await model.invoke(
  input,
  options: ChatOpenAIOptions(
    callbacks: [handler],
    tags: ['production', 'experiment-a'],
    metadata: {'userId': '42', 'requestId': 'req-abc'},
  ),
);
```

## Handler methods

Each component type dispatches its own set of events:

| Component  | Start              | End            | Error            | Extra                             |
|------------|--------------------|----------------|------------------|-----------------------------------|
| Chat model | `onChatModelStart` | `onLlmEnd`     | `onLlmError`     | `onLlmNewToken`                   |
| LLM        | `onLlmStart`       | `onLlmEnd`     | `onLlmError`     | `onLlmNewToken`                   |
| Chain      | `onChainStart`     | `onChainEnd`   | `onChainError`   | —                                 |
| Tool       | `onToolStart`      | `onToolEnd`    | `onToolError`    | —                                 |
| Retriever  | `onRetrieverStart` | `onRetrieverEnd`| `onRetrieverError`| —                                |
| Agent      | —                  | —              | —                | `onAgentAction`, `onAgentFinish`  |

## Performance

When no callbacks are configured, the system adds zero overhead.
`CallbackManager.configure()` returns `null` when the callbacks list is empty,
and the base class skips all dispatch logic in that case.
