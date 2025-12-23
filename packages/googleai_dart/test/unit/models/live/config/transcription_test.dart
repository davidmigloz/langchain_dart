import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Transcription', () {
    group('fromJson', () {
      test('creates Transcription with text', () {
        final json = {'text': 'Hello, world!'};
        final transcription = Transcription.fromJson(json);

        expect(transcription.text, 'Hello, world!');
      });

      test('creates Transcription with empty text', () {
        final json = {'text': ''};
        final transcription = Transcription.fromJson(json);

        expect(transcription.text, '');
      });

      test('creates Transcription with minimal fields', () {
        final json = <String, dynamic>{};
        final transcription = Transcription.fromJson(json);

        expect(transcription.text, isNull);
      });
    });

    group('toJson', () {
      test('includes text when set', () {
        const transcription = Transcription(text: 'Hello there');
        final json = transcription.toJson();

        expect(json['text'], 'Hello there');
      });

      test('includes empty text', () {
        const transcription = Transcription(text: '');
        final json = transcription.toJson();

        expect(json['text'], '');
      });

      test('omits null text', () {
        const transcription = Transcription();
        final json = transcription.toJson();

        expect(json, isEmpty);
      });
    });

    test('round-trip conversion preserves data', () {
      const original = Transcription(text: 'Test transcription text');
      final json = original.toJson();
      final restored = Transcription.fromJson(json);

      expect(restored.text, original.text);
    });

    test('round-trip with special characters', () {
      const original = Transcription(
        text: 'Hello! How are you? This has "quotes" and \'apostrophes\'.',
      );
      final json = original.toJson();
      final restored = Transcription.fromJson(json);

      expect(restored.text, original.text);
    });

    test('round-trip with unicode', () {
      const original = Transcription(text: 'Hello 世界 🌍');
      final json = original.toJson();
      final restored = Transcription.fromJson(json);

      expect(restored.text, original.text);
    });

    test('toString includes text', () {
      const transcription = Transcription(text: 'Hello');
      final str = transcription.toString();

      expect(str, contains('Transcription'));
      expect(str, contains('text'));
      expect(str, contains('Hello'));
    });

    test('toString with null text', () {
      const transcription = Transcription();
      final str = transcription.toString();

      expect(str, contains('Transcription'));
      expect(str, contains('null'));
    });
  });
}
