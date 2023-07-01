# OpenAI functions

Certain OpenAI models (like gpt-3.5-turbo-0613 and gpt-4-0613) have been
fine-tuned to detect when a function should to be called and respond with the
inputs that should be passed to the function. In an API call, you can describe
functions and have the model intelligently choose to output a JSON object
containing arguments to call those functions. The goal of the OpenAI Function
APIs is to more reliably return valid and useful function calls than a generic
text completion or chat API.

The OpenAI Functions Agent is designed to work with these models.

```dart
final llm = ChatOpenAI(
  apiKey: openaiApiKey,
  model: 'gpt-3.5-turbo-0613',
  temperature: 0,
);
final tool = CalculatorTool();
final agent = OpenAIFunctionsAgent.fromLLMAndTools(llm: llm, tools: [tool]);
final executor = AgentExecutor(agent: agent, tools: [tool]);
final res = await executor.run('What is 40 raised to the 0.43 power? ');
print(res); // -> '40 raised to the power of 0.43 is approximately 4.8852'
```
