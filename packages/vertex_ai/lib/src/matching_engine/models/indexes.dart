// ignore_for_file: avoid_unused_constructor_parameters
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../../../vertex_ai.dart';

/// {@template vertex_ai_index}
/// A Vertex AI Index.
/// {@endtemplate}
@immutable
class VertexAIIndex {
  /// {@macro vertex_ai_index}
  const VertexAIIndex({
    required this.name,
    required this.displayName,
    required this.description,
    required this.metadataSchemaUri,
    required this.metadata,
    required this.indexUpdateMethod,
    required this.indexStats,
    required this.deployedIndexes,
    required this.labels,
    required this.etag,
    required this.createTime,
    required this.updateTime,
  });

  /// The index ID.
  String get id => name.split('/').last;

  /// The resource name of the Index.
  final String name;

  /// The display name of the Index.
  ///
  /// The name can be up to 128 characters long and can consist of any UTF-8
  /// characters.
  final String displayName;

  /// The description of the Index.
  final String description;

  /// Points to a YAML file stored on Google Cloud Storage describing
  /// additional information about the Index, that is specific to it.
  final String metadataSchemaUri;

  /// An additional information about the Index.
  final VertexAIIndexMetadata metadata;

  /// The update method to use with this Index.
  final VertexAIIndexUpdateMethod indexUpdateMethod;

  /// The statistics of the Index.
  final VertexAIIndexStats? indexStats;

  /// The pointers to [VertexAIDeployedIndex] created from this Index.
  ///
  /// An Index can be only deleted if all its [VertexAIDeployedIndex] had been
  /// undeployed first.
  final List<VertexAIDeployedIndexRef> deployedIndexes;

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

  /// Timestamp when this Index was created.
  final DateTime createTime;

  /// Timestamp when this Index was most recently updated.
  ///
  /// This also includes any update to the contents of the Index. Note that
  /// Operations working on this Index may have their
  /// Operations.metadata.generic_metadata.update_time a little after the
  /// value of this timestamp, yet that does not mean their results are not
  /// already reflected in the Index. Result of any successfully completed
  /// Operation on the Index is reflected in it.
  final DateTime updateTime;

  @override
  bool operator ==(covariant final VertexAIIndex other) {
    final listEquals = const ListEquality<VertexAIDeployedIndexRef>().equals;
    final mapEquals = const MapEquality<String, String>().equals;
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            name == other.name &&
            displayName == other.displayName &&
            description == other.description &&
            metadataSchemaUri == other.metadataSchemaUri &&
            metadata == other.metadata &&
            indexUpdateMethod == other.indexUpdateMethod &&
            indexStats == other.indexStats &&
            listEquals(deployedIndexes, other.deployedIndexes) &&
            mapEquals(labels, other.labels) &&
            etag == other.etag &&
            createTime == other.createTime &&
            updateTime == other.updateTime;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      displayName.hashCode ^
      description.hashCode ^
      metadataSchemaUri.hashCode ^
      metadata.hashCode ^
      indexUpdateMethod.hashCode ^
      indexStats.hashCode ^
      const ListEquality<VertexAIDeployedIndexRef>().hash(deployedIndexes) ^
      const MapEquality<String, String>().hash(labels) ^
      etag.hashCode ^
      createTime.hashCode ^
      updateTime.hashCode;

  @override
  String toString() {
    return 'VertexAIIndex{'
        'name: $name, '
        'displayName: $displayName, '
        'description: $description, '
        'metadataSchemaUri: $metadataSchemaUri, '
        'metadata: $metadata, '
        'indexUpdateMethod: $indexUpdateMethod, '
        'indexStats: $indexStats, '
        'deployedIndexes: $deployedIndexes, '
        'labels: $labels, '
        'etag: $etag, '
        'createTime: $createTime, '
        'updateTime: $updateTime}';
  }
}

/// {@template vertex_ai_index_request_metadata}
/// Metadata required to create or update a Vertex AI Index.
/// {@endtemplate}
@immutable
class VertexAIIndexRequestMetadata {
  /// {@macro vertex_ai_index_request_metadata}
  const VertexAIIndexRequestMetadata({
    this.contentsDeltaUri,
    this.isCompleteOverwrite = false,
    this.config,
  });

  /// Allows inserting, updating or deleting the contents of the Matching
  /// Engine Index. The string must be a valid Cloud Storage directory path,
  /// such as `gs://BUCKET_NAME/PATH_TO_INDEX_DIR/`.
  ///
  /// If you set this field when updating an index, then no other field can be
  /// also updated as part of the same call.
  final String? contentsDeltaUri;

  /// If this field is set together with contentsDeltaUri when updating an
  /// index, then existing content of the index will be replaced by the data
  /// from the [contentsDeltaUri].
  final bool isCompleteOverwrite;

  /// The configuration of the Matching Engine Index.
  final VertexAINearestNeighborSearchConfig? config;

  /// Converts a [VertexAIIndexRequestMetadata] to a [Map].
  Map<String, dynamic> toMap() {
    return {
      'contentsDeltaUri': contentsDeltaUri,
      'isCompleteOverwrite': isCompleteOverwrite,
      'config': config?.toMap(),
    };
  }

  @override
  bool operator ==(covariant final VertexAIIndexRequestMetadata other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          contentsDeltaUri == other.contentsDeltaUri &&
          isCompleteOverwrite == other.isCompleteOverwrite &&
          config == other.config;

  @override
  int get hashCode =>
      contentsDeltaUri.hashCode ^
      isCompleteOverwrite.hashCode ^
      config.hashCode;

  @override
  String toString() {
    return 'VertexAIIndexRequestMetadata{'
        'contentsDeltaUri: $contentsDeltaUri, '
        'isCompleteOverwrite: $isCompleteOverwrite, '
        'config: $config}';
  }
}

/// {@template vertex_ai_index_metadata}
/// A Vertex AI Nearest Neighbor Search Index Metadata.
/// {@endtemplate}
@immutable
class VertexAIIndexMetadata {
  /// {@macro vertex_ai_index_metadata}
  const VertexAIIndexMetadata({
    required this.config,
  });

  /// The configuration of the Matching Engine Index.
  final VertexAINearestNeighborSearchConfig config;

  /// Factory method to create a [VertexAIIndexMetadata].
  factory VertexAIIndexMetadata.fromMap(
    final Map<String, dynamic> map,
  ) {
    return VertexAIIndexMetadata(
      config: VertexAINearestNeighborSearchConfig.fromMap(
        map['config'] as Map<String, dynamic>? ?? const {},
      ),
    );
  }

  @override
  bool operator ==(covariant final VertexAIIndexMetadata other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && config == other.config;

  @override
  int get hashCode => config.hashCode;

  @override
  String toString() {
    return 'VertexAIIndexMetadata{config: $config}';
  }
}

/// {@template vertex_ai_nearest_neighbor_search_config}
/// The configuration of the Matching Engine Index.
/// {@endtemplate}
@immutable
class VertexAINearestNeighborSearchConfig {
  /// {@macro vertex_ai_nearest_neighbor_search_config}
  const VertexAINearestNeighborSearchConfig({
    required this.dimensions,
    this.approximateNeighborsCount = 150,
    this.distanceMeasureType = VertexAIDistanceMeasureType.dotProductDistance,
    this.featureNormType = VertexAIFeatureNormType.none,
    required this.algorithmConfig,
    this.shardSize = VertexAIShardSize.medium,
  });

  /// The number of dimensions of the input vectors.
  final int dimensions;

  /// Required if tree-AH algorithm is used.
  ///
  /// The default number of neighbors to find through approximate search before
  /// exact reordering is performed. Exact reordering is a procedure where
  /// results returned by an approximate search algorithm are reordered via a
  /// more expensive distance computation.
  final int? approximateNeighborsCount;

  /// The distance measure used in nearest neighbor search.
  final VertexAIDistanceMeasureType distanceMeasureType;

  /// Type of normalization to be carried out on each vector.
  final VertexAIFeatureNormType featureNormType;

  /// The configuration for the algorithms that Matching Engine uses for
  /// efficient search.
  ///
  /// - [VertexAITreeAhAlgorithmConfig] Configuration options for using the
  ///   tree-AH algorithm. Refer to this blog for more details:
  ///   https://cloud.google.com/blog/products/ai-machine-learning/scaling-deep-retrieval-tensorflow-two-towers-architecture
  /// - [VertexAIBruteForceAlgorithmConfig] This option implements the standard
  ///   linear search in the database for each query. There are no fields to
  ///   configure for a brute force search.
  final VertexAIAlgorithmConfig algorithmConfig;

  /// Machine type to use when you deploy your index.
  final VertexAIShardSize shardSize;

  /// Factory method to create a [VertexAINearestNeighborSearchConfig].
  factory VertexAINearestNeighborSearchConfig.fromMap(
    final Map<String, dynamic> map,
  ) {
    return VertexAINearestNeighborSearchConfig(
      dimensions: map['dimensions'] as int,
      approximateNeighborsCount: map['approximateNeighborsCount'] as int?,
      distanceMeasureType: VertexAIDistanceMeasureType.values.firstWhere(
        (final t) => t.id == map['distanceMeasureType'] as String,
      ),
      featureNormType: VertexAIFeatureNormType.values.firstWhere(
        (final t) => t.id == map['featureNormType'] as String,
      ),
      algorithmConfig: VertexAIAlgorithmConfig.fromMap(
        map['algorithmConfig'] as Map<String, dynamic>? ?? const {},
      ),
      shardSize: VertexAIShardSize.values.firstWhere(
        (final t) => t.id == map['shardSize'] as String,
      ),
    );
  }

  /// Converts a [VertexAINearestNeighborSearchConfig] to a [Map].
  Map<String, dynamic> toMap() {
    return {
      'dimensions': dimensions,
      'approximateNeighborsCount': approximateNeighborsCount,
      'distanceMeasureType': distanceMeasureType.id,
      'featureNormType': featureNormType.id,
      'algorithmConfig': algorithmConfig.toMap(),
      'shardSize': shardSize.id,
    };
  }

  @override
  bool operator ==(covariant final VertexAINearestNeighborSearchConfig other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          dimensions == other.dimensions &&
          approximateNeighborsCount == other.approximateNeighborsCount &&
          distanceMeasureType == other.distanceMeasureType &&
          featureNormType == other.featureNormType &&
          algorithmConfig == other.algorithmConfig &&
          shardSize == other.shardSize;

  @override
  int get hashCode =>
      dimensions.hashCode ^
      approximateNeighborsCount.hashCode ^
      distanceMeasureType.hashCode ^
      featureNormType.hashCode ^
      algorithmConfig.hashCode ^
      shardSize.hashCode;

  @override
  String toString() {
    return 'VertexAINearestNeighborSearchConfig{'
        'dimensions: $dimensions, '
        'approximateNeighborsCount: $approximateNeighborsCount, '
        'distanceMeasureType: $distanceMeasureType, '
        'featureNormType: $featureNormType, '
        'algorithmConfig: $algorithmConfig, '
        'shardSize: $shardSize}';
  }
}

/// {@template vertex_ai_distance_measure_type}
/// The distance measure used in nearest neighbor search.
/// {@endtemplate}
enum VertexAIDistanceMeasureType {
  /// Euclidean (L2) Distance
  squaredL2Distance('SQUARED_L2_DISTANCE'),

  /// Manhattan (L1) Distance
  l1Distance('L1_DISTANCE'),

  /// Defined as a negative of the dot product (recommended)
  dotProductDistance('DOT_PRODUCT_DISTANCE'),

  /// Cosine Distance.
  cosineDistance('COSINE_DISTANCE');

  /// {@macro vertex_ai_distance_measure_type}
  const VertexAIDistanceMeasureType(this.id);

  /// The id of the distance measure type.
  final String id;

  @override
  String toString() => id;
}

/// {@template vertex_ai_feature_norm_type}
/// Type of normalization to be carried out on each vector.
/// {@endtemplate}
enum VertexAIFeatureNormType {
  /// Unit L2 normalization type.
  unitL2Norm('UNIT_L2_NORM'),

  /// No normalization type is specified.
  none('NONE');

  /// {@macro vertex_ai_feature_norm_type}
  const VertexAIFeatureNormType(this.id);

  /// The id of the normalization type.
  final String id;

  @override
  String toString() => id;
}

/// {@template vertex_ai_shard_size}
/// Index data is split into equal parts to be processed. These are called
/// "shards". When you create an index you must specify the shard size.
/// Once you create the index, you can determine what machine type to use
/// when you deploy your index.
/// {@endtemplate}
enum VertexAIShardSize {
  /// e2-standard-2 (2GB)
  small('SHARD_SIZE_SMALL'),

  /// e2-standard-16 (20GB)
  medium('SHARD_SIZE_MEDIUM'),

  /// e2-highmem-16 (50GB)
  large('SHARD_SIZE_LARGE');

  /// {@macro vertex_ai_feature_norm_type}
  const VertexAIShardSize(this.id);

  /// The id of the shard size.
  final String id;

  @override
  String toString() => id;
}

/// {@template vertex_ai_algorithm_config}
/// The configuration with regard to the algorithms used for efficient search.
/// {@endtemplate}
@immutable
sealed class VertexAIAlgorithmConfig {
  /// {@macro vertex_ai_algorithm_config}
  const VertexAIAlgorithmConfig({required this.type});

  /// The type of algorithm used for efficient search.
  final String type;

  /// Factory constructor for [VertexAIAlgorithmConfig].
  factory VertexAIAlgorithmConfig.fromMap(final Map<String, dynamic> map) {
    final type = map.keys.first;
    final config = map[type] as Map<String, dynamic>? ?? const {};
    switch (type) {
      case 'treeAhConfig':
        return VertexAITreeAhAlgorithmConfig.fromMap(config);
      case 'bruteForceConfig':
        return VertexAIBruteForceAlgorithmConfig.fromMap(config);
      default:
        throw ArgumentError.value(
          type,
          'type',
          'Invalid algorithm type: $type',
        );
    }
  }

  /// Converts the [VertexAIAlgorithmConfig] to a [Map].
  Map<String, dynamic> toMap() {
    return {
      type: toConfigMap(),
    };
  }

  /// Converts the actual config to a [Map].
  Map<String, dynamic> toConfigMap();
}

/// {@template vertex_ai_tree_ah_config}
/// Tree-AH efficient search algorithm.
/// {@endtemplate}
@immutable
class VertexAITreeAhAlgorithmConfig extends VertexAIAlgorithmConfig {
  /// {@macro vertex_ai_tree_ah_config}
  const VertexAITreeAhAlgorithmConfig({
    this.fractionLeafNodesToSearch = 0.05,
    this.leafNodeEmbeddingCount = 1000,
    this.leafNodesToSearchPercent = 10,
  }) : super(type: 'treeAhConfig');

  /// The default fraction of leaf nodes that any query may be searched.
  ///
  /// Must be in range `(0.0, 1.0)`.
  final double fractionLeafNodesToSearch;

  /// Number of embeddings on each leaf node.
  final int leafNodeEmbeddingCount;

  /// The default percentage of leaf nodes that any query may be searched.
  ///
  /// Must be in the range `[1, 100]`.
  final int leafNodesToSearchPercent;

  /// Factory constructor for creating a new [VertexAITreeAhAlgorithmConfig]
  factory VertexAITreeAhAlgorithmConfig.fromMap(
    final Map<String, dynamic> map,
  ) {
    return VertexAITreeAhAlgorithmConfig(
      fractionLeafNodesToSearch: map['fractionLeafNodesToSearch'] as double,
      leafNodeEmbeddingCount: int.parse(
        // the API returns a string instead of an int
        map['leafNodeEmbeddingCount'].toString(),
      ),
      leafNodesToSearchPercent: map['leafNodesToSearchPercent'] as int,
    );
  }

  @override
  Map<String, dynamic> toConfigMap() {
    return {
      'fractionLeafNodesToSearch': fractionLeafNodesToSearch,
      'leafNodeEmbeddingCount': leafNodeEmbeddingCount,
      'leafNodesToSearchPercent': leafNodesToSearchPercent,
    };
  }

  @override
  bool operator ==(covariant final VertexAITreeAhAlgorithmConfig other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          fractionLeafNodesToSearch == other.fractionLeafNodesToSearch &&
          leafNodeEmbeddingCount == other.leafNodeEmbeddingCount &&
          leafNodesToSearchPercent == other.leafNodesToSearchPercent;

  @override
  int get hashCode =>
      fractionLeafNodesToSearch.hashCode ^
      leafNodeEmbeddingCount.hashCode ^
      leafNodesToSearchPercent.hashCode;

  @override
  String toString() {
    return 'VertexAITreeAhAlgorithmConfig{'
        'fractionLeafNodesToSearch: $fractionLeafNodesToSearch, '
        'leafNodeEmbeddingCount: $leafNodeEmbeddingCount, '
        'leafNodesToSearchPercent: $leafNodesToSearchPercent}';
  }
}

/// {@template vertex_ai_brute_force_config}
/// Configuration options for using brute force search, which simply implements
/// the standard linear search in the database for each query.
///
/// Use this algorithm only for development or small datasets (less that 100k
/// documents), since it is computationally expensive.
/// {@endtemplate}
@immutable
class VertexAIBruteForceAlgorithmConfig extends VertexAIAlgorithmConfig {
  /// {@macro vertex_ai_brute_force_config}
  const VertexAIBruteForceAlgorithmConfig() : super(type: 'bruteForceConfig');

  /// Factory constructor for creating a new [VertexAIBruteForceAlgorithmConfig]
  factory VertexAIBruteForceAlgorithmConfig.fromMap(
    final Map<String, dynamic> map,
  ) {
    return const VertexAIBruteForceAlgorithmConfig();
  }

  @override
  Map<String, dynamic> toConfigMap() {
    return const {};
  }

  @override
  bool operator ==(covariant final VertexAIBruteForceAlgorithmConfig other) =>
      identical(this, other) || runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  @override
  String toString() {
    return 'VertexAIBruteForceAlgorithmConfig{}';
  }
}

/// {@template vertex_ai_index_update_method}
/// The update method to use with this Index.
/// {@endtemplate}
enum VertexAIIndexUpdateMethod {
  /// The user can update the index with files on Cloud Storage of datapoints
  /// to update.
  batchUpdate('BATCH_UPDATE'),

  /// The user can call UpsertDatapoints/DeleteDatapoints to update the Index
  /// and the updates will be applied in corresponding DeployedIndexes in
  /// nearly real-time.
  streamUpdate('STREAM_UPDATE');

  /// {@macro vertex_ai_index_update_method}
  const VertexAIIndexUpdateMethod(this.id);

  /// The id of the update method.
  final String id;

  @override
  String toString() => id;
}

/// {@template vertex_ai_index_stats}
/// The statistics of a Vertex AI Index.
/// {@endtemplate}
@immutable
class VertexAIIndexStats {
  /// {@macro vertex_ai_index_stats}
  const VertexAIIndexStats({
    required this.shardsCount,
    required this.vectorsCount,
  });

  /// The number of shards in the index.
  final int shardsCount;

  /// The number of vectors in the index.
  final int vectorsCount;

  @override
  bool operator ==(covariant final VertexAIIndexStats other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          shardsCount == other.shardsCount &&
          vectorsCount == other.vectorsCount;

  @override
  int get hashCode => shardsCount.hashCode ^ vectorsCount.hashCode;

  @override
  String toString() {
    return 'VertexAIIndexStats{'
        'shardsCount: $shardsCount, '
        'vectorsCount: $vectorsCount}';
  }
}

/// {@template vertex_ai_deployed_index_ref}
/// Points to a [VertexAIDeployedIndex].
/// {@endtemplate}
@immutable
class VertexAIDeployedIndexRef {
  /// {@macro vertex_ai_deployed_index_ref}
  const VertexAIDeployedIndexRef({
    required this.deployedIndexId,
    required this.indexEndpoint,
  });

  /// The ID of the [VertexAIDeployedIndex] in the index endpoint.
  final String deployedIndexId;

  /// A resource name of the index endpoint.
  final String indexEndpoint;

  /// The ID of the index endpoint.
  String get indexEndpointId => indexEndpoint.split('/').last;

  @override
  bool operator ==(covariant final VertexAIDeployedIndexRef other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          deployedIndexId == other.deployedIndexId &&
          indexEndpoint == other.indexEndpoint;

  @override
  int get hashCode => deployedIndexId.hashCode ^ indexEndpoint.hashCode;

  @override
  String toString() {
    return 'VertexAIDeployedIndexRef{'
        'deployedIndexId: $deployedIndexId, '
        'indexEndpoint: $indexEndpoint}';
  }
}

/// {@template vertex_ai_index_datapoint}
/// A datapoint of Index.
/// {@endtemplate}
@immutable
class VertexAIIndexDatapoint {
  /// {@macro vertex_ai_index_datapoint}
  const VertexAIIndexDatapoint({
    required this.datapointId,
    required this.featureVector,
    this.crowdingTag,
    this.restricts,
  });

  /// Unique identifier of the datapoint.
  final String datapointId;

  /// Feature embedding vector.
  final List<double> featureVector;

  /// CrowdingTag of the datapoint, the number of neighbors to return in each
  /// crowding can be configured during query.
  final VertexAIIndexDatapointCrowdingTag? crowdingTag;

  /// List of Restrict of the datapoint, used to perform "restricted searches"
  /// where boolean rule are used to filter the subset of the database eligible
  /// for matching.
  ///
  /// See: https://cloud.google.com/vertex-ai/docs/matching-engine/filtering
  final List<VertexAIIndexDatapointRestriction>? restricts;

  @override
  bool operator ==(covariant final VertexAIIndexDatapoint other) {
    final listEquals = const ListEquality<double>().equals;
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            datapointId == other.datapointId &&
            listEquals(featureVector, other.featureVector) &&
            crowdingTag == other.crowdingTag &&
            const ListEquality<VertexAIIndexDatapointRestriction>()
                .equals(restricts, other.restricts);
  }

  @override
  int get hashCode =>
      datapointId.hashCode ^
      const ListEquality<double>().hash(featureVector) ^
      crowdingTag.hashCode ^
      const ListEquality<VertexAIIndexDatapointRestriction>().hash(restricts);

  @override
  String toString() {
    return 'VertexAIIndexDatapoint{'
        'datapointId: $datapointId, '
        'featureVector: $featureVector, '
        'crowdingTag: $crowdingTag, '
        'restricts: $restricts}';
  }
}

/// {@template vertex_ai_index_datapoint_crowding_tag}
/// Crowding tag is a constraint on a neighbor list produced by nearest neighbor
/// search requiring that no more than some value k' of the k neighbors returned
/// have the same value of crowding_attribute.
/// {@endtemplate}
@immutable
class VertexAIIndexDatapointCrowdingTag {
  /// {@macro vertex_ai_index_datapoint_crowding_tag}
  const VertexAIIndexDatapointCrowdingTag({
    required this.crowdingAttribute,
  });

  /// The attribute value used for crowding.
  ///
  /// The maximum number of neighbors to return per crowding attribute value
  /// (per_crowding_attribute_num_neighbors) is configured per-query. This field
  /// is ignored if per_crowding_attribute_num_neighbors is larger than the
  /// total number of neighbors to return for a given query.
  final String crowdingAttribute;

  @override
  bool operator ==(covariant final VertexAIIndexDatapointCrowdingTag other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            crowdingAttribute == other.crowdingAttribute;
  }

  @override
  int get hashCode => crowdingAttribute.hashCode;

  @override
  String toString() {
    return 'VertexAIIndexDatapointCrowdingTag{'
        'crowdingAttribute: $crowdingAttribute}';
  }
}

/// {@template vertex_ai_index_datapoint_restriction}
/// Restriction of a datapoint which describe its attributes(tokens) from each
/// of several attribute categories(namespaces).
/// {@endtemplate}
@immutable
class VertexAIIndexDatapointRestriction {
  /// {@macro vertex_ai_index_datapoint_restriction}
  const VertexAIIndexDatapointRestriction({
    required this.namespace,
    required this.allowList,
    required this.denyList,
  });

  /// The namespace of this restriction.
  ///
  /// eg: color.
  final String namespace;

  /// The attributes to allow in this namespace.
  ///
  /// eg: 'red'
  final List<String> allowList;

  /// The attributes to deny in this namespace.
  ///
  /// eg: 'blue'
  final List<String> denyList;

  @override
  bool operator ==(covariant final VertexAIIndexDatapointRestriction other) {
    final listEquals = const ListEquality<String>().equals;
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            namespace == other.namespace &&
            listEquals(allowList, other.allowList) &&
            listEquals(denyList, other.denyList);
  }

  @override
  int get hashCode =>
      namespace.hashCode ^
      const ListEquality<String>().hash(allowList) ^
      const ListEquality<String>().hash(denyList);

  @override
  String toString() {
    return 'VertexAIIndexDatapointRestriction{'
        'namespace: $namespace, '
        'allowList: $allowList, '
        'denyList: $denyList}';
  }
}
