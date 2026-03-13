# langchain_openai Migration Guide

## New: ChatOpenAIResponses (Responses API)

A new `ChatOpenAIResponses` class has been added alongside the existing
`ChatOpenAI` class. It uses OpenAI's
[Responses API](https://platform.openai.com/docs/api-reference/responses)
instead of the Chat Completions API.

### Usage

```dart
final chatModel = ChatOpenAIResponses(apiKey: '...');
final prompt = PromptValue.chat([
  ChatMessage.system('You are a helpful assistant.'),
  ChatMessage.humanText('Hello!'),
]);
final res = await chatModel.invoke(prompt);
```

### Options

`ChatOpenAIResponsesOptions` replaces `ChatOpenAIOptions` when using
the Responses API. Key differences:

**New options:**
- `instructions` — system prompt via request parameter
- `previousResponseId` — multi-turn conversation support
- `truncation` — input truncation strategy (`auto` / `disabled`)
- `maxOutputTokens` (replaces `maxTokens`)

**Removed options** (not supported by the Responses API):
- `n`
- `logitBias`
- `logprobs` (bool)
- `seed`
- `stop`
- `user`

### Multi-turn conversations

```dart
final res1 = await chatModel.invoke(prompt1);
final res2 = await chatModel.invoke(
  prompt2,
  options: ChatOpenAIResponsesOptions(previousResponseId: res1.id),
);
```

## Exception type change

The re-exported exception type has changed from `OpenAIClientException` to
`OpenAIException`. If your code catches `OpenAIClientException`, update it to
catch `OpenAIException` instead:

```dart
// Before
try {
  await chatModel.invoke(prompt);
} on OpenAIClientException catch (e) { ... }

// After
try {
  await chatModel.invoke(prompt);
} on OpenAIException catch (e) { ... }
```

### Which class to use?

- Use `ChatOpenAI` for the Chat Completions API (stable, widely supported by
  OpenAI-compatible providers).
- Use `ChatOpenAIResponses` for the Responses API (newer, supports
  `previousResponseId` for multi-turn, and additional features).
