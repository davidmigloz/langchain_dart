import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:supabase/supabase.dart';

/// {@template supabase}
/// Vector store for Supabase embedding database.
///
/// It assumes the database with the `pg_vector` extension,
/// containing a [tableName] (default: `documents`) and
/// a PostgreSQL function `match_documents` defined as follows:
///
/// ```sql
/// -- Enable the pgvector extension to work with embedding vectors
/// create extension vector;
///
/// -- Create a table to store your documents
/// create table documents (
///   id bigserial primary key, -- document id or null (it will be generated)
///   content text, -- corresponds to Document.pageContent
///   metadata jsonb, -- corresponds to Document.metadata
///   embedding vector null -- embedding vector
/// );
///
/// -- Create a function to search for documents
/// create function match_documents (
///   query_embedding vector(1536),
///   match_count int DEFAULT null,
///   filter jsonb DEFAULT '{}',
///   match_threshold float DEFAULT 0.0
/// ) returns table (
///   id bigint,
///   content text,
///   metadata jsonb,
///   embedding jsonb,
///   similarity float
/// )
/// language plpgsql
/// as $$
/// #variable_conflict use_column
/// begin
///   return query
///   select
///     id,
///     content,
///     metadata,
///     (embedding::text)::jsonb as embedding,
///     1 - (documents.embedding <=> query_embedding) as similarity
///   from documents
///   where metadata @> filter
///     and documents.embedding <=> query_embedding < 1 - match_threshold
///   order by documents.embedding <=> query_embedding
///   limit match_count;
/// end;
/// $$;
/// ```
///
/// See [Supabase documentation](https://supabase.com/blog/openai-embeddings-postgres-vector) for more details.
/// {@endtemplate}
class Supabase extends VectorStore {
  /// {@macro supabase}
  Supabase({
    required this.tableName,
    required final String supabaseKey,
    required final String supabaseUrl,
    final Map<String, String> headers = const {},
    final http.Client? client,
    required super.embeddings,
  }) : _client = SupabaseClient(
          supabaseUrl,
          supabaseKey,
          headers: headers,
          httpClient: client,
        );

  /// The Supabase client.
  final SupabaseClient _client;

  /// The Supabase table name.
  final String tableName;

  @override
  Future<List<String>> addVectors({
    required final List<List<double>> vectors,
    required final List<Document> documents,
  }) async {
    assert(vectors.length == documents.length);

    final List<Map<String, dynamic>> records = [];
    for (var i = 0; i < documents.length; i++) {
      final doc = documents[i];
      final id = doc.id;
      if (id != null) {
        records.add(
          {
            'id': id,
            'metadata': doc.metadata,
            'content': doc.pageContent,
            'embedding': vectors[i],
          },
        );
      } else {
        records.add(
          {
            'metadata': doc.metadata,
            'content': doc.pageContent,
            'embedding': vectors[i],
          },
        );
      }
    }

    final ids = await _client.from(tableName).upsert(records).select('id');
    return ids.map((final row) => row['id']).map((final id) => id.toString()).toList(growable: false);
  }

  @override
  Future<void> delete({required final List<String> ids}) {
    return _client.from(tableName).delete().filter('id', 'in', ids);
  }

  @override
  Future<List<(Document, double)>> similaritySearchByVectorWithScores({
    required final List<double> embedding,
    final VectorStoreSimilaritySearch config = const VectorStoreSimilaritySearch(),
  }) async {
    final params = {
      'query_embedding': embedding,
      'match_count': config.k,
      'filter': config.filter ?? {},
      'match_threshold': config.scoreThreshold ?? 0.0,
    };

    final List<dynamic> result = await _client.rpc(
      'match_documents',
      params: params,
    );
    return result
        .map((final row) => row as Map<String, dynamic>)
        .map(
          (final row) => (
            Document(
              id: row['id'].toString(),
              pageContent: row['content'] as String,
              metadata: row['metadata'] as Map<String, dynamic>,
            ),
            row['similarity'] as double,
          ),
        )
        .toList();
  }
}
