import 'package:dart_openai/dart_openai.dart' as c;

import '../models/embeddings.dart';

/// Mapper for [c.OpenAIEmbeddingsModel] to [OpenAIEmbeddings].
extension OpenAIEmbeddingsModelMapper on c.OpenAIEmbeddingsModel {
  OpenAIEmbeddings toModel() {
    return OpenAIEmbeddings(
      data: data.map((final d) => d.toModel()).toList(growable: false),
      model: model,
      usage: usage?.toModel(),
    );
  }
}

/// Mapper for [c.OpenAIEmbeddingsDataModel] to [OpenAIEmbeddingsData].
extension _OpenAIEmbeddingsDataModelMapper on c.OpenAIEmbeddingsDataModel {
  OpenAIEmbeddingsData toModel() {
    return OpenAIEmbeddingsData(
      embeddings: embeddings,
      index: index,
    );
  }
}

/// Mapper for [c.OpenAIEmbeddingsUsageModel] to [OpenAIEmbeddingsUsage].
extension _OpenAIEmbeddingsUsageModelMapper on c.OpenAIEmbeddingsUsageModel {
  OpenAIEmbeddingsUsage toModel() {
    return OpenAIEmbeddingsUsage(
      promptTokens: promptTokens,
      totalTokens: totalTokens,
    );
  }
}
