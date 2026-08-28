@TestOn('vm')
library; // Uses dart:io

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:langchain_cohere/langchain_cohere.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/prompts.dart';
import 'package:test/test.dart';

void main() {
  final apiKey = Platform.environment['COHERE_API_KEY'];

  group('ChatCohere tests', () {
    test('Test ChatCohere parameters', () {
      const options = ChatCohereOptions(
        model: 'foo',
        temperature: 0.1,
        topP: 0.5,
        topK: 10,
        maxTokens: 10,
        stopSequences: ['STOP'],
        seed: 1234,
        frequencyPenalty: 0.1,
        presencePenalty: 0.2,
      );

      expect(options.model, 'foo');
      expect(options.temperature, 0.1);
      expect(options.topP, 0.5);
      expect(options.topK, 10);
      expect(options.maxTokens, 10);
      expect(options.stopSequences, ['STOP']);
      expect(options.seed, 1234);
      expect(options.frequencyPenalty, 0.1);
      expect(options.presencePenalty, 0.2);
    });

    test('Test tokenize', () async {
      final chatModel = ChatCohere();
      const text = 'antidisestablishmentarianism';

      final tokens = await chatModel.tokenize(
        PromptValue.chat([ChatMessage.humanText(text)]),
      );
      expect(tokens, isNotEmpty);
      chatModel.close();
    });
  });

  group(
    'ChatCohere integration tests',
    skip: apiKey == null || apiKey.isEmpty ? 'COHERE_API_KEY is not set' : null,
    () {
      late ChatCohere chatModel;

      setUp(() {
        chatModel = ChatCohere(apiKey: apiKey);
      });

      tearDown(() {
        chatModel.close();
      });

      test('Test call to ChatCohere', () async {
        final output = await chatModel([ChatMessage.humanText('Say foo:')]);
        expect(output, isA<AIChatMessage>());
        expect(output.content, isNotEmpty);
      });

      test('Test invoke to ChatCohere', () async {
        final res = await chatModel.invoke(
          PromptValue.chat([ChatMessage.humanText('Hello, how are you?')]),
        );
        expect(res.output.content, isNotEmpty);
      });

      test('Test model output contains metadata', () async {
        final res = await chatModel.invoke(
          PromptValue.chat([
            ChatMessage.humanText(
              'List the numbers from 1 to 9 in order. '
              'Output ONLY the numbers in one line without any spaces or commas. '
              'NUMBERS:',
            ),
          ]),
        );
        expect(
          res.output.contentAsString.replaceAll(RegExp(r'[\s\n]'), ''),
          contains('123456789'),
        );
        expect(res.id, isNotEmpty);
        expect(res.finishReason, isNot(FinishReason.unspecified));
        expect(res.metadata, isNotNull);
        expect(res.metadata['model'], isNotEmpty);
      });

      test('Test streaming', () async {
        final promptTemplate = PromptTemplate.fromTemplate(
          'List the numbers from 1 to {max_num} in order. '
          'Output ONLY the numbers in one line without any spaces or commas. '
          'NUMBERS:',
        );
        const stringOutputParser = StringOutputParser<ChatResult>();

        final chain = promptTemplate.pipe(chatModel).pipe(stringOutputParser);

        final stream = chain.stream({'max_num': '9'});

        var content = '';
        var count = 0;
        await for (final res in stream) {
          content += res.trim();
          count++;
        }
        expect(count, greaterThan(1));
        expect(content, contains('123456789'));
      });
    },
  );

  group('ChatCohere streaming (mocked)', () {
    // Builds an SSE `data:` line for a Cohere v2 stream event.
    String sse(final Map<String, dynamic> event) =>
        'data: ${jsonEncode(event)}\n\n';

    ChatCohere modelReturning(final String body) => ChatCohere(
      apiKey: 'test-key',
      client: MockClient(
        (final request) async => http.Response(
          body,
          200,
          headers: {'content-type': 'text/event-stream'},
        ),
      ),
    );

    test('merges streamed tool-call deltas into a single tool call', () async {
      final body = [
        sse({'type': 'message-start', 'id': 'msg_1'}),
        sse({
          'type': 'tool-call-start',
          'index': 0,
          'delta': {
            'message': {
              'tool_calls': {
                'id': 'call_1',
                'function': {
                  'name': 'get_weather',
                  'arguments': '{"location":',
                },
              },
            },
          },
        }),
        sse({
          'type': 'tool-call-delta',
          'index': 0,
          'delta': {
            'message': {
              'tool_calls': {
                'function': {'arguments': '"Madrid"}'},
              },
            },
          },
        }),
        sse({
          'type': 'message-end',
          'delta': {'finish_reason': 'TOOL_CALL'},
        }),
      ].join();

      final chatModel = modelReturning(body);
      final chunks = await chatModel
          .stream(PromptValue.string('What is the weather in Madrid?'))
          .toList();
      final merged = chunks.reduce((final a, final b) => a.concat(b));

      final toolCalls = merged.output.toolCalls;
      expect(toolCalls, hasLength(1));
      expect(toolCalls.single.id, 'call_1');
      expect(toolCalls.single.name, 'get_weather');
      expect(toolCalls.single.argumentsRaw, '{"location":"Madrid"}');
      expect(toolCalls.single.arguments, {'location': 'Madrid'});
      expect(merged.finishReason, FinishReason.toolCalls);
      chatModel.close();
    });

    test('merges streamed content deltas into a single text block', () async {
      final body = [
        sse({'type': 'message-start', 'id': 'msg_1'}),
        sse({
          'type': 'content-delta',
          'index': 0,
          'delta': {
            'message': {
              'content': {'text': 'Hello '},
            },
          },
        }),
        sse({
          'type': 'content-delta',
          'index': 0,
          'delta': {
            'message': {
              'content': {'text': 'world!'},
            },
          },
        }),
        sse({
          'type': 'message-end',
          'delta': {'finish_reason': 'COMPLETE'},
        }),
      ].join();

      final chatModel = modelReturning(body);
      final chunks = await chatModel
          .stream(PromptValue.string('Say hello'))
          .toList();
      final merged = chunks.reduce((final a, final b) => a.concat(b));

      expect(
        merged.output.content.whereType<AIChatMessageTextBlock>(),
        hasLength(1),
      );
      expect(merged.output.contentAsString, 'Hello world!');
      expect(merged.finishReason, FinishReason.stop);
      chatModel.close();
    });
  });
}
