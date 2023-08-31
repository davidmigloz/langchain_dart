import 'package:pinecone/pinecone.dart';

import 'models.dart';

extension PineconeSparseVectorMapper on PineconeSparseVector {
  SparseVector toSparseVector() {
    return SparseVector(
      indices: indices,
      values: values,
    );
  }
}
