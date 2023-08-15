import 'package:googleapis/aiplatform/v1.dart';

import '../mappers/mappers.dart';
import '../models/models.dart';
import 'index_endpoints_operations.dart';

/// {@template vertex_ai_index_endpoints_api}
/// Vertex AI Index Endpoints API.
///
/// Documentation:
/// https://cloud.google.com/vertex-ai/docs/reference/rest/v1/projects.locations.indexEndpoints
/// {@endtemplate}
class VertexAIIndexEndpointsApi {
  /// {@macro vertex_ai_index_endpoints_api}
  VertexAIIndexEndpointsApi({
    required final ProjectsLocationsIndexEndpointsResource indexEndpointsApi,
    required this.project,
    required this.location,
  }) : _indexEndpointsApi = indexEndpointsApi;

  /// The Google Cloud project to use for interacting with Vertex AI.
  final String project;

  /// The Google Cloud location to use for interacting with Vertex AI.
  final String location;

  /// Index Endpoints API client.
  final ProjectsLocationsIndexEndpointsResource _indexEndpointsApi;

  /// Index Endpoints Operations API client.
  VertexAIIndexEndpointsOperationsApi get operations =>
      VertexAIIndexEndpointsOperationsApi(
        indexEndpointsOperationsApi: _indexEndpointsApi.operations,
        project: project,
        location: location,
      );

  /// Creates an Index Endpoint.
  ///
  /// Documentation:
  /// https://cloud.google.com/vertex-ai/docs/matching-engine/deploy-index-public
  ///
  /// - [displayName] The display name of the Index Endpoint.
  /// - [description] The description of the Index Endpoint.
  /// - [network] The full name of the Google Compute Engine network to which
  ///   the IndexEndpoint should be peered.
  /// - [privateServiceConnectConfig] Configuration for private service connect.
  ///   [network] and [privateServiceConnectConfig] are mutually exclusive.
  /// - [publicEndpointEnabled] If true, the deployed index will be accessible
  ///   through public endpoint.
  /// - [labels] The labels with user-defined metadata to organize your
  ///  IndexEndpoints.
  /// - [etag] Used to perform consistent read-modify-write updates. If not
  ///   set, a blind "overwrite" update happens.
  Future<VertexAIOperation> create({
    required final String displayName,
    required final String description,
    final String? network,
    final VertexAIPrivateServiceConnectConfig? privateServiceConnectConfig,
    final bool publicEndpointEnabled = false,
    final Map<String, String>? labels,
    final String? etag,
  }) async {
    final res = await _indexEndpointsApi.create(
      GoogleCloudAiplatformV1IndexEndpoint(
        displayName: displayName,
        description: description,
        network: network,
        privateServiceConnectConfig: privateServiceConnectConfig != null
            ? VertexAIIndexEndpointsGoogleApisMapper
                .mapPrivateServiceConnectConfig(
                privateServiceConnectConfig,
              )
            : null,
        publicEndpointEnabled: publicEndpointEnabled,
        labels: labels,
        etag: etag,
      ),
      'projects/$project/locations/$location',
    );
    return VertexAIOperationGoogleApisMapper.mapOperation(res);
  }

  /// Returns the list of Index Endpoints in the same project and location.
  Future<List<VertexAIIndexEndpoint>> list() async {
    final indexEndpoints = <VertexAIIndexEndpoint>[];
    String? pageToken;
    do {
      final res = await _indexEndpointsApi.list(
        'projects/$project/locations/$location',
      );
      indexEndpoints.addAll(
        res.indexEndpoints?.map(
              VertexAIIndexEndpointsGoogleApisMapper.mapIndexEndpoint,
            ) ??
            [],
      );
      pageToken = res.nextPageToken;
    } while (pageToken != null);
    return indexEndpoints;
  }

  /// Gets an Index Endpoint.
  ///
  /// - [id] The id of the index endpoint
  Future<VertexAIIndexEndpoint> get({
    required final String id,
  }) async {
    final response = await _indexEndpointsApi.get(
      'projects/$project/locations/$location/indexEndpoints/$id',
    );
    return VertexAIIndexEndpointsGoogleApisMapper.mapIndexEndpoint(response);
  }

  /// Deletes an Index Endpoint.
  ///
  /// - [id] The id of the index endpoint
  Future<VertexAIOperation> delete({
    required final String id,
  }) async {
    final res = await _indexEndpointsApi.delete(
      'projects/$project/locations/$location/indexEndpoints/$id',
    );
    return VertexAIOperationGoogleApisMapper.mapOperation(res);
  }

  /// Deploys an Index into this IndexEndpoint, creating a DeployedIndex within
  /// it.
  ///
  /// Only non-empty Indexes can be deployed.
  ///
  /// - [indexId] The ID of the Index we want to deploy.
  /// - [indexEndpointId] The ID of the IndexEndpoint we want to deploy the
  ///   Index to.
  /// - [deployedIndexId] A user specified string to uniquely identify the
  ///   deployed index. It must start with a letter and contain only letters,
  ///   numbers or underscores.
  /// - [deployedIndexDisplayName] The display name of the DeployedIndex.
  /// - [automaticResources] The resources that the IndexEndpoint should
  ///   automatically allocate for this DeployedIndex.
  Future<VertexAIOperation> deployIndex({
    required final String indexId,
    required final String indexEndpointId,
    required final String deployedIndexId,
    required final String deployedIndexDisplayName,
    final VertexAIAutomaticResources? automaticResources,
  }) async {
    final res = await _indexEndpointsApi.deployIndex(
      GoogleCloudAiplatformV1DeployIndexRequest(
        deployedIndex: GoogleCloudAiplatformV1DeployedIndex(
          id: deployedIndexId,
          displayName: deployedIndexDisplayName,
          index: 'projects/$project/locations/$location/indexes/$indexId',
          automaticResources: automaticResources != null
              ? VertexAIIndexEndpointsGoogleApisMapper.mapAutomaticResources(
                  automaticResources,
                )
              : null,
        ),
      ),
      'projects/$project/locations/$location/indexEndpoints/$indexEndpointId',
    );
    return VertexAIOperationGoogleApisMapper.mapOperation(res);
  }

  /// Update an existing DeployedIndex under an IndexEndpoint.
  ///
  /// - [indexEndpointId] The ID of the IndexEndpoint we want to deploy the
  ///   Index to.
  /// - [deployedIndexId] A user specified string to uniquely identify the
  ///   deployed index. It must start with a letter and contain only letters,
  ///   numbers or underscores.
  /// - [deployedIndexDisplayName] The display name of the DeployedIndex.
  /// - [automaticResources] The resources that the IndexEndpoint should
  ///   automatically allocate for this DeployedIndex.
  Future<VertexAIOperation> mutateDeployedIndex({
    required final String indexEndpointId,
    required final String deployedIndexId,
    final String? deployedIndexDisplayName,
    final VertexAIAutomaticResources? automaticResources,
  }) async {
    final res = await _indexEndpointsApi.mutateDeployedIndex(
      GoogleCloudAiplatformV1DeployedIndex(
        id: deployedIndexId,
        displayName: deployedIndexDisplayName,
        automaticResources: automaticResources != null
            ? VertexAIIndexEndpointsGoogleApisMapper.mapAutomaticResources(
                automaticResources,
              )
            : null,
      ),
      'projects/$project/locations/$location/indexEndpoints/$indexEndpointId',
    );
    return VertexAIOperationGoogleApisMapper.mapOperation(res);
  }

  /// Undeploy an Index from an IndexEndpoint, removing a DeployedIndex from
  /// it, and freeing all resources it's using.
  ///
  /// - [indexEndpointId] The ID of the IndexEndpoint we want to deploy the
  ///   Index to.
  /// - [deployedIndexId] A user specified string to uniquely identify the
  ///   deployed index. It must start with a letter and contain only letters,
  ///   numbers or underscores.
  Future<VertexAIOperation> undeployIndex({
    required final String indexEndpointId,
    required final String deployedIndexId,
  }) async {
    final res = await _indexEndpointsApi.undeployIndex(
      GoogleCloudAiplatformV1UndeployIndexRequest(
        deployedIndexId: deployedIndexId,
      ),
      'projects/$project/locations/$location/indexEndpoints/$indexEndpointId',
    );
    return VertexAIOperationGoogleApisMapper.mapOperation(res);
  }

  /// Finds the nearest neighbors of each vector within the request.
  ///
  /// Mind that you probably need a different client for calling this method,
  /// as the public query endpoint has a different rootUrl than the rest of the
  /// API (e.g. https://xxxxxxxxxx.europe-west1-xxxxxxxxxxxx.vdb.vertexai.goog).
  ///
  /// Check the [VertexAIIndexEndpoint.publicEndpointDomainName] of your index
  /// endpoint by calling [get]. Then create a new client setting the
  /// [VertexAIMatchingEngineClient.rootUrl] to that value (mind that you need
  /// to add `https://` to the beginning of the domain name).
  ///
  /// - [indexEndpointId] The id of the index endpoint.
  /// - [deployedIndexId] The id of the deployed index.
  /// - [queries] The search queries.
  /// - [returnFullDatapoint] If set to true, the response will contain the
  ///  full datapoint for each nearest neighbor result.
  Future<VertexAIFindNeighborsResponse> findNeighbors({
    required final String indexEndpointId,
    required final String deployedIndexId,
    required final List<VertexAIFindNeighborsRequestQuery> queries,
    final bool returnFullDatapoint = false,
  }) async {
    final res = await _indexEndpointsApi.findNeighbors(
      GoogleCloudAiplatformV1FindNeighborsRequest(
        deployedIndexId: deployedIndexId,
        queries: queries
            .map(
              VertexAIIndexEndpointsGoogleApisMapper.mapRequestQuery,
            )
            .toList(growable: false),
        returnFullDatapoint: returnFullDatapoint,
      ),
      'projects/$project/locations/$location/indexEndpoints/$indexEndpointId',
    );
    return VertexAIIndexEndpointsGoogleApisMapper.mapFindNeighborsResponse(res);
  }
}
