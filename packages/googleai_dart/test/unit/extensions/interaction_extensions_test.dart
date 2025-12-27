import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('InteractionExtensions', () {
    group('text', () {
      test('returns concatenated text from outputs', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
          outputs: [
            TextContent(text: 'Hello, '),
            TextContent(text: 'World!'),
          ],
        );
        expect(interaction.text, 'Hello, World!');
      });

      test('returns null when no text outputs', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
          outputs: [ThoughtContent(signature: 'sig')],
        );
        expect(interaction.text, isNull);
      });

      test('returns null when outputs is null', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
        );
        expect(interaction.text, isNull);
      });

      test('skips non-text outputs', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
          outputs: [
            ThoughtContent(signature: 'sig'),
            TextContent(text: 'Hello'),
            ImageContent(data: 'imagedata'),
            TextContent(text: ' World'),
          ],
        );
        expect(interaction.text, 'Hello World');
      });
    });

    group('textOutputs', () {
      test('returns all text outputs', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
          outputs: [
            TextContent(text: 'A'),
            ThoughtContent(signature: 'sig'),
            TextContent(text: 'B'),
          ],
        );
        expect(interaction.textOutputs, hasLength(2));
        expect(interaction.textOutputs[0].text, 'A');
        expect(interaction.textOutputs[1].text, 'B');
      });

      test('returns empty list when no text outputs', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
          outputs: [ThoughtContent(signature: 'sig')],
        );
        expect(interaction.textOutputs, isEmpty);
      });

      test('returns empty list when outputs is null', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
        );
        expect(interaction.textOutputs, isEmpty);
      });
    });

    group('functionCallOutputs', () {
      test('returns all function call outputs', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
          outputs: [
            FunctionCallContent(id: 'call-1', name: 'fn1', arguments: {}),
            TextContent(text: 'Text'),
            FunctionCallContent(id: 'call-2', name: 'fn2', arguments: {}),
          ],
        );
        expect(interaction.functionCallOutputs, hasLength(2));
        expect(interaction.functionCallOutputs[0].name, 'fn1');
        expect(interaction.functionCallOutputs[1].name, 'fn2');
      });

      test('returns empty list when no function calls', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
          outputs: [TextContent(text: 'Text')],
        );
        expect(interaction.functionCallOutputs, isEmpty);
      });
    });

    group('thoughtOutputs', () {
      test('returns all thought outputs', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
          outputs: [
            ThoughtContent(signature: 'sig1'),
            TextContent(text: 'Text'),
            ThoughtContent(signature: 'sig2'),
          ],
        );
        expect(interaction.thoughtOutputs, hasLength(2));
        expect(interaction.thoughtOutputs[0].signature, 'sig1');
        expect(interaction.thoughtOutputs[1].signature, 'sig2');
      });
    });

    group('imageOutputs', () {
      test('returns all image outputs', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
          outputs: [
            ImageContent(data: 'img1'),
            TextContent(text: 'Text'),
            ImageContent(data: 'img2'),
          ],
        );
        expect(interaction.imageOutputs, hasLength(2));
        expect(interaction.imageOutputs[0].data, 'img1');
        expect(interaction.imageOutputs[1].data, 'img2');
      });
    });

    group('audioOutputs', () {
      test('returns all audio outputs', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
          outputs: [
            AudioContent(data: 'audio1'),
            TextContent(text: 'Text'),
            AudioContent(data: 'audio2'),
          ],
        );
        expect(interaction.audioOutputs, hasLength(2));
        expect(interaction.audioOutputs[0].data, 'audio1');
        expect(interaction.audioOutputs[1].data, 'audio2');
      });
    });

    group('hasTextOutput', () {
      test('returns true when has text output', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
          outputs: [TextContent(text: 'Hello')],
        );
        expect(interaction.hasTextOutput, isTrue);
      });

      test('returns false when no text output', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
          outputs: [ThoughtContent(signature: 'sig')],
        );
        expect(interaction.hasTextOutput, isFalse);
      });

      test('returns false when outputs is null', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
        );
        expect(interaction.hasTextOutput, isFalse);
      });
    });

    group('hasFunctionCalls', () {
      test('returns true when has function calls', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
          outputs: [
            FunctionCallContent(id: 'call-1', name: 'test', arguments: {}),
          ],
        );
        expect(interaction.hasFunctionCalls, isTrue);
      });

      test('returns false when no function calls', () {
        const interaction = Interaction(
          id: 'test-id',
          status: InteractionStatus.completed,
          outputs: [TextContent(text: 'Text')],
        );
        expect(interaction.hasFunctionCalls, isFalse);
      });
    });
  });
}
