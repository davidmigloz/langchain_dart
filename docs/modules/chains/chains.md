# Chains

Using an LLM in isolation is fine for simple applications, but more complex
applications require chaining LLMs - either with each other or with other
components.

LangChain provides the **Chain** interface for such "chained" applications. We
define a Chain very generically as a sequence of calls to components, which can
include other chains.

This idea of composing components together in a chain is simple but powerful.
It drastically simplifies and makes more modular the implementation of complex
applications, which in turn makes it much easier to debug, maintain, and
improve your applications.

For more specifics check out:

- [How-to]() for walkthroughs of different chain features.
- [Foundational]() to get acquainted with core building blockchains.
- [Document]() to learn how to incorporate documents into chains.
- [Popular]() chains for the most common use cases.
- [Additional]() to see some of the more advanced chains and integrations that
  you can use out of the box.

## Why do we need chains?

Chains allow us to combine multiple components together to create a single,
coherent application. For example, we can create a chain that takes user input,
formats it with a PromptTemplate, and then passes the formatted response to an
LLM. We can build more complex chains by combining multiple chains together, or
by combining chains with other components.

## Get started

The `LLMChain` is a simple chain that takes in a prompt template, formats it with the user input
and returns the response from an LLM.

To use the `LLMChain`, first create a prompt template.

```dart
final llm = OpenAI(
  apiKey: openaiApiKey,
  defaultOptions: const OpenAIOptions(temperature: 0.9),
);
final prompt = PromptTemplate.fromTemplate(
  'What is a good name for a company that makes {product}?',
);
```

We can now create a very simple chain that will take user input, format the prompt with it, and
then send it to the LLM.

```dart
final chain = LLMChain(llm: llm, prompt: prompt);
final res = await chain.run('colorful socks');
print(res);
// -> 'Colorful Toes Co.'
```

If there are multiple variables, you can input them all at once using a dictionary.

```dart
final chain = LLMChain(llm: llm, prompt: prompt);
final res = await chain.run(
  {
    'company': 'ABC Startup',
    'product': 'colorful socks',
  },
);
print(res);
// -> 'Socktopia Colourful Creations.'
```

You can use a chat model in an LLMChain as well:

```dart
final chat = final chat = ChatOpenAI(
  apiKey: openaiApiKey,
  defaultOptions: const ChatOpenAIOptions(
    temperature: 0,
  ),
);

const template = 'What is a good name for a company that makes {product}?';
final humanMessagePrompt = HumanChatMessagePromptTemplate.fromTemplate(template);

final chatPrompt = ChatPromptTemplate.fromPromptMessages([humanMessagePrompt]);

final chain = LLMChain(llm: chat, prompt: chatPrompt);

final res = await chain.run('colorful socks');
print(res);
// -> 'Rainbow Socks Co.'
```
