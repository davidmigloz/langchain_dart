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
      final output =
          testIterativeTextSplitter(chunkSize: chunkSize, keepSeparator: true);

      expect(output, [
        '....5',
        'X..3',
        'Y...4',
        'X....5',
        'Y...',
      ]);
    });

    test('Test iterative text splitter discard separator', () {
      const chunkSize = 5;
      final output =
          testIterativeTextSplitter(chunkSize: chunkSize, keepSeparator: false);

      expect(output, [
        '....5',
        '..3',
        '...4',
        '....5',
        '...',
      ]);
    });

    test('xxxTest iterative text splitter.', () {
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
