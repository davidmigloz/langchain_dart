// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _invoke();
  await _streaming();
}

Future<void> _invoke() async {
  final openAiApiKey = Platform.environment['OPENAI_API_KEY'];
  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Output a list of the countries {countries} and their '
    'populations in JSON format. Use a dict with an outer key of '
    '"countries" which contains a list of countries. '
    'Each country should have the key "name" and "population"',
  );

  final model = ChatOpenAI(
    apiKey: openAiApiKey,
    defaultOptions: const ChatOpenAIOptions(
      model: 'gpt-4-turbo',
      responseFormat: ChatOpenAIResponseFormat(
        type: ChatOpenAIResponseFormatType.jsonObject,
      ),
    ),
  );
  final parser = JsonOutputParser<ChatResult>();
  final chain = promptTemplate.pipe(model).pipe(parser);

  final res = await chain.invoke({
    'countries': ['France', 'Spain', 'Japan'].join(', '),
  });
  print(res);
  // {countries: [{name: France, population: 67413000}, {name: Spain, population: 47350000}, {name: Japan, population: 125584838}]}
}

Future<void> _streaming() async {
  final openAiApiKey = Platform.environment['OPENAI_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Output a list of the countries {countries} and their '
    'populations in JSON format. Use a dict with an outer key of '
    '"countries" which contains a list of countries. '
    'Each country should have the key "name" and "population"',
  );

  final model = ChatOpenAI(
    apiKey: openAiApiKey,
    defaultOptions: const ChatOpenAIOptions(
      model: 'gpt-4-turbo',
      responseFormat: ChatOpenAIResponseFormat(
        type: ChatOpenAIResponseFormatType.jsonObject,
      ),
    ),
  );

  final noJsonParser =
      promptTemplate.pipe(model).pipe(const StringOutputParser());
  final stream1 = noJsonParser.stream({
    'countries': ['France', 'Spain', 'Japan'].join(', '),
  });
  await stream1.forEach((final chunk) => print('$chunk|'));
  // |
  // {
  // |
  // |
  // "|
  // countries|
  // ":|
  // [
  // |
  // |
  // {
  // |
  // |
  // "|
  // name|
  // ":|
  // "|
  // France|
  // ...

  final withJsonParser = promptTemplate.pipe(model).pipe(JsonOutputParser());
  final stream2 = withJsonParser.stream({
    'countries': ['France', 'Spain', 'Japan'].join(', '),
  });
  await stream2.forEach((final chunk) => print('$chunk|'));
  // {}|
  // {countries: []}|
  // {countries: [{name: France}]}|
  // {countries: [{name: France, population: 67390000}, {}]}|
  // {countries: [{name: France, population: 67390000}, {name: Spain}]}|
  // {countries: [{name: France, population: 67390000}, {name: Spain, population: 47350000}]}|
  // {countries: [{name: France, population: 67390000}, {name: Spain, population: 47350000}, {name: Japan}]}|
  // {countries: [{name: France, population: 67390000}, {name: Spain, population: 47350000}, {name: Japan, population: 125360000}]}|
}
