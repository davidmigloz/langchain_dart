# Models

> [Conceptual Guide](https://docs.langchain.com/docs/components/models)

This section of the documentation deals with different types of models that are used in LangChain. 
On this page we will go over the model types at a high level, but we have individual pages for each 
model type. The pages contain more detailed “how-to” guides for working with that model, as well as 
a list of different model providers.

- [Getting Started](/modules/models/getting_started): An overview of the models.

## Model Types

- [LLMs](/modules/models/llms/getting_started): Large Language Models (LLMs) take a text string as 
  input and return a text string as output.
- [Chat Models](/modules/models/chat_models/chat_models.md): Chat Models are usually backed by a 
- language model, but their APIs are more structured. Specifically, these models take a list of 
  Chat Messages as input, and return a Chat Message.
- Text Embedding Models: Text embedding models take text as input and return a list of floats.
