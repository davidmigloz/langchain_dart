# LLM

An `LLMChain` is a simple chain that adds some functionality around language
models. It is used widely throughout LangChain, including in other chains and
agents.

An `LLMChain` consists of a `PromptTemplate` and a language model (either an 
LLM or chat model). It formats the prompt template using the input key values
provided (and also memory key values, if available), passes the formatted string
to LLM and returns the LLM output.

## Get started

```dart
final llm = OpenAI(
  apiKey: openaiApiKey,
  defaultOptions: const OpenAIOptions(temperature: 0.9),
);
final prompt = PromptTemplate.fromTemplate(
  'What is a good name for a company that makes {product}?',
);
final chain = LLMChain(llm: llm, prompt: prompt);
final res = await chain.run('colorful socks');
print(res);
// -> 'Colorful Toes Co.'
```
