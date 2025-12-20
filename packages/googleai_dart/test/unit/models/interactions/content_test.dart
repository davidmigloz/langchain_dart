// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('InteractionContent Sealed Class', () {
    group('TextContent', () {
      test('creates from text', () {
        const content = TextContent(text: 'Hello world');
        expect(content.text, 'Hello world');
        expect(content.type, 'text');
      });

      test('serializes to JSON', () {
        const content = TextContent(text: 'Hello world');
        final json = content.toJson();
        expect(json['type'], 'text');
        expect(json['text'], 'Hello world');
      });

      test('deserializes from JSON', () {
        final json = {'type': 'text', 'text': 'Hello world'};
        final content = InteractionContent.fromJson(json);
        expect(content, isA<TextContent>());
        expect((content as TextContent).text, 'Hello world');
      });

      test('roundtrip serialization', () {
        const original = TextContent(text: 'Test message');
        final json = original.toJson();
        final restored = InteractionContent.fromJson(json);
        expect(restored, isA<TextContent>());
        expect((restored as TextContent).text, original.text);
      });

      test('with annotations', () {
        final json = {
          'type': 'text',
          'text': 'Check this link',
          'annotations': [
            {
              'url_citation': {
                'url': 'https://example.com',
                'title': 'Example',
              },
            },
          ],
        };

        final content = InteractionContent.fromJson(json);
        expect(content, isA<TextContent>());
        final textContent = content as TextContent;
        expect(textContent.annotations, isNotNull);
        expect(textContent.annotations!.length, 1);
      });
    });

    group('ImageContent', () {
      test('creates with base64 data', () {
        const content = ImageContent(data: 'base64data', mimeType: 'image/png');
        expect(content.data, 'base64data');
        expect(content.type, 'image');
      });

      test('serializes to JSON', () {
        const content = ImageContent(data: 'imgdata', mimeType: 'image/jpeg');
        final json = content.toJson();
        expect(json['type'], 'image');
        expect(json['data'], 'imgdata');
        expect(json['mime_type'], 'image/jpeg');
      });

      test('deserializes from JSON', () {
        final json = {
          'type': 'image',
          'data': 'base64imagedata',
          'mime_type': 'image/png',
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<ImageContent>());
        expect((content as ImageContent).data, 'base64imagedata');
      });

      test('creates with uri', () {
        const content = ImageContent(uri: 'gs://bucket/image.png');
        expect(content.uri, 'gs://bucket/image.png');
      });
    });

    group('AudioContent', () {
      test('creates with audio data', () {
        const content = AudioContent(data: 'audiodata');
        expect(content.data, 'audiodata');
        expect(content.type, 'audio');
      });

      test('deserializes from JSON', () {
        final json = {
          'type': 'audio',
          'data': 'base64audio',
          'mime_type': 'audio/mp3',
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<AudioContent>());
        expect((content as AudioContent).data, 'base64audio');
        expect(content.mimeType, 'audio/mp3');
      });
    });

    group('DocumentContent', () {
      test('deserializes from JSON', () {
        final json = {
          'type': 'document',
          'document': {'uri': 'gs://bucket/doc.pdf'},
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<DocumentContent>());
      });
    });

    group('VideoContent', () {
      test('deserializes from JSON', () {
        final json = {
          'type': 'video',
          'video': {'uri': 'gs://bucket/video.mp4'},
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<VideoContent>());
      });
    });

    group('ThoughtContent', () {
      test('creates with signature', () {
        const content = ThoughtContent(signature: 'sig123');
        expect(content.signature, 'sig123');
        expect(content.type, 'thought');
      });

      test('serializes to JSON', () {
        const content = ThoughtContent(signature: 'sig456');
        final json = content.toJson();
        expect(json['type'], 'thought');
        expect(json['signature'], 'sig456');
      });

      test('deserializes from JSON', () {
        final json = {
          'type': 'thought',
          'signature': 'sig789',
          'summary': ['Reasoning step 1', 'Reasoning step 2'],
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<ThoughtContent>());
        expect((content as ThoughtContent).signature, 'sig789');
        expect(content.summary, isNotNull);
        expect(content.summary!.length, 2);
      });
    });

    group('FunctionCallContent', () {
      test('creates with function call', () {
        const content = FunctionCallContent(
          id: 'call-123',
          name: 'get_weather',
          arguments: {'city': 'SF'},
        );
        expect(content.name, 'get_weather');
        expect(content.id, 'call-123');
        expect(content.type, 'function_call');
      });

      test('serializes to JSON', () {
        const content = FunctionCallContent(
          id: 'call-456',
          name: 'search',
          arguments: {'query': 'test'},
        );
        final json = content.toJson();
        expect(json['type'], 'function_call');
        expect(json['id'], 'call-456');
        expect(json['name'], 'search');
        expect(json['arguments'], {'query': 'test'});
      });

      test('deserializes from JSON', () {
        final json = {
          'type': 'function_call',
          'id': 'call-789',
          'name': 'search',
          'arguments': {'query': 'test'},
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<FunctionCallContent>());
        final fc = content as FunctionCallContent;
        expect(fc.id, 'call-789');
        expect(fc.name, 'search');
        expect(fc.arguments, {'query': 'test'});
      });
    });

    group('FunctionResultContent', () {
      test('creates with function result', () {
        const content = FunctionResultContent(
          callId: 'call-123',
          result: {'temp': 72},
        );
        expect(content.result, {'temp': 72});
        expect(content.callId, 'call-123');
        expect(content.type, 'function_result');
      });

      test('serializes to JSON', () {
        const content = FunctionResultContent(
          callId: 'call-456',
          result: {'results': <String>[]},
          name: 'search',
        );
        final json = content.toJson();
        expect(json['type'], 'function_result');
        expect(json['call_id'], 'call-456');
        expect(json['name'], 'search');
      });

      test('deserializes from JSON', () {
        final json = {
          'type': 'function_result',
          'call_id': 'call-123',
          'result': {'data': 'test'},
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<FunctionResultContent>());
        expect((content as FunctionResultContent).callId, 'call-123');
      });
    });

    group('CodeExecutionCallContent', () {
      test('deserializes from JSON', () {
        final json = {
          'type': 'code_execution_call',
          'code_execution_call': {
            'language': 'python',
            'code': 'print("hello")',
          },
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<CodeExecutionCallContent>());
      });
    });

    group('CodeExecutionResultContent', () {
      test('deserializes from JSON', () {
        final json = {
          'type': 'code_execution_result',
          'code_execution_result': {'outcome': 'success', 'output': 'hello'},
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<CodeExecutionResultContent>());
      });
    });

    group('UrlContextCallContent', () {
      test('deserializes from JSON', () {
        final json = {
          'type': 'url_context_call',
          'url_context_call': {'url': 'https://example.com'},
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<UrlContextCallContent>());
      });
    });

    group('UrlContextResultContent', () {
      test('deserializes from JSON', () {
        final json = {
          'type': 'url_context_result',
          'url_context_result': {'content': 'Page content here'},
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<UrlContextResultContent>());
      });
    });

    group('GoogleSearchCallContent', () {
      test('deserializes from JSON', () {
        final json = {
          'type': 'google_search_call',
          'google_search_call': {'query': 'weather today'},
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<GoogleSearchCallContent>());
      });
    });

    group('GoogleSearchResultContent', () {
      test('deserializes from JSON', () {
        final json = {
          'type': 'google_search_result',
          'google_search_result': {
            'results': [
              {'title': 'Result 1', 'url': 'https://example.com'},
            ],
          },
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<GoogleSearchResultContent>());
      });
    });

    group('McpServerToolCallContent', () {
      test('deserializes from JSON', () {
        final json = {
          'type': 'mcp_server_tool_call',
          'id': 'call-123',
          'name': 'fetch_data',
          'server_name': 'my-server',
          'arguments': {'url': 'https://example.com'},
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<McpServerToolCallContent>());
        final mcp = content as McpServerToolCallContent;
        expect(mcp.id, 'call-123');
        expect(mcp.name, 'fetch_data');
        expect(mcp.serverName, 'my-server');
      });
    });

    group('McpServerToolResultContent', () {
      test('deserializes from JSON', () {
        final json = {
          'type': 'mcp_server_tool_result',
          'mcp_server_tool_result': {'result': 'data'},
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<McpServerToolResultContent>());
      });
    });

    group('FileSearchResultContent', () {
      test('deserializes from JSON', () {
        final json = {
          'type': 'file_search_result',
          'file_search_result': {
            'chunks': [
              {'text': 'Relevant content', 'score': 0.95},
            ],
          },
        };
        final content = InteractionContent.fromJson(json);
        expect(content, isA<FileSearchResultContent>());
      });
    });

    group('Exhaustive Matching', () {
      test('throws ArgumentError for unknown type', () {
        final json = {'type': 'unknown_type'};
        expect(
          () => InteractionContent.fromJson(json),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('all 17 content variants can be deserialized', () {
        final variants = <Map<String, dynamic>>[
          {'type': 'text', 'text': 'test'},
          {'type': 'image', 'data': 'data'},
          {'type': 'audio', 'data': 'data'},
          {'type': 'document', 'document': <String, dynamic>{}},
          {'type': 'video', 'video': <String, dynamic>{}},
          {'type': 'thought', 'signature': 'sig'},
          {
            'type': 'function_call',
            'id': 'id',
            'name': 'fn',
            'arguments': <String, dynamic>{},
          },
          {
            'type': 'function_result',
            'call_id': 'id',
            'result': <String, dynamic>{},
          },
          {
            'type': 'code_execution_call',
            'code_execution_call': <String, dynamic>{},
          },
          {
            'type': 'code_execution_result',
            'code_execution_result': <String, dynamic>{},
          },
          {'type': 'url_context_call', 'url_context_call': <String, dynamic>{}},
          {
            'type': 'url_context_result',
            'url_context_result': <String, dynamic>{},
          },
          {
            'type': 'google_search_call',
            'google_search_call': <String, dynamic>{},
          },
          {
            'type': 'google_search_result',
            'google_search_result': <String, dynamic>{},
          },
          {
            'type': 'mcp_server_tool_call',
            'id': 'id',
            'name': 'tool',
            'server_name': 'server',
            'arguments': <String, dynamic>{},
          },
          {
            'type': 'mcp_server_tool_result',
            'mcp_server_tool_result': <String, dynamic>{},
          },
          {
            'type': 'file_search_result',
            'file_search_result': <String, dynamic>{},
          },
        ];

        for (final json in variants) {
          expect(
            () => InteractionContent.fromJson(json),
            returnsNormally,
            reason: 'Failed for type: ${json['type']}',
          );
        }
      });
    });
  });
}
