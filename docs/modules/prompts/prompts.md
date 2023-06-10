# Prompts

> [Conceptual Guide](https://docs.langchain.com/docs/components/prompts)

The new way of programming models is through prompts. A "prompt" refers to the input to the model. 
This input is rarely hard coded, but rather is often constructed from multiple components. 
A `PromptTemplate` is responsible for the construction of this input. LangChain provides several 
classes and functions to make constructing and working with prompts easy.

- [Getting Started](/modules/prompts/getting_started): An overview of the prompts.
- [LLM Prompt Templates](/modules/prompts/prompt_templates/prompt_templates.md): How to use 
  `PromptTemplates` to prompt LLMs.
- [Chat Prompt Templates](/modules/prompts/chat_prompt_templates/chat_prompt_templates.md): How to 
  use `PromptTemplates` to prompt Chat Models.
- Example Selectors: Often times it is useful to include examples in prompts. These examples can be 
  dynamically selected. This section goes over example selection.
- Output Parsers: Language models (and Chat Models) output text. But many times you may want to get 
  more structured information. This is where output parsers come in. Output Parsers:
  * Instruct the model how output should be formatted.
  * Parse output into the desired formatting (including retrying if necessary).
