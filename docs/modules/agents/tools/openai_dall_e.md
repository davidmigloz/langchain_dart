# DALL-E Image Generator

Wrapper for [OpenAI's DALL-E Image Generator API](https://platform.openai.com/docs/api-reference/images).

Given a prompt the model will generate an image.

Example:

```dart
final llm = ChatOpenAI(
  apiKey: openAiKey,
  defaultOptions: const ChatOpenAIOptions(
    model: 'gpt-4',
    temperature: 0,
  ),
);
final tools = [
  CalculatorTool(),
  OpenAIDallETool(apiKey: openAiKey),
];
final agent = OpenAIFunctionsAgent.fromLLMAndTools(llm: llm, tools: tools);
final executor = AgentExecutor(agent: agent);
final res = await executor.run(
  'Calculate the result of 40 raised to the power of 0.43 and generate a funny illustration with it. '
  'Return ONLY the URL of the image. Do not add any explanation.',
);
```

Result:
![result](img/dall_e_3.png)
