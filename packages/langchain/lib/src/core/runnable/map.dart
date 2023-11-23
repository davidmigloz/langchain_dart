import 'package:async/async.dart' show StreamGroup;

import '../base.dart';
import 'base.dart';

/// {@template runnable_map}
/// A [RunnableMap] allows you to run multiple [Runnable] objects in parallel
/// on the same input returning a map of the results.
///
/// You can create a [RunnableMap] using the [Runnable.fromMap] static method.
///
/// When you call [invoke] on a [RunnableMap], it will invoke each [Runnable]
/// in the map in parallel, passing the same input to each one. The output of
/// each [Runnable] is returned in a map, where the keys are the names of the
/// outputs.
///
/// Example:
/// ```dart
/// final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
/// final model = ChatOpenAI(apiKey: openaiApiKey);
///
/// final promptTemplate1 = ChatPromptTemplate.fromTemplate(
///   'What is the city {person} is from?',
/// );
/// final promptTemplate2 = ChatPromptTemplate.fromTemplate(
///   'How old is {person}?',
/// );
/// final promptTemplate3 = ChatPromptTemplate.fromTemplate(
///   'Is {city} a good city for a {age} years old person?',
/// );
/// const stringOutputParser = StringOutputParser();
///
/// final chain = Runnable.fromMap({
///   'city': promptTemplate1 | model | stringOutputParser,
///   'age': promptTemplate2 | model | stringOutputParser,
/// }) | promptTemplate3 | model | stringOutputParser;
///
/// final res = await chain.invoke({'person': 'Elon Musk'});
/// print(res);
/// // It is subjective to determine whether Pretoria, South Africa, is a good
/// // city for a 50-year-old person as it depends on individual preferences and needs.
/// ```
/// {@endtemplate}
class RunnableMap<RunInput extends Object>
    extends Runnable<RunInput, BaseLangChainOptions, Map<String, dynamic>> {
  /// {@macro runnable_map}
  const RunnableMap(this.steps);

  /// The map of [Runnable] objects to run in parallel.
  final Map<String, Runnable<RunInput, BaseLangChainOptions, Object>> steps;

  /// Invokes the [RunnableMap] on the given [input].
  ///
  /// - [input] - the input to invoke the [RunnableMap] on.
  /// - [options] - the options to use when invoking the [RunnableMap].
  @override
  Future<Map<String, dynamic>> invoke(
    final RunInput input, {
    final BaseLangChainOptions? options,
  }) async {
    final output = <String, dynamic>{};

    await Future.forEach(steps.entries, (final entry) async {
      output[entry.key] = await entry.value.invoke(input, options: options);
    });

    return output;
  }

  @override
  Stream<Map<String, dynamic>> streamFromInputStream(
    final Stream<RunInput> inputStream, {
    final BaseLangChainOptions? options,
  }) {
    return StreamGroup.merge(
      steps.entries.map((final entry) {
        return entry.value
            .streamFromInputStream(inputStream, options: options)
            .map((final output) => {entry.key: output});
      }),
    );
  }
}
