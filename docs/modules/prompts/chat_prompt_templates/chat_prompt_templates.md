# Chat Prompt Templates

[Chat Models](/modules/models/chat_models/chat_models.md) take a list of chat messages as input - 
this list commonly referred to as a prompt. These chat messages differ from raw string (which you 
would pass into a LLM model) in that every message is associated with a role.

For example, in 
[OpenAI Chat Completion API](https://platform.openai.com/docs/guides/gpt/chat-completions-api), a 
chat message can be associated with the AI, human or system role. The model is supposed to follow 
instruction from system chat message more closely.

LangChain provides several prompt templates to make constructing and working with prompts easily. 
You are encouraged to use these chat related prompt templates instead of `PromptTemplate` when 
querying chat models to fully exploit the potential of underlying chat model.

To create a message template associated with a role, you use `ChatMessagePromptTemplate`.

For convenience, there is a `fromTemplate()` method exposed on the template. If you were to use
this template, this is what it would look like:

```dart
const template = 'You are a helpful assistant that translates {input_language} to {output_language}.';
final systemMessagePrompt = SystemChatMessagePromptTemplate.fromTemplate(template);
const humanTemplate = '{text}';
final humanMessagePrompt = HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);
```

If you wanted to construct the `MessagePromptTemplate` more directly, you could create a
`PromptTemplate` outside and then pass it in, eg:

```dart
final prompt = PromptTemplate.fromTemplate(
  'You are a helpful assistant that translates {input_language} to {output_language}.',
);
final systemMessagePrompt2 = SystemChatMessagePromptTemplate(prompt: prompt);
```

After that, you can build a `ChatPromptTemplate` from one or more `ChatMessagePromptTemplates`. You 
can build a `ChatPromptTemplate` from one or more `ChatMessagePromptTemplate`s. You can use
`ChatPromptTemplate`’s `formatPrompt()` – this returns a `PromptValue`, which you can convert to a
string or `ChatMessage` object, depending on whether you want to use the formatted value as input
to an LLM or Chat model.

```dart
final chatPrompt = ChatPromptTemplate.fromPromptMessages([systemMessagePrompt, humanMessagePrompt]);
final formattedPrompt = chatPrompt.formatPrompt({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.'
}).toChatMessages();
print(formattedPrompt);
// -> [SystemChatMessage{content: You are a helpful assistant that translates English to French.}, 
//     HumanChatMessage{content: I love programming., example: false}]

final chatRes = await chat(formattedPrompt);
print(chatRes);
// -> AIChatMessage{content: J'adore la programmation., example: false}
```

## Format output

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

## Different types of `ChatMessagePromptTemplate`

LangChain provides different types of `ChatMessagePromptTemplate`. The most commonly used are 
`AIChatMessagePromptTemplate`, `SystemChatMessagePromptTemplate` and 
`HumanChatMessagePromptTemplate`, which create an AI message, system message and human message 
respectively.

However, in cases where the chat model supports taking chat message with arbitrary role, you can 
use `CustomChatMessagePromptTemplate`, which allows user to specify the role name.

```dart
const prompt = 'May the {subject} be with you';
final chatMessagePrompt = CustomChatMessagePromptTemplate.fromTemplate(
  prompt,
  role: 'Jedi',
);
final formattedPrompt = chatMessagePrompt.format({'subject': 'force'});
print(formattedPrompt);
// -> CustomChatMessage{content: May the force be with you, role: Jedi}
```

LangChain also provides `MessagesPlaceholder`, which gives you full control of what messages to be 
rendered during formatting. This can be useful when you are uncertain of what role you should be 
using for your message prompt templates or when you wish to insert a list of messages during 
formatting.

```dart
final humanMessageTemplate = HumanChatMessagePromptTemplate.fromTemplate(
  'Summarize our conversation so far in {word_count} words.',
);

final chatPromptTemplate = ChatPromptTemplate.fromPromptMessages([
  MessagesPlaceholder(variableName: 'conversation'),
  humanMessageTemplate,
]);

final humanMessage = ChatMessage.human(
  'What is the best way to learn programming?',
);
final aiMessage = ChatMessage.ai('''
1. Choose a programming language: Decide on a programming language that you want to learn. 

2. Start with the basics: Familiarize yourself with the basic programming concepts such as variables, data types and control structures.

3. Practice, practice, practice: The best way to learn programming is through hands-on experience
    ''');

final promptValue = chatPromptTemplate.formatPrompt(
  {
    'conversation': [humanMessage, aiMessage],
    'word_count': 10,
  },
);
final formattedPrompt = promptValue.toChatMessages();
print(formattedPrompt);
// [HumanChatMessage{content: What is the best way to learn programming?},
//  AIChatMessage{
//   content: 1. Choose a programming language: Decide on a programming language
//               that you want to learn.
//            2. Start with the basics: Familiarize yourself with the basic
//               programming concepts such as variables, data types and control structures.
//            3. Practice, practice, practice: The best way to learn
//               programming is through hands-on experience},
//  HumanChatMessage{content: Summarize our conversation so far in 10 words.}]
```
