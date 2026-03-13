# langchain_mistralai Migration Guide

## Base URL change

The default base URL has changed from `https://api.mistral.ai/v1` to
`https://api.mistral.ai`. The underlying `mistralai_dart` client now appends
the API version path internally.

If you were passing a custom `baseUrl` that included `/v1`, remove the
trailing `/v1` to avoid double-pathing (e.g. `/v1/v1`):

```dart
// Before
final chatModel = ChatMistralAI(baseUrl: 'https://my-proxy.com/v1');

// After
final chatModel = ChatMistralAI(baseUrl: 'https://my-proxy.com');
```
