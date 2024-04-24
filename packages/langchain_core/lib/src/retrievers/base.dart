import '../documents/document.dart';
import '../runnables/runnable.dart';
import '../utils/reduce.dart';
import 'types.dart';

/// {@template base_retriever}
/// Base Index class. All indexes should extend this class.
/// {@endtemplate}
abstract class Retriever<Options extends RetrieverOptions>
    extends Runnable<String, Options, List<Document>> {
  /// {@macro base_retriever}
  const Retriever({
    required super.defaultOptions,
  });

  /// Get the most relevant documents for a given query.
  ///
  /// - [input] - The query to search for.
  /// - [options] - Retrieval options.
  @override
  Future<List<Document>> invoke(
    final String input, {
    final Options? options,
  }) {
    return getRelevantDocuments(input, options: options);
  }

  /// Streams the most relevant documents for the query resulting from
  /// reducing the input stream.
  ///
  /// - [inputStream] - the input stream to reduce and use as the query.
  /// - [options] - Retrieval options.
  @override
  Stream<List<Document>> streamFromInputStream(
    final Stream<String> inputStream, {
    final Options? options,
  }) async* {
    final input = await inputStream.toList();
    final reduced = reduce<String>(input);
    yield* stream(reduced, options: options);
  }

  /// Get the most relevant documents for a given query.
  ///
  /// - [query] - The query to search for.
  /// - [options] - Retrieval options.
  Future<List<Document>> getRelevantDocuments(
    final String query, {
    final Options? options,
  });
}
