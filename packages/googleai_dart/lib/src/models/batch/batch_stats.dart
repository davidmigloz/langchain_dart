import '../copy_with_sentinel.dart';

/// Stats about a batch operation.
class BatchStats {
  /// The number of requests in the batch.
  final int? requestCount;

  /// The number of requests that were successfully processed.
  final int? successfulRequestCount;

  /// The number of requests that failed to be processed.
  final int? failedRequestCount;

  /// The number of requests that are still pending processing.
  final int? pendingRequestCount;

  /// Creates a [BatchStats].
  const BatchStats({
    this.requestCount,
    this.successfulRequestCount,
    this.failedRequestCount,
    this.pendingRequestCount,
  });

  /// Creates a [BatchStats] from JSON.
  factory BatchStats.fromJson(Map<String, dynamic> json) => BatchStats(
        requestCount: json['requestCount'] != null
            ? int.parse(json['requestCount'] as String)
            : null,
        successfulRequestCount: json['successfulRequestCount'] != null
            ? int.parse(json['successfulRequestCount'] as String)
            : null,
        failedRequestCount: json['failedRequestCount'] != null
            ? int.parse(json['failedRequestCount'] as String)
            : null,
        pendingRequestCount: json['pendingRequestCount'] != null
            ? int.parse(json['pendingRequestCount'] as String)
            : null,
      );

  /// Converts to JSON.
  Map<String, dynamic> toJson() => {
        if (requestCount != null) 'requestCount': requestCount.toString(),
        if (successfulRequestCount != null)
          'successfulRequestCount': successfulRequestCount.toString(),
        if (failedRequestCount != null)
          'failedRequestCount': failedRequestCount.toString(),
        if (pendingRequestCount != null)
          'pendingRequestCount': pendingRequestCount.toString(),
      };

  /// Creates a copy with replaced values.
  BatchStats copyWith({
    Object? requestCount = unsetCopyWithValue,
    Object? successfulRequestCount = unsetCopyWithValue,
    Object? failedRequestCount = unsetCopyWithValue,
    Object? pendingRequestCount = unsetCopyWithValue,
  }) {
    return BatchStats(
      requestCount: requestCount == unsetCopyWithValue
          ? this.requestCount
          : requestCount as int?,
      successfulRequestCount: successfulRequestCount == unsetCopyWithValue
          ? this.successfulRequestCount
          : successfulRequestCount as int?,
      failedRequestCount: failedRequestCount == unsetCopyWithValue
          ? this.failedRequestCount
          : failedRequestCount as int?,
      pendingRequestCount: pendingRequestCount == unsetCopyWithValue
          ? this.pendingRequestCount
          : pendingRequestCount as int?,
    );
  }
}
