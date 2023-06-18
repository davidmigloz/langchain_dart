# Types of ChatMessagePromptTemplate

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
