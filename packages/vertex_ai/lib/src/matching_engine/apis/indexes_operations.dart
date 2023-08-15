import 'package:googleapis/aiplatform/v1.dart';

import '../mappers/mappers.dart';
import '../models/models.dart';

/// {@template vertex_ai_indexes_operations_api}
/// Vertex AI Indexes Operations API.
///
/// Documentation:
/// https://cloud.google.com/vertex-ai/docs/reference/rest/v1/projects.locations.indexes
/// {@endtemplate}
class VertexAIIndexesOperationsApi {
  /// {@macro vertex_ai_indexes_operations_api}
  VertexAIIndexesOperationsApi({
    required final ProjectsLocationsIndexesOperationsResource
        indexesOperationsApi,
    required this.project,
    required this.location,
  }) : _indexesOperationsApi = indexesOperationsApi;

  /// The Google Cloud project to use for interacting with Vertex AI.
  final String project;

  /// The Google Cloud location to use for interacting with Vertex AI.
  final String location;

  /// Indexes Operations API client.
  final ProjectsLocationsIndexesOperationsResource _indexesOperationsApi;

  /// Returns the list of operations for the specified index.
  ///
  /// - [indexId] The ID of the index whose operations you want to list.
  Future<List<VertexAIOperation>> list({
    required final String indexId,
  }) async {
    final operations = <VertexAIOperation>[];
    String? pageToken;
    do {
      final res = await _indexesOperationsApi.list(
        'projects/$project/locations/$location/indexes/$indexId',
      );
      operations.addAll(
        res.operations?.map(VertexAIOperationGoogleApisMapper.mapOperation) ??
            [],
      );
      pageToken = res.nextPageToken;
    } while (pageToken != null);
    return operations;
  }

  /// Gets the latest state of a long-running operation.
  ///
  /// Clients can use this method to poll the operation result at intervals as
  /// recommended by the API service.
  ///
  /// - [name] The name of the operation resource (e.g.
  ///   `projects/{project}/locations/{location}/indexes/{index}/operations/{operation}`).
  Future<VertexAIOperation> get({
    required final String name,
  }) async {
    final res = await _indexesOperationsApi.get(name);
    return VertexAIOperationGoogleApisMapper.mapOperation(res);
  }

  /// Starts asynchronous cancellation on a long-running operation.
  ///
  /// The server makes a best effort to cancel the operation, but success is not
  /// guaranteed. Clients can use [get] method to check whether the
  /// cancellation succeeded or whether the operation completed despite
  /// cancellation.
  ///
  /// - [name] The name of the operation resource (e.g.
  ///   `projects/{project}/locations/{location}/indexes/{index}/operations/{operation}`).
  Future<void> cancel({
    required final String name,
  }) async {
    await _indexesOperationsApi.cancel(name);
  }

  /// Deletes a long-running operation.
  ///
  /// This method indicates that the client is no longer interested in the
  /// operation result. It does not cancel the operation.
  ///
  /// - [name] The name of the operation resource (e.g.
  ///   `projects/{project}/locations/{location}/indexes/{index}/operations/{operation}`).
  Future<void> delete({
    required final String name,
  }) async {
    await _indexesOperationsApi.delete(name);
  }
}
