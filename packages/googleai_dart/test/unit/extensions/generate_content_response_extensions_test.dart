import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('GenerateContentResponseExtensions', () {
    group('firstCandidate', () {
      test('returns first candidate when present', () {
        const response = GenerateContentResponse(
          candidates: [
            Candidate(content: Content(parts: [TextPart('Hello')])),
            Candidate(content: Content(parts: [TextPart('World')])),
          ],
        );
        expect(response.firstCandidate, isNotNull);
        expect(
          (response.firstCandidate!.content!.parts.first as TextPart).text,
          'Hello',
        );
      });

      test('returns null when no candidates', () {
        const response = GenerateContentResponse();
        expect(response.firstCandidate, isNull);
      });

      test('returns null when candidates is empty', () {
        const response = GenerateContentResponse(candidates: []);
        expect(response.firstCandidate, isNull);
      });
    });

    group('text', () {
      test('returns concatenated text from single candidate', () {
        const response = GenerateContentResponse(
          candidates: [
            Candidate(
              content: Content(
                parts: [TextPart('Hello, '), TextPart('World!')],
              ),
            ),
          ],
        );
        expect(response.text, 'Hello, World!');
      });

      test('returns concatenated text from multiple candidates', () {
        const response = GenerateContentResponse(
          candidates: [
            Candidate(content: Content(parts: [TextPart('First')])),
            Candidate(content: Content(parts: [TextPart('Second')])),
          ],
        );
        expect(response.text, 'FirstSecond');
      });

      test('returns null when no text parts', () {
        final response = GenerateContentResponse(
          candidates: [
            Candidate(
              content: Content(parts: [Part.base64('data', 'image/png')]),
            ),
          ],
        );
        expect(response.text, isNull);
      });

      test('returns null when no candidates', () {
        const response = GenerateContentResponse();
        expect(response.text, isNull);
      });

      test('skips non-text parts', () {
        final response = GenerateContentResponse(
          candidates: [
            Candidate(
              content: Content(
                parts: [
                  const TextPart('Text'),
                  Part.base64('data', 'image/png'),
                  const TextPart('More'),
                ],
              ),
            ),
          ],
        );
        expect(response.text, 'TextMore');
      });
    });

    group('functionCalls', () {
      test('returns all function calls from all candidates', () {
        const response = GenerateContentResponse(
          candidates: [
            Candidate(
              content: Content(
                parts: [
                  FunctionCallPart(FunctionCall(name: 'fn1', args: {'a': 1})),
                ],
              ),
            ),
            Candidate(
              content: Content(
                parts: [
                  FunctionCallPart(FunctionCall(name: 'fn2', args: {'b': 2})),
                ],
              ),
            ),
          ],
        );

        final calls = response.functionCalls;
        expect(calls, hasLength(2));
        expect(calls[0].name, 'fn1');
        expect(calls[1].name, 'fn2');
      });

      test('returns empty list when no function calls', () {
        const response = GenerateContentResponse(
          candidates: [
            Candidate(content: Content(parts: [TextPart('Text')])),
          ],
        );
        expect(response.functionCalls, isEmpty);
      });

      test('returns empty list when no candidates', () {
        const response = GenerateContentResponse();
        expect(response.functionCalls, isEmpty);
      });
    });

    group('executableCode', () {
      test('returns code from first candidate', () {
        const response = GenerateContentResponse(
          candidates: [
            Candidate(
              content: Content(
                parts: [
                  ExecutableCodePart(
                    ExecutableCode(language: Language.python, code: 'print(1)'),
                  ),
                ],
              ),
            ),
          ],
        );
        expect(response.executableCode, 'print(1)');
      });

      test('returns null when no executable code', () {
        const response = GenerateContentResponse(
          candidates: [
            Candidate(content: Content(parts: [TextPart('Text')])),
          ],
        );
        expect(response.executableCode, isNull);
      });
    });

    group('codeExecutionResult', () {
      test('returns output from first candidate', () {
        const response = GenerateContentResponse(
          candidates: [
            Candidate(
              content: Content(
                parts: [
                  CodeExecutionResultPart(
                    CodeExecutionResult(outcome: Outcome.ok, output: 'Result'),
                  ),
                ],
              ),
            ),
          ],
        );
        expect(response.codeExecutionResult, 'Result');
      });

      test('returns null when no result', () {
        const response = GenerateContentResponse();
        expect(response.codeExecutionResult, isNull);
      });
    });

    group('data', () {
      test('returns inline data from first candidate', () {
        final response = GenerateContentResponse(
          candidates: [
            Candidate(
              content: Content(parts: [Part.base64('imagedata', 'image/png')]),
            ),
          ],
        );
        expect(response.data, 'imagedata');
      });

      test('returns null when no inline data', () {
        const response = GenerateContentResponse(
          candidates: [
            Candidate(content: Content(parts: [TextPart('Text')])),
          ],
        );
        expect(response.data, isNull);
      });
    });

    group('hasContent', () {
      test('returns true when has content', () {
        const response = GenerateContentResponse(
          candidates: [
            Candidate(content: Content(parts: [TextPart('Text')])),
          ],
        );
        expect(response.hasContent, isTrue);
      });

      test('returns false when no candidates', () {
        const response = GenerateContentResponse();
        expect(response.hasContent, isFalse);
      });

      test('returns false when content has no parts', () {
        const response = GenerateContentResponse(
          candidates: [Candidate(content: Content(parts: []))],
        );
        expect(response.hasContent, isFalse);
      });
    });

    group('allParts', () {
      test('returns all parts from all candidates', () {
        const response = GenerateContentResponse(
          candidates: [
            Candidate(content: Content(parts: [TextPart('A'), TextPart('B')])),
            Candidate(content: Content(parts: [TextPart('C')])),
          ],
        );
        final parts = response.allParts;
        expect(parts, hasLength(3));
        expect((parts[0] as TextPart).text, 'A');
        expect((parts[1] as TextPart).text, 'B');
        expect((parts[2] as TextPart).text, 'C');
      });

      test('returns empty list when no candidates', () {
        const response = GenerateContentResponse();
        expect(response.allParts, isEmpty);
      });
    });
  });
}
