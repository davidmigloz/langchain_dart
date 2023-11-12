# Chroma

Vector store for [Chroma](https://www.trychroma.com/) open-source embedding database.

This vector stores requires Chroma to be running in client/server mode.

The server can run on your local computer via docker or be easily deployed to any cloud provider.

## Running Chroma in client/server mode

You can run a Chroma server in two ways:

### Using Python client 

The Python client supports spinning up a Chroma server easily:

```sh
pip install chromadb
chroma run --path /db_path
```

### Using Docker

Otherwise, you can run the Chroma server using Docker:

```sh
docker pull chromadb/chroma
docker run -p 8000:8000 chromadb/chroma
```

By default, the Chroma client will connect to a server running on `http://localhost:8000`. To connect to a different server, pass the `baseUrl` parameter to the constructor.

```dart
final vectorStore = Chroma(
  embeddings: OpenAIEmbeddings(apiKey: openaiApiKey),
  baseUrl: 'http://localhost:8888',
);
```

## Collections

Chroma lets you manage collections of embeddings, using the collection primitive.

You can configure the collection to use in the `collectionName` parameter.

You can also configure the metadata to associate with the collection in the `collectionMetadata` parameter.

## Changing the distance function

You can change the distance function of the embedding space by setting the value of `hnsw:space` in `collectionMetadata`. Valid options are "l2", "ip", or "cosine". The default is "l2".

## Filtering

Chroma supports filtering queries by metadata and document contents. The `where` filter is used to filter by metadata, and the `whereDocument` filter is used to filter by document contents.

For example:
```dart
final vectorStore = Chroma(...);
final res = await vectorStore.similaritySearch(
  query: 'What should I feed my cat?',
  config: ChromaSimilaritySearch(
    k: 5,
    scoreThreshold: 0.8,
    where: {'class: 'cat'},
  ),
);
```

Chroma supports a wide range of operators for filtering. Check out the [filtering section](https://docs.trychroma.com/usage-guide?lang=js#using-where-filters) of the Chroma docs for more info.
