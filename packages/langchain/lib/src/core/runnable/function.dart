import 'dart:async';

import '../base.dart';
import 'base.dart';

/// {@template runnable_function}
/// A [RunnableFunction] allows you to run a Dart function as part of a chain.
///
/// You can create a [RunnableFunction] using the [Runnable.fromFunction]
/// static method.
///
/// When you call [invoke] on a [RunnableFunction], it will invoke the
/// function, passing the input to it. The output of the function is returned.
///
/// Example:
/// ```dart
/// final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
/// final model = ChatOpenAI(apiKey: openaiApiKey);
///
/// final promptTemplate = ChatPromptTemplate.fromTemplate(
///   'How much is {a} + {b}?',
/// );
///
/// final chain = Runnable.fromMap({
///       'a': Runnable.fromFunction((
///         final Map<String, String> input,
///         final options,
///       ) async {
///         final foo = input['foo'] ?? '';
///         return '${foo.length}';
///       }),
///       'b': Runnable.fromFunction((
///         final Map<String, String> input,
///         final options,
///       ) async {
///         final foo = input['foo'] ?? '';
///         final bar = input['bar'] ?? '';
///         return '${bar.length * foo.length}';
///       }),
///     }) |
///     promptTemplate |
///     model |
///     const StringOutputParser();
///
/// final res = await chain.invoke({'foo': 'foo', 'bar': 'bar'});
/// print(res);
/// // 3 + 9 = 12
/// ```
/// {@endtemplate}
class RunnableFunction<RunInput extends Object, RunOutput extends Object>
    extends Runnable<RunInput, BaseLangChainOptions, RunOutput> {
  /// {@macro runnable_function}
  const RunnableFunction(this.function);

  /// The function to run.
  final FutureOr<RunOutput> Function(
    RunInput input,
    BaseLangChainOptions? options,
  ) function;

  /// Invokes the [RunnableFunction] on the given [input].
  ///
  /// - [input] - the input to invoke the [RunnableFunction] on.
  /// - [options] - the options to use when invoking the [RunnableFunction].
  @override
  Future<RunOutput> invoke(
    final RunInput input, {
    final BaseLangChainOptions? options,
  }) async {
    return function(input, options);
  }
}
