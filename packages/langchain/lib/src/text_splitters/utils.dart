// ignore_for_file: avoid_positional_boolean_parameters

/// Split the text with a regex.
///
/// If the separator is not empty, then the text will be split by the separator.
/// If the separator is empty, then the text will be split into individual
/// characters.
/// If [keepSeparator] is true, then the separator will be kept in the split.
/// Otherwise, the separator will be removed.
List<String> splitTextWithRegex(
  final String text,
  final String separator,
  final bool keepSeparator,
) {
  // Now that we have the separator, split the text
  List<String> splits;
  if (separator.isNotEmpty) {
    splits = text.split(RegExp(keepSeparator ? '(?=$separator)' : separator));
  } else {
    splits = text.split('');
  }
  return splits.where((final s) => s.isNotEmpty).toList(growable: false);
}
