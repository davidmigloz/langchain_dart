import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('MarkdownHeaderTextSplitter', () {
    test('Test markdown splitter by header: Case 1', () {
      const markdownDocument =
          '# Foo\n\n'
          '    ## Bar\n\n'
          'Hi this is Jim\n\n'
          'Hi this is Joe\n\n'
          ' ## Baz\n\n'
          ' Hi this is Molly';

      final headersToSplitOn = [
        ('#', 'Header 1'),
        ('##', 'Header 2'),
      ];

      final markdownSplitter = MarkdownHeaderTextSplitter(
        headersToSplitOn: headersToSplitOn,
      );

      final output = markdownSplitter.splitText(markdownDocument);

      final expectedOutput = [
        const Document(
          pageContent: 'Hi this is Jim  \nHi this is Joe',
          metadata: {'Header 1': 'Foo', 'Header 2': 'Bar'},
        ),
        const Document(
          pageContent: 'Hi this is Molly',
          metadata: {'Header 1': 'Foo', 'Header 2': 'Baz'},
        ),
      ];

      expect(output, equals(expectedOutput));
    });

    test('Test markdown splitter by header: Case 2', () {
      const markdownDocument =
          '# Foo\n\n'
          '    ## Bar\n\n'
          'Hi this is Jim\n\n'
          'Hi this is Joe\n\n'
          ' ### Boo \n\n'
          ' Hi this is Lance \n\n'
          ' ## Baz\n\n'
          ' Hi this is Molly';

      final headersToSplitOn = [
        ('#', 'Header 1'),
        ('##', 'Header 2'),
        ('###', 'Header 3'),
      ];

      final markdownSplitter = MarkdownHeaderTextSplitter(
        headersToSplitOn: headersToSplitOn,
      );

      final output = markdownSplitter.splitText(markdownDocument);

      final expectedOutput = [
        const Document(
          pageContent: 'Hi this is Jim  \nHi this is Joe',
          metadata: {'Header 1': 'Foo', 'Header 2': 'Bar'},
        ),
        const Document(
          pageContent: 'Hi this is Lance',
          metadata: {'Header 1': 'Foo', 'Header 2': 'Bar', 'Header 3': 'Boo'},
        ),
        const Document(
          pageContent: 'Hi this is Molly',
          metadata: {'Header 1': 'Foo', 'Header 2': 'Baz'},
        ),
      ];

      expect(output, equals(expectedOutput));
    });

    test('Test markdown splitter by header: Case 3', () {
      const markdownDocument =
          '# Foo\n\n'
          '    ## Bar\n\n'
          'Hi this is Jim\n\n'
          'Hi this is Joe\n\n'
          ' ### Boo \n\n'
          ' Hi this is Lance \n\n'
          ' #### Bim \n\n'
          ' Hi this is John \n\n'
          ' ## Baz\n\n'
          ' Hi this is Molly';

      final headersToSplitOn = [
        ('#', 'Header 1'),
        ('##', 'Header 2'),
        ('###', 'Header 3'),
        ('####', 'Header 4'),
      ];

      final markdownSplitter = MarkdownHeaderTextSplitter(
        headersToSplitOn: headersToSplitOn,
      );

      final output = markdownSplitter.splitText(markdownDocument);

      final expectedOutput = [
        const Document(
          pageContent: 'Hi this is Jim  \nHi this is Joe',
          metadata: {'Header 1': 'Foo', 'Header 2': 'Bar'},
        ),
        const Document(
          pageContent: 'Hi this is Lance',
          metadata: {'Header 1': 'Foo', 'Header 2': 'Bar', 'Header 3': 'Boo'},
        ),
        const Document(
          pageContent: 'Hi this is John',
          metadata: {
            'Header 1': 'Foo',
            'Header 2': 'Bar',
            'Header 3': 'Boo',
            'Header 4': 'Bim',
          },
        ),
        const Document(
          pageContent: 'Hi this is Molly',
          metadata: {'Header 1': 'Foo', 'Header 2': 'Baz'},
        ),
      ];

      expect(output, equals(expectedOutput));
    });

    test('Test markdown splitter by header: Preserve Headers 1', () {
      const markdownDocument =
          '# Foo\n\n'
          '    ## Bat\n\n'
          'Hi this is Jim\n\n'
          'Hi Joe\n\n'
          '## Baz\n\n'
          '# Bar\n\n'
          'This is Alice\n\n'
          'This is Bob';

      final headersToSplitOn = [
        ('#', 'Header 1'),
      ];

      final markdownSplitter = MarkdownHeaderTextSplitter(
        headersToSplitOn: headersToSplitOn,
        stripHeaders: false,
      );

      final output = markdownSplitter.splitText(markdownDocument);

      final expectedOutput = [
        const Document(
          pageContent: '# Foo  \n## Bat  \nHi this is Jim  \nHi Joe  \n## Baz',
          metadata: {'Header 1': 'Foo'},
        ),
        const Document(
          pageContent: '# Bar  \nThis is Alice  \nThis is Bob',
          metadata: {'Header 1': 'Bar'},
        ),
      ];

      expect(output, equals(expectedOutput));
    });

    test('Test markdown splitter by header: Preserve Headers 2', () {
      const markdownDocument =
          '# Foo\n\n'
          '    ## Bar\n\n'
          'Hi this is Jim\n\n'
          'Hi this is Joe\n\n'
          '### Boo \n\n'
          'Hi this is Lance\n\n'
          '## Baz\n\n'
          'Hi this is Molly\n'
          '    ## Buz\n'
          '# Bop';

      final headersToSplitOn = [
        ('#', 'Header 1'),
        ('##', 'Header 2'),
        ('###', 'Header 3'),
      ];

      final markdownSplitter = MarkdownHeaderTextSplitter(
        headersToSplitOn: headersToSplitOn,
        stripHeaders: false,
      );

      final output = markdownSplitter.splitText(markdownDocument);

      final expectedOutput = [
        const Document(
          pageContent: '# Foo  \n## Bar  \nHi this is Jim  \nHi this is Joe',
          metadata: {'Header 1': 'Foo', 'Header 2': 'Bar'},
        ),
        const Document(
          pageContent: '### Boo  \nHi this is Lance',
          metadata: {'Header 1': 'Foo', 'Header 2': 'Bar', 'Header 3': 'Boo'},
        ),
        const Document(
          pageContent: '## Baz  \nHi this is Molly',
          metadata: {'Header 1': 'Foo', 'Header 2': 'Baz'},
        ),
        const Document(
          pageContent: '## Buz',
          metadata: {'Header 1': 'Foo', 'Header 2': 'Buz'},
        ),
        const Document(
          pageContent: '# Bop',
          metadata: {'Header 1': 'Bop'},
        ),
      ];

      expect(output, equals(expectedOutput));
    });

    test('Test markdown splitter by header: Fenced code block', () {
      const markdownDocument =
          '# This is a Header\n\n'
          '```\n'
          'foo()\n'
          '# Not a header\n'
          'bar()\n'
          '```';

      final headersToSplitOn = [
        ('#', 'Header 1'),
        ('##', 'Header 2'),
      ];

      final markdownSplitter = MarkdownHeaderTextSplitter(
        headersToSplitOn: headersToSplitOn,
      );

      final output = markdownSplitter.splitText(markdownDocument);

      final expectedOutput = [
        const Document(
          pageContent: '```\nfoo()\n# Not a header\nbar()\n```',
          metadata: {'Header 1': 'This is a Header'},
        ),
      ];

      expect(output, equals(expectedOutput));
    });

    test('Test markdown splitter by header: Interleaved fenced code block', () {
      const markdownDocument =
          '# This is a Header\n\n'
          '```\n'
          'foo\n'
          '# Not a header\n'
          '~~~\n'
          '# Not a header\n'
          '```';

      final headersToSplitOn = [
        ('#', 'Header 1'),
        ('##', 'Header 2'),
      ];

      final markdownSplitter = MarkdownHeaderTextSplitter(
        headersToSplitOn: headersToSplitOn,
      );

      final output = markdownSplitter.splitText(markdownDocument);

      final expectedOutput = [
        const Document(
          pageContent: '```\nfoo\n# Not a header\n~~~\n# Not a header\n```',
          metadata: {'Header 1': 'This is a Header'},
        ),
      ];

      expect(output, equals(expectedOutput));
    });

    test('Test markdown splitter by header: With invisible characters', () {
      const markdownDocument = '\uFEFF# Foo\n\nfoo()\n\uFEFF## Bar\n\nbar()';

      final headersToSplitOn = [
        ('#', 'Header 1'),
        ('##', 'Header 2'),
      ];

      final markdownSplitter = MarkdownHeaderTextSplitter(
        headersToSplitOn: headersToSplitOn,
      );

      final output = markdownSplitter.splitText(markdownDocument);

      final expectedOutput = [
        const Document(
          pageContent: 'foo()',
          metadata: {'Header 1': 'Foo'},
        ),
        const Document(
          pageContent: 'bar()',
          metadata: {'Header 1': 'Foo', 'Header 2': 'Bar'},
        ),
      ];

      expect(output, equals(expectedOutput));
    });
  });
}
