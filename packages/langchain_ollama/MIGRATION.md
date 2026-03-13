# langchain_ollama Migration Guide

## Base URL change

The default base URL has changed from `http://localhost:11434/api` to
`http://localhost:11434`. The underlying `ollama_dart` client now appends
the `/api` path internally.

If you were passing a custom `baseUrl` that included `/api`, remove the
trailing `/api` to avoid double-pathing (e.g. `/api/api`):

```dart
// Before
final chatModel = ChatOllama(baseUrl: 'http://my-host:11434/api');

// After
final chatModel = ChatOllama(baseUrl: 'http://my-host:11434');
```
