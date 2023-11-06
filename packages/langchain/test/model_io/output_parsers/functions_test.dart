// ignore_for_file: unused_element
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  final result = ChatResult(
    generations: [
      ChatGeneration(
        ChatMessage.ai(
          '',
          functionCall: const AIChatMessageFunctionCall(
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

  group('OutputFunctionsParser tests', () {
    test('OutputFunctionsParser from ChatResult', () async {
      final res =
          await const OutputFunctionsParser().parseResult(result.generations);
      expect(res, '{"foo":"bar","bar":"foo"}');
    });
  });

  group('JsonOutputFunctionsParser tests', () {
    test('JsonOutputFunctionsParser from ChatResult', () async {
      final res = await const JsonOutputFunctionsParser()
          .parseResult(result.generations);
      expect(res, {'foo': 'bar', 'bar': 'foo'});
    });
  });

  group('JsonKeyOutputFunctionsParser tests', () {
    test('JsonKeyOutputFunctionsParser from ChatResult', () async {
      final res = await const JsonKeyOutputFunctionsParser(keyName: 'foo')
          .parseResult(result.generations);
      expect(res, 'bar');
    });
  });
}
