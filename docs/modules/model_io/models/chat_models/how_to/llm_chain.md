# LLMChain

You can use the existing `LLMChain` in a very similar way as 
[with LLMs](/modules/chains/chains?id=get-started) - provide a prompt and a 
model.

```dart
final chat = ChatOpenAI(apiKey: openaiApiKey, temperature: 0);

const template = 'You are a helpful assistant that translates {input_language} to {output_language}.';
final systemMessagePrompt = SystemChatMessagePromptTemplate.fromTemplate(template);
const humanTemplate = '{text}';
final humanMessagePrompt = HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);

final chatPrompt = ChatPromptTemplate.fromPromptMessages([systemMessagePrompt, humanMessagePrompt]);

final chain = LLMChain(llm: chat, prompt: chatPrompt);

final res = await chain.run({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.'
});
print(res);
// -> 'J'adore la programmation.'
```
