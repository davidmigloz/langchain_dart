# Quickstart

## Installation

To get started, follow
the [installation instructions](/get_started/installation.md) to install
LangChain.

Using LangChain will usually require integrations with one or more model
providers, data stores, APIs, etc. For this example, we'll use OpenAI's model
APIs.

First we'll need to add LangChain.dart OpenAI package:

```yaml
dependencies:
  langchain: { version }
  langchain_openai: { version }
```

Accessing the API requires an API key, which you can get by creating an account
and heading [here](https://platform.openai.com/account/api-keys).

The library does not force you to use any specific key management strategy. You
just need to pass the key on the `OpenAI` constructor:

```dart
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

final llm = OpenAI(apiKey: openaiApiKey);
```

## Building an application

Now we can start building our language model application. LangChain provides
many modules that can be used to build language model applications. Modules can
be used as stand-alones in simple applications and they can be combined for more
complex use cases.

### LLMs

The basic building block of LangChain is the LLM, which takes in text and
generates more text.

As an example, suppose we're building an application that generates a company
name based on a company description. In order to do this, we need to initialize
an OpenAI model wrapper. In this case, since we want the outputs to be MORE
random, we'll initialize our model with a HIGH temperature.

```dart
final llm = OpenAI(apiKey: openaiApiKey, temperature: 0.9);
```

And now we can pass in text and get predictions!

```dart
const text = 'What would be a good company name for a company that makes colorful socks?';

final res = await llm.predict(text);
print(res); 
// -> 'Feetful of Fun'
```

### Chat models

Chat models are a variation on language models. While chat models use language
models under the hood, the interface they expose is a bit different: rather than
expose a "text in, text out" API, they expose an interface where "chat messages"
are the inputs and outputs.

You can get chat completions by passing one or more messages to the chat model.
The response will be a message. The types of messages currently supported in
LangChain are `AIMessage`, `HumanMessage`, `SystemMessage`,
and `ChatMessage` -- `ChatMessage` takes in an arbitrary role parameter. Most of
the time, you'll just be dealing with `HumanMessage`, `AIMessage`,
and `SystemMessage`.

```dart
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

final chat = ChatOpenAI(apiKey: openaiApiKey, temperature: 0);

final usrMsg = ChatMessage.human('Translate this sentence from English to French. I love programming.');
final aiMsg = await chat.predictMessages([usrMsg]);
print(aiMsg);
// -> AIChatMessage(content="J'aime programmer.") 
```

It is useful to understand how chat models are different from a normal LLM, but
it can often be handy to just be able to treat them the same. LangChain makes
that easy by also exposing an interface through which you can interact with a
chat model as you would a normal LLM. You can access this through the `predict`
interface.

```dart
const text = 'Translate this sentence from English to French. I love programming.';
final res = await llm.predict(text);
print(res); 
// -> 'J'aime programmer'
```

### Prompt templates

Most LLM applications do not pass user input directly into to an LLM. Usually 
they will add the user input to a larger piece of text, called a prompt 
template, that provides additional context on the specific task at hand.

In the previous example, the text we passed to the model contained instructions 
to generate a company name. For our application, it'd be great if the user only 
had to provide the description of a company/product, without having to worry 
about giving the model instructions.

<!-- tabs:start -->

#### **LLMs**

With PromptTemplates this is easy! In this case our template would be very 
simple:

```dart
final prompt = PromptTemplate.fromTemplate(
  'What is a good name for a company that makes {product}?',
);
print(prompt.format({'product': 'colorful socks'}));
// -> 'What is a good name for a company that makes colorful socks?'
```

#### **Chat models**

Similar to LLMs, you can make use of templating by using a 
`MessagePromptTemplate`. You can build a `ChatPromptTemplate` from one or more 
`MessagePromptTemplate`s. You can use `ChatPromptTemplate`'s `formatPrompt` 
method to generate the formatted messages.

Because this is generating a list of messages, it is slightly more complex than 
the normal prompt template which is generating only a string. Please see the 
detailed guides on prompts to understand more options available to you 
[here](/modules/model_io/prompts/prompt_templates/prompt_templates.md).

```dart
final chat = ChatOpenAI(apiKey: openaiApiKey, temperature: 0);

const template = 'You are a helpful assistant that translates {input_language} to {output_language}.';
final systemMessagePrompt = SystemChatMessagePromptTemplate.fromTemplate(template);
const humanTemplate = '{text}';
final humanMessagePrompt = HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);

final chatPrompt = ChatPromptTemplate.fromPromptMessages([systemMessagePrompt, humanMessagePrompt]);
final formattedPrompt = chatPrompt.formatPrompt({
  'input_language': 'English',
  'output_language': 'French',
  'text': 'I love programming.'
}).toChatMessages();

print(formattedPrompt);
// [SystemChatMessage(content='You are a helpful assistant that translates English to French.'),
//  HumanChatMessage(content='I love programming.')]
```

<!-- tabs:end -->

### Chains

Now that we've got a model and a prompt template, we'll want to combine the 
two. Chains give us a way to link (or chain) together multiple primitives, like 
models, prompts, and other chains.

<!-- tabs:start -->

#### **LLMs**

The simplest and most common type of chain is an `LLMChain`, which passes an 
input first to a `PromptTemplate` and then to an LLM. We can construct an 
`LLMChain` from our existing model and prompt template.

Using this we can replace:

```dart
llm.predict('What would be a good company name for a company that makes colorful socks?');
```

with:

```dart
final chain = LLMChain(llm: llm, prompt: prompt);
final res = await chain.run('colorful socks');
// -> '\n\nSocktastic!'
```

There we go, our first chain! Understanding how this simple chain works will 
set you up well for working with more complex chains.

#### **Chat models**

The `LLMChain` can be used with chat models as well:

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

<!-- tabs:end -->

### Agents

Our first chain ran a pre-determined sequence of steps. To handle complex 
workflows, we need to be able to dynamically choose actions based on inputs.

Agents do just this: they use a language model to determine which actions to 
take and in what order. Agents are given access to tools, and they repeatedly 
choose a tool, run the tool, and observe the output until they come up with a 
final answer.

To load an agent, you need to choose:

- LLM/Chat model: The language model powering the agent.
- Tool(s): A function that performs a specific duty. This can be things like: 
  calculator, Google Search, Database lookup, other chains, etc. For a list of 
  predefined tools and their specifications, see the 
  [Tools documentation]().
- Agent: an agent class is largely parameterized by the prompt the language 
  model uses to determine which action to take. The agents are orchestrated by
  agent executors.

For this example, we'll be using a calculator to evaluate mathematical 
expressions.

```dart
final llm = ChatOpenAI(
  apiKey: openaiApiKey,
  model: 'gpt-3.5-turbo-0613',
  temperature: 0,
);
final tool = CalculatorTool();
final agent = OpenAIFunctionsAgent.fromLLMAndTools(llm: llm, tools: [tool]);
final executor = AgentExecutor(agent: agent);
final res = await executor.run('What is 40 raised to the 0.43 power? ');
print(res); // -> '40 raised to the power of 0.43 is approximately 4.8852'
```

### Memory

The chains and agents we've looked at so far have been stateless, but for many 
applications it's necessary to reference past interactions. This is clearly the 
case with a chatbot for example, where you want it to understand new messages 
in the context of past messages.

The Memory module gives you a way to maintain application state. The 
`BaseMemory` interface is simple: it lets you update state given the latest run 
inputs and outputs, and it lets you modify (or contextualize) the next input 
using the stored state.

There are a number of built-in memory systems. The simplest of these are is a 
buffer memory which just prepends the last few inputs/outputs to the current 
input - we will use this in the example below.

<!-- tabs:start -->

#### **LLMs**

```dart
final llm = OpenAI(apiKey: openaiApiKey, temperature: 0);
final conversation = ConversationChain(llm: llm);

final output = await conversation.run('Hi there!');
print(output);
// -> 'Hello! How are you today?'
```

Under the hood, the chain has formatted the prompt with the input and then
passed it to the LLM.

```dart
> Entering new chain...
Prompt after formatting:
The following is a friendly conversation between a human and an AI. The AI is talkative and
provides lots of specific details from its context. If the AI does not know the answer to a
question, it truthfully says it does not know.

Current conversation:

Human: Hi there!
AI:

> Finished chain.
' Hello! How are you today?'
```

As it was the first message, 'Current conversation' is still empty. If we send
another message, we can see that the chain remembers the previous message and 
adds it to the context.

```dart
final output1 = await conversation.run(
  "I'm doing well! Just having a conversation with an AI.",
);
print(output1);
// -> 'That's great! What would you like to talk about?'
```

Here's what's going on under the hood:

```
> Entering new chain...
Prompt after formatting:
The following is a friendly conversation between a human and an AI. The AI is 
talkative and provides lots of specific details from its context. If the AI 
does not know the answer to a question, it truthfully says it does not know.

Current conversation:

Human: Hi there!
AI: Hello! How are you today?
Human: I'm doing well! Just having a conversation with an AI.
AI:

> Finished chain
    .
"That's great! What would you like to talk about?"
```

#### **Chat models**

You can use Memory with chains and agents initialized with chat models. The 
main difference between this and Memory for LLMs is that rather than trying to 
condense all previous messages into a string, we can keep them as their own 
unique memory object.

```dart
final output1 = await conversation.run('Hi there!');
print(output1);
// -> 'Hello! How can I assist you today?'
final output2 = await conversation.run(
  "I'm doing well! Just having a conversation with an AI.",
);
print(output2);
// -> 'That sounds like fun! I'm happy to chat with you. Is there anything 
// specific you'd like to talk about?'
final output3 = await conversation.run(
  'Tell me about yourself',
);
print(output3);
// -> 'Sure! I am an AI language model created by OpenAI. I was trained on a 
// large dataset of text from the internet, which allows me to understand and 
// generate human-like language. I can answer questions, provide information, 
// and even have conversations like this one. Is there anything else you'd 
// like to know about me?'
```

<!-- tabs:end -->
