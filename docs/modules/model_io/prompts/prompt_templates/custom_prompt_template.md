# Custom prompt template

Let's suppose we want the LLM to generate English language explanations of a
function given its name. To achieve this task, we will create a custom prompt
template that takes in the function name as input, and formats the prompt
template to provide the source code of the function.

## Why are custom prompt templates needed?

LangChain provides a set of default prompt templates that can be used to
generate prompts for a variety of tasks. However, there may be cases where the
default prompt templates do not meet your needs. For example, you may want to
create a prompt template with specific dynamic instructions for your language
model. In such cases, you can create a custom prompt template.

Take a look at the current set of default prompt
templates [here](/modules/model_io/prompts/prompt_templates/prompt_templates.md).

## Creating a Custom Prompt Template

There are essentially two distinct prompt templates available - string prompt
templates and chat prompt templates. String prompt templates provides a simple
prompt in string format, while chat prompt templates produces a more structured
prompt to be used with a chat API.

In this guide, we will create a custom prompt using a string prompt template.

To create a custom string prompt template, there are two requirements:

1. It has an `inputVariables` attribute that exposes what input variables the
   prompt template expects.
2. It exposes a format method that takes in keyword arguments corresponding to
   the expected `inputVariables` and returns the formatted prompt.

We will create a custom prompt template that takes in the name of a function
and formats a prompt to ask the language model to provide an explanation of the
function.

To achieve this, let's first create a function that will return the source code
of a function given its name.

```dart
/// Get the source code of the function (e.g. using GitHub API).
String getSourceCode(final String functionName) {
   // For the example, we just return a hardcoded function source code
   return '''
String helloWorld() {
  return 'Hello world!';
}
''';
}
```

Next, we'll create a custom prompt template that takes in the function name as
input, and formats the prompt template to provide the source code of the
function.

```dart
/// A custom prompt template that takes in the function name as input, and
/// formats the prompt template to provide the source code of the function
/// to the language model and ask it to explain the function.
final class FunctionExplainerPromptTemplate extends BaseStringPromptTemplate {
   const FunctionExplainerPromptTemplate()
           : super(inputVariables: const {_functionNameInputKey});

   static const _functionNameInputKey = 'function_name';

   @override
   String format([final InputValues values = const {}]) {
      final functionName = values[_functionNameInputKey];
      final sourceCode = getSourceCode(functionName);
      final prompt = '''
Given the function name and source code, generate an English language explanation of the function.
Function Name: $functionName
Source Code:
$sourceCode
Explanation:
    ''';
      return prompt;
   }

   @override
   BasePromptTemplate copyWith({
      final Set<String>? inputVariables,
      final Map<String, dynamic>? partialVariables,
   }) {
      return const FunctionExplainerPromptTemplate();
   }

   @override
   String get type => 'function-explainer';
}
```

## Use the custom prompt template

Now that we have created a custom prompt template, we can use it to generate
prompts for our task.

```dart
final openai = OpenAI(apiKey: openaiApiKey, temperature: 0.9);

const fnExplainer = FunctionExplainerPromptTemplate();
final prompt = fnExplainer.formatPrompt({
   FunctionExplainerPromptTemplate.functionNameInputKey: 'helloWorld',
});

final result = await openai.generatePrompt(prompt);
print(result.firstOutputAsString);
// -> 'This function is named helloWorld and it returns a string with the 
// phrase "Hello world!".
```
