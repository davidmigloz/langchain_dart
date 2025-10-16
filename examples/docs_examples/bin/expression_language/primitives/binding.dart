// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _binding();
  await _differentModels();
  await _toolCalling();
}

Future<void> _binding() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);
  const outputParser = StringOutputParser<ChatResult>();

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'Write out the following equation using algebraic symbols then solve it. '
          'Use the format\n\nEQUATION:...\nSOLUTION:...\n\n',
    ),
    (ChatMessageType.human, '{equation_statement}'),
  ]);

  final chain = Runnable.getMapFromInput<String>(
    'equation_statement',
  ).pipe(promptTemplate).pipe(model).pipe(outputParser);

  final res = await chain.invoke('x raised to the third plus seven equals 12');
  print(res);
  // EQUATION: \(x^3 + 7 = 12\)
  //
  // SOLUTION:
  // Subtract 7 from both sides:
  // \(x^3 = 5\)
  //
  // Take the cube root of both sides:
  // \(x = \sqrt[3]{5}\)

  final chain2 = Runnable.getMapFromInput<String>('equation_statement')
      .pipe(promptTemplate)
      .pipe(model.bind(const ChatOpenAIOptions(stop: ['SOLUTION'])))
      .pipe(outputParser);
  final res2 = await chain2.invoke(
    'x raised to the third plus seven equals 12',
  );
  print(res2);
  // EQUATION: \( x^3 + 7 = 12 \)
}

Future<void> _differentModels() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final chatModel = ChatOpenAI(apiKey: openaiApiKey);
  const outputParser = StringOutputParser<ChatResult>();
  final prompt1 = PromptTemplate.fromTemplate('How are you {name}?');
  final prompt2 = PromptTemplate.fromTemplate('How old are you {name}?');
  final chain = Runnable.fromMap({
    'q1':
        prompt1 |
        chatModel.bind(const ChatOpenAIOptions(model: 'gpt-4-turbo')) |
        outputParser,
    'q2':
        prompt2 |
        chatModel.bind(const ChatOpenAIOptions(model: 'gpt-4o-mini')) |
        outputParser,
  });
  final res = await chain.invoke({'name': 'David'});
  print(res);
  // {q1: Hello! I'm just a computer program, so I don't have feelings,
  // q2: I am an AI digital assistant, so I do not have an age like humans do.}
}

Future<void> _toolCalling() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);
  final outputParser = ToolsOutputParser();

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'Write out the following equation using algebraic symbols then solve it.',
    ),
    (ChatMessageType.human, '{equation_statement}'),
  ]);

  const tool = ToolSpec(
    name: 'solver',
    description: 'Formulates and solves an equation',
    inputJsonSchema: {
      'type': 'object',
      'properties': {
        'equation': {
          'type': 'string',
          'description': 'The algebraic expression of the equation',
        },
        'solution': {
          'type': 'string',
          'description': 'The solution to the equation',
        },
      },
      'required': ['equation', 'solution'],
    },
  );

  final chain = Runnable.getMapFromInput<String>('equation_statement')
      .pipe(promptTemplate)
      .pipe(model.bind(const ChatOpenAIOptions(tools: [tool])))
      .pipe(outputParser);

  final res = await chain.invoke('x raised to the third plus seven equals 12');
  print(res);
  // [ParsedToolCall{
  //   id: call_T2Y3g7rU5s0CzEG4nL35FJYK,
  //   name: solver,
  //   arguments: {
  //     equation: x^3 + 7 = 12,
  //     solution: x = 1
  //   },
  // }]
}
