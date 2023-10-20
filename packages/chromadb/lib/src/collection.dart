import 'embeddings/embedding_function.dart';
import 'generated/client.dart';
import 'generated/schema/schema.dart';
import 'loaders/data_loader.dart';

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
    required this.tenant,
    required this.database,
    this.embeddingFunction,
    this.dataLoader,
    required final ChromaApiClient api,
  }) : _api = api;

  /// The name of the collection.
  final String name;

  /// The ID of the collection.
  final String id;

  /// The metadata of the collection.
  final Map<String, dynamic>? metadata;

  /// The tenant name.
  final String tenant;

  /// The database name.
  final String database;

  /// The embedding function of the collection.
  final EmbeddingFunction? embeddingFunction;

  /// The data loader of the collection.
  /// It is used to load the data from a stored URI when needed.
  final DataLoader<Loadable>? dataLoader;

  /// The API client.
  final ChromaApiClient _api;

  /// Add items to the collection.
  ///
  /// - [ids] - IDs of the items to add.
  /// - [embeddings] - Optional embeddings of the items to add.
  /// - [metadatas] - Optional metadata of the items to add.
  /// - [documents] - Optional documents of the items to add.
  /// - [images] - Optional base64 encoded images of the items to add.
  /// - [uris] - Optional URIs of data sources of the items to add.
  Future<void> add({
    required final List<String> ids,
    final List<List<double>>? embeddings,
    final List<Map<String, dynamic>>? metadatas,
    final List<String>? documents,
    final List<String>? images,
    final List<String>? uris,
  }) async {
    final (
      idsList,
      embeddingsList,
      metadatasList,
      documentsList,
      urisList,
    ) = await _validate(
      ids,
      embeddings,
      metadatas,
      documents,
      images,
      uris,
    );

    await _api.add(
      collectionId: id,
      request: AddEmbedding(
        ids: idsList,
        embeddings: embeddingsList,
        metadatas: metadatasList,
        documents: documentsList,
        uris: urisList,
      ),
    );
  }

  /// Update the embeddings, documents, and/or metadatas of existing items.
  ///
  /// - [ids] - IDs of the items to update.
  /// - [embeddings] - Optional embeddings of the items to update.
  /// - [metadatas] - Optional metadata of the items to update.
  /// - [documents] - Optional documents of the items to update.
  /// - [images] - Optional base64 encoded images of the items to add.
  /// - [uris] - Optional URIs of data sources of the items to update.
  Future<void> update({
    required final List<String> ids,
    final List<List<double>>? embeddings,
    final List<Map<String, dynamic>>? metadatas,
    final List<String>? documents,
    final List<String>? images,
    final List<String>? uris,
  }) async {
    final (
      idsList,
      embeddingsList,
      metadatasList,
      documentsList,
      urisList,
    ) = await _validate(
      ids,
      embeddings,
      metadatas,
      documents,
      images,
      uris,
      requireEmbeddingsOrDocuments: false,
    );

    await _api.update(
      collectionId: id,
      request: UpdateEmbedding(
        ids: idsList,
        embeddings: embeddingsList,
        metadatas: metadatasList,
        documents: documentsList,
        uris: urisList,
      ),
    );
  }

  /// Upsert items to the collection.
  ///
  /// - [ids] - IDs of the items to add.
  /// - [embeddings] - Optional embeddings of the items to upsert.
  /// - [metadatas] - Optional metadata of the items to upsert.
  /// - [documents] - Optional documents of the items to upsert.
  /// - [images] - Optional base64 encoded images of the items to add.
  /// - [uris] - Optional URIs of data sources of the items to update.
  Future<void> upsert({
    required final List<String> ids,
    final List<List<double>>? embeddings,
    final List<Map<String, dynamic>>? metadatas,
    final List<String>? documents,
    final List<String>? images,
    final List<String>? uris,
  }) async {
    final (
      idsList,
      embeddingsList,
      metadatasList,
      documentsList,
      urisList,
    ) = await _validate(
      ids,
      embeddings,
      metadatas,
      documents,
      images,
      uris,
    );

    await _api.upsert(
      collectionId: id,
      request: AddEmbedding(
        ids: idsList,
        embeddings: embeddingsList,
        metadatas: metadatasList,
        documents: documentsList,
        uris: urisList,
      ),
    );
  }

  /// Count the number of items in the collection.
  Future<int> count() {
    return _api.count(collectionId: id);
  }

  /// Returns the first [limit] entries of the collection.
  ///
  /// - [limit] - Optional number of results to return (default is 10).
  /// - [include] - Optional list of items to include in the response.
  Future<GetResponse> peek({
    final int limit = 10,
    final List<Include> include = const [
      Include.embeddings,
      Include.metadatas,
      Include.documents,
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
    final String? sort,
    final int? limit,
    final int? offset,
    final List<Include> include = const [
      Include.embeddings,
      Include.metadatas,
      Include.documents,
    ],
  }) async {
    return _api.get(
      collectionId: id,
      request: GetEmbedding(
        ids: ids,
        where: where,
        whereDocument: whereDocument,
        sort: sort,
        limit: limit,
        offset: offset,
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

  /// Performs a query on the collection using the specified parameters.
  ///
  /// - [queryEmbeddings] - Optional query embeddings to use for the search.
  /// - [queryTexts] - Optional query text(s) to search for in the collection.
  /// - [queryImages] - Optional query image(s) to search for in the collection.
  /// - [queryUris] - Optional query URI(s) to search for in the collection.
  /// - [nResults] - Optional number of results to return (default is 10).
  /// - [where] - Optional query condition to filter results based on metadata
  ///   values.
  /// - [whereDocument] - Optional query condition to filter results based on
  ///   document content.
  /// - [include] - Optional list of items to include in the response.
  Future<QueryResponse> query({
    final List<List<double>>? queryEmbeddings,
    final List<String>? queryTexts,
    final List<String>? queryImages,
    final List<String>? queryUris,
    final int nResults = 10,
    final Map<String, dynamic>? where,
    final Map<String, dynamic>? whereDocument,
    final List<Include> include = const [
      Include.embeddings,
      Include.metadatas,
      Include.documents,
      Include.distances,
    ],
  }) async {
    if (!((queryEmbeddings != null) ^
        (queryTexts != null) ^
        (queryImages != null) ^
        (queryUris != null))) {
      throw ArgumentError(
        'You must provide only one of queryEmbeddings, queryTexts, '
        'queryImages, or queryUris',
      );
    }

    List<List<double>> finalEmbeddings;
    if (queryEmbeddings == null) {
      if (embeddingFunction == null) {
        throw ArgumentError(
          'embeddingFunction must be provided if documents are provided',
        );
      } else if (queryTexts != null) {
        finalEmbeddings = await embeddingFunction!.generate(
          queryTexts.map(Embeddable.document).toList(growable: false),
        );
      } else if (queryImages != null) {
        finalEmbeddings = await embeddingFunction!.generate(
          queryImages.map(Embeddable.image).toList(growable: false),
        );
      } else {
        if (queryUris == null) {
          throw ArgumentError(
            'You must provide queryEmbeddings, queryTexts, queryImages, '
            'or queryUris',
          );
        } else if (dataLoader == null) {
          throw ArgumentError(
            'dataLoader must be provided if queryUris are provided',
          );
        } else {
          final Loadable images = await dataLoader!.call(queryUris);
          finalEmbeddings = await embeddingFunction!.generate(
            images.map(Embeddable.image).toList(growable: false),
          );
        }
      }
    } else {
      finalEmbeddings = ArgumentError.checkNotNull(queryEmbeddings);
    }

    final queryResult = await _api.getNearestNeighbors(
      collectionId: id,
      request: QueryEmbedding(
        queryEmbeddings: finalEmbeddings,
        nResults: nResults,
        where: where,
        whereDocument: whereDocument,
        include: include.map((final i) => i.name).toList(growable: false),
      ),
    );

    if (include.contains(Include.data) &&
        dataLoader != null &&
        queryResult.uris != null) {
      final List<List<String>> data = [];
      for (final List<String?> uris in queryResult.uris ?? []) {
        final finalUris = uris.nonNulls.toList(growable: false);
        final Loadable images = await dataLoader!.call(finalUris);
        data.add(images);
      }
      return queryResult.copyWith(data: data);
    }

    return queryResult;
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

  /// Validates the inputs to the add, upsert, and update methods.
  Future<
      (
        List<String> ids,
        List<List<double>>? embeddings,
        List<Map<String, dynamic>>? metadatas,
        List<String>? documents,
        List<String>? uris,
      )> _validate(
    final List<String> ids,
    final List<List<double>>? embeddings,
    final List<Map<String, dynamic>>? metadatas,
    final List<String>? documents,
    final List<String>? images,
    final List<String>? uris, {
    final bool requireEmbeddingsOrDocuments = true,
  }) async {
    List<List<double>> finalEmbeddings;

    if (requireEmbeddingsOrDocuments) {
      if (embeddings == null &&
          documents == null &&
          images == null &&
          uris == null) {
        throw ArgumentError(
          'You must provide embeddings, documents, images, or uris',
        );
      }
    }

    if (embeddings != null && embeddings.length != ids.length ||
        metadatas != null && metadatas.length != ids.length ||
        documents != null && documents.length != ids.length ||
        images != null && images.length != ids.length ||
        uris != null && uris.length != ids.length) {
      throw ArgumentError(
        'Ids, embeddings, metadatas, documents, images and URIs '
        'must all be the same length',
      );
    }

    if (embeddings == null) {
      if (embeddingFunction == null) {
        throw ArgumentError(
          'embeddingFunction must be provided if embeddings are not provided',
        );
      } else if (documents != null) {
        finalEmbeddings = await embeddingFunction!.generate(
          documents.map(Embeddable.document).toList(growable: false),
        );
      } else if (images != null) {
        finalEmbeddings = await embeddingFunction!.generate(
          images.map(Embeddable.image).toList(growable: false),
        );
      } else {
        if (uris == null) {
          throw ArgumentError(
            'You must provide embeddings, documents, images, or uris',
          );
        } else if (dataLoader == null) {
          throw ArgumentError(
            'dataLoader must be provided if uris are provided',
          );
        } else {
          final Loadable images = await dataLoader!.call(uris);
          finalEmbeddings = await embeddingFunction!.generate(
            images.map(Embeddable.image).toList(growable: false),
          );
        }
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

    return (ids, finalEmbeddings, metadatas, documents, uris);
  }
}

/// The items to include in the response.
enum Include {
  /// Include documents.
  documents,

  /// Include embeddings.
  embeddings,

  /// Include metadatas.
  metadatas,

  /// Include distances.
  distances,

  /// Include data.
  data,
}
