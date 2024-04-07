// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_chroma/langchain_chroma.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  // Runnable interface
  await _runnableInterfaceInvoke();
  await _runnableInterfaceStream();
  await _runnableInterfaceBatch();
  await _runnableInterfaceBatchOptions();

  // Runnable types
  await _runnableTypesRunnableSequence();
  await _runnableTypesRunnableMap();
  await _runnableTypesRunnableBinding();
  await _runnableTypesRunnableFunction();
  await _runnableTypesRunnablePassthrough();
  await _runnableTypesRunnableItemFromMap();
  await _runnableTypesRunnableMapFromInput();
  await _runnableTypesRunnableMapInput();
}

Future<void> _runnableInterfaceInvoke() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {topic}',
  );

  final chain = promptTemplate | model | const StringOutputParser();

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

  final chain = promptTemplate | model | const StringOutputParser();

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

Future<void> _runnableTypesRunnableSequence() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {topic}',
  );

  // The following three chains are equivalent:
  final chain1 = promptTemplate | model | const StringOutputParser();
  // final chain2 = promptTemplate.pipe(model).pipe(const StringOutputParser());
  // final chain3 = Runnable.fromList(
  //   [promptTemplate, model, StringOutputParser()],
  // );

  final res = await chain1.invoke({'topic': 'bears'});
  print(res);
  // Why don't bears wear shoes?\n\nBecause they have bear feet!
}

Future<void> _runnableTypesRunnableMap() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate1 = ChatPromptTemplate.fromTemplate(
    'What is the city {person} is from?',
  );
  final promptTemplate2 = ChatPromptTemplate.fromTemplate(
    'How old is {person}?',
  );
  final promptTemplate3 = ChatPromptTemplate.fromTemplate(
    'Is {city} a good city for a {age} years old person?',
  );
  const stringOutputParser = StringOutputParser<ChatResult>();

  final chain = Runnable.fromMap({
        'city': promptTemplate1 | model | stringOutputParser,
        'age': promptTemplate2 | model | stringOutputParser,
      }) |
      promptTemplate3 |
      model |
      stringOutputParser;

  final res = await chain.invoke({'person': 'Elon Musk'});
  print(res);
  // It is subjective to determine whether Pretoria, South Africa, is a good
  // city for a 50-year-old person as it depends on individual preferences and
  // needs.
}

Future<void> _runnableTypesRunnableBinding() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {foo}',
  );

  final chain = promptTemplate |
      model.bind(const ChatOpenAIOptions(stop: ['\n'])) |
      const StringOutputParser();

  final res = await chain.invoke({'foo': 'bears'});
  print(res);
  // Why don't bears wear shoes?
}

Future<void> _runnableTypesRunnableFunction() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'How much is {a} + {b}?',
  );

  final chain = Runnable.fromMap({
        'a': Runnable.fromFunction((
          final Map<String, String> input,
          final options,
        ) async {
          final foo = input['foo'] ?? '';
          return '${foo.length}';
        }),
        'b': Runnable.fromFunction((
          final Map<String, String> input,
          final options,
        ) async {
          final foo = input['foo'] ?? '';
          final bar = input['bar'] ?? '';
          return '${bar.length * foo.length}';
        }),
      }) |
      promptTemplate |
      model |
      const StringOutputParser();

  final res = await chain.invoke({'foo': 'foo', 'bar': 'bar'});
  print(res);
  // 3 + 9 = 12
}

Future<void> _runnableTypesRunnablePassthrough() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {foo}',
  );

  final map = Runnable.fromMap({
    'foo': Runnable.passthrough(),
  });
  final chain = map | promptTemplate | model | const StringOutputParser();

  final res = await chain.invoke('bears');
  print(res);
  // Why don't bears wear shoes? Because they have bear feet!
}

Future<void> _runnableTypesRunnableItemFromMap() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);
  final vectorStore = Chroma(embeddings: embeddings);
  await vectorStore.addDocuments(
    documents: const [
      Document(pageContent: 'Payment methods: iDEAL, PayPal and credit card'),
      Document(pageContent: 'Free shipping: on orders over 30€'),
    ],
  );

  final model = ChatOpenAI(apiKey: openaiApiKey);
  final retriever = vectorStore.asRetriever();

  final promptTemplate = ChatPromptTemplate.fromTemplate('''
Answer the question based only on the following context:
{context}

Question: {question}

Answer in the following language: {language}''');

  final chain = Runnable.fromMap({
        'context': Runnable.getItemFromMap('question') |
            (retriever |
                Runnable.fromFunction(
                  (final docs, final _) => docs.join('\n'),
                )),
        'question': Runnable.getItemFromMap('question'),
        'language': Runnable.getItemFromMap('language'),
      }) |
      promptTemplate |
      model |
      const StringOutputParser();

  final res = await chain.invoke({
    'question': 'What payment methods do you accept?',
    'language': 'es_ES',
  });
  print(res);
  // Aceptamos los siguientes métodos de pago: iDEAL, PayPal y tarjeta de
  // crédito.
}

Future<void> _runnableTypesRunnableMapFromInput() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final model = ChatOpenAI(apiKey: openaiApiKey);

  final promptTemplate = ChatPromptTemplate.fromTemplate(
    'Tell me a joke about {foo}',
  );

  final chain = Runnable.getMapFromInput('foo') |
      promptTemplate |
      model |
      const StringOutputParser();

  final res = await chain.invoke('bears');
  print(res);
  // Why don't bears wear shoes? Because they have bear feet!
}

Future<void> _runnableTypesRunnableMapInput() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final prompt = ChatPromptTemplate.fromPromptMessages([
    SystemChatMessagePromptTemplate.fromTemplate(
      'You are a helpful assistant',
    ),
    HumanChatMessagePromptTemplate.fromTemplate('{input}'),
    const MessagesPlaceholder(variableName: 'agent_scratchpad'),
  ]);

  final tool = CalculatorTool();

  final model = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(temperature: 0),
  ).bind(ChatOpenAIOptions(functions: [tool.toChatFunction()]));

  const outputParser = OpenAIFunctionsAgentOutputParser();

  List<ChatMessage> buildScratchpad(final List<AgentStep> intermediateSteps) {
    return intermediateSteps
        .map((final s) {
          return s.action.messageLog +
              [
                ChatMessage.function(
                  name: s.action.tool,
                  content: s.observation,
                ),
              ];
        })
        .expand((final m) => m)
        .toList(growable: false);
  }

  final agent = Agent.fromRunnable(
    Runnable.mapInput(
      (final AgentPlanInput planInput) => <String, dynamic>{
        'input': planInput.inputs['input'],
        'agent_scratchpad': buildScratchpad(planInput.intermediateSteps),
      },
    ).pipe(prompt).pipe(model).pipe(outputParser),
    tools: [tool],
  );
  final executor = AgentExecutor(agent: agent);

  final res = await executor.invoke({
    'input': 'What is 40 raised to the 0.43 power?',
  });
  print(res['output']);
}
