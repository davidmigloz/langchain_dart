import 'package:googleapis/aiplatform/v1.dart';

import '../mappers/mappers.dart';
import '../models/models.dart';
import 'indexes_operations.dart';

/// {@template vertex_ai_indexes_api}
/// Vertex AI Indexes API.
///
/// Documentation:
/// https://cloud.google.com/vertex-ai/docs/reference/rest/v1/projects.locations.indexes
/// {@endtemplate}
class VertexAIIndexesApi {
  /// {@macro vertex_ai_indexes_api}
  VertexAIIndexesApi({
    required final ProjectsLocationsIndexesResource indexesApi,
    required this.project,
    required this.location,
  }) : _indexesApi = indexesApi;

  /// The Google Cloud project to use for interacting with Vertex AI.
  final String project;

  /// The Google Cloud location to use for interacting with Vertex AI.
  final String location;

  /// Indexes API client.
  final ProjectsLocationsIndexesResource _indexesApi;

  /// Indexes Operations API client.
  VertexAIIndexesOperationsApi get operations => VertexAIIndexesOperationsApi(
        indexesOperationsApi: _indexesApi.operations,
        project: project,
        location: location,
      );

  /// Creates an Index.
  ///
  /// Documentation:
  /// https://cloud.google.com/vertex-ai/docs/matching-engine/create-manage-index
  ///
  /// - [displayName] The display name of the Index. The name can be up to 128
  /// characters long and can consist of any UTF-8 characters.
  /// - [description] The description of the Index.
  /// - [metadata] additional information about the Index.
  /// - [indexUpdateMethod] The index update method.
  /// - [labels] The labels with user-defined metadata to organize your Indexes.
  /// - [etag] Used to perform consistent read-modify-write updates. If not
  ///   set, a blind "overwrite" update happens.
  Future<VertexAIOperation> create({
    required final String displayName,
    required final String description,
    required final VertexAIIndexCreationMetadata metadata,
    final VertexAIIndexUpdateMethod indexUpdateMethod =
        VertexAIIndexUpdateMethod.batchUpdate,
    final Map<String, String>? labels,
    final String? etag,
  }) async {
    final metadataMap = metadata.toMap();
    final res = await _indexesApi.create(
      GoogleCloudAiplatformV1Index(
        displayName: displayName,
        description: description,
        metadata: metadataMap,
        indexUpdateMethod: indexUpdateMethod.id,
        labels: labels,
        etag: etag,
      ),
      'projects/$project/locations/$location',
    );
    return VertexAIOperationGoogleApisMapper.mapOperation(res);
  }

  /// Returns the list of Indexes in the same project and location.
  Future<List<VertexAIIndex>> list() async {
    final indexes = <VertexAIIndex>[];
    String? pageToken;
    do {
      final res = await _indexesApi.list(
        'projects/$project/locations/$location',
      );
      indexes.addAll(
        res.indexes?.map(VertexAIIndexGoogleApisMapper.mapIndex) ?? [],
      );
      pageToken = res.nextPageToken;
    } while (pageToken != null);
    return indexes;
  }

  /// Gets an Index.
  ///
  /// - [id] The id of the index
  Future<VertexAIIndex> get({
    required final String id,
  }) async {
    final response = await _indexesApi.get(
      'projects/$project/locations/$location/indexes/$id',
    );
    return VertexAIIndexGoogleApisMapper.mapIndex(response);
  }

  /// Deletes an Index.
  ///
  /// An Index can only be deleted when all its DeployedIndexes had been
  /// undeployed.
  ///
  /// - [id] The id of the index
  Future<VertexAIOperation> delete({
    required final String id,
  }) async {
    final res = await _indexesApi.delete(
      'projects/$project/locations/$location/indexes/$id',
    );
    return VertexAIOperationGoogleApisMapper.mapOperation(res);
  }
}
