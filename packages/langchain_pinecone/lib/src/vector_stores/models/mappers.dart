import 'package:pinecone/pinecone.dart';

import 'models.dart';

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
