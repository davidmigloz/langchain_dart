# Prompt templates

Language models take text as input - that text is commonly referred to as a 
prompt. Typically this is not simply a hardcoded string but rather a 
combination of a template, some examples, and user input. LangChain provides 
several classes and functions to make constructing and working with prompts 
easy.

## What is a prompt template?

A prompt template refers to a reproducible way to generate a prompt. It 
contains a text string ("the template"), that can take in a set of parameters 
from the end user and generates a prompt.

The prompt template may contain:
- Instructions to the language model.
- A set of few shot examples to help the language model generate a better 
  response.
- A question to the language model.

Here's the simplest example:

```dart
const template = '''
I want you to act as a naming consultant for new companies.
What is a good name for a company that makes {product}?
''';
final promptTemplate = PromptTemplate.fromTemplate(template);
final prompt = promptTemplate.format({'product': 'colorful socks'});
print(prompt);
// 'I want you to act as a naming consultant for new companies.
// What is a good name for a company that makes colorful socks?'
```

## Create a prompt template

You can create simple hardcoded prompts using the `PromptTemplate` class. Prompt templates can take 
any number of input variables, and can be formatted to generate a prompt.

```dart
// An example prompt with no input variables
final noInputPrompt = PromptTemplate(
  inputVariables: const {},
  template: 'Tell me a joke.',
);
print(noInputPrompt.format());
// -> 'Tell me a joke.'

// An example prompt with one input variable
final oneInputPrompt = PromptTemplate(
  inputVariables: const {'adjective'},
  template: 'Tell me a {adjective} joke.',
);
print(oneInputPrompt.format({'adjective': 'funny'}));
// -> 'Tell me a funny joke.'

// An example prompt with multiple input variables
final multipleInputPrompt = PromptTemplate(
  inputVariables: const {'adjective', 'content'},
  template: 'Tell me a {adjective} joke about {content}.',
);
print(multipleInputPrompt.format({'adjective': 'funny', 'content': 'AI'}));
// -> 'Tell me a funny joke about AI.'
```

If you do not wish to specify `inputVariables` manually, you can also create a `PromptTemplate` 
using `PromptTemplate.fromTemplate` factory constructor. LangChain will automatically infer the 
`inputVariables` based on the template passed.

```dart
const template = 'Tell me a {adjective} joke about {content}.';
final promptTemplate = PromptTemplate.fromTemplate(template);
print(promptTemplate.inputVariables);
// -> {'adjective', 'content'}
print(promptTemplate.format({'adjective': 'funny', 'content': 'chickens'}));
// -> 'Tell me a funny joke about chickens.'
```

You can create custom prompt templates that format the prompt in any way you want. 
For more information, see 
[Custom Prompt Templates](/modules/model_io/prompts/prompt_templates/custom_prompt_template).

## Chat prompt template

[Chat Models](/modules/model_io/models/chat_models/chat_models.md) take a list 
of chat messages as input - this list commonly referred to as a prompt. These 
chat messages differ from raw string (which you would pass into a LLM model) in 
that every message is associated with a role.

For example, in 
[OpenAI Chat Completion API](https://platform.openai.com/docs/guides/gpt/chat-completions-api), a 
chat message can be associated with the AI, human or system role. The model is 
supposed to follow instruction from system chat message more closely.

LangChain provides several prompt templates to make constructing and working 
with prompts easily. You are encouraged to use these chat related prompt 
templates instead of `PromptTemplate` when querying chat models to fully 
exploit the potential of underlying chat model.

To create a message template associated with a role, you use 
`ChatMessagePromptTemplate`.

For convenience, there is a `fromTemplate()` method exposed on the template. If 
you were to use this template, this is what it would look like:

```dart
const template = 'You are a helpful assistant that translates {input_language} to {output_language}.';
final systemMessagePrompt = SystemChatMessagePromptTemplate.fromTemplate(template);
const humanTemplate = '{text}';
final humanMessagePrompt = HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);
```

If you wanted to construct the `MessagePromptTemplate` more directly, you could 
create a `PromptTemplate` outside and then pass it in, eg:

```dart
final prompt = PromptTemplate.fromTemplate(
  'You are a helpful assistant that translates {input_language} to {output_language}.',
);
final systemMessagePrompt2 = SystemChatMessagePromptTemplate(prompt: prompt);
```

After that, you can build a `ChatPromptTemplate` from one or more 
`ChatMessagePromptTemplates`. You can build a `ChatPromptTemplate` from one or 
more `ChatMessagePromptTemplate`s. You can use `ChatPromptTemplate`’s 
`formatPrompt()` – this returns a `PromptValue`, which you can convert to a 
string or `ChatMessage` object, depending on whether you want to use the 
formatted value as input to an LLM or Chat model.

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
