import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import 'indexes.dart';

/// {@template vertex_ai_index_endpoint}
/// Indexes are deployed into it.
///
/// An IndexEndpoint can have multiple DeployedIndexes.
/// {@endtemplate}
@immutable
class VertexAIIndexEndpoint {
  /// {@macro vertex_ai_index_endpoint}
  const VertexAIIndexEndpoint({
    required this.name,
    required this.displayName,
    required this.description,
    this.network,
    this.privateServiceConnectConfig,
    required this.publicEndpointEnabled,
    this.publicEndpointDomainName,
    required this.deployedIndexes,
    this.labels,
    this.etag,
    required this.createTime,
    required this.updateTime,
  });

  /// The id of the IndexEndpoint.
  String get id => name.split('/').last;

  /// The resource name of the IndexEndpoint.
  final String name;

  /// The display name of the IndexEndpoint.
  ///
  /// The name can be up to 128 characters long and can consist of any UTF-8
  /// characters.
  final String displayName;

  /// The description of the IndexEndpoint.
  final String description;

  /// The full name of the Google Compute Engine
  /// [network](https://cloud.google.com/compute/docs/networks-and-firewalls#networks)
  /// to which the IndexEndpoint should be peered.
  ///
  /// Private services access must already be configured for the network. If
  /// left unspecified, the Endpoint is not peered with any network. network and
  /// private_service_connect_config are mutually exclusive.
  /// [Format](https://cloud.google.com/compute/docs/reference/rest/v1/networks/insert):
  /// `projects/{project}/global/networks/{network}`. Where {project} is a
  /// project number, as in '12345', and {network} is network name.
  final String? network;

  /// Configuration for private service connect.
  ///
  /// [network] and [privateServiceConnectConfig] are mutually exclusive.
  final VertexAIPrivateServiceConnectConfig? privateServiceConnectConfig;

  /// If true, the deployed index will be accessible through public endpoint.
  final bool publicEndpointEnabled;

  /// If [publicEndpointEnabled is true, this field will be populated with the
  /// domain name to use for this index endpoint.
  final String? publicEndpointDomainName;

  /// The indexes deployed in this endpoint.
  final List<VertexAIDeployedIndex> deployedIndexes;

  /// The labels with user-defined metadata to organize your Indexes.
  ///
  /// Label keys and values can be no longer than 64 characters (Unicode
  /// codepoints), can only contain lowercase letters, numeric characters,
  /// underscores and dashes. International characters are allowed. See
  /// https://goo.gl/xmQnxf for more information and examples of labels.
  final Map<String, String>? labels;

  /// Used to perform consistent read-modify-write updates.
  ///
  /// If not set, a blind "overwrite" update happens.
  final String? etag;

  /// Timestamp when this IndexEndpoint was created.
  final DateTime createTime;

  /// Timestamp when this IndexEndpoint was last updated.
  ///
  /// This timestamp is not updated when the endpoint's DeployedIndexes are
  /// updated, e.g. due to updates of the original Indexes they are the
  /// deployments of.
  final DateTime updateTime;

  @override
  bool operator ==(covariant final VertexAIIndexEndpoint other) {
    const listEquals = ListEquality<VertexAIDeployedIndex>();
    const mapEquals = MapEquality<String, String>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            name == other.name &&
            displayName == other.displayName &&
            description == other.description &&
            network == other.network &&
            privateServiceConnectConfig == other.privateServiceConnectConfig &&
            publicEndpointEnabled == other.publicEndpointEnabled &&
            publicEndpointDomainName == other.publicEndpointDomainName &&
            listEquals.equals(deployedIndexes, other.deployedIndexes) &&
            mapEquals.equals(labels, other.labels) &&
            etag == other.etag &&
            createTime == other.createTime &&
            updateTime == other.updateTime;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      displayName.hashCode ^
      description.hashCode ^
      network.hashCode ^
      privateServiceConnectConfig.hashCode ^
      publicEndpointEnabled.hashCode ^
      publicEndpointDomainName.hashCode ^
      const ListEquality<VertexAIDeployedIndex>().hash(deployedIndexes) ^
      const MapEquality<String, String>().hash(labels) ^
      etag.hashCode ^
      createTime.hashCode ^
      updateTime.hashCode;

  @override
  String toString() {
    return 'VertexAIIndexEndpoint{'
        'name: $name, '
        'displayName: $displayName, '
        'description: $description, '
        'network: $network, '
        'privateServiceConnectConfig: $privateServiceConnectConfig, '
        'publicEndpointEnabled: $publicEndpointEnabled, '
        'publicEndpointDomainName: $publicEndpointDomainName, '
        'deployedIndexes: $deployedIndexes, '
        'labels: $labels, '
        'etag: $etag, '
        'createTime: $createTime, '
        'updateTime: $updateTime}';
  }
}

/// {@template vertex_ai_private_service_connect_config}
/// Represents configuration for private service connect.
/// {@endtemplate}
@immutable
class VertexAIPrivateServiceConnectConfig {
  /// {@macro vertex_ai_private_service_connect_config}
  const VertexAIPrivateServiceConnectConfig({
    required this.enablePrivateServiceConnect,
    this.projectAllowlist,
  });

  /// If true, expose the IndexEndpoint via private service connect.
  final bool enablePrivateServiceConnect;

  /// A list of Projects from which the forwarding rule will target the service
  /// attachment.
  final List<String>? projectAllowlist;

  @override
  bool operator ==(covariant final VertexAIPrivateServiceConnectConfig other) {
    const listEquals = ListEquality<String>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            enablePrivateServiceConnect == other.enablePrivateServiceConnect &&
            listEquals.equals(projectAllowlist, other.projectAllowlist);
  }

  @override
  int get hashCode =>
      enablePrivateServiceConnect.hashCode ^
      const ListEquality<String>().hash(projectAllowlist);

  @override
  String toString() {
    return 'VertexAIPrivateServiceConnectConfig{'
        'enablePrivateServiceConnect: $enablePrivateServiceConnect, '
        'projectAllowlist: $projectAllowlist}';
  }
}

/// {@template vertex_ai_deployed_index}
/// A deployment of an Index.
///
/// IndexEndpoints contain one or more [VertexAIDeployedIndex].
/// {@endtemplate}
@immutable
class VertexAIDeployedIndex {
  /// {@macro vertex_ai_deployed_index}
  const VertexAIDeployedIndex({
    required this.id,
    required this.index,
    required this.displayName,
    required this.createTime,
    required this.indexSyncTime,
    this.automaticResources = const VertexAIAutomaticResources(
      maxReplicaCount: 2,
      minReplicaCount: 2,
    ),
    this.dedicatedResources,
    this.deployedIndexAuthConfig,
    this.privateEndpoints,
    this.reservedIpRanges,
    this.deploymentGroup = 'default',
    this.enableAccessLogging = false,
  });

  /// The user specified ID of the DeployedIndex.
  ///
  /// The ID can be up to 128 characters long and must start with a letter and
  /// only contain letters, numbers, and underscores. The ID must be unique
  /// within the project it is created in.
  final String id;

  /// The name of the Index this is the deployment of.
  ///
  /// We may refer to this Index as the DeployedIndex's "original" Index.
  final String index;

  /// The display name of the DeployedIndex.
  ///
  /// If not provided upon creation, the Index's display_name is used.
  final String displayName;

  /// Timestamp when the DeployedIndex was created.
  final DateTime createTime;

  /// The DeployedIndex may depend on various data on its original Index.
  ///
  /// Additionally when certain changes to the original Index are being done
  /// (e.g. when what the Index contains is being changed) the DeployedIndex may
  /// be asynchronously updated in the background to reflect these changes. If
  /// this timestamp's value is at least the Index.update_time of the original
  /// Index, it means that this DeployedIndex and the original Index are in
  /// sync. If this timestamp is older, then to see which updates this
  /// DeployedIndex already contains (and which it does not), one must list the
  /// operations that are running on the original Index. Only the successfully
  /// completed Operations with update_time equal or before this sync time are
  /// contained in this DeployedIndex.
  final DateTime indexSyncTime;

  /// A description of resources that the DeployedIndex uses, which to large
  /// degree are decided by Vertex AI, and optionally allows only a modest
  /// additional configuration.
  ///
  /// If min_replica_count is not set, the default value is 2 (we don't provide
  /// SLA when min_replica_count=1). If max_replica_count is not set, the
  /// default value is min_replica_count. The max allowed replica count is 1000.
  final VertexAIAutomaticResources automaticResources;

  /// A description of resources that are dedicated to the DeployedIndex, and
  /// that need a higher degree of manual configuration.
  ///
  /// If min_replica_count is not set, the default value is 2 (we don't provide
  /// SLA when min_replica_count=1). If max_replica_count is not set, the
  /// default value is min_replica_count. The max allowed replica count is 1000.
  /// Available machine types for SMALL shard: e2-standard-2 and all machine
  /// types available for MEDIUM and LARGE shard. Available machine types for
  /// MEDIUM shard: e2-standard-16 and all machine types available for LARGE
  /// shard. Available machine types for LARGE shard: e2-highmem-16,
  /// n2d-standard-32. n1-standard-16 and n1-standard-32 are still available,
  /// but we recommend e2-standard-16 and e2-highmem-16 for cost efficiency.
  final VertexAIDedicatedResources? dedicatedResources;

  /// If set, the authentication is enabled for the private endpoint.
  final VertexAIDeployedIndexAuthConfig? deployedIndexAuthConfig;

  /// Provides paths for users to send requests directly to the deployed index
  /// services running on Cloud via private services access.
  ///
  /// This field is populated if network is configured.
  final VertexAIIndexPrivateEndpoints? privateEndpoints;

  /// A list of reserved ip ranges under the VPC network that can be used for
  /// this DeployedIndex.
  ///
  /// If set, we will deploy the index within the provided ip ranges. Otherwise,
  /// the index might be deployed to any ip ranges under the provided VPC
  /// network. The value should be the name of the address
  /// (https://cloud.google.com/compute/docs/reference/rest/v1/addresses)
  /// Example: 'vertex-ai-ip-range'.
  final List<String>? reservedIpRanges;

  /// The deployment group can be no longer than 64 characters (eg: 'test',
  /// 'prod').
  ///
  /// If not set, we will use the 'default' deployment group. Creating
  /// `deployment_groups` with `reserved_ip_ranges` is a recommended practice
  /// when the peered network has multiple peering ranges. This creates your
  /// deployments from predictable IP spaces for easier traffic administration.
  /// Also, one deployment_group (except 'default') can only be used with the
  /// same reserved_ip_ranges which means if the deployment_group has been used
  /// with reserved_ip_ranges: \[a, b, c\], using it with \[a, b\] or \[d, e\]
  /// is disallowed. Note: we only support up to 5 deployment groups(not
  /// including 'default').
  final String deploymentGroup;

  /// If true, private endpoint's access logs are sent to Cloud Logging.
  ///
  /// These logs are like standard server access logs, containing information
  /// like timestamp and latency for each MatchRequest. Note that logs may incur
  /// a cost, especially if the deployed index receives a high queries per
  /// second rate (QPS). Estimate your costs before enabling this option.
  final bool enableAccessLogging;

  @override
  bool operator ==(covariant final VertexAIDeployedIndex other) {
    const listEquals = ListEquality<String>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            id == other.id &&
            index == other.index &&
            displayName == other.displayName &&
            createTime == other.createTime &&
            indexSyncTime == other.indexSyncTime &&
            automaticResources == other.automaticResources &&
            dedicatedResources == other.dedicatedResources &&
            deployedIndexAuthConfig == other.deployedIndexAuthConfig &&
            privateEndpoints == other.privateEndpoints &&
            listEquals.equals(reservedIpRanges, other.reservedIpRanges) &&
            deploymentGroup == other.deploymentGroup &&
            enableAccessLogging == other.enableAccessLogging;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      index.hashCode ^
      displayName.hashCode ^
      createTime.hashCode ^
      indexSyncTime.hashCode ^
      automaticResources.hashCode ^
      dedicatedResources.hashCode ^
      deployedIndexAuthConfig.hashCode ^
      privateEndpoints.hashCode ^
      const ListEquality<String>().hash(reservedIpRanges) ^
      deploymentGroup.hashCode ^
      enableAccessLogging.hashCode;

  @override
  String toString() {
    return 'VertexAIDeployedIndex{'
        'id: $id, '
        'index: $index, '
        'displayName: $displayName, '
        'createTime: $createTime, '
        'indexSyncTime: $indexSyncTime, '
        'automaticResources: $automaticResources, '
        'dedicatedResources: $dedicatedResources, '
        'deployedIndexAuthConfig: $deployedIndexAuthConfig, '
        'privateEndpoints: $privateEndpoints, '
        'reservedIpRanges: $reservedIpRanges, '
        'deploymentGroup: $deploymentGroup, '
        'enableAccessLogging: $enableAccessLogging}';
  }
}

/// {@template vertex_ai_automatic_resources}
/// A description of resources that to large degree are decided by Vertex AI,
/// and require only a modest additional configuration.
///
/// Each Model supporting these resources documents its specific guidelines.
/// {@endtemplate}
@immutable
class VertexAIAutomaticResources {
  /// {@macro vertex_ai_automatic_resources}
  const VertexAIAutomaticResources({
    required this.maxReplicaCount,
    required this.minReplicaCount,
  });

  /// The maximum number of replicas this DeployedModel may be deployed on when
  /// the traffic against it increases.
  ///
  /// If the requested value is too large, the deployment will error, but if
  /// deployment succeeds then the ability to scale the model to that many
  /// replicas is guaranteed (barring service outages). If traffic against the
  /// DeployedModel increases beyond what its replicas at maximum may handle, a
  /// portion of the traffic will be dropped. If this value is not provided, a
  /// no upper bound for scaling under heavy traffic will be assume, though
  /// Vertex AI may be unable to scale beyond certain replica number.
  final int maxReplicaCount;

  /// The minimum number of replicas this DeployedModel will be always deployed
  /// on.
  ///
  /// If traffic against it increases, it may dynamically be deployed onto more
  /// replicas up to max_replica_count, and as traffic decreases, some of these
  /// extra replicas may be freed. If the requested value is too large, the
  /// deployment will error.
  ///
  /// Immutable.
  final int minReplicaCount;

  @override
  bool operator ==(covariant final VertexAIAutomaticResources other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            maxReplicaCount == other.maxReplicaCount &&
            minReplicaCount == other.minReplicaCount;
  }

  @override
  int get hashCode => maxReplicaCount.hashCode ^ minReplicaCount.hashCode;

  @override
  String toString() {
    return 'VertexAIAutomaticResources{'
        'maxReplicaCount: $maxReplicaCount, '
        'minReplicaCount: $minReplicaCount}';
  }
}

/// {@template vertex_ai_dedicated_resources}
/// A description of resources that are dedicated to a DeployedModel, and that
/// need a higher degree of manual configuration.
/// {@endtemplate}
@immutable
class VertexAIDedicatedResources {
  /// {@macro vertex_ai_dedicated_resources}
  const VertexAIDedicatedResources({
    required this.autoscalingMetricSpecs,
    required this.machineSpec,
    required this.minReplicaCount,
    required this.maxReplicaCount,
  });

  /// The metric specifications that overrides a resource utilization metric
  /// (CPU utilization, accelerator's duty cycle, and so on) target value
  /// (default to 60 if not set).
  ///
  /// At most one entry is allowed per metric. If machine_spec.accelerator_count
  /// is above 0, the autoscaling will be based on both CPU utilization and
  /// accelerator's duty cycle metrics and scale up when either metrics exceeds
  /// its target value while scale down if both metrics are under their target
  /// value. The default target value is 60 for both metrics. If
  /// machine_spec.accelerator_count is 0, the autoscaling will be based on CPU
  /// utilization metric only with default target value 60 if not explicitly
  /// set. For example, in the case of Online Prediction, if you want to
  /// override target CPU utilization to 80, you should set
  /// autoscaling_metric_specs.metric_name to
  /// `aiplatform.googleapis.com/prediction/online/cpu/utilization` and
  /// autoscaling_metric_specs.target to `80`.
  final List<VertexAIAutoscalingMetricSpec> autoscalingMetricSpecs;

  /// The specification of a single machine used by the prediction.
  final VertexAIMachineSpec machineSpec;

  /// The maximum number of replicas this DeployedModel may be deployed on when
  /// the traffic against it increases.
  ///
  /// If the requested value is too large, the deployment will error, but if
  /// deployment succeeds then the ability to scale the model to that many
  /// replicas is guaranteed (barring service outages). If traffic against the
  /// DeployedModel increases beyond what its replicas at maximum may handle, a
  /// portion of the traffic will be dropped. If this value is not provided,
  /// will use min_replica_count as the default value. The value of this field
  /// impacts the charge against Vertex CPU and GPU quotas. Specifically, you
  /// will be charged for (max_replica_count * number of cores in the selected
  /// machine type) and (max_replica_count * number of GPUs per replica in the
  /// selected machine type).
  final int maxReplicaCount;

  /// The minimum number of machine replicas this DeployedModel will be always
  /// deployed on.
  ///
  /// This value must be greater than or equal to 1. If traffic against the
  /// DeployedModel increases, it may dynamically be deployed onto more
  /// replicas, and as traffic decreases, some of these extra replicas may be
  /// freed.
  final int minReplicaCount;

  @override
  bool operator ==(covariant final VertexAIDedicatedResources other) {
    const listEquals = ListEquality<VertexAIAutoscalingMetricSpec>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            listEquals.equals(
              autoscalingMetricSpecs,
              other.autoscalingMetricSpecs,
            ) &&
            machineSpec == other.machineSpec &&
            maxReplicaCount == other.maxReplicaCount &&
            minReplicaCount == other.minReplicaCount;
  }

  @override
  int get hashCode =>
      const ListEquality<VertexAIAutoscalingMetricSpec>()
          .hash(autoscalingMetricSpecs) ^
      machineSpec.hashCode ^
      maxReplicaCount.hashCode ^
      minReplicaCount.hashCode;

  @override
  String toString() {
    return 'VertexAIDedicatedResources{'
        'autoscalingMetricSpecs: $autoscalingMetricSpecs, '
        'machineSpec: $machineSpec, '
        'maxReplicaCount: $maxReplicaCount, '
        'minReplicaCount: $minReplicaCount}';
  }
}

/// {@template vertex_ai_autoscaling_metric_spec}
/// The metric specification that defines the target resource utilization (CPU
/// utilization, accelerator's duty cycle, and so on) for calculating the
/// desired replica count.
/// {@endtemplate}
@immutable
class VertexAIAutoscalingMetricSpec {
  /// {@macro vertex_ai_autoscaling_metric_spec}
  const VertexAIAutoscalingMetricSpec({
    required this.metricName,
    this.target = 60,
  });

  /// The resource metric name.
  ///
  /// Supported metrics: * For Online Prediction: *
  /// `aiplatform.googleapis.com/prediction/online/accelerator/duty_cycle` *
  /// `aiplatform.googleapis.com/prediction/online/cpu/utilization`
  final String metricName;

  /// The target resource utilization in percentage (1% - 100%) for the given
  /// metric; once the real usage deviates from the target by a certain
  /// percentage, the machine replicas change.
  ///
  /// The default value is 60 (representing 60%) if not provided.
  final int target;

  @override
  bool operator ==(covariant final VertexAIAutoscalingMetricSpec other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            metricName == other.metricName &&
            target == other.target;
  }

  @override
  int get hashCode => metricName.hashCode ^ target.hashCode;

  @override
  String toString() {
    return 'VertexAIAutoscalingMetricSpec{'
        'metricName: $metricName, '
        'target: $target}';
  }
}

/// {@template vertex_ai_machine_spec}
/// Specification of a single machine.
/// {@endtemplate}
@immutable
class VertexAIMachineSpec {
  /// {@macro vertex_ai_machine_spec}
  const VertexAIMachineSpec({
    required this.acceleratorCount,
    required this.acceleratorType,
    required this.machineType,
  });

  /// The number of accelerators to attach to the machine.
  final int acceleratorCount;

  /// The type of accelerator(s) that may be attached to the machine as per
  /// accelerator_count.
  ///
  /// Possible string values are:
  /// - "ACCELERATOR_TYPE_UNSPECIFIED" : Unspecified accelerator type, which
  /// means no accelerator.
  /// - "NVIDIA_TESLA_K80" : Nvidia Tesla K80 GPU.
  /// - "NVIDIA_TESLA_P100" : Nvidia Tesla P100 GPU.
  /// - "NVIDIA_TESLA_V100" : Nvidia Tesla V100 GPU.
  /// - "NVIDIA_TESLA_P4" : Nvidia Tesla P4 GPU.
  /// - "NVIDIA_TESLA_T4" : Nvidia Tesla T4 GPU.
  /// - "NVIDIA_TESLA_A100" : Nvidia Tesla A100 GPU.
  /// - "NVIDIA_A100_80GB" : Nvidia A100 80GB GPU.
  /// - "NVIDIA_L4" : Nvidia L4 GPU.
  /// - "TPU_V2" : TPU v2.
  /// - "TPU_V3" : TPU v3.
  /// - "TPU_V4_POD" : TPU v4.
  final String acceleratorType;

  /// The type of the machine.
  ///
  /// See the
  /// [list of machine types supported for prediction](https://cloud.google.com/vertex-ai/docs/predictions/configure-compute#machine-types)
  /// See the
  /// [list of machine types supported for custom training](https://cloud.google.com/vertex-ai/docs/training/configure-compute#machine-types).
  /// For DeployedModel this field is optional, and the default value is
  /// `n1-standard-2`. For BatchPredictionJob or as part of WorkerPoolSpec this
  /// field is required.
  final String machineType;

  @override
  bool operator ==(covariant final VertexAIMachineSpec other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            acceleratorCount == other.acceleratorCount &&
            acceleratorType == other.acceleratorType &&
            machineType == other.machineType;
  }

  @override
  int get hashCode =>
      acceleratorCount.hashCode ^
      acceleratorType.hashCode ^
      machineType.hashCode;

  @override
  String toString() {
    return 'VertexAIMachineSpec{'
        'acceleratorCount: $acceleratorCount, '
        'acceleratorType: $acceleratorType, '
        'machineType: $machineType}';
  }
}

/// {@template vertex_ai_deployed_index_auth_config}
/// Used to set up the auth on the DeployedIndex's private endpoint.
/// {@endtemplate}
@immutable
class VertexAIDeployedIndexAuthConfig {
  /// {@macro vertex_ai_deployed_index_auth_config}
  const VertexAIDeployedIndexAuthConfig({
    required this.authProvider,
  });

  /// Defines the authentication provider that the DeployedIndex uses.
  final VertexAIDeployedIndexAuthConfigAuthProvider authProvider;

  @override
  bool operator ==(covariant final VertexAIDeployedIndexAuthConfig other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType && authProvider == other.authProvider;
  }

  @override
  int get hashCode => authProvider.hashCode;

  @override
  String toString() {
    return 'VertexAIDeployedIndexAuthConfig{'
        'authProvider: $authProvider}';
  }
}

/// {@template vertex_ai_deployed_index_auth_config_auth_provider}
/// Configuration for an authentication provider, including support for \[JSON
/// Web Token
/// (JWT)\](https://tools.ietf.org/html/draft-ietf-oauth-json-web-token-32).
/// {@endtemplate}
@immutable
class VertexAIDeployedIndexAuthConfigAuthProvider {
  /// {@macro vertex_ai_deployed_index_auth_config_auth_provider}
  const VertexAIDeployedIndexAuthConfigAuthProvider({
    required this.allowedIssuers,
    required this.audiences,
  });

  /// A list of allowed JWT issuers.
  ///
  /// Each entry must be a valid Google service account, in the following
  /// format: `service-account-name@project-id.iam.gserviceaccount.com`
  final List<String> allowedIssuers;

  /// The list of JWT
  /// [audiences](https://tools.ietf.org/html/draft-ietf-oauth-json-web-token-32#section-4.1.3).
  /// that are allowed to access. A JWT containing any of these audiences will
  /// be accepted.
  final List<String> audiences;

  @override
  bool operator ==(
    covariant final VertexAIDeployedIndexAuthConfigAuthProvider other,
  ) {
    const listEquals = ListEquality<String>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            listEquals.equals(allowedIssuers, other.allowedIssuers) &&
            listEquals.equals(audiences, other.audiences);
  }

  @override
  int get hashCode =>
      const ListEquality<String>().hash(allowedIssuers) ^
      const ListEquality<String>().hash(audiences);

  @override
  String toString() {
    return 'VertexAIDeployedIndexAuthConfigAuthProvider{'
        'allowedIssuers: $allowedIssuers, '
        'audiences: $audiences}';
  }
}

/// {@template vertex_ai_index_private_endpoints}
/// IndexPrivateEndpoints proto is used to provide paths for users to send
/// requests via private endpoints (e.g. private service access, private service
/// connect).
///
/// To send request via private service access, use match_grpc_address. To send
/// request via private service connect, use service_attachment.
/// {@endtemplate}
@immutable
class VertexAIIndexPrivateEndpoints {
  /// {@macro vertex_ai_index_private_endpoints}
  const VertexAIIndexPrivateEndpoints({
    required this.matchGrpcAddress,
    required this.serviceAttachment,
  });

  /// The ip address used to send match gRPC requests.
  final String matchGrpcAddress;

  /// The name of the service attachment resource.
  ///
  /// Populated if private service connect is enabled.
  final String serviceAttachment;

  @override
  bool operator ==(covariant final VertexAIIndexPrivateEndpoints other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            matchGrpcAddress == other.matchGrpcAddress &&
            serviceAttachment == other.serviceAttachment;
  }

  @override
  int get hashCode => matchGrpcAddress.hashCode ^ serviceAttachment.hashCode;

  @override
  String toString() {
    return 'VertexAIIndexPrivateEndpoints{'
        'matchGrpcAddress: $matchGrpcAddress, '
        'serviceAttachment: $serviceAttachment}';
  }
}

/// {@template vertex_ai_find_neighbors_request_query}
/// A query to find a number of the nearest neighbors (most similar vectors) of
/// a vector.
/// {@endtemplate}
@immutable
class VertexAIFindNeighborsRequestQuery {
  /// {@macro vertex_ai_find_neighbors_request_query}
  const VertexAIFindNeighborsRequestQuery({
    required this.datapoint,
    required this.neighborCount,
    this.approximateNeighborCount,
    this.fractionLeafNodesToSearchOverride,
    this.perCrowdingAttributeNeighborCount,
  });

  /// The datapoint/vector whose nearest neighbors should be searched for.
  final VertexAIIndexDatapoint datapoint;

  /// The number of nearest neighbors to be retrieved from database for each
  /// query.
  ///
  /// If not set, will use the default from the service configuration
  /// (https://cloud.google.com/vertex-ai/docs/matching-engine/configuring-indexes#nearest-neighbor-search-config).
  final int? neighborCount;

  /// The number of neighbors to find via approximate search before exact
  /// reordering is performed.
  ///
  /// If not set, the default value from scam config is used; if set, this value
  /// must be \> 0.
  final int? approximateNeighborCount;

  /// The fraction of the number of leaves to search, set at query time allows
  /// user to tune search performance.
  ///
  /// This value increase result in both search accuracy and latency increase.
  /// The value should be between 0.0 and 1.0. If not set or set to 0.0, query
  /// uses the default value specified in
  /// NearestNeighborSearchConfig.TreeAHConfig.fraction_leaf_nodes_to_search.
  final double? fractionLeafNodesToSearchOverride;

  /// Crowding is a constraint on a neighbor list produced by nearest neighbor
  /// search requiring that no more than some value k' of the k neighbors
  /// returned have the same value of crowding_attribute.
  ///
  /// It's used for improving result diversity. This field is the maximum number
  /// of matches with the same crowding tag.
  final int? perCrowdingAttributeNeighborCount;

  @override
  bool operator ==(covariant final VertexAIFindNeighborsRequestQuery other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            datapoint == other.datapoint &&
            neighborCount == other.neighborCount &&
            approximateNeighborCount == other.approximateNeighborCount &&
            fractionLeafNodesToSearchOverride ==
                other.fractionLeafNodesToSearchOverride &&
            perCrowdingAttributeNeighborCount ==
                other.perCrowdingAttributeNeighborCount;
  }

  @override
  int get hashCode =>
      datapoint.hashCode ^
      neighborCount.hashCode ^
      approximateNeighborCount.hashCode ^
      fractionLeafNodesToSearchOverride.hashCode ^
      perCrowdingAttributeNeighborCount.hashCode;

  @override
  String toString() {
    return 'VertexAIFindNeighborsRequestQuery{'
        'datapoint: $datapoint, '
        'neighborCount: $neighborCount, '
        'approximateNeighborCount: $approximateNeighborCount, '
        'fractionLeafNodesToSearchOverride: $fractionLeafNodesToSearchOverride, '
        'perCrowdingAttributeNeighborCount: $perCrowdingAttributeNeighborCount}';
  }
}

/// {@template vertex_ai_find_neighbors_response}
/// The response message for MatchService.FindNeighbors.
/// {@endtemplate}
@immutable
class VertexAIFindNeighborsResponse {
  /// {@macro vertex_ai_find_neighbors_response}
  const VertexAIFindNeighborsResponse({
    required this.nearestNeighbors,
  });

  /// The nearest neighbors of the query datapoints.
  final List<VertexAIFindNeighborsResponseNearestNeighbors> nearestNeighbors;

  @override
  bool operator ==(covariant final VertexAIFindNeighborsResponse other) {
    const listEquals =
        ListEquality<VertexAIFindNeighborsResponseNearestNeighbors>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            listEquals.equals(nearestNeighbors, other.nearestNeighbors);
  }

  @override
  int get hashCode =>
      const ListEquality<VertexAIFindNeighborsResponseNearestNeighbors>()
          .hash(nearestNeighbors);

  @override
  String toString() {
    return 'VertexAIFindNeighborsResponse{'
        'nearestNeighbors: $nearestNeighbors}';
  }
}

/// {@template vertex_ai_find_neighbors_response_nearest_neighbors}
/// Nearest neighbors for one query.
/// {@endtemplate}
@immutable
class VertexAIFindNeighborsResponseNearestNeighbors {
  /// {@macro vertex_ai_find_neighbors_response_nearest_neighbors}
  const VertexAIFindNeighborsResponseNearestNeighbors({
    required this.id,
    required this.neighbors,
  });

  /// The ID of the query datapoint.
  final String id;

  /// All its neighbors.
  final List<VertexAIFindNeighborsResponseNeighbor> neighbors;

  @override
  bool operator ==(
    covariant final VertexAIFindNeighborsResponseNearestNeighbors other,
  ) {
    const listEquals = ListEquality<VertexAIFindNeighborsResponseNeighbor>();
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            id == other.id &&
            listEquals.equals(neighbors, other.neighbors);
  }

  @override
  int get hashCode =>
      id.hashCode ^
      const ListEquality<VertexAIFindNeighborsResponseNeighbor>()
          .hash(neighbors);

  @override
  String toString() {
    return 'VertexAIFindNeighborsResponseNearestNeighbors{'
        'id: $id, '
        'neighbors: $neighbors}';
  }
}

/// {@template vertex_ai_find_neighbors_response_neighbor}
/// A neighbor of the query vector.
/// {@endtemplate}
@immutable
class VertexAIFindNeighborsResponseNeighbor {
  /// {@macro vertex_ai_find_neighbors_response_neighbor}
  const VertexAIFindNeighborsResponseNeighbor({
    required this.datapoint,
    required this.distance,
  });

  /// The datapoint of the neighbor.
  ///
  /// Note that full datapoints are returned only when "return_full_datapoint"
  /// is set to true. Otherwise, only the "datapoint_id" and "crowding_tag"
  /// fields are populated.
  final VertexAIIndexDatapoint datapoint;

  /// The distance between the neighbor and the query vector.
  final double distance;

  @override
  bool operator ==(
    covariant final VertexAIFindNeighborsResponseNeighbor other,
  ) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            datapoint == other.datapoint &&
            distance == other.distance;
  }

  @override
  int get hashCode => datapoint.hashCode ^ distance.hashCode;

  @override
  String toString() {
    return 'VertexAIFindNeighborsResponseNeighbor{'
        'datapoint: $datapoint, '
        'distance: $distance}';
  }
}
