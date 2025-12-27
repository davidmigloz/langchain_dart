import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Content', () {
    group('basic constructor', () {
      test('creates with required fields', () {
        const content = Content(parts: [TextPart('Hello')]);
        expect(content.parts, hasLength(1));
        expect(content.role, isNull);
      });

      test('creates with role', () {
        const content = Content(parts: [TextPart('Hello')], role: 'user');
        expect(content.role, 'user');
      });
    });

    group('fromJson', () {
      test('deserializes with all fields', () {
        final json = {
          'role': 'model',
          'parts': [
            {'text': 'Hello world'},
          ],
        };
        final content = Content.fromJson(json);
        expect(content.role, 'model');
        expect(content.parts, hasLength(1));
        expect(content.parts.first, isA<TextPart>());
      });

      test('deserializes without role', () {
        final json = {
          'parts': [
            {'text': 'Test'},
          ],
        };
        final content = Content.fromJson(json);
        expect(content.role, isNull);
      });

      test('handles empty parts', () {
        final json = <String, dynamic>{'role': 'user'};
        final content = Content.fromJson(json);
        expect(content.parts, isEmpty);
      });
    });

    group('toJson', () {
      test('serializes with all fields', () {
        const content = Content(role: 'user', parts: [TextPart('Hello')]);
        final json = content.toJson();
        expect(json['role'], 'user');
        expect(json['parts'], hasLength(1));
      });

      test('omits null role', () {
        const content = Content(parts: [TextPart('Hello')]);
        final json = content.toJson();
        expect(json.containsKey('role'), isFalse);
      });
    });

    group('factory constructors', () {
      group('Content.user', () {
        test('creates content with user role', () {
          const content = Content.user([TextPart('Hello')]);
          expect(content.role, 'user');
          expect(content.parts, hasLength(1));
          expect((content.parts.first as TextPart).text, 'Hello');
        });

        test('works with multiple parts', () {
          final content = Content.user([
            const TextPart('Text'),
            Part.base64('data', 'image/png'),
          ]);
          expect(content.parts, hasLength(2));
          expect(content.role, 'user');
        });
      });

      group('Content.model', () {
        test('creates content with model role', () {
          const content = Content.model([TextPart('Response')]);
          expect(content.role, 'model');
          expect(content.parts, hasLength(1));
          expect((content.parts.first as TextPart).text, 'Response');
        });
      });

      group('Content.text', () {
        test('creates user content with text part', () {
          final content = Content.text('Hello world');
          expect(content.role, 'user');
          expect(content.parts, hasLength(1));
          expect(content.parts.first, isA<TextPart>());
          expect((content.parts.first as TextPart).text, 'Hello world');
        });

        test('roundtrips through JSON', () {
          final original = Content.text('Test message');
          final json = original.toJson();
          final restored = Content.fromJson(json);
          expect(restored.role, 'user');
          expect((restored.parts.first as TextPart).text, 'Test message');
        });
      });

      group('Content.fromParts', () {
        test('creates from strings', () {
          final content = Content.fromParts(['Hello', 'World']);
          expect(content.parts, hasLength(2));
          expect(content.parts[0], isA<TextPart>());
          expect(content.parts[1], isA<TextPart>());
          expect((content.parts[0] as TextPart).text, 'Hello');
          expect((content.parts[1] as TextPart).text, 'World');
        });

        test('creates from Part objects', () {
          final content = Content.fromParts([
            Part.text('Text'),
            Part.base64('data', 'image/png'),
          ]);
          expect(content.parts, hasLength(2));
          expect(content.parts[0], isA<TextPart>());
          expect(content.parts[1], isA<InlineDataPart>());
        });

        test('creates from mixed strings and Parts', () {
          final content = Content.fromParts([
            'Describe this image:',
            Part.base64('imagedata', 'image/jpeg'),
          ]);
          expect(content.parts, hasLength(2));
          expect(content.parts[0], isA<TextPart>());
          expect((content.parts[0] as TextPart).text, 'Describe this image:');
          expect(content.parts[1], isA<InlineDataPart>());
        });

        test('uses user role by default', () {
          final content = Content.fromParts(['Test']);
          expect(content.role, 'user');
        });

        test('accepts custom role', () {
          final content = Content.fromParts(['Test'], role: 'model');
          expect(content.role, 'model');
        });

        test('throws for invalid types', () {
          expect(() => Content.fromParts([123]), throwsA(isA<ArgumentError>()));
        });

        test('roundtrips through JSON', () {
          final original = Content.fromParts([
            'Hello',
            Part.base64('data', 'image/png'),
          ]);
          final json = original.toJson();
          final restored = Content.fromJson(json);
          expect(restored.role, 'user');
          expect(restored.parts, hasLength(2));
          expect(restored.parts[0], isA<TextPart>());
          expect(restored.parts[1], isA<InlineDataPart>());
        });
      });
    });

    group('copyWith', () {
      test('copies with new role', () {
        const original = Content(parts: [TextPart('Test')], role: 'user');
        final copy = original.copyWith(role: 'model');
        expect(copy.role, 'model');
        expect(copy.parts, equals(original.parts));
      });

      test('copies with new parts', () {
        const original = Content(parts: [TextPart('Original')], role: 'user');
        final copy = original.copyWith(parts: [const TextPart('New')]);
        expect(copy.parts, hasLength(1));
        expect((copy.parts.first as TextPart).text, 'New');
        expect(copy.role, 'user');
      });

      test('can set role to null', () {
        const original = Content(parts: [TextPart('Test')], role: 'user');
        final copy = original.copyWith(role: null);
        expect(copy.role, isNull);
      });
    });
  });
}
