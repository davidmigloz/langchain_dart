// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _promptTemplateLLM();
  await _attachingStopSequences();
  await _attachingFunctionCallInformation();
  await _promptTemplateLLMStringOutputParser();
  await _promptTemplateLLMJsonOutputFunctionsParser();
  await _promptTemplateLLMJsonKeyOutputFunctionsParser();
  await _simplifyingInput();
}

Future<void> _promptTemplateLLM() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {foo}',
  );

  final chain = promptTemplate | model;

  final res = await chain.invoke({'foo': 'bears'});
  print(res);
  // ChatResult{
  //   generations: [
  //     ChatGeneration{
  //       output: AIChatMessage{
  //         content: Why don't bears wear shoes?\n\nBecause they have bear feet!,
  //       },
  //     },
  //   ],
  //   usage: ...,
  //   modelOutput: ...,
  // }
}

Future<void> _attachingStopSequences() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {foo}',
  );

  final chain =
      promptTemplate | model.bind(const ChatOpenAIOptions(stop: ['\n']));

  final res = await chain.invoke({'foo': 'bears'});
  print(res);
  // ChatResult{
  //   generations: [
  //     ChatGeneration{
  //       output: AIChatMessage{
  //         content: Why don't bears wear shoes?,
  //       },
  //     },
  //   ],
  //   usage: ...,
  //   modelOutput: ...,
  // }
}

Future<void> _attachingFunctionCallInformation() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {foo}',
  );

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
          'description': 'The punchline for the joke',
        },
      },
      'required': ['setup', 'punchline'],
    },
  );

  final chain = promptTemplate |
      model.bind(
        ChatOpenAIOptions(
          functions: const [function],
          functionCall: ChatFunctionCall.forced(functionName: function.name),
        ),
      );

  final res = await chain.invoke({'foo': 'bears'});
  print(res);
  // ChatResult{
  //   generations: [
  //     ChatGeneration{
  //       output: AIChatMessage{
  //         content: ,
  //         functionCall: AIChatMessageFunctionCall{
  //           name: joke,
  //           arguments: {
  //             setup: Why don't bears wear shoes?,
  //             punchline: Because they already have bear feet!
  //           },
  //         },
  //       },
  //     },
  //   ],
  //   usage: ...,
  //   modelOutput: ...,
  // }
}

Future<void> _promptTemplateLLMStringOutputParser() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {foo}',
  );

  final chain = promptTemplate | model | const StringOutputParser();

  final res = await chain.invoke({'foo': 'bears'});
  print(res);
  // Why don't bears wear shoes? Because they have bear feet!
}

Future<void> _promptTemplateLLMJsonOutputFunctionsParser() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {foo}',
  );

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
          'description': 'The punchline for the joke',
        },
      },
      'required': ['setup', 'punchline'],
    },
  );

  final chain = promptTemplate |
      model.bind(
        ChatOpenAIOptions(
          functions: const [function],
          functionCall: ChatFunctionCall.forced(functionName: function.name),
        ),
      ) |
      JsonOutputFunctionsParser();

  final res = await chain.invoke({'foo': 'bears'});
  print(res);
  // {
  //   setup: Why don't bears wear shoes?,
  //   punchline: Because they have bear feet!
  // }
}

Future<void> _promptTemplateLLMJsonKeyOutputFunctionsParser() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {foo}',
  );

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
          'description': 'The punchline for the joke',
        },
      },
      'required': ['setup', 'punchline'],
    },
  );

  final chain = promptTemplate |
      model.bind(
        ChatOpenAIOptions(
          functions: const [function],
          functionCall: ChatFunctionCall.forced(functionName: function.name),
        ),
      ) |
      JsonKeyOutputFunctionsParser(keyName: 'setup');

  final res = await chain.invoke({'foo': 'bears'});
  print(res);
  // Why don't bears wear socks?
}

Future<void> _simplifyingInput() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {foo}',
  );

  final chain = Runnable.getMapFromItem('foo') |
      promptTemplate |
      model |
      const StringOutputParser();

  final res = await chain.invoke('bears');
  print(res);
  // Why don't bears wear shoes? Because they have bear feet!
}
