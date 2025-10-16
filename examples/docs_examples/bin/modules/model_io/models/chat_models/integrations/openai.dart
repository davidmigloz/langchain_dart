// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _chatOpenAI();
  await _chatOpenAIStreaming();
  await _chatOpenAIStreamingTools();
  await _chatOpenAIJsonMode();
}

Future<void> _chatOpenAI() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that translates {input_language} to {output_language}.',
    ),
    (ChatMessageType.human, '{text}'),
  ]);

  final chatModel = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(temperature: 0),
  );

  final chain = promptTemplate | chatModel | const StringOutputParser();

  final res = await chain.invoke({
    'input_language': 'English',
    'output_language': 'French',
    'text': 'I love programming.',
  });
  print(res);
  // -> 'J'adore la programmation.'
}

Future<void> _chatOpenAIStreaming() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that replies only with numbers '
          'in order without any spaces or commas',
    ),
    (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
  ]);

  final chat = ChatOpenAI(apiKey: openaiApiKey);

  final chain = promptTemplate.pipe(chat).pipe(const StringOutputParser());

  final stream = chain.stream({'max_num': '9'});
  await stream.forEach(print);
  // 123
  // 456
  // 789
}

Future<void> _chatOpenAIStreamingTools() async {
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
  final chat = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: ChatOpenAIOptions(
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

Future<void> _chatOpenAIJsonMode() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final prompt = PromptValue.chat([
    ChatMessage.system(
      "Extract the 'name' and 'origin' of any companies mentioned in the "
      'following statement. Return a JSON list.',
    ),
    ChatMessage.humanText(
      'Google was founded in the USA, while Deepmind was founded in the UK',
    ),
  ]);
  final llm = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(
      model: 'gpt-4-turbo',
      temperature: 0,
      responseFormat: ChatOpenAIResponseFormat.jsonObject,
    ),
  );
  final chain = llm.pipe(JsonOutputParser());
  final res = await chain.invoke(prompt);
  print(res);
  // {
  //   "companies": [
  //     {
  //       "name": "Google",
  //       "origin": "USA"
  //     },
  //     {
  //       "name": "Deepmind",
  //       "origin": "UK"
  //     }
  //   ]
  // }
}
