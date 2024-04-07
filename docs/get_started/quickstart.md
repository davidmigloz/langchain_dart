# Quickstart

In this quickstart we'll show you how to:

- Get setup with LangChain.dart
- Use the most basic and common components of LangChain: prompt templates, models, and output parsers
- Use LangChain Expression Language, the protocol that LangChain is built on and which facilitates component chaining
- Build a simple application with LangChain

That's a fair amount to cover! Let's dive in.

## Setup

To get started, follow the [installation instructions](/get_started/installation.md) to install LangChain.dart.

Using LangChain.dart will usually require integrations with one or more model providers, data stores, APIs, etc. For this example, we'll use OpenAI's model APIs.

First we'll need to add LangChain.dart OpenAI package:

```yaml
dependencies:
  langchain: { version }
  langchain_openai: { version }
```

Accessing the OpenAI API requires an API key, which you can get by creating an account and heading [here](https://platform.openai.com/account/api-keys).

The library does not force you to use any specific key management strategy. You just need to pass the key on the `ChatOpenAI` constructor:

```dart
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

final llm = ChatOpenAI(apiKey: openaiApiKey);
```

## Building with LangChain.dart

LangChain provides many modules that can be used to build language model applications. Modules can be used as standalone in simple applications, and they can be composed for more complex use cases. Composition is powered by LangChain Expression Language (LCEL), which defines a unified `Runnable` interface that many modules implement, making it possible to seamlessly chain components.

The simplest and most common chain contains three things:

- LLM/Chat Model: The language model is the core reasoning engine here. In order to work with LangChain, you need to understand the different types of language models and how to work with them.
- Prompt Template: This provides instructions to the language model. This controls what the language model outputs, so understanding how to construct prompts and different prompting strategies is crucial.
- Output Parser: These translate the raw response from the language model to a more workable format, making it easy to use the output downstream.

In this guide we'll cover those three components individually, and then go over how to combine them. Understanding these concepts will set you up well for being able to use and customize LangChain applications. Most LangChain applications allow you to configure the model and/or the prompt, so knowing how to take advantage of this will be a big enabler.

## LLM / Chat Model

There are two types of language models:

- `LLM`: underlying model takes a string as input and returns a string.
- `ChatModel`: underlying model takes a list of messages as input and returns a message.

Strings are simple, but what exactly are messages? The base message interface is defined by `ChatMessage`, which has two required attributes:

- `content`: The content of the message. Usually a string.
- `role`: The entity from which the `ChatMessage` is coming.

LangChain provides several objects to easily distinguish between different roles:

- `HumanChatMessage`: A `ChatMessage` coming from a human/user.
- `AIChatMessage`: A `ChatMessage` coming from an AI/assistant.
- `SystemChatMessage`: A `ChatMessage` coming from the system.
- `FunctionChatMessage` / `ToolChatMessage`: A `ChatMessage` containing the output of a function or tool call.

If none of those roles sound right, there is also a `CustomChatMessage` class where you can specify the role manually. 

LangChain provides a common interface that's shared by both `LLMs` and `ChatModels`. However, it's useful to understand the difference in order to most effectively construct prompts for a given language model.

The simplest way to call an `LLM` or `ChatModel` is using `.invoke()`, the universal call method for all LangChain Expression Language (LCEL) objects:

- `LLM.invoke`: Takes in a string, returns a string.
- `ChatModel.invoke`: Takes in a list of `ChatMessage`, returns a `ChatMessage`.

The input types for these methods are actually more general than this, but for simplicity here we can assume `LLMs` only take strings and `ChatModels` only takes lists of messages. Check out the "Go deeper" section below to learn more about model invocation.

Let's see how to work with these different types of models and these different types of inputs. First, let's import an `LLM` and a `ChatModel`.

```dart
final llm = OpenAI(apiKey: openaiApiKey);
final chatModel = ChatOpenAI(apiKey: openaiApiKey);
```

`LLM` and `ChatModel` objects are effectively configuration objects. You can initialize them with parameters like `temperature` and others, and pass them around.

```dart
const text = 'What would be a good company name for a company that makes colorful socks?';
final messages = [ChatMessage.humanText(text)];

final res1 = await llm.invoke(PromptValue.string(text));
print(res1.output);
// 'Feetful of Fun'

final res2 = await chatModel.invoke(PromptValue.chat(messages));
print(res2.output);
// AIChatMessage(content='RainbowSock Co.')
```

?> `LLM.invoke` and `ChatModel.invoke` take as input a `PromptValue`. This is an object that defines its own custom logic for returning its inputs either as a string or as messages. `LLM`s have logic for coercing any of these into a string, and `ChatModel`s have logic for coercing any of these to messages. The fact that `LLM` and `ChatModel` accept the same inputs means that you can directly swap them for one another in most chains without breaking anything, though it's of course important to think about how inputs are being coerced and how that may affect model performance. To dive deeper on models head to the [Language models](/modules/model_io/models/models.md) section.

## Prompt templates

Most LLM applications do not pass user input directly into an `LLM`. Usually they will add the user input to a larger piece of text, called a prompt template, that provides additional context on the specific task at hand.

In the previous example, the text we passed to the model contained instructions to generate a company name. For our application, it would be great if the user only had to provide the description of a company/product, without having to worry about giving the model instructions.

`PromptTemplates` help with exactly this! They bundle up all the logic for going from user input into a fully formatted prompt. This can start off very simple - for example, a prompt to produce the above string would just be:

```dart
final prompt = PromptTemplate.fromTemplate(
  'What is a good name for a company that makes {product}?',
);
final res = prompt.format({'product': 'colorful socks'});
print(res);
// 'What is a good name for a company that makes colorful socks?'
```

However, the advantages of using these over raw string formatting are several. You can "partial" out variables - e.g. you can format only some of the variables at a time. You can compose them together, easily combining different templates into a single prompt. For explanations of these functionalities, see the [prompts](/modules/model_io/prompts/prompts.md) for more detail.

`PromptTemplates` can also be used to produce a list of messages. In this case, the prompt not only contains information about the content, but also each message (its role, its position in the list, etc) Here, what happens most often is a `ChatPromptTemplate` is a list of `ChatMessagePromptTemplates`. Each `ChatMessagePromptTemplate` contains instructions for how to format that `ChatMessage` - its role, and then also its content. Let's take a look at this below:

```dart
const template = 'You are a helpful assistant that translates {input_language} to {output_language}.';
const humanTemplate = '{text}';

final chatPrompt = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, template),
  (ChatMessageType.human, humanTemplate),
]);

final res = chatPrompt.formatMessages({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.',
});
print(res);
// [
//   SystemChatMessage(content='You are a helpful assistant that translates English to French.'),
//   HumanChatMessage(content='I love programming.')
// ]
```

`ChatPromptTemplates` can also be constructed in other ways - see the section on [prompts](/modules/model_io/prompts/prompts.md) for more detail.

## Output parsers

`OutputParsers` convert the raw output of an LLM into a format that can be used downstream. There are few main type of `OutputParsers`, including:

- Convert text from LLM -> structured information (e.g. JSON).
- Convert a `ChatMessage` into just a string.
- Convert the extra information returned from a call besides the message (like OpenAI function invocation) into a string.

For full information on this, see the section on [output parsers](/modules/model_io/output_parsers/output_parsers.md).

In this getting started guide, we will write our own output parser - one that converts a comma separated list into a list.

```dart
class CommaSeparatedListOutputParser 
    extends BaseOutputParser<ChatResult, OutputParserOptions, List<String>> {
  
  const CommaSeparatedListOutputParser()
      : super(defaultOptions: const OutputParserOptions());

  @override
  Future<List<String>> invoke(
      final ChatResult input, {
      final OutputParserOptions? options,
  }) async {
    final message = input.output;
    return message.content.trim().split(',');
  }
}
```

```dart
final res = await const CommaSeparatedListOutputParser().invoke(
  const ChatResult(
    id: 'id',
    output: AIChatMessage(content: 'hi, bye'),
    finishReason: FinishReason.stop,
    metadata: {},
    usage: LanguageModelUsage(),
  ),
);
print(res);
// ['hi',  'bye']
```

## Composing with LCEL

We can now combine all these into one chain. This chain will take input variables, pass those to a prompt template to create a prompt, pass the prompt to a language model, and then pass the output through an (optional) output parser. This is a convenient way to bundle up a modular piece of logic. Let's see it in action!

```dart
const systemTemplate = '''
You are a helpful assistant who generates comma separated lists.
A user will pass in a category, and you should generate 5 objects in that category in a comma separated list.
ONLY return a comma separated list, and nothing more.
''';
const humanTemplate = '{text}';

final chatPrompt = ChatPromptTemplate.fromTemplates([
  (ChatMessageType.system, systemTemplate),
  (ChatMessageType.human, humanTemplate),
]);

final chatModel = ChatOpenAI(apiKey: openAiApiKey);

final chain = chatPrompt.pipe(chatModel).pipe(CommaSeparatedListOutputParser());
// Alternative syntax:
// final chain = chatPrompt | chatModel | CommaSeparatedListOutputParser();

final res = await chain.invoke({'text': 'colors'});
print(res); // ['red', 'blue', 'green', 'yellow', 'orange']
```

Note that we are using the `.pipe` syntax (or alternatively the `|` syntax) to join these components together. This syntax is powered by the LangChain Expression Language (LCEL) and relies on the universal `Runnable` interface that all of these objects implement. To learn more about this syntax, read the documentation [here](/expression_language/expression_language.md).

## Next steps

This is it! We've now gone over how to create the core building block of LangChain applications. There are a lot more features in all three of these than we can cover here. To continue on your journey:

- Read up on [LangChain Expression Language](/expression_language/expression_language.md) to learn how to chain these components together.
- [Dive deeper](/modules/model_io/model_io.md) into LLMs, prompts, and output parsers and learn the other [key components](/modules/modules.md).
- Explore common [end-to-end use cases](https://python.langchain.com/docs/use_cases).
