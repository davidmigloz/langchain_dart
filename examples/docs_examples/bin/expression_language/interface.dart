// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _runnableInterfaceInvoke();
  await _runnableInterfaceStream();
  await _runnableInterfaceBatch();
  await _runnableInterfaceBatchOptions();
}

Future<void> _runnableInterfaceInvoke() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {topic}',
  );

  final chain = promptTemplate.pipe(model).pipe(const StringOutputParser());

  final res = await chain.invoke({'topic': 'bears'});
  print(res);
  // Why don't bears wear shoes? Because they have bear feet!
}

Future<void> _runnableInterfaceStream() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {topic}',
  );

  final chain = promptTemplate.pipe(model).pipe(const StringOutputParser());

  final stream = chain.stream({'topic': 'bears'});

  int count = 0;
  await for (final res in stream) {
    print('$count: $res');
    count++;
  }
  // 0:
  // 1: Why
  // 2:  don
  // 3: 't
  // 4:  bears
  // 5:  like
  // 6:  fast
  // 7:  food
  // 8: ?
  // 9: Because
  // 10:  they
  // 11:  can
  // 12: 't
  // 13:  catch
  // 14:  it
  // 15: !
}

Future<void> _runnableInterfaceBatch() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {topic}',
  );

  final chain = promptTemplate.pipe(model).pipe(const StringOutputParser());

  final res = await chain.batch([
    {'topic': 'bears'},
    {'topic': 'cats'},
  ]);
  print(res);
  //['Why did the bear break up with his girlfriend? Because she was too "grizzly" for him!',
  // 'Why was the cat sitting on the computer? Because it wanted to keep an eye on the mouse!']
}

Future<void> _runnableInterfaceBatchOptions() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {topic}',
  );

  final chain = promptTemplate.pipe(model).pipe(const StringOutputParser());

  final res = await chain.batch(
    [
      {'topic': 'bears'},
      {'topic': 'cats'},
    ],
    options: [
      const ChatOpenAIOptions(model: 'gpt-3.5-turbo', temperature: 0.5),
      const ChatOpenAIOptions(model: 'gpt-4', temperature: 0.7),
    ],
  );
  print(res);
  //['Why did the bear break up with his girlfriend? Because he couldn't bear the relationship anymore!,',
  // 'Why don't cats play poker in the jungle? Because there's too many cheetahs!']
}
