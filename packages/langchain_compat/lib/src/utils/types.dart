import 'package:collection/collection.dart';

/// Chunk a list into smaller list of a specified size.
List<List<T>> chunkList<T>(List<T> arr, {required int chunkSize}) => List<List<T>>.generate(
        (arr.length / chunkSize).ceil(),
        (index) => [],
      )
      .mapIndexed((chunkIndex, chunk) {
        final start = chunkIndex * chunkSize;
        final end = (start + chunkSize > arr.length)
            ? arr.length
            : start + chunkSize;
        return arr.getRange(start, end).toList(growable: false);
      })
      .toList(growable: false);
