import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:supabase/supabase.dart';

/// {@template supabase}
/// Vector store for [Supabase Vector](https://supabase.com/vector)
/// embedding database.
///
/// It assumes a database with the `pg_vector` extension,
/// containing a [tableName] (default: `documents`) and
/// a [postgresFunctionName] (default: `match_documents`)
/// defined as follows:
///
/// ```sql
///  -- Enable the "vector" extension
/// create extension vector
/// with
///   schema extensions;
///
/// -- Create table to store the documents
/// create table documents (
///   id bigserial primary key,
///   content text,
///   metadata jsonb,
///   embedding vector(1536)
/// );
///
/// -- Create PostgreSQL function to query documents
/// create or replace function match_documents (
///   query_embedding vector(1536),
///   match_count int,
///   match_threshold float,
///   filter jsonb
/// ) returns table (
///   id bigint,
///   content text,
///   metadata jsonb,
///   similarity float
/// )
/// language sql stable
/// as $$
///   select
///     documents.id,
///     documents.content,
///     documents.metadata,
///     1 - (documents.embedding <=> query_embedding) as similarity
/// from documents
/// where metadata @> filter
///   and 1 - (documents.embedding <=> query_embedding) > match_threshold
/// order by (documents.embedding <=> query_embedding) asc
///     limit match_count;
/// $$;
/// ```
///
/// See documentation for more details:
/// - [LangChain.dart Supabase docs](https://langchaindart.com/#/modules/retrieval/vector_stores/integrations/supabase)
/// - [Supabase Vector docs](https://supabase.com/docs/guides/ai)
/// {@endtemplate}
class Supabase extends VectorStore {
  /// Creates a new [Supabase] instance.
  ///
  /// Main configuration options:
  /// - [tableName] (default: `documents`): the Supabase table name.
  /// - `supabaseUrl`: the Supabase URL. You can find it in your project's
  ///   [API settings](https://supabase.com/dashboard/project/_/settings/api).
  ///   E.g. `https://xyzcompany.supabase.co`.
  /// - `supabaseKey`: the Supabase API key. You can find it in your project's
  ///   [API settings](https://supabase.com/dashboard/project/_/settings/api).
  ///
  /// Advance configuration options:
  /// - `headers`: overrides the default Supabase client headers.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  Supabase({
    this.tableName = 'documents',
    required final String supabaseUrl,
    required final String supabaseKey,
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

  /// The name of the PostgreSQL function that executes the query.
  final String postgresFunctionName = 'match_documents';

  @override
  Future<List<String>> addVectors({
    required final List<List<double>> vectors,
    required final List<Document> documents,
  }) async {
    assert(vectors.length == documents.length);

    final List<Map<String, dynamic>> records = [];
    for (var i = 0; i < documents.length; i++) {
      final doc = documents[i];
      records.add(
        {
          if (doc.id != null) 'id': doc.id,
          'metadata': doc.metadata,
          'content': doc.pageContent,
          'embedding': vectors[i],
        },
      );
    }

    final ids = await _client.from(tableName).upsert(records).select('id');
    return ids
        .map((final row) => row['id'])
        .map((final id) => id.toString())
        .toList(growable: false);
  }

  @override
  Future<void> delete({required final List<String> ids}) {
    return _client.from(tableName).delete().filter('id', 'in', ids);
  }

  @override
  Future<List<(Document, double)>> similaritySearchByVectorWithScores({
    required final List<double> embedding,
    final VectorStoreSimilaritySearch config =
        const VectorStoreSimilaritySearch(),
  }) async {
    final params = {
      'query_embedding': embedding,
      'match_count': config.k,
      'match_threshold': config.scoreThreshold ?? 0.0,
      'filter': config.filter ?? {},
    };

    final List<dynamic> result = await _client.rpc(
      postgresFunctionName,
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
        .toList(growable: false);
  }
}
