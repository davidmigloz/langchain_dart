import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

/// {@template vertex_ai_operation}
/// A long-running operation that is the result of a network API call.
/// {@endtemplate}
@immutable
class VertexAIOperation {
  /// {@macro vertex_ai_operation}
  const VertexAIOperation({
    required this.name,
    required this.done,
    this.response,
    this.error,
    this.metadata,
  });

  /// The server-assigned name, which is only unique within the same service
  /// that originally returns it.
  ///
  /// If you use the default HTTP mapping, the `name` should be a resource name
  /// ending with `operations/{unique_id}`.
  final String name;

  /// If the value is `false`, it means the operation is still in progress.
  ///
  /// If `true`, the operation is completed, and either `error` or `response` is
  /// available.
  final bool done;

  /// The normal response of the operation in case of success.
  final Map<String, dynamic>? response;

  /// The error result of the operation in case of failure or cancellation.
  final VertexAIOperationError? error;

  /// Service-specific metadata associated with the operation.
  ///
  /// It typically contains progress information and common metadata such as
  /// create time. Some services might not provide such metadata. Any method
  /// that returns a long-running operation should document the metadata type,
  /// if any.
  final Map<String, dynamic>? metadata;

  @override
  bool operator ==(covariant final VertexAIOperation other) {
    final mapEquals = const MapEquality<String, dynamic>().equals;
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            name == other.name &&
            done == other.done &&
            mapEquals(response, other.response) &&
            error == other.error &&
            mapEquals(metadata, other.metadata);
  }

  @override
  int get hashCode =>
      name.hashCode ^
      done.hashCode ^
      const MapEquality<String, dynamic>().hash(response) ^
      error.hashCode ^
      const MapEquality<String, dynamic>().hash(metadata);

  @override
  String toString() {
    return 'VertexAIOperation{'
        'name: $name, '
        'done: $done, '
        'response: $response, '
        'error: $error, '
        'metadata: $metadata}';
  }
}

/// {@template vertex_ai_operation_error}
/// The error result of the operation in case of failure.
/// {@endtemplate}
@immutable
class VertexAIOperationError {
  /// {@macro vertex_ai_operation_error}
  const VertexAIOperationError({
    this.code,
    this.details,
    this.message,
  });

  /// The status code
  final int? code;

  /// A list of messages that carry the error details.
  ///
  /// There is a common set of message types for APIs to use.
  final List<Map<String, dynamic>>? details;

  /// A developer-facing error message, which should be in English.
  final String? message;

  @override
  bool operator ==(covariant final VertexAIOperationError other) {
    final deepEquals = const DeepCollectionEquality().equals;
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            code == other.code &&
            deepEquals(details, other.details) &&
            message == other.message;
  }

  @override
  int get hashCode =>
      code.hashCode ^
      const DeepCollectionEquality().hash(details) ^
      message.hashCode;

  @override
  String toString() {
    return 'VertexAIOperationError{'
        'code: $code, '
        'details: $details, '
        'message: $message}';
  }
}
