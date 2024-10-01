// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _languageModels();
  await _chains();
  await _inputStreams();
  await _inputStreamMapper();
  await _nonStreamingComponents();
}

Future<void> _languageModels() async {
  final openAiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openAiApiKey);

  final stream =
      model.stream(PromptValue.string('Hello! Tell me about yourself.'));
  final chunks = <ChatResult>[];
  await for (final chunk in stream) {
    chunks.add(chunk);
    stdout.write('${chunk.output.content}|');
  }
  // Hello|!| I| am| a| language| model| AI| created| by| Open|AI|,|...

  print(chunks.first);
  // ChatResult{
  //   id: chatcmpl-9IHQvyTl9fyVmF7P6zamGaX1XAN6d,
  //   output: AIChatMessage{
  //     content: Hello,
  //   },
  //   finishReason: FinishReason.unspecified,
  //   metadata: {
  //     model: gpt-3.5-turbo-0125,
  //     created: 1714143945,
  //     system_fingerprint: fp_3b956da36b
  //   },
  //   streaming: true
  // }

  final result = chunks.sublist(0, 6).reduce((prev, next) => prev.concat(next));
  print(result);
  // ChatResult{
  //   id: chatcmpl-9IHQvyTl9fyVmF7P6zamGaX1XAN6d,
  //   output: AIChatMessage{
  //     content: Hello! I am a language model
  //   },
  //   finishReason: FinishReason.unspecified,
  //   metadata: {
  //     model: gpt-3.5-turbo-0125,
  //     created: 1714143945,
  //     system_fingerprint: fp_3b956da36b
  //   },
  //   streaming: true
  // }
}

Future<void> _chains() async {
  final openAiApiKey = Platform.environment['OPENAI_API_KEY'];

  final model = ChatOpenAI(apiKey: openAiApiKey);
  final prompt =
      ChatPromptTemplate.fromTemplate('Tell me a joke about {topic}');
  const parser = StringOutputParser<ChatResult>();

  final chain = prompt.pipe(model).pipe(parser);

  final stream = chain.stream({'topic': 'parrot'});
  await stream.forEach((final chunk) => stdout.write('$chunk|'));
  // |Why| don|'t| you| ever| play| hide| and| seek| with| a| par|rot|?|
  // |Because| they| always| squ|awk| when| they| find| you|!||
}

Future<void> _inputStreams() async {
  final openAiApiKey = Platform.environment['OPENAI_API_KEY'];

  final model = ChatOpenAI(
    apiKey: openAiApiKey,
    defaultOptions: const ChatOpenAIOptions(
      responseFormat: ChatOpenAIResponseFormat(
        type: ChatOpenAIResponseFormatType.jsonObject,
      ),
    ),
  );
  final parser = JsonOutputParser<ChatResult>();

  final chain = model.pipe(parser);

  final stream = chain.stream(
    PromptValue.string(
      'Output a list of the countries france, spain and japan and their '
      'populations in JSON format. Use a dict with an outer key of '
      '"countries" which contains a list of countries. '
      'Each country should have the key "name" and "population"',
    ),
  );
  await stream.forEach((final chunk) => print('$chunk|'));
  // {}|
  // {countries: []}|
  // {countries: [{}]}|
  // {countries: [{name: }]}|
  // {countries: [{name: France}]}|
  // {countries: [{name: France, population: 670}]}|
  // {countries: [{name: France, population: 670760}]}|
  // {countries: [{name: France, population: 67076000}]}|
  // {countries: [{name: France, population: 67076000}, {}]}|
  // {countries: [{name: France, population: 67076000}, {name: }]}|
  // {countries: [{name: France, population: 67076000}, {name: Spain}]}|
  // {countries: [{name: France, population: 67076000}, {name: Spain, population: 467}]}|
  // {countries: [{name: France, population: 67076000}, {name: Spain, population: 467237}]}|
  // {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}]}|
  // {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}, {}]}|
  // {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}, {name: }]}|
  // {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}, {name: Japan}]}|
  // {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}, {name: Japan, population: 126}]}|
  // {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}, {name: Japan, population: 126476}]}|
  // {countries: [{name: France, population: 67076000}, {name: Spain, population: 46723749}, {name: Japan, population: 126476461}]}|
}

Future<void> _inputStreamMapper() async {
  final openAiApiKey = Platform.environment['OPENAI_API_KEY'];

  final model = ChatOpenAI(
    apiKey: openAiApiKey,
    defaultOptions: const ChatOpenAIOptions(
      responseFormat: ChatOpenAIResponseFormat(
        type: ChatOpenAIResponseFormatType.jsonObject,
      ),
    ),
  );
  final parser = JsonOutputParser<ChatResult>();
  final mapper =
      Runnable.mapInputStream((Stream<Map<String, dynamic>> inputStream) {
    return inputStream.map((input) {
      final countries =
          (input['countries'] as List?)?.cast<Map<String, dynamic>>() ?? [];
      final countryNames = countries
          .map((country) => country['name'] as String?)
          .where((c) => c != null && c.isNotEmpty);
      return countryNames.join(', ');
    }).distinct();
  });

  final chain = model.pipe(parser).pipe(mapper);

  final stream = chain.stream(
    PromptValue.string(
      'Output a list of the countries france, spain and japan and their '
      'populations in JSON format. Use a dict with an outer key of '
      '"countries" which contains a list of countries. '
      'Each country should have the key "name" and "population"',
    ),
  );
  await stream.forEach(print);
  // France
  // France, Spain
  // France, Spain, Japan
}

Future<void> _nonStreamingComponents() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final vectorStore = MemoryVectorStore(
    embeddings: OpenAIEmbeddings(apiKey: openaiApiKey),
  );
  await vectorStore.addDocuments(
    documents: const [
      Document(pageContent: 'LangChain was created by Harrison'),
      Document(
        pageContent: 'David ported LangChain to Dart in LangChain.dart',
      ),
    ],
  );
  final retriever = vectorStore.asRetriever();

  await retriever.stream('Who created LangChain.dart?').forEach(print);
  // [Document{pageContent: David ported LangChain to Dart in LangChain.dart},
  // Document{pageContent: LangChain was created by Harrison}]

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'Answer the question based on only the following context:\n{context}',
    ),
    (ChatMessageType.human, '{question}'),
  ]);
  final model = ChatOpenAI(apiKey: openaiApiKey);
  const outputParser = StringOutputParser<ChatResult>();

  final retrievalChain = Runnable.fromMap<String>({
    'context': retriever,
    'question': Runnable.passthrough(),
  }).pipe(promptTemplate).pipe(model).pipe(outputParser);

  await retrievalChain
      .stream('Who created LangChain.dart?')
      .forEach((chunk) => stdout.write('$chunk|'));
  // |David| created| Lang|Chain|.dart|.||
}
