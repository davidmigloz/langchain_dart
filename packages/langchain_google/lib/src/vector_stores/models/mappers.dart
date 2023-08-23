import 'package:vertex_ai/vertex_ai.dart';

import 'models.dart';

abstract class VertexAIMatchingEngineFilterMapper {
  static VertexAIIndexDatapointRestriction toDto(
    final VertexAIMatchingEngineFilter filter,
  ) {
    return VertexAIIndexDatapointRestriction(
      namespace: filter.namespace,
      allowList: filter.allowList,
      denyList: filter.denyList,
    );
  }
}
