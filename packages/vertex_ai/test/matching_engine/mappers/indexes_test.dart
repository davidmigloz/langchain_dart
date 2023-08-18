// ignore_for_file: avoid_redundant_argument_values
import 'package:googleapis/aiplatform/v1.dart';
import 'package:test/test.dart';
import 'package:vertex_ai/src/matching_engine/mappers/indexes.dart';
import 'package:vertex_ai/vertex_ai.dart';

void main() {
  group('VertexAIIndexGoogleApisMapper tests', () {
    test('VertexAIIndexGoogleApisMapper.mapIndex', () {
      final index = GoogleCloudAiplatformV1Index(
        name: 'projects/PROJECT_NUMBER/locations/LOCATION/indexes/INDEX_ID',
        displayName: 'DISPLAY_NAME',
        description: 'DESCRIPTION',
        metadataSchemaUri: 'METADATA_SCHEMA_URI',
        metadata: const {
          'contentsDeltaUri': 'gs://BUCKET_NAME/PATH_TO_INDEX_DIR/',
          'isCompleteOverwrite': false,
          'config': {
            'dimensions': 100,
            'approximateNeighborsCount': 150,
            'distanceMeasureType': 'DOT_PRODUCT_DISTANCE',
            'featureNormType': 'NONE',
            'algorithmConfig': {
              'treeAhConfig': {
                'fractionLeafNodesToSearch': 0.1,
                'leafNodeEmbeddingCount': 900,
                'leafNodesToSearchPercent': 5,
              },
            },
            'shardSize': 'SHARD_SIZE_MEDIUM',
          },
        },
        indexUpdateMethod: 'BATCH_UPDATE',
        indexStats: GoogleCloudAiplatformV1IndexStats(
          shardsCount: 1,
          vectorsCount: '1000',
        ),
        deployedIndexes: [
          GoogleCloudAiplatformV1DeployedIndexRef(
            deployedIndexId: 'DEPLOYED_INDEX_ID',
            indexEndpoint: 'INDEX_ENDPOINT',
          ),
        ],
        etag: 'ETAG',
        createTime: '2020-11-08T21:56:30.558449Z',
        updateTime: '2020-11-08T22:39:25.048623Z',
      );
      final expected = VertexAIIndex(
        name: 'projects/PROJECT_NUMBER/locations/LOCATION/indexes/INDEX_ID',
        displayName: 'DISPLAY_NAME',
        description: 'DESCRIPTION',
        metadataSchemaUri: 'METADATA_SCHEMA_URI',
        metadata: const VertexAIIndexMetadata(
          config: VertexAINearestNeighborSearchConfig(
            dimensions: 100,
            approximateNeighborsCount: 150,
            distanceMeasureType: VertexAIDistanceMeasureType.dotProductDistance,
            featureNormType: VertexAIFeatureNormType.none,
            algorithmConfig: VertexAITreeAhAlgorithmConfig(
              fractionLeafNodesToSearch: 0.1,
              leafNodeEmbeddingCount: 900,
              leafNodesToSearchPercent: 5,
            ),
            shardSize: VertexAIShardSize.medium,
          ),
        ),
        indexUpdateMethod: VertexAIIndexUpdateMethod.batchUpdate,
        indexStats: const VertexAIIndexStats(
          shardsCount: 1,
          vectorsCount: 1000,
        ),
        deployedIndexes: const [
          VertexAIDeployedIndexRef(
            deployedIndexId: 'DEPLOYED_INDEX_ID',
            indexEndpoint: 'INDEX_ENDPOINT',
          ),
        ],
        labels: null,
        etag: 'ETAG',
        createTime: DateTime.parse('2020-11-08T21:56:30.558449Z'),
        updateTime: DateTime.parse('2020-11-08T22:39:25.048623Z'),
      );

      final res = VertexAIIndexGoogleApisMapper.mapIndex(index);
      expect(res, expected);
    });

    test('VertexAIIndexGoogleApisMapper.mapStats', () {
      final stats = GoogleCloudAiplatformV1IndexStats(
        shardsCount: 2,
        vectorsCount: '1000',
      );
      const expected = VertexAIIndexStats(
        shardsCount: 2,
        vectorsCount: 1000,
      );

      final res = VertexAIIndexGoogleApisMapper.mapStats(stats);
      expect(res, expected);
    });

    test('VertexAIIndexGoogleApisMapper.mapIndexDatapoint', () {
      const datapoint = VertexAIIndexDatapoint(
        datapointId: 'DATAPOINT_ID',
        featureVector: [0.0],
        crowdingTag: VertexAIIndexDatapointCrowdingTag(
          crowdingAttribute: 'CROWDING_ATTRIBUTE',
        ),
        restricts: [
          VertexAIIndexDatapointRestriction(
            namespace: 'NAMESPACE',
            allowList: ['ALLOW_LIST'],
            denyList: [],
          ),
        ],
      );
      final expected = GoogleCloudAiplatformV1IndexDatapoint(
        datapointId: 'DATAPOINT_ID',
        featureVector: [0.0],
        crowdingTag: GoogleCloudAiplatformV1IndexDatapointCrowdingTag(
          crowdingAttribute: 'CROWDING_ATTRIBUTE',
        ),
        restricts: [
          GoogleCloudAiplatformV1IndexDatapointRestriction(
            namespace: 'NAMESPACE',
            allowList: ['ALLOW_LIST'],
            denyList: [],
          ),
        ],
      );

      final res = VertexAIIndexGoogleApisMapper.mapIndexDatapoint(datapoint);
      expect(
        res.datapointId,
        expected.datapointId,
      );
      expect(
        res.crowdingTag?.crowdingAttribute,
        expected.crowdingTag?.crowdingAttribute,
      );
      expect(
        res.restricts?.first.namespace,
        expected.restricts?.first.namespace,
      );
      expect(
        res.restricts?.first.allowList,
        expected.restricts?.first.allowList,
      );
      expect(
        res.restricts?.first.denyList,
        expected.restricts?.first.denyList,
      );
    });

    test('VertexAIIndexGoogleApisMapper.mapIndexDatapointDto', () {
      final datapoint = GoogleCloudAiplatformV1IndexDatapoint(
        datapointId: 'DATAPOINT_ID',
        featureVector: [0.0],
        crowdingTag: GoogleCloudAiplatformV1IndexDatapointCrowdingTag(
          crowdingAttribute: 'CROWDING_ATTRIBUTE',
        ),
        restricts: [
          GoogleCloudAiplatformV1IndexDatapointRestriction(
            namespace: 'NAMESPACE',
            allowList: ['ALLOW_LIST'],
            denyList: [],
          ),
        ],
      );
      const expected = VertexAIIndexDatapoint(
        datapointId: 'DATAPOINT_ID',
        featureVector: [0.0],
        crowdingTag: VertexAIIndexDatapointCrowdingTag(
          crowdingAttribute: 'CROWDING_ATTRIBUTE',
        ),
        restricts: [
          VertexAIIndexDatapointRestriction(
            namespace: 'NAMESPACE',
            allowList: ['ALLOW_LIST'],
            denyList: [],
          ),
        ],
      );

      final res = VertexAIIndexGoogleApisMapper.mapIndexDatapointDto(datapoint);
      expect(res, expected);
    });
  });
}
