// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _outputFunctionsParser();
  await _jsonOutputFunctionsParser();
  await _jsonOutputFunctionsParserStreaming();
  await _jsonKeyOutputFunctionsParser();
  await _jsonKeyOutputFunctionsParserStreaming();
}

Future<void> _outputFunctionsParser() async {
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
  final chat = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(
      temperature: 0,
    ),
  ).bind(
    ChatOpenAIOptions(
      functions: const [function],
      functionCall: ChatFunctionCall.forced(functionName: 'joke'),
    ),
  );
  final outputParser = OutputFunctionsParser();
  final chain = promptTemplate.pipe(chat).pipe(outputParser);
  final res = await chain.invoke({'foo': 'bears'});
  print(res);
  // '{"setup": "Why don't bears like fast food?", "punchline": "Because they can't catch it!"}'
}

Future<void> _jsonOutputFunctionsParser() async {
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
  final chat = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(
      temperature: 0,
    ),
  ).bind(
    ChatOpenAIOptions(
      functions: const [function],
      functionCall: ChatFunctionCall.forced(functionName: 'joke'),
    ),
  );
  final outputParser = JsonOutputFunctionsParser();
  final chain = promptTemplate.pipe(chat).pipe(outputParser);
  final res = await chain.invoke({'foo': 'bears'});
  print(res);
  // {setup: Why don't bears like fast food?, punchline: Because they can't catch it!}
}

Future<void> _jsonOutputFunctionsParserStreaming() async {
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
  final chat = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(
      temperature: 0,
    ),
  ).bind(
    ChatOpenAIOptions(
      functions: const [function],
      functionCall: ChatFunctionCall.forced(functionName: 'joke'),
    ),
  );
  final outputParser = JsonOutputFunctionsParser();

  final chain = promptTemplate.pipe(chat).pipe(outputParser);

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

Future<void> _jsonKeyOutputFunctionsParser() async {
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
  final chat = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(
      temperature: 0,
    ),
  ).bind(
    ChatOpenAIOptions(
      functions: const [function],
      functionCall: ChatFunctionCall.forced(functionName: 'joke'),
    ),
  );
  final outputParser = JsonKeyOutputFunctionsParser(keyName: 'setup');
  final chain = promptTemplate.pipe(chat).pipe(outputParser);
  final res = await chain.invoke({'foo': 'bears'});
  print(res);
  // Why don't bears like fast food?
}

Future<void> _jsonKeyOutputFunctionsParserStreaming() async {
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
  final chat = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(
      temperature: 0,
    ),
  ).bind(
    ChatOpenAIOptions(
      functions: const [function],
      functionCall: ChatFunctionCall.forced(functionName: 'joke'),
    ),
  );
  final outputParser = JsonKeyOutputFunctionsParser(keyName: 'setup');

  final chain = promptTemplate.pipe(chat).pipe(outputParser);

  final stream = chain.stream({'foo': 'bears'});
  await stream.forEach(print);
  //
  // Why
  // Why don
  // Why don't
  // Why don't bears
  // Why don't bears like
  // Why don't bears like fast
  // Why don't bears like fast food
  // Why don't bears like fast food?
}
