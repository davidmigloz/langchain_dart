import 'package:meta/meta.dart';

/// {@template runnable_options}
/// Options to pass into a runnable.
/// {@endtemplate}
@immutable
class RunnableOptions {
  /// {@macro runnable_options}
  const RunnableOptions({this.concurrencyLimit = 1000});

  /// The maximum number of concurrent calls that the runnable can make.
  /// Defaults to 1000 (different Runnable types may have different defaults).
  final int concurrencyLimit;

  /// Creates a copy of this [RunnableOptions] with the given fields replaced
  /// by the new values.
  RunnableOptions copyWith({int? concurrencyLimit}) => RunnableOptions(
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );

  /// Merges this [RunnableOptions] with another [RunnableOptions].
  RunnableOptions merge(RunnableOptions? other) => copyWith(concurrencyLimit: other?.concurrencyLimit);

  @override
  bool operator ==(covariant final RunnableOptions other) => concurrencyLimit == other.concurrencyLimit;

  @override
  int get hashCode => concurrencyLimit.hashCode;
}
