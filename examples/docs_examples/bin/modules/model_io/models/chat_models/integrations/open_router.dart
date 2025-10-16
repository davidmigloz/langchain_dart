// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _openRouter();
  await _openRouterStreaming();
  await _openRouterStreamingTools();
}

Future<void> _openRouter() async {
  final openRouterApiKey = Platform.environment['OPEN_ROUTER_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that translates {input_language} to {output_language}.',
    ),
    (ChatMessageType.human, '{text}'),
  ]);

  final chatModel = ChatOpenAI(
    apiKey: openRouterApiKey,
    baseUrl: 'https://openrouter.ai/api/v1',
    defaultOptions: const ChatOpenAIOptions(model: 'mistralai/mistral-small'),
  );

  final chain = promptTemplate | chatModel | const StringOutputParser();

  final res = await chain.invoke({
    'input_language': 'English',
    'output_language': 'French',
    'text': 'I love programming.',
  });
  print(res);
  // -> 'J'aime la programmation.'
}

Future<void> _openRouterStreaming() async {
  final openRouterApiKey = Platform.environment['OPEN_ROUTER_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that replies only with numbers '
          'in order without any spaces or commas',
    ),
    (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
  ]);

  final chatModel = ChatOpenAI(
    apiKey: openRouterApiKey,
    baseUrl: 'https://openrouter.ai/api/v1',
    defaultOptions: const ChatOpenAIOptions(model: 'mistralai/mistral-small'),
  );

  final chain = promptTemplate.pipe(chatModel).pipe(const StringOutputParser());

  final stream = chain.stream({'max_num': '9'});
  await stream.forEach(print);
  // 123
  // 456789
}

Future<void> _openRouterStreamingTools() async {
  final openRouterApiKey = Platform.environment['OPEN_ROUTER_API_KEY'];

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
  final chat = ChatOpenAI(
    apiKey: openRouterApiKey,
    baseUrl: 'https://openrouter.ai/api/v1',
    defaultOptions: ChatOpenAIOptions(
      model: 'gpt-4o',
      tools: const [tool],
      toolChoice: ChatToolChoice.forced(name: 'joke'),
    ),
  );
  final outputParser = ToolsOutputParser();

  final chain = promptTemplate.pipe(chat).pipe(outputParser);

  final stream = chain.stream({'foo': 'bears'});
  await for (final chunk in stream) {
    final args = chunk.first.arguments;
    print(args);
  }
  // {}
  // {setup: }
  // {setup: Why don't}
  // {setup: Why don't bears}
  // {setup: Why don't bears like fast food}
  // {setup: Why don't bears like fast food?, punchline: }
  // {setup: Why don't bears like fast food?, punchline: Because}
  // {setup: Why don't bears like fast food?, punchline: Because they can't}
  // {setup: Why don't bears like fast food?, punchline: Because they can't catch it!}
}
