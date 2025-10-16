// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _promptTemplateLLM();
  await _attachingStopSequences();
  await _attachingToolCallInformation();
  await _promptTemplateLLMStringOutputParser();
  await _promptTemplateLLMToolsOutputParser();
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
  //   id: chatcmpl-9LBNiPXHzWIwc02rR6sS1HTcL9pOk,
  //   output: AIChatMessage{
  //     content: Why don't bears wear shoes?\nBecause they have bear feet!,
  //   },
  //   finishReason: FinishReason.stop,
  //   metadata: {
  //     model: gpt-4o-mini,
  //     created: 1714835666,
  //     system_fingerprint: fp_3b956da36b
  //   },
  //   usage: LanguageModelUsage{
  //     promptTokens: 13,
  //     responseTokens: 13,
  //     totalTokens: 26,
  //   },
  //   streaming: false
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
  //   id: chatcmpl-9LBOohTtdg12zD8zzz2GX1ib24UXO,
  //   output: AIChatMessage{
  //     content: Why don't bears wear shoes? ,
  //   },
  //   finishReason: FinishReason.stop,
  //   metadata: {
  //     model: gpt-4o-mini,
  //     created: 1714835734,
  //     system_fingerprint: fp_a450710239
  //   },
  //   usage: LanguageModelUsage{
  //     promptTokens: 13,
  //     responseTokens: 8,
  //     totalTokens: 21
  //   },
  //   streaming: false
  // }
}

Future<void> _attachingToolCallInformation() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {foo}',
  );

  const tool = ToolSpec(
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

  final chain =
      promptTemplate |
      model.bind(
        ChatOpenAIOptions(
          tools: const [tool],
          toolChoice: ChatToolChoice.forced(name: tool.name),
        ),
      );

  final res = await chain.invoke({'foo': 'bears'});
  print(res);
  // ChatResult{
  //   id: chatcmpl-9LBPyaZcFMgjmOvkD0JJKAyA4Cihb,
  //   output: AIChatMessage{
  //     content: ,
  //     toolCalls: [
  //       AIChatMessageToolCall{
  //         id: call_JIhyfu6jdIXaDHfYzbBwCKdb,
  //         name: joke,
  //         argumentsRaw: {"setup":"Why don't bears like fast food?","punchline":"Because they can't catch it!"},
  //         arguments: {
  //           setup: Why don't bears like fast food?,
  //           punchline: Because they can't catch it!
  //         },
  //       }
  //     ],
  //   },
  //   finishReason: FinishReason.stop,
  //   metadata: {
  //     model: gpt-4o-mini,
  //     created: 1714835806,
  //     system_fingerprint: fp_3b956da36b
  //   },
  //   usage: LanguageModelUsage{
  //     promptTokens: 77,
  //     responseTokens: 24,
  //     totalTokens: 101
  //   },
  //   streaming: false
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

Future<void> _promptTemplateLLMToolsOutputParser() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {foo}',
  );

  const tool = ToolSpec(
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

  final chain =
      promptTemplate |
      model.bind(
        ChatOpenAIOptions(
          tools: const [tool],
          toolChoice: ChatToolChoice.forced(name: tool.name),
        ),
      ) |
      ToolsOutputParser();

  final res = await chain.invoke({'foo': 'bears'});
  print(res);
  // [ParsedToolCall{
  //   id: call_tDYrlcVwk7bCi9oh5IuknwHu,
  //   name: joke,
  //   arguments: {
  //     setup: What do you call a bear with no teeth?,
  //     punchline: A gummy bear!
  //   },
  // }]
}

Future<void> _simplifyingInput() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {foo}',
  );

  final chain =
      Runnable.getMapFromInput('foo') |
      promptTemplate |
      model |
      const StringOutputParser();

  final res = await chain.invoke('bears');
  print(res);
  // Why don't bears wear shoes? Because they have bear feet!
}
