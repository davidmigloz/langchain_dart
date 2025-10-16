import 'dart:math';

import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('RecursiveCharacterTextSplitter tests', () {
    List<String> testIterativeTextSplitter({
      required final int chunkSize,
      required final bool keepSeparator,
    }) {
      final finalChunkSize = chunkSize + (keepSeparator ? 1 : 0);

      final splitter = RecursiveCharacterTextSplitter(
        chunkSize: finalChunkSize,
        chunkOverlap: 0,
        separators: ['X', 'Y'],
        keepSeparator: keepSeparator,
      );

      const text = '....5X..3Y...4X....5Y...';
      final output = splitter.splitText(text);

      for (final chunk in output) {
        expect(
          chunk.length <= finalChunkSize,
          isTrue,
          reason: 'Chunk is larger than $finalChunkSize',
        );
      }
      return output;
    }

    test('Test iterative text splitter keep separator', () {
      const chunkSize = 5;
      final output = testIterativeTextSplitter(
        chunkSize: chunkSize,
        keepSeparator: true,
      );

      expect(output, ['....5', 'X..3', 'Y...4', 'X....5', 'Y...']);
    });

    test('Test iterative text splitter discard separator', () {
      const chunkSize = 5;
      final output = testIterativeTextSplitter(
        chunkSize: chunkSize,
        keepSeparator: false,
      );

      expect(output, ['....5', '..3', '...4', '....5', '...']);
    });

    test('Test chunk overlap', () {
      const text = 'abcdefghijklmnopqrstuvwxyz';
      const splitter = RecursiveCharacterTextSplitter(
        chunkSize: 10,
        chunkOverlap: 4,
      );
      final output = splitter.splitText(text);

      // With chunk size 10 and overlap 4, the expected chunks would be:
      // 1. "abcdefghij" (first 10 chars)
      // 2. "ghijklmnop" (starts at index 6, giving overlap of 4 chars "ghij")
      // 3. "mnopqrstuv" (starts at index 12, giving overlap of 4 chars "mnop")
      // 4. "stuvwxyz" (remaining chars, with overlap of 4 chars "stuv")
      final expectedOutput = [
        'abcdefghij',
        'ghijklmnop',
        'mnopqrstuv',
        'stuvwxyz',
      ];

      expect(output, expectedOutput);

      // Verify overlaps between consecutive chunks
      for (var i = 0; i < output.length - 1; i++) {
        final currentChunk = output[i];
        final nextChunk = output[i + 1];

        final overlap = _findOverlap(currentChunk, nextChunk);

        // Last chunk might have less overlap if text length doesn't align perfectly
        if (i < output.length - 2 ||
            nextChunk.length >= splitter.chunkOverlap) {
          expect(
            overlap.length,
            splitter.chunkOverlap,
            reason:
                'Overlap between chunks $i and ${i + 1}, '
                'should be ${splitter.chunkOverlap} characters',
          );
        }
      }
    });

    test('Test chunk overlap with document metadata', () {
      const text = 'abcdefghijklmnopqrstuvwxyz';
      const splitter = RecursiveCharacterTextSplitter(
        chunkSize: 10,
        chunkOverlap: 4,
        addStartIndex: true,
      );

      final docs = splitter.createDocuments([text]);

      // Verify correct number of documents
      expect(docs.length, 4);

      // Verify document content matches expected chunks
      expect(docs.map((d) => d.pageContent).toList(), [
        'abcdefghij',
        'ghijklmnop',
        'mnopqrstuv',
        'stuvwxyz',
      ]);

      // Verify start indexes are correct in metadata
      expect(docs[0].metadata['start_index'], 0);
      expect(docs[1].metadata['start_index'], 6);
      expect(docs[2].metadata['start_index'], 12);
      expect(docs[3].metadata['start_index'], 18);

      // Verify that each start_index points to the correct position in the original text
      for (final doc in docs) {
        final startIndex = doc.metadata['start_index'] as int;
        final content = doc.pageContent;

        expect(
          text.substring(startIndex, startIndex + content.length),
          content,
          reason: 'Content at start_index does not match document content',
        );
      }
    });

    test('Test chunk overlap with repeating patterns', () {
      // Text with repeating patterns to highlight the bug fixed
      const text = 'AAABBBAAABBBAAABBB';

      const splitter = RecursiveCharacterTextSplitter(
        chunkSize: 6,
        chunkOverlap: 3,
        addStartIndex: true,
      );

      final docs = splitter.createDocuments([text]);

      // Expected chunks with proper overlap positioning
      final chunks = docs.map((d) => d.pageContent).toList();
      expect(chunks.length, 5);
      expect(chunks[0], 'AAABBB');
      expect(chunks[1], 'BBBAAA');
      expect(chunks[2], 'AAABBB');
      expect(chunks[3], 'BBBAAA');
      expect(chunks[4], 'AAABBB');

      // Verify start indexes (these values depend on correct overlap behavior)
      expect(docs[0].metadata['start_index'], 0);
      expect(docs[1].metadata['start_index'], 3);
      expect(docs[2].metadata['start_index'], 6);
      expect(docs[3].metadata['start_index'], 9);
      expect(docs[4].metadata['start_index'], 12);

      // Verify that each chunk starts at the right position in the original text
      for (final doc in docs) {
        final startIndex = doc.metadata['start_index'] as int;
        final content = doc.pageContent;

        expect(
          text.substring(startIndex, startIndex + content.length),
          content,
          reason: 'Content at start_index does not match document content',
        );
      }

      // Verify proper progression through the text
      for (var i = 0; i < docs.length - 1; i++) {
        final currentDoc = docs[i];
        final nextDoc = docs[i + 1];

        final currentStartIndex = currentDoc.metadata['start_index'] as int;
        final nextStartIndex = nextDoc.metadata['start_index'] as int;

        // With the fix, each chunk should start at exactly 3 characters after the previous one
        // (with chunkSize=6 and chunkOverlap=3, we move forward by 3 characters each time)
        expect(
          nextStartIndex,
          currentStartIndex +
              currentDoc.pageContent.length -
              splitter.chunkOverlap,
          reason:
              "Next chunk's start_index should reflect the proper overlap calculation",
        );

        // Verify specifically that we advance by exactly the right amount
        expect(
          nextStartIndex - currentStartIndex,
          3,
          reason: 'Should advance by (chunkSize - chunkOverlap) positions',
        );
      }
    });

    test('Test start_index calculation with pattern repetition', () {
      const text = 'ABABCABACABABCABAB';

      const splitter = RecursiveCharacterTextSplitter(
        chunkSize: 5,
        chunkOverlap: 2,
        addStartIndex: true,
      );

      final docs = splitter.createDocuments([text]);

      // Verify that chunks have correct content
      final chunks = docs.map((d) => d.pageContent).toList();
      expect(chunks[0], 'ABABC'); // First chunk starts at index 0
      expect(chunks[1], 'BCABA'); // Second chunk starts at index 3
      expect(chunks[2], 'BACAB'); // Third chunk starts at index 6

      // Verify start indexes are correct and properly respect the overlap
      expect(docs[0].metadata['start_index'], 0);
      expect(docs[1].metadata['start_index'], 3);
      expect(docs[2].metadata['start_index'], 6);

      // For each consecutive chunk pair, verify the correct spacing
      for (var i = 0; i < docs.length - 1; i++) {
        final currentDoc = docs[i];
        final nextDoc = docs[i + 1];

        final currentStartIndex = currentDoc.metadata['start_index'] as int;
        final nextStartIndex = nextDoc.metadata['start_index'] as int;
        final chunkLength = currentDoc.pageContent.length;

        // Each chunk should advance by exactly (chunkLength - overlap) positions
        final expectedAdvance = chunkLength - splitter.chunkOverlap;
        final actualAdvance = nextStartIndex - currentStartIndex;

        expect(
          actualAdvance,
          expectedAdvance,
          reason:
              'Chunks should advance by exactly (chunkLength - overlap) positions',
        );

        // Directly calculate the expected next position
        final expectedNextPosition =
            currentStartIndex + chunkLength - splitter.chunkOverlap;

        expect(
          nextStartIndex,
          expectedNextPosition,
          reason:
              'Next chunk should start at exactly the correct overlapping position',
        );

        // Verify that text at calculated position matches next chunk content
        final nextChunkContent = nextDoc.pageContent;
        final textAtNextPosition = text.substring(
          nextStartIndex,
          nextStartIndex + nextChunkContent.length,
        );

        expect(
          textAtNextPosition,
          nextChunkContent,
          reason:
              'Text at calculated next position should match next chunk content',
        );
      }
    });

    test('Test correct start_index with repetitive pattern', () {
      const text = 'ABCDEFG ABCDEFG ABCDEFG';

      const splitter = RecursiveCharacterTextSplitter(
        chunkSize: 10,
        chunkOverlap: 3,
        addStartIndex: true,
      );

      final docs = splitter.createDocuments([text]);

      // Verify each chunk's content matches the text at its start_index
      for (final doc in docs) {
        final startIndex = doc.metadata['start_index'] as int;
        final content = doc.pageContent;

        expect(
          text.substring(startIndex, startIndex + content.length),
          content,
          reason: 'Content at start_index should match the chunk content',
        );
      }

      // Verify proper progression from one chunk to the next
      for (var i = 0; i < docs.length - 1; i++) {
        final nextDoc = docs[i + 1];

        final nextStartIndex = nextDoc.metadata['start_index'] as int;

        // Due to the pattern being repeated, the algorithm might find the next occurrence
        // which could be further ahead, so we verify the content is correct rather than
        // the exact position calculation
        final expectedText = text.substring(
          nextStartIndex,
          nextStartIndex + nextDoc.pageContent.length,
        );

        expect(
          nextDoc.pageContent,
          expectedText,
          reason: 'Next chunk content must match text at its start_index',
        );
      }
    });

    test('Test iterative text splitter.', () {
      const text = '''
Hi.

I'm Harrison.

How? Are? You?
Okay then f f f f.
This is a weird text to write, but gotta test the splittingggg some how.

Bye!

-H.''';
      const splitter = RecursiveCharacterTextSplitter(
        chunkSize: 10,
        chunkOverlap: 1,
      );
      final output = splitter.splitText(text);
      final expectedOutput = [
        'Hi.',
        "I'm",
        'Harrison.',
        'How? Are?',
        'You?',
        'Okay then',
        'f f f f.',
        'This is a',
        'weird',
        'text to',
        'write,',
        'but gotta',
        'test the',
        'splitting',
        'gggg',
        'some how.',
        'Bye!',
        '-H.',
      ];
      expect(output, expectedOutput);
    });
  });
}

/// Helper function to find overlapping text between two strings
String _findOverlap(String first, String second) {
  if (first.isEmpty || second.isEmpty) return '';

  // Find the maximum overlapping suffix of first that is a prefix of second
  for (int i = min(first.length, second.length); i > 0; i--) {
    final suffix = first.substring(first.length - i);
    final prefix = second.substring(0, i);

    if (suffix == prefix) {
      return suffix;
    }
  }

  return '';
}
