# Getting Started

This section contains everything related to prompts. A prompt is the value passed into the Language 
Model. This value can either be a string (for LLMs) or a list of messages (for Chat Models).

The data types of these prompts are rather simple, but their construction is anything but. 
Value proposition of LangChain here include:
- A standard interface for string prompts and message prompts.
- A standard (to get started) interface for string prompt templates and message prompt templates.
- Example Selectors: methods for inserting examples into the prompt for the language model to follow.
- OutputParsers: methods for inserting instructions into the prompt as the format in which the 
  language model should output information, as well as methods for then parsing that string output 
  into a format.

We have in depth documentation for specific types of string prompts, specific types of chat prompts, 
example selectors, and output parsers.

Here, we cover a quick-start for a standard interface for getting started with simple prompts.

## PromptTemplates

PromptTemplates are responsible for constructing a prompt value. These PromptTemplates can do things 
like formatting, example selection, and more. At a high level, these are basically objects that 
expose a `formatPromptValue()` method for constructing a prompt. Under the hood, ANYTHING can happen.

```dart
final stringPrompt = PromptTemplate.fromTemplate('tell me a joke about {subject}');
final stringPromptValue = stringPrompt.formatPromptValue({'subject': 'soccer'});

final chatPrompt = ChatPromptTemplate.fromTemplate('tell me a joke about {subject}');
final chatPromptValue = chatPrompt.formatPrompt({'subject': 'soccer'});
```

### `promptValue.toString()`

This is what is called when passing to an LLM (which expects raw text).

```dart
print(stringPromptValue.toString());
// -> 'tell me a joke about soccer'
print(chatPromptValue.toString());
// -> 'Human: tell me a joke about soccer'
```

### `promptValue.toMessages()`

This is what is called when passing to ChatModel (which expects a list of messages)

```dart
print(stringPromptValue.toChatMessages());
// -> [HumanChatMessage(text: 'tell me a joke about soccer', example: false)]
print(chatPromptValue.toChatMessages());
// -> [HumanChatMessage(text: 'tell me a joke about soccer', example: false)]
```
