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
  }) : super(
         separators: RecursiveCharacterTextSplitter.getSeparatorsForLanguage(
           language,
         ),
       );
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
