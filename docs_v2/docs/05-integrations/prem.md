# Prem App

You can easily run local models using [Prem app](https://www.premai.io/#PremApp). 
It creates a local server that exposes a REST API with the same interface as 
the OpenAI API.

```dart
const localUrl = 'http://localhost:8000'; // Check Prem app for the actual URL
final chat = ChatOpenAI(baseUrl: localUrl);

const template = 'You are a helpful assistant that translates {input_language} to {output_language}.';
final systemMessagePrompt = SystemChatMessagePromptTemplate.fromTemplate(template);
const humanTemplate = '{text}';
final humanMessagePrompt = HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);

final chatPrompt = ChatPromptTemplate.fromPromptMessages([systemMessagePrompt, humanMessagePrompt]);
final formattedPrompt = chatPrompt.formatPrompt({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.'
}).toChatMessages();

final output = chat.predictMessages(formattedPrompt);
```
