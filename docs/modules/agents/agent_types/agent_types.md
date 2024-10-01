# Agent types

## Action agents

Agents use an LLM to determine which actions to take and in what order. An
action can either be using a tool and observing its output, or returning a
response to the user. Here are the agents available in LangChain.

### OpenAI Functions

Certain OpenAI models (like gpt-3.5-turbo-0613 and gpt-4-0613) have been
explicitly fine-tuned to detect when a function should to be called and respond
with the inputs that should be passed to the function. The OpenAI Functions
Agent is designed to work with these models.
[More info...](./openai_functions_agent.md)
