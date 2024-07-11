// ignore_for_file: avoid_print, avoid_redundant_argument_values
import 'package:langchain/langchain.dart';
import 'package:langchain_ollama/langchain_ollama.dart';

void main(final List<String> arguments) async {
  await _tools();
  await _customizingSystemPrompt();
  await _extraction();
}

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

Future<void> _tools() async {
  final model = ChatOllamaTools(
    defaultOptions: const ChatOllamaToolsOptions(
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

  final res3 = await chain.invoke(
    PromptValue.string("What's the weather in Barcelona and Amsterdam?"),
    options: ChatOllamaToolsOptions(
      toolChoice: ChatToolChoice.forced(name: 'get_current_weather'),
    ),
  );
  print(res3);
}

Future<void> _customizingSystemPrompt() async {
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
```

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

  final res = await model.invoke(
    PromptValue.string("What's the weather in Barcelona?"),
  );
  print(res);
}

Future<void> _extraction() async {
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
      options: const ChatOllamaOptions(
        model: 'gemma2',
        temperature: 0,
      ),
      tools: const [tool],
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
}
