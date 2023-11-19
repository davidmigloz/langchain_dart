import 'dart:convert';

import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  const result = ChatResult(
    generations: [
      ChatGeneration(
        AIChatMessage(
          content: '',
          functionCall: AIChatMessageFunctionCall(
            name: 'test',
            argumentsRaw: '{"foo":"bar","bar":"foo"}',
            arguments: {
              'foo': 'bar',
              'bar': 'foo',
            },
          ),
        ),
      ),
    ],
  );

  const streamingResult = ChatResult(
    streaming: true,
    generations: [
      ChatGeneration(
        AIChatMessage(
          content: '',
          functionCall: AIChatMessageFunctionCall(
            name: 'test',
            argumentsRaw: '{"foo":"bar"',
            arguments: {},
          ),
        ),
      ),
    ],
  );

  group('OutputFunctionsParser tests', () {
    test('OutputFunctionsParser from ChatResult', () async {
      final res = await OutputFunctionsParser().parseResult(result.generations);
      expect(res, '{"foo":"bar","bar":"foo"}');
    });

    test('OutputFunctionsParser from ChatResult streaming', () async {
      final res = await OutputFunctionsParser().stream(streamingResult).first;
      expect(res, '{"foo":"bar"');
    });

    test('OutputFunctionsParser from ChatResult argsOnly=false', () async {
      final res = await OutputFunctionsParser(argsOnly: false)
          .parseResult(result.generations);
      expect(
        res,
        json.encode({
          'name': 'test',
          'argumentsRaw': '{"foo":"bar","bar":"foo"}',
          'arguments': {
            'foo': 'bar',
            'bar': 'foo',
          },
        }),
      );
    });

    test('OutputFunctionsParser from ChatResult streaming argsOnly=false',
        () async {
      final res = await OutputFunctionsParser(argsOnly: false)
          .stream(streamingResult)
          .first;
      expect(
        res,
        json.encode({
          'name': 'test',
          'argumentsRaw': '{"foo":"bar"',
          'arguments': <String, dynamic>{},
        }),
      );
    });
  });

  group('JsonOutputFunctionsParser tests', () {
    test('JsonOutputFunctionsParser from ChatResult', () async {
      final res =
          await JsonOutputFunctionsParser().parseResult(result.generations);
      expect(res, {'foo': 'bar', 'bar': 'foo'});
    });

    test('JsonOutputFunctionsParser from ChatResult streaming', () async {
      final res =
          await JsonOutputFunctionsParser().stream(streamingResult).first;
      expect(res, {'foo': 'bar'});
    });
  });

  group('JsonKeyOutputFunctionsParser tests', () {
    test('JsonKeyOutputFunctionsParser from ChatResult', () async {
      final res = await JsonKeyOutputFunctionsParser(keyName: 'foo')
          .parseResult(result.generations);
      expect(res, 'bar');
    });

    test('JsonKeyOutputFunctionsParser from ChatResult streaming', () async {
      final res = await JsonKeyOutputFunctionsParser(keyName: 'foo')
          .stream(streamingResult)
          .first;
      expect(res, 'bar');
    });
  });
}
