import '../base.dart';
import 'base.dart';
import 'sequence.dart';

/// Extension methods for [Runnable]s.
extension RunnableX<
    RunInput extends Object,
    CallOptions extends BaseLangChainOptions,
    RunOutput extends Object,
    NewRunOutput extends Object> on Runnable<RunInput, CallOptions, RunOutput> {
  /// Pipes the output of this [Runnable] into another [Runnable].
  ///
  /// This is a convenience operator for [Runnable.pipe].
  ///
  /// Mind that this operator offers less type safety than [Runnable.pipe] as
  /// Dart does not takes into account [NewRunOutput] type when resolving the
  /// generic type parameters of the extension, it will always resolve
  /// [NewRunOutput] to [Object] (see https://github.com/dart-lang/language/issues/1044).
  ///
  /// - [next] - the [Runnable] to pipe the output into.
  RunnableSequence<RunInput, NewRunOutput> operator |(
    final Runnable<RunOutput, BaseLangChainOptions, NewRunOutput> next,
  ) {
    return pipe(next);
  }
}
