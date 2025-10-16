import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/corpus/batch_create_chunks_request.dart';
import '../models/corpus/batch_create_chunks_response.dart';
import '../models/corpus/batch_delete_chunks_request.dart';
import '../models/corpus/batch_update_chunks_request.dart';
import '../models/corpus/batch_update_chunks_response.dart';
import '../models/corpus/chunk.dart';
import '../models/corpus/list_chunks_response.dart';
import 'base_resource.dart';

/// Resource for the Chunks API.
///
/// Provides access to chunk management within a document.
class ChunksResource extends ResourceBase {
  /// Parent document name (e.g., "corpora/my-corpus/documents/my-doc").
  final String document;

  /// Creates a [ChunksResource].
  ChunksResource({
    required this.document,
    required super.config,
    required super.httpClient,
    required super.interceptorChain,
    required super.requestBuilder,
  });

  /// Creates a new [Chunk] in a document.
  ///
  /// POST /v1beta/{parent}/chunks
  Future<Chunk> create({required Chunk chunk}) async {
    final url = requestBuilder.buildUrl('/{version}/$document/chunks');

    final headers = requestBuilder.buildHeaders(
      additionalHeaders: {'Content-Type': 'application/json'},
    );

    final httpRequest = http.Request('POST', url)
      ..headers.addAll(headers)
      ..body = jsonEncode(chunk.toJson());

    final response = await interceptorChain.execute(httpRequest);

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    return Chunk.fromJson(responseBody);
  }

  /// Lists chunks in a document with pagination support.
  ///
  /// GET /v1beta/{parent}/chunks
  Future<ListChunksResponse> list({int? pageSize, String? pageToken}) async {
    final queryParams = <String, String>{};
    if (pageSize != null) queryParams['pageSize'] = pageSize.toString();
    if (pageToken != null) queryParams['pageToken'] = pageToken;

    final url = requestBuilder.buildUrl(
      '/{version}/$document/chunks',
      queryParams: queryParams,
    );

    final headers = requestBuilder.buildHeaders();

    final httpRequest = http.Request('GET', url)..headers.addAll(headers);

    final response = await interceptorChain.execute(httpRequest);

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    return ListChunksResponse.fromJson(responseBody);
  }

  /// Gets information about a specific chunk.
  ///
  /// GET /v1beta/{name}
  Future<Chunk> get({required String name}) async {
    final url = requestBuilder.buildUrl('/{version}/$name');

    final headers = requestBuilder.buildHeaders();

    final httpRequest = http.Request('GET', url)..headers.addAll(headers);

    final response = await interceptorChain.execute(httpRequest);

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    return Chunk.fromJson(responseBody);
  }

  /// Updates a chunk with a field mask.
  ///
  /// PATCH /v1beta/{name}
  Future<Chunk> update({
    required String name,
    required Chunk chunk,
    String? updateMask,
  }) async {
    final queryParams = <String, String>{};
    if (updateMask != null) queryParams['updateMask'] = updateMask;

    final url = requestBuilder.buildUrl(
      '/{version}/$name',
      queryParams: queryParams,
    );

    final headers = requestBuilder.buildHeaders(
      additionalHeaders: {'Content-Type': 'application/json'},
    );

    final httpRequest = http.Request('PATCH', url)
      ..headers.addAll(headers)
      ..body = jsonEncode(chunk.toJson());

    final response = await interceptorChain.execute(httpRequest);

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    return Chunk.fromJson(responseBody);
  }

  /// Deletes a chunk.
  ///
  /// DELETE /v1beta/{name}
  Future<void> delete({required String name}) async {
    final url = requestBuilder.buildUrl('/{version}/$name');

    final headers = requestBuilder.buildHeaders();

    final httpRequest = http.Request('DELETE', url)..headers.addAll(headers);

    await interceptorChain.execute(httpRequest);
  }

  /// Batch creates chunks in a document.
  ///
  /// POST /v1beta/{parent}/chunks:batchCreate
  Future<BatchCreateChunksResponse> batchCreate({
    required BatchCreateChunksRequest request,
  }) async {
    final url = requestBuilder.buildUrl(
      '/{version}/$document/chunks:batchCreate',
    );

    final headers = requestBuilder.buildHeaders(
      additionalHeaders: {'Content-Type': 'application/json'},
    );

    final httpRequest = http.Request('POST', url)
      ..headers.addAll(headers)
      ..body = jsonEncode(request.toJson());

    final response = await interceptorChain.execute(httpRequest);

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    return BatchCreateChunksResponse.fromJson(responseBody);
  }

  /// Batch updates chunks in a document.
  ///
  /// POST /v1beta/{parent}/chunks:batchUpdate
  Future<BatchUpdateChunksResponse> batchUpdate({
    required BatchUpdateChunksRequest request,
  }) async {
    final url = requestBuilder.buildUrl(
      '/{version}/$document/chunks:batchUpdate',
    );

    final headers = requestBuilder.buildHeaders(
      additionalHeaders: {'Content-Type': 'application/json'},
    );

    final httpRequest = http.Request('POST', url)
      ..headers.addAll(headers)
      ..body = jsonEncode(request.toJson());

    final response = await interceptorChain.execute(httpRequest);

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    return BatchUpdateChunksResponse.fromJson(responseBody);
  }

  /// Batch deletes chunks in a document.
  ///
  /// POST /v1beta/{parent}/chunks:batchDelete
  Future<void> batchDelete({required BatchDeleteChunksRequest request}) async {
    final url = requestBuilder.buildUrl(
      '/{version}/$document/chunks:batchDelete',
    );

    final headers = requestBuilder.buildHeaders(
      additionalHeaders: {'Content-Type': 'application/json'},
    );

    final httpRequest = http.Request('POST', url)
      ..headers.addAll(headers)
      ..body = jsonEncode(request.toJson());

    await interceptorChain.execute(httpRequest);
  }
}
