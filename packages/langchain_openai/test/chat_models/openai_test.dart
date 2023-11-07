@TestOn('vm')
library; // Uses dart:io

import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:test/test.dart';

void main() {
  group('ChatOpenAI tests', () {
    final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

    test('Test ChatOpenAI parameters', () async {
      final chat = ChatOpenAI(
        apiKey: openaiApiKey,
        model: 'foo',
        temperature: 0.1,
        topP: 0.1,
        n: 10,
        maxTokens: 10,
        presencePenalty: 0.1,
        frequencyPenalty: 0.1,
        logitBias: {'foo': 1},
        user: 'foo',
      );
      expect(chat.model, 'foo');
      expect(chat.maxTokens, 10);
      expect(chat.temperature, 0.1);
      expect(chat.topP, 0.1);
      expect(chat.n, 10);
      expect(chat.presencePenalty, 0.1);
      expect(chat.frequencyPenalty, 0.1);
      expect(chat.logitBias, {'foo': 1.0});
      expect(chat.user, 'foo');
    });

    test('Test call to ChatOpenAI', () async {
      final chat = ChatOpenAI(apiKey: openaiApiKey, maxTokens: 10);
      final res = await chat([ChatMessage.human('Hello')]);
      expect(res.content, isNotEmpty);
    });

    test('Test generate to ChatOpenAI', () async {
      final chat = ChatOpenAI(apiKey: openaiApiKey);
      final res = await chat.generate(
        [
          ChatMessage.human('Hello, how are you?'),
          ChatMessage.ai('I am fine, thank you.'),
          ChatMessage.human('Good, what is your name?'),
        ],
      );
      expect(res.generations.first.output.content, isNotEmpty);
    });

    test('Test model output contains metadata', () async {
      final chat = ChatOpenAI(apiKey: openaiApiKey, maxTokens: 10);
      final res = await chat.generate(
        [ChatMessage.human('Hello, how are you?')],
      );
      expect(res.modelOutput, isNotNull);
      expect(res.modelOutput!['created'], isNotNull);
      expect(res.modelOutput!['model'], startsWith(chat.model));
    });

    test('Test stop logic on valid configuration', () async {
      final query = ChatMessage.human('write an ordered list of five items');
      final chat = ChatOpenAI(apiKey: openaiApiKey, temperature: 0);
      final res = await chat(
        [query],
        options: const ChatOpenAIOptions(stop: ['3']),
      );
      expect(res.content.contains('2.'), isTrue);
      expect(res.content.contains('3.'), isFalse);
    });

    test('Test ChatOpenAI wrapper with system message', () async {
      final chat = ChatOpenAI(apiKey: openaiApiKey, maxTokens: 10);
      final systemMessage =
          ChatMessage.system('You are to chat with the user.');
      final humanMessage =
          ChatMessage.human('write an ordered list of five items');
      final res = await chat([systemMessage, humanMessage]);
      expect(res.content, isNotEmpty);
    });

    test('Test ChatOpenAI wrapper with multiple completions', () async {
      final chat = ChatOpenAI(apiKey: openaiApiKey, maxTokens: 10, n: 5);
      final humanMessage = ChatMessage.human('Hello');
      final res = await chat.generate([humanMessage]);
      expect(res.generations.length, 5);
      for (final generation in res.generations) {
        expect(generation.output.content, isNotEmpty);
      }
    });

    test('Test ChatOpenAI functions',
        timeout: const Timeout(Duration(minutes: 1)), () async {
      final chat = ChatOpenAI(apiKey: openaiApiKey);

      const function = ChatFunction(
        name: 'get_current_weather',
        description: 'Get the current weather in a given location',
        parameters: {
          'type': 'object',
          'properties': {
            'location': {
              'type': 'string',
              'description': 'The city and state, e.g. San Francisco, CA',
            },
            'unit': {
              'type': 'string',
              'description': 'The unit of temperature to return',
              'enum': ['celsius', 'fahrenheit'],
            },
          },
          'required': ['location'],
        },
      );

      final humanMessage = ChatMessage.human(
        'What’s the weather like in Boston right now?',
      );
      final res1 = await chat.generate(
        [humanMessage],
        options: const ChatOpenAIOptions(functions: [function]),
      );

      expect(res1.generations.length, 1);
      final generation1 = res1.generations.first;

      expect(generation1.output, isA<AIChatMessage>());
      final aiMessage1 = generation1.output as AIChatMessage;

      expect(aiMessage1.content, isEmpty);
      expect(aiMessage1.functionCall, isNotNull);
      final functionCall = aiMessage1.functionCall!;

      expect(functionCall.name, function.name);
      expect(functionCall.arguments.containsKey('location'), isTrue);
      expect(functionCall.arguments['location'], contains('Boston'));

      final functionResult = {
        'temperature': '22',
        'unit': 'celsius',
        'description': 'Sunny',
      };
      final functionMessage = ChatMessage.function(
        name: function.name,
        content: json.encode(functionResult),
      );

      final res2 = await chat.generate(
        [humanMessage, aiMessage1, functionMessage],
        options: const ChatOpenAIOptions(functions: [function]),
      );

      expect(res2.generations.length, 1);
      final generation2 = res2.generations.first;

      expect(generation2.output, isA<AIChatMessage>());
      final aiMessage2 = generation2.output as AIChatMessage;

      expect(aiMessage2.functionCall, isNull);
      expect(aiMessage2.content, contains('22'));
    });

    test('Test tokenize', () async {
      final chat = ChatOpenAI(apiKey: openaiApiKey);
      const text = 'Hello, how are you?';

      final tokens = await chat.tokenize(PromptValue.string(text));
      expect(tokens, [9906, 11, 1268, 527, 499, 30]);
    });

    test('Test encoding', () async {
      final chat = ChatOpenAI(apiKey: openaiApiKey, encoding: 'p50k_base');
      const text = 'Hello, how are you?';

      final tokens = await chat.tokenize(PromptValue.string(text));
      expect(tokens, [15496, 11, 703, 389, 345, 30]);
    });

    test('Test countTokens string', () async {
      final chat = ChatOpenAI(apiKey: openaiApiKey);
      final prompt = PromptValue.string('Hello, how are you?');

      final numTokens = await chat.countTokens(prompt);
      final generation = await chat.generatePrompt(prompt);
      expect(numTokens, generation.usage!.promptTokens);
    });

    test('Test countTokens messages', () async {
      final models = [
        'gpt-3.5-turbo-0301',
        'gpt-3.5-turbo-0613',
        'gpt-3.5-turbo-16k-0613',
        'gpt-4-0314',
        'gpt-4-0613',
      ];
      for (final model in models) {
        final chat = ChatOpenAI(
          apiKey: openaiApiKey,
          model: model,
          temperature: 0,
          maxTokens: 1,
        );
        final messages = [
          ChatMessage.system(
            'You are a helpful, pattern-following assistant that translates '
            'corporate jargon into plain English.',
          ),
          ChatMessage.human(
            "This late pivot means we don't have time to boil the ocean for the "
            'client deliverable.',
          ),
        ];

        final numTokens = await chat.countTokens(PromptValue.chat(messages));
        final generation = await chat.generate(messages);
        expect(numTokens, generation.usage!.promptTokens);
      }
    });

    test('Test ChatOpenAI streaming', () async {
      final promptTemplate = ChatPromptTemplate.fromPromptMessages([
        SystemChatMessagePromptTemplate.fromTemplate(
          'You are a helpful assistant that replies only with numbers '
          'in order without any spaces or commas',
        ),
        HumanChatMessagePromptTemplate.fromTemplate(
          'List the numbers from 1 to {max_num}',
        ),
      ]);
      final chat = ChatOpenAI(apiKey: openaiApiKey);
      const stringOutputParser = StringOutputParser<ChatMessage>();

      final chain = promptTemplate.pipe(chat).pipe(stringOutputParser);
      final stream = chain.stream({'max_num': '9'});

      String content = '';
      int count = 0;
      await for (final res in stream) {
        content += res;
        count++;
      }
      expect(count, greaterThan(1));
      expect(content, contains('123456789'));
    });

    test('Test ChatOpenAI streaming with functions', () async {
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
      final chat = ChatOpenAI(apiKey: openaiApiKey, temperature: 0).bind(
        ChatOpenAIOptions(
          functions: const [function],
          functionCall: ChatFunctionCall.forced(functionName: 'joke'),
        ),
      );
      final jsonOutputParser = JsonOutputFunctionsParser();

      final chain = promptTemplate.pipe(chat).pipe(jsonOutputParser);

      final stream = chain.stream({'foo': 'bears'});

      Map<String, dynamic> lastResult = {};
      int count = 0;
      await for (final res in stream) {
        lastResult = res;
        count++;
      }

      expect(count, greaterThan(1));
      expect(lastResult['setup'], isNotEmpty);
      expect(lastResult['punchline'], isNotEmpty);
    });

    test('Test response seed', () async {
      final prompt = PromptValue.string('How are you?');
      final llm = ChatOpenAI(
        apiKey: openaiApiKey,
        temperature: 0,
        seed: 9999,
      );

      final res1 = await llm.invoke(prompt);
      expect(res1.generations, hasLength(1));
      final generation1 = res1.generations.first;

      final res2 = await llm.invoke(prompt);
      expect(res2.generations, hasLength(1));
      final generation2 = res2.generations.first;

      expect(
        res1.modelOutput?['system_fingerprint'],
        res2.modelOutput?['system_fingerprint'],
      );
      expect(generation1.output, generation2.output);
    });

    test('Test JSON mode', () async {
      final prompt = PromptValue.chat([
        ChatMessage.system(
          "Extract the 'name' and 'origin' of any companies mentioned in the "
          'following statement. Return a JSON list.',
        ),
        ChatMessage.human(
          'Google was founded in the USA, while Deepmind was founded in the UK',
        ),
      ]);
      final llm = ChatOpenAI(
        apiKey: openaiApiKey,
        model: 'gpt-4-1106-preview',
        temperature: 0,
        seed: 9999,
        responseFormat: const ChatOpenAIResponseFormat(
          type: ChatOpenAIResponseFormatType.jsonObject,
        ),
      );

      final res = await llm.invoke(prompt);
      expect(res.generations, hasLength(1));
      final outputMsg = res.generations.first.output;
      final outputJson = json.decode(outputMsg.content) as Map<String, dynamic>;
      expect(outputJson['companies'], isNotNull);
      final companies = outputJson['companies'] as List<dynamic>;
      expect(companies, hasLength(2));
      final firstCompany = companies.first as Map<String, dynamic>;
      expect(firstCompany['name'], 'Google');
      expect(firstCompany['origin'], 'USA');
      final secondCompany = companies.last as Map<String, dynamic>;
      expect(secondCompany['name'], 'Deepmind');
      expect(secondCompany['origin'], 'UK');
    });
  });
}
