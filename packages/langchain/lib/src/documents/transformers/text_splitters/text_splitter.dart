import 'package:characters/characters.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';
import '../base.dart';

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

    return texts.asMap().entries.expand((final entry) {
      final textIndex = entry.key;
      final text = entry.value;
      final chunks = splitText(text);
      var index = -1;
      return chunks.map((final chunk) {
        String? id = ids?[textIndex];
        if (id != null && id.isEmpty) {
          id = null;
        }
        final metadata = {...meta[textIndex]};
        if (addStartIndex) {
          index = text.indexOf(chunk, index + 1);
          metadata['start_index'] = index;
        }
        return Document(id: id, pageContent: chunk, metadata: metadata);
      });
    }).toList(growable: false);
  }

  /// Splits documents.
  List<Document> splitDocuments(final List<Document> documents) {
    final ids =
        documents.map((final doc) => doc.id ?? '').toList(growable: false);
    final texts =
        documents.map((final doc) => doc.pageContent).toList(growable: false);
    final metadatas =
        documents.map((final doc) => doc.metadata).toList(growable: false);
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
  List<String> mergeSplits(
    final List<String> splits,
    final String separator,
  ) {
    final separatorLen = lengthFunction(separator);

    bool exceedsChunkSize(
      final int len,
      final int total,
      final List<String> currentDoc,
      final String separator,
    ) {
      return total + len + (currentDoc.isNotEmpty ? separatorLen : 0) >
          chunkSize;
    }

    bool shouldTrim(
      final int len,
      final int total,
      final List<String> currentDoc,
      final String separator,
    ) {
      return total > chunkOverlap ||
          (exceedsChunkSize(len, total, currentDoc, separator) && total > 0);
    }

    final docs = <String>[];
    var currentDoc = <String>[];
    var total = 0;

    // Loop through each 'split' and build up 'docs' list
    for (final d in splits) {
      final len = lengthFunction(d);

      if (exceedsChunkSize(len, total, currentDoc, separator)) {
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
          while (shouldTrim(len, total, currentDoc, separator)) {
            total -= lengthFunction(currentDoc[0]) +
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
      return docs..add(doc);
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
