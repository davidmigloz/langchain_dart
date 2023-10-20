import 'package:collection/collection.dart';
import 'package:googleapis/aiplatform/v1.dart';

import '../models/indexes.dart';

/// Vertex AI Index Mapper to googleapis models.
class VertexAIIndexGoogleApisMapper {
  /// Maps a VertexAIIndex to a GoogleCloudAiplatformV1Index.
  static VertexAIIndex mapIndex(final GoogleCloudAiplatformV1Index index) {
    return VertexAIIndex(
      name: index.name ?? '',
      displayName: index.displayName ?? '',
      description: index.description ?? '',
      metadataSchemaUri: index.metadataSchemaUri ?? '',
      metadata: VertexAIIndexMetadata.fromMap(
        index.metadata as Map<String, dynamic>? ?? const {},
      ),
      indexUpdateMethod: VertexAIIndexUpdateMethod.values
              .firstWhereOrNull((final m) => m.id == index.indexUpdateMethod) ??
          VertexAIIndexUpdateMethod.batchUpdate,
      indexStats: index.indexStats != null ? mapStats(index.indexStats!) : null,
      deployedIndexes: index.deployedIndexes
              ?.map(_mapDeployedIndexRef)
              .toList(growable: false) ??
          const [],
      labels: index.labels,
      etag: index.etag ?? '',
      createTime: DateTime.tryParse(index.createTime ?? '') ?? DateTime.now(),
      updateTime: DateTime.tryParse(index.updateTime ?? '') ?? DateTime.now(),
    );
  }

  static VertexAIDeployedIndexRef _mapDeployedIndexRef(
    final GoogleCloudAiplatformV1DeployedIndexRef deployedIndexRef,
  ) {
    return VertexAIDeployedIndexRef(
      deployedIndexId: deployedIndexRef.deployedIndexId ?? '',
      indexEndpoint: deployedIndexRef.indexEndpoint ?? '',
    );
  }

  /// Maps a GoogleCloudAiplatformV1Index to a VertexAIIndex.
  static VertexAIIndexStats mapStats(
    final GoogleCloudAiplatformV1IndexStats stats,
  ) {
    return VertexAIIndexStats(
      shardsCount: stats.shardsCount ?? 0,
      // the API returns a string instead of an int
      vectorsCount: int.tryParse(stats.vectorsCount.toString()) ?? 0,
    );
  }

  /// Maps a VertexAIIndex to a GoogleCloudAiplatformV1Index.
  static GoogleCloudAiplatformV1IndexDatapoint mapIndexDatapoint(
    final VertexAIIndexDatapoint datapoint,
  ) {
    return GoogleCloudAiplatformV1IndexDatapoint(
      datapointId: datapoint.datapointId,
      featureVector: datapoint.featureVector,
      crowdingTag: datapoint.crowdingTag != null
          ? _mapCrowdingTag(datapoint.crowdingTag!)
          : null,
      restricts:
          datapoint.restricts?.map(_mapRestriction).toList(growable: false),
    );
  }

  static GoogleCloudAiplatformV1IndexDatapointCrowdingTag _mapCrowdingTag(
    final VertexAIIndexDatapointCrowdingTag crowdingTag,
  ) {
    return GoogleCloudAiplatformV1IndexDatapointCrowdingTag(
      crowdingAttribute: crowdingTag.crowdingAttribute,
    );
  }

  static GoogleCloudAiplatformV1IndexDatapointRestriction _mapRestriction(
    final VertexAIIndexDatapointRestriction restriction,
  ) {
    return GoogleCloudAiplatformV1IndexDatapointRestriction(
      namespace: restriction.namespace,
      allowList: restriction.allowList,
      denyList: restriction.denyList,
    );
  }

  /// Maps a GoogleCloudAiplatformV1Index to a VertexAIIndex.
  static VertexAIIndexDatapoint mapIndexDatapointDto(
    final GoogleCloudAiplatformV1IndexDatapoint datapoint,
  ) {
    return VertexAIIndexDatapoint(
      datapointId: datapoint.datapointId ?? '',
      featureVector: datapoint.featureVector ?? [],
      crowdingTag: datapoint.crowdingTag != null
          ? _mapCrowdingTagDto(datapoint.crowdingTag!)
          : null,
      restricts:
          datapoint.restricts?.map(_mapRestrictionDto).toList(growable: false),
    );
  }

  static VertexAIIndexDatapointCrowdingTag _mapCrowdingTagDto(
    final GoogleCloudAiplatformV1IndexDatapointCrowdingTag crowdingTag,
  ) {
    return VertexAIIndexDatapointCrowdingTag(
      crowdingAttribute: crowdingTag.crowdingAttribute ?? '',
    );
  }

  static VertexAIIndexDatapointRestriction _mapRestrictionDto(
    final GoogleCloudAiplatformV1IndexDatapointRestriction restriction,
  ) {
    return VertexAIIndexDatapointRestriction(
      namespace: restriction.namespace ?? '',
      allowList: restriction.allowList ?? [],
      denyList: restriction.denyList ?? [],
    );
  }
}
