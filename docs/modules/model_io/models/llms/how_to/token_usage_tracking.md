# Tracking token usage

This tutorial goes over how to track your token usage for specific calls. It is
currently only implemented for the OpenAI API.

```dart
final openai = OpenAI(
  apiKey: openaiApiKey,
  defaultOptions: const OpenAIOptions(temperature: 0.9),
);
final result = await openai.generate('Tell me a joke');
final usage = result.usage;
print(usage?.promptTokens);   // 4
print(usage?.responseTokens); // 20
print(usage?.totalTokens);    // 24
```
