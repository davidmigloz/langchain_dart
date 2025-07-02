import 'package:meta/meta.dart';

/// A base class for all exceptions thrown by LangChain.
@immutable
base class LangChainException implements Exception {
  /// Creates a new [LangChainException] instance.
  const LangChainException({this.message, String? code, this.stackTrace})
    : code = code ?? 'exception';

  /// The long form message of the exception.
  final String? message;

  /// The optional code to accommodate the message.
  final String code;

  /// The stack trace which provides information to the user about the call
  /// sequence that triggered an exception
  final StackTrace? stackTrace;

  @override
  bool operator ==(covariant LangChainException other) {
    if (identical(this, other)) return true;
    return other.hashCode == hashCode;
  }

  @override
  int get hashCode => Object.hash(code, message);

  @override
  String toString() {
    var output = '[$code] $message';

    if (stackTrace != null) {
      output += '\n\n$stackTrace';
    }

    return output;
  }
}
