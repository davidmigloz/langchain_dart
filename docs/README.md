# Welcome to LangChain.dart

**LangChain.dart** is a Dart port of Python's [LangChain](https://github.com/hwchase17/langchain) framework.

> **Attribution note:** most of the docs are just an adaptation of the original
> [Python LangChain docs](https://python.langchain.com/).

**LangChain** is a framework for developing applications powered by language models. It enables applications that are:

1. **Context-aware:** connect a language model to sources of context (prompt instructions, few shot examples, content to ground its response in, etc.).
2. **Reason:** rely on a language model to reason (about how to answer based on provided context, what actions to take, etc.)

The main value prop of LangChain are:

1. **Components:** abstractions for working with language models, along with a collection of implementations for each abstraction. Components are modular and easy-to-use, whether you are using the rest of the LangChain framework or not.
2. **Off-the-shelf chains:** a structured assembly of components for accomplishing specific higher-level tasks.

Off-the-shelf chains make it easy to get started. For more complex applications and nuanced use-cases, components make it easy to customize existing chains or build new ones.

## Getting Started

[Here’s](/get_started/installation) how to install LangChain, set up your environment, and start building.

We recommend following our [Quickstart guide](/get_started/getting_started.md) to familiarize yourself with the framework by building your first LangChain application.

> **Note:** These docs are for the [LangChain Dart package](https://github.com/davidmigloz/langchain_dart). 
> For documentation on LangChain Python [click here](https://python.langchain.com), and for LangChain.js [click here](https://js.langchain.com).

## Modules

LangChain provides standard, extendable interfaces and external integrations for the following modules, listed from least to most complex:

![LangChain.dart](https://raw.githubusercontent.com/davidmigloz/langchain_dart/main/docs/img/langchain.dart.png)

**[Model I/O](/modules/model_io/models/models.md)**  
Interface with language models.

**[Retrieval]()**  
Interface with application-specific data.

**[Chains](/modules/chains/chains.md)**  
Construct sequences of calls.

**[Agents](/modules/agents/agents.md)**  
Let chains choose which tools to use given high-level directives.

**[Memory](/modules/memory/memory.md)**  
Persist application state between runs of a chain.

**[Callbacks]()**  
Log and stream intermediate steps of any chain.

## Examples, ecosystem, and resources

### [Use cases](https://python.langchain.com/docs/use_cases/)

Walkthroughs and best-practices for common end-to-end use cases, like:

- [Chatbots](https://python.langchain.com/docs/use_cases/chatbots)
- [Answering questions using sources](https://python.langchain.com/docs/use_cases/question_answering)
- [Analyzing structured data](https://python.langchain.com/docs/use_cases/tabular.html)
- and much more...

### [Guides](https://python.langchain.com/docs/guides)

Learn best practices for developing with LangChain.

### [Ecosystem](https://python.langchain.com/docs/ecosystem)

LangChain is part of a rich ecosystem of tools that integrate with our framework and build on top of it. Check out our growing list of integrations and dependent repos.

### [Additional resources](https://python.langchain.com/docs/additional_resources)

Our community is full of prolific developers, creative builders, and fantastic teachers. Check out [YouTube tutorials](https://python.langchain.com/docs/ecosystem/youtube.html) for great tutorials from folks in the community, and [Gallery](https://github.com/kyrolabs/awesome-langchain) for a list of awesome LangChain projects, compiled by the folks at [KyroLabs](https://kyrolabs.com).

### Support

Join us on [GitHub](https://github.com/davidmigloz/langchain_dart) or [Discord](https://discord.gg/6adMQxSpJS) to ask questions, share feedback, meet other developers building with LangChain, and dream about the future of LLM’s.

## API reference

Head to the [reference section](https://pub.dev/documentation/langchain/latest) for full documentation of all classes and methods in the LangChain Dart package.
