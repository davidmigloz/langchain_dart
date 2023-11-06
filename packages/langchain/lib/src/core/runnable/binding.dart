import '../base.dart';
import 'base.dart';

/// {@template runnable_binding}
/// A [RunnableBinding] allows you to run a [Runnable] object with
/// [CallOptions].
///
/// You can create a [RunnableBinding] using the [Runnable.bind] method.
///
/// When you call [invoke] on a [RunnableBinding], it will invoke the
/// [Runnable] with the [CallOptions] passed to [bind].
///
/// Example: Attaching Stop Sequences
/// ```dart
/// final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
/// final model = ChatOpenAI(apiKey: openaiApiKey);
///
/// final promptTemplate = ChatPromptTemplate.fromTemplate(
///   'Tell me a joke about {foo}',
/// );
///
/// final chain = promptTemplate | model.bind(ChatOpenAIOptions(stop: ['\n']));
///
/// final res = await chain.invoke({'foo': 'bears'});
/// print(res);
/// // ChatResult{
/// //   generations: [
/// //     ChatGeneration{
/// //       output: AIChatMessage{
/// //         content: Why don't bears wear shoes?,
/// //       },
/// //     },
/// //   ],
/// //   usage: ...,
/// //   modelOutput: ...,
/// // }
/// ```
/// {@endtemplate}
class RunnableBinding<RunInput extends Object?,
        CallOptions extends BaseLangChainOptions, RunOutput extends Object?>
    extends Runnable<RunInput, CallOptions, RunOutput> {
  /// {@macro runnable_binding}
  const RunnableBinding({
    required this.bound,
    this.options,
  });

  /// The [Runnable] to bind.
  final Runnable<RunInput, CallOptions, RunOutput> bound;

  /// The [CallOptions] to bind the [Runnable] with.
  final CallOptions? options;

  /// Invokes the [RunnableBinding] on the given [input].
  ///
  /// - [input] - the input to invoke the [RunnableBinding] on.
  /// - [options] - the options to use when invoking the [RunnableBinding].
  @override
  Future<RunOutput> invoke(
    final RunInput input, {
    final CallOptions? options,
  }) async {
    return bound.invoke(input, options: options ?? this.options);
  }

  @override
  Stream<RunOutput> streamFromInputStream(
    final Stream<RunInput> inputStream, {
    final CallOptions? options,
  }) {
    return bound.streamFromInputStream(
      inputStream,
      options: options ?? this.options,
    );
  }
}
