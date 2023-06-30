import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

/// {@template openai_embeddings_request}
/// This class is used to represent an OpenAI embeddings request.
/// {@endtemplate}
@immutable
final class OpenAIEmbeddingsRequest {
  /// {@macro openai_embeddings_request}
  const OpenAIEmbeddingsRequest({
    required this.data,
    required this.model,
    required this.usage,
  });

  /// The data returned by the embeddings request.
  final List<OpenAIEmbeddingsData> data;

  /// The model used to generate the embeddings.
  final String model;

  /// The usage of the embeddings, if any.
  final OpenAIEmbeddingsUsage? usage;

  @override
  bool operator ==(covariant final OpenAIEmbeddingsRequest other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.data, data) &&
        other.model == model &&
        other.usage == usage;
  }

  @override
  int get hashCode => data.hashCode ^ model.hashCode ^ usage.hashCode;

  @override
  String toString() {
    return 'OpenAIEmbeddings('
        'data: $data, '
        'model: $model, '
        'usage: $usage)';
  }
}

/// {@template openai_embeddings_data}
/// This class is used to represent the data returned by an OpenAI embeddings
/// request.
/// {@endtemplate}
@immutable
final class OpenAIEmbeddingsData {
  /// {@macro openai_embeddings_data}
  const OpenAIEmbeddingsData({
    required this.embeddings,
    required this.index,
  });

  /// The embedding of the text.
  final List<double> embeddings;

  /// The index of the text.
  final int index;

  @override
  bool operator ==(covariant final OpenAIEmbeddingsData other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.embeddings, embeddings) && other.index == index;
  }

  @override
  int get hashCode => embeddings.hashCode ^ index.hashCode;

  @override
  String toString() {
    return 'OpenAIEmbeddingsDataModel('
        'embeddings: $embeddings, '
        'index: $index)';
  }
}

/// {@template openai_embeddings_usage}
/// This class is used to represent the usage of an OpenAI embeddings.
/// {@endtemplate}
@immutable
final class OpenAIEmbeddingsUsage {
  /// {@template openai_embeddings_usage}
  const OpenAIEmbeddingsUsage({
    required this.promptTokens,
    required this.totalTokens,
  });

  /// The number of tokens in the prompt.
  final int? promptTokens;

  /// The total number of tokens in the prompt and completion.
  final int? totalTokens;

  @override
  bool operator ==(covariant final OpenAIEmbeddingsUsage other) {
    if (identical(this, other)) return true;

    return other.promptTokens == promptTokens &&
        other.totalTokens == totalTokens;
  }

  @override
  int get hashCode => promptTokens.hashCode ^ totalTokens.hashCode;

  @override
  String toString() {
    return 'OpenAIEmbeddingsUsageModel('
        'promptTokens: $promptTokens, '
        'totalTokens: $totalTokens)';
  }
}
