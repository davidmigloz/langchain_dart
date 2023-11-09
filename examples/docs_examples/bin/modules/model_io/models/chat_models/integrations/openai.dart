// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _chatOpenAI();
  await _chatOpenAIStreaming();
  await _chatOpenAIStreamingFunctions();
  await _chatOpenAIJsonMode();
}

Future<void> _chatOpenAI() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final chatModel = ChatOpenAI(apiKey: openaiApiKey, temperature: 0);

  const template =
      'You are a helpful assistant that translates {input_language} to {output_language}.';
  final systemMessagePrompt =
      SystemChatMessagePromptTemplate.fromTemplate(template);
  const humanTemplate = '{text}';
  final humanMessagePrompt =
      HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);
  final chatPrompt = ChatPromptTemplate.fromPromptMessages(
    [systemMessagePrompt, humanMessagePrompt],
  );

  final chain = chatPrompt | chatModel | const StringOutputParser();

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

  final promptTemplate = ChatPromptTemplate.fromPromptMessages([
    SystemChatMessagePromptTemplate.fromTemplate(
      'You are a helpful assistant that replies only with numbers '
      'in order without any spaces or commas',
    ),
    HumanChatMessagePromptTemplate.fromTemplate(
      'List the numbers from 1 to {max_num}',
    ),
  ]);
  final chat = ChatOpenAI(apiKey: openaiApiKey);
  const stringOutputParser = StringOutputParser<ChatMessage>();

  final chain = promptTemplate.pipe(chat).pipe(stringOutputParser);

  final stream = chain.stream({'max_num': '9'});
  await stream.forEach(print);
  // 123
  // 456
  // 789
}

Future<void> _chatOpenAIStreamingFunctions() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  const function = ChatFunction(
    name: 'joke',
    description: 'A joke',
    parameters: {
      'type': 'object',
      'properties': {
        'setup': {
          'type': 'string',
          'description': 'The setup for the joke',
        },
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
  final chat = ChatOpenAI(apiKey: openaiApiKey, temperature: 0).bind(
    ChatOpenAIOptions(
      functions: const [function],
      functionCall: ChatFunctionCall.forced(functionName: 'joke'),
    ),
  );
  final jsonOutputParser = JsonOutputFunctionsParser();

  final chain = promptTemplate.pipe(chat).pipe(jsonOutputParser);

  final stream = chain.stream({'foo': 'bears'});
  await stream.forEach(print);
  // {}
  // {setup: }
  // {setup: Why}
  // {setup: Why don}
  // {setup: Why don't}
  // {setup: Why don't bears}
  // {setup: Why don't bears like}
  // {setup: Why don't bears like fast}
  // {setup: Why don't bears like fast food}
  // {setup: Why don't bears like fast food?, punchline: }
  // {setup: Why don't bears like fast food?, punchline: Because}
  // {setup: Why don't bears like fast food?, punchline: Because they}
  // {setup: Why don't bears like fast food?, punchline: Because they can}
  // {setup: Why don't bears like fast food?, punchline: Because they can't}
  // {setup: Why don't bears like fast food?, punchline: Because they can't catch}
  // {setup: Why don't bears like fast food?, punchline: Because they can't catch it}
  // {setup: Why don't bears like fast food?, punchline: Because they can't catch it!}
}

Future<void> _chatOpenAIJsonMode() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final prompt = PromptValue.chat([
    ChatMessage.system(
      "Extract the 'name' and 'origin' of any companies mentioned in the "
      'following statement. Return a JSON list.',
    ),
    ChatMessage.human(
      'Google was founded in the USA, while Deepmind was founded in the UK',
    ),
  ]);
  final llm = ChatOpenAI(
    apiKey: openaiApiKey,
    model: 'gpt-4-1106-preview',
    temperature: 0,
    responseFormat: const ChatOpenAIResponseFormat(
      type: ChatOpenAIResponseFormatType.jsonObject,
    ),
  );
  final res = await llm.invoke(prompt);
  final outputMsg = res.firstOutputAsString;
  print(outputMsg);
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
