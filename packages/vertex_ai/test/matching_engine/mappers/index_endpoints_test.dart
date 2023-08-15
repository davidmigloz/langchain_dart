// ignore_for_file: avoid_redundant_argument_values
import 'package:googleapis/aiplatform/v1.dart';
import 'package:test/test.dart';
import 'package:vertex_ai/src/matching_engine/mappers/index_endpoints.dart';
import 'package:vertex_ai/vertex_ai.dart';

void main() {
  group('VertexAIIndexEndpointsGoogleApisMapper tests', () {
    test(
        'VertexAIIndexEndpointsGoogleApisMapper.mapPrivateServiceConnectConfig',
        () {
      const config = VertexAIPrivateServiceConnectConfig(
        enablePrivateServiceConnect: true,
        projectAllowlist: ['projectAllowlist'],
      );
      final expected = GoogleCloudAiplatformV1PrivateServiceConnectConfig(
        enablePrivateServiceConnect: true,
        projectAllowlist: ['projectAllowlist'],
      );

      final res =
          VertexAIIndexEndpointsGoogleApisMapper.mapPrivateServiceConnectConfig(
        config,
      );
      expect(
        res.enablePrivateServiceConnect,
        expected.enablePrivateServiceConnect,
      );
      expect(res.projectAllowlist, expected.projectAllowlist);
    });

    test('VertexAIIndexEndpointsGoogleApisMapper.mapAutomaticResources', () {
      const resources = VertexAIAutomaticResources(
        minReplicaCount: 5,
        maxReplicaCount: 5,
      );
      final expected = GoogleCloudAiplatformV1AutomaticResources(
        minReplicaCount: 5,
        maxReplicaCount: 5,
      );

      final res = VertexAIIndexEndpointsGoogleApisMapper.mapAutomaticResources(
        resources,
      );
      expect(res.minReplicaCount, expected.minReplicaCount);
      expect(res.maxReplicaCount, expected.maxReplicaCount);
    });

    test('VertexAIIndexEndpointsGoogleApisMapper.mapRequestQuery', () {
      const query = VertexAIFindNeighborsRequestQuery(
        datapoint: VertexAIIndexDatapoint(
          datapointId: 'datapointId',
          featureVector: [],
          crowdingTag: null,
          restricts: null,
        ),
        neighborCount: 1,
        approximateNeighborCount: 1,
        fractionLeafNodesToSearchOverride: 1.0,
        perCrowdingAttributeNeighborCount: 1,
      );
      final expected = GoogleCloudAiplatformV1FindNeighborsRequestQuery(
        datapoint: GoogleCloudAiplatformV1IndexDatapoint(
          datapointId: 'datapointId',
          featureVector: [],
          crowdingTag: null,
          restricts: null,
        ),
        neighborCount: 1,
        approximateNeighborCount: 1,
        fractionLeafNodesToSearchOverride: 1.0,
        perCrowdingAttributeNeighborCount: 1,
      );

      final res = VertexAIIndexEndpointsGoogleApisMapper.mapRequestQuery(
        query,
      );
      expect(
        res.approximateNeighborCount,
        expected.approximateNeighborCount,
      );
      expect(res.datapoint?.datapointId, expected.datapoint?.datapointId);
      expect(res.datapoint?.featureVector, expected.datapoint?.featureVector);
      expect(
        res.datapoint?.crowdingTag?.crowdingAttribute,
        expected.datapoint?.crowdingTag?.crowdingAttribute,
      );
      expect(
        res.fractionLeafNodesToSearchOverride,
        expected.fractionLeafNodesToSearchOverride,
      );
      expect(res.neighborCount, expected.neighborCount);
      expect(
        res.perCrowdingAttributeNeighborCount,
        expected.perCrowdingAttributeNeighborCount,
      );
    });

    test('VertexAIIndexEndpointsGoogleApisMapper.mapIndexEndpoint', () {
      final indexEndpoint = GoogleCloudAiplatformV1IndexEndpoint(
        name: 'projects/PROJECT_NUMBER/locations/LOCATION/indexes/INDEX_ID',
        displayName: 'DISPLAY_NAME',
        description: 'DESCRIPTION',
        network: 'network',
        privateServiceConnectConfig:
            GoogleCloudAiplatformV1PrivateServiceConnectConfig(
          enablePrivateServiceConnect: true,
          projectAllowlist: ['projectAllowlist'],
        ),
        publicEndpointEnabled: true,
        publicEndpointDomainName: 'publicEndpointDomainName',
        deployedIndexes: [
          GoogleCloudAiplatformV1DeployedIndex(
            id: 'id',
            index: 'index',
            displayName: 'displayName',
            createTime: '2020-11-08T21:56:30.558449Z',
            indexSyncTime: '2020-11-08T21:56:30.558449Z',
            automaticResources: GoogleCloudAiplatformV1AutomaticResources(
              minReplicaCount: 5,
              maxReplicaCount: 5,
            ),
            dedicatedResources: GoogleCloudAiplatformV1DedicatedResources(
              autoscalingMetricSpecs: [
                GoogleCloudAiplatformV1AutoscalingMetricSpec(
                  metricName: 'metricName',
                  target: 10,
                ),
              ],
              machineSpec: GoogleCloudAiplatformV1MachineSpec(
                machineType: 'machineType',
                acceleratorType: 'acceleratorType',
                acceleratorCount: 1,
              ),
              minReplicaCount: 1,
              maxReplicaCount: 1,
            ),
            deployedIndexAuthConfig:
                GoogleCloudAiplatformV1DeployedIndexAuthConfig(
              authProvider:
                  GoogleCloudAiplatformV1DeployedIndexAuthConfigAuthProvider(
                allowedIssuers: ['allowedIssuers'],
                audiences: ['audiences'],
              ),
            ),
            privateEndpoints: GoogleCloudAiplatformV1IndexPrivateEndpoints(
              matchGrpcAddress: 'matchGrpcAddress',
              serviceAttachment: 'serviceAttachment',
            ),
            reservedIpRanges: [
              'reservedIpRanges',
            ],
            deploymentGroup: 'deploymentGroup',
            enableAccessLogging: true,
          ),
        ],
        labels: null,
        etag: 'ETAG',
        createTime: '2020-11-08T21:56:30.558449Z',
        updateTime: '2020-11-08T22:39:25.048623Z',
      );
      final expected = VertexAIIndexEndpoint(
        name: 'projects/PROJECT_NUMBER/locations/LOCATION/indexes/INDEX_ID',
        displayName: 'DISPLAY_NAME',
        description: 'DESCRIPTION',
        network: 'network',
        privateServiceConnectConfig: const VertexAIPrivateServiceConnectConfig(
          enablePrivateServiceConnect: true,
          projectAllowlist: ['projectAllowlist'],
        ),
        publicEndpointEnabled: true,
        publicEndpointDomainName: 'publicEndpointDomainName',
        deployedIndexes: [
          VertexAIDeployedIndex(
            id: 'id',
            index: 'index',
            displayName: 'displayName',
            createTime: DateTime.parse('2020-11-08T21:56:30.558449Z'),
            indexSyncTime: DateTime.parse('2020-11-08T21:56:30.558449Z'),
            automaticResources: const VertexAIAutomaticResources(
              minReplicaCount: 5,
              maxReplicaCount: 5,
            ),
            dedicatedResources: const VertexAIDedicatedResources(
              autoscalingMetricSpecs: [
                VertexAIAutoscalingMetricSpec(
                  metricName: 'metricName',
                  target: 10,
                ),
              ],
              machineSpec: VertexAIMachineSpec(
                machineType: 'machineType',
                acceleratorType: 'acceleratorType',
                acceleratorCount: 1,
              ),
              minReplicaCount: 1,
              maxReplicaCount: 1,
            ),
            deployedIndexAuthConfig: const VertexAIDeployedIndexAuthConfig(
              authProvider: VertexAIDeployedIndexAuthConfigAuthProvider(
                allowedIssuers: ['allowedIssuers'],
                audiences: ['audiences'],
              ),
            ),
            privateEndpoints: const VertexAIIndexPrivateEndpoints(
              matchGrpcAddress: 'matchGrpcAddress',
              serviceAttachment: 'serviceAttachment',
            ),
            reservedIpRanges: const [
              'reservedIpRanges',
            ],
            deploymentGroup: 'deploymentGroup',
            enableAccessLogging: true,
          ),
        ],
        labels: null,
        etag: 'ETAG',
        createTime: DateTime.parse('2020-11-08T21:56:30.558449Z'),
        updateTime: DateTime.parse('2020-11-08T22:39:25.048623Z'),
      );

      final res = VertexAIIndexEndpointsGoogleApisMapper.mapIndexEndpoint(
        indexEndpoint,
      );
      expect(res, expected);
    });

    test('VertexAIIndexEndpointsGoogleApisMapper.mapFindNeighborsResponse', () {
      final response = GoogleCloudAiplatformV1FindNeighborsResponse(
        nearestNeighbors: [
          GoogleCloudAiplatformV1FindNeighborsResponseNearestNeighbors(
            id: 'deployedIndexId',
            neighbors: [
              GoogleCloudAiplatformV1FindNeighborsResponseNeighbor(
                datapoint: GoogleCloudAiplatformV1IndexDatapoint(
                  datapointId: 'neighbor',
                  featureVector: [],
                  crowdingTag: null,
                  restricts: null,
                ),
                distance: 1.0,
              ),
            ],
          ),
        ],
      );
      const expected = VertexAIFindNeighborsResponse(
        nearestNeighbors: [
          VertexAIFindNeighborsResponseNearestNeighbors(
            id: 'deployedIndexId',
            neighbors: [
              VertexAIFindNeighborsResponseNeighbor(
                datapoint: VertexAIIndexDatapoint(
                  datapointId: 'neighbor',
                  featureVector: [],
                  crowdingTag: null,
                  restricts: null,
                ),
                distance: 1.0,
              ),
            ],
          ),
        ],
      );

      final res =
          VertexAIIndexEndpointsGoogleApisMapper.mapFindNeighborsResponse(
        response,
      );
      expect(res, expected);
    });
  });
}
