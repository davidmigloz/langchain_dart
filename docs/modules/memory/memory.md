# Memory

By default, Chains and Agents are stateless, meaning that they treat each incoming query 
independently (as are the underlying LLMs and chat models). In some applications (chatbots being a 
GREAT example) it is highly important to remember previous interactions, both at a short term but 
also at a long term level. The Memory does exactly that.

LangChain provides memory components in two forms. First, LangChain provides helper utilities for 
managing and manipulating previous chat messages. These are designed to be modular and useful 
regardless of how they are used. Secondly, LangChain provides easy ways to incorporate these 
utilities into chains.

## Get started

Memory involves keeping a concept of state around throughout a user’s interactions with a language
model. A user’s interactions with a language model are captured in the concept of `ChatMessages`, so
this boils down to ingesting, capturing, transforming and extracting knowledge from a sequence of
chat messages. There are many different ways to do this, each of which exists as its own memory
type.

In general, for each type of memory there are two ways to understanding using memory. These are the
standalone functions which extract information from a sequence of messages, and then there is the
way you can use this type of memory in a chain.

Memory can return multiple pieces of information (for example, the most recent N messages and a
summary of all previous messages). The returned information can either be a string or a list of
messages.

In this guide, we will walk through the simplest form of memory: “buffer” memory, which just
involves keeping a buffer of all prior messages. We will show how to use the modular utility
functions here, then show how it can be used in a chain (both returning a string as well as a
list of messages).

### ChatMessageHistory

One of the core utility classes underpinning most (if not all) memory modules is the
`ChatMessageHistory` class. This is a super lightweight wrapper which exposes convenience methods
for saving Human messages, AI messages, and then fetching them all.

You may want to use this class directly if you are managing memory outside of a chain.

```dart
final history = ChatMessageHistory();

history.addHumanChatMessage('hi!');
history.addAIChatMessage('whats up?');

print(await history.getChatMessages());
// [HumanChatMessage(content='hi!', example=false),
//  AIMessage(content='whats up?', example=false)]
```

### ConversationBufferMemory

We now show how to use this simple concept in a chain. We first showcase `ConversationBufferMemory`
which is just a wrapper around `ChatMessageHistory` that extracts the messages in a variable.

We can first extract it as a string.

```dart
final memory = ConversationBufferMemory();

memory.chatHistory.addHumanChatMessage('hi!');
memory.chatHistory.addAIChatMessage('whats up

print(await memory.loadMemoryVariables());
// {'history': 'Human: hi!\nAI: whats up?'}
```

We can also get the history as a list of messages:

```dart
final memory = ConversationBufferMemory(returnMessages: true);

memory.chatHistory.addHumanChatMessage('hi!');
memory.chatHistory.addAIChatMessage('whats up?');

print(await memory.loadMemoryVariables());
// {'history': [HumanMessage(content='hi!', example=false),
//   AIMessage(content='whats up?', example=false)]}
```

### Using in a chain

Finally, let’s take a look at using this in a chain:

```dart
final llm = OpenAI(
  apiKey: openaiApiKey,
  defaultOptions: const OpenAIOptions(temperature: 0),
);
final conversation = ConversationChain(
  llm: llm,
  memory: ConversationBufferMemory(),
);
final output1 = await conversation.run('Hi there!');
print(output1);
// -> 'Hi there! It's nice to meet you. How can I help you today?'
```

Under the hood, the chain has formatted the prompt with the input and then passed it to the LLM.
```dart
> Entering new ConversationChain chain...
Prompt after formatting:
The following is a friendly conversation between a human and an AI. The AI is talkative and 
provides lots of specific details from its context. If the AI does not know the answer to a 
question, it truthfully says it does not know.

Current conversation:

Human: Hi there!
AI:

> Finished chain.
```

As it was the first message, 'Current conversation' is still empty. If we send another message, we
can see that the chain remembers the previous message and adds it to the context.

```dart
final output2 = await conversation.run(
  "I'm doing well! Just having a conversation with an AI.",
);
print(output2);
// -> 'That's great! It's always nice to have a conversation with someone 
// new. What would you like to talk about?'
```

Under the hood:

```dart
> Entering new ConversationChain chain...
Prompt after formatting:
The following is a friendly conversation between a human and an AI. The AI is talkative and 
provides lots of specific details from its context. If the AI does not know the answer to a 
question, it truthfully says it does not know.

Current conversation:
Human: Hi there!
AI:  Hi there! It's nice to meet you. How can I help you today?
Human: I'm doing well! Just having a conversation with an AI.
AI:

> Finished chain.
```

One more message:

```dart
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

We can see that the history is now 2 messages long:

```dart
> Entering new ConversationChain chain...
Prompt after formatting:
The following is a friendly conversation between a human and an AI. The AI is talkative and 
provides lots of specific details from its context. If the AI does not know the answer to a 
question, it truthfully says it does not know.

Current conversation:
Human: Hi there!
AI:  Hi there! It's nice to meet you. How can I help you today?
Human: I'm doing well! Just having a conversation with an AI.
AI:  That's great! It's always nice to have a conversation with someone new. What would you 
like to talk about?
Human: Tell me about yourself.
AI:

> Finished chain.
```
