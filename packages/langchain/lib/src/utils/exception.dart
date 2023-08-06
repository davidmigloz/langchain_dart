import 'package:meta/meta.dart';

/// {@template lang_chain_exception}
/// A base class for all exceptions thrown by LangChain.
/// {@endtemplate}
@immutable
base class LangChainException implements Exception {
  /// {@macro lang_chain_exception}
  const LangChainException({
    this.message,
    final String? code,
    this.stackTrace,
  }) : code = code ?? 'exception';

  /// The long form message of the exception.
  final String? message;

  /// The optional code to accommodate the message.
  final String code;

  /// The stack trace which provides information to the user about the call
  /// sequence that triggered an exception
  final StackTrace? stackTrace;

  @override
  bool operator ==(covariant final LangChainException other) {
    if (identical(this, other)) return true;
    return other.hashCode == hashCode;
  }

  @override
  int get hashCode => Object.hash(code, message);

  @override
  String toString() {
    String output = '[$code] $message';

    if (stackTrace != null) {
      output += '\n\n$stackTrace';
    }

    return output;
  }
}
