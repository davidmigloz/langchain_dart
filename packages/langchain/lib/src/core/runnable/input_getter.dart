import '../base.dart';
import 'base.dart';

/// {@template runnable_item_from_map}
/// A [RunnableItemFromMap] allows you to get a value from the input.
///
/// You can create a [RunnableItemFromMap] using the [Runnable.getItemFromMap]
/// static method.
///
/// When you call [invoke] on a [RunnableItemFromMap], it will take the input
/// it receives and returns the value of the given key.
///
/// Example:
///
/// ```dart
/// final promptTemplate = ChatPromptTemplate.fromTemplate('''
/// Answer the question based only on the following context:
/// {context}
///
/// Question: {question}
///
/// Answer in the following language: {language}''');
///
/// final chain = Runnable.fromMap({
///       'context': Runnable.getItemFromMap('question') |
///           (retriever | Runnable.fromFunction((docs, _) => docs.join('\n'))),
///       'question': Runnable.getItemFromMap('question'),
///       'language': Runnable.getItemFromMap('language'),
///     }) |
///     promptTemplate |
///     model |
///     const StringOutputParser();
///
/// final res = await chain.invoke({
///   'question': 'What payment methods do you accept?',
///   'language': 'es_ES',
/// });
/// print(res);
/// // Aceptamos los siguientes métodos de pago: iDEAL y PayPal.
/// ```
/// {@endtemplate}
class RunnableItemFromMap<RunOutput extends Object>
    extends Runnable<Map<String, dynamic>, BaseLangChainOptions, RunOutput> {
  /// {@macro runnable_item_from_map}
  const RunnableItemFromMap(this.key);

  /// The key of the item to get from the input map.
  final String key;

  /// Invokes the [RunnableItemFromMap] on the given [input].
  ///
  /// - [input] - the input to invoke the [RunnableItemFromMap] on.
  /// - [options] - not used.
  @override
  Future<RunOutput> invoke(
    final Map<String, dynamic> input, {
    final BaseLangChainOptions? options,
  }) async {
    return input[key];
  }
}

/// {@template runnable_map_from_input}
/// A [RunnableMapFromInput] allows you to output a map with the given key and
/// the input as value.
///
/// You can create a [RunnableMapFromInput] using the [Runnable.getMapFromInput]
/// static method.
///
/// When you call [invoke] on a [RunnableMapFromInput], it will take the input
/// it receives and returns a map with the given key and the input as value.
///
/// It is equivalent to:
///
/// ```dart
/// Runnable.fromMap({
///   'key': Runnable.passthrough(),
/// })
/// ```
///
/// Example:
///
/// ```dart
/// final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
/// final model = ChatOpenAI(apiKey: openaiApiKey);
///
/// final promptTemplate = ChatPromptTemplate.fromTemplate(
///   'Tell me a joke about {foo}',
/// );
///
/// final chain = Runnable.getMapFromInput('foo') |
///     promptTemplate |
///     model |
///     const StringOutputParser();
///
/// final res = await chain.invoke('bears');
/// print(res);
/// // Why don't bears wear shoes? Because they have bear feet!
/// ```
/// {@endtemplate}
class RunnableMapFromInput<RunInput extends Object>
    extends Runnable<RunInput, BaseLangChainOptions, Map<String, dynamic>> {
  /// {@macro runnable_map_from_input}
  const RunnableMapFromInput(this.key);

  /// The key where to place the input in the output map.
  final String key;

  /// Invokes the [RunnableMapFromInput] on the given [input].
  ///
  /// - [input] - the input to invoke the [RunnableMapFromInput] on.
  /// - [options] - not used.
  @override
  Future<Map<String, dynamic>> invoke(
    final RunInput input, {
    final BaseLangChainOptions? options,
  }) async {
    return {key: input};
  }
}
