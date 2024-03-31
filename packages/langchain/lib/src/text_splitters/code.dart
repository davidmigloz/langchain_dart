import 'recursive_character.dart';

/// {@template code_text_splitter}
/// [CodeTextSplitter] allows you to split source code.
/// It supports multiple languages (see [CodeLanguage] enum).
/// It tries to split along class definitions, function definitions, and control
/// flow statements.
/// {@endtemplate}
class CodeTextSplitter extends RecursiveCharacterTextSplitter {
  /// {@macro code_text_splitter}
  CodeTextSplitter({
    required final CodeLanguage language,
    super.chunkSize,
    super.chunkOverlap,
    super.lengthFunction,
    super.keepSeparator = true,
    super.addStartIndex,
  }) : super(separators: _getSeparatorsForLanguage(language));

  static List<String> _getSeparatorsForLanguage(final CodeLanguage language) {
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

/// Supported programming languages for [CodeTextSplitter].
enum CodeLanguage {
  /// C++ code
  cpp,

  /// Dart code
  dart,

  /// Golang code
  go,

  /// HTML code
  html,

  /// Java code
  java,

  /// Javascript code
  js,

  /// Latex code
  latex,

  /// Markdown code
  markdown,

  /// PHP code
  php,

  /// Protocol Buffer code
  proto,

  /// Python code
  python,

  /// RST code
  rst,

  /// Ruby code
  ruby,

  /// Rust code
  rust,

  /// Scala code
  scala,

  /// Solidity code
  solidity,

  /// Swift code
  swift,
}
