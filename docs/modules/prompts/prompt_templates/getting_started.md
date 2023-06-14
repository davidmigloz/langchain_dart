# Getting Started

In this tutorial, we will learn about:
- What a prompt template is, and why it is needed.
- How to create a prompt template.
- How to pass few shot examples to a prompt template.
- How to select examples for a prompt template.

## What is a prompt template?

A prompt template refers to a reproducible way to generate a prompt. It contains a text string 
(“the template”), that can take in a set of parameters from the end user and generate a prompt.

The prompt template may contain:
- Instructions to the language model.
- A set of few shot examples to help the language model generate a better response.
- A question to the language model.

The following code snippet contains an example of a prompt template:

```dart
const template = '''
I want you to act as a naming consultant for new companies.
What is a good name for a company that makes {product}?
''';
final promptTemplate = PromptTemplate(
  inputVariables: const {'product'},
  template: template,
);
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
For more information, see [Custom Prompt Templates]().

## Template formats

Currently, `PromptTemplate` only supports Python's 
[formatted string literal](https://docs.python.org/3/reference/lexical_analysis.html#f-strings) 
(f-string) format.

## Validate template

By default, `PromptTemplate` will validate the template string by checking whether the 
`inputVariables` match the variables defined in `template`. You can disable this behavior by 
setting `validateTemplate` to `false`.

```dart
const template = 'I am learning langchain because {reason}.';

final promptTemplate = PromptTemplate(
  inputVariables: const {'reason', 'foo'},
  template: template,
);
// -> 'Exception: Invalid template: 1 variables found, but 2 expected.}'

final promptTemplate1 = PromptTemplate(
  inputVariables: const {'reason', 'foo'},
  template: template,
  validateTemplate: false,
);
// -> No exception
```
