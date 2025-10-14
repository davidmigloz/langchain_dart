import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/corpus/document.dart';
import '../models/corpus/list_documents_response.dart';
import '../models/corpus/query_document_request.dart';
import '../models/corpus/query_document_response.dart';
import '../models/models/operation.dart';
import 'base_resource.dart';

/// Resource for the RAG Stores API.
///
/// Provides access to RAG Store document management and operations.
class RagStoresResource extends ResourceBase {
  /// Creates a [RagStoresResource].
  RagStoresResource({
    required super.config,
    required super.httpClient,
    required super.interceptorChain,
    required super.requestBuilder,
  });

  /// Lists all Documents in a RAG Store.
  ///
  /// The [ragStore] is the resource ID of the RAG store (e.g., "ragStores/my-store").
  /// The [pageSize] specifies the maximum number of documents to return (max 20).
  /// The [pageToken] is used for pagination.
  ///
  /// Returns a [ListDocumentsResponse] with the list of documents.
  Future<ListDocumentsResponse> listDocuments({
    required String ragStore,
    int? pageSize,
    String? pageToken,
  }) async {
    final queryParams = <String, String>{
      if (pageSize != null) 'pageSize': pageSize.toString(),
      if (pageToken != null) 'pageToken': pageToken,
    };

    final url = requestBuilder.buildUrl(
      '/{version}/$ragStore/documents',
      queryParams: queryParams,
    );

    final headers = requestBuilder.buildHeaders();

    final httpRequest = http.Request('GET', url)..headers.addAll(headers);

    final response = await interceptorChain.execute(httpRequest);

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    return ListDocumentsResponse.fromJson(responseBody);
  }

  /// Creates an empty Document in a RAG Store.
  ///
  /// The [ragStore] is the resource ID of the RAG store (e.g., "ragStores/my-store").
  /// The [document] contains the document to create.
  ///
  /// Returns the created [Document].
  Future<Document> createDocument({
    required String ragStore,
    required Document document,
  }) async {
    final url = requestBuilder.buildUrl('/{version}/$ragStore/documents');

    final headers = requestBuilder.buildHeaders();

    final httpRequest = http.Request('POST', url)
      ..headers.addAll(headers)
      ..body = jsonEncode(document.toJson());

    final response = await interceptorChain.execute(httpRequest);

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    return Document.fromJson(responseBody);
  }

  /// Gets information about a specific Document in a RAG Store.
  ///
  /// The [name] is the full resource name (e.g., "ragStores/my-store/documents/my-doc").
  ///
  /// Returns the [Document] details.
  Future<Document> getDocument({required String name}) async {
    final url = requestBuilder.buildUrl('/{version}/$name');

    final headers = requestBuilder.buildHeaders();

    final httpRequest = http.Request('GET', url)..headers.addAll(headers);

    final response = await interceptorChain.execute(httpRequest);

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    return Document.fromJson(responseBody);
  }

  /// Deletes a Document from a RAG Store.
  ///
  /// The [name] is the full resource name (e.g., "ragStores/my-store/documents/my-doc").
  /// If [force] is true, any Chunks and objects related to this Document will also be deleted.
  ///
  /// Returns nothing on success.
  Future<void> deleteDocument({
    required String name,
    bool? force,
  }) async {
    final queryParams = <String, String>{
      if (force != null) 'force': force.toString(),
    };

    final url = requestBuilder.buildUrl(
      '/{version}/$name',
      queryParams: queryParams,
    );

    final headers = requestBuilder.buildHeaders();

    final httpRequest = http.Request('DELETE', url)..headers.addAll(headers);

    await interceptorChain.execute(httpRequest);
  }

  /// Performs semantic search over a Document in a RAG Store.
  ///
  /// The [name] is the full resource name (e.g., "ragStores/my-store/documents/my-doc").
  /// The [request] contains the query parameters.
  ///
  /// Returns a [QueryDocumentResponse] with relevant chunks.
  Future<QueryDocumentResponse> queryDocument({
    required String name,
    required QueryDocumentRequest request,
  }) async {
    final url = requestBuilder.buildUrl('/{version}/$name:query');

    final headers = requestBuilder.buildHeaders();

    final httpRequest = http.Request('POST', url)
      ..headers.addAll(headers)
      ..body = jsonEncode(request.toJson());

    final response = await interceptorChain.execute(httpRequest);

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    return QueryDocumentResponse.fromJson(responseBody);
  }

  /// Gets the latest state of a long-running operation for a RAG Store.
  ///
  /// The [ragStore] is the resource ID of the RAG store.
  /// The [operation] is the resource ID of the operation.
  ///
  /// Returns the [Operation] with its current status.
  Future<Operation> operations({
    required String ragStore,
    required String operation,
  }) async {
    final url = requestBuilder.buildUrl(
      '/{version}/ragStores/$ragStore/operations/$operation',
    );

    final headers = requestBuilder.buildHeaders();

    final httpRequest = http.Request('GET', url)..headers.addAll(headers);

    final response = await interceptorChain.execute(httpRequest);

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    return Operation.fromJson(responseBody);
  }

  /// Gets the latest state of a long-running upload operation for a RAG Store.
  ///
  /// The [ragStoresId] is the resource ID of the RAG store.
  /// The [operationsId] is the resource ID of the upload operation.
  ///
  /// Returns the [Operation] with its current status.
  Future<Operation> uploadOperations({
    required String ragStoresId,
    required String operationsId,
  }) async {
    final url = requestBuilder.buildUrl(
      '/{version}/ragStores/$ragStoresId/upload/operations/$operationsId',
    );

    final headers = requestBuilder.buildHeaders();

    final httpRequest = http.Request('GET', url)..headers.addAll(headers);

    final response = await interceptorChain.execute(httpRequest);

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    return Operation.fromJson(responseBody);
  }
}
