// ignore_for_file: use_super_parameters
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'generated/client.dart' as g;
import 'generated/schema/schema.dart';
import 'http_client/http_client.dart';

/// Client for OpenAI API.
///
/// Please see https://platform.openai.com/docs/api-reference for more details.
class OpenAIClient extends g.OpenAIClient {
  /// Create a new OpenAI API client.
  ///
  /// Main configuration options:
  /// - `apiKey`: your OpenAI API key. You can find your API key in the
  ///   [OpenAI dashboard](https://platform.openai.com/account/api-keys).
  /// - `organization`: your OpenAI organization ID (if applicable).
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to OpenAI's API URL. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters (e.g. Azure OpenAI API
  ///   required to attach a `version` query parameter to every request).
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  OpenAIClient({
    final String? apiKey,
    final String? organization,
    final String? baseUrl,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
  }) : super(
          bearerToken: apiKey ?? '',
          baseUrl: baseUrl,
          headers: {
            if (organization != null) 'OpenAI-Organization': organization,
            'OpenAI-Beta': 'assistants=v2',
            ...?headers,
          },
          queryParams: queryParams ?? const {},
          client: client ?? createDefaultHttpClient(),
        );

  /// Set or replace the API key.
  set apiKey(final String value) => bearerToken = value;

  /// Get the API key.
  String get apiKey => bearerToken;

  // ------------------------------------------
  // METHOD: createCompletionStream
  // ------------------------------------------

  /// Given a prompt, the model will return one or more predicted completions, and can also return the probabilities of alternative tokens at each position. We recommend most users use our Chat completions API. [Learn more](https://platform.openai.com/docs/deprecations/2023-07-06-gpt-and-embeddings)  Related guide: [Legacy Completions](https://platform.openai.com/docs/guides/gpt/completions-api)
  ///
  /// `request`: Request object for the Create completion endpoint.
  ///
  /// `POST` `https://api.openai.com/v1/completions`
  Stream<CreateCompletionResponse> createCompletionStream({
    required final CreateCompletionRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: 'https://api.openai.com/v1',
      path: '/completions',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request.copyWith(stream: true),
    );
    yield* r.stream
        .transform(const _OpenAIStreamTransformer()) //
        .map((final d) => CreateCompletionResponse.fromJson(json.decode(d)));
  }

  // ------------------------------------------
  // METHOD: createChatCompletionStream
  // ------------------------------------------

  /// Creates a model response for the given chat conversation.
  ///
  /// `request`: Request object for the Create chat completion endpoint.
  ///
  /// `POST` `https://api.openai.com/v1/chat/completions`
  Stream<CreateChatCompletionStreamResponse> createChatCompletionStream({
    required final CreateChatCompletionRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: 'https://api.openai.com/v1',
      path: '/chat/completions',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request.copyWith(stream: true),
    );
    yield* r.stream
        .transform(const _OpenAIStreamTransformer()) //
        .map(
          (final d) =>
              CreateChatCompletionStreamResponse.fromJson(json.decode(d)),
        );
  }

  // ------------------------------------------
  // METHOD: createThreadAndRunStream
  // ------------------------------------------

  /// Create a thread and run it in one request.
  ///
  /// `request`: Request object for the Create thread and run endpoint.
  ///
  /// `POST` `https://api.openai.com/v1/threads/runs`
  Stream<AssistantStreamEvent> createThreadAndRunStream({
    required final CreateThreadAndRunRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: 'https://api.openai.com/v1',
      path: '/threads/runs',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request.copyWith(stream: true),
    );
    yield* r.stream.transform(const _OpenAIAssistantStreamTransformer());
  }

  // ------------------------------------------
  // METHOD: createThreadRunStream
  // ------------------------------------------

  /// Create a run.
  ///
  /// `threadId`: The ID of the thread to run.
  ///
  /// `request`: Request object for the Create run endpoint.
  ///
  /// `POST` `https://api.openai.com/v1/threads/{thread_id}/runs`
  Stream<AssistantStreamEvent> createThreadRunStream({
    required final String threadId,
    required final CreateRunRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: 'https://api.openai.com/v1',
      path: '/threads/$threadId/runs',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request.copyWith(stream: true),
    );
    yield* r.stream.transform(const _OpenAIAssistantStreamTransformer());
  }

  // ------------------------------------------
  // METHOD: submitThreadToolOutputsToRunStream
  // ------------------------------------------

  /// When a run has the `status: "requires_action"` and `required_action.type` is `submit_tool_outputs`, this endpoint can be used to submit the outputs from the tool calls once they're all completed. All outputs must be submitted in a single request.
  ///
  /// `threadId`: The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) to which this run belongs.
  ///
  /// `runId`: The ID of the run that requires the tool output submission.
  ///
  /// `request`: Request object for the Submit tool outputs to run endpoint.
  ///
  /// `POST` `https://api.openai.com/v1/threads/{thread_id}/runs/{run_id}/submit_tool_outputs`
  Stream<AssistantStreamEvent> submitThreadToolOutputsToRunStream({
    required final String threadId,
    required final String runId,
    required final SubmitToolOutputsRunRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: 'https://api.openai.com/v1',
      path: '/threads/$threadId/runs/$runId/submit_tool_outputs',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    yield* r.stream.transform(const _OpenAIAssistantStreamTransformer());
  }

  @override
  Future<http.BaseRequest> onRequest(final http.BaseRequest request) {
    return onRequestHandler(request);
  }
}

class _OpenAIStreamTransformer
    extends StreamTransformerBase<List<int>, String> {
  const _OpenAIStreamTransformer();

  @override
  Stream<String> bind(final Stream<List<int>> stream) {
    return stream //
        .transform(utf8.decoder) //
        .transform(const LineSplitter()) //
        .where((final i) => i.startsWith('data: ') && !i.endsWith('[DONE]'))
        .map((final item) => item.substring(6));
  }
}

class _OpenAIAssistantStreamTransformer
    extends StreamTransformerBase<List<int>, AssistantStreamEvent> {
  const _OpenAIAssistantStreamTransformer();

  @override
  Stream<AssistantStreamEvent> bind(final Stream<List<int>> stream) {
    return stream
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .transform(_PairwiseTransformer())
        .map((final item) {
      final (event, data) = item;

      Map<String, dynamic> getEventDataMap({final bool decode = true}) => {
            'event': event,
            'data': decode ? json.decode(data) : data,
          };

      switch (event) {
        case 'thread.created':
          return ThreadStreamEvent.fromJson(getEventDataMap());
        case 'thread.run.created':
        case 'thread.run.queued':
        case 'thread.run.in_progress':
        case 'thread.run.requires_action':
        case 'thread.run.completed':
        case 'thread.run.failed':
        case 'thread.run.cancelling':
        case 'thread.run.cancelled':
        case 'thread.run.expired':
          return RunStreamEvent.fromJson(getEventDataMap());
        case 'thread.run.step.created':
        case 'thread.run.step.in_progress':
        case 'thread.run.step.completed':
        case 'thread.run.step.failed':
        case 'thread.run.step.cancelled':
        case 'thread.run.step.expired':
          return RunStepStreamEvent.fromJson(getEventDataMap());
        case 'thread.run.step.delta':
          return RunStepStreamDeltaEvent.fromJson(getEventDataMap());
        case 'thread.message.created':
        case 'thread.message.in_progress':
        case 'thread.message.completed':
        case 'thread.message.incomplete':
          return MessageStreamEvent.fromJson(getEventDataMap());
        case 'thread.message.delta':
          return MessageStreamDeltaEvent.fromJson(getEventDataMap());
        case 'error':
          return ErrorEvent.fromJson(getEventDataMap());
        case 'done':
          return DoneEvent.fromJson(getEventDataMap(decode: false));
        default:
          throw Exception('Unknown event: $event');
      }
    });
  }
}

class _PairwiseTransformer
    extends StreamTransformerBase<String, (String, String)> {
  @override
  Stream<(String, String)> bind(final Stream<String> stream) {
    late StreamController<(String, String)> controller;
    late StreamSubscription<String> subscription;
    late String event;

    controller = StreamController<(String, String)>(
      onListen: () {
        subscription = stream.listen(
          (final String data) {
            if (data.startsWith('event: ')) {
              event = data.substring(7);
            } else if (data.startsWith('data: ')) {
              final dataStr = data.substring(6);
              controller.add((event, dataStr));
            }
          },
          onError: controller.addError,
          onDone: controller.close,
          cancelOnError: true,
        );
      },
      onPause: ([final resumeSignal]) => subscription.pause(resumeSignal),
      onResume: () => subscription.resume(),
      onCancel: () async => subscription.cancel(),
    );

    return controller.stream;
  }
}
