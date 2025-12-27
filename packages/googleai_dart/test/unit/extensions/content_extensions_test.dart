import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('ContentExtensions', () {
    group('text', () {
      test('returns concatenated text', () {
        const content = Content(
          parts: [TextPart('Hello, '), TextPart('World!')],
        );
        expect(content.text, 'Hello, World!');
      });

      test('returns null when no text parts', () {
        final content = Content(parts: [Part.base64('data', 'image/png')]);
        expect(content.text, isNull);
      });

      test('returns null when parts is empty', () {
        const content = Content(parts: []);
        expect(content.text, isNull);
      });

      test('skips non-text parts', () {
        final content = Content(
          parts: [
            const TextPart('Hello'),
            Part.base64('data', 'image/png'),
            const TextPart(' World'),
          ],
        );
        expect(content.text, 'Hello World');
      });
    });

    group('functionCalls', () {
      test('returns all function calls', () {
        const content = Content(
          parts: [
            FunctionCallPart(FunctionCall(name: 'fn1', args: {'a': 1})),
            TextPart('Text'),
            FunctionCallPart(FunctionCall(name: 'fn2', args: {'b': 2})),
          ],
        );
        final calls = content.functionCalls;
        expect(calls, hasLength(2));
        expect(calls[0].name, 'fn1');
        expect(calls[1].name, 'fn2');
      });

      test('returns empty list when no function calls', () {
        const content = Content(parts: [TextPart('Text')]);
        expect(content.functionCalls, isEmpty);
      });
    });

    group('textParts', () {
      test('returns all text parts', () {
        const content = Content(
          parts: [TextPart('A'), TextPart('B'), TextPart('C')],
        );
        expect(content.textParts, hasLength(3));
        expect(content.textParts[0].text, 'A');
        expect(content.textParts[1].text, 'B');
        expect(content.textParts[2].text, 'C');
      });

      test('filters out non-text parts', () {
        final content = Content(
          parts: [
            const TextPart('Text'),
            Part.base64('data', 'image/png'),
            const TextPart('More'),
          ],
        );
        expect(content.textParts, hasLength(2));
      });
    });

    group('inlineDataParts', () {
      test('returns all inline data parts', () {
        final content = Content(
          parts: [
            Part.base64('data1', 'image/png'),
            const TextPart('Text'),
            Part.base64('data2', 'image/jpeg'),
          ],
        );
        expect(content.inlineDataParts, hasLength(2));
        expect(content.inlineDataParts[0].inlineData.data, 'data1');
        expect(content.inlineDataParts[1].inlineData.data, 'data2');
      });
    });

    group('fileDataParts', () {
      test('returns all file data parts', () {
        final content = Content(
          parts: [
            Part.file('gs://bucket/file1'),
            const TextPart('Text'),
            Part.file('gs://bucket/file2'),
          ],
        );
        expect(content.fileDataParts, hasLength(2));
      });
    });

    group('functionCallParts', () {
      test('returns all function call parts', () {
        const content = Content(
          parts: [
            FunctionCallPart(FunctionCall(name: 'fn1')),
            TextPart('Text'),
            FunctionCallPart(FunctionCall(name: 'fn2')),
          ],
        );
        expect(content.functionCallParts, hasLength(2));
      });
    });

    group('functionResponseParts', () {
      test('returns all function response parts', () {
        final content = Content(
          parts: [
            Part.functionResponse('fn1', {'result': 1}),
            const TextPart('Text'),
            Part.functionResponse('fn2', {'result': 2}),
          ],
        );
        expect(content.functionResponseParts, hasLength(2));
      });
    });

    group('executableCodeParts', () {
      test('returns all executable code parts', () {
        const content = Content(
          parts: [
            ExecutableCodePart(
              ExecutableCode(language: Language.python, code: 'code1'),
            ),
            TextPart('Text'),
            ExecutableCodePart(
              ExecutableCode(language: Language.python, code: 'code2'),
            ),
          ],
        );
        expect(content.executableCodeParts, hasLength(2));
      });
    });

    group('codeExecutionResultParts', () {
      test('returns all code execution result parts', () {
        const content = Content(
          parts: [
            CodeExecutionResultPart(
              CodeExecutionResult(outcome: Outcome.ok, output: 'out1'),
            ),
            TextPart('Text'),
            CodeExecutionResultPart(
              CodeExecutionResult(outcome: Outcome.ok, output: 'out2'),
            ),
          ],
        );
        expect(content.codeExecutionResultParts, hasLength(2));
      });
    });
  });
}
