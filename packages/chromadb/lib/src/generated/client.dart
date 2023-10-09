// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'dart:io' as io;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'schema/schema.dart';

/// Enum of HTTP methods
enum HttpMethod { get, put, post, delete, options, head, patch, trace }

// ==========================================
// CLASS: ChromaApiClientException
// ==========================================

/// HTTP exception handler for ChromaApiClient
class ChromaApiClientException implements io.HttpException {
  ChromaApiClientException({
    required this.message,
    required this.uri,
    required this.method,
    this.code,
    this.body,
  });
  @override
  final String message;
  @override
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

/// Client for ChromaDB API
///
/// `host`: Override host URL - else defaults to server host defined in spec
///
/// `client`: Override HTTP client to use for requests
class ChromaApiClient {
  ChromaApiClient({
    String? host,
    http.Client? client,
  }) {
    // Create a retry client
    this.client = RetryClient(client ?? http.Client());
    // Ensure trailing slash is removed from host
    this.host = host?.replaceAll(RegExp(r'/$'), '');
  }

  /// User provided override for host URL
  late final String? host;

  /// HTTP client for requests
  late final http.Client client;

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
  Future<http.BaseRequest> onRequest(http.BaseRequest request) async {
    return request;
  }

  // ------------------------------------------
  // METHOD: onResponse
  // ------------------------------------------

  /// Middleware for HTTP responses (user can override)
  Future<http.Response> onResponse(http.Response response) async {
    return response;
  }

  // ------------------------------------------
  // METHOD: _request
  // ------------------------------------------

  /// Reusable request method
  Future<http.Response> _request({
    required String host,
    required String path,
    required bool? secure,
    required HttpMethod method,
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headerParams = const {},
    bool isMultipart = false,
    String requestType = '',
    String responseType = '',
    Object? body,
  }) async {
    // Override with the user provided host
    host = this.host ?? host;

    // Ensure a host is provided
    if (host.isEmpty) {
      throw Exception(
        '\n\nHost is required, but none defined in spec or provided by user\n',
      );
    }

    // Ensure query parameters are properly encoded
    queryParams = queryParams.map((key, value) {
      if (value is List) {
        return MapEntry(
          key,
          value.map((v) => Uri.encodeComponent(v.toString())).toList(),
        );
      } else {
        return MapEntry(
          key,
          Uri.encodeComponent(value.toString()),
        );
      }
    });

    // Build the request URI
    secure ??= Uri.parse(host).scheme == 'https';
    Uri uri;
    String authority;
    if (host.contains('http')) {
      authority = Uri.parse(host).authority;
    } else {
      authority = Uri.parse(Uri.https(host).toString()).authority;
    }
    if (secure) {
      uri = Uri.https(
        authority,
        path,
        queryParams.isEmpty ? null : queryParams,
      );
    } else {
      uri = Uri.http(
        authority,
        path,
        queryParams.isEmpty ? null : queryParams,
      );
    }

    // Build the headers
    Map<String, String> headers = {}..addAll(headerParams);

    // Define the request type being sent to server
    if (requestType.isNotEmpty) {
      headers['content-type'] = requestType;
    }

    // Define the response type expected to receive from server
    if (responseType.isNotEmpty) {
      headers['accept'] = responseType;
    }

    // Build the request object
    late http.Response response;
    try {
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
      response = await http.Response.fromStream(await client.send(request));

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
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1',
      secure: false,
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return Map<String, int>.from(json.decode(r.body));
  }

  // ------------------------------------------
  // METHOD: reset
  // ------------------------------------------

  /// Reset
  ///
  /// `POST` `http://localhost:8000/api/v1/reset`
  Future<bool> reset() async {
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1/reset',
      secure: false,
      method: HttpMethod.post,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return json.decode(r.body);
  }

  // ------------------------------------------
  // METHOD: version
  // ------------------------------------------

  /// Version
  ///
  /// `GET` `http://localhost:8000/api/v1/version`
  Future<String> version() async {
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1/version',
      secure: false,
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
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1/heartbeat',
      secure: false,
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return Map<String, int>.from(json.decode(r.body));
  }

  // ------------------------------------------
  // METHOD: listCollections
  // ------------------------------------------

  /// List Collections
  ///
  /// `GET` `http://localhost:8000/api/v1/collections`
  Future<List<CollectionType>> listCollections() async {
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1/collections',
      secure: false,
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    final list = json.decode(r.body) as List;
    return list.map((e) => CollectionType.fromJson(e)).toList();
  }

  // ------------------------------------------
  // METHOD: createCollection
  // ------------------------------------------

  /// Create Collection
  ///
  /// `request`: No description
  ///
  /// `POST` `http://localhost:8000/api/v1/collections`
  Future<CollectionType> createCollection({
    required CreateCollection request,
  }) async {
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1/collections',
      secure: false,
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return CollectionType.fromJson(json.decode(r.body));
  }

  // ------------------------------------------
  // METHOD: add
  // ------------------------------------------

  /// Add
  ///
  /// `collectionId`: No description
  ///
  /// `request`: No description
  ///
  /// `POST` `http://localhost:8000/api/v1/collections/{collection_id}/add`
  Future<bool> add({
    required String collectionId,
    required AddEmbedding request,
  }) async {
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1/collections/$collectionId/add',
      secure: false,
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return json.decode(r.body);
  }

  // ------------------------------------------
  // METHOD: update
  // ------------------------------------------

  /// Update
  ///
  /// `collectionId`: No description
  ///
  /// `request`: No description
  ///
  /// `POST` `http://localhost:8000/api/v1/collections/{collection_id}/update`
  Future<bool> update({
    required String collectionId,
    required UpdateEmbedding request,
  }) async {
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1/collections/$collectionId/update',
      secure: false,
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return json.decode(r.body);
  }

  // ------------------------------------------
  // METHOD: upsert
  // ------------------------------------------

  /// Upsert
  ///
  /// `collectionId`: No description
  ///
  /// `request`: No description
  ///
  /// `POST` `http://localhost:8000/api/v1/collections/{collection_id}/upsert`
  Future<bool> upsert({
    required String collectionId,
    required AddEmbedding request,
  }) async {
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1/collections/$collectionId/upsert',
      secure: false,
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return json.decode(r.body);
  }

  // ------------------------------------------
  // METHOD: get
  // ------------------------------------------

  /// Get
  ///
  /// `collectionId`: No description
  ///
  /// `request`: No description
  ///
  /// `POST` `http://localhost:8000/api/v1/collections/{collection_id}/get`
  Future<GetResponse> get({
    required String collectionId,
    required GetEmbedding request,
  }) async {
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1/collections/$collectionId/get',
      secure: false,
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return GetResponse.fromJson(json.decode(r.body));
  }

  // ------------------------------------------
  // METHOD: delete
  // ------------------------------------------

  /// Delete
  ///
  /// `collectionId`: No description
  ///
  /// `request`: No description
  ///
  /// `POST` `http://localhost:8000/api/v1/collections/{collection_id}/delete`
  Future<List<String>> delete({
    required String collectionId,
    required DeleteEmbedding request,
  }) async {
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1/collections/$collectionId/delete',
      secure: false,
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return List<String>.from(json.decode(r.body));
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
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1/collections/$collectionId/count',
      secure: false,
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return json.decode(r.body);
  }

  // ------------------------------------------
  // METHOD: getNearestNeighbors
  // ------------------------------------------

  /// Get Nearest Neighbors
  ///
  /// `collectionId`: No description
  ///
  /// `request`: No description
  ///
  /// `POST` `http://localhost:8000/api/v1/collections/{collection_id}/query`
  Future<QueryResponse> getNearestNeighbors({
    required String collectionId,
    required QueryEmbedding request,
  }) async {
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1/collections/$collectionId/query',
      secure: false,
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return QueryResponse.fromJson(json.decode(r.body));
  }

  // ------------------------------------------
  // METHOD: getCollection
  // ------------------------------------------

  /// Get Collection
  ///
  /// `collectionName`: No description
  ///
  /// `GET` `http://localhost:8000/api/v1/collections/{collection_name}`
  Future<CollectionType> getCollection({
    required String collectionName,
  }) async {
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1/collections/$collectionName',
      secure: false,
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return CollectionType.fromJson(json.decode(r.body));
  }

  // ------------------------------------------
  // METHOD: deleteCollection
  // ------------------------------------------

  /// Delete Collection
  ///
  /// `collectionName`: No description
  ///
  /// `DELETE` `http://localhost:8000/api/v1/collections/{collection_name}`
  Future<http.Response> deleteCollection({
    required String collectionName,
  }) async {
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1/collections/$collectionName',
      secure: false,
      method: HttpMethod.delete,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
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
  /// `request`: No description
  ///
  /// `PUT` `http://localhost:8000/api/v1/collections/{collection_id}`
  Future<http.Response> updateCollection({
    required String collectionId,
    required UpdateCollection request,
  }) async {
    final r = await _request(
      host: 'localhost:8000',
      path: '/api/v1/collections/$collectionId',
      secure: false,
      method: HttpMethod.put,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return r;
  }
}
