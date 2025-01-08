import '../documents/documents.dart';
import 'code.dart';
import 'recursive_character.dart';

/// {@template markdown_text_splitter}
/// Attempts to split the text along Markdown-formatted headings.
/// {@endtemplate}
class MarkdownTextSplitter extends RecursiveCharacterTextSplitter {
  /// {@macro markdown_text_splitter}
  MarkdownTextSplitter({
    super.chunkSize,
    super.chunkOverlap,
    super.lengthFunction,
    super.keepSeparator,
    super.addStartIndex,
  }) : super(
          separators: RecursiveCharacterTextSplitter.getSeparatorsForLanguage(
            CodeLanguage.markdown,
          ),
        );
}

/// {@template markdown_header_text_splitter}
/// Splitting markdown files based on specified headers.
/// {@endtemplate}
class MarkdownHeaderTextSplitter {
  final bool returnEachLine;
  final List<(String, String)> headersToSplitOn;
  final bool stripHeaders;

  /// Create a new MarkdownHeaderTextSplitter.
  ///
  /// [headersToSplitOn]: Headers we want to track
  /// [returnEachLine]: Return each line w/ associated headers
  /// [stripHeaders]: Strip split headers from the content of the chunk
  MarkdownHeaderTextSplitter({
    required this.headersToSplitOn,
    this.returnEachLine = false,
    this.stripHeaders = true,
  }) {
    // Sort headers by length in descending order
    headersToSplitOn.sort((a, b) => b.$1.length.compareTo(a.$1.length));
  }

  /// Combine lines with common metadata into chunks.
  List<Document> aggregateLinesToChunks(List<LineType> lines) {
    final aggregatedChunks = <LineType>[];

    for (final line in lines) {
      if (aggregatedChunks.isNotEmpty &&
          mapEquals(aggregatedChunks.last.metadata, line.metadata)) {
        // If same metadata, append content
        final old = aggregatedChunks.last;
        aggregatedChunks.last = LineType(
          metadata: old.metadata,
          content: '${old.content}  \n${line.content}',
        );
      } else if (aggregatedChunks.isNotEmpty &&
          !mapEquals(aggregatedChunks.last.metadata, line.metadata) &&
          aggregatedChunks.last.metadata.length < line.metadata.length &&
          aggregatedChunks.last.content.split('\n').last.startsWith('#') &&
          !stripHeaders) {
        // Handle nested headers
        final old = aggregatedChunks.last;
        aggregatedChunks.last = LineType(
          metadata: line.metadata,
          content: '${old.content}  \n${line.content}',
        );
      } else {
        // New chunk
        aggregatedChunks.add(line);
      }
    }

    return aggregatedChunks
        .map(
          (chunk) => Document(
            pageContent: chunk.content,
            metadata: chunk.metadata,
          ),
        )
        .toList();
  }

  /// Split markdown file.
  List<Document> splitText(String text) {
    final lines = text.split('\n');
    final linesWithMetadata = <LineType>[];
    final currentContent = <String>[];
    var currentMetadata = <String, String>{};
    final headerStack = <HeaderType>[];
    final initialMetadata = <String, String>{};
    var inCodeBlock = false;
    var openingFence = '';

    for (final line in lines) {
      var strippedLine = line.trim();
      strippedLine = strippedLine.replaceAll(RegExp(r'[^\x20-\x7E]'), '');

      if (!inCodeBlock) {
        if (strippedLine.startsWith('```') &&
            '```'.allMatches(strippedLine).length == 1) {
          inCodeBlock = true;
          openingFence = '```';
        } else if (strippedLine.startsWith('~~~')) {
          inCodeBlock = true;
          openingFence = '~~~';
        }
      } else {
        if (strippedLine.startsWith(openingFence)) {
          inCodeBlock = false;
          openingFence = '';
        }
      }

      if (inCodeBlock) {
        currentContent.add(strippedLine);
        continue;
      }

      var headerFound = false;
      for (final (sep, name) in headersToSplitOn) {
        if (strippedLine.startsWith(sep) &&
            (strippedLine.length == sep.length ||
                strippedLine[sep.length] == ' ')) {
          final currentHeaderLevel = sep.length;
          while (headerStack.isNotEmpty &&
              headerStack.last.level >= currentHeaderLevel) {
            final poppedHeader = headerStack.removeLast();
            initialMetadata.remove(poppedHeader.name);
          }

          final header = HeaderType(
            level: currentHeaderLevel,
            name: name,
            data: strippedLine.substring(sep.length).trim(),
          );
          headerStack.add(header);
          initialMetadata[name] = header.data;

          if (currentContent.isNotEmpty) {
            linesWithMetadata.add(
              LineType(
                content: currentContent.join('\n'),
                metadata: Map.from(currentMetadata),
              ),
            );
            currentContent.clear();
          }

          if (!stripHeaders) {
            currentContent.add(strippedLine);
          }

          headerFound = true;
          break;
        }
      }

      if (!headerFound) {
        if (strippedLine.isNotEmpty) {
          currentContent.add(strippedLine);
        } else if (currentContent.isNotEmpty) {
          linesWithMetadata.add(
            LineType(
              content: currentContent.join('\n'),
              metadata: Map.from(currentMetadata),
            ),
          );
          currentContent.clear();
        }
      }

      currentMetadata = Map.from(initialMetadata);
    }

    if (currentContent.isNotEmpty) {
      linesWithMetadata.add(
        LineType(
          content: currentContent.join('\n'),
          metadata: currentMetadata,
        ),
      );
    }

    return returnEachLine
        ? linesWithMetadata
            .map(
              (chunk) => Document(
                pageContent: chunk.content,
                metadata: chunk.metadata,
              ),
            )
            .toList()
        : aggregateLinesToChunks(linesWithMetadata);
  }
}

/// Represents a line with metadata
class LineType {
  final Map<String, String> metadata;
  final String content;

  LineType({required this.metadata, required this.content});
}

/// Represents a header with its level and data
class HeaderType {
  final int level;
  final String name;
  final String data;

  HeaderType({required this.level, required this.name, required this.data});
}

/// Helper function to compare maps
bool mapEquals(Map<String, String>? a, Map<String, String>? b) {
  if (a == null || b == null) return a == b;
  if (a.length != b.length) return false;
  for (final key in a.keys) {
    if (a[key] != b[key]) return false;
  }
  return true;
}
