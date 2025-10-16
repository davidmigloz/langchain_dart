import 'package:characters/characters.dart';
import 'package:langchain_core/documents.dart';
import 'package:meta/meta.dart';

/// {@template text_splitter}
/// Interface for splitting text into chunks.
/// {@endtemplate}
abstract class TextSplitter extends BaseDocumentTransformer {
  /// {@macro text_splitter}
  const TextSplitter({
    this.chunkSize = 4000,
    this.chunkOverlap = 200,
    this.lengthFunction = defaultLengthFunction,
    this.keepSeparator = false,
    this.addStartIndex = false,
  }) : assert(chunkOverlap <= chunkSize);

  /// Maximum size of chunks to return.
  final int chunkSize;

  /// Overlap in characters between chunks.
  final int chunkOverlap;

  /// Function that measures the length of given chunks.
  final int Function(String) lengthFunction;

  /// Whether to keep the separator in the chunks.
  final bool keepSeparator;

  /// If `true`, includes chunk's `start_index` in metadata.
  final bool addStartIndex;

  /// Default length function for [TextSplitter].
  /// Measures the length of the given chunk by counting its characters.
  static int defaultLengthFunction(final String chunk) =>
      chunk.characters.length;

  /// Split text into multiple components.
  List<String> splitText(final String text);

  /// Creates documents from a list of texts.
  List<Document> createDocuments(
    final List<String> texts, {
    final List<String>? ids,
    final List<Map<String, dynamic>>? metadatas,
  }) {
    final meta = metadatas ?? List.filled(texts.length, <String, dynamic>{});

    return texts
        .asMap()
        .entries
        .expand((final entry) {
          final textIndex = entry.key;
          final text = entry.value;
          final chunks = splitText(text);
          var index = -1;
          var previousChunkLen = 0;
          return chunks.map((final chunk) {
            String? id = ids?[textIndex];
            if (id != null && id.isEmpty) {
              id = null;
            }
            final metadata = {...meta[textIndex]};
            if (addStartIndex) {
              final offset = index + previousChunkLen - chunkOverlap;
              index = text.indexOf(chunk, offset > 0 ? offset : 0);
              metadata['start_index'] = index;
              previousChunkLen = chunk.length;
            }
            return Document(id: id, pageContent: chunk, metadata: metadata);
          });
        })
        .toList(growable: false);
  }

  /// Splits documents.
  List<Document> splitDocuments(final List<Document> documents) {
    final ids = documents
        .map((final doc) => doc.id ?? '')
        .toList(growable: false);
    final texts = documents
        .map((final doc) => doc.pageContent)
        .toList(growable: false);
    final metadatas = documents
        .map((final doc) => doc.metadata)
        .toList(growable: false);
    return createDocuments(texts, ids: ids, metadatas: metadatas);
  }

  /// Joins documents into a single document with the given separator.
  String? _joinDocs(
    final List<String> docs, {
    required final String separator,
  }) {
    final text = docs.join(separator).trim();
    return text.isEmpty ? null : text;
  }

  /// Merges smaller pieces into medium size chunks to send to the LLM.
  @protected
  @visibleForTesting
  List<String> mergeSplits(final List<String> splits, final String separator) {
    final separatorLen = lengthFunction(separator);

    final docs = <String>[];
    var currentDoc = <String>[];
    var total = 0;

    for (final d in splits) {
      final len = lengthFunction(d);

      if (total + len + (currentDoc.isNotEmpty ? separatorLen : 0) >
          chunkSize) {
        if (total > chunkSize) {
          // TODO Log warning:
          // 'Created a chunk of size $total,
          // which is longer than the specified $chunkSize'
        }
        if (currentDoc.isNotEmpty) {
          final doc = _joinDocs(currentDoc, separator: separator);
          if (doc != null) {
            docs.add(doc);
          }
          // Keep on popping if:
          // - we have a larger chunk than in the chunk overlap
          // - or if we still have any chunks and the length is long
          while (total > chunkOverlap ||
              (total + len + (currentDoc.isNotEmpty ? separatorLen : 0) >
                      chunkSize &&
                  total > 0)) {
            total -=
                lengthFunction(currentDoc[0]) +
                (currentDoc.length > 1 ? separatorLen : 0);
            currentDoc = currentDoc.sublist(1);
          }
        }
      }

      currentDoc.add(d);
      total += len + (currentDoc.length > 1 ? separatorLen : 0);
    }

    final doc = _joinDocs(currentDoc, separator: separator);
    if (doc != null) {
      docs.add(doc);
    }

    return docs;
  }

  @override
  Future<List<Document>> transformDocuments(
    final List<Document> documents,
  ) async {
    return splitDocuments(documents);
  }
}
