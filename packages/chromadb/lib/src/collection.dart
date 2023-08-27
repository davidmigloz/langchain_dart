import 'embeddings/embedding_function.dart';
import 'generated/client.dart';
import 'generated/schema/schema.dart';

/// {@template collection}
/// Collections are where you'll store your embeddings, documents, and any
/// additional metadata.
/// {@endtemplate}
class Collection {
  /// {@macro collection}
  Collection({
    required this.name,
    required this.id,
    this.metadata,
    this.embeddingFunction,
    required final ChromaApiClient api,
  }) : _api = api;

  /// The name of the collection.
  final String name;

  /// The ID of the collection.
  final String id;

  /// The metadata of the collection.
  final Map<String, dynamic>? metadata;

  /// The embedding function of the collection.
  final EmbeddingFunction? embeddingFunction;

  /// The API client.
  final ChromaApiClient _api;

  /// Add items to the collection.
  ///
  /// - [ids] - IDs of the items to add.
  /// - [embeddings] - Optional embeddings of the items to add.
  /// - [metadatas] - Optional metadata of the items to add.
  /// - [documents] - Optional documents of the items to add.
  Future<void> add({
    required final List<String> ids,
    final List<List<double>>? embeddings,
    final List<Map<String, dynamic>>? metadatas,
    final List<String>? documents,
  }) async {
    final (
      idsList,
      embeddingsList,
      metadatasList,
      documentsList,
    ) = await _validate(
      ids,
      embeddings,
      metadatas,
      documents,
      requireEmbeddingsOrDocuments: true,
    );

    await _api.add(
      collectionId: id,
      request: AddEmbedding(
        ids: idsList,
        embeddings: embeddingsList,
        metadatas: metadatasList,
        documents: documentsList,
      ),
    );
  }

  /// Upsert items to the collection.
  ///
  /// - [ids] - IDs of the items to add.
  /// - [embeddings] - Optional embeddings of the items to add.
  /// - [metadatas] - Optional metadata of the items to add.
  /// - [documents] - Optional documents of the items to add.
  Future<void> upsert({
    required final List<String> ids,
    final List<List<double>>? embeddings,
    final List<Map<String, dynamic>>? metadatas,
    final List<String>? documents,
  }) async {
    final (
      idsList,
      embeddingsList,
      metadatasList,
      documentsList,
    ) = await _validate(
      ids,
      embeddings,
      metadatas,
      documents,
      requireEmbeddingsOrDocuments: true,
    );

    await _api.upsert(
      collectionId: id,
      request: AddEmbedding(
        ids: idsList,
        embeddings: embeddingsList,
        metadatas: metadatasList,
        documents: documentsList,
      ),
    );
  }

  /// Count the number of items in the collection.
  Future<int> count() {
    return _api.count(collectionId: id);
  }

  /// Modify the collection name or metadata.
  ///
  /// - [name] - Optional new name for the collection.
  /// - [metadata] - Optional new metadata for the collection.
  Future<void> modify({
    final String? name,
    final Map<String, dynamic>? metadata,
  }) async {
    await _api.updateCollection(
      collectionId: id,
      request: UpdateCollection(
        newName: name,
        newMetadata: metadata,
      ),
    );
  }

  /// Get items from the collection.
  ///
  /// - [ids] - Optional IDs of the items to get.
  /// - [where] - Optional where clause to filter items by.
  /// - [whereDocument] - Optional where clause to filter items by.
  /// - [limit] - Optional limit on the number of items to get.
  /// - [offset] - Optional offset on the items to get.
  /// - [include] - Optional list of items to include in the response.
  Future<GetResponse> get({
    final List<String>? ids,
    final Map<String, dynamic>? where,
    final Map<String, dynamic>? whereDocument,
    final int? limit,
    final int? offset,
    final List<Include> include = const [
      Include.documents,
      Include.embeddings,
      Include.metadatas,
    ],
  }) async {
    return _api.get(
      collectionId: id,
      request: GetEmbedding(
        ids: ids,
        where: where,
        whereDocument: whereDocument,
        limit: limit,
        offset: offset,
        include: include.map((final i) => i.name).toList(growable: false),
      ),
    );
  }

  /// Update the embeddings, documents, and/or metadatas of existing items.
  ///
  /// - [ids] - IDs of the items to update.
  /// - [embeddings] - Optional embeddings of the items to update.
  /// - [metadatas] - Optional metadata of the items to update.
  /// - [documents] - Optional documents of the items to update.
  Future<bool> update({
    required final List<String> ids,
    final List<List<double>>? embeddings,
    final List<Map<String, dynamic>>? metadatas,
    final List<String>? documents,
  }) async {
    final (
      idsList,
      embeddingsList,
      metadatasList,
      documentsList,
    ) = await _validate(
      ids,
      embeddings,
      metadatas,
      documents,
      requireEmbeddingsOrDocuments: false,
    );

    return _api.update(
      collectionId: id,
      request: UpdateEmbedding(
        ids: idsList,
        embeddings: embeddingsList,
        metadatas: metadatasList,
        documents: documentsList,
      ),
    );
  }

  /// Performs a query on the collection using the specified parameters.
  ///
  /// - [queryEmbeddings] - Optional query embeddings to use for the search.
  /// - [queryTexts] - Optional query text(s) to search for in the collection.
  /// - [nResults] - Optional number of results to return (default is 10).
  /// - [where] - Optional query condition to filter results based on metadata
  ///   values.
  /// - [whereDocument] - Optional query condition to filter results based on
  ///   document content.
  /// - [include] - Optional list of items to include in the response.
  Future<QueryResponse> query({
    final List<List<double>>? queryEmbeddings,
    final List<String>? queryTexts,
    final int nResults = 10,
    final Map<String, dynamic>? where,
    final Map<String, dynamic>? whereDocument,
    final List<Include> include = const [
      Include.documents,
      Include.embeddings,
      Include.metadatas,
      Include.distances,
    ],
  }) async {
    if (queryEmbeddings == null && queryTexts == null) {
      throw ArgumentError(
        'Either queryEmbeddings or queryTexts must be provided',
      );
    }

    List<List<double>> finalEmbeddings;
    if (queryEmbeddings == null && queryTexts != null) {
      if (embeddingFunction != null) {
        finalEmbeddings = await embeddingFunction!.generate(queryTexts);
      } else {
        throw ArgumentError(
          'embeddingFunction must be provided if documents are provided',
        );
      }
    } else {
      finalEmbeddings = ArgumentError.checkNotNull(queryEmbeddings);
    }

    return _api.getNearestNeighbors(
      collectionId: id,
      request: QueryEmbedding(
        queryEmbeddings: finalEmbeddings,
        nResults: nResults,
        where: where,
        whereDocument: whereDocument,
        include: include.map((final i) => i.name).toList(growable: false),
      ),
    );
  }

  /// Peek inside the collection.
  ///
  /// - [limit] - Optional number of results to return (default is 10).
  /// - [include] - Optional list of items to include in the response.
  Future<GetResponse> peek({
    final int limit = 10,
    final List<Include> include = const [
      Include.documents,
      Include.embeddings,
      Include.metadatas,
    ],
  }) async {
    return _api.get(
      collectionId: id,
      request: GetEmbedding(
        limit: limit,
        include: include.map((final i) => i.name).toList(growable: false),
      ),
    );
  }

  /// Deletes items from the collection.
  ///
  /// - [ids] - Optional IDs of the items to delete.
  /// - [where] - Optional query condition to filter items to delete
  ///   based on metadata values.
  /// - [whereDocument] - Optional query condition to filter items to delete
  ///   based on document content.
  Future<List<String>> delete({
    final List<String>? ids,
    final Map<String, dynamic>? where,
    final Map<String, dynamic>? whereDocument,
  }) async {
    return _api.delete(
      collectionId: id,
      request: DeleteEmbedding(
        ids: ids,
        where: where,
        whereDocument: whereDocument,
      ),
    );
  }

  /// Validates the inputs to the add, upsert, and update methods.
  Future<
      (
        List<String> ids,
        List<List<double>> embeddings,
        List<Map<String, dynamic>>? metadatas,
        List<String>? documents,
      )> _validate(
    final List<String> ids,
    final List<List<double>>? embeddings,
    final List<Map<String, dynamic>>? metadatas,
    final List<String>? documents, {
    required final bool requireEmbeddingsOrDocuments,
  }) async {
    List<List<double>> finalEmbeddings;

    if (requireEmbeddingsOrDocuments) {
      if (embeddings == null && documents == null) {
        throw ArgumentError('Either embeddings or documents must be provided');
      }
    }

    if (embeddings != null && embeddings.length != ids.length ||
        metadatas != null && metadatas.length != ids.length ||
        documents != null && documents.length != ids.length) {
      throw ArgumentError(
        'Ids, embeddings, metadatas, and documents must all be the same length',
      );
    }

    if (embeddings == null && documents != null) {
      if (embeddingFunction != null) {
        finalEmbeddings = await embeddingFunction!.generate(documents);
      } else {
        throw ArgumentError(
          'embeddingFunction must be provided if documents are provided',
        );
      }
    } else {
      finalEmbeddings = ArgumentError.checkNotNull(embeddings);
    }

    final uniqueIds = ids.toSet();
    if (uniqueIds.length != ids.length) {
      final duplicateIds = ids
          .where(
            (final id1) => ids.where((final id2) => id1 == id2).length > 1,
          )
          .toSet();
      throw ArgumentError(
        'Expected IDs to be unique, found duplicates for: $duplicateIds',
      );
    }

    return (ids, finalEmbeddings, metadatas, documents);
  }
}

/// The items to include in the response.
enum Include {
  documents,
  embeddings,
  metadatas,
  distances,
}
