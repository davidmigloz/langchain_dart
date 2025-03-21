// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _invoke();
  await _streaming();
}

Future<void> _invoke() async {
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

Future<void> _streaming() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {topic}',
  );

  final chain = promptTemplate | model | const StringOutputParser();

  final stream = chain.stream({'topic': 'bears'});

  var count = 0;
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
