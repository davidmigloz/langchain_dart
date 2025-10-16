// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';

import 'package:gcloud/storage.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:vertex_ai/vertex_ai.dart';

/// Creates a Vertex AI Matching Engine index and index endpoint ready to be
/// used with LangChains.dart `VertexAIMatchingEngine` vector store.
///
/// Steps:
/// 1. Create a Cloud Storage bucket.
/// 2. Create a test document and upload it to the bucket: `/documents/0.json`
///    JSON structure: `{"id": "0", "pageContent": "...", "metadata": {}}`
/// 3. Create its embedding and place it in the bucket: /indexes/index.json
///    JSON structure: `{"id": "0", "embedding": [0.1, 0.2, 0.3, ...]}`
/// 4. Change the config below (`projectId`, `projectLocation`, etc.)
/// 5. Run this script.
/// 6. The script will output the configuration for `VertexAIMatchingEngine`.
void main(final List<String> arguments) async {
  // Config
  const projectId = 'my-project-id';
  const projectLocation = 'europe-west1';
  const indexName = 'my_index';
  const indexDescription = 'My index description';
  const bucketName = 'my_index_bucket';
  const embeddingsDimensions = 768;
  const shardSize = VertexAIShardSize.small;

  // Get authenticated HTTP client
  print('\n> Authenticating...');
  final serviceAccountCredentials = ServiceAccountCredentials.fromJson(
    json.decode(Platform.environment['VERTEX_AI_SERVICE_ACCOUNT']!),
  );
  final authClient = await clientViaServiceAccount(serviceAccountCredentials, [
    VertexAIGenAIClient.cloudPlatformScope,
    ...Storage.SCOPES,
  ]);

  // Get Vertex AI client
  print('\n> Creating client...');
  final marchingEngine = VertexAIMatchingEngineClient(
    httpClient: authClient,
    project: projectId,
    location: projectLocation,
  );

  // Create index
  print('\n> Creating index (takes around 30min)...');
  VertexAIOperation indexOperation = await marchingEngine.indexes.create(
    displayName: indexName,
    description: indexDescription,
    metadata: const VertexAIIndexRequestMetadata(
      contentsDeltaUri: 'gs://$bucketName/indexes',
      config: VertexAINearestNeighborSearchConfig(
        dimensions: embeddingsDimensions,
        algorithmConfig: VertexAIBruteForceAlgorithmConfig(),
        shardSize: shardSize,
      ),
    ),
  );

  // Poll for operation completion
  while (!indexOperation.done) {
    print('In progress...');
    await Future<void>.delayed(const Duration(seconds: 10));
    indexOperation = await marchingEngine.indexes.operations.get(
      name: indexOperation.name,
    );
  }

  // Create index endpoint
  print('\n> Creating index endpoint (takes around 1min)...');
  const indexEndpointName = '${indexName}_endpoint';
  VertexAIOperation indexEndpointOperation = await marchingEngine.indexEndpoints
      .create(
        displayName: indexEndpointName,
        description: 'Index endpoint of $indexName',
        publicEndpointEnabled: true,
      );

  // Poll for operation completion
  while (!indexEndpointOperation.done) {
    print('In progress...');
    await Future<void>.delayed(const Duration(seconds: 10));
    indexEndpointOperation = await marchingEngine.indexEndpoints.operations.get(
      name: indexEndpointOperation.name,
    );
  }

  // Get created index and endpoint
  print('\n> Getting index and endpoint...');
  final indexes = await marchingEngine.indexes.list();
  final index = indexes.firstWhere(
    (final index) => index.displayName == indexName,
  );
  final indexId = index.id;
  final indexEndpoints = await marchingEngine.indexEndpoints.list();
  final indexEndpoint = indexEndpoints.firstWhere(
    (final indexEndpoint) => indexEndpoint.displayName == indexEndpointName,
  );
  final indexEndpointId = indexEndpoint.id;
  print('Index ID: $indexId');
  print('Index endpoint ID: $indexEndpointId');

  // Deploy index to endpoint
  print('\n> Deploying index to endpoint (takes around 30min)...');
  VertexAIOperation deployOperation = await marchingEngine.indexEndpoints
      .deployIndex(
        indexId: indexId,
        indexEndpointId: indexEndpointId,
        deployedIndexId: '${indexName}_deployed',
        deployedIndexDisplayName: '${indexName}_deployed',
      );

  // Poll for operation completion
  while (!deployOperation.done) {
    print('In progress...');
    await Future<void>.delayed(const Duration(seconds: 10));
    deployOperation = await marchingEngine.indexEndpoints.operations.get(
      name: deployOperation.name,
    );
  }

  // Get deployed index
  print('\n> Index ready to be used!');
  print('You can now use it in LangChain.dart:');
  print('''
final vectorStore = VertexAIMatchingEngine(
  httpClient: authClient,
  project: '$projectId',
  location: '$projectLocation',
  queryRootUrl: 'http://${indexEndpoint.publicEndpointDomainName}/',
  indexId: '$indexId',
  gcsBucketName: '$bucketName',
  embeddings: embeddings,
);''');
}
