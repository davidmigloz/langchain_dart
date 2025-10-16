// ignore_for_file: avoid_print, unused_local_variable, unreachable_from_main
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _definingTools();
  await _toolResponse();
  await _toolMessage();
  await _fewShotPrompting();
}

Future<void> _definingTools() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  const tool1 = ToolSpec(
    name: 'joke',
    description: 'A joke',
    inputJsonSchema: {
      'type': 'object',
      'properties': {
        'setup': {'type': 'string', 'description': 'The setup for the joke'},
        'punchline': {
          'type': 'string',
          'description': 'The punchline for the joke',
        },
      },
      'required': ['setup', 'punchline'],
    },
  );
  final tool2 = CalculatorTool();
  final tool3 = Tool.fromFunction<SearchInput, String>(
    name: 'search',
    description: 'Tool for searching the web.',
    inputJsonSchema: const {
      'type': 'object',
      'properties': {
        'query': {'type': 'string', 'description': 'The query to search for'},
        'n': {
          'type': 'number',
          'description': 'The number of results to return',
        },
      },
      'required': ['query'],
    },
    func: callYourSearchFunction,
    getInputFromJson: SearchInput.fromJson,
  );

  final model = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: ChatOpenAIOptions(tools: [tool1, tool2, tool3]),
  );

  final chain = model.bind(ChatOpenAIOptions(tools: [tool1, tool2, tool3]));

  final res = await model.invoke(
    PromptValue.string('input'),
    options: ChatOpenAIOptions(tools: [tool1, tool2, tool3]),
  );
  final stream = model.stream(
    PromptValue.string('input'),
    options: ChatOpenAIOptions(tools: [tool1, tool2, tool3]),
  );

  ChatOpenAIOptions(
    tools: [tool1, tool2, tool3],
    toolChoice: ChatToolChoice.forced(name: 'joke'),
  );
  ChatOpenAIOptions(
    tools: [tool1, tool2, tool3],
    toolChoice: ChatToolChoice.auto,
  );
  ChatOpenAIOptions(
    tools: [tool1, tool2, tool3],
    toolChoice: ChatToolChoice.none,
  );
}

String callYourSearchFunction(final SearchInput input) {
  return 'Results:\n${List<String>.generate(input.n, (final i) => 'Result ${i + 1}').join('\n')}';
}

class SearchInput {
  const SearchInput({required this.query, required this.n});

  final String query;
  final int n;

  SearchInput.fromJson(final Map<String, dynamic> json)
    : this(query: json['query'] as String, n: json['n'] as int);
}

Future<void> _toolResponse() async {
  final openAiApiKey = Platform.environment['OPENAI_API_KEY'];

  final calculator = CalculatorTool();

  final model = ChatOpenAI(
    apiKey: openAiApiKey,
    defaultOptions: ChatOpenAIOptions(
      model: 'gpt-4-turbo',
      tools: [calculator],
    ),
  );

  final res = await model.invoke(
    PromptValue.string('Calculate 3 * 12 and 11 + 49'),
  );
  print(res);
  // ChatResult{
  //   id: chatcmpl-9LY96mq6BYOEhBXQoOSBKVGBartYZ,
  //   output: AIChatMessage{
  //     content: ,
  //     toolCalls: [
  //       AIChatMessageToolCall{
  //         id: call_Kgo8xBug6OkFbBVBmAgI2bm0,
  //         name: calculator,
  //         argumentsRaw: {"input": "3 * 12"},
  //         arguments: {
  //           input: 3 * 12
  //         },
  //       }, AIChatMessageToolCall{
  //         id: call_Tc2zOW8obEGh0iEtA5UNykqR,
  //         name: calculator,
  //         argumentsRaw: {"input": "11 + 49"},
  //         arguments: {
  //           input: 11 + 49
  //         },
  //       }
  //     ],
  //   }
  //   finishReason: FinishReason.toolCalls,
  //   metadata: {
  //     model: gpt-4-turbo-2024-04-09,
  //     created: 1714923172,
  //     system_fingerprint: fp_ea6eb70039
  //   },
  //   usage: LanguageModelUsage{
  //     promptTokens: 91,
  //     responseTokens: 49,
  //     totalTokens: 140
  //   },
  //   streaming: false
  // }

  final chain = model.pipe(ToolsOutputParser());
  final res2 = await chain.invoke(
    PromptValue.string('Calculate 3 * 12 and 11 + 49'),
  );
  print(res2);
  // [ParsedToolCall{
  //   id: call_p4GmED1My56vV6XZi9ChljJN,
  //   name: calculator,
  //   arguments: {
  //     input: 3 * 12
  //   },
  // }, ParsedToolCall{
  //   id: call_eLJo7nII9EanFUcxy42WA5Pm,
  //   name: calculator,
  //   arguments: {
  //     input: 11 + 49
  //   },
  // }]

  // final stream = model.stream(
  //   PromptValue.string('Calculate 3 * 12 and 11 + 49'),
  // );
  // await for (final chunk in stream) {
  //   print(chunk.output.toolCalls);
  // }
  // []
  // [AIChatMessageToolCall{ id: call_bfU0p8DH8xvzZVXaDK3V42hN, name: calculator, argumentsRaw: , arguments: {}, }]
  // [AIChatMessageToolCall{ id: , name: , argumentsRaw: {"in, arguments: {}, }]
  // [AIChatMessageToolCall{ id: , name: , argumentsRaw: put":, arguments: {}, }]
  // [AIChatMessageToolCall{ id: , name: , argumentsRaw: "3 * , arguments: {}, }]
  // [AIChatMessageToolCall{ id: , name: , argumentsRaw: 12"}, arguments: {}, }]
  // [AIChatMessageToolCall{ id: call_WnHu44lmhkI3fFpEelyGBh6L, name: calculator, argumentsRaw: , arguments: {}, }]
  // [AIChatMessageToolCall{ id: , name: , argumentsRaw: {"in, arguments: {}, }]
  // [AIChatMessageToolCall{ id: , name: , argumentsRaw: put":, arguments: {}, }]
  // [AIChatMessageToolCall{ id: , name: , argumentsRaw: "11 +, arguments: {}, }]
  // [AIChatMessageToolCall{ id: , name: , argumentsRaw: 49", arguments: {}, }]
  // [AIChatMessageToolCall{ id: , name: , argumentsRaw: }, arguments: {}, }] []

  final chain2 = model.pipe(ToolsOutputParser());
  final stream2 = chain2.stream(
    PromptValue.string('Calculate 3 * 12 and 11 + 49'),
  );
  await stream2.forEach(print);
  // []
  // [ParsedToolCall{ id: call_gGXYQDJj9ZG4YmvLhZyLD442, name: calculator, arguments: {}, }]
  // [ParsedToolCall{ id: call_gGXYQDJj9ZG4YmvLhZyLD442, name: calculator, arguments: {input: 3 * }, }]
  // [ParsedToolCall{ id: call_gGXYQDJj9ZG4YmvLhZyLD442, name: calculator, arguments: {input: 3 * 12}, }]
  // [ParsedToolCall{ id: call_gGXYQDJj9ZG4YmvLhZyLD442, name: calculator, arguments: {input: 3 * 12}, }, ParsedToolCall{ id: call_axZ3Q5Ve8ZvLUB9NDXdwuUVh, name: calculator, arguments: {}, }]
  // [ParsedToolCall{ id: call_gGXYQDJj9ZG4YmvLhZyLD442, name: calculator, arguments: {input: 3 * 12}, }, ParsedToolCall{ id: call_axZ3Q5Ve8ZvLUB9NDXdwuUVh, name: calculator, arguments: {input: 11 +}, }]
  // [ParsedToolCall{ id: call_gGXYQDJj9ZG4YmvLhZyLD442, name: calculator, arguments: {input: 3 * 12}, }, ParsedToolCall{ id: call_axZ3Q5Ve8ZvLUB9NDXdwuUVh, name: calculator, arguments: {input: 11 + 49}, }]
}

Future<void> _toolMessage() async {
  final openAiApiKey = Platform.environment['OPENAI_API_KEY'];

  final calculator = CalculatorTool();

  final model = ChatOpenAI(
    apiKey: openAiApiKey,
    defaultOptions: ChatOpenAIOptions(
      model: 'gpt-4-turbo',
      tools: [calculator],
    ),
  );

  final messages = [ChatMessage.humanText('Calculate 3 * 12 and 11 + 49')];

  final res = await model.invoke(PromptValue.chat(messages));
  print(res);
  // ChatResult{
  //   id: chatcmpl-9LYl0AecfrQClqOS4PNfczOvsBNvt,
  //   output: AIChatMessage{
  //     content: ,
  //     toolCalls: [
  //       AIChatMessageToolCall{
  //         id: call_5tXVddYtn9igaRAeUwfH7ZN2,
  //         name: calculator,
  //         argumentsRaw: {"input": "3 * 12"},
  //         arguments: {
  //           input: 3 * 12
  //         },
  //       },
  //       AIChatMessageToolCall{
  //         id: call_bQ3Yx6foKIYLXBMQas5ObhHa,
  //         name: calculator,
  //         argumentsRaw: {"input": "11 + 49"},
  //         arguments: {
  //           input: 11 + 49
  //         },
  //       }
  //     ],
  //   },
  //   finishReason: FinishReason.toolCalls,
  //   metadata: {
  //     model: gpt-4-turbo-2024-04-09,
  //     created: 1714925522,
  //     system_fingerprint: fp_3450ce39d5
  //   },
  //   usage: LanguageModelUsage{
  //     promptTokens: 91,
  //     responseTokens: 49,
  //     totalTokens: 140
  //   },
  //   streaming: false
  // }

  messages.add(res.output);

  for (final toolCall in res.output.toolCalls) {
    final input = calculator.getInputFromJson(toolCall.arguments);
    final toolRes = await calculator.invoke(input);
    final toolMessage = ChatMessage.tool(
      toolCallId: toolCall.id,
      content: toolRes,
    );
    messages.add(toolMessage);
  }

  final res2 = await model.invoke(PromptValue.chat(messages));
  print(res2.output.content);
  // The calculations yield the following results:
  // - 3 * 12 = 36
  // - 11 + 49 = 60
}

Future<void> _fewShotPrompting() async {
  final openAiApiKey = Platform.environment['OPENAI_API_KEY'];

  final calculator = CalculatorTool();

  final model = ChatOpenAI(
    apiKey: openAiApiKey,
    defaultOptions: ChatOpenAIOptions(
      model: 'gpt-4-turbo',
      tools: [calculator],
    ),
  );

  final examples = [
    ChatMessage.humanText('Calculate 3 ✖️ 12 and 11 ➕ 49'),
    ChatMessage.ai(
      '',
      toolCalls: const [
        AIChatMessageToolCall(
          id: 'call_1',
          name: 'calculator',
          argumentsRaw: '{"input": "3 * 12"}',
          arguments: {'input': '3 * 12'},
        ),
        AIChatMessageToolCall(
          id: 'call_2',
          name: 'calculator',
          argumentsRaw: '{"input": "11 + 49"}',
          arguments: {'input': '11 + 49'},
        ),
      ],
    ),
    ChatMessage.tool(toolCallId: 'call_1', content: '36'),
    ChatMessage.tool(toolCallId: 'call_2', content: '60'),
    ChatMessage.ai(
      'The calculations yield the following results:\n- 3 ✖️ 12 = 36\n- 11 ➕ 49 = 60',
    ),
  ];

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are bad at math but are an expert at using a calculator. '
          'Use past tool usage as an example of how to correctly use the tools.',
    ),
    (ChatMessageType.messagesPlaceholder, 'examples'),
    (ChatMessageType.human, '{query}'),
  ]);

  final chain = promptTemplate.pipe(model).pipe(ToolsOutputParser());
  final res = await chain.invoke({
    'query': 'Calculate 3 ✖️ 12 and 11 ➕ 49',
    'examples': examples,
  });
  print(res);
  // [ParsedToolCall{
  //   id: call_BtNoLk7IiQksMfad5897mSSu,
  //   name: calculator,
  //   arguments: {input: 3 * 12},
  // }, ParsedToolCall{
  //   id: call_ZAiFb1G71hwiwVvnqZFKHTuP,
  //   name: calculator,
  //   arguments: {input: 11 + 49},
  // }]
}
