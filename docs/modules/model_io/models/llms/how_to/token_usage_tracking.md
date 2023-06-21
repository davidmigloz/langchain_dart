# Tracking token usage

This tutorial goes over how to track your token usage for specific calls. It is
currently only implemented for the OpenAI API.

```dart
final openai = OpenAI(apiKey: openaiApiKey, temperature: 0.9);
final result = await openai.generate('Tell me a joke');
print(result.tokensUsage);
-> 24
```
