# Pinecone

Vector store for [Pinecone](https://www.pinecone.io/) vector database.

To use Pinecone, you must have an API key. To find your API key, open the Pinecone console and click API Keys.

Before using this vector store you need to create an index in Pinecone. You can do that in the Pinecone console or using a Pinecone API client. Check out the [Pinecone documentation](https://docs.pinecone.io/docs/choosing-index-type-and-size) for more information regarding index type and size.

After creating the index, configure the index name in the `indexName` parameter and the cloud region in the `environment` parameter.

```dart
final vectorStore = Pinecone(
  apiKey: pineconeApiKey,
  indexName: 'langchain-dart',
  environment: 'gcp-starter',
  embeddings: embeddings,
);
```

Pinecone indexes store records with vector data. Each record in a Pinecone index always contains a unique ID and an array of floats representing a dense vector embedding. It can also contain a sparse vector embedding for hybrid search and metadata key-value pairs for filtered queries.

When you add documents to the index using this class, the document's page content will be stored in the index's metadata. You can configure the metadata key in the `docPageContentKey` parameter.

Mind that Pinecone supports 40kb of metadata per vector.

You can organize the vectors added to an index into partitions, or "namespaces," to limit queries and other vector operations to only one such namespace at a time. You can configure the namespace in the `namespace` parameter.

### Filtering

Metadata filter expressions can be included with queries to limit the search to only vectors matching the filter expression.

For example:
```dart
final vectorStore = VectorStore(...);
final res = await vectorStore.similaritySearch(
  query: 'What should I feed my cat?',
  config: PineconeSimilaritySearch(
    k: 5,
    scoreThreshold: 0.8,
    filter: {'class: 'cat'},
  ),
);
```

Pinecone supports a wide range of operators for filtering. Check out the [filtering section](https://docs.pinecone.io/docs/metadata-filtering#metadata-query-language) of the Pinecone docs for more info.
