# Welcome to LangChain.dart

**LangChain.dart** is a Dart port of Python's [LangChain](https://github.com/hwchase17/langchain) framework.

> **Attribution note:** most of the docs are just an adaptation of the original
> [Python LangChain docs](https://python.langchain.com/).

**LangChain** is a framework for developing applications powered by language models. It enables applications that are:

1. **Context-aware:** connect a language model to sources of context (prompt instructions, few shot examples, content to ground its response in, etc.).
2. **Reason:** rely on a language model to reason (about how to answer based on provided context, what actions to take, etc.)

The main value prop of LangChain are:

1. **Components:** composable tools and integrations for working with language models. Components are modular and easy-to-use.
2. **Off-the-shelf chains:** built-in assemblages of components for accomplishing higher-level tasks.

Off-the-shelf chains make it easy to get started. Components make it easy to customize existing chains and build new ones.

The LangChain.dart framework is made up of several different packages:

LangChain.dart has a modular design where the core [langchain](https://pub.dev/packages/langchain)
package provides the LangChain API and each integration with a model provider, database, etc. is
provided by a separate package.

## Getting Started

[Here’s](/get_started/installation) how to install LangChain, set up your environment, and start building.

We recommend following our [Quickstart guide](/get_started/getting_started.md) to familiarize yourself with the framework by building your first LangChain application.

> **Note:** These docs are for the [LangChain Dart package](https://github.com/davidmigloz/langchain_dart). 
> For documentation on LangChain Python [click here](https://python.langchain.com), and for LangChain.js [click here](https://js.langchain.com).

## LangChain Expression Language (LCEL)

LCEL is a declarative way to compose chains. LCEL was designed from day 1 to support putting prototypes in production, with no code changes, from the simplest “prompt + LLM” chain to the most complex chains.

- [Overview](/expression_language/expression_language): LCEL and its benefits
- [Interface](/expression_language/interface): The standard interface for LCEL objects
- [Cookbook](https://langchaindart.com/#/expression_language/cookbook/prompt_llm_parser): Example code for accomplishing common tasks

## Modules

LangChain.dart provides standard, extendable interfaces and integrations for the following modules:

![LangChain.dart](https://raw.githubusercontent.com/davidmigloz/langchain_dart/main/docs/img/langchain.dart.png)

**[Model I/O](/modules/model_io/models/models.md)**  
Interface with language models.

**[Retrieval]()**  
Interface with application-specific data.

**[Agents](/modules/agents/agents.md)**  
Let models choose which tools to use given high-level directives

## Examples, ecosystem, and resources

### Use cases

Walkthroughes and best-practices for [common end-to-end use cases](https://python.langchain.com/docs/use_cases), like:

- [Document question answering](https://python.langchain.com/docs/use_cases/question_answering/)
- [Chatbots](https://python.langchain.com/docs/use_cases/chatbots/)
- [Analyzing structured data](https://python.langchain.com/docs/use_cases/qa_structured/sql/)
- and much more...

### Guides

[Best practices](https://python.langchain.com/docs/guides) for developing with LangChain.

### Ecosystem

LangChain is part of a [rich ecosystem](https://python.langchain.com/docs/ecosystem) of tools that integrate with our framework and build on top of it. Check out our growing list of integrations and dependent repos.

## API reference

Head to the [reference section](https://pub.dev/documentation/langchain/latest) for full documentation of all classes and methods in the LangChain Dart package.

## Developer's guide

Check out the [developer's guide](https://github.com/davidmigloz/langchain_dart/blob/main/CONTRIBUTING.md) for guidelines on contributing and help getting your dev environment set up.

### Community

Our community is full of prolific developers, creative builders, and fantastic teachers. Join us on [GitHub](https://github.com/davidmigloz/langchain_dart) or [Discord](https://discord.gg/6adMQxSpJS) to ask questions, share feedback, meet other developers building with LangChain.dart, and dream about the future of LLM’s.
