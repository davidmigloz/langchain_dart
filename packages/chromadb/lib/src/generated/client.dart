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
// CLASS: ChromaApiClientException
// ==========================================

/// HTTP exception handler for ChromaApiClient
class ChromaApiClientException implements Exception {
  ChromaApiClientException({
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
    return 'ChromaApiClientException($s)';
  }
}

// ==========================================
// CLASS: ChromaApiClient
// ==========================================

/// Client for ChromaDB API (v.0.1.0)
///
/// This is OpenAPI schema for ChromaDB API.
class ChromaApiClient {
  /// Creates a new ChromaApiClient instance.
  ///
  /// - [ChromaApiClient.baseUrl] Override base URL (default: server url defined in spec)
  /// - [ChromaApiClient.headers] Global headers to be sent with every request
  /// - [ChromaApiClient.queryParams] Global query parameters to be sent with every request
  /// - [ChromaApiClient.client] Override HTTP client to use for requests
  ChromaApiClient({
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
        throw ChromaApiClientException(
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
      throw ChromaApiClientException(
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
    throw ChromaApiClientException(
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
      throw ChromaApiClientException(
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
    throw ChromaApiClientException(
      uri: uri,
      method: method,
      message: 'Unsuccessful response',
      code: response.statusCode,
      body: response.body,
    );
  }

  // ------------------------------------------
  // METHOD: root
  // ------------------------------------------

  /// Root
  ///
  /// `GET` `http://localhost:8000/api/v1`
  Future<Map<String, int>> root() async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return Map<String, int>.from(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: reset
  // ------------------------------------------

  /// Reset
  ///
  /// `POST` `http://localhost:8000/api/v1/reset`
  Future<bool> reset() async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/reset',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return _jsonDecode(r);
  }

  // ------------------------------------------
  // METHOD: version
  // ------------------------------------------

  /// Version
  ///
  /// `GET` `http://localhost:8000/api/v1/version`
  Future<String> version() async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/version',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return r.body;
  }

  // ------------------------------------------
  // METHOD: heartbeat
  // ------------------------------------------

  /// Heartbeat
  ///
  /// `GET` `http://localhost:8000/api/v1/heartbeat`
  Future<Map<String, int>> heartbeat() async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/heartbeat',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return Map<String, int>.from(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: preFlightChecks
  // ------------------------------------------

  /// Pre Flight Checks
  ///
  /// `GET` `http://localhost:8000/api/v1/pre-flight-checks`
  Future<http.Response> preFlightChecks() async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/pre-flight-checks',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return r;
  }

  // ------------------------------------------
  // METHOD: createDatabase
  // ------------------------------------------

  /// Create Database
  ///
  /// `tenant`: No description
  ///
  /// `request`: Request model for create database.
  ///
  /// `POST` `http://localhost:8000/api/v1/databases`
  Future<List<DatabaseType>> createDatabase({
    String tenant = 'default_tenant',
    required CreateDatabase request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/databases',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
      queryParams: {
        'tenant': tenant,
      },
    );
    final list = _jsonDecode(r) as List;
    return list.map((e) => DatabaseType.fromJson(e)).toList();
  }

  // ------------------------------------------
  // METHOD: getDatabase
  // ------------------------------------------

  /// Get Database
  ///
  /// `database`: No description
  ///
  /// `tenant`: No description
  ///
  /// `GET` `http://localhost:8000/api/v1/databases/{database}`
  Future<DatabaseType> getDatabase({
    required String database,
    String tenant = 'default_tenant',
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/databases/$database',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
      queryParams: {
        'tenant': tenant,
      },
    );
    return DatabaseType.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: createTenant
  // ------------------------------------------

  /// Create Tenant
  ///
  /// `request`: Request model for create tenant.
  ///
  /// `POST` `http://localhost:8000/api/v1/tenants`
  Future<List<TenantType>> createTenant({
    required CreateTenant request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/tenants',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    final list = _jsonDecode(r) as List;
    return list.map((e) => TenantType.fromJson(e)).toList();
  }

  // ------------------------------------------
  // METHOD: getTenant
  // ------------------------------------------

  /// Get Tenant
  ///
  /// `tenant`: No description
  ///
  /// `GET` `http://localhost:8000/api/v1/tenants/{tenant}`
  Future<TenantType> getTenant({
    required String tenant,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/tenants/$tenant',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return TenantType.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: listCollections
  // ------------------------------------------

  /// List Collections
  ///
  /// `tenant`: No description
  ///
  /// `database`: No description
  ///
  /// `GET` `http://localhost:8000/api/v1/collections`
  Future<List<CollectionType>> listCollections({
    String tenant = 'default_tenant',
    String database = 'default_database',
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/collections',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
      queryParams: {
        'tenant': tenant,
        'database': database,
      },
    );
    final list = _jsonDecode(r) as List;
    return list.map((e) => CollectionType.fromJson(e)).toList();
  }

  // ------------------------------------------
  // METHOD: createCollection
  // ------------------------------------------

  /// Create Collection
  ///
  /// `tenant`: No description
  ///
  /// `database`: No description
  ///
  /// `request`: Request model for create collection.
  ///
  /// `POST` `http://localhost:8000/api/v1/collections`
  Future<CollectionType> createCollection({
    String tenant = 'default_tenant',
    String database = 'default_database',
    required CreateCollection request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/collections',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
      queryParams: {
        'tenant': tenant,
        'database': database,
      },
    );
    return CollectionType.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: add
  // ------------------------------------------

  /// Add
  ///
  /// `collectionId`: No description
  ///
  /// `request`: Request model for add items to collection.
  ///
  /// `POST` `http://localhost:8000/api/v1/collections/{collection_id}/add`
  Future<http.Response> add({
    required String collectionId,
    required AddEmbedding request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/collections/$collectionId/add',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return r;
  }

  // ------------------------------------------
  // METHOD: update
  // ------------------------------------------

  /// Update
  ///
  /// `collectionId`: No description
  ///
  /// `request`: Request model for update items in collection.
  ///
  /// `POST` `http://localhost:8000/api/v1/collections/{collection_id}/update`
  Future<http.Response> update({
    required String collectionId,
    required UpdateEmbedding request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/collections/$collectionId/update',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return r;
  }

  // ------------------------------------------
  // METHOD: upsert
  // ------------------------------------------

  /// Upsert
  ///
  /// `collectionId`: No description
  ///
  /// `request`: Request model for add items to collection.
  ///
  /// `POST` `http://localhost:8000/api/v1/collections/{collection_id}/upsert`
  Future<http.Response> upsert({
    required String collectionId,
    required AddEmbedding request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/collections/$collectionId/upsert',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return r;
  }

  // ------------------------------------------
  // METHOD: get
  // ------------------------------------------

  /// Get
  ///
  /// `collectionId`: No description
  ///
  /// `request`: Request model for get items from collection.
  ///
  /// `POST` `http://localhost:8000/api/v1/collections/{collection_id}/get`
  Future<GetResponse> get({
    required String collectionId,
    required GetEmbedding request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/collections/$collectionId/get',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return GetResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: delete
  // ------------------------------------------

  /// Delete
  ///
  /// `collectionId`: No description
  ///
  /// `request`: Request model for delete items from collection.
  ///
  /// `POST` `http://localhost:8000/api/v1/collections/{collection_id}/delete`
  Future<List<String>> delete({
    required String collectionId,
    required DeleteEmbedding request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/collections/$collectionId/delete',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return List<String>.from(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: count
  // ------------------------------------------

  /// Count
  ///
  /// `collectionId`: No description
  ///
  /// `GET` `http://localhost:8000/api/v1/collections/{collection_id}/count`
  Future<int> count({
    required String collectionId,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/collections/$collectionId/count',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return _jsonDecode(r);
  }

  // ------------------------------------------
  // METHOD: getNearestNeighbors
  // ------------------------------------------

  /// Get Nearest Neighbors
  ///
  /// `collectionId`: No description
  ///
  /// `request`: Request model for query items from collection.
  ///
  /// `POST` `http://localhost:8000/api/v1/collections/{collection_id}/query`
  Future<QueryResponse> getNearestNeighbors({
    required String collectionId,
    required QueryEmbedding request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/collections/$collectionId/query',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return QueryResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: getCollection
  // ------------------------------------------

  /// Get Collection
  ///
  /// `collectionName`: No description
  ///
  /// `tenant`: No description
  ///
  /// `database`: No description
  ///
  /// `GET` `http://localhost:8000/api/v1/collections/{collection_name}`
  Future<CollectionType> getCollection({
    required String collectionName,
    String tenant = 'default_tenant',
    String database = 'default_database',
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/collections/$collectionName',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
      queryParams: {
        'tenant': tenant,
        'database': database,
      },
    );
    return CollectionType.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: deleteCollection
  // ------------------------------------------

  /// Delete Collection
  ///
  /// `collectionName`: No description
  ///
  /// `tenant`: No description
  ///
  /// `database`: No description
  ///
  /// `DELETE` `http://localhost:8000/api/v1/collections/{collection_name}`
  Future<http.Response> deleteCollection({
    required String collectionName,
    String tenant = 'default_tenant',
    String database = 'default_database',
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/collections/$collectionName',
      method: HttpMethod.delete,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
      queryParams: {
        'tenant': tenant,
        'database': database,
      },
    );
    return r;
  }

  // ------------------------------------------
  // METHOD: updateCollection
  // ------------------------------------------

  /// Update Collection
  ///
  /// `collectionId`: No description
  ///
  /// `request`: Request model for update collection.
  ///
  /// `PUT` `http://localhost:8000/api/v1/collections/{collection_id}`
  Future<http.Response> updateCollection({
    required String collectionId,
    required UpdateCollection request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:8000',
      path: '/api/v1/collections/$collectionId',
      method: HttpMethod.put,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return r;
  }
}
