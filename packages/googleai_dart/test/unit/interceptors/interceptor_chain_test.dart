import 'dart:async';

import 'package:googleai_dart/src/client/interceptor_chain.dart';
import 'package:googleai_dart/src/errors/exceptions.dart';
import 'package:googleai_dart/src/interceptors/interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../mocks/mock_http_client.dart';

/// Mock interceptor for testing.
class MockInterceptor extends Mock implements Interceptor {}

void main() {
  late MockHttpClient mockHttpClient;

  setUpAll(() {
    // Register fallback values for mocktail
    registerFallbackValue(
      http.Request('GET', Uri.parse('https://example.com')),
    );
    registerFallbackValue(
      RequestContext(
        request: http.Request('GET', Uri.parse('https://example.com')),
        metadata: {},
      ),
    );
  });

  setUp(() {
    mockHttpClient = MockHttpClient();
  });

  group('InterceptorChain', () {
    test('executes interceptors in order', () async {
      final executionOrder = <String>[];

      final interceptor1 = MockInterceptor();
      when(() => interceptor1.intercept(any(), any())).thenAnswer((invocation) {
        executionOrder.add('interceptor1');
        final next = invocation.positionalArguments[1] as InterceptorNext;
        return next(invocation.positionalArguments[0] as RequestContext);
      });

      final interceptor2 = MockInterceptor();
      when(() => interceptor2.intercept(any(), any())).thenAnswer((invocation) {
        executionOrder.add('interceptor2');
        final next = invocation.positionalArguments[1] as InterceptorNext;
        return next(invocation.positionalArguments[0] as RequestContext);
      });

      final interceptor3 = MockInterceptor();
      when(() => interceptor3.intercept(any(), any())).thenAnswer((invocation) {
        executionOrder.add('interceptor3');
        final next = invocation.positionalArguments[1] as InterceptorNext;
        return next(invocation.positionalArguments[0] as RequestContext);
      });

      when(() => mockHttpClient.send(any())).thenAnswer((_) async {
        executionOrder.add('transport');
        return createStreamedResponse(body: '{"result": "ok"}');
      });

      final chain = InterceptorChain(
        interceptors: [interceptor1, interceptor2, interceptor3],
        httpClient: mockHttpClient,
      );

      final request = http.Request('POST', Uri.parse('https://example.com'));
      await chain.execute(request);

      expect(
        executionOrder,
        equals(['interceptor1', 'interceptor2', 'interceptor3', 'transport']),
      );
    });

    test('allows interceptor to short-circuit', () async {
      final executionOrder = <String>[];

      final interceptor1 = MockInterceptor();
      when(() => interceptor1.intercept(any(), any())).thenAnswer((
        invocation,
      ) async {
        executionOrder.add('interceptor1');
        // Short-circuit - return response without calling next
        return http.Response('{"cached": true}', 200);
      });

      final interceptor2 = MockInterceptor();
      when(() => interceptor2.intercept(any(), any())).thenAnswer((invocation) {
        executionOrder.add('interceptor2');
        final next = invocation.positionalArguments[1] as InterceptorNext;
        return next(invocation.positionalArguments[0] as RequestContext);
      });

      when(() => mockHttpClient.send(any())).thenAnswer((_) async {
        executionOrder.add('transport');
        return createStreamedResponse(body: '{"result": "ok"}');
      });

      final chain = InterceptorChain(
        interceptors: [interceptor1, interceptor2],
        httpClient: mockHttpClient,
      );

      final request = http.Request('POST', Uri.parse('https://example.com'));
      final response = await chain.execute(request);

      expect(executionOrder, equals(['interceptor1']));
      expect(response.body, contains('cached'));
    });

    test('propagates errors through interceptor chain', () {
      final interceptor1 = MockInterceptor();
      when(() => interceptor1.intercept(any(), any())).thenAnswer((invocation) {
        final next = invocation.positionalArguments[1] as InterceptorNext;
        return next(invocation.positionalArguments[0] as RequestContext);
      });

      final interceptor2 = MockInterceptor();
      when(() => interceptor2.intercept(any(), any())).thenThrow(
        const ApiException(code: 500, message: 'Internal error'),
      );

      final chain = InterceptorChain(
        interceptors: [interceptor1, interceptor2],
        httpClient: mockHttpClient,
      );

      final request = http.Request('POST', Uri.parse('https://example.com'));

      expect(
        () => chain.execute(request),
        throwsA(isA<ApiException>()),
      );
    });

    test('creates request context with metadata', () async {
      RequestContext? capturedContext;

      final interceptor = MockInterceptor();
      when(() => interceptor.intercept(any(), any())).thenAnswer((invocation) {
        capturedContext = invocation.positionalArguments[0] as RequestContext;
        final next = invocation.positionalArguments[1] as InterceptorNext;
        return next(capturedContext!);
      });

      when(() => mockHttpClient.send(any())).thenAnswer((_) async {
        return createStreamedResponse(body: '{"result": "ok"}');
      });

      final chain = InterceptorChain(
        interceptors: [interceptor],
        httpClient: mockHttpClient,
      );

      final request = http.Request('POST', Uri.parse('https://example.com'));
      await chain.execute(request);

      expect(capturedContext, isNotNull);
      expect(capturedContext!.request, equals(request));
      expect(capturedContext!.metadata, isA<Map<String, dynamic>>());
    });

    test('handles abort trigger', () async {
      final abortCompleter = Completer<void>();

      final interceptor = MockInterceptor();
      when(() => interceptor.intercept(any(), any())).thenAnswer((invocation) {
        final context = invocation.positionalArguments[0] as RequestContext;
        expect(context.abortTrigger, isNotNull);
        final next = invocation.positionalArguments[1] as InterceptorNext;
        return next(context);
      });

      when(() => mockHttpClient.send(any())).thenAnswer((_) async {
        return createStreamedResponse(body: '{"result": "ok"}');
      });

      final chain = InterceptorChain(
        interceptors: [interceptor],
        httpClient: mockHttpClient,
      );

      final request = http.Request('POST', Uri.parse('https://example.com'));
      await chain.execute(request, abortTrigger: abortCompleter.future);

      verify(() => interceptor.intercept(any(), any())).called(1);
    });

    test('executes transport when no interceptors', () async {
      when(() => mockHttpClient.send(any())).thenAnswer((_) async {
        return createStreamedResponse(body: '{"result": "ok"}');
      });

      final chain = InterceptorChain(
        interceptors: [],
        httpClient: mockHttpClient,
      );

      final request = http.Request('POST', Uri.parse('https://example.com'));
      final response = await chain.execute(request);

      expect(response.statusCode, equals(200));
      expect(response.body, contains('result'));
      verify(() => mockHttpClient.send(any())).called(1);
    });

    test('allows interceptor to modify request', () async {
      http.BaseRequest? transportRequest;

      final interceptor = MockInterceptor();
      when(() => interceptor.intercept(any(), any())).thenAnswer((invocation) {
        final context = invocation.positionalArguments[0] as RequestContext;
        final request = context.request as http.Request;

        // Modify request by adding header
        final modifiedRequest = http.Request(request.method, request.url)
          ..headers.addAll(request.headers)
          ..headers['X-Custom-Header'] = 'test-value'
          ..bodyBytes = request.bodyBytes;

        final modifiedContext = context.copyWith(request: modifiedRequest);
        final next = invocation.positionalArguments[1] as InterceptorNext;
        return next(modifiedContext);
      });

      when(() => mockHttpClient.send(any())).thenAnswer((invocation) async {
        transportRequest =
            invocation.positionalArguments[0] as http.BaseRequest;
        return createStreamedResponse(body: '{"result": "ok"}');
      });

      final chain = InterceptorChain(
        interceptors: [interceptor],
        httpClient: mockHttpClient,
      );

      final request = http.Request('POST', Uri.parse('https://example.com'));
      await chain.execute(request);

      expect(transportRequest, isNotNull);
      expect(
        transportRequest!.headers['X-Custom-Header'],
        equals('test-value'),
      );
    });
  });
}
