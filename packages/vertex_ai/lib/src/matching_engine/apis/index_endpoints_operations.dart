import 'package:googleapis/aiplatform/v1.dart';

import '../mappers/mappers.dart';
import '../models/models.dart';

/// {@template vertex_ai_index_endpoints_operations_api}
/// Vertex AI Index Endpoints Operations API.
///
/// Documentation:
/// https://cloud.google.com/vertex-ai/docs/reference/rest/v1/projects.locations.indexEndpoints
/// {@endtemplate}
class VertexAIIndexEndpointsOperationsApi {
  /// {@macro vertex_ai_index_endpoints_operations_api}
  VertexAIIndexEndpointsOperationsApi({
    required final ProjectsLocationsIndexEndpointsOperationsResource
        indexEndpointsOperationsApi,
    required this.project,
    required this.location,
  }) : _indexEndpointsOperationsApi = indexEndpointsOperationsApi;

  /// The Google Cloud project to use for interacting with Vertex AI.
  final String project;

  /// The Google Cloud location to use for interacting with Vertex AI.
  final String location;

  /// Index Endpoints Operations API client.
  final ProjectsLocationsIndexEndpointsOperationsResource
      _indexEndpointsOperationsApi;

  /// Returns the list of operations for the specified index endpoint.
  ///
  /// - [indexEndpointId] - The ID of the index endpoint whose operations you
  ///   want to list.
  Future<List<VertexAIOperation>> list({
    required final String indexEndpointId,
  }) async {
    final operations = <VertexAIOperation>[];
    String? pageToken;
    do {
      final res = await _indexEndpointsOperationsApi.list(
        'projects/$project/locations/$location/indexEndpoints/$indexEndpointId',
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
  /// - [name] - The name of the operation resource (e.g.
  ///   `projects/{project}/locations/{location}/indexEndpoints/{indexEndpoints}/operations/{operation}`).
  Future<VertexAIOperation> get({
    required final String name,
  }) async {
    final res = await _indexEndpointsOperationsApi.get(name);
    return VertexAIOperationGoogleApisMapper.mapOperation(res);
  }

  /// Starts asynchronous cancellation on a long-running operation.
  ///
  /// The server makes a best effort to cancel the operation, but success is not
  /// guaranteed. Clients can use [get] method to check whether the
  /// cancellation succeeded or whether the operation completed despite
  /// cancellation.
  ///
  /// - [name] - The name of the operation resource (e.g.
  ///   `projects/{project}/locations/{location}/indexEndpoints/{indexEndpoints}/operations/{operation}`).
  Future<void> cancel({
    required final String name,
  }) async {
    await _indexEndpointsOperationsApi.cancel(name);
  }

  /// Deletes a long-running operation.
  ///
  /// This method indicates that the client is no longer interested in the
  /// operation result. It does not cancel the operation.
  ///
  /// - [name] - The name of the operation resource (e.g.
  ///   `projects/{project}/locations/{location}/indexEndpoints/{indexEndpoints}/operations/{operation}`).
  Future<void> delete({
    required final String name,
  }) async {
    await _indexEndpointsOperationsApi.delete(name);
  }
}
