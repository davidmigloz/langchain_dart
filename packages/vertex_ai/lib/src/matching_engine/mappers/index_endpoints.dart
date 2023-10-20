import 'package:googleapis/aiplatform/v1.dart';

import '../models/index_endpoints.dart';
import 'indexes.dart';

/// Vertex AI Index Endpoints to googleapis models.
class VertexAIIndexEndpointsGoogleApisMapper {
  /// Maps a VertexAIIndexEndpoint to a GoogleCloudAiplatformV1IndexEndpoint.
  static GoogleCloudAiplatformV1PrivateServiceConnectConfig
      mapPrivateServiceConnectConfig(
    final VertexAIPrivateServiceConnectConfig privateServiceConnectConfig,
  ) {
    return GoogleCloudAiplatformV1PrivateServiceConnectConfig(
      enablePrivateServiceConnect:
          privateServiceConnectConfig.enablePrivateServiceConnect,
      projectAllowlist: privateServiceConnectConfig.projectAllowlist,
    );
  }

  /// Maps a VertexAIIndexEndpoint to a GoogleCloudAiplatformV1IndexEndpoint.
  static GoogleCloudAiplatformV1AutomaticResources mapAutomaticResources(
    final VertexAIAutomaticResources automaticResources,
  ) {
    return GoogleCloudAiplatformV1AutomaticResources(
      maxReplicaCount: automaticResources.maxReplicaCount,
      minReplicaCount: automaticResources.minReplicaCount,
    );
  }

  /// Maps a VertexAIIndexEndpoint to a GoogleCloudAiplatformV1IndexEndpoint.
  static GoogleCloudAiplatformV1FindNeighborsRequestQuery mapRequestQuery(
    final VertexAIFindNeighborsRequestQuery query,
  ) {
    return GoogleCloudAiplatformV1FindNeighborsRequestQuery(
      datapoint:
          VertexAIIndexGoogleApisMapper.mapIndexDatapoint(query.datapoint),
      neighborCount: query.neighborCount,
      approximateNeighborCount: query.approximateNeighborCount,
      fractionLeafNodesToSearchOverride:
          query.fractionLeafNodesToSearchOverride,
      perCrowdingAttributeNeighborCount:
          query.perCrowdingAttributeNeighborCount,
    );
  }

  /// Maps a VertexAIIndexEndpoint to a GoogleCloudAiplatformV1IndexEndpoint.
  static VertexAIIndexEndpoint mapIndexEndpoint(
    final GoogleCloudAiplatformV1IndexEndpoint indexEndpoint,
  ) {
    return VertexAIIndexEndpoint(
      name: indexEndpoint.name ?? '',
      displayName: indexEndpoint.displayName ?? '',
      description: indexEndpoint.description ?? '',
      network: indexEndpoint.network,
      privateServiceConnectConfig:
          indexEndpoint.privateServiceConnectConfig != null
              ? _mapPrivateServiceConnectConfig(
                  indexEndpoint.privateServiceConnectConfig!,
                )
              : null,
      publicEndpointEnabled: indexEndpoint.publicEndpointEnabled ?? false,
      publicEndpointDomainName: indexEndpoint.publicEndpointDomainName,
      deployedIndexes: indexEndpoint.deployedIndexes != null
          ? indexEndpoint.deployedIndexes!
              .map(_mapDeployedIndex)
              .toList(growable: false)
          : [],
      labels: indexEndpoint.labels,
      etag: indexEndpoint.etag,
      createTime:
          DateTime.tryParse(indexEndpoint.createTime ?? '') ?? DateTime.now(),
      updateTime:
          DateTime.tryParse(indexEndpoint.updateTime ?? '') ?? DateTime.now(),
    );
  }

  static VertexAIPrivateServiceConnectConfig _mapPrivateServiceConnectConfig(
    final GoogleCloudAiplatformV1PrivateServiceConnectConfig
        privateServiceConnectConfig,
  ) {
    return VertexAIPrivateServiceConnectConfig(
      enablePrivateServiceConnect:
          privateServiceConnectConfig.enablePrivateServiceConnect ?? false,
      projectAllowlist: privateServiceConnectConfig.projectAllowlist,
    );
  }

  static VertexAIDeployedIndex _mapDeployedIndex(
    final GoogleCloudAiplatformV1DeployedIndex deployedIndex,
  ) {
    return VertexAIDeployedIndex(
      id: deployedIndex.id ?? '',
      index: deployedIndex.index ?? '',
      displayName: deployedIndex.displayName ?? '',
      createTime:
          DateTime.tryParse(deployedIndex.createTime ?? '') ?? DateTime.now(),
      indexSyncTime: DateTime.tryParse(deployedIndex.indexSyncTime ?? '') ??
          DateTime.now(),
      automaticResources:
          _mapAutomaticResources(deployedIndex.automaticResources),
      dedicatedResources: deployedIndex.dedicatedResources != null
          ? _mapDedicatedResources(deployedIndex.dedicatedResources)
          : null,
      deployedIndexAuthConfig: deployedIndex.deployedIndexAuthConfig != null
          ? _mapDeployedIndexAuthConfig(deployedIndex.deployedIndexAuthConfig!)
          : null,
      privateEndpoints: deployedIndex.privateEndpoints != null
          ? _mapPrivateEndpoints(deployedIndex.privateEndpoints!)
          : null,
      reservedIpRanges: deployedIndex.reservedIpRanges ?? [],
      deploymentGroup: deployedIndex.deploymentGroup ?? '',
      enableAccessLogging: deployedIndex.enableAccessLogging ?? false,
    );
  }

  static VertexAIAutomaticResources _mapAutomaticResources(
    final GoogleCloudAiplatformV1AutomaticResources? automaticResources,
  ) {
    return VertexAIAutomaticResources(
      maxReplicaCount: automaticResources?.maxReplicaCount ?? 0,
      minReplicaCount: automaticResources?.minReplicaCount ?? 0,
    );
  }

  static VertexAIDedicatedResources _mapDedicatedResources(
    final GoogleCloudAiplatformV1DedicatedResources? dedicatedResources,
  ) {
    return VertexAIDedicatedResources(
      autoscalingMetricSpecs: dedicatedResources?.autoscalingMetricSpecs
              ?.map(_mapAutoscalingMetricSpec)
              .toList(growable: false) ??
          [],
      machineSpec: _mapMachineSpec(dedicatedResources!.machineSpec),
      minReplicaCount: dedicatedResources.minReplicaCount ?? 0,
      maxReplicaCount: dedicatedResources.maxReplicaCount ?? 0,
    );
  }

  static VertexAIAutoscalingMetricSpec _mapAutoscalingMetricSpec(
    final GoogleCloudAiplatformV1AutoscalingMetricSpec autoscalingMetricSpec,
  ) {
    return VertexAIAutoscalingMetricSpec(
      metricName: autoscalingMetricSpec.metricName ?? '',
      target: autoscalingMetricSpec.target ?? 0,
    );
  }

  static VertexAIMachineSpec _mapMachineSpec(
    final GoogleCloudAiplatformV1MachineSpec? machineSpec,
  ) {
    return VertexAIMachineSpec(
      machineType: machineSpec?.machineType ?? '',
      acceleratorType: machineSpec?.acceleratorType ?? '',
      acceleratorCount: machineSpec?.acceleratorCount ?? 0,
    );
  }

  static VertexAIDeployedIndexAuthConfig _mapDeployedIndexAuthConfig(
    final GoogleCloudAiplatformV1DeployedIndexAuthConfig authConfig,
  ) {
    return VertexAIDeployedIndexAuthConfig(
      authProvider: _mapAuthProvider(authConfig.authProvider),
    );
  }

  static VertexAIDeployedIndexAuthConfigAuthProvider _mapAuthProvider(
    final GoogleCloudAiplatformV1DeployedIndexAuthConfigAuthProvider?
        authProvider,
  ) {
    return VertexAIDeployedIndexAuthConfigAuthProvider(
      allowedIssuers: authProvider?.allowedIssuers ?? [],
      audiences: authProvider?.audiences ?? [],
    );
  }

  static VertexAIIndexPrivateEndpoints _mapPrivateEndpoints(
    final GoogleCloudAiplatformV1IndexPrivateEndpoints privateEndpoints,
  ) {
    return VertexAIIndexPrivateEndpoints(
      matchGrpcAddress: privateEndpoints.matchGrpcAddress ?? '',
      serviceAttachment: privateEndpoints.serviceAttachment ?? '',
    );
  }

  /// Maps a GoogleCloudAiplatformV1Index to a VertexAIIndex.
  static VertexAIFindNeighborsResponse mapFindNeighborsResponse(
    final GoogleCloudAiplatformV1FindNeighborsResponse response,
  ) {
    return VertexAIFindNeighborsResponse(
      nearestNeighbors: response.nearestNeighbors != null
          ? response.nearestNeighbors!
              .map(_mapNearestNeighbors)
              .toList(growable: false)
          : [],
    );
  }

  static VertexAIFindNeighborsResponseNearestNeighbors _mapNearestNeighbors(
    final GoogleCloudAiplatformV1FindNeighborsResponseNearestNeighbors
        nearestNeighbors,
  ) {
    return VertexAIFindNeighborsResponseNearestNeighbors(
      id: nearestNeighbors.id ?? '',
      neighbors: nearestNeighbors.neighbors != null
          ? nearestNeighbors.neighbors!
              .map(_mapNeighbor)
              .toList(growable: false)
          : [],
    );
  }

  static VertexAIFindNeighborsResponseNeighbor _mapNeighbor(
    final GoogleCloudAiplatformV1FindNeighborsResponseNeighbor neighbor,
  ) {
    return VertexAIFindNeighborsResponseNeighbor(
      datapoint: VertexAIIndexGoogleApisMapper.mapIndexDatapointDto(
        neighbor.datapoint!,
      ),
      distance: neighbor.distance ?? 0.0,
    );
  }
}
