# ChatOllamaTools

LangChain.dart offers an experimental wrapper around open source models run locally via [Ollama](https://ollama.ai) that enables [tool calling capabilities](/modules/model_io/models/chat_models/how_to/tools.md).

> Warning: This is an experimental wrapper that attempts to add tool calling support to models that do not support it natively.  Use with caution.

More powerful and capable models will perform better with complex schema and/or multiple tools. For a complete list of supported models, see the [Ollama model library](https://ollama.ai/library). The examples below use Google's [Gemma2 9B model](https://ollama.com/library/gemma2) running locally. 

## Setup

Follow [these instructions](https://github.com/jmorganca/ollama) to set up and run a local Ollama instance:

1. Download and install [Ollama](https://ollama.ai)
2. Fetch a model via `ollama pull <model family>`
  * e.g., for Llama 3: `ollama pull gemma2`

## Usage

You can use `ChatOllamaTools` in a similar way to a regular `ChatOllama` wrapper. The main difference is that `ChatOllamaToolsOptions` accepts:
- `options`: the usual `ChatOllamaOptions` options
- `tools`: the list with the definition of the tools the model can call
- `toolChoice`: how the model should respond to tool calls
- `toolsSystemPromptTemplate`: the prompt template used to inform the user about the available tools

`ChatOllamaTools` follows the standard [LangChain tools API](/modules/model_io/models/chat_models/how_to/tools.md), so you can use it in the same way as you would with other providers that support tool-calling (e.g. `ChatOpenAI`, `ChatAnthropic`, etc.).

```dart
const tool = ToolSpec(
  name: 'get_current_weather',
  description: 'Get the current weather in a given location',
  inputJsonSchema: {
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The city and country, e.g. San Francisco, US',
      },
      'unit': {
        'type': 'string',
        'description': 'The unit of temperature to return',
        'enum': ['celsius', 'fahrenheit'],
      },
    },
    'required': ['location'],
  },
);
final model = ChatOllamaTools(
  defaultOptions: ChatOllamaToolsOptions(
    options: ChatOllamaOptions(
      model: 'gemma2',
      temperature: 0,
    ),
    tools: [tool],
  ),
);
final res = await model.invoke(
  PromptValue.string("What's the weather in Barcelona?"),
);
print(res);
// ChatResult{
//   id: 51ede9a1-7ab7-4c81-803e-cfe237eb92ae,
//   output: AIChatMessage{
//     content: ,
//     toolCalls: [
//       AIChatMessageToolCall{
//         id: 42139039-9251-4e1b-9f47-21f24da65be9,
//         name: get_current_weather,
//         arguments: {location: Barcelona, ES, unit: celsius},
//       }
//     ],
//   },
//   finishReason: FinishReason.stop,
//   metadata: {
//     model: gemma2,
//     created_at: 2024-07-11T15:44:56.893216Z,
//     done: true,
//     total_duration: 2900101792,
//     load_duration: 41286000,
//     prompt_eval_count: 327,
//     prompt_eval_duration: 453557000,
//     eval_count: 57,
//     eval_duration: 2401129000
//   },
//   usage: LanguageModelUsage{
//     promptTokens: 327,
//     promptBillableCharacters: null,
//     responseTokens: 57,
//     responseBillableCharacters: null,
//     totalTokens: 384
//   }
// }
```

If you want to extract only the tool calls, you can use the `ToolCallOutputParser`:

```dart
final chain = model.pipe(ToolsOutputParser());
final res2 = await chain.invoke(
  PromptValue.string("What's the weather in Barcelona and Amsterdam?"),
);
print(res2);
// [
//   ParsedToolCall{
//     id: b62a9051-0193-4115-9bac-362005c40c2d,
//     name: get_current_weather,
//     arguments: {location: Barcelona, ES, unit: celsius},
//   }, 
//   ParsedToolCall{
//     id: 442ff44c-2a8e-4e16-9fc5-ddaf586a37ce,
//     name: get_current_weather,
//     arguments: {location: Amsterdam, NL, unit: celsius},
//   }
// ]
```

As you can see, `ChatOllamaTools` support calling multiple tools in a single request.

If you want to customize how the model should respond to tool calls, you can use the `toolChoice` parameter:

```dart
final res3 = await chain.invoke(
  PromptValue.string("What's the weather in Barcelona and Amsterdam?"),
  options: ChatOllamaToolsOptions(
    toolChoice: ChatToolChoice.forced(name: 'get_current_weather'),
  ),
);
```

Note: streaming is not supported at the moment.

## Customizing the system prompt template

Behind the scenes, `ChatOllamaTools` uses Ollama's JSON mode to restrict output to JSON, and passes tool schemas to the prompt as JSON schemas.

You can find the default system prompt in `ChatOllamaToolsOptions.defaultToolsSystemPromtTemplate`.

Because different models have different strengths, it may be helpful to pass in your own system prompt. Here's an example of how you can customize the system prompt template:

```dart
const toolSystemPromptTemplate = '''
You have access to these tools: 
{tools}

Based on the user input, select {tool_choice} from the available tools.

Respond with a JSON containing a list of tool call objects. 
The tool call objects should have two properties:
- "tool_name": The name of the selected tool (string)
- "tool_input": A JSON string with the input for the tool matching the tool's input schema

Example response format:
```json
{{
  "tool_calls": [
    {{
      "tool_name": "tool_name",
      "tool_input": "{{"param1":"value1","param2":"value2"}}"
    }}
  ]
}}

Ensure your response is valid JSON and follows this exact format.''';

final model = ChatOllamaTools(
  defaultOptions: const ChatOllamaToolsOptions(
    options: ChatOllamaOptions(
      model: 'gemma2',
      temperature: 0,
    ),
    tools: [tool],
    toolsSystemPromptTemplate: toolSystemPromptTemplate,
  ),
);
```

You prompt template should contain the following placeholders:
- `{tools}`: where the list of available tools will be inserted
- `{tool_choice}`: where the instruction to select a certain tool will be inserted

The model should return a JSON like:
```json
{
  "tool_calls": [
    {
      "tool_name": "tool_name",
      "tool_input": "{\"param1\":\"value1\",\"param2\":\"value2\"}"
    }
  ]
}
```

## Example: extracting structured data

A useful application of tool calling is extracting structured data from unstructured text. In the following example, we use a tool to extract the names, heights, and hair colors of people mentioned in a passage.

```dart
const tool = ToolSpec(
  name: 'information_extraction',
  description: 'Extracts the relevant information from the passage',
  inputJsonSchema: {
    'type': 'object',
    'properties': {
      'people': {
        'type': 'array',
        'items': {
          'type': 'object',
          'properties': {
            'name': {
              'type': 'string',
              'description': 'The name of a person',
            },
            'height': {
              'type': 'number',
              'description': 'The height of the person in cm',
            },
            'hair_color': {
              'type': 'string',
              'description': 'The hair color of the person',
              'enum': ['black', 'brown', 'blonde', 'red', 'gray', 'white'],
            },
          },
          'required': ['name', 'height', 'hair_color'],
        },
      },
    },
    'required': ['people'],
  },
);

final model = ChatOllamaTools(
  defaultOptions: ChatOllamaToolsOptions(
    options: ChatOllamaOptions(
      model: 'gemma2',
      temperature: 0,
    ),
    tools: [tool],
    toolChoice: ChatToolChoice.forced(name: tool.name),
  ),
);

final promptTemplate = ChatPromptTemplate.fromTemplate('''
Extract and save the relevant entities mentioned in the following passage together with their properties. 

Passage:
{input}''');

final chain = Runnable.getMapFromInput<String>()
    .pipe(promptTemplate)
    .pipe(model)
    .pipe(ToolsOutputParser());

final res = await chain.invoke(
  'Alex is 5 feet tall. '
  'Claudia is 1 foot taller than Alex and jumps higher than him. '
  'Claudia has orange hair and Alex is blonde.',
);
final extractedData = res.first.arguments;
print(extractedData);
// {
//   people: [
//     {
//       name: Alex,
//       height: 152,
//       hair_color: blonde
//     },
//     {
//       name: Claudia, 
//       height: 183,
//       hair_color: orange
//     }
//   ]
// }
```
