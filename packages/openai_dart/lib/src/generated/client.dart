// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target, unused_import

import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:meta/meta.dart';

import 'schema/schema.dart';

/// Enum of HTTP methods
enum HttpMethod { get, put, post, delete, options, head, patch, trace }

// ==========================================
// CLASS: OpenAIClientException
// ==========================================

/// HTTP exception handler for OpenAIClient
class OpenAIClientException implements Exception {
  OpenAIClientException({
    required this.message,
    required this.uri,
    required this.method,
    this.code,
    this.body,
  });

  final String message;
  final Uri uri;
  final HttpMethod method;
  final int? code;
  final Object? body;

  @override
  String toString() {
    Object? data;
    try {
      data = body is String ? jsonDecode(body as String) : body.toString();
    } catch (e) {
      data = body.toString();
    }
    final s = JsonEncoder.withIndent('  ').convert({
      'uri': uri.toString(),
      'method': method.name.toUpperCase(),
      'code': code,
      'message': message,
      'body': data,
    });
    return 'OpenAIClientException($s)';
  }
}

// ==========================================
// CLASS: OpenAIClient
// ==========================================

/// Client for OpenAI API (v.2.0.0)
///
/// The OpenAI REST API. Please see https://platform.openai.com/docs/api-reference for more details.
class OpenAIClient {
  /// Creates a new OpenAIClient instance.
  ///
  /// - [OpenAIClient.baseUrl] Override base URL (default: server url defined in spec)
  /// - [OpenAIClient.headers] Global headers to be sent with every request
  /// - [OpenAIClient.queryParams] Global query parameters to be sent with every request
  /// - [OpenAIClient.client] Override HTTP client to use for requests
  OpenAIClient({
    this.bearerToken = '',
    this.baseUrl,
    this.headers = const {},
    this.queryParams = const {},
    http.Client? client,
  })  : assert(
          baseUrl == null || baseUrl.startsWith('http'),
          'baseUrl must start with http',
        ),
        assert(
          baseUrl == null || !baseUrl.endsWith('/'),
          'baseUrl must not end with /',
        ),
        client = RetryClient(client ?? http.Client());

  /// Override base URL (default: server url defined in spec)
  final String? baseUrl;

  /// Global headers to be sent with every request
  final Map<String, String> headers;

  /// Global query parameters to be sent with every request
  final Map<String, dynamic> queryParams;

  /// HTTP client for requests
  final http.Client client;

  /// Authentication related variables
  String bearerToken;

  // ------------------------------------------
  // METHOD: endSession
  // ------------------------------------------

  /// Close the HTTP client and end session
  void endSession() => client.close();

  // ------------------------------------------
  // METHOD: onRequest
  // ------------------------------------------

  /// Middleware for HTTP requests (user can override)
  ///
  /// The request can be of type [http.Request] or [http.MultipartRequest]
  Future<http.BaseRequest> onRequest(http.BaseRequest request) {
    return Future.value(request);
  }

  // ------------------------------------------
  // METHOD: onStreamedResponse
  // ------------------------------------------

  /// Middleware for HTTP streamed responses (user can override)
  Future<http.StreamedResponse> onStreamedResponse(
    final http.StreamedResponse response,
  ) {
    return Future.value(response);
  }

  // ------------------------------------------
  // METHOD: onResponse
  // ------------------------------------------

  /// Middleware for HTTP responses (user can override)
  Future<http.Response> onResponse(http.Response response) {
    return Future.value(response);
  }

  // ------------------------------------------
  // METHOD: _jsonDecode
  // ------------------------------------------

  dynamic _jsonDecode(http.Response r) {
    return json.decode(utf8.decode(r.bodyBytes));
  }

  // ------------------------------------------
  // METHOD: _request
  // ------------------------------------------

  /// Reusable request method
  @protected
  Future<http.StreamedResponse> _request({
    required String baseUrl,
    required String path,
    required HttpMethod method,
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headerParams = const {},
    bool isMultipart = false,
    String requestType = '',
    String responseType = '',
    Object? body,
  }) async {
    // Override with the user provided baseUrl
    baseUrl = this.baseUrl ?? baseUrl;

    // Ensure a baseUrl is provided
    assert(
      baseUrl.isNotEmpty,
      'baseUrl is required, but none defined in spec or provided by user',
    );

    // Add global query parameters
    queryParams = {...queryParams, ...this.queryParams};

    // Ensure query parameters are strings or iterable of strings
    queryParams = queryParams.map((key, value) {
      if (value is Iterable) {
        return MapEntry(key, value.map((v) => v.toString()));
      } else {
        return MapEntry(key, value.toString());
      }
    });

    // Build the request URI
    Uri uri = Uri.parse(baseUrl + path);
    if (queryParams.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParams);
    }

    // Build the headers
    Map<String, String> headers = {...headerParams};

    // Add bearer token to request headers
    if (bearerToken.isNotEmpty) {
      headers['authorization'] = 'Bearer $bearerToken';
    }

    // Define the request type being sent to server
    if (requestType.isNotEmpty) {
      headers['content-type'] = requestType;
    }

    // Define the response type expected to receive from server
    if (responseType.isNotEmpty) {
      headers['accept'] = responseType;
    }

    // Add global headers
    headers.addAll(this.headers);

    // Build the request object
    http.BaseRequest request;
    if (isMultipart) {
      // Handle multipart request
      request = http.MultipartRequest(method.name, uri);
      request = request as http.MultipartRequest;
      if (body is List<http.MultipartFile>) {
        request.files.addAll(body);
      } else {
        request.files.add(body as http.MultipartFile);
      }
    } else {
      // Handle normal request
      request = http.Request(method.name, uri);
      request = request as http.Request;
      try {
        if (body != null) {
          request.body = json.encode(body);
        }
      } catch (e) {
        // Handle request encoding error
        throw OpenAIClientException(
          uri: uri,
          method: method,
          message: 'Could not encode: ${body.runtimeType}',
          body: e,
        );
      }
    }

    // Add request headers
    request.headers.addAll(headers);

    // Handle user request middleware
    request = await onRequest(request);

    // Submit request
    return await client.send(request);
  }

  // ------------------------------------------
  // METHOD: makeRequestStream
  // ------------------------------------------

  /// Reusable request stream method
  @protected
  Future<http.StreamedResponse> makeRequestStream({
    required String baseUrl,
    required String path,
    required HttpMethod method,
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headerParams = const {},
    bool isMultipart = false,
    String requestType = '',
    String responseType = '',
    Object? body,
  }) async {
    final uri = Uri.parse((this.baseUrl ?? baseUrl) + path);
    late http.StreamedResponse response;
    try {
      response = await _request(
        baseUrl: baseUrl,
        path: path,
        method: method,
        queryParams: queryParams,
        headerParams: headerParams,
        requestType: requestType,
        responseType: responseType,
        body: body,
      );
      // Handle user response middleware
      response = await onStreamedResponse(response);
    } catch (e) {
      // Handle request and response errors
      throw OpenAIClientException(
        uri: uri,
        method: method,
        message: 'Response error',
        body: e,
      );
    }

    // Check for successful response
    if ((response.statusCode ~/ 100) == 2) {
      return response;
    }

    // Handle unsuccessful response
    throw OpenAIClientException(
      uri: uri,
      method: method,
      message: 'Unsuccessful response',
      code: response.statusCode,
      body: (await http.Response.fromStream(response)).body,
    );
  }

  // ------------------------------------------
  // METHOD: makeRequest
  // ------------------------------------------

  /// Reusable request method
  @protected
  Future<http.Response> makeRequest({
    required String baseUrl,
    required String path,
    required HttpMethod method,
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headerParams = const {},
    bool isMultipart = false,
    String requestType = '',
    String responseType = '',
    Object? body,
  }) async {
    final uri = Uri.parse((this.baseUrl ?? baseUrl) + path);
    late http.Response response;
    try {
      final streamedResponse = await _request(
        baseUrl: baseUrl,
        path: path,
        method: method,
        queryParams: queryParams,
        headerParams: headerParams,
        requestType: requestType,
        responseType: responseType,
        body: body,
      );
      response = await http.Response.fromStream(streamedResponse);
      // Handle user response middleware
      response = await onResponse(response);
    } catch (e) {
      // Handle request and response errors
      throw OpenAIClientException(
        uri: uri,
        method: method,
        message: 'Response error',
        body: e,
      );
    }

    // Check for successful response
    if ((response.statusCode ~/ 100) == 2) {
      return response;
    }

    // Handle unsuccessful response
    throw OpenAIClientException(
      uri: uri,
      method: method,
      message: 'Unsuccessful response',
      code: response.statusCode,
      body: response.body,
    );
  }

  // ------------------------------------------
  // METHOD: createChatCompletion
  // ------------------------------------------

  /// Creates a model response for the given chat conversation.
  ///
  /// `request`: Request object for the Create chat completion endpoint.
  ///
  /// `POST` `https://api.openai.com/v1/chat/completions`
  Future<CreateChatCompletionResponse> createChatCompletion({
    required CreateChatCompletionRequest request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://api.openai.com/v1',
      path: '/chat/completions',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return CreateChatCompletionResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: createCompletion
  // ------------------------------------------

  /// Creates a completion for the provided prompt and parameters.
  ///
  /// `request`: Request object for the Create completion endpoint.
  ///
  /// `POST` `https://api.openai.com/v1/completions`
  Future<CreateCompletionResponse> createCompletion({
    required CreateCompletionRequest request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://api.openai.com/v1',
      path: '/completions',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return CreateCompletionResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: createEmbedding
  // ------------------------------------------

  /// Creates an embedding vector representing the input text.
  ///
  /// `request`: Request object for the Create embedding endpoint.
  ///
  /// `POST` `https://api.openai.com/v1/embeddings`
  Future<CreateEmbeddingResponse> createEmbedding({
    required CreateEmbeddingRequest request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://api.openai.com/v1',
      path: '/embeddings',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return CreateEmbeddingResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: listPaginatedFineTuningJobs
  // ------------------------------------------

  /// List your organization's fine-tuning jobs.
  ///
  /// `after`: Identifier for the last job from the previous pagination request.
  ///
  /// `limit`: Number of fine-tuning jobs to retrieve.
  ///
  /// `GET` `https://api.openai.com/v1/fine_tuning/jobs`
  Future<ListPaginatedFineTuningJobsResponse> listPaginatedFineTuningJobs({
    String? after,
    int limit = 20,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://api.openai.com/v1',
      path: '/fine_tuning/jobs',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
      queryParams: {
        if (after != null) 'after': after,
        'limit': limit,
      },
    );
    return ListPaginatedFineTuningJobsResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: createFineTuningJob
  // ------------------------------------------

  /// Creates a job that fine-tunes a specified model from a given dataset.  Response includes details of the enqueued job including job status and the name of the fine-tuned models once complete.  [Learn more about fine-tuning](https://platform.openai.com/docs/guides/fine-tuning).
  ///
  /// `request`: Request object for the Create fine-tuning job endpoint.
  ///
  /// `POST` `https://api.openai.com/v1/fine_tuning/jobs`
  Future<FineTuningJob> createFineTuningJob({
    required CreateFineTuningJobRequest request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://api.openai.com/v1',
      path: '/fine_tuning/jobs',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return FineTuningJob.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: retrieveFineTuningJob
  // ------------------------------------------

  /// Get info about a fine-tuning job.  [Learn more about fine-tuning](https://platform.openai.com/docs/guides/fine-tuning).
  ///
  /// `fineTuningJobId`: The ID of the fine-tuning job.
  ///
  /// `GET` `https://api.openai.com/v1/fine_tuning/jobs/{fine_tuning_job_id}`
  Future<FineTuningJob> retrieveFineTuningJob({
    required String fineTuningJobId,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://api.openai.com/v1',
      path: '/fine_tuning/jobs/$fineTuningJobId',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return FineTuningJob.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: listFineTuningEvents
  // ------------------------------------------

  /// Get status updates for a fine-tuning job.
  ///
  /// `fineTuningJobId`: The ID of the fine-tuning job to get events for.
  ///
  /// `after`: Identifier for the last event from the previous pagination request.
  ///
  /// `limit`: Number of events to retrieve.
  ///
  /// `GET` `https://api.openai.com/v1/fine_tuning/jobs/{fine_tuning_job_id}/events`
  Future<ListFineTuningJobEventsResponse> listFineTuningEvents({
    required String fineTuningJobId,
    String? after,
    int limit = 20,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://api.openai.com/v1',
      path: '/fine_tuning/jobs/$fineTuningJobId/events',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
      queryParams: {
        if (after != null) 'after': after,
        'limit': limit,
      },
    );
    return ListFineTuningJobEventsResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: cancelFineTuningJob
  // ------------------------------------------

  /// Immediately cancel a fine-tune job.
  ///
  /// `fineTuningJobId`: The ID of the fine-tuning job to cancel.
  ///
  /// `POST` `https://api.openai.com/v1/fine_tuning/jobs/{fine_tuning_job_id}/cancel`
  Future<FineTuningJob> cancelFineTuningJob({
    required String fineTuningJobId,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://api.openai.com/v1',
      path: '/fine_tuning/jobs/$fineTuningJobId/cancel',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return FineTuningJob.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: createImage
  // ------------------------------------------

  /// Creates an image given a prompt.
  ///
  /// `request`: Request object for the Create image endpoint.
  ///
  /// `POST` `https://api.openai.com/v1/images/generations`
  Future<ImagesResponse> createImage({
    required CreateImageRequest request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://api.openai.com/v1',
      path: '/images/generations',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return ImagesResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: listModels
  // ------------------------------------------

  /// Lists the currently available models, and provides basic information about each one such as the owner and availability.
  ///
  /// `GET` `https://api.openai.com/v1/models`
  Future<ListModelsResponse> listModels() async {
    final r = await makeRequest(
      baseUrl: 'https://api.openai.com/v1',
      path: '/models',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return ListModelsResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: retrieveModel
  // ------------------------------------------

  /// Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
  ///
  /// `model`: The ID of the model to use for this request
  ///
  /// `GET` `https://api.openai.com/v1/models/{model}`
  Future<Model> retrieveModel({
    required String model,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://api.openai.com/v1',
      path: '/models/$model',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return Model.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: deleteModel
  // ------------------------------------------

  /// Delete a fine-tuned model. You must have the Owner role in your organization to delete a model.
  ///
  /// `model`: The model to delete
  ///
  /// `DELETE` `https://api.openai.com/v1/models/{model}`
  Future<DeleteModelResponse> deleteModel({
    required String model,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://api.openai.com/v1',
      path: '/models/$model',
      method: HttpMethod.delete,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return DeleteModelResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: createModeration
  // ------------------------------------------

  /// Classifies if text violates OpenAI's Content Policy.
  ///
  /// `request`: Request object for the Create moderation endpoint.
  ///
  /// `POST` `https://api.openai.com/v1/moderations`
  Future<CreateModerationResponse> createModeration({
    required CreateModerationRequest request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://api.openai.com/v1',
      path: '/moderations',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return CreateModerationResponse.fromJson(_jsonDecode(r));
  }
}
