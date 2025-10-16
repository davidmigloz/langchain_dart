import '../copy_with_sentinel.dart';

/// An embedding for a piece of content.
class ContentEmbedding {
  /// The embedding values.
  final List<double> values;

  /// Creates a [ContentEmbedding].
  const ContentEmbedding({required this.values});

  /// Creates a [ContentEmbedding] from JSON.
  factory ContentEmbedding.fromJson(Map<String, dynamic> json) =>
      ContentEmbedding(
        values: ((json['values'] as List?) ?? [])
            .map((e) => (e as num).toDouble())
            .toList(),
      );

  /// Converts to JSON.
  Map<String, dynamic> toJson() => {'values': values};

  /// Creates a copy with replaced values.
  ContentEmbedding copyWith({Object? values = unsetCopyWithValue}) {
    return ContentEmbedding(
      values: values == unsetCopyWithValue
          ? this.values
          : values! as List<double>,
    );
  }
}
