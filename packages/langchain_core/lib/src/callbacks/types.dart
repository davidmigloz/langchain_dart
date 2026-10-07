import 'dart:math';

import 'package:meta/meta.dart';

import 'base_handler.dart';

/// A list of callback handlers to be invoked during a run.
typedef Callbacks = List<BaseCallbackHandler>;

/// {@template run_info}
/// Information about a single run (invocation) of a LangChain component.
/// {@endtemplate}
@immutable
class RunInfo {
  /// {@macro run_info}
  const RunInfo({
    required this.runId,
    this.parentRunId,
    this.tags,
    this.metadata,
  });

  /// Unique identifier for this run.
  final String runId;

  /// Identifier of the parent run, if this run is nested.
  final String? parentRunId;

  /// Tags associated with this run.
  final List<String>? tags;

  /// Metadata associated with this run.
  final Map<String, dynamic>? metadata;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RunInfo &&
          runtimeType == other.runtimeType &&
          runId == other.runId &&
          parentRunId == other.parentRunId;

  @override
  int get hashCode => runId.hashCode ^ parentRunId.hashCode;

  @override
  String toString() => 'RunInfo(runId: $runId, parentRunId: $parentRunId)';
}

final _random = Random.secure();

/// Generates a random run ID in UUID v4 format.
String generateRunId() {
  final bytes = List<int>.generate(16, (_) => _random.nextInt(256));
  bytes[6] = (bytes[6] & 0x0f) | 0x40;
  bytes[8] = (bytes[8] & 0x3f) | 0x80;
  final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  return '${hex.substring(0, 8)}-'
      '${hex.substring(8, 12)}-'
      '${hex.substring(12, 16)}-'
      '${hex.substring(16, 20)}-'
      '${hex.substring(20)}';
}
