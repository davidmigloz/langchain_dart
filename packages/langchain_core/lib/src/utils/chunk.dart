import 'package:collection/collection.dart';

/// Chunk an array into smaller arrays of a specified size.
List<List<T>> chunkArray<T>(
  final List<T> arr, {
  required final int chunkSize,
}) {
  return List<List<T>>.generate(
    (arr.length / chunkSize).ceil(),
    (final int index) => [],
  ).mapIndexed((final chunkIndex, final chunk) {
    final start = chunkIndex * chunkSize;
    final end =
        (start + chunkSize > arr.length) ? arr.length : start + chunkSize;
    return arr.getRange(start, end).toList(growable: false);
  }).toList(growable: false);
}
