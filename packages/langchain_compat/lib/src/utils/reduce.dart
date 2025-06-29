import '../chat_models/types.dart';
import '../documents/document.dart';
import '../language_models/types.dart';
import '../prompts/types.dart';

/// Reduces a list of objects to a single object by concatenating them.
///
/// E.g.:
/// - A list of strings will be concatenated.
/// - A list of chat messages will be concatenated into a single chat message.
/// - A list of language model results will be concatenated into a single language model result.
/// - A list of documents will be concatenated into a single document.
/// - A list of lists will be reduced to a single list containing a single reduced item.
/// - A list of maps will be reduced to a single map containing the reduced items.
/// - If a type is not recognized, the last item in the list will be returned.
Type reduce<Type>(final Iterable<Type> input) {
  if (input.isEmpty) {
    throw Exception('Cannot reduce an empty list');
  } else if (input.length == 1) {
    return input.first;
  }

  final first = input.first;
  return switch (first) {
        String() => input.cast<String>().join(),
        ChatMessage() => input.cast<ChatMessage>().reduce(
          (final a, final b) => a.concat(b),
        ),
        PromptValue() => input.cast<PromptValue>().reduce(
          (final a, final b) => a.concat(b),
        ),
        LanguageModelResult() => input.cast<LanguageModelResult>().reduce(
          (final a, final b) => a.concat(b),
        ),
        Document() => input.cast<Document>().reduce(
          (final a, final b) => a.concat(b),
        ),
        Iterable<String>() => _reduceIterable(input.cast<Iterable<String>>()),
        Iterable<Object>() => _reduceIterable(input.cast<Iterable<Object>>()),
        Iterable<dynamic>() => _reduceIterable(input.cast<Iterable<dynamic>>()),
        Map<String, String>() => _reduceMap(input.cast<Map<String, String>>()),
        Map<String, Object>() => _reduceMap(input.cast<Map<String, Object>>()),
        Map<String, dynamic>() => _reduceMap(
          input.cast<Map<String, dynamic>>(),
        ),
        Map<dynamic, dynamic>() => _reduceMap(
          input.cast<Map<dynamic, dynamic>>(),
        ),
        _ => input.last,
      }
      as Type;
}

Iterable<V> _reduceIterable<V>(final Iterable<Iterable<V>> input) => [reduce(input.expand((final e) => e).toList(growable: false))];

Map<K, V> _reduceMap<K, V>(final Iterable<Map<K, V>> input) => input.fold<Map<K, V>>({}, (final a, final b) {
    final keys = a.keys.toSet()..addAll(b.keys);
    return {
      for (final key in keys)
        key: reduce([
          if (a[key] != null) a[key] as V,
          if (b[key] != null) b[key] as V,
        ]),
    };
  });
