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
}
