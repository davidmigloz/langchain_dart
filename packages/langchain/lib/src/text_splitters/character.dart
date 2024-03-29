import 'text_splitter.dart';
import 'utils.dart';

/// {@template character_text_splitter}
/// Implementation of [TextSplitter] that looks at characters.
///
/// - How the text is split: by single character (by default "\n\n").
/// - How the chunk size is measured: by number of characters.
/// {@endtemplate}
class CharacterTextSplitter extends TextSplitter {
  /// {@macro character_text_splitter}
  const CharacterTextSplitter({
    this.separator = '\n\n',
    super.chunkSize,
    super.chunkOverlap,
    super.lengthFunction,
    super.keepSeparator,
    super.addStartIndex,
  });

  /// The separator that is used to split the text.
  final String separator;

  @override
  List<String> splitText(final String text) {
    // First we naively split the large input into a bunch of smaller ones
    final splits = splitTextWithRegex(text, separator, keepSeparator);
    final finalSeparator = keepSeparator ? '' : separator;
    return mergeSplits(splits, finalSeparator);
  }
}
