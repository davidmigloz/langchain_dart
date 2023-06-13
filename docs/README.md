# Welcome to LangChain.dart

**LangChain.dart** is a Dart port of [LangChain](https://github.com/hwchase17/langchain).

> **Attribution note:** most of the docs are just an adaptation of the original 
> [LangChain docs](https://python.langchain.com/).

**LangChain** is a framework for developing applications powered by language models. We believe 
that the most powerful and differentiated applications will not only call out to a language model, 
but will also be:
1. *Data-aware*: connect a language model to other sources of data.
2. *Agentic*: allow a language model to interact with its environment.

The LangChain framework is designed around these principles.

This is the Dart specific portion of the documentation. 
- For a purely conceptual guide to LangChain, see [here](https://docs.langchain.com).
- For the Python docs, see [here](https://python.langchain.com).
- For the JavaScript docs, see [here](https://js.langchain.com).

## Getting Started

How to get started using LangChain to create an Language Model application:

- [Quickstart Guide](/getting_started/getting_started.md)

Concepts and terminology:

- [Concepts and terminology](https://python.langchain.com/en/latest/getting_started/concepts.html)

Tutorials created by community experts and presented on YouTube:

- [Tutorials](https://python.langchain.com/en/latest/getting_started/tutorials.html)

## Modules

These modules are the core abstractions which we view as the building blocks of any LLM-powered 
application.

For each module LangChain provides standard, extendable interfaces. LangChain also provides 
external integrations and even end-to-end implementations for off-the-shelf use.

The docs for each module contain quickstart examples, how-to guides, reference docs, and 
conceptual guides.

The modules are (from least to most complex):

- [Models](/modules/models/models.md): Supported model types and integrations.
- [Prompts](/modules/prompts/prompts.md): Prompt management, optimization, and serialization.
- Memory: Memory refers to state that is persisted between calls of a chain/agent.
- Indexes: Language models become much more powerful when combined with application-specific data - 
  this module contains interfaces and integrations for loading, querying and updating external data.
- [Chains](/modules/chains/chains.md): Chains are structured sequences of calls (to an LLM or to a 
  different utility).
- Agents: An agent is a Chain in which an LLM, given a high-level directive and a set of tools, 
  repeatedly decides an action, executes the action and observes the outcome until the high-level 
  directive is complete.
- Callbacks: Callbacks let you log and stream the intermediate steps of any chain, making it easy 
  to observe, debug, and evaluate the internals of an application.

## Use Cases

Best practices and built-in implementations for common LangChain use cases:

- [Autonomous Agents](https://python.langchain.com/en/latest/use_cases/autonomous_agents.html): 
  Autonomous agents are long-running agents that take many steps in an attempt to accomplish an 
  objective. Examples include AutoGPT and BabyAGI.
- [Agent Simulations](https://python.langchain.com/en/latest/use_cases/agent_simulations.html): 
  Putting agents in a sandbox and observing how they interact with each other and react to events 
  can be an effective way to evaluate their long-range reasoning and planning abilities.
- [Personal Assistants](https://python.langchain.com/en/latest/use_cases/personal_assistants.html): 
  One of the primary LangChain use cases. Personal assistants need to take actions, remember 
  interactions, and have knowledge about your data.
- [Question Answering](https://python.langchain.com/en/latest/use_cases/question_answering.html): 
  Another common LangChain use case. Answering questions over specific documents, only utilizing 
  the information in those documents to construct an answer.
- [Chatbots](https://python.langchain.com/en/latest/use_cases/chatbots.html): Language models love 
  to chat, making this a very natural use of them.
- [Querying Tabular Data](https://python.langchain.com/en/latest/use_cases/tabular.html): 
  Recommended reading if you want to use language models to query structured data 
  (CSVs, SQL, dataframes, etc).
- [Code Understanding](https://python.langchain.com/en/latest/use_cases/code.html): Recommended 
  reading if you want to use language models to analyze code.
- [Interacting with APIs](https://python.langchain.com/en/latest/use_cases/apis.html): Enabling 
  language models to interact with APIs is extremely powerful. It gives them access to up-to-date 
  information and allows them to take actions.
- [Extraction](https://python.langchain.com/en/latest/use_cases/extraction.html): Extract 
  structured information from text.
- [Summarization](https://python.langchain.com/en/latest/use_cases/summarization.html): 
  Compressing longer documents. A type of Data-Augmented Generation.
- [Evaluation](https://python.langchain.com/en/latest/use_cases/evaluation.html): Generative 
  models are hard to evaluate with traditional metrics. One promising approach is to use language 
  models themselves to do the evaluation.

## Reference Docs

Full documentation on all methods, classes, installation methods, and integration setups 
for LangChain.

- [Reference Documentation](https://pub.dev/documentation/langchain/latest/)
