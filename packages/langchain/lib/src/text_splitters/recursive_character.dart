import 'code.dart';
import 'text_splitter.dart';
import 'utils.dart';

/// {@template recursive_character_text_splitter}
/// Implementation of splitting text that looks at characters.
/// Recursively tries to split by different characters to find one that works.
/// {@endtemplate}
class RecursiveCharacterTextSplitter extends TextSplitter {
  /// {@macro recursive_character_text_splitter}
  const RecursiveCharacterTextSplitter({
    this.separators = const ['\n\n', '\n', ' ', ''],
    super.chunkSize = 4000,
    super.chunkOverlap = 200,
    super.lengthFunction = TextSplitter.defaultLengthFunction,
    super.keepSeparator = true,
    super.addStartIndex = false,
  });

  /// List of separators to use for splitting.
  final List<String> separators;

  @override
  List<String> splitText(final String text) {
    return _splitText(text, separators);
  }

  List<String> _splitText(final String text, final List<String> separators) {
    final List<String> finalChunks = [];

    // Get appropriate separator to use
    String separator = separators.last;
    List<String> newSeparators = [];
    for (int i = 0; i < separators.length; i++) {
      final s = separators[i];
      if (s == '') {
        separator = s;
        break;
      }
      if (text.contains(RegExp(s))) {
        separator = s;
        newSeparators = separators.sublist(i + 1);
        break;
      }
    }

    // Now that we have the separator, split the text
    final splits = splitTextWithRegex(text, separator, keepSeparator);

    // Now go merging things, recursively splitting longer texts
    final goodSplits = <String>[];
    separator = keepSeparator ? '' : separator;
    for (final s in splits) {
      if (lengthFunction(s) < chunkSize) {
        goodSplits.add(s);
      } else {
        if (goodSplits.isNotEmpty) {
          final mergedText = mergeSplits(goodSplits, separator);
          finalChunks.addAll(mergedText);
          goodSplits.clear();
        }
        if (newSeparators.isEmpty) {
          finalChunks.add(s);
        } else {
          final otherInfo = _splitText(s, newSeparators);
          finalChunks.addAll(otherInfo);
        }
      }
    }
    if (goodSplits.isNotEmpty) {
      final mergedText = mergeSplits(goodSplits, separator);
      finalChunks.addAll(mergedText);
    }

    return finalChunks;
  }

  static List<String> getSeparatorsForLanguage(final CodeLanguage language) {
    return switch (language) {
      CodeLanguage.cpp => [
          // Split along class definitions
          '\nclass ',
          // Split along function definitions
          '\nvoid ',
          '\nint ',
          '\nfloat ',
          '\ndouble ',
          // Split along control flow statements
          '\nif ',
          '\nfor ',
          '\nwhile ',
          '\nswitch ',
          '\ncase ',
          // Split by the normal type of lines
          '\n\n',
          '\n',
          ' ',
          '',
        ],
      CodeLanguage.dart => [
          // Split along class definitions
          '\nclass ',
          '\nenum ',
          // Split along method definitions
          '\nvoid ',
          '\nint ',
          '\ndouble ',
          '\nString ',
          // Split along control flow statements
          '\nif ',
          '\nfor ',
          '\nwhile ',
          '\nswitch ',
          '\ncase ',
          // Split by the normal type of lines
          '\n\n',
          '\n',
          ' ',
          '',
        ],
      CodeLanguage.go => [
          // Split along function definitions
          '\nfunc ',
          '\nvar ',
          '\nconst ',
          '\ntype ',
          // Split along control flow statements
          '\nif ',
          '\nfor ',
          '\nswitch ',
          '\ncase ',
          // Split by the normal type of lines
          '\n\n',
          '\n',
          ' ',
          '',
        ],
      CodeLanguage.html => [
          // First, try to split along HTML tags
          '<body',
          '<div',
          '<p',
          '<br',
          '<li',
          '<h1',
          '<h2',
          '<h3',
          '<h4',
          '<h5',
          '<h6',
          '<span',
          '<table',
          '<tr',
          '<td',
          '<th',
          '<ul',
          '<ol',
          '<header',
          '<footer',
          '<nav',
          // Head
          '<head',
          '<style',
          '<script',
          '<meta',
          '<title',
          '',
        ],
      CodeLanguage.java => [
          // Split along class definitions
          '\nclass ',
          // Split along method definitions
          '\npublic ',
          '\nprotected ',
          '\nprivate ',
          '\nstatic ',
          // Split along control flow statements
          '\nif ',
          '\nfor ',
          '\nwhile ',
          '\nswitch ',
          '\ncase ',
          // Split by the normal type of lines
          '\n\n',
          '\n',
          ' ',
          '',
        ],
      CodeLanguage.js => [
          // Split along function definitions
          '\nfunction ',
          '\nconst ',
          '\nlet ',
          '\nvar ',
          '\nclass ',
          // Split along control flow statements
          '\nif ',
          '\nfor ',
          '\nwhile ',
          '\nswitch ',
          '\ncase ',
          '\ndefault ',
          // Split by the normal type of lines
          '\n\n',
          '\n',
          ' ',
          '',
        ],
      CodeLanguage.latex => [
          // First, try to split along Latex sections
          '\n\\\\title{',
          '\n\\\\author{',
          '\n\\\\chapter{',
          '\n\\\\section{',
          '\n\\\\subsection{',
          '\n\\\\subsubsection{',
          // Now split by environments
          '\n\\\\begin{document}',
          '\n\\\\begin{enumerate}',
          '\n\\\\begin{itemize}',
          '\n\\\\begin{description}',
          '\n\\\\begin{list}',
          '\n\\\\begin{quote}',
          '\n\\\\begin{quotation}',
          '\n\\\\begin{verse}',
          '\n\\\\begin{verbatim}',
          // Now split by math environments
          '\n\\\\begin{align}',
          r'$$',
          r'$',
          // Now split by the normal type of lines
          '\n\n',
          '\n',
          ' ',
          '',
        ],
      CodeLanguage.markdown => [
          // # First, try to split along Markdown headings (starting with level 2)
          '\n#{1,6} ',
          // Note the alternative syntax for headings (below) is not handled here:
          // ```
          // Heading level 2
          // ---------------
          // ```
          // End of code block
          '```\n',
          // Horizontal lines
          '\n\\*\\*\\*+\n',
          '\n---+\n',
          '\n___+\n',
          // Note that this splitter doesn't handle horizontal lines defined
          // by *three or more* of ***, ---, or ___, but this is not handled
          '\n\n',
          '\n',
          ' ',
          '',
        ],
      CodeLanguage.php => [
          // Split along function definitions
          '\nfunction ',
          // Split along class definitions
          '\nclass ',
          // Split along control flow statements
          '\nif ',
          '\nforeach ',
          '\nwhile ',
          '\ndo ',
          '\nswitch ',
          '\ncase ',
          // Split by the normal type of lines
          '\n\n',
          '\n',
          ' ',
          '',
        ],
      CodeLanguage.proto => [
          // Split along message definitions
          '\nmessage ',
          // Split along service definitions
          '\nservice ',
          // Split along enum definitions
          '\nenum ',
          // Split along option definitions
          '\noption ',
          // Split along import statements
          '\nimport ',
          // Split along syntax declarations
          '\nsyntax ',
          // Split by the normal type of lines
          '\n\n',
          '\n',
          ' ',
          '',
        ],
      CodeLanguage.python => [
          // First, try to split along class definitions
          '\nclass ',
          '\ndef ',
          '\n\tdef ',
          // Now split by the normal type of lines
          '\n\n',
          '\n',
          ' ',
          '',
        ],
      CodeLanguage.rst => [
          // Split along section titles
          '\n=+\n',
          '\n-+\n',
          '\n\\*+\n',
          // Split along directive markers
          '\n\n.. *\n\n',
          // Split by the normal type of lines
          '\n\n',
          '\n',
          ' ',
          '',
        ],
      CodeLanguage.ruby => [
          // Split along method definitions
          '\ndef ',
          '\nclass ',
          // Split along control flow statements
          '\nif ',
          '\nunless ',
          '\nwhile ',
          '\nfor ',
          '\ndo ',
          '\nbegin ',
          '\nrescue ',
          // Split by the normal type of lines
          '\n\n',
          '\n',
          ' ',
          '',
        ],
      CodeLanguage.rust => [
          // Split along function definitions
          '\nfn ',
          '\nconst ',
          '\nlet ',
          // Split along control flow statements
          '\nif ',
          '\nwhile ',
          '\nfor ',
          '\nloop ',
          '\nmatch ',
          '\nconst ',
          // Split by the normal type of lines
          '\n\n',
          '\n',
          ' ',
          '',
        ],
      CodeLanguage.scala => [
          // Split along class definitions
          '\nclass ',
          '\nobject ',
          // Split along method definitions
          '\ndef ',
          '\nval ',
          '\nvar ',
          // Split along control flow statements
          '\nif ',
          '\nfor ',
          '\nwhile ',
          '\nmatch ',
          '\ncase ',
          // Split by the normal type of lines
          '\n\n',
          '\n',
          ' ',
          '',
        ],
      CodeLanguage.solidity => [
          // Split along compiler information definitions
          '\npragma ',
          '\nusing ',
          // Split along contract definitions
          '\ncontract ',
          '\ninterface ',
          '\nlibrary ',
          // Split along method definitions
          '\nconstructor ',
          '\ntype ',
          '\nfunction ',
          '\nevent ',
          '\nmodifier ',
          '\nerror ',
          '\nstruct ',
          '\nenum ',
          // Split along control flow statements
          '\nif ',
          '\nfor ',
          '\nwhile ',
          '\ndo while ',
          '\nassembly ',
          // Split by the normal type of lines
          '\n\n',
          '\n',
          ' ',
          '',
        ],
      CodeLanguage.swift => [
          // Split along function definitions
          '\nfunc ',
          // Split along class definitions
          '\nclass ',
          '\nstruct ',
          '\nenum ',
          // Split along control flow statements
          '\nif ',
          '\nfor ',
          '\nwhile ',
          '\ndo ',
          '\nswitch ',
          '\ncase ',
          // Split by the normal type of lines
          '\n\n',
          '\n',
          ' ',
          '',
        ],
    };
  }
}
