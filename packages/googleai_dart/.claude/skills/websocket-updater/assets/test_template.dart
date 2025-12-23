// USAGE: Copy this file, then find-replace:
//   {ClassName} → YourModelName (PascalCase, e.g., FileSearchStore)
//   {subdirectory} → Model subdirectory (e.g., files, corpus)
//   {class_file} → snake_case file name (e.g., file_search_store)
//   Replace example JSON with actual test data
//
// Test coverage: fromJson (all fields, null, partial), toJson, round-trip,
//                copyWith (modify, set null), equality, toString
//
// See references/implementation-patterns.md for detailed conventions

import 'package:googleai_dart/src/models/{subdirectory}/{class_file}.dart';
import 'package:test/test.dart';

void main() {
  group('{ClassName}', () {
    group('fromJson', () {
      test('creates instance with all fields', () {
        final json = {
          'name': 'resources/123',
          'displayName': 'Test Resource',
          'createTime': '2024-01-01T00:00:00Z',
          'updateTime': '2024-01-02T00:00:00Z',
        };

        final instance = {ClassName}.fromJson(json);

        expect(instance.name, 'resources/123');
        expect(instance.displayName, 'Test Resource');
        expect(instance.createTime, '2024-01-01T00:00:00Z');
        expect(instance.updateTime, '2024-01-02T00:00:00Z');
      });

      test('handles null values', () {
        final json = <String, dynamic>{};

        final instance = {ClassName}.fromJson(json);

        expect(instance.name, isNull);
        expect(instance.displayName, isNull);
      });

      test('handles partial data', () {
        final json = {'name': 'resources/456'};

        final instance = {ClassName}.fromJson(json);

        expect(instance.name, 'resources/456');
        expect(instance.displayName, isNull);
      });
    });

    group('toJson', () {
      test('converts all fields to JSON', () {
        const instance = {ClassName}(
          name: 'resources/123',
          displayName: 'Test Resource',
          createTime: '2024-01-01T00:00:00Z',
          updateTime: '2024-01-02T00:00:00Z',
        );

        final json = instance.toJson();

        expect(json['name'], 'resources/123');
        expect(json['displayName'], 'Test Resource');
        expect(json['createTime'], '2024-01-01T00:00:00Z');
        expect(json['updateTime'], '2024-01-02T00:00:00Z');
      });

      test('omits null values', () {
        const instance = {ClassName}(name: 'resources/123');

        final json = instance.toJson();

        expect(json['name'], 'resources/123');
        expect(json.containsKey('displayName'), false);
        expect(json.containsKey('createTime'), false);
      });
    });

    test('round-trip preserves data', () {
      const original = {ClassName}(
        name: 'resources/789',
        displayName: 'Round Trip Test',
        createTime: '2024-01-01T12:00:00Z',
        updateTime: '2024-01-01T13:00:00Z',
      );

      final json = original.toJson();
      final restored = {ClassName}.fromJson(json);

      expect(restored.name, original.name);
      expect(restored.displayName, original.displayName);
      expect(restored.createTime, original.createTime);
      expect(restored.updateTime, original.updateTime);
    });

    group('copyWith', () {
      test('creates copy with single field changed', () {
        const original = {ClassName}(
          name: 'resources/123',
          displayName: 'Original',
        );

        final copy = original.copyWith(displayName: 'Modified');

        expect(copy.name, 'resources/123');
        expect(copy.displayName, 'Modified');
      });

      test('can set field to null', () {
        const original = {ClassName}(
          name: 'resources/123',
          displayName: 'Original',
        );

        final copy = original.copyWith(displayName: null);

        expect(copy.name, 'resources/123');
        expect(copy.displayName, isNull);
      });
    });

    group('equality', () {
      test('equal instances are equal', () {
        const a = {ClassName}(name: 'resources/123', displayName: 'Test');
        const b = {ClassName}(name: 'resources/123', displayName: 'Test');

        expect(a, b);
        expect(a.hashCode, b.hashCode);
      });

      test('different instances are not equal', () {
        const a = {ClassName}(name: 'resources/123');
        const b = {ClassName}(name: 'resources/456');

        expect(a, isNot(b));
      });
    });

    test('toString includes all fields', () {
      const instance = {ClassName}(
        name: 'resources/123',
        displayName: 'Test',
      );

      final str = instance.toString();

      expect(str, contains('{ClassName}('));
      expect(str, contains('name: resources/123'));
      expect(str, contains('displayName: Test'));
    });
  });
}
