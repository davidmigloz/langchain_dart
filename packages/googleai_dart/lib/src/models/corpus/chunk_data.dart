import '../copy_with_sentinel.dart';

/// Extracted data that represents the Chunk content.
class ChunkData {
  /// Creates a new [ChunkData] instance.
  const ChunkData({
    this.stringValue,
  });

  /// The Chunk content as a string.
  ///
  /// The maximum number of tokens per chunk is 2043.
  final String? stringValue;

  /// Creates a [ChunkData] from JSON.
  factory ChunkData.fromJson(Map<String, dynamic> json) {
    return ChunkData(
      stringValue: json['stringValue'] as String?,
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      if (stringValue != null) 'stringValue': stringValue,
    };
  }

  /// Creates a copy with replaced values.
  ChunkData copyWith({
    Object? stringValue = unsetCopyWithValue,
  }) {
    return ChunkData(
      stringValue: stringValue == unsetCopyWithValue
          ? this.stringValue
          : stringValue as String?,
    );
  }

  @override
  String toString() => 'ChunkData(stringValue: $stringValue)';
}
