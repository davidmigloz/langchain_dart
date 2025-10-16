// ignore_for_file: avoid_dynamic_calls

import 'package:googleai_dart/src/models/generation/schema.dart';
import 'package:test/test.dart';

void main() {
  group('Schema', () {
    group('fromJson', () {
      test('deserializes minimal schema', () {
        final json = <String, dynamic>{};
        final schema = Schema.fromJson(json);

        expect(schema.type, isNull);
        expect(schema.format, isNull);
        expect(schema.description, isNull);
        expect(schema.nullable, isNull);
        expect(schema.enumValues, isNull);
        expect(schema.items, isNull);
        expect(schema.properties, isNull);
        expect(schema.required, isNull);
      });

      test('deserializes complete schema', () {
        final json = {
          'type': 'OBJECT',
          'format': 'date-time',
          'description': 'A test object',
          'nullable': true,
          'enum': ['value1', 'value2'],
          'items': {'type': 'STRING'},
          'properties': {
            'field1': {'type': 'INTEGER', 'description': 'An integer field'},
          },
          'required': ['field1'],
        };

        final schema = Schema.fromJson(json);

        expect(schema.type, SchemaType.object);
        expect(schema.format, 'date-time');
        expect(schema.description, 'A test object');
        expect(schema.nullable, true);
        expect(schema.enumValues, ['value1', 'value2']);
        expect(schema.items, isNotNull);
        expect(schema.items!.type, SchemaType.string);
        expect(schema.properties, isNotNull);
        expect(schema.properties!['field1']!.type, SchemaType.integer);
        expect(schema.properties!['field1']!.description, 'An integer field');
        expect(schema.required, ['field1']);
      });

      test('deserializes nested schema', () {
        final json = {
          'type': 'OBJECT',
          'properties': {
            'nested': {
              'type': 'OBJECT',
              'properties': {
                'deep': {'type': 'STRING'},
              },
            },
          },
        };

        final schema = Schema.fromJson(json);

        expect(schema.type, SchemaType.object);
        expect(schema.properties, isNotNull);
        expect(schema.properties!['nested']!.type, SchemaType.object);
        expect(schema.properties!['nested']!.properties, isNotNull);
        expect(
          schema.properties!['nested']!.properties!['deep']!.type,
          SchemaType.string,
        );
      });

      test('deserializes array schema with items', () {
        final json = {
          'type': 'ARRAY',
          'items': {'type': 'NUMBER', 'description': 'Array item'},
        };

        final schema = Schema.fromJson(json);

        expect(schema.type, SchemaType.array);
        expect(schema.items, isNotNull);
        expect(schema.items!.type, SchemaType.number);
        expect(schema.items!.description, 'Array item');
      });
    });

    group('toJson', () {
      test('serializes minimal schema', () {
        const schema = Schema();
        final json = schema.toJson();

        expect(json, isEmpty);
      });

      test('serializes complete schema', () {
        const schema = Schema(
          type: SchemaType.object,
          format: 'date-time',
          description: 'A test object',
          nullable: true,
          enumValues: ['value1', 'value2'],
          items: Schema(type: SchemaType.string),
          properties: {
            'field1': Schema(
              type: SchemaType.integer,
              description: 'An integer field',
            ),
          },
          required: ['field1'],
        );

        final json = schema.toJson();

        expect(json['type'], 'OBJECT');
        expect(json['format'], 'date-time');
        expect(json['description'], 'A test object');
        expect(json['nullable'], true);
        expect(json['enum'], ['value1', 'value2']);
        expect(json['items'], isA<Map<String, dynamic>>());
        expect(json['items']['type'], 'STRING');
        expect(json['properties'], isA<Map<String, dynamic>>());
        expect(json['properties']['field1']['type'], 'INTEGER');
        expect(json['properties']['field1']['description'], 'An integer field');
        expect(json['required'], ['field1']);
      });

      test('serializes nested schema', () {
        const schema = Schema(
          type: SchemaType.object,
          properties: {
            'nested': Schema(
              type: SchemaType.object,
              properties: {'deep': Schema(type: SchemaType.string)},
            ),
          },
        );

        final json = schema.toJson();

        expect(json['type'], 'OBJECT');
        expect(json['properties']['nested']['type'], 'OBJECT');
        expect(
          json['properties']['nested']['properties']['deep']['type'],
          'STRING',
        );
      });

      test('serializes array schema with items', () {
        const schema = Schema(
          type: SchemaType.array,
          items: Schema(type: SchemaType.number, description: 'Array item'),
        );

        final json = schema.toJson();

        expect(json['type'], 'ARRAY');
        expect(json['items']['type'], 'NUMBER');
        expect(json['items']['description'], 'Array item');
      });
    });

    group('round-trip', () {
      test('serializes and deserializes correctly', () {
        const original = Schema(
          type: SchemaType.object,
          format: 'date-time',
          description: 'Test schema',
          nullable: true,
          enumValues: ['a', 'b'],
          properties: {'field': Schema(type: SchemaType.string)},
          required: ['field'],
        );

        final json = original.toJson();
        final deserialized = Schema.fromJson(json);

        expect(deserialized.type, original.type);
        expect(deserialized.format, original.format);
        expect(deserialized.description, original.description);
        expect(deserialized.nullable, original.nullable);
        expect(deserialized.enumValues, original.enumValues);
        expect(
          deserialized.properties!['field']!.type,
          original.properties!['field']!.type,
        );
        expect(deserialized.required, original.required);
      });
    });
  });

  group('SchemaType', () {
    group('schemaTypeFromString', () {
      test('converts valid strings to SchemaType', () {
        expect(schemaTypeFromString('STRING'), SchemaType.string);
        expect(schemaTypeFromString('NUMBER'), SchemaType.number);
        expect(schemaTypeFromString('INTEGER'), SchemaType.integer);
        expect(schemaTypeFromString('BOOLEAN'), SchemaType.boolean);
        expect(schemaTypeFromString('ARRAY'), SchemaType.array);
        expect(schemaTypeFromString('OBJECT'), SchemaType.object);
      });

      test('is case-insensitive', () {
        expect(schemaTypeFromString('string'), SchemaType.string);
        expect(schemaTypeFromString('String'), SchemaType.string);
        expect(schemaTypeFromString('StRiNg'), SchemaType.string);
      });

      test('returns unspecified for invalid input', () {
        expect(schemaTypeFromString('INVALID'), SchemaType.unspecified);
        expect(schemaTypeFromString(null), SchemaType.unspecified);
        expect(schemaTypeFromString(''), SchemaType.unspecified);
      });
    });

    group('schemaTypeToString', () {
      test('converts SchemaType to string', () {
        expect(schemaTypeToString(SchemaType.string), 'STRING');
        expect(schemaTypeToString(SchemaType.number), 'NUMBER');
        expect(schemaTypeToString(SchemaType.integer), 'INTEGER');
        expect(schemaTypeToString(SchemaType.boolean), 'BOOLEAN');
        expect(schemaTypeToString(SchemaType.array), 'ARRAY');
        expect(schemaTypeToString(SchemaType.object), 'OBJECT');
        expect(schemaTypeToString(SchemaType.unspecified), 'TYPE_UNSPECIFIED');
      });
    });
  });
}
