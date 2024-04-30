// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _pipe();
}

Future<void> _pipe() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {topic}',
  );
  final model = ChatOpenAI(apiKey: openaiApiKey);
  const outputParser = StringOutputParser<ChatResult>();

  final chain = promptTemplate.pipe(model).pipe(outputParser);

  final res = await chain.invoke({'topic': 'bears'});
  print(res);
  // Why don't bears wear socks?
  // Because they have bear feet!

  final analysisPrompt = ChatPromptTemplate.fromTemplate(
    'is this a funny joke? {joke}',
  );

  final composedChain = Runnable.fromMap({
    'joke': chain,
  }).pipe(analysisPrompt).pipe(model).pipe(outputParser);
  final res1 = await composedChain.invoke({'topic': 'bears'});
  print(res1);
  // Some people may find this joke funny, especially if they enjoy puns or wordplay...

  final composedChain2 = chain
      .pipe(Runnable.getMapFromInput('joke'))
      .pipe(analysisPrompt)
      .pipe(model)
      .pipe(outputParser);
  final res2 = await composedChain2.invoke({'topic': 'bears'});
  print(res2);

  final composedChain3 = chain
      .pipe(Runnable.mapInput((joke) => <String, dynamic>{'joke': joke}))
      .pipe(analysisPrompt)
      .pipe(model)
      .pipe(outputParser);
  final res3 = await composedChain3.invoke({'topic': 'bears'});
  print(res3);
}
