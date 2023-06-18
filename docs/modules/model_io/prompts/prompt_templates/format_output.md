# Format output

The output of the format method is available as `String`, `List<ChatMessages>` 
and `ChatPromptValue`.

As `String`:

```dart
final formattedPrompt = chatPrompt.formatPrompt({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.'
}).toString();
print(formattedPrompt);
// -> System: You are a helpful assistant that translates English to French.
//    Human: I love programming.
```

As `List<ChatMessages>`:

```dart
final formattedPrompt = chatPrompt.formatPrompt({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.'
}).toChatMessages();
print(formattedPrompt);
// -> [SystemChatMessage{content: You are a helpful assistant that translates English to French.}, 
//     HumanChatMessage{content: I love programming., example: false}]
```

As `ChatPromptValue`:

```dart
final formattedPrompt = chatPrompt.formatPrompt({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.'
});
print(formattedPrompt);
// -> ChatPromptValue{messages: 
//      [SystemChatMessage{content: You are a helpful assistant that translates English to French.}, 
//       HumanChatMessage{content: I love programming., example: false}]}
```
