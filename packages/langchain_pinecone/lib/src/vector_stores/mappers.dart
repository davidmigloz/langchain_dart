import 'package:pinecone/pinecone.dart';

import 'types.dart';

/// Mapper for [PineconeSparseVector].
extension PineconeSparseVectorMapper on PineconeSparseVector {
  /// Converts a [PineconeSparseVector] to a [SparseVector].
  SparseVector toSparseVector() {
    return SparseVector(
      indices: indices,
      values: values,
    );
  }
}
