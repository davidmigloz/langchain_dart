import 'package:googleapis/aiplatform/v1.dart';

import '../models/operation.dart';

/// Vertex AI Operation to googleapis models.
class VertexAIOperationGoogleApisMapper {
  /// Maps a VertexAIOperation to a GoogleLongrunningOperation.
  static VertexAIOperation mapOperation(
    final GoogleLongrunningOperation operation,
  ) {
    return VertexAIOperation(
      name: operation.name ?? '',
      done: operation.done ?? false,
      response: operation.response,
      error:
          operation.error != null ? _mapOperationError(operation.error!) : null,
      metadata: operation.metadata,
    );
  }

  static VertexAIOperationError _mapOperationError(
    final GoogleRpcStatus error,
  ) {
    return VertexAIOperationError(
      code: error.code ?? 0,
      details: error.details ?? const [],
      message: error.message ?? '',
    );
  }
}
