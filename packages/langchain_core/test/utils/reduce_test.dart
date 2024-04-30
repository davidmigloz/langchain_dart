import 'dart:collection';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/documents.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/llms.dart';
import 'package:langchain_core/utils.dart';
import 'package:test/test.dart';

void main() {
  group('Reduce tests', () {
    test('throws an exception when the input is empty', () {
      expect(() => reduce([]), throwsException);
    });

    test('returns the first element when the input has only one element', () {
      expect(reduce([1]), equals(1));
    });

    test('joins strings when the input is a list of strings', () {
      expect(reduce(['Hello', 'World']), equals('HelloWorld'));
    });

    test('concatenates chat messages when the input is a list of chat messages',
        () {
      final messages = [
        ChatMessage.humanText('Hello'),
        ChatMessage.humanText('World'),
      ];
      expect(reduce(messages), equals(ChatMessage.humanText('HelloWorld')));
    });

    test(
        'concatenates language model results when the input is a list of language model results',
        () {
      const results = [
        LLMResult(
          id: 'id',
          output: 'Hello',
          finishReason: FinishReason.stop,
          metadata: {},
          usage: LanguageModelUsage(),
        ),
        LLMResult(
          id: 'id',
          output: 'World',
          finishReason: FinishReason.stop,
          metadata: {},
          usage: LanguageModelUsage(),
        ),
      ];
      expect(
        reduce(results),
        equals(
          const LLMResult(
            id: 'id',
            output: 'HelloWorld',
            finishReason: FinishReason.stop,
            metadata: {},
            usage: LanguageModelUsage(),
          ),
        ),
      );
    });

    test('concatenates documents when the input is a list of documents', () {
      const documents = [
        Document(pageContent: 'Hello'),
        Document(pageContent: 'World'),
      ];
      expect(
        reduce(documents),
        equals(const Document(pageContent: 'HelloWorld')),
      );
    });

    test('flattens the list when the input is a list of lists', () {
      expect(
        reduce([
          ['a', 'b'],
          ['c', 'd'],
        ]),
        equals(['abcd']),
      );
    });

    test('merges maps when the input is a list of maps', () {
      final maps = [
        {'a': 'Hello', 'b': 'foo'},
        {'a': 'World', 'c': 'bar'},
      ];
      expect(
        reduce(maps),
        equals({'a': 'HelloWorld', 'b': 'foo', 'c': 'bar'}),
      );
    });

    test('returns the last element when the input is a list of unknown types',
        () {
      expect(reduce([Stopwatch(), Queue<int>()]), equals(Queue<int>()));
    });
  });
}
