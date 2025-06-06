import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

class MockHttpClient implements http.Client {
  late Future<http.StreamedResponse> Function(http.BaseRequest request) _sendHandler;

  http.BaseRequest? lastRequest;

  void setMockSendHandler(
    Future<http.StreamedResponse> Function(http.BaseRequest request) handler,
  ) {
    _sendHandler = handler;
  }

  @override
  Future<http.Response> head(Uri url, {Map<String, String>? headers}) => throw UnimplementedError();
  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) => throw UnimplementedError();
  @override
  Future<http.Response> post(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) => throw UnimplementedError();
  @override
  Future<http.Response> put(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) => throw UnimplementedError();
  @override
  Future<http.Response> delete(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) => throw UnimplementedError();
  @override
  Future<http.Response> patch(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) => throw UnimplementedError();
  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) => throw UnimplementedError();
  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) => throw UnimplementedError();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    lastRequest = request;
    return _sendHandler(request);
  }

  @override
  void close() {}
}

void main() {
  late OpenAIClient client;
  late MockHttpClient mockHttpClient;
  const baseUrl = 'https://api.openai.com/v1';

  setUp(() {
    mockHttpClient = MockHttpClient();
    client = OpenAIClient(apiKey: 'test_api_key', client: mockHttpClient, baseUrl: baseUrl);
  });

  group('OpenAI Responses API tests', () {
    test('Test createResponse (non-streaming)', () async {
      const requestBodyMap = {'model': 'gpt-4o-mini', 'input': 'Hello world'};
      final responseBodyJson = {
        'id': 'res_123', 'object': 'response', 'created_at': 1677652288, 'status': 'completed',
        'output': [{'id': 'item_abc', 'type': 'text', 'content': [{'type': 'text', 'text': 'This is the generated text.'}]}],
        'usage': {'input_tokens': 10, 'output_tokens': 20},
      };

      mockHttpClient.setMockSendHandler((request) async {
        expect(request.url.toString(), '$baseUrl/responses');
        expect(request.method.toUpperCase(), 'POST');

        final bodyString = await request.finalize().bytesToString();
        expect(jsonDecode(bodyString), equals(requestBodyMap));

        return http.StreamedResponse(
          Stream.value(utf8.encode(jsonEncode(responseBodyJson))),
          200,
          headers: {'content-type': 'application/json'},
        );
      });

      final req = CreateResponseRequest(model: 'gpt-4o-mini', input: CreateResponseRequestInput.string('Hello world'));
      final response = await client.createResponse(request: req);

      expect(response.id, 'res_123');
      expect(response.status, ResponseStatus.completed);
      expect(response.output.first.type, OutputType.text);
      final contentPart = response.output.first.content!.first;
      expect(contentPart.type.name, 'text');
      expect((contentPart as OutputContentText).text, 'This is the generated text.');
    });

    /* // Streaming test still commented out
    test('Test createResponse (streaming)', () async {
      // ...
      print('Streaming test for createResponse is partially commented out pending client method review.');
    });
    */

    test('Test getResponse', () async {
      const responseId = 'res_123_get';
      final responseJson = {
        'id': responseId, 'object': 'response', 'created_at': 1677652300, 'status': 'completed',
        'output': [{'id': 'item_xyz', 'type': 'text', 'content': [{'type': 'text', 'text': 'Fetched response text.'}]}],
        'usage': {'input_tokens': 7, 'output_tokens': 12},
      };

      mockHttpClient.setMockSendHandler((request) async {
        expect(request.url.toString(), '$baseUrl/responses/$responseId');
        expect(request.method.toUpperCase(), 'GET');
        return http.StreamedResponse(
          Stream.value(utf8.encode(jsonEncode(responseJson))),
          200,
          headers: {'content-type': 'application/json'},
        );
      });

      final response = await client.getResponse(responseId: responseId);
      expect(response.id, responseId);
      expect(response.status, ResponseStatus.completed);
      final contentPart = response.output.first.content!.first;
      expect(contentPart.type.name, 'text');
      expect((contentPart as OutputContentText).text, 'Fetched response text.');
    });

    test('Test deleteResponse', () async {
      const responseId = 'res_456_delete';
      final responseJson = {'id': responseId, 'object': 'response.deleted', 'deleted': true};

      mockHttpClient.setMockSendHandler((request) async {
        expect(request.url.toString(), '$baseUrl/responses/$responseId');
        expect(request.method.toUpperCase(), 'DELETE');
        return http.StreamedResponse(
          Stream.value(utf8.encode(jsonEncode(responseJson))),
          200,
          headers: {'content-type': 'application/json'},
        );
      });

      final response = await client.deleteResponse(responseId: responseId);
      expect(response.id, responseId);
      expect(response.object, DeleteResponseResponseObject.responseDeleted);
      expect(response.deleted, isTrue);
    });

    test('Test cancelResponse', () async {
      const responseId = 'res_789_cancel';
      final responseJson = {
        'id': responseId, 'object': 'response', 'created_at': 1677652310, 'status': 'cancelled', 'output': [],
      };

      mockHttpClient.setMockSendHandler((request) async {
        expect(request.url.toString(), '$baseUrl/responses/$responseId/cancel');
        expect(request.method.toUpperCase(), 'POST');
        final bodyBytes = await request.finalize().toBytes();
        expect(bodyBytes, isEmpty);
        return http.StreamedResponse(
          Stream.value(utf8.encode(jsonEncode(responseJson))),
          200,
          headers: {'content-type': 'application/json'},
        );
      });

      final response = await client.cancelResponse(responseId: responseId);
      expect(response.id, responseId);
      expect(response.status, ResponseStatus.cancelled);
    });

    test('Test listInputItems', () async {
      const responseId = 'res_101_items';
      final responseJson = {
        'object': 'list',
        'data': [
          {'id': 'item_qrs', 'type': 'text', 'content': [{'type': 'text', 'text': 'Input 1'}]},
          {'id': 'item_tuv', 'type': 'text', 'content': [{'type': 'text', 'text': 'Input 2'}]},
        ],
        'first_id': 'item_qrs', 'last_id': 'item_tuv', 'has_more': false,
      };

      mockHttpClient.setMockSendHandler((request) async {
        expect(request.url.toString(), '$baseUrl/responses/$responseId/input_items?limit=10&order=desc');
        expect(request.method.toUpperCase(), 'GET');
        return http.StreamedResponse(
          Stream.value(utf8.encode(jsonEncode(responseJson))),
          200,
          headers: {'content-type': 'application/json'},
        );
      });

      final response = await client.listResponseInputItems(
        responseId: responseId,
        limit: 10,
        order: 'desc',
      );

      expect(response.object, 'list');
      expect(response.data.first.type, InputContentType.text);
      final firstItemContent = response.data.first.content!.first;
      expect(firstItemContent.type.name, 'text'); // Using .name for the discriminator type
      expect((firstItemContent as InputContentText).text, 'Input 1');
    });
  });
}
