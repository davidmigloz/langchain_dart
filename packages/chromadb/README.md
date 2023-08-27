# Chroma Dart Client

[![tests](https://img.shields.io/github/actions/workflow/status/davidmigloz/langchain_dart/test.yaml?logo=github&label=tests)](https://github.com/davidmigloz/langchain_dart/actions/workflows/test.yaml)
[![chromadb](https://img.shields.io/pub/v/chromadb.svg)](https://pub.dev/packages/chromadb)
[![](https://dcbadge.vercel.app/api/server/x4qbhqecVR?style=flat)](https://discord.gg/x4qbhqecVR)
[![MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE)

Dart client for [Chroma](https://trychroma.com) embedding database.

## Features

- Create, list, get, modify and delete collections.
- Add, upsert, get, update, query, count, peek and delete items.
- Get version and heartbeat.
- Reset database.

## Usage

> Note: this is a quick overview of the client. For full API docs, see the 
> official [documentation](https://docs.trychroma.com).

### Run the server

Run `docker-compose up -d --build` to run a backend in Docker on your local  
computer.

### Initialize client

```dart
final client = ChromaClient();
```

By default, the client expect the server to be running on 
`http://localhost:8000`. You can change this by passing the `host` parameter.

### Methods on Client

#### Methods related to Collections

> Collections are similar to AWS s3 buckets in their naming requirements 
> because they are used in URLs in the REST API. Here's the [full list](https://docs.trychroma.com/usage-guide#creating-inspecting-and-deleting-collections).

```dart
// list all collections
await client.listCollections();

// make a new collection
final collection = await client.createCollection(name: 'testname');

// get an existing collection
final collection = await client.getCollection(name: 'testname');

// delete a collection
await client.deleteCollection(name: 'testname');
```

#### Utilities methods

```dart
// get Chroma version
final version = await client.version();

// get Chroma heartbeat
final heartbeat = await client.heartbeat();

// resets entire database - this *cant* be undone!
await client.reset();
```

### Methods on Collection

```dart
// get the number of items in a collection
await collection.count();

// add new items to a collection
// either one at a time
await collection.add(
  ids: ['id1'],
  embeddings: [[1.5, 2.9, 3.4]],
  metadatas: [{'source': 'my_source'}],
);

// or many, up to 100k+!
await collection.add(
  ids: ['uri9', 'uri10'],
  embeddings: [[1.5, 2.9, 3.4], [9.8, 2.3, 2.9]],
  metadatas: [{'style': 'style1'}, {'style': 'style2'}],
);

// including just documents 
// (you need to provide an EmbeddingFunction to the collection to be able
// to embed documents) 
await collection.add(
  ids: ['uri9', 'uri10'],
  documents: ['doc1000101', 'doc288822'],
  metadatas: [{'style': 'style1'}, {'style': 'style2'}],
);

// or use upsert, so records will be updated if they already exist
// (instead of throwing an error)
await collection.upsert(
  ids: ['id1'],
  embeddings: [[1.5, 2.9, 3.4]],
  metadatas: [{'source': 'my_source'}],
  documents: ['This is a document'],
);

// get items from a collection
final res = await collection.get();

// convenience, get first 5 items from a collection
await collection.peek();

// do nearest neighbor search to find similar embeddings or documents, supports filtering
await collection.query(
  queryEmbeddings: [[1.1, 2.3, 3.2], [5.1, 4.3, 2.2]],
  nResults: 2,
  where: {'style': 'style2'},
);

// delete items
await collection.delete();
```

## License

Chroma Dart Client is licensed under the [MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
