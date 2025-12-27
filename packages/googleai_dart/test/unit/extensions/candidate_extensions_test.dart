import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('CandidateExtensions', () {
    group('text', () {
      test('returns concatenated text', () {
        const candidate = Candidate(
          content: Content(parts: [TextPart('Hello, '), TextPart('World!')]),
        );
        expect(candidate.text, 'Hello, World!');
      });

      test('returns null when no content', () {
        const candidate = Candidate();
        expect(candidate.text, isNull);
      });

      test('returns null when no text parts', () {
        final candidate = Candidate(
          content: Content(parts: [Part.base64('data', 'image/png')]),
        );
        expect(candidate.text, isNull);
      });
    });

    group('functionCalls', () {
      test('returns all function calls', () {
        const candidate = Candidate(
          content: Content(
            parts: [
              FunctionCallPart(FunctionCall(name: 'fn1')),
              TextPart('Text'),
              FunctionCallPart(FunctionCall(name: 'fn2')),
            ],
          ),
        );
        final calls = candidate.functionCalls;
        expect(calls, hasLength(2));
        expect(calls[0].name, 'fn1');
        expect(calls[1].name, 'fn2');
      });

      test('returns empty list when no function calls', () {
        const candidate = Candidate(
          content: Content(parts: [TextPart('Text')]),
        );
        expect(candidate.functionCalls, isEmpty);
      });

      test('returns empty list when no content', () {
        const candidate = Candidate();
        expect(candidate.functionCalls, isEmpty);
      });
    });

    group('parts', () {
      test('returns all parts', () {
        const candidate = Candidate(
          content: Content(parts: [TextPart('A'), TextPart('B')]),
        );
        expect(candidate.parts, hasLength(2));
      });

      test('returns empty list when no content', () {
        const candidate = Candidate();
        expect(candidate.parts, isEmpty);
      });
    });

    group('hasText', () {
      test('returns true when has text part', () {
        const candidate = Candidate(
          content: Content(parts: [TextPart('Hello')]),
        );
        expect(candidate.hasText, isTrue);
      });

      test('returns false when no text parts', () {
        final candidate = Candidate(
          content: Content(parts: [Part.base64('data', 'image/png')]),
        );
        expect(candidate.hasText, isFalse);
      });

      test('returns false when no content', () {
        const candidate = Candidate();
        expect(candidate.hasText, isFalse);
      });
    });

    group('hasFunctionCalls', () {
      test('returns true when has function call', () {
        const candidate = Candidate(
          content: Content(
            parts: [FunctionCallPart(FunctionCall(name: 'test'))],
          ),
        );
        expect(candidate.hasFunctionCalls, isTrue);
      });

      test('returns false when no function calls', () {
        const candidate = Candidate(
          content: Content(parts: [TextPart('Text')]),
        );
        expect(candidate.hasFunctionCalls, isFalse);
      });
    });
  });
}
