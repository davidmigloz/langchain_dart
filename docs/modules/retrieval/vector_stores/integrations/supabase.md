# Supabase

Vector store for [Supabase Vector](https://supabase.com/vector) embedding database.

It uses [`pgvector`](https://github.com/pgvector/pgvector) extension to store, query, and index vector embeddings in a Postgres database instance.

> [Supabase Vector Docs](https://supabase.com/docs/guides/ai)

## Setup

### Enable `pgvector` extension

1. Go to the [Database page](https://supabase.com/dashboard/project/_/database/tables) in the Dashboard.
2. Click on Extensions in the sidebar.
3. Search for "vector" and enable the extension.
4. Select "extensions" schema.

Alternatively, you can run the following SQL query in the [SQL editor](https://supabase.com/dashboard/project/_/sql):

```sql
 -- Example: enable the "vector" extension.
create extension vector
with
  schema extensions;
```

### Create a table to store vectors

After enabling the `vector` extension, you will get access to a new data type called `vector`. The size of the vector (indicated in parentheses) represents the number of dimensions stored in that vector.

Create a table to store the vectors:
 
```sql
create table documents (
  id bigserial primary key,
  content text,
  metadata jsonb,
  embedding vector(1536)
);
```

In the above SQL snippet, we create a `documents` table with the following columns:
- `id`: a unique identifier for each document. If the id is null, it will be auto-generated.
- `content`: the text content of the document (i.e. `Document.pageContent`).
- `metadata`: a JSON object containing metadata about the document (i.e. `Document.metadata`).
- `embedding`: the vector embedding of the document. In this example, we are using a vector generated using OpenAI's `text-embedding-3-small` embedding model, which produces 1536 dimensions. Change this to the number of dimensions produced by your embedding model. For example, if you are generating embeddings using the open source [gte-small](https://huggingface.co/Supabase/gte-small) model, you would set this number to 384 since that model produces 384 dimensions.

### Create Postgres function to query vectors

[`supabase`](https://pub.dev/packages/supabase) client (used internally by LangChain.dart) connects to your Postgres instance via [PostgREST](https://supabase.com/docs/guides/ai/docs/guides/getting-started/architecture#postgrest-api). PostgREST does not currently support `pgvector` similarity operators, so we need to implement a Postgres function `match_documents` that executes the query. This function will be called by LangChain.dart via the `rpc()` method.

```sql
create or replace function match_documents (
  query_embedding vector(1536),
  match_count int,
  match_threshold float,
  filter jsonb
) returns table (
  id bigint,
  content text,
  metadata jsonb,
  similarity float
)
language sql stable
as $$
  select
    documents.id,
    documents.content,
    documents.metadata,
    1 - (documents.embedding <=> query_embedding) as similarity
from documents
where metadata @> filter
  and 1 - (documents.embedding <=> query_embedding) > match_threshold
order by (documents.embedding <=> query_embedding) asc
    limit match_count;
$$;
```

This function takes a `query_embedding` argument and compares it to all other embeddings in the `documents` table. Each comparison returns a similarity score. If the similarity is greater than the `match_threshold` argument, it is returned. The number of rows returned is limited by the `match_count` argument.

Make sure to change the `vector(1536)` type to match the number of dimensions in your embedding model.

### Instantiate Supabase vector store

```dart
final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);
final vectorStore = Supabase(
  tableName: 'documents',
  embeddings: embeddings,
  supabaseUrl: supabaseUrl,
  supabaseKey: supabaseApiKey,
);
```

You can find your Supabase URL and API key in the [Project API Settings](https://supabase.com/dashboard/project/_/settings/api) page.

## Usage

### Storing vectors

```dart
final res = await vectorStore.addDocuments(
  documents: [
    const Document(
      pageContent: 'The cat sat on the mat',
      metadata: {'cat': 'animal'},
    ),
    const Document(
      pageContent: 'The dog chased the ball.',
      metadata: {'cat': 'animal'},
    ),
  ],
);
```

### Querying vectors

```dart
final res = await vectorStore.similaritySearch(
  query: 'Where is the cat?',
  config: const SupabaseSimilaritySearch(k: 1),
);
```

You can change the minimum similarity score threshold by setting the `scoreThreshold` parameter in the `SupabaseSimilaritySearch` config object.

#### Filtering

You can filter the query by metadata by setting the `filter` parameter in the `SupabaseSimilaritySearch` config object.

Metadata is stored as binary JSON. As a result, allowed metadata types are drawn from JSON primitive types (bool, String, num). 

The technical limit of a metadata field associated with a vector is 1GB. In practice, you should keep metadata fields as small as possible to maximize performance.

The metadata query language is based loosely on [mongodb's selectors](https://www.mongodb.com/docs/manual/reference/operator/query/). Check the [Supabase docs](https://supabase.com/docs/guides/ai/python/metadata#metadata-query-language) for more information.

```dart
final res = await vectorStore.similaritySearch(
  query: 'Where is the cat?',
  config: const SupabaseSimilaritySearch(
    k: 10,
    filter: {'cat': 'animal'},
  ),
);
```

Or using filtering operators:

```dart
final res = await vectorStore.similaritySearch(
  query: 'Where is the cat?',
  config: const SupabaseSimilaritySearch(
    k: 10,
    filter: {
      'cat': {r'ne': 'person'},
    },
  ),
);
```

### Deleting vectors

```dart
await vectorStore.delete(ids: ['9999']);
```

## Advance

### Indexes

Once your vector table starts to grow, you will likely want to add an index to speed up queries. See [Vector indexes](https://supabase.com/docs/guides/ai/vector-indexes) to learn how vector indexes work and how to create them.

### Changing the distance function

You can change the distance function of the embedding space by modifying the distance operator used in the Postgres function.

`pgvector` supports 3 operators for computing distance:
- `<=>`: Cosine distance
- `<->`: Euclidean distance
- `<#>`: Negative inner product
