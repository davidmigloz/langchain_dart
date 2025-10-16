// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _toolsOutputParser();
}

Future<void> _toolsOutputParser() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  const tool = ToolSpec(
    name: 'joke',
    description: 'A joke',
    inputJsonSchema: {
      'type': 'object',
      'properties': {
        'setup': {'type': 'string', 'description': 'The setup for the joke'},
        'punchline': {
          'type': 'string',
          'description': 'The punchline to the joke',
        },
      },
      'required': ['location', 'punchline'],
    },
  );
  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'tell me a long joke about {foo}',
  );
  final chat =
      ChatOpenAI(
        apiKey: openaiApiKey,
        defaultOptions: const ChatOpenAIOptions(temperature: 0),
      ).bind(
        ChatOpenAIOptions(
          tools: const [tool],
          toolChoice: ChatToolChoice.forced(name: 'joke'),
        ),
      );
  final outputParser = ToolsOutputParser();
  final chain = promptTemplate.pipe(chat).pipe(outputParser);
  final res = await chain.invoke({'foo': 'bears'});
  print(res);
  // [ParsedToolCall{
  //   id: call_5TU1iYgYO3Z81eAuTe7J23f7,
  //   name: joke,
  //   arguments: {
  //     setup: Why don't bears like fast food restaurants?,
  //     punchline: Because they can't bear the wait!
  //   },
  // }]

  final stream = chain.stream({'foo': 'bears'});
  await for (final res in stream) {
    final args = res.first.arguments;
    print(args);
  }
  // {}
  // {setup: }
  // {setup: Why}
  // {setup: Why don't}
  // {setup: Why don't bears}
  // {setup: Why don't bears like}
  // {setup: Why don't bears like fast food}
  // {setup: Why don't bears like fast food restaurants?}
  // {setup: Why don't bears like fast food restaurants?, punchline: }
  // {setup: Why don't bears like fast food restaurants?, punchline: Because}
  // {setup: Why don't bears like fast food restaurants?, punchline: Because they can't}
  // {setup: Why don't bears like fast food restaurants?, punchline: Because they can't catch}
  // {setup: Why don't bears like fast food restaurants?, punchline: Because they can't catch them!}
}
