# Prompts

Prompts for Chat models are built around messages, instead of just plain text.

You can make use of templating by using a `ChatMessagePromptTemplate`. You can 
build a `ChatPromptTemplate` from one or more `ChatMessagePromptTemplate`s. You 
can use `ChatPromptTemplate`’s `formatPrompt()` – this returns a `PromptValue`, 
which you can convert to a string or `ChatMessage` object, depending on whether 
you want to use the formatted value as input to an LLM or Chat model.

For convenience, there is a `fromTemplate()` method exposed on the template. If 
you were to use this template, this is what it would look like:

```dart
const template = 'You are a helpful assistant that translates {input_language} to {output_language}.';
final systemMessagePrompt = SystemChatMessagePromptTemplate.fromTemplate(template);
const  humanTemplate = '{text}';
final humanMessagePrompt = HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);

final chatPrompt = ChatPromptTemplate.fromPromptMessages(
  [systemMessagePrompt, humanMessagePrompt],
);
final chatRes = await chat(
  chatPrompt.formatPrompt({
    'input_language': 'English',
    'output_language': 'French',
    'text': 'I love programming.'
  }).toChatMessages(),
);
print(chatRes);
// -> AIChatMessage{content: J'adore la programmation., example: false}
```

If you wanted to construct the `MessagePromptTemplate` more directly, you could 
create a `PromptTemplate` outside and then pass it in, eg:

```dart
final prompt= PromptTemplate.fromTemplate(
  'You are a helpful assistant that translates {input_language} to {output_language}.',
);
final systemMessagePrompt = SystemChatMessagePromptTemplate(prompt: prompt);
```
