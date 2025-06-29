import 'dart:async';

import 'package:async/async.dart' show StreamGroup;
import 'package:rxdart/subjects.dart' show ReplaySubject;

import 'runnable.dart';
import 'types.dart';

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
/// const stringOutputParser = StringOutputParser<ChatResult>();
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
    extends Runnable<RunInput, RunnableOptions, Map<String, dynamic>> {
  /// {@macro runnable_map}
  const RunnableMap(this.steps)
    : super(defaultOptions: const RunnableOptions());

  /// The map of [Runnable] objects to run in parallel.
  final Map<String, Runnable<RunInput, RunnableOptions, Object>> steps;

  /// Invokes the [RunnableMap] on the given [input].
  ///
  /// - [input] - the input to invoke the [RunnableMap] on.
  /// - [options] - the options to use when invoking the [RunnableMap].
  @override
  Future<Map<String, dynamic>> invoke(
    RunInput input, {
    RunnableOptions? options,
  }) async {
    final futures = steps.entries.map((entry) async {
      final result = await entry.value.invoke(
        input,
        options: entry.value.getCompatibleOptions(options),
      );
      return MapEntry(entry.key, result);
    });

    final results = await Future.wait(futures);
    return Map.fromEntries(results);
  }

  @override
  Stream<Map<String, dynamic>> stream(
    RunInput input, {
    RunnableOptions? options,
  }) => streamFromInputStream(Stream.value(input), options: options);

  @override
  Stream<Map<String, dynamic>> streamFromInputStream(
    Stream<RunInput> inputStream, {
    RunnableOptions? options,
  }) {
    final subject = ReplaySubject<RunInput>();
    inputStream.listen(
      subject.add,
      onError: subject.addError,
      onDone: subject.close,
    );

    return StreamGroup.merge(
      steps.entries.map((entry) => entry.value
            .streamFromInputStream(
              subject.stream,
              options: entry.value.getCompatibleOptions(options),
            )
            .map((output) => {entry.key: output})),
    ).asBroadcastStream();
  }

  @override
  void close() {
    for (final step in steps.values) {
      step.close();
    }
  }
}
