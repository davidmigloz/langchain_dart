import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:langchain_cohere/src/client/client.dart';
import 'package:test/test.dart';

void main() {
  group('CohereChatRequest serialization', () {
    test('Serializes all supported parameters', () {
      const request = CohereChatRequest(
        model: 'command-r-plus-08-2024',
        messages: [
          CohereMessage.system('You are a helpful assistant'),
          CohereMessage.user('Hello!'),
        ],
        tools: [
          CohereTool(
            name: 'get_weather',
            description: 'Get the weather',
            parameters: {
              'type': 'object',
              'properties': {
                'location': {'type': 'string'},
              },
              'required': ['location'],
            },
          ),
        ],
        toolChoice: 'REQUIRED',
        temperature: 0.3,
        p: 0.75,
        k: 10,
        maxTokens: 256,
        stopSequences: ['STOP'],
        seed: 1234,
        frequencyPenalty: 0.1,
        presencePenalty: 0.2,
      );

      expect(request.toJson(), {
        'model': 'command-r-plus-08-2024',
        'messages': [
          {'role': 'system', 'content': 'You are a helpful assistant'},
          {'role': 'user', 'content': 'Hello!'},
        ],
        'tools': [
          {
            'type': 'function',
            'function': {
              'name': 'get_weather',
              'description': 'Get the weather',
              'parameters': {
                'type': 'object',
                'properties': {
                  'location': {'type': 'string'},
                },
                'required': ['location'],
              },
            },
          },
        ],
        'tool_choice': 'REQUIRED',
        'temperature': 0.3,
        'p': 0.75,
        'k': 10,
        'max_tokens': 256,
        'stop_sequences': ['STOP'],
        'seed': 1234,
        'frequency_penalty': 0.1,
        'presence_penalty': 0.2,
        'stream': false,
      });
    });

    test('Omits null parameters', () {
      const request = CohereChatRequest(
        model: 'command-r-plus-08-2024',
        messages: [CohereMessage.user('Hello!')],
        stream: true,
      );

      expect(request.toJson(), {
        'model': 'command-r-plus-08-2024',
        'messages': [
          {'role': 'user', 'content': 'Hello!'},
        ],
        'stream': true,
      });
    });

    test('Serializes assistant and tool messages', () {
      const assistantMessage = CohereMessage.assistant(
        null,
        toolCalls: [
          CohereToolCall(
            id: 'call_1',
            function: CohereFunctionCall(
              name: 'get_weather',
              arguments: '{"location":"Madrid"}',
            ),
          ),
        ],
      );
      const toolMessage = CohereMessage.tool(
        toolCallId: 'call_1',
        content: '{"temperature":22}',
      );

      expect(assistantMessage.toJson(), {
        'role': 'assistant',
        'tool_calls': [
          {
            'id': 'call_1',
            'type': 'function',
            'function': {
              'name': 'get_weather',
              'arguments': '{"location":"Madrid"}',
            },
          },
        ],
      });
      expect(toolMessage.toJson(), {
        'role': 'tool',
        'tool_call_id': 'call_1',
        'content': '{"temperature":22}',
      });
    });
  });

  group('CohereChatResponse parsing', () {
    test('Parses a text response', () {
      final response = CohereChatResponse.fromJson(const {
        'id': 'res_1',
        'finish_reason': 'COMPLETE',
        'message': {
          'role': 'assistant',
          'content': [
            {'type': 'text', 'text': 'Hello '},
            {'type': 'text', 'text': 'world!'},
          ],
        },
        'usage': {
          'billed_units': {'input_tokens': 5, 'output_tokens': 10},
          'tokens': {'input_tokens': 7, 'output_tokens': 12},
        },
      });

      expect(response.id, 'res_1');
      expect(response.finishReason, 'COMPLETE');
      expect(response.text, 'Hello world!');
      expect(response.toolCalls, isEmpty);
      expect(response.usage?.inputTokens, 7);
      expect(response.usage?.outputTokens, 12);
    });

    test('Parses a tool call response', () {
      final response = CohereChatResponse.fromJson(const {
        'id': 'res_2',
        'finish_reason': 'TOOL_CALL',
        'message': {
          'role': 'assistant',
          'tool_plan': 'I will check the weather.',
          'tool_calls': [
            {
              'id': 'call_1',
              'type': 'function',
              'function': {
                'name': 'get_weather',
                'arguments': '{"location":"Madrid"}',
              },
            },
          ],
        },
      });

      expect(response.finishReason, 'TOOL_CALL');
      expect(response.text, isNull);
      expect(response.toolPlan, 'I will check the weather.');
      expect(response.toolCalls, hasLength(1));
      expect(response.toolCalls.first.id, 'call_1');
      expect(response.toolCalls.first.function.name, 'get_weather');
      expect(
        response.toolCalls.first.function.arguments,
        '{"location":"Madrid"}',
      );
    });

    test('Falls back to billed_units when tokens is absent', () {
      final response = CohereChatResponse.fromJson(const {
        'id': 'res_3',
        'usage': {
          'billed_units': {'input_tokens': 5, 'output_tokens': 10},
        },
      });

      expect(response.usage?.inputTokens, 5);
      expect(response.usage?.outputTokens, 10);
    });
  });

  group('CohereChatStreamEvent parsing', () {
    test('Parses a message-start event', () {
      final event = CohereChatStreamEvent.fromJson(const {
        'type': 'message-start',
        'id': 'msg_1',
        'delta': {
          'message': {'role': 'assistant', 'content': <dynamic>[]},
        },
      });

      expect(event.type, 'message-start');
      expect(event.id, 'msg_1');
    });

    test('Parses a content-delta event', () {
      final event = CohereChatStreamEvent.fromJson(const {
        'type': 'content-delta',
        'index': 0,
        'delta': {
          'message': {
            'content': {'text': 'Hello'},
          },
        },
      });

      expect(event.type, 'content-delta');
      expect(event.textDelta, 'Hello');
    });

    test('Parses tool-call-start and tool-call-delta events', () {
      final start = CohereChatStreamEvent.fromJson(const {
        'type': 'tool-call-start',
        'index': 0,
        'delta': {
          'message': {
            'tool_calls': {
              'id': 'call_1',
              'type': 'function',
              'function': {'name': 'get_weather', 'arguments': ''},
            },
          },
        },
      });
      final delta = CohereChatStreamEvent.fromJson(const {
        'type': 'tool-call-delta',
        'index': 0,
        'delta': {
          'message': {
            'tool_calls': {
              'function': {'arguments': '{"location":'},
            },
          },
        },
      });

      expect(start.type, 'tool-call-start');
      expect(start.toolCallId, 'call_1');
      expect(start.toolCallName, 'get_weather');
      expect(delta.type, 'tool-call-delta');
      expect(delta.toolCallId, isNull);
      expect(delta.toolCallArgumentsDelta, '{"location":');
    });

    test('Parses a message-end event', () {
      final event = CohereChatStreamEvent.fromJson(const {
        'type': 'message-end',
        'delta': {
          'finish_reason': 'COMPLETE',
          'usage': {
            'tokens': {'input_tokens': 7, 'output_tokens': 12},
          },
        },
      });

      expect(event.type, 'message-end');
      expect(event.finishReason, 'COMPLETE');
      expect(event.usage?.inputTokens, 7);
      expect(event.usage?.outputTokens, 12);
    });
  });

  group('Server-sent events parsing', () {
    test('Extracts the payload of data lines', () {
      expect(
        CohereClient.parseSseDataLine('data: {"type":"content-delta"}'),
        '{"type":"content-delta"}',
      );
      expect(
        CohereClient.parseSseDataLine('{"type":"content-delta"}'),
        '{"type":"content-delta"}',
      );
    });

    test('Ignores lines that carry no payload', () {
      expect(CohereClient.parseSseDataLine(''), isNull);
      expect(CohereClient.parseSseDataLine('   '), isNull);
      expect(CohereClient.parseSseDataLine('data:'), isNull);
      expect(CohereClient.parseSseDataLine('data: [DONE]'), isNull);
      expect(CohereClient.parseSseDataLine('event: content-delta'), isNull);
      expect(CohereClient.parseSseDataLine(': comment'), isNull);
    });
  });

  group('CohereEmbedRequest serialization', () {
    test('Serializes all supported parameters', () {
      const request = CohereEmbedRequest(
        model: 'embed-v4.0',
        texts: ['Hello world'],
        inputType: CohereEmbeddingInputType.searchDocument,
        outputDimension: 512,
        truncate: 'END',
      );

      expect(request.toJson(), {
        'model': 'embed-v4.0',
        'texts': ['Hello world'],
        'input_type': 'search_document',
        'embedding_types': ['float'],
        'output_dimension': 512,
        'truncate': 'END',
      });
    });

    test('Omits null parameters', () {
      const request = CohereEmbedRequest(
        model: 'embed-english-v3.0',
        texts: ['Hello world'],
        inputType: CohereEmbeddingInputType.searchQuery,
      );

      expect(request.toJson(), {
        'model': 'embed-english-v3.0',
        'texts': ['Hello world'],
        'input_type': 'search_query',
        'embedding_types': ['float'],
      });
    });
  });

  group('CohereEmbedResponse parsing', () {
    test('Parses float embeddings', () {
      final response = CohereEmbedResponse.fromJson(const {
        'id': 'res_1',
        'embeddings': {
          'float': [
            [0.1, 0.2, 0.3],
            [0.4, 0.5, 0.6],
          ],
        },
        'texts': ['Hello world', 'Bye bye'],
      });

      expect(response.id, 'res_1');
      expect(response.embeddings, [
        [0.1, 0.2, 0.3],
        [0.4, 0.5, 0.6],
      ]);
    });
  });

  group('CohereClient error handling', () {
    CohereClient clientReturning(final String body, final int statusCode) =>
        CohereClient(
          apiKey: 'test-key',
          client: MockClient(
            (final request) async => http.Response(
              body,
              statusCode,
              headers: {'content-type': 'application/json'},
            ),
          ),
        );

    test('chat() throws CohereClientException with the parsed message '
        'and status code on a non-2xx response', () async {
      final client = clientReturning(
        jsonEncode({'message': 'invalid api token'}),
        401,
      );

      await expectLater(
        () => client.chat(
          request: const CohereChatRequest(
            model: 'command-r-plus-08-2024',
            messages: [CohereMessage.user('Hello!')],
          ),
        ),
        throwsA(
          isA<CohereClientException>()
              .having((final e) => e.statusCode, 'statusCode', 401)
              .having((final e) => e.message, 'message', 'invalid api token'),
        ),
      );
      client.close();
    });

    test(
      'chat() falls back to the raw body when the error is not JSON',
      () async {
        final client = clientReturning('Bad Gateway', 502);

        await expectLater(
          () => client.chat(
            request: const CohereChatRequest(
              model: 'command-r-plus-08-2024',
              messages: [CohereMessage.user('Hello!')],
            ),
          ),
          throwsA(
            isA<CohereClientException>()
                .having((final e) => e.statusCode, 'statusCode', 502)
                .having((final e) => e.message, 'message', 'Bad Gateway'),
          ),
        );
        client.close();
      },
    );

    test(
      'embed() throws when the response has fewer embeddings than inputs',
      () async {
        // Two input texts, but the response only carries one embedding.
        final client = clientReturning(
          jsonEncode({
            'id': 'res_1',
            'embeddings': {
              'float': [
                [0.1, 0.2],
              ],
            },
          }),
          200,
        );

        await expectLater(
          () => client.embed(
            request: const CohereEmbedRequest(
              model: 'embed-v4.0',
              texts: ['first', 'second'],
              inputType: CohereEmbeddingInputType.searchDocument,
            ),
          ),
          throwsA(isA<CohereClientException>()),
        );
        client.close();
      },
    );
  });
}
