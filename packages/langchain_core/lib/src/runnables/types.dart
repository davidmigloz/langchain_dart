import 'package:meta/meta.dart';

/// {@template runnable_options}
/// Options to pass into a runnable.
/// {@endtemplate}
@immutable
class RunnableOptions {
  /// {@macro runnable_options}
  const RunnableOptions({
    this.concurrencyLimit = 1000,
  });

  /// The maximum number of concurrent calls that the runnable can make.
  /// Defaults to 1000 (different Runnable types may have different defaults).
  final int concurrencyLimit;
}
