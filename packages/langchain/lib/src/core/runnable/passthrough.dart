import '../base.dart';
import 'base.dart';

/// {@template runnable_passthrough}
/// A [RunnablePassthrough] takes the input it receives and passes it through
/// as output.
///
/// You can create a [RunnablePassthrough] using the [Runnable.passthrough]
/// static method.
///
/// When you call [invoke] on a [RunnablePassthrough], it will return the input
/// it receives.
///
/// Example:
/// ```dart
/// final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
/// final model = ChatOpenAI(apiKey: openaiApiKey);
///
/// final promptTemplate = ChatPromptTemplate.fromTemplate(
///   'Tell me a joke about {foo}',
/// );
///
/// final map = Runnable.fromMap({
///   'foo': Runnable.passthrough(),
/// });
/// final chain = map | promptTemplate | model | const StringOutputParser();
///
/// final res = await chain.invoke('bears');
/// print(res);
/// // Why don't bears wear shoes? Because they have bear feet!
/// ```
/// {@endtemplate}
class RunnablePassthrough<RunInput extends Object>
    extends Runnable<RunInput, BaseLangChainOptions, RunInput> {
  /// {@macro runnable_passthrough}
  const RunnablePassthrough();

  /// Invokes the [RunnablePassthrough] on the given [input].
  ///
  /// - [input] - the input to invoke the [RunnablePassthrough] on.
  /// - [options] - not used.
  @override
  Future<RunInput> invoke(
    final RunInput input, {
    final BaseLangChainOptions? options,
  }) {
    return Future.value(input);
  }
}
